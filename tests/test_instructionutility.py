from os.path import abspath, dirname
import os
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)

SK6502_HOME = abspath(dirname(dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502 import InstructionUtility

class Entry:
    def __init__(self, instructions, ctl=None):
        self.instructions = instructions
        self.ctl = ctl

    def __repr__(self):
        return "Entry('{}', {})".format(self.ctl, self.instructions)

class Instruction:
    def __init__(self, address, operation, keep=None, nowarn=None, sub=False):
        self.address = address
        self.operation = operation
        self.keep = keep
        self.nowarn = nowarn
        self.sub = sub

    def __repr__(self):
        return("Instruction(0x{:04X}, '{}', {})".format(self.address, self.operation, self.keep))

class InstructionUtilityTest(unittest.TestCase):
    def _test_convert(self, base, case):
        specs = (
            (0, 'BRK', 'brk'),
            (1, '.BYTE $0A', '.byte $0a'),
            (2, '.FILL $0B', '.fill $0b'),
            (4, '.TEXT "A"', '.text "A"'),
            (5, '.WORD $0A0B', '.word $0a0b'),
            (7, r'.BYTE "\"b"', r'.byte "\"b"')
        )
        instructions = [Instruction(s[0], s[case or 1]) for s in specs]
        exp_operations = [s[case + 1 if case < 2 else 1] for s in specs]
        entries = [Entry(instructions, 'c')]
        InstructionUtility().convert(entries, base, case)
        operations = [i.operation for i in entries[0].instructions]
        self.assertEqual(exp_operations, operations)

    def test_calculate_references(self):
        instructions = (
            Instruction(0x8000, 'BCC $8002'),
            Instruction(0x8002, 'BCS $8004'),
            Instruction(0x8004, 'BEQ $8006'),
            Instruction(0x8006, 'BMI $8008'),
            Instruction(0x8008, 'BNE $800A'),
            Instruction(0x800a, 'BPL $800C'),
            Instruction(0x800c, 'BVC $800E'),
            Instruction(0x800e, 'BVS $8010'),
            Instruction(0x8010, 'JMP $8013'),
            Instruction(0x8013, 'JSR $8016'),
            Instruction(0x8016, '.WORD $8000')
        )
        entries = []
        exp_references = {}
        exp_referrers = {}
        for i, instruction in enumerate(instructions):
            entries.append(Entry([instruction], 'c'))
            ref_instruction = instructions[i + 1] if i + 1 < len(instructions) else instructions[0]
            exp_references[instruction] = (ref_instruction, instruction.operation[-5:], True)
            exp_referrers[ref_instruction] = {entries[-1]}

        references, referrers = InstructionUtility().calculate_references(tuple(entries), ())
        self.assertEqual(len(references), len(exp_references))
        for instruction, exp_reference in exp_references.items():
            self.assertEqual(exp_reference, references.get(instruction))
        self.assertEqual(len(referrers), len(exp_referrers))
        for instruction, exp_referrers in exp_referrers.items():
            self.assertEqual(exp_referrers, referrers.get(instruction))

    def test_set_byte_values(self):
        instructions = (
            (Instruction(0, 'BRK'), (0, 0, 2)),
            (Instruction(0, '.BYTE $01'), (0, 1, 1)),
            (Instruction(0, '.FILL $10,$01'), (0, 1, 1)),
            (Instruction(0, '.TEXT "a"'), (0, 1, 1)),
            (Instruction(0, '.WORD $0001'), (0, 1, 1))
        )
        iu = InstructionUtility()
        for instruction, exp_values in instructions:
            values = [iu.set_byte_values(instruction, assemble) for assemble in range(3)]
            self.assertEqual((instruction.operation, *exp_values), (instruction.operation, *values))

    def test_convert(self):
        self._test_convert(0, 0)

    def test_convert_to_lower_case(self):
        self._test_convert(0, 1)

    def test_convert_to_upper_case(self):
        self._test_convert(0, 2)

    def test_convert_to_decimal(self):
        self._test_convert(10, 0)

    def test_convert_to_hexadecimal(self):
        self._test_convert(16, 0)

    def test_convert_to_lower_case_hexadecimal(self):
        self._test_convert(16, 1)

    def test_convert_to_upper_case_hexadecimal(self):
        self._test_convert(16, 2)

    def test_substitute_labels(self):
        warnings = []
        def warn(message, instruction):
            warnings.append((message, instruction.address))

        instructions = (
            Instruction(0x0000, 'LDA $1234'),
            Instruction(0x0003, '.WORD $2345'),
            Instruction(0x0005, 'LDX $3456', keep=[0x3456]),
            Instruction(0x0008, 'LDY #$FF'),
            Instruction(0x000A, 'JSR $0005'),
            Instruction(0x000D, 'LDA $0005'),
            Instruction(0x0010, 'JSR $0006'),
            Instruction(0x0013, 'JSR $0008'),
            Instruction(0x0016, 'JSR $0006', nowarn=[]),
            Instruction(0x0019, 'JSR $0008', nowarn=[0x0008]),
            Instruction(0x001C, 'JSR $0006', sub=True)
        )
        labels = {
            0x1234: 'LIVES',
            0x2345: 'GDATA',
            0x3456: 'NO',
            0xFF: 'ALSONO',
            0x0005: 'ROUTINE'
        }
        exp_operations = [
            'LDA LIVES',
            '.WORD GDATA',
            'LDX $3456',
            'LDY #$FF',
            'JSR ROUTINE',
            'LDA $0005',
            'JSR $0006',
            'JSR $0008',
            'JSR $0006',
            'JSR $0008',
            'JSR $0006'
        ]
        entries = [Entry(instructions, 'c')]
        iu = InstructionUtility()
        iu.substitute_labels(entries, (), labels, 2, warn)
        self.assertEqual(exp_operations, [i.operation for i in instructions])
        exp_warnings = [
            ('Unreplaced address ($0006)', 0x0010),
            ('No label for address ($0008)', 0x0013)
        ]
        self.assertEqual(exp_warnings, warnings)

if __name__ == '__main__':
    unittest.main()
