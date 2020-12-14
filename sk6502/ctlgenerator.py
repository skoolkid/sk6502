C_ANY = 0 # Any length
C_ONE = 2 # Only one
C_DEF = 4 # Up to 5
C_SAR = 8 # Up to 7 (shifts and rotates)

END = 0x60
LDA = 0xA9
LDX = 0xA2
LDY = 0xA0
BIT = 0x24
CMP = 0xC9
CPX = 0xE0
CPY = 0xC0

OPCODES = {
    0x00: (1, C_ANY, 0x00, 'BRK'),
    0x01: (2, C_ANY, 0x01, 'ORA (nn,X)'),
    0x05: (2, C_ANY, 0x02, 'ORA nn'),
    0x06: (2, C_SAR, 0x06, 'ASL nn'),
    0x08: (1, C_DEF, 0x08, 'PHP'),
    0x09: (2, C_ONE, 0x09, 'ORA #nn'),
    0x0A: (1, C_SAR, 0x0A, 'ASL A'),
    0x0D: (3, C_ANY, 0x0D, 'ORA nnnn'),
    0x0E: (3, C_SAR, 0x0E, 'ASL nnnn'),
    0x10: (2, C_ONE, 0x10, 'BPL nnnn'),
    0x11: (2, C_ANY, 0x11, 'ORA (nn),Y'),
    0x15: (2, C_ANY, 0x15, 'ORA nn,X'),
    0x16: (2, C_SAR, 0x16, 'ASL nn,X'),
    0x18: (1, C_ONE, 0x18, 'CLC'),
    0x19: (3, C_ANY, 0x19, 'ORA nnnn,Y'),
    0x1D: (3, C_ANY, 0x1D, 'ORA nnnn,X'),
    0x1E: (3, C_SAR, 0x1E, 'ASL nnnn,X'),
    0x20: (3, C_ANY, 0x20, 'JSR nnnn'),
    0x21: (2, C_ANY, 0x21, 'AND (nn,X)'),
    0x24: (2, C_ONE, BIT, 'BIT nn'),
    0x25: (2, C_ANY, 0x25, 'AND nn'),
    0x26: (2, C_SAR, 0x26, 'ROL nn'),
    0x28: (1, C_ONE, 0x28, 'PLP'),
    0x29: (2, C_ONE, 0x29, 'AND #nn'),
    0x2A: (1, C_SAR, 0x2A, 'ROL A'),
    0x2C: (3, C_ONE, BIT, 'BIT nnnn'),
    0x2D: (3, C_ANY, 0x2D, 'AND nnnn'),
    0x2E: (3, C_SAR, 0x2E, 'ROL nnnn'),
    0x30: (2, C_ONE, 0x30, 'BMI nnnn'),
    0x31: (2, C_ANY, 0x31, 'AND (nn),Y'),
    0x35: (2, C_ANY, 0x35, 'AND nn,X'),
    0x36: (2, C_SAR, 0x36, 'ROL nn,X'),
    0x38: (1, C_ONE, 0x38, 'SEC'),
    0x39: (3, C_ANY, 0x39, 'AND nnnn,Y'),
    0x3D: (3, C_ANY, 0x3D, 'AND nnnn,X'),
    0x3E: (3, C_SAR, 0x3E, 'ROL nnnn,X'),
    0x40: (1, C_ONE, END, 'RTI'),
    0x41: (2, C_ANY, 0x41, 'EOR (nn,X)'),
    0x45: (2, C_ANY, 0x45, 'EOR nn'),
    0x46: (2, C_SAR, 0x46, 'LSR nn'),
    0x48: (1, C_DEF, 0x48, 'PHA'),
    0x49: (2, C_ONE, 0x49, 'EOR #nn'),
    0x4A: (1, C_SAR, 0x4A, 'LSR A'),
    0x4C: (3, C_ONE, END, 'JMP nnnn'),
    0x4D: (3, C_ANY, 0x4D, 'EOR nnnn'),
    0x4E: (3, C_SAR, 0x4E, 'LSR nnnn'),
    0x50: (2, C_ONE, 0x50, 'BVC nnnn'),
    0x51: (2, C_ANY, 0x51, 'EOR (nn),Y'),
    0x55: (2, C_ANY, 0x55, 'EOR nn,X'),
    0x56: (2, C_SAR, 0x56, 'LSR nn,X'),
    0x58: (1, C_ONE, 0x58, 'CLI'),
    0x59: (3, C_ANY, 0x59, 'EOR nnnn,Y'),
    0x5D: (3, C_ANY, 0x5D, 'EOR nnnn,X'),
    0x5E: (3, C_SAR, 0x5E, 'LSR nnnn,X'),
    0x60: (1, C_ONE, END, 'RTS'),
    0x61: (2, C_ANY, 0x61, 'ADC (nn,X)'),
    0x65: (2, C_ANY, 0x65, 'ADC nn'),
    0x66: (2, C_SAR, 0x66, 'ROR nn'),
    0x68: (1, C_ONE, 0x68, 'PLA'),
    0x69: (2, C_ONE, 0x69, 'ADC #nn'),
    0x6A: (1, C_SAR, 0x6A, 'ROR A'),
    0x6C: (3, C_ONE, END, 'JMP (nnnn)'),
    0x6D: (3, C_ANY, 0x6D, 'ADC nnnn'),
    0x6E: (3, C_SAR, 0x6E, 'ROR nnnn'),
    0x70: (2, C_ONE, 0x70, 'BVS nnnn'),
    0x71: (2, C_ANY, 0x71, 'ADC (nn),Y'),
    0x75: (2, C_ANY, 0x75, 'ADC nn,X'),
    0x76: (2, C_SAR, 0x76, 'ROR nn,X'),
    0x78: (1, C_ONE, 0x78, 'SEI'),
    0x79: (3, C_ANY, 0x79, 'ADC nnnn,Y'),
    0x7D: (3, C_ANY, 0x7D, 'ADC nnnn,X'),
    0x7E: (3, C_SAR, 0x7E, 'ROR nnnn,X'),
    0x81: (2, C_ANY, 0x81, 'STA (nn,X)'),
    0x84: (2, C_ANY, 0x84, 'STY nn'),
    0x85: (2, C_ANY, 0x85, 'STA nn'),
    0x86: (2, C_ANY, 0x86, 'STX nn'),
    0x88: (1, C_ANY, 0x88, 'DEY'),
    0x8A: (1, C_ONE, 0x8A, 'TXA'),
    0x8C: (3, C_ANY, 0x8C, 'STY nnnn'),
    0x8D: (3, C_ANY, 0x8D, 'STA nnnn'),
    0x8E: (3, C_ANY, 0x8E, 'STX nnnn'),
    0x90: (2, C_ONE, 0x90, 'BCC nnnn'),
    0x91: (2, C_ANY, 0x91, 'STA (nn),Y'),
    0x94: (2, C_ANY, 0x94, 'STY nn,X'),
    0x95: (2, C_ANY, 0x95, 'STA nn,X'),
    0x96: (2, C_ANY, 0x96, 'STX nn,Y'),
    0x98: (1, C_ONE, 0x98, 'TYA'),
    0x99: (3, C_ANY, 0x99, 'STA nnnn,Y'),
    0x9A: (1, C_ONE, 0x9A, 'TXS'),
    0x9D: (3, C_ANY, 0x9D, 'STA nnnn,X'),
    0xA0: (2, C_ONE, LDY, 'LDY #nn'),
    0xA1: (2, C_ONE, LDA, 'LDA (nn,X)'),
    0xA2: (2, C_ONE, LDX, 'LDX #nn'),
    0xA4: (2, C_ONE, LDY, 'LDY nn'),
    0xA5: (2, C_ONE, LDA, 'LDA nn'),
    0xA6: (2, C_ONE, LDX, 'LDX nn'),
    0xA8: (1, C_ONE, 0xA8, 'TAY'),
    0xA9: (2, C_ONE, LDA, 'LDA #nn'),
    0xAA: (1, C_ONE, 0xAA, 'TAX'),
    0xAC: (3, C_ONE, LDY, 'LDY nnnn'),
    0xAD: (3, C_ONE, LDA, 'LDA nnnn'),
    0xAE: (3, C_ONE, LDX, 'LDX nnnn'),
    0xB0: (2, C_ONE, 0xB0, 'BCS nnnn'),
    0xB1: (2, C_ONE, LDA, 'LDA (nn),Y'),
    0xB4: (2, C_ONE, LDY, 'LDY nn,X'),
    0xB5: (2, C_ONE, LDA, 'LDA nn,X'),
    0xB6: (2, C_ONE, LDX, 'LDX nn,Y'),
    0xB8: (1, C_ONE, 0xB8, 'CLV'),
    0xB9: (3, C_ONE, LDA, 'LDA nnnn,Y'),
    0xBA: (1, C_ONE, 0xBA, 'TSX'),
    0xBC: (3, C_ONE, LDY, 'LDY nnnn,X'),
    0xBD: (3, C_ONE, LDA, 'LDA nnnn,X'),
    0xBE: (3, C_ONE, LDX, 'LDX nnnn,Y'),
    0xC0: (2, C_ONE, CPY, 'CPY #nn'),
    0xC1: (2, C_ONE, CMP, 'CMP (nn,X)'),
    0xC4: (2, C_ONE, CPY, 'CPY nn'),
    0xC5: (2, C_ONE, CMP, 'CMP nn'),
    0xC6: (2, C_ANY, 0xC6, 'DEC nn'),
    0xC8: (1, C_ANY, 0xC8, 'INY'),
    0xC9: (2, C_ONE, CMP, 'CMP #nn'),
    0xCA: (1, C_ANY, 0xCA, 'DEX'),
    0xCC: (3, C_ONE, CPY, 'CPY nnnn'),
    0xCD: (3, C_ONE, CMP, 'CMP nnnn'),
    0xCE: (3, C_ANY, 0xCE, 'DEC nnnn'),
    0xD0: (2, C_ONE, 0xD0, 'BNE nnnn'),
    0xD1: (2, C_ONE, CMP, 'CMP (nn),Y'),
    0xD5: (2, C_ONE, CMP, 'CMP nn,X'),
    0xD6: (2, C_ANY, 0xD6, 'DEC nn,X'),
    0xD8: (1, C_ONE, 0xD8, 'CLD'),
    0xD9: (3, C_ONE, CMP, 'CMP nnnn,Y'),
    0xDD: (3, C_ONE, CMP, 'CMP nnnn,X'),
    0xDE: (3, C_ANY, 0xDE, 'DEC nnnn,X'),
    0xE0: (2, C_ONE, CPX, 'CPX #nn'),
    0xE1: (2, C_ANY, 0xE1, 'SBC (nn,X)'),
    0xE4: (2, C_ONE, CPX, 'CPX nn'),
    0xE5: (2, C_ANY, 0xE5, 'SBC nn'),
    0xE6: (2, C_ANY, 0xE6, 'INC nn'),
    0xE8: (1, C_ANY, 0xE8, 'INX'),
    0xE9: (2, C_ONE, 0xE9, 'SBC #nn'),
    0xEA: (1, C_ANY, 0xEA, 'NOP'),
    0xEC: (3, C_ONE, CPX, 'CPX nnnn'),
    0xED: (3, C_ANY, 0xED, 'SBC nnnn'),
    0xEE: (3, C_ANY, 0xEE, 'INC nnnn'),
    0xF0: (2, C_ONE, 0xF0, 'BEQ nnnn'),
    0xF1: (2, C_ANY, 0xF1, 'SBC (nn),Y'),
    0xF5: (2, C_ANY, 0xF5, 'SBC nn,X'),
    0xF6: (2, C_ANY, 0xF6, 'INC nn,X'),
    0xF8: (1, C_ONE, 0xF8, 'SED'),
    0xF9: (3, C_ANY, 0xF9, 'SBC nnnn,Y'),
    0xFD: (3, C_ANY, 0xFD, 'SBC nnnn,X'),
    0xFE: (3, C_ANY, 0xFE, 'INC nnnn,X')
}

OP_SIZES = {
    0x00: 2, 0x03: 2, 0x04: 2, 0x07: 2, 0x0B: 2, 0x0C: 3, 0x0F: 3,
    0x11: 2, 0x13: 2, 0x14: 2, 0x17: 2, 0x1B: 3, 0x1C: 3, 0x1F: 3,
    0x80: 2, 0x82: 2, 0x83: 2, 0x87: 2, 0x89: 2, 0x8B: 2, 0x8F: 3,
    0x93: 2, 0x94: 2, 0x97: 2, 0x9B: 3, 0x9C: 3, 0x9E: 3, 0x9F: 3
}

def _byte(snapshot, addr, size):
    op_id = 0
    for i in range(addr, addr + size):
        op_id = 256 * op_id + snapshot[i]
    operation = '.BYTE ' + ','.join(str(v) for v in snapshot[addr:addr + size])
    return size, 1, op_id, operation

def _opcode(snapshot, addr, value):
    try:
        size, max_count, op_id, operation = OPCODES[value]
    except KeyError:
        size = OP_SIZES.get(value & 0x9F, 1)
        return _byte(snapshot, addr, min(size, 65536 - addr))
    if addr + size < 65537:
        return size, max_count, op_id, operation
    return _byte(snapshot, addr, 65536 - addr)

def _decode(snapshot, start, end):
    addr = start
    while addr < end:
        value = snapshot[addr]
        size, max_count, op_id, operation = _opcode(snapshot, addr, value)
        yield (addr, size, max_count, op_id, operation)
        addr += size

def _check_text(t_blocks, t_start, t_end, text, min_length, words):
    if len(text) >= min_length:
        if words:
            t_lower = text.lower()
            for word in words:
                if word in t_lower:
                    break
            else:
                return
        t_blocks.append((t_start, t_end))

def _get_text_blocks(snapshot, start, end, config, data=True):
    if data:
        min_length = config.text_min_length_data
    else:
        min_length = config.text_min_length_code
    t_blocks = []
    if end - start >= min_length:
        text = ''
        for address in range(start, end):
            char = chr(snapshot[address])
            if char in config.text_chars:
                if not text:
                    t_start = address
                text += char
            elif text:
                _check_text(t_blocks, t_start, address, text, min_length, config.words)
                text = ''
        if text:
            _check_text(t_blocks, t_start, end, text, min_length, config.words)
    return t_blocks

def _catch_data(ctls, ctl_addr, count, max_count, addr, op_bytes):
    if count >= max_count > 0:
        if not ctls or ctls[-1][1] != 'b':
            ctls.append((ctl_addr, 'b'))
        return addr
    return ctl_addr

def _get_operation(operations, snapshot, addr):
    if addr not in operations:
        operations[addr] = next(_decode(snapshot, addr, addr + 1))[1::3]
    return operations[addr]

def _generate_ctls_without_code_map(snapshot, start, end, config):
    operations = {}
    ctls = []
    ctl_addr = start
    prev_max_count, prev_op_id, prev_op, prev_op_bytes = 0, None, None, ()
    count = 1
    for addr, size, max_count, op_id, operation in _decode(snapshot, start, end):
        operations[addr] = (size, operation)
        op_bytes = snapshot[addr:addr + size]
        if op_id == END:
            # Catch data-like sequences that precede a terminal instruction
            ctl_addr = _catch_data(ctls, ctl_addr, count, prev_max_count, addr, prev_op_bytes)
            ctls.append((ctl_addr, 'c'))
            ctl_addr = addr + size
            prev_max_count, prev_op_id, prev_op, prev_op_bytes = 0, None, None, ()
            count = 1
            continue
        if op_id == prev_op_id:
            count += 1
        elif prev_op:
            ctl_addr = _catch_data(ctls, ctl_addr, count, prev_max_count, addr, prev_op_bytes)
            count = 1
        prev_max_count, prev_op_id, prev_op, prev_op_bytes = max_count, op_id, operation, op_bytes

    if not ctls:
        ctls.append((ctl_addr, 'b'))
    ctls.append((end, 'i'))

    ctls = dict(ctls)

    # Join two adjacent blocks if the first one is code and branches to the
    # second
    edges = sorted(ctls)
    while 1:
        done = True
        while len(edges) > 1:
            addr, end = edges[0], edges[1]
            if ctls[addr] == 'c':
                while addr < end:
                    size, operation = _get_operation(operations, snapshot, addr)
                    if operation.startswith(('BC', 'BE', 'BM', 'BN', 'BP', 'BV')):
                        operand = snapshot[addr + 1]
                        branch_addr = addr + 2 + (operand if operand < 128 else operand - 256)
                        if branch_addr == end:
                            del ctls[end], edges[1]
                            done = False
                            break
                    addr += size
                if not done:
                    break
                del edges[0]
            else:
                del edges[0]
        if done:
            break

    # Look for text
    edges = sorted(ctls)
    for i in range(len(edges) - 1):
        start, end = edges[i], edges[i + 1]
        ctl = ctls[start]
        text_blocks = _get_text_blocks(snapshot, start, end, config, ctl == 'b')
        if text_blocks:
            ctls[start] = 'b'
            for t_start, t_end in text_blocks:
                ctls[t_start] = 't'
                if t_end < end:
                    ctls[t_end] = 'b'
            if t_end < end:
                addr = t_end
                while addr < end:
                    addr += _get_operation(operations, snapshot, addr)[0]
                ctls[t_end] = ctl if addr == end else 'b'

    return ctls

def generate_ctls(snapshot, start, end, code_map, config):
    return _generate_ctls_without_code_map(snapshot, start, end, config)
