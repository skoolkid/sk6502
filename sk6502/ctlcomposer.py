from skoolkit import SkoolParsingError
from skoolkit.components import get_component

FORMAT_NO_BASE = {
    'b': 'b{}',
    'c': 'c{}',
    'd': '{}',
    'h': '{}',
    'm': 'm{}'
}

FORMAT_PRESERVE_BASE = {
    'b': 'b{}',
    'c': 'c{}',
    'd': 'd{}',
    'h': 'h{}',
    'm': 'm{}'
}

SUBCTLS = {
    '.BYTE': 'B',
    '.FILL': 'S',
    '.WORD': 'W'
}

def _get_base(item, preserve_base=True):
    if item.startswith('%'):
        return 'b'
    if item.startswith('"'):
        return 'c'
    if item.startswith('$') and preserve_base:
        return 'h'
    if item.startswith('-'):
        return 'm'
    return 'd'

class ControlDirectiveComposer:
    def __init__(self, preserve_base):
        self.preserve_base = preserve_base
        self.op_evaluator = get_component('OperandEvaluator')

    def compose(self, operation):
        ctl = SUBCTLS.get(operation.upper()[:5], 'C')
        if ctl == 'C':
            length, sublengths = self._get_operand_base(operation), None
        else:
            length, sublengths = self._get_length(ctl, operation)
        return (ctl, length, sublengths)

    def _parse_string(self, item):
        try:
            return self.op_evaluator.eval_string(item)
        except ValueError:
            if item.startswith('"') and not item.endswith('"'):
                try:
                    return [self.op_evaluator.eval_int(item)]
                except ValueError:
                    return

    def _get_operand_base(self, operation):
        elements = operation.split(None, 1)
        if len(elements) < 2:
            return ''
        if self.preserve_base:
            base_fmt = {'b': 'b', 'c': 'c', 'd': 'd', 'h': 'h', 'm': 'm'}
        else:
            base_fmt = {'b': 'b', 'c': 'c', 'd': 'n', 'h': 'n', 'm': 'm'}
        operand = elements[1]
        base = ''
        if operand.startswith(('#', '(')):
            num = operand[1:]
        else:
            num = operand
        if num.startswith(('"', '%', '$', '-', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')):
            base = base_fmt[_get_base(num)]
        if base == 'n':
            return ''
        return base

    def _get_length(self, ctl, operation):
        if self.preserve_base:
            fmt = FORMAT_PRESERVE_BASE
        else:
            fmt = FORMAT_NO_BASE
        if ctl == 'B':
            return self._get_defb_length(operation, fmt)
        if ctl == 'S':
            return self._get_defs_length(operation, fmt)
        return self._get_defw_length(operation, fmt)

    def _get_defb_length(self, operation, byte_fmt):
        items = self.op_evaluator.split_operands(operation[5:])
        full_length = 0
        lengths = []
        length = 0
        prev_base = None
        for item in items + ['""']:
            c_data = self._parse_string(item)
            if c_data is not None:
                if length:
                    lengths.append(byte_fmt[prev_base].format(length))
                    full_length += length
                    prev_base = None
                length = len(c_data)
                if length:
                    lengths.append('c{}'.format(length))
                    full_length += length
                    length = 0
            else:
                cur_base = _get_base(item, self.preserve_base)
                if cur_base == 'c':
                    cur_base = 'd'
                if prev_base != cur_base and length:
                    lengths.append(byte_fmt[prev_base].format(length))
                    full_length += length
                    length = 0
                length += 1
                prev_base = cur_base
        return full_length, ':'.join(lengths)

    def _get_defw_length(self, operation, word_fmt):
        full_length = 0
        lengths = []
        length = 0
        prev_base = None
        for item in self.op_evaluator.split_operands(operation[5:]):
            cur_base = _get_base(item, self.preserve_base)
            if prev_base != cur_base and length:
                lengths.append(word_fmt[prev_base].format(length))
                full_length += length
                length = 0
            length += 2
            prev_base = cur_base
        lengths.append(word_fmt[prev_base].format(length))
        full_length += length
        return full_length, ':'.join(lengths)

    def _get_defs_length(self, operation, fmt):
        items = self.op_evaluator.split_operands(operation[5:])[:2]
        try:
            size = self.op_evaluator.eval_int(items[0])
        except ValueError:
            raise SkoolParsingError("Invalid integer '{}': {}".format(items[0], operation))
        size_base = _get_base(items[0], self.preserve_base)
        size_fmt = fmt[size_base].format(items[0])
        if len(items) == 1:
            return size, size_fmt
        value_base = _get_base(items[1], self.preserve_base)
        if value_base in 'dh' and not self.preserve_base:
            value_base = 'n'
        return size, '{}:{}'.format(size_fmt, value_base)
