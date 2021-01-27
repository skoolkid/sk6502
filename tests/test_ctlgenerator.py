from collections import namedtuple
from os.path import abspath, dirname
import os
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)

SK6502_HOME = abspath(dirname(dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502.ctlgenerator import generate_ctls

Config = namedtuple('Config', 'text_chars text_min_length_code text_min_length_data words')

CONFIG = Config('0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ', 12, 3, ())

class ControlDirectiveComposerTest(unittest.TestCase):
    def _test_generation(self, snapshot, exp_ctls, start=0, end=None, config=CONFIG):
        end = end or len(snapshot)
        ctls = generate_ctls(snapshot, start, end, None, config)
        exp_ctls[end] = 'i'
        self.assertEqual(exp_ctls, ctls)

    def test_code(self):
        snapshot = [
            0xA9, 0x01, # 0000 LDA #$01
            0x60,       # 0002 RTS
            0xA2, 0x02, # 0003 LDX #$02
            0x60,       # 0005 RTS
        ]
        exp_ctls = {
            0x0000: 'c',
            0x0003: 'c'
        }
        self._test_generation(snapshot, exp_ctls)

    def test_code_with_branches(self):
        snapshot = [
            0x90, 0x07, # 0000 BCC $0009
            0xB0, 0x07, # 0002 BCS $000B
            0XF0, 0x07, # 0004 BEQ $000D
            0xD0, 0x07, # 0006 BNE $000F
            0x60,       # 0008 RTS
            0x18,       # 0009 CLC
            0x60,       # 000A RTS
            0x18,       # 000B CLC
            0x60,       # 000C RTS
            0x18,       # 000D CLC
            0x60,       # 000E RTS
            0x18,       # 000F CLC
            0x60,       # 0010 RTS
            0x30, 0x0D, # 0011 BMI $0020
            0x10, 0x09, # 0013 BPL $001E
            0X50, 0x05, # 0015 BVC $001C
            0x70, 0x01, # 0017 BVS $001A
            0x60,       # 0019 RTS
            0x18,       # 001A CLC
            0x60,       # 001B RTS
            0x18,       # 001C CLC
            0x60,       # 001D RTS
            0x18,       # 001E CLC
            0x60,       # 001F RTS
            0x18,       # 0020 CLC
            0x60,       # 0021 RTS
        ]
        exp_ctls = {
            0x0000: 'c',
            0x0011: 'c'
        }
        self._test_generation(snapshot, exp_ctls)

    def test_code_with_absolute_jumps(self):
        snapshot = [
            0xF0, 0x03,       # 0000 BEQ $0005
            0x4C, 0x06, 0x00, # 0002 JMP $0006
            0x60,             # 0005 RTS
            0xF0, 0x03,       # 0006 BEQ $000B
            0x4C, 0x0C, 0x00, # 0008 JMP $000C
            0x60,             # 000B RTS
            0xE8,             # 000C INX
            0x60,             # 000D RTS
            0xF0, 0x03,       # 000E BEQ $0013
            0x4C, 0x14, 0x00, # 0010 JMP $0014
            0x60,             # 0013 RTS
            0xC8,             # 0014 INY
            0x60              # 0015 RTS
        ]
        exp_ctls = {
            0x0000: 'c',
            0x000E: 'c'
        }
        self._test_generation(snapshot, exp_ctls)

    def test_data(self):
        snapshot = [
            0xA9, 0x01, # 0000 LDA #$01
            0xA9, 0x02, # 0002 LDA #$02
            0x60,       # 0004 RTS
            0x0B, 0x00, # 0005 .BYTE $0B,$00
            0x60,       # 0007 RTS
        ]
        exp_ctls = {
            0x0000: 'b',
            0x0004: 'c',
            0x0005: 'b',
            0x0007: 'c'
        }
        self._test_generation(snapshot, exp_ctls)

    def test_text(self):
        snapshot = [
            0x43, 0x42, 0x4D, 0x42, 0x41, 0x53, 0x49, 0x43, # 0000 .BYTE "CBMBASIC"
            0x00                                            # 0008 .BYTE $00
        ]
        exp_ctls = {
            0x0000: 't',
            0x0008: 'b'
        }
        self._test_generation(snapshot, exp_ctls)

    def test_text_in_code(self):
        snapshot = [
            0x41, 0x42, 0x41, 0x42, 0x41, 0x42, # 0000 .BYTE "ABABAB"
            0x60                                # 0006 RTS
        ]
        exp_ctls = {
            0x0000: 't',
            0x0006: 'c'
        }
        config = Config('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 6, 3, ())
        self._test_generation(snapshot, exp_ctls, config=config)

    def test_allowed_words(self):
        snapshot = [
            0x43, 0x42, 0x4D, 0x42, 0x41, 0x53, 0x49, 0x43, # 0000 .BYTE "CBMBASIC"
            0x00,                                           # 0008 .BYTE $00
            0x48, 0x45, 0x4C, 0x4C, 0x4F                    # 0009 .BYTE "HELLO"
        ]
        exp_ctls = {
            0x0000: 'b',
            0x0009: 't'
        }
        config = Config('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 5, 3, ('hello',))
        self._test_generation(snapshot, exp_ctls, config=config)

    def test_64k_boundary(self):
        snapshot = [0] * 65536
        snapshot[0xFFFE:] = [
            0x0D, 0x00 # 0xFFFE Opcode for ORA nnnn
        ]
        exp_ctls = {
            0xFFFE: 'b'
        }
        self._test_generation(snapshot, exp_ctls, 0xFFFE, 0x10000)

if __name__ == '__main__':
    unittest.main()
