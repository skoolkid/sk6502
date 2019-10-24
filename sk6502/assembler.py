from functools import partial

from skoolkit.components import get_component

OP_EVALUATOR = get_component('OperandEvaluator')

def assemble(operation, address):
    try:
        return _assemble(operation, address) or ()
    except:
        return ()

def get_size(operation, address):
    return len(assemble(operation, address))

def _assemble(operation, address):
    if operation.upper().startswith(('.BYTE ', '.FILL ', '.WORD ')):
        directive = operation.upper()[:5]
        items = OP_EVALUATOR.split_operands(operation[6:].strip())
        if directive == '.BYTE':
            return _assemble_byte(items)
        if  directive == '.WORD':
            return _assemble_word(items)
        return _assemble_fill(items)

    parts = operation.split(None, 1)
    a = MNEMONICS[parts[0].upper()]
    if isinstance(a, tuple):
        if len(parts) == 1:
            return a
        raise ValueError
    return a(address, ','.join(parts[1:]))

def _assemble_byte(items):
    data = []
    for item in items:
        try:
            data.extend(OP_EVALUATOR.eval_string(item))
        except ValueError:
            data.append(_parse_byte(item))
    return tuple(data)

def _assemble_word(items):
    data = ()
    for w in items:
        data += _parse_word(w)
    return data

def _assemble_fill(operands):
    span = _parse_word(operands[0])
    if len(operands) > 1:
        value = _parse_byte(operands[1])
    else:
        value = 0
    return (value,) * (span[0] + 256 * span[1])

def _parse_byte(text):
    value = OP_EVALUATOR.eval_int(text)
    if abs(value) < 256:
        return value % 256
    raise ValueError

def _parse_word(operand):
    value = OP_EVALUATOR.eval_int(operand)
    if 0 <= value < 65536:
        return (value % 256, value // 256)
    raise ValueError

def _assemble_address(base_code, operand, suffix=None, absolute=True):
    if suffix and operand.endswith(suffix):
        address = operand[:-len(suffix)]
        if len(address) > 3:
            if not absolute:
                raise ValueError
            return (base_code + 24, *_parse_word(address))
        return (base_code + 16, _parse_byte(address))
    if len(operand) > 3:
        return (base_code + 8, *_parse_word(operand))
    return (base_code, _parse_byte(operand))

def _assemble_a_op(base_code, immediate, address, operand=None):
    if operand.startswith('#'):
        if immediate:
            return (base_code + 8, _parse_byte(operand[1:]))
        raise ValueError
    if operand.startswith('(') and operand.endswith(',X)'):
        return (base_code, _parse_byte(operand[1:-3]))
    if operand.startswith('(') and operand.endswith('),Y'):
        return (base_code + 16, _parse_byte(operand[1:-3]))
    if operand.endswith(',Y'):
        return (base_code + 24, *_parse_word(operand[:-2]))
    return _assemble_address(base_code + 4, operand, ',X')

def _assemble_ld(base_code, suffix, address, operand=None):
    if operand.startswith('#'):
        return (base_code, _parse_byte(operand[1:]))
    return _assemble_address(base_code + 4, operand, suffix)

def _assemble_cp(base_code, address, operand=None):
    return _assemble_ld(base_code, None, address, operand)

def _assemble_shift(base_code, address, operand=None):
    if operand == 'A':
        return (base_code + 4,)
    return _assemble_address(base_code, operand, ',X')

def _assemble_dec_inc(base_code, address, operand=None):
    return _assemble_address(base_code, operand, ',X')

def _assemble_st(base_code, suffix, address, operand=None):
    return _assemble_address(base_code, operand, suffix, False)

def _assemble_bit(address, operand=None):
    return _assemble_address(36, operand)

def _assemble_branch(code, address, operand=None):
    offset = OP_EVALUATOR.eval_int(operand) - address - 2
    if -128 <= offset < 128:
        return (code, offset & 255)
    raise ValueError

def _assemble_jump(base_code, address, operand=None):
    if operand.startswith('(') and operand.endswith(')'):
        return (base_code + 32, *_parse_word(operand[1:-1]))
    return (base_code, *_parse_word(operand))

MNEMONICS = {
    'ADC': partial(_assemble_a_op, 97, True),
    'AND': partial(_assemble_a_op, 33, True),
    'ASL': partial(_assemble_shift, 6),
    'BCC': partial(_assemble_branch, 144),
    'BCS': partial(_assemble_branch, 176),
    'BEQ': partial(_assemble_branch, 240),
    'BIT': _assemble_bit,
    'BMI': partial(_assemble_branch, 48),
    'BNE': partial(_assemble_branch, 208),
    'BPL': partial(_assemble_branch, 16),
    'BRK': (0,),
    'BVC': partial(_assemble_branch, 80),
    'BVS': partial(_assemble_branch, 112),
    'CLC': (24,),
    'CLD': (216,),
    'CLI': (88,),
    'CLV': (184,),
    'CMP': partial(_assemble_a_op, 193, True),
    'CPX': partial(_assemble_cp, 224),
    'CPY': partial(_assemble_cp, 192),
    'DEC': partial(_assemble_dec_inc, 198),
    'DEX': (202,),
    'DEY': (136,),
    'EOR': partial(_assemble_a_op, 65, True),
    'INC': partial(_assemble_dec_inc, 230),
    'INX': (232,),
    'INY': (200,),
    'JMP': partial(_assemble_jump, 76),
    'JSR': partial(_assemble_jump, 32),
    'LDA': partial(_assemble_a_op, 161, True),
    'LDX': partial(_assemble_ld, 162, ',Y'),
    'LDY': partial(_assemble_ld, 160, ',X'),
    'LSR': partial(_assemble_shift, 70),
    'NOP': (234,),
    'ORA': partial(_assemble_a_op, 1, True),
    'PHA': (72,),
    'PHP': (8,),
    'PLA': (104,),
    'PLP': (40,),
    'ROL': partial(_assemble_shift, 38),
    'ROR': partial(_assemble_shift, 102),
    'RTI': (64,),
    'RTS': (96,),
    'SBC': partial(_assemble_a_op, 225, True),
    'SEC': (56,),
    'SED': (248,),
    'SEI': (120,),
    'STA': partial(_assemble_a_op, 129, False),
    'STX': partial(_assemble_st, 134, ',Y'),
    'STY': partial(_assemble_st, 132, ',X'),
    'TAX': (170,),
    'TAY': (168,),
    'TSX': (186,),
    'TXA': (138,),
    'TXS': (154,),
    'TYA': (152,)
}
