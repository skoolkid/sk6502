from collections import namedtuple
import os
from os.path import abspath, dirname
import sys
import unittest

SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
if SKOOLKIT_HOME:
    sys.path.insert(0, SKOOLKIT_HOME)
from skoolkit.disassembler import OperandFormatter

SK6502_HOME = abspath(dirname(dirname(__file__)))
sys.path.insert(0, SK6502_HOME)
from sk6502 import Disassembler

Config = namedtuple('Config', 'asm_hex asm_lower defb_size defm_size defw_size')

ASM = {
    '000000': ('BRK', 'BRK', 'BRK'),
    '010000': ('ORA ($00,X)', 'BRK'),
    '020000': ('.BYTE $02', 'BRK', 'BRK'),
    '030000': ('.BYTE $03,$00', 'BRK'),
    '040000': ('.BYTE $04,$00', 'BRK'),
    '050000': ('ORA $00', 'BRK'),
    '060000': ('ASL $00', 'BRK'),
    '070000': ('.BYTE $07,$00', 'BRK'),
    '080000': ('PHP', 'BRK', 'BRK'),
    '090000': ('ORA #$00', 'BRK'),
    '0A0000': ('ASL A', 'BRK', 'BRK'),
    '0B0000': ('.BYTE $0B,$00', 'BRK'),
    '0C0000': ('.BYTE $0C,$00,$00',),
    '0D0000': ('ORA $0000',),
    '0E0000': ('ASL $0000',),
    '0F0000': ('.BYTE $0F,$00,$00',),
    '100000': ('BPL $8002', 'BRK'),
    '110000': ('ORA ($00),Y', 'BRK'),
    '120000': ('.BYTE $12', 'BRK', 'BRK'),
    '130000': ('.BYTE $13,$00', 'BRK'),
    '140000': ('.BYTE $14,$00', 'BRK'),
    '150000': ('ORA $00,X', 'BRK'),
    '160000': ('ASL $00,X', 'BRK'),
    '170000': ('.BYTE $17,$00', 'BRK'),
    '180000': ('CLC', 'BRK', 'BRK'),
    '190000': ('ORA $0000,Y',),
    '1A0000': ('.BYTE $1A', 'BRK', 'BRK'),
    '1B0000': ('.BYTE $1B,$00,$00',),
    '1C0000': ('.BYTE $1C,$00,$00',),
    '1D0000': ('ORA $0000,X',),
    '1E0000': ('ASL $0000,X',),
    '1F0000': ('.BYTE $1F,$00,$00',),
    '200000': ('JSR $0000',),
    '210000': ('AND ($00,X)', 'BRK'),
    '220000': ('.BYTE $22', 'BRK', 'BRK'),
    '230000': ('.BYTE $23,$00', 'BRK'),
    '240000': ('BIT $00', 'BRK'),
    '250000': ('AND $00', 'BRK'),
    '260000': ('ROL $00', 'BRK'),
    '270000': ('.BYTE $27,$00', 'BRK'),
    '280000': ('PLP', 'BRK', 'BRK'),
    '290000': ('AND #$00', 'BRK'),
    '2A0000': ('ROL A', 'BRK', 'BRK'),
    '2B0000': ('.BYTE $2B,$00', 'BRK'),
    '2C0000': ('BIT $0000',),
    '2D0000': ('AND $0000',),
    '2E0000': ('ROL $0000',),
    '2F0000': ('.BYTE $2F,$00,$00',),
    '30FE00': ('BMI $8000', 'BRK'),
    '310000': ('.BYTE $31,$00', 'BRK'),
    '320000': ('.BYTE $32', 'BRK', 'BRK'),
    '330000': ('.BYTE $33,$00', 'BRK'),
    '340000': ('.BYTE $34,$00', 'BRK'),
    '350000': ('AND $00,X', 'BRK'),
    '360000': ('ROL $00,X', 'BRK'),
    '370000': ('.BYTE $37,$00', 'BRK'),
    '380000': ('SEC', 'BRK', 'BRK'),
    '390000': ('AND $0000,Y',),
    '3A0000': ('.BYTE $3A', 'BRK', 'BRK'),
    '3B0000': ('.BYTE $3B,$00,$00',),
    '3C0000': ('.BYTE $3C,$00,$00',),
    '3D0000': ('AND $0000,X',),
    '3E0000': ('ROL $0000,X',),
    '3F0000': ('.BYTE $3F,$00,$00',),
    '400000': ('RTI', 'BRK', 'BRK'),
    '410000': ('EOR ($00,X)', 'BRK'),
    '420000': ('.BYTE $42', 'BRK', 'BRK'),
    '430000': ('.BYTE $43,$00', 'BRK'),
    '440000': ('.BYTE $44,$00', 'BRK'),
    '450000': ('EOR $00', 'BRK'),
    '460000': ('LSR $00', 'BRK'),
    '470000': ('.BYTE $47,$00', 'BRK'),
    '480000': ('PHA', 'BRK', 'BRK'),
    '490000': ('EOR #$00', 'BRK'),
    '4A0000': ('LSR A', 'BRK', 'BRK'),
    '4B0000': ('.BYTE $4B,$00', 'BRK'),
    '4C0000': ('JMP $0000',),
    '4D0000': ('EOR $0000',),
    '4E0000': ('LSR $0000',),
    '4F0000': ('.BYTE $4F,$00,$00',),
    '500100': ('BVC $8003', 'BRK'),
    '510000': ('EOR ($00),Y', 'BRK'),
    '520000': ('.BYTE $52', 'BRK', 'BRK'),
    '530000': ('.BYTE $53,$00', 'BRK'),
    '540000': ('.BYTE $54,$00', 'BRK'),
    '550000': ('EOR $00,X', 'BRK'),
    '560000': ('LSR $00,X', 'BRK'),
    '570000': ('.BYTE $57,$00', 'BRK'),
    '580000': ('CLI', 'BRK', 'BRK'),
    '590000': ('EOR $0000,Y',),
    '5A0000': ('.BYTE $5A', 'BRK', 'BRK'),
    '5B0000': ('.BYTE $5B,$00,$00',),
    '5C0000': ('.BYTE $5C,$00,$00',),
    '5D0000': ('EOR $0000,X',),
    '5E0000': ('LSR $0000,X',),
    '5F0000': ('.BYTE $5F,$00,$00',),
    '600000': ('RTS', 'BRK', 'BRK'),
    '610000': ('ADC ($00,X)', 'BRK'),
    '620000': ('.BYTE $62', 'BRK', 'BRK'),
    '630000': ('.BYTE $63,$00', 'BRK'),
    '640000': ('.BYTE $64,$00', 'BRK'),
    '650000': ('ADC $00', 'BRK'),
    '660000': ('ROR $00', 'BRK'),
    '670000': ('.BYTE $67,$00', 'BRK'),
    '680000': ('PLA', 'BRK', 'BRK'),
    '690000': ('ADC #$00', 'BRK'),
    '6A0000': ('ROR A', 'BRK', 'BRK'),
    '6B0000': ('.BYTE $6B,$00', 'BRK'),
    '6C0000': ('JMP ($0000)',),
    '6D0000': ('ADC $0000',),
    '6E0000': ('ROR $0000',),
    '6F0000': ('.BYTE $6F,$00,$00',),
    '70FD00': ('BVS $7FFF', 'BRK'),
    '710000': ('ADC ($00),Y', 'BRK'),
    '720000': ('.BYTE $72', 'BRK', 'BRK'),
    '730000': ('.BYTE $73,$00', 'BRK'),
    '740000': ('.BYTE $74,$00', 'BRK'),
    '750000': ('ADC $00,X', 'BRK'),
    '760000': ('ROR $00,X', 'BRK'),
    '770000': ('.BYTE $77,$00', 'BRK'),
    '780000': ('SEI', 'BRK', 'BRK'),
    '790000': ('ADC $0000,Y',),
    '7A0000': ('.BYTE $7A', 'BRK', 'BRK'),
    '7B0000': ('.BYTE $7B,$00,$00',),
    '7C0000': ('.BYTE $7C,$00,$00',),
    '7D0000': ('ADC $0000,X',),
    '7E0000': ('ROR $0000,X',),
    '7F0000': ('.BYTE $7F,$00,$00',),
    '800000': ('.BYTE $80,$00', 'BRK'),
    '810000': ('STA ($00,X)', 'BRK'),
    '820000': ('.BYTE $82,$00', 'BRK'),
    '830000': ('.BYTE $83,$00', 'BRK'),
    '840000': ('STY $00', 'BRK'),
    '850000': ('STA $00', 'BRK'),
    '860000': ('STX $00', 'BRK'),
    '870000': ('.BYTE $87,$00', 'BRK'),
    '880000': ('DEY', 'BRK', 'BRK'),
    '890000': ('.BYTE $89,$00', 'BRK'),
    '8A0000': ('TXA', 'BRK', 'BRK'),
    '8B0000': ('.BYTE $8B,$00', 'BRK'),
    '8C0000': ('STY $0000',),
    '8D0000': ('STA $0000',),
    '8E0000': ('STX $0000',),
    '8F0000': ('.BYTE $8F,$00,$00',),
    '900200': ('BCC $8004', 'BRK'),
    '910000': ('STA ($00),Y', 'BRK'),
    '920000': ('.BYTE $92', 'BRK', 'BRK'),
    '930000': ('.BYTE $93,$00', 'BRK'),
    '940000': ('STY $00,X', 'BRK'),
    '950000': ('STA $00,X', 'BRK'),
    '960000': ('STX $00,Y', 'BRK'),
    '970000': ('.BYTE $97,$00', 'BRK'),
    '980000': ('TYA', 'BRK', 'BRK'),
    '990000': ('STA $0000,Y',),
    '9A0000': ('TXS', 'BRK', 'BRK'),
    '9B0000': ('.BYTE $9B,$00,$00',),
    '9C0000': ('.BYTE $9C,$00,$00',),
    '9D0000': ('STA $0000,X',),
    '9E0000': ('.BYTE $9E,$00,$00',),
    '9F0000': ('.BYTE $9F,$00,$00',),
    'A00000': ('LDY #$00', 'BRK'),
    'A10000': ('LDA ($00,X)', 'BRK'),
    'A20000': ('LDX #$00', 'BRK'),
    'A30000': ('.BYTE $A3,$00', 'BRK'),
    'A40000': ('LDY $00', 'BRK'),
    'A50000': ('LDA $00', 'BRK'),
    'A60000': ('LDX $00', 'BRK'),
    'A70000': ('.BYTE $A7,$00', 'BRK'),
    'A80000': ('TAY', 'BRK', 'BRK'),
    'A90000': ('LDA #$00', 'BRK'),
    'AA0000': ('TAX', 'BRK', 'BRK'),
    'AB0000': ('.BYTE $AB,$00', 'BRK'),
    'AC0000': ('LDY $0000',),
    'AD0000': ('LDA $0000',),
    'AE0000': ('LDX $0000',),
    'AF0000': ('.BYTE $AF,$00,$00',),
    'B0FC00': ('BCS $7FFE', 'BRK'),
    'B10000': ('LDA ($00),Y', 'BRK'),
    'B20000': ('.BYTE $B2', 'BRK', 'BRK'),
    'B30000': ('.BYTE $B3,$00', 'BRK'),
    'B40000': ('LDY $00,X', 'BRK'),
    'B50000': ('LDA $00,X', 'BRK'),
    'B60000': ('LDX $00,Y', 'BRK'),
    'B70000': ('.BYTE $B7,$00', 'BRK'),
    'B80000': ('CLV', 'BRK', 'BRK'),
    'B90000': ('LDA $0000,Y',),
    'BA0000': ('TSX', 'BRK', 'BRK'),
    'BB0000': ('.BYTE $BB,$00,$00',),
    'BC0000': ('LDY $0000,X',),
    'BD0000': ('LDA $0000,X',),
    'BE0000': ('LDX $0000,Y',),
    'BF0000': ('.BYTE $BF,$00,$00',),
    'C00000': ('CPY #$00', 'BRK'),
    'C10000': ('CMP ($00,X)', 'BRK'),
    'C20000': ('.BYTE $C2,$00', 'BRK'),
    'C30000': ('.BYTE $C3,$00', 'BRK'),
    'C40000': ('CPY $00', 'BRK'),
    'C50000': ('CMP $00', 'BRK'),
    'C60000': ('DEC $00', 'BRK'),
    'C70000': ('.BYTE $C7,$00', 'BRK'),
    'C80000': ('INY', 'BRK', 'BRK'),
    'C90000': ('CMP #$00', 'BRK'),
    'CA0000': ('DEX', 'BRK', 'BRK'),
    'CB0000': ('.BYTE $CB,$00', 'BRK'),
    'CC0000': ('CPY $0000',),
    'CD0000': ('CMP $0000',),
    'CE0000': ('DEC $0000',),
    'CF0000': ('.BYTE $CF,$00,$00',),
    'D00300': ('BNE $8005', 'BRK'),
    'D10000': ('CMP ($00),Y', 'BRK'),
    'D20000': ('.BYTE $D2', 'BRK', 'BRK'),
    'D30000': ('.BYTE $D3,$00', 'BRK'),
    'D40000': ('.BYTE $D4,$00', 'BRK'),
    'D50000': ('CMP $00,X', 'BRK'),
    'D60000': ('DEC $00,X', 'BRK'),
    'D70000': ('.BYTE $D7,$00', 'BRK'),
    'D80000': ('CLD', 'BRK', 'BRK'),
    'D90000': ('CMP $0000,Y',),
    'DA0000': ('.BYTE $DA', 'BRK', 'BRK'),
    'DB0000': ('.BYTE $DB,$00,$00',),
    'DC0000': ('.BYTE $DC,$00,$00',),
    'DD0000': ('CMP $0000,X',),
    'DE0000': ('DEC $0000,X',),
    'DF0000': ('.BYTE $DF,$00,$00',),
    'E00000': ('CPX #$00', 'BRK'),
    'E10000': ('SBC ($00,X)', 'BRK'),
    'E20000': ('.BYTE $E2,$00', 'BRK'),
    'E30000': ('.BYTE $E3,$00', 'BRK'),
    'E40000': ('CPX $00', 'BRK'),
    'E50000': ('SBC $00', 'BRK'),
    'E60000': ('INC $00', 'BRK'),
    'E70000': ('.BYTE $E7,$00', 'BRK'),
    'E80000': ('INX', 'BRK', 'BRK'),
    'E90000': ('SBC #$00', 'BRK'),
    'EA0000': ('NOP', 'BRK', 'BRK'),
    'EB0000': ('.BYTE $EB,$00', 'BRK'),
    'EC0000': ('CPX $0000',),
    'ED0000': ('SBC $0000',),
    'EE0000': ('INC $0000',),
    'EF0000': ('.BYTE $EF,$00,$00',),
    'F0FB00': ('BEQ $7FFD', 'BRK'),
    'F10000': ('SBC ($00),Y', 'BRK'),
    'F20000': ('.BYTE $F2', 'BRK', 'BRK'),
    'F30000': ('.BYTE $F3,$00', 'BRK'),
    'F40000': ('.BYTE $F4,$00', 'BRK'),
    'F50000': ('SBC $00,X', 'BRK'),
    'F60000': ('INC $00,X', 'BRK'),
    'F70000': ('.BYTE $F7,$00', 'BRK'),
    'F80000': ('SED', 'BRK', 'BRK'),
    'F90000': ('SBC $0000,Y',),
    'FA0000': ('.BYTE $FA', 'BRK', 'BRK'),
    'FB0000': ('.BYTE $FB,$00,$00',),
    'FC0000': ('.BYTE $FC,$00,$00',),
    'FD0000': ('SBC $0000,X',),
    'FE0000': ('INC $0000,X',),
    'FF0000': ('.BYTE $FF,$00,$00',)
}

BOUNDARY_OPS = (
    [1],      # ORA ($nn,X)
    [5],      # ORA $nn
    [6],      # ASL $nn
    [9],      # ORA #$nn
    [13, 0],  # ORA $nnnn
    [13],     # ORA $nnnn
    [14, 0],  # ASL $nnnn
    [14],     # ASL $nnnn
    [16],     # BPL $nnnn
    [17],     # ORA ($nn),Y
    [21],     # ORA $nn,X
    [22],     # ASL $nn,X
    [25, 0],  # ORA $nnnn,Y
    [25],     # ORA $nnnn,Y
    [29, 0],  # ORA $nnnn,X
    [29],     # ORA $nnnn,X
    [30, 0],  # ASL $nnnn,X
    [30],     # ASL $nnnn,X
    [32, 0],  # JSR $nnnn
    [32],     # JSR $nnnn
    [33],     # AND ($nn,X)
    [36],     # BIT $nn
    [37],     # AND $nn
    [38],     # ROL $nn
    [41],     # AND #$nn
    [44, 0],  # BIT $nnnn
    [44],     # BIT $nnnn
    [45, 0],  # AND $nnnn
    [45],     # AND $nnnn
    [46, 0],  # ROL $nnnn
    [46],     # ROL $nnnn
    [48],     # BMI $nnnn
    [53],     # AND $nn,X
    [54],     # ROL $nn,X
    [57, 0],  # AND $nnnn,Y
    [57],     # AND $nnnn,Y
    [61, 0],  # AND $nnnn,X
    [61],     # AND $nnnn,X
    [62, 0],  # ROL $nnnn,X
    [62],     # ROL $nnnn,X
    [65],     # EOR ($nn,X)
    [69],     # EOR $nn
    [70],     # LSR $nn
    [73],     # EOR #$nn
    [76, 0],  # JMP $nnnn
    [76],     # JMP $nnnn
    [77, 0],  # EOR $nnnn
    [77],     # EOR $nnnn
    [78, 0],  # LSR $nnnn
    [78],     # LSR $nnnn
    [80],     # BVC $nnnn
    [81],     # EOR ($nn),Y
    [85],     # EOR $nn,X
    [86],     # LSR $nn,X
    [89, 0],  # EOR $nnnn,Y
    [89],     # EOR $nnnn,Y
    [93, 0],  # EOR $nnnn,X
    [93],     # EOR $nnnn,X
    [94, 0],  # LSR $nnnn,X
    [94],     # LSR $nnnn,X
    [97],     # ADC ($nn,X)
    [101],    # ADC $nn
    [102],    # ROR $nn
    [105],    # ADC #$nn
    [108, 0], # JMP ($nnnn)
    [108],    # JMP ($nnnn)
    [109, 0], # ADC $nnnn
    [109],    # ADC $nnnn
    [110, 0], # ROR $nnnn
    [110],    # ROR $nnnn
    [112],    # BVS $nnnn
    [113],    # ADC ($nn),Y
    [117],    # ADC $nn,X
    [118],    # ROR $nn,X
    [121, 0], # ADC $nnnn,Y
    [121],    # ADC $nnnn,Y
    [125, 0], # ADC $nnnn,X
    [125],    # ADC $nnnn,X
    [126, 0], # ROR $nnnn,X
    [126],    # ROR $nnnn,X
    [129],    # STA ($nn,X)
    [132],    # STY $nn
    [133],    # STA $nn
    [134],    # STX $nn
    [140, 0], # STY $nnnn
    [140],    # STY $nnnn
    [141, 0], # STA $nnnn
    [141],    # STA $nnnn
    [142, 0], # STX $nnnn
    [142],    # STX $nnnn
    [144],    # BCC $nnnn
    [145],    # STA ($nn),Y
    [148],    # STY $nn,X
    [149],    # STA $nn,X
    [150],    # STX $nn,Y
    [153, 0], # STA $nnnn,Y
    [153],    # STA $nnnn,Y
    [157, 0], # STA $nnnn,X
    [157],    # STA $nnnn,X
    [160],    # LDY #$nn
    [161],    # LDA ($nn,X)
    [162],    # LDX #$nn
    [164],    # LDY $nn
    [165],    # LDA $nn
    [166],    # LDX $nn
    [169],    # LDA #$nn
    [172, 0], # LDY $nnnn
    [172],    # LDY $nnnn
    [173, 0], # LDA $nnnn
    [173],    # LDA $nnnn
    [174, 0], # LDX $nnnn
    [174],    # LDX $nnnn
    [176],    # BCS $nnnn
    [177],    # LDA ($nn),Y
    [180],    # LDY $nn,X
    [181],    # LDA $nn,X
    [182],    # LDX $nn,Y
    [185, 0], # LDA $nnnn,Y
    [185],    # LDA $nnnn,Y
    [188, 0], # LDY $nnnn,X
    [188],    # LDY $nnnn,X
    [189, 0], # LDA $nnnn,X
    [189],    # LDA $nnnn,X
    [190, 0], # LDX $nnnn,Y
    [190],    # LDX $nnnn,Y
    [192],    # CPY #$nn
    [193],    # CMP ($nn,X)
    [196],    # CPY $nn
    [197],    # CMP $nn
    [198],    # DEC $nn
    [201],    # CMP #$nn
    [204, 0], # CPY $nnnn
    [204],    # CPY $nnnn
    [205, 0], # CMP $nnnn
    [205],    # CMP $nnnn
    [206, 0], # DEC $nnnn
    [206],    # DEC $nnnn
    [208],    # BNE $nnnn
    [209],    # CMP ($nn),Y
    [213],    # CMP $nn,X
    [214],    # DEC $nn,X
    [217, 0], # CMP $nnnn,Y
    [217],    # CMP $nnnn,Y
    [221, 0], # CMP $nnnn,X
    [221],    # CMP $nnnn,X
    [222, 0], # DEC $nnnn,X
    [222],    # DEC $nnnn,X
    [224],    # CPX #$nn
    [225],    # SBC ($nn,X)
    [228],    # CPX $nn
    [229],    # SBC $nn
    [230],    # INC $nn
    [233],    # SBC #$nn
    [236, 0], # CPX $nnnn
    [236],    # CPX $nnnn
    [237, 0], # SBC $nnnn
    [237],    # SBC $nnnn
    [238, 0], # INC $nnnn
    [238],    # INC $nnnn
    [240],    # BEQ $nnnn
    [241],    # SBC ($nn),Y
    [245],    # SBC $nn,X
    [246],    # INC $nn,X
    [249, 0], # SBC $nnnn,Y
    [249],    # SBC $nnnn,Y
    [253, 0], # SBC $nnnn,X
    [253],    # SBC $nnnn,X
    [254, 0], # INC $nnnn,X
    [254]     # INC $nnnn,X)
)

class DisassemblerTest(unittest.TestCase):
    def _get_disassembler(self, snapshot, asm_lower=False, defb_size=8, defm_size=66, defw_size=1):
        return Disassembler(snapshot, Config(True, asm_lower, defb_size, defm_size, defw_size))

    def test_disassemble(self):
        snapshot = [0] * 65536
        disassembler = self._get_disassembler(snapshot)
        for hex_bytes, ops in ASM.items():
            snapshot[32768:32771] = [int(hex_bytes[i:i + 2], 16) for i in range(0, 6, 2)]
            instructions = disassembler.disassemble(32768, 32771, 'n')
            operations = tuple([i[1] for i in instructions])
            self.assertEqual(ops, operations)

    def test_disassemble_lower_case(self):
        snapshot = [0] * 65536
        disassembler = self._get_disassembler(snapshot, asm_lower=True)
        for hex_bytes, ops in ASM.items():
            snapshot[32768:32771] = [int(hex_bytes[i:i + 2], 16) for i in range(0, 6, 2)]
            instructions = disassembler.disassemble(32768, 32771, 'n')
            operations = tuple([i[1] for i in instructions])
            self.assertEqual(tuple(op.lower() for op in ops), operations)

    def test_disassemble_at_64k_boundary(self):
        snapshot = [0] * 65536
        disassembler = self._get_disassembler(snapshot)
        for data in BOUNDARY_OPS:
            address = 65536 - len(data)
            snapshot[address:] = data
            operation = disassembler.disassemble(address, 65536, 'n')[0][1]
            exp_op = '.BYTE ' + ','.join('${:02X}'.format(b) for b in data)
            self.assertEqual(operation, exp_op)

    def test_defb_range_short(self):
        snapshot = [1, 2, 3] + [0] * 65533
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defb_range(0, 3, ((0, 'n'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.BYTE $01,$02,$03', [1, 2, 3]), instructions[0])

    def test_defb_range_long(self):
        snapshot = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] + [0] * 65526
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defb_range(0, 10, ((0, 'n'),))
        self.assertEqual(len(instructions), 2)
        self.assertEqual((0, '.BYTE $01,$02,$03,$04,$05,$06,$07,$08', [1, 2, 3, 4, 5, 6, 7, 8]), instructions[0])
        self.assertEqual((8, '.BYTE $09,$0A', [9, 10]), instructions[1])

    def test_defm_range(self):
        snapshot = [65, 66, 67] + [0] * 65533
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defm_range(0, 3, ((0, 'c'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.BYTE "ABC"', [65, 66, 67]), instructions[0])

    def test_defm_range_with_escaped_characters(self):
        snapshot = [34, 72, 101, 108, 108, 111, 34, 67, 58, 92, 84, 69, 77, 80] + [0] * 65522
        disassembler = self._get_disassembler(snapshot)
        instruction = disassembler.defm_range(0, 7, ((0, 'c'),))[0]
        self.assertEqual(instruction[1], r'.BYTE "\"Hello\""')
        instruction = disassembler.defm_range(7, 14, ((0, 'c'),))[0]
        self.assertEqual(instruction[1], r'.BYTE "C:\\TEMP"')
        instruction = disassembler.defm_range(9, 10, ((1, 'c'),))[0]
        self.assertEqual(instruction[1], r'.BYTE "\\"')

    def test_defm_range_with_inverted_character(self):
        snapshot = [65, 194] + [0] * 65534
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defm_range(0, 2, ((1, 'c'), (1, 'c')))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.BYTE "A","B"+$80', [65, 194]), instructions[0])

    def test_defs_range(self):
        snapshot = [0] * 65536
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defs_range(0, 3, ((0, 'n'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.FILL $03', [0, 0, 0]), instructions[0])

    def test_defs_range_with_non_zero_values(self):
        snapshot = [1, 1, 1] + [0] * 65533
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defs_range(0, 3, ((0, 'n'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.FILL $03,$01', [1, 1, 1]), instructions[0])

    def test_defs_range_with_value_base(self):
        snapshot = [1, 1, 1] + [0] * 65533
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defs_range(0, 3, ((0, 'n'), (0, 'd')))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.FILL $03,1', [1, 1, 1]), instructions[0])

    def test_defs_range_with_multiple_byte_values(self):
        snapshot = [1, 2, 3] + [0] * 65533
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defs_range(0, 3, ((0, 'n'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.BYTE $01,$02,$03', [1, 2, 3]), instructions[0])

    def test_defw_range(self):
        snapshot = [1, 1, 2, 2] + [0] * 65532
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defw_range(0, 4, ((0, 'n'),))
        self.assertEqual(len(instructions), 2)
        self.assertEqual((0, '.WORD $0101', [1, 1]), instructions[0])
        self.assertEqual((2, '.WORD $0202', [2, 2]), instructions[1])

    def test_defw_range_with_size(self):
        snapshot = [1, 1, 2, 2] + [0] * 65532
        disassembler = self._get_disassembler(snapshot)
        instructions = disassembler.defw_range(0, 4, ((4, 'n'),))
        self.assertEqual(len(instructions), 1)
        self.assertEqual((0, '.WORD $0101,$0202', [1, 1, 2, 2]), instructions[0])

    def test_defw_range_with_defw_size(self):
        snapshot = [1, 1, 2, 2, 3, 3] + [0] * 65530
        disassembler = self._get_disassembler(snapshot, defw_size=2)
        instructions = disassembler.defw_range(0, 6, ((0, 'n'),))
        self.assertEqual(len(instructions), 2)
        self.assertEqual((0, '.WORD $0101,$0202', [1, 1, 2, 2]), instructions[0])
        self.assertEqual((4, '.WORD $0303', [3, 3]), instructions[1])

if __name__ == '__main__':
    unittest.main()
