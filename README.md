sk6502
======
[SkoolKit](https://github.com/skoolkid/skoolkit) components for MOS 6502
disassembly. SkoolKit 8.0+ is required.

What's done
-----------
* Assembler (for converting skool files into binary files)
* Disassembler (for converting binary files into skool files)
* Skool reference calculator (for converting address operands into hyperlinks)
* Label substitution (when converting a skool file to ASM or HTML)
* Case conversion (when converting a skool file to ASM or HTML)
* Control directive composer (for converting skool files into control files)
* Control file generator (for identifying code and data in memory dumps)

In short, you can create a cross-referenced HTML disassembly and
assembler-ready source file right now.

What's left to do
-----------------
* Base conversion (when converting a skool file to ASM or HTML)
* Control file generator with code map support
* Snapshot reader (for extracting memory dumps from emulator snapshot files)

Note that the stock SkoolKit snapshot reader can be used to read binary (raw
memory) files, so the lack of a custom snapshot reader is not a showstopper.

Base conversion (to decimal) might not be worth implementing. 6502 assemblers
seem to rely on the number of digits in a hexadecimal operand to distinguish
instructions, e.g. `INC $01` (zeropage) v. `INC $0001` (absolute).
