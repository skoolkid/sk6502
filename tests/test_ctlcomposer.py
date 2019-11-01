from os.path import abspath, dirname
import os
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)

from skoolkit import SkoolParsingError

SK6502_HOME = abspath(dirname(dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502 import ControlDirectiveComposer

class ControlDirectiveComposerTest(unittest.TestCase):
    def _test_operation(self, operation, exp_ctl, exp_length, exp_sublengths=None, preserve_base=False):
        composer = ControlDirectiveComposer(preserve_base)
        result = composer.compose(operation)
        self.assertEqual((exp_ctl, exp_length, exp_sublengths), result)

    def test_byte(self):
        self._test_operation('.BYTE $01,"A"', 'B', 2, '1:c1')

    def test_fill(self):
        self._test_operation('.FILL $08', 'S', 8, '$08')

    def test_fill_with_value(self):
        self._test_operation('.FILL $08,$01', 'S', 8, '$08:n')

    def test_word(self):
        self._test_operation('.WORD $0001', 'W', 2, '2')

    def test_no_operand(self):
        self._test_operation('RTS', 'C', '')

    def test_immediate_operand(self):
        self._test_operation('LDA #$01', 'C', '')

    def test_absolute_operand(self):
        self._test_operation('LDA $0001', 'C', '')

    def test_binary_operand(self):
        self._test_operation('AND %1000000', 'C', 'b')

    def test_negative_operand(self):
        self._test_operation('LDA #-1', 'C', 'm')

    def test_inverted_character_operand(self):
        self._test_operation('.BYTE "a"+$80', 'B', 1, 'c1')

    def test_hex_operand_preserve_base(self):
        self._test_operation('LDA $0001', 'C', 'h', preserve_base=True)

    def test_decimal_operand_preserve_base(self):
        self._test_operation('.BYTE 1', 'B', 1, 'd1', True)

    def test_byte_mixed_bases_preserve_base(self):
        self._test_operation('.BYTE $01,1,"a",%00000001', 'B', 4, 'h1:d1:c1:b1', True)

    def test_word_mixed_bases_preserve_base(self):
        self._test_operation('.WORD $0001,1,%0000000000000001', 'W', 6, 'h2:d2:b2', True)

    def test_byte_invalid_value(self):
        self._test_operation('.BYTE "x', 'B', 1, '1')

    def test_fill_invalid_size(self):
        with self.assertRaisesRegex(SkoolParsingError, "Invalid integer 'x': .FILL x"):
            ControlDirectiveComposer(False).compose('.FILL x')

if __name__ == '__main__':
    unittest.main()
