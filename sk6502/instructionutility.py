from collections import defaultdict
import re

from skoolkit.components import get_component
from sk6502.assembler import get_size

def get_address(operation):
    search = re.search('(\A|[\s,(+-])(\$[0-9A-Fa-f]+|%[01]+|\d+)', operation)
    if search:
        return search.group(2)

def convert_case(operation, lower):
    i = 0
    converted = ''
    convert = True
    while i < len(operation):
        c = operation[i]
        if c == '"':
            convert = not convert
            converted += c
        elif c == '\\' and not convert:
            converted += operation[i:i + 2]
            i += 1
        elif not convert:
            converted += c
        elif lower:
            converted += c.lower()
        else:
            converted += c.upper()
        i += 1
    return converted

class InstructionUtility:
    def calculate_references(self, entries, remote_entries):
        references = {}
        referrers = defaultdict(set)
        instructions = {i.address: (i, e) for e in remote_entries + entries for i in e.instructions}
        op_evaluator = get_component('OperandEvaluator')
        for entry in entries:
            for instruction in entry.instructions:
                operation = instruction.operation.upper()
                if operation.startswith(('BC', 'BEQ', 'BMI', 'BNE', 'BPL', 'BV', 'J', '.WORD')):
                    addr_str = get_address(instruction.operation)
                    if addr_str:
                        address = op_evaluator.eval_int(addr_str)
                        if instruction.keep is None or (instruction.keep and address not in instruction.keep):
                            ref_i, ref_e = instructions.get(address, (None, None))
                            if ref_i and ref_e.ctl != 'i' and (ref_e.ctl == 'c' or operation.startswith(('JMP (', '.WORD')) or ref_e.ctl is None):
                                references[instruction] = (ref_i, addr_str, True)
                                referrers[ref_i].add(entry)
        return references, referrers

    def convert(self, entries, base, case):
        if case:
            for entry in entries:
                for instruction in entry.instructions:
                    instruction.operation = convert_case(instruction.operation, case == 1)

    def set_byte_values(self, instruction, assemble):
        is_def = instruction.operation.upper().startswith('.')
        return int(assemble > 1 or (assemble and is_def)) + int(assemble > 1 and not is_def)

    def substitute_labels(self, entries, remote_entries, labels, warn):
        self.remote_entries = remote_entries
        self.labels = labels
        self.warn = warn
        self.instructions = {i.address: (i, e, labels.get(i.address)) for e in entries for i in e.instructions if i.address is not None}
        self.remote_instructions = [i.address for e in remote_entries for i in e.instructions]
        self.base_address = min(self.instructions)
        last_i = self.instructions[max(self.instructions)][0]
        self.end_address = last_i.address + (get_size(last_i.operation, last_i.address) or 1)
        self.op_evaluator = get_component('OperandEvaluator')

        for entry in entries:
            for instruction in entry.instructions:
                if instruction.keep is None or instruction.keep:
                    operation = instruction.operation
                    if operation.upper().startswith(('.BYTE', '.WORD')):
                        operands = [self._replace_addresses(entry, instruction, op) for op in self.op_evaluator.split_operands(operation[5:])]
                        instruction.operation = operation[:6] + ','.join(operands)
                    elif not operation.upper().startswith('.FILL'):
                        instruction.operation = self._replace_addresses(entry, instruction, operation)

    def _replace_addresses(self, entry, instruction, operand):
        rep = ''
        for p in re.split(r'("(?:[^"\\]|\\.)*")', operand):
            if p:
                if not p.startswith('"'):
                    pieces = re.split('(\A|(?<=[\s,(+-]))(\$[0-9A-Fa-f]+|%[01]+|\d+)', p)
                    for i in range(2, len(pieces), 3):
                        label = self._get_label(entry, instruction, pieces[i])
                        if label:
                            pieces[i] = label
                    p = ''.join(pieces)
                rep += p
        return rep

    def _get_label(self, entry, instruction, addr_str):
        address = self.op_evaluator.eval_int(addr_str)
        if instruction.keep and address in instruction.keep:
            return
        ref_i, ref_e, ref_l = self.instructions.get(address, (None, None, None))
        if ref_i:
            if ref_l:
                if ref_e.ctl == 'c' and instruction.operation.upper().startswith('LD'):
                    # Don't replace a LD operand with a routine label
                    return
                return ref_l
            if entry.ctl == 'c':
                # Warn if we cannot find a label to replace the operand of this
                # routine instruction (will need @nowarn if this is OK)
                self.warn('Found no label for operand: {address} {operation}', instruction, True)
        elif address in self.labels:
            return self.labels[address]
        elif address not in self.remote_instructions and self.base_address <= address < self.end_address:
            # Warn if the operand is inside the address range of the
            # disassembly (where code might be) but doesn't refer to the
            # address of an instruction (will need @nowarn if this is OK)
            self.warn('Unreplaced operand: {address} {operation}', instruction, min_mode=2)
