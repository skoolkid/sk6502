import skoolkit.disassembler

class OperandFormatter(skoolkit.disassembler.OperandFormatter):
    def is_char(self, value):
        return 32 <= value < 127

class Disassembler:
    def __init__(self, snapshot, config):
        self.snapshot = snapshot
        self.defb_size = config.defb_size
        self.defm_size = config.defm_size
        self.defw_size = config.defw_size
        self.byte = '.BYTE '
        self.fill = '.FILL '
        self.word = '.WORD '
        if config.asm_lower:
            self.ops = {k: (v[0], v[1].lower()) for k, v in self.ops.items()}
            self.byte = self.byte.lower()
            self.fill = self.fill.lower()
            self.word = self.word.lower()
        self.op_formatter = OperandFormatter(config)

    def disassemble(self, start, end, base):
        instructions = []
        address = start
        while address < end:
            byte = self.snapshot[address]
            decoder, template = self.ops[byte]
            if template == '':
                operation, length = decoder(self, address, base)
            else:
                operation, length = decoder(self, template, address, base)
            if address + length <= 65536:
                instructions.append((address, operation, self.snapshot[address:address + length]))
            else:
                instructions.append(self._byte_line(address, self.snapshot[address:65536]))
            address += length
        return instructions

    def _byte_dir(self, data, sublengths=((0, 'n'),)):
        items = []
        i = 0
        for size, base in sublengths:
            if not size:
                size = len(data)
            if base == 'c' and size > 1:
                items.append(self._get_message(data[i:i + size]))
            else:
                items.append(','.join(self.op_formatter.format_byte(b, base) for b in data[i:i + size]))
            i += size
        return self.byte +  ','.join(items)

    def _byte_line(self, address, data, sublengths=((0, 'n'),)):
        return (address, self._byte_dir(data, sublengths), data)

    def _byte_lines(self, start, end, sublengths, max_size):
        if sublengths[0][0] or end - start <= max_size:
            return [self._byte_line(start, self.snapshot[start:end], sublengths)]
        instructions = []
        data = []
        for i in range(start, end):
            data.append(self.snapshot[i])
            if len(data) == max_size:
                instructions.append(self._byte_line(i - len(data) + 1, data, sublengths))
                data = []
        if data:
            instructions.append(self._byte_line(i - len(data) + 1, data, sublengths))
        return instructions

    def defb_range(self, start, end, sublengths):
        return self._byte_lines(start, end, sublengths, self.defb_size)

    def _get_message(self, data):
        msg = '"'
        for b in data:
            char = chr(b)
            if char in '\\"':
                char = '\\' + char
            msg += char
        return msg + '"'

    def defm_range(self, start, end, sublengths):
        return self._byte_lines(start, end, sublengths, self.defm_size)

    def _defw_items(self, data, sublengths):
        items = []
        i = 0
        for length, base in sublengths:
            for j in range(i, i + length, 2):
                word = data[j] + 256 * data[j + 1]
                items.append(self.op_formatter.format_word(word, base))
            i += length
        return ','.join(items)

    def defw_range(self, start, end, sublengths):
        if sublengths[0][0]:
            step = end - start
        else:
            step = self.defw_size * 2
            sublengths = ((step, sublengths[0][1]),)
        instructions = []
        for address in range(start, end, step):
            if address + step > end:
                step = end - address
                sublengths = ((end - address, sublengths[0][1]),)
            data = self.snapshot[address:address + step]
            word_dir = self.word + self._defw_items(data, sublengths)
            instructions.append((address, word_dir, data))
        return instructions

    def defs_range(self, start, end, sublengths):
        data = self.snapshot[start:end]
        values = set(data)
        if len(values) > 1:
            return self.defb_range(start, end, ((0, 'n'),))
        value = values.pop()
        size, base = sublengths[0]
        items = [self.op_formatter.format_byte(size or end - start, base)]
        if len(sublengths) > 1:
            items.append(self.op_formatter.format_byte(value, sublengths[1][1]))
        elif value:
            items.append(self.op_formatter.format_byte(value, 'n'))
        return [(start, self.fill + ','.join(items), data)]

    def defb(self, a, length):
        return self._byte_dir(self.snapshot[a:a + length]), length

    def no_arg(self, template, a, base):
        return template, 1

    def byte_arg(self, template, a, base):
        return template.format(self.op_formatter.format_byte(self.snapshot[(a + 1) & 65535], base)), 2

    def word_arg(self, template, a, base):
        return template.format(self.op_formatter.format_word(self.snapshot[(a + 1) & 65535] + 256 * self.snapshot[(a + 2) & 65535], base)), 3

    def branch_arg(self, template, a, base):
        offset = self.snapshot[(a + 1) & 65535]
        if offset < 128:
            address = a + 2 + offset
        else:
            address = a + offset - 254
        if 0 <= address < 65536:
            return template.format(self.op_formatter.format_word(address, base)), 2
        return self.defb(a, 2)

    def defb1(self, a, base):
        return self.defb(a, 1)

    def defb2(self, a, base):
        return self.defb(a, 2)

    def defb3(self, a, base):
        return self.defb(a, 3)

    def crash(self, a, base):
        return self.defb(a, 1)

    ops = {
        0x00: (no_arg, 'BRK'),
        0x01: (byte_arg, 'ORA ({},X)'),
        0x02: (crash, ''),
        0x03: (defb2, ''),
        0x04: (defb2, ''),
        0x05: (byte_arg, 'ORA {}'),
        0x06: (byte_arg, 'ASL {}'),
        0x07: (defb2, ''),
        0x08: (no_arg, 'PHP'),
        0x09: (byte_arg, 'ORA #{}'),
        0x0A: (no_arg, 'ASL A'),
        0x0B: (defb2, ''),
        0x0C: (defb3, ''),
        0x0D: (word_arg, 'ORA {}'),
        0x0E: (word_arg, 'ASL {}'),
        0x0F: (defb3, ''),
        0x10: (branch_arg, 'BPL {}'),
        0x11: (byte_arg, 'ORA ({}),Y'),
        0x12: (crash, ''),
        0x13: (defb2, ''),
        0x14: (defb2, ''),
        0x15: (byte_arg, 'ORA {},X'),
        0x16: (byte_arg, 'ASL {},X'),
        0x17: (defb2, ''),
        0x18: (no_arg, 'CLC'),
        0x19: (word_arg, 'ORA {},Y'),
        0x1A: (defb1, ''),
        0x1B: (defb3, ''),
        0x1C: (defb3, ''),
        0x1D: (word_arg, 'ORA {},X'),
        0x1E: (word_arg, 'ASL {},X'),
        0x1F: (defb3, ''),
        0x20: (word_arg, 'JSR {}'),
        0x21: (byte_arg, 'AND ({},X)'),
        0x22: (crash, ''),
        0x23: (defb2, ''),
        0x24: (byte_arg, 'BIT {}'),
        0x25: (byte_arg, 'AND {}'),
        0x26: (byte_arg, 'ROL {}'),
        0x27: (defb2, ''),
        0x28: (no_arg, 'PLP'),
        0x29: (byte_arg, 'AND #{}'),
        0x2A: (no_arg, 'ROL A'),
        0x2B: (defb2, ''),
        0x2C: (word_arg, 'BIT {}'),
        0x2D: (word_arg, 'AND {}'),
        0x2E: (word_arg, 'ROL {}'),
        0x2F: (defb3, ''),
        0x30: (branch_arg, 'BMI {}'),
        0x31: (defb2, ''),
        0x32: (crash, ''),
        0x33: (defb2, ''),
        0x34: (defb2, ''),
        0x35: (byte_arg, 'AND {},X'),
        0x36: (byte_arg, 'ROL {},X'),
        0x37: (defb2, ''),
        0x38: (no_arg, 'SEC'),
        0x39: (word_arg, 'AND {},Y'),
        0x3A: (defb1, ''),
        0x3B: (defb3, ''),
        0x3C: (defb3, ''),
        0x3D: (word_arg, 'AND {},X'),
        0x3E: (word_arg, 'ROL {},X'),
        0x3F: (defb3, ''),
        0x40: (no_arg, 'RTI'),
        0x41: (byte_arg, 'EOR ({},X)'),
        0x42: (crash, ''),
        0x43: (defb2, ''),
        0x44: (defb2, ''),
        0x45: (byte_arg, 'EOR {}'),
        0x46: (byte_arg, 'LSR {}'),
        0x47: (defb2, ''),
        0x48: (no_arg, 'PHA'),
        0x49: (byte_arg, 'EOR #{}'),
        0x4A: (no_arg, 'LSR A'),
        0x4B: (defb2, ''),
        0x4C: (word_arg, 'JMP {}'),
        0x4D: (word_arg, 'EOR {}'),
        0x4E: (word_arg, 'LSR {}'),
        0x4F: (defb3, ''),
        0x50: (branch_arg, 'BVC {}'),
        0x51: (byte_arg, 'EOR ({}),Y'),
        0x52: (crash, ''),
        0x53: (defb2, ''),
        0x54: (defb2, ''),
        0x55: (byte_arg, 'EOR {},X'),
        0x56: (byte_arg, 'LSR {},X'),
        0x57: (defb2, ''),
        0x58: (no_arg, 'CLI'),
        0x59: (word_arg, 'EOR {},Y'),
        0x5A: (defb1, ''),
        0x5B: (defb3, ''),
        0x5C: (defb3, ''),
        0x5D: (word_arg, 'EOR {},X'),
        0x5E: (word_arg, 'LSR {},X'),
        0x5F: (defb3, ''),
        0x60: (no_arg, 'RTS'),
        0x61: (byte_arg, 'ADC ({},X)'),
        0x62: (crash, ''),
        0x63: (defb2, ''),
        0x64: (defb2, ''),
        0x65: (byte_arg, 'ADC {}'),
        0x66: (byte_arg, 'ROR {}'),
        0x67: (defb2, ''),
        0x68: (no_arg, 'PLA'),
        0x69: (byte_arg, 'ADC #{}'),
        0x6A: (no_arg, 'ROR A'),
        0x6B: (defb2, ''),
        0x6C: (word_arg, 'JMP ({})'),
        0x6D: (word_arg, 'ADC {}'),
        0x6E: (word_arg, 'ROR {}'),
        0x6F: (defb3, ''),
        0x70: (branch_arg, 'BVS {}'),
        0x71: (byte_arg, 'ADC ({}),Y'),
        0x72: (crash, ''),
        0x73: (defb2, ''),
        0x74: (defb2, ''),
        0x75: (byte_arg, 'ADC {},X'),
        0x76: (byte_arg, 'ROR {},X'),
        0x77: (defb2, ''),
        0x78: (no_arg, 'SEI'),
        0x79: (word_arg, 'ADC {},Y'),
        0x7A: (defb1, ''),
        0x7B: (defb3, ''),
        0x7C: (defb3, ''),
        0x7D: (word_arg, 'ADC {},X'),
        0x7E: (word_arg, 'ROR {},X'),
        0x7F: (defb3, ''),
        0x80: (defb2, ''),
        0x81: (byte_arg, 'STA ({},X)'),
        0x82: (defb2, ''),
        0x83: (defb2, ''),
        0x84: (byte_arg, 'STY {}'),
        0x85: (byte_arg, 'STA {}'),
        0x86: (byte_arg, 'STX {}'),
        0x87: (defb2, ''),
        0x88: (no_arg, 'DEY'),
        0x89: (defb2, ''),
        0x8A: (no_arg, 'TXA'),
        0x8B: (defb2, ''),
        0x8C: (word_arg, 'STY {}'),
        0x8D: (word_arg, 'STA {}'),
        0x8E: (word_arg, 'STX {}'),
        0x8F: (defb3, ''),
        0x90: (branch_arg, 'BCC {}'),
        0x91: (byte_arg, 'STA ({}),Y'),
        0x92: (crash, ''),
        0x93: (defb2, ''),
        0x94: (byte_arg, 'STY {},X'),
        0x95: (byte_arg, 'STA {},X'),
        0x96: (byte_arg, 'STX {},Y'),
        0x97: (defb2, ''),
        0x98: (no_arg, 'TYA'),
        0x99: (word_arg, 'STA {},Y'),
        0x9A: (no_arg, 'TXS'),
        0x9B: (defb3, ''),
        0x9C: (defb3, ''),
        0x9D: (word_arg, 'STA {},X'),
        0x9E: (defb3, ''),
        0x9F: (defb3, ''),
        0xA0: (byte_arg, 'LDY #{}'),
        0xA1: (byte_arg, 'LDA ({},X)'),
        0xA2: (byte_arg, 'LDX #{}'),
        0xA3: (defb2, ''),
        0xA4: (byte_arg, 'LDY {}'),
        0xA5: (byte_arg, 'LDA {}'),
        0xA6: (byte_arg, 'LDX {}'),
        0xA7: (defb2, ''),
        0xA8: (no_arg, 'TAY'),
        0xA9: (byte_arg, 'LDA #{}'),
        0xAA: (no_arg, 'TAX'),
        0xAB: (defb2, ''),
        0xAC: (word_arg, 'LDY {}'),
        0xAD: (word_arg, 'LDA {}'),
        0xAE: (word_arg, 'LDX {}'),
        0xAF: (defb3, ''),
        0xB0: (branch_arg, 'BCS {}'),
        0xB1: (byte_arg, 'LDA ({}),Y'),
        0xB2: (crash, ''),
        0xB3: (defb2, ''),
        0xB4: (byte_arg, 'LDY {},X'),
        0xB5: (byte_arg, 'LDA {},X'),
        0xB6: (byte_arg, 'LDX {},Y'),
        0xB7: (defb2, ''),
        0xB8: (no_arg, 'CLV'),
        0xB9: (word_arg, 'LDA {},Y'),
        0xBA: (no_arg, 'TSX'),
        0xBB: (defb3, ''),
        0xBC: (word_arg, 'LDY {},X'),
        0xBD: (word_arg, 'LDA {},X'),
        0xBE: (word_arg, 'LDX {},Y'),
        0xBF: (defb3, ''),
        0xC0: (byte_arg, 'CPY #{}'),
        0xC1: (byte_arg, 'CMP ({},X)'),
        0xC2: (defb2, ''),
        0xC3: (defb2, ''),
        0xC4: (byte_arg, 'CPY {}'),
        0xC5: (byte_arg, 'CMP {}'),
        0xC6: (byte_arg, 'DEC {}'),
        0xC7: (defb2, ''),
        0xC8: (no_arg, 'INY'),
        0xC9: (byte_arg, 'CMP #{}'),
        0xCA: (no_arg, 'DEX'),
        0xCB: (defb2, ''),
        0xCC: (word_arg, 'CPY {}'),
        0xCD: (word_arg, 'CMP {}'),
        0xCE: (word_arg, 'DEC {}'),
        0xCF: (defb3, ''),
        0xD0: (branch_arg, 'BNE {}'),
        0xD1: (byte_arg, 'CMP ({}),Y'),
        0xD2: (crash, ''),
        0xD3: (defb2, ''),
        0xD4: (defb2, ''),
        0xD5: (byte_arg, 'CMP {},X'),
        0xD6: (byte_arg, 'DEC {},X'),
        0xD7: (defb2, ''),
        0xD8: (no_arg, 'CLD'),
        0xD9: (word_arg, 'CMP {},Y'),
        0xDA: (defb1, ''),
        0xDB: (defb3, ''),
        0xDC: (defb3, ''),
        0xDD: (word_arg, 'CMP {},X'),
        0xDE: (word_arg, 'DEC {},X'),
        0xDF: (defb3, ''),
        0xE0: (byte_arg, 'CPX #{}'),
        0xE1: (byte_arg, 'SBC ({},X)'),
        0xE2: (defb2, ''),
        0xE3: (defb2, ''),
        0xE4: (byte_arg, 'CPX {}'),
        0xE5: (byte_arg, 'SBC {}'),
        0xE6: (byte_arg, 'INC {}'),
        0xE7: (defb2, ''),
        0xE8: (no_arg, 'INX'),
        0xE9: (byte_arg, 'SBC #{}'),
        0xEA: (no_arg, 'NOP'),
        0xEB: (defb2, ''),
        0xEC: (word_arg, 'CPX {}'),
        0xED: (word_arg, 'SBC {}'),
        0xEE: (word_arg, 'INC {}'),
        0xEF: (defb3, ''),
        0xF0: (branch_arg, 'BEQ {}'),
        0xF1: (byte_arg, 'SBC ({}),Y'),
        0xF2: (crash, ''),
        0xF3: (defb2, ''),
        0xF4: (defb2, ''),
        0xF5: (byte_arg, 'SBC {},X'),
        0xF6: (byte_arg, 'INC {},X'),
        0xF7: (defb2, ''),
        0xF8: (no_arg, 'SED'),
        0xF9: (word_arg, 'SBC {},Y'),
        0xFA: (defb1, ''),
        0xFB: (defb3, ''),
        0xFC: (defb3, ''),
        0xFD: (word_arg, 'SBC {},X'),
        0xFE: (word_arg, 'INC {},X'),
        0xFF: (defb3, '')
    }
