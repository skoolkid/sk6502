from os.path import abspath, dirname
import os
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)

SK6502_HOME = abspath(dirname(dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502.assembler import assemble, get_size

OPERATIONS = {
    'BRK': (0,),
    'ORA ($00,X)': (1, 0),
    'ORA $00': (5, 0),
    'ASL $00': (6, 0),
    'PHP': (8,),
    'ORA #$00': (9, 0),
    'ORA #"A"': (9, 65),
    'ORA #"a"': (9, 97),
    'ASL A': (10,),
    'ORA $0000': (13, 0, 0),
    'ASL $0000': (14, 0, 0),
    'BPL $0002': (16, 0),
    'ORA ($00),Y': (17, 0),
    'ORA $00,X': (21, 0),
    'ASL $00,X': (22, 0),
    'CLC': (24,),
    'ORA $0000,Y': (25, 0, 0),
    'ORA $0000,X': (29, 0, 0),
    'ASL $0000,X': (30, 0, 0),
    'JSR $0000': (32, 0, 0),
    'AND ($00,X)': (33, 0),
    'BIT $00': (36, 0),
    'AND $00': (37, 0),
    'ROL $00': (38, 0),
    'PLP': (40,),
    'AND #$00': (41, 0),
    'ROL A': (42,),
    'BIT $0000': (44, 0, 0),
    'AND $0000': (45, 0, 0),
    'ROL $0000': (46, 0, 0),
    'BMI $0002': (48, 0),
    'AND $00,X': (53, 0),
    'ROL $00,X': (54, 0),
    'SEC': (56,),
    'AND $0000,Y': (57, 0, 0),
    'AND $0000,X': (61, 0, 0),
    'ROL $0000,X': (62, 0, 0),
    'RTI': (64,),
    'EOR ($00,X)': (65, 0),
    'EOR $00': (69, 0),
    'LSR $00': (70, 0),
    'PHA': (72,),
    'EOR #$00': (73, 0),
    'LSR A': (74,),
    'JMP $0000': (76, 0, 0),
    'EOR $0000': (77, 0, 0),
    'LSR $0000': (78, 0, 0),
    'BVC $0002': (80, 0),
    'EOR ($00),Y': (81, 0),
    'EOR $00,X': (85, 0),
    'LSR $00,X': (86, 0),
    'CLI': (88,),
    'EOR $0000,Y': (89, 0, 0),
    'EOR $0000,X': (93, 0, 0),
    'LSR $0000,X': (94, 0, 0),
    'RTS': (96,),
    'ADC ($00,X)': (97, 0),
    'ADC $00': (101, 0),
    'ROR $00': (102, 0),
    'PLA': (104,),
    'ADC #$00': (105, 0),
    'ROR A': (106,),
    'JMP ($0000)': (108, 0, 0),
    'ADC $0000': (109, 0, 0),
    'ROR $0000': (110, 0, 0),
    'BVS $0002': (112, 0),
    'ADC ($00),Y': (113, 0),
    'ADC $00,X': (117, 0),
    'ROR $00,X': (118, 0),
    'SEI': (120,),
    'ADC $0000,Y': (121, 0, 0),
    'ADC $0000,X': (125, 0, 0),
    'ROR $0000,X': (126, 0, 0),
    'STA ($00,X)': (129, 0),
    'STY $00': (132, 0),
    'STA $00': (133, 0),
    'STX $00': (134, 0),
    'DEY': (136,),
    'TXA': (138,),
    'STY $0000': (140, 0, 0),
    'STA $0000': (141, 0, 0),
    'STX $0000': (142, 0, 0),
    'BCC $0002': (144, 0),
    'STA ($00),Y': (145, 0),
    'STY $00,X': (148, 0),
    'STA $00,X': (149, 0),
    'STX $00,Y': (150, 0),
    'TYA': (152,),
    'STA $0000,Y': (153, 0, 0),
    'TXS': (154,),
    'STA $0000,X': (157, 0, 0),
    'LDY #$00': (160, 0),
    'LDA ($00,X)': (161, 0),
    'LDX #$00': (162, 0),
    'LDY $00': (164, 0),
    'LDA $00': (165, 0),
    'LDX $00': (166, 0),
    'TAY': (168,),
    'LDA #$00': (169, 0),
    'TAX': (170,),
    'LDY $0000': (172, 0, 0),
    'LDA $0000': (173, 0, 0),
    'LDX $0000': (174, 0, 0),
    'BCS $0002': (176, 0),
    'LDA ($00),Y': (177, 0),
    'LDY $00,X': (180, 0),
    'LDA $00,X': (181, 0),
    'LDX $00,Y': (182, 0),
    'CLV': (184,),
    'LDA $0000,Y': (185, 0, 0),
    'TSX': (186,),
    'LDY $0000,X': (188, 0, 0),
    'LDA $0000,X': (189, 0, 0),
    'LDX $0000,Y': (190, 0, 0),
    'CPY #$00': (192, 0),
    'CMP ($00,X)': (193, 0),
    'CPY $00': (196, 0),
    'CMP $00': (197, 0),
    'DEC $00': (198, 0),
    'INY': (200,),
    'CMP #$00': (201, 0),
    'DEX': (202,),
    'CPY $0000': (204, 0, 0),
    'CMP $0000': (205, 0, 0),
    'DEC $0000': (206, 0, 0),
    'BNE $0002': (208, 0),
    'CMP ($00),Y': (209, 0),
    'CMP $00,X': (213, 0),
    'DEC $00,X': (214, 0),
    'CLD': (216,),
    'CMP $0000,Y': (217, 0, 0),
    'CMP $0000,X': (221, 0, 0),
    'DEC $0000,X': (222, 0, 0),
    'CPX #$00': (224, 0),
    'SBC ($00,X)': (225, 0),
    'CPX $00': (228, 0),
    'SBC $00': (229, 0),
    'INC $00': (230, 0),
    'INX': (232,),
    'SBC #$00': (233, 0),
    'NOP': (234,),
    'CPX $0000': (236, 0, 0),
    'SBC $0000': (237, 0, 0),
    'INC $0000': (238, 0, 0),
    'BEQ $0002': (240, 0),
    'SBC ($00),Y': (241, 0),
    'SBC $00,X': (245, 0),
    'INC $00,X': (246, 0),
    'SED': (248,),
    'SBC $0000,Y': (249, 0, 0),
    'SBC $0000,X': (253, 0, 0),
    'INC $0000,X': (254, 0, 0),
    '.BYTE $01': (1,),
    '.BYTE $01,$02': (1, 2),
    '.BYTE "A"': (65,),
    '.BYTE "B"+$80': (194,),
    r'.BYTE "\""': (34,),
    r'.BYTE "\""+$80': (162,),
    r'.BYTE "A\"\\B"': (65, 34, 92, 66),
    '.BYTE "AB",$43': (65, 66, 67),
    '.BYTE "A,B",$43': (65, 44, 66, 67),
    '.BYTE "A",",","B"': (65, 44, 66),
    '.FILL $02': (0, 0),
    '.FILL $02,$01': (1, 1),
    '.WORD $0101': (1, 1),
    '.WORD 101': (101, 0)
}

INVALID_OPERATIONS = (
    'SED A',
    'LDA #$100',
    'BEQ $0100',
    'STA #$0100',
    'STX $0100,Y',
    '.BYTE $00+',
    '.BYTE "A""',
    '.BYTE "AB',
    '.WORD $10000'
)

class AssemblerTest(unittest.TestCase):
    def setUp(self):
        super().setUp()
        self.longMessage = True

    def test_assemble(self):
        for operation, exp_data in OPERATIONS.items():
            with self.subTest(operation=operation):
                self.assertEqual(exp_data, assemble(operation, 0), "assemble('{}', 0) failed".format(operation))

    def test_get_size(self):
        for operation, exp_data in OPERATIONS.items():
            with self.subTest(operation=operation):
                self.assertEqual(get_size(operation, 0), len(exp_data), "get_size('{}', 0) failed".format(operation))

    def test_invalid_operations(self):
        for operation in INVALID_OPERATIONS:
            with self.subTest(operation=operation):
                self.assertEqual((), assemble(operation, 0), "assemble('{}', 0) failed".format(operation))

if __name__ == '__main__':
    unittest.main()
