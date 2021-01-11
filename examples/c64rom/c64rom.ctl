; SkoolKit control file for the Commodore 64 BASIC and KERNAL ROMs.
;
; Annotations derived from The almost completely commented C64 ROM disassembly,
; V1.01, by Lee Davison, 2012.
;
; First install SkoolKit, and copy the 'sk6502' directory (which contains the
; SkoolKit components for MOS 6502 disassembly), skoolkit.ini and templates.ini
; into the current directory alongside this control file (c64rom.ctl) and
; c64rom.ref.
;
; Next, obtain a 24K memory dump with the C64 BASIC ROM in the first 8K and the
; C64 KERNAL ROM in the last 8K; name it c64rom.bin. Then build a skool file:
;
; $ sna2skool.py -I ListRefs=2 c64rom.bin > c64rom.skool
;
; To convert the skool file into an HTML disassembly:
;
; $ skool2html.py c64rom.skool
;
; To convert the skool file into an assembly language source file:
;
; $ skool2asm.py -c c64rom.skool > c64rom.asm
;
; To convert the skool file back into a memory dump:
;
; $ skool2bin.py c64rom.skool c64rom-new.bin

@ $A000 start
@ $A000 replace=/#action/#R(1+#PEEK(#PC)+256*#PEEK(1+#PC))
@ $A000 replace=/`([AXY]+)`/#REG(\1)
@ $A000 replace=/#us/#CHR($03bc)s
@ $A000 org
@ $A000 assemble=2

b $A000 start of the BASIC ROM
W $A000,2 BASIC cold start entry point
W $A002,2 BASIC warm start entry point
T $A004,8 ROM name, unreferenced

w $A00C action addresses for primary commands
D $A00C these are called by pushing the address onto the stack and doing an RTS so the actual address -1 needs to be pushed
  $A00C $80: perform #action(END)
  $A00E $81: perform #action(FOR)
  $A010 $82: perform #action(NEXT)
  $A012 $83: perform #action(DATA)
@ $A014 keep
  $A014 $84: perform #action(INPUT#)
@ $A016 keep
  $A016 $85: perform #action(INPUT)
  $A018 $86: perform #action(DIM)
  $A01A $87: perform #action(READ)
  $A01C $88: perform #action(LET)
  $A01E $89: perform #action(GOTO)
@ $A020 keep
  $A020 $8A: perform #action(RUN)
  $A022 $8B: perform #action(IF)
  $A024 $8C: perform #action(RESTORE)
  $A026 $8D: perform #action(GOSUB)
@ $A028 keep
  $A028 $8E: perform #action(RETURN)
  $A02A $8F: perform #action(REM)
  $A02C $90: perform #action(STOP)
  $A02E $91: perform #action(ON)
@ $A030 keep
  $A030 $92: perform #action(WAIT)
@ $A032 keep
  $A032 $93: perform #action(LOAD)
@ $A034 keep
  $A034 $94: perform #action(SAVE)
@ $A036 keep
  $A036 $95: perform #action(VERIFY)
  $A038 $96: perform #action(DEF)
  $A03A $97: perform #action(POKE)
@ $A03C keep
  $A03C $98: perform #action(PRINT#)
  $A03E $99: perform #action(PRINT)
  $A040 $9A: perform #action(CONT)
@ $A042 keep
  $A042 $9B: perform #action(LIST)
  $A044 $9C: perform #action(CLR)
  $A046 $9D: perform #action(CMD)
@ $A048 keep
  $A048 $9E: perform #action(SYS)
  $A04A $9F: perform #action(OPEN)
@ $A04C keep
  $A04C $A0: perform #action(CLOSE)
@ $A04E keep
  $A04E $A1: perform #action(GET)
@ $A050 keep
  $A050 $A2: perform #action(NEW)

w $A052 action addresses for functions
  $A052 $B4: perform SGN
  $A054 $B5: perform INT
  $A056 $B6: perform ABS
  $A058 $B7: perform USR
  $A05A $B8: perform FRE
  $A05C $B9: perform POS
  $A05E $BA: perform SQR
  $A060 $BB: perform RND
  $A062 $BC: perform LOG
  $A064 $BD: perform EXP
  $A066 $BE: perform COS
  $A068 $BF: perform SIN
  $A06A $C0: perform TAN
  $A06C $C1: perform ATN
  $A06E $C2: perform PEEK
  $A070 $C3: perform LEN
  $A072 $C4: perform STR$
  $A074 $C5: perform VAL
  $A076 $C6: perform ASC
  $A078 $C7: perform CHR$
  $A07A $C8: perform LEFT$
  $A07C $C9: perform RIGHT$
  $A07E $CA: perform MID$

b $A080 precedence byte and action addresses for operators
D $A080 like the #R$A00C(primary commands) these are called by pushing the address onto the stack and doing an RTS, so again the actual address -1 needs to be pushed
@ $A081 label=PC_BASE
W $A081,2 #action(+)
W $A084,2 #action(-)
W $A087,2 #action(*)
W $A08A,2 #action(/)
W $A08D,2 #action(^)
@ $A090 keep
W $A090,2 #action(AND)
W $A093,2 #action(OR)
W $A096,2 #action(>)
W $A099,2 #action(=)
W $A09C,2 #action(<)

t $A09E BASIC keywords
D $A09E each word has b7 set in its last character as an end marker, even the one character keywords such as "<" or "="
D $A09E first are the primary command keywords, only these can start a statement
  $A09E,3,2:1 $80: END
  $A0A1,3,2:1 $81: FOR
  $A0A4,4,3:1 $82: NEXT
  $A0A8,4,3:1 $83: DATA
  $A0AC,6,5:1 $84: INPUT#
  $A0B2,5,4:1 $85: INPUT
  $A0B7,3,2:1 $86: DIM
  $A0BA,4,3:1 $87: READ
  $A0BE,3,2:1 $88: LET
  $A0C1,4,3:1 $89: GOTO
  $A0C5,3,2:1 $8A: RUN
  $A0C8,2,1:1 $8B: IF
  $A0CA,7,6:1 $8C: RESTORE
  $A0D1,5,4:1 $8D: GOSUB
  $A0D6,6,5:1 $8E: RETURN
  $A0DC,3,2:1 $8F: REM
  $A0DF,4,3:1 $90: STOP
  $A0E3,2,1:1 $91: ON
  $A0E5,4,3:1 $92: WAIT
  $A0E9,4,3:1 $93: LOAD
  $A0ED,4,3:1 $94: SAVE
  $A0F1,6,5:1 $95: VERIFY
  $A0F7,3,2:1 $96: DEF
  $A0FA,4,3:1 $97: POKE
  $A0FE,6,5:1 $98: PRINT#
  $A104,5,4:1 $99: PRINT
  $A109,4,3:1 $9A: CONT
  $A10D,4,3:1 $9B: LIST
  $A111,3,2:1 $9C: CLR
  $A114,3,2:1 $9D: CMD
  $A117,3,2:1 $9E: SYS
  $A11A,4,3:1 $9F: OPEN
  $A11E,5,4:1 $A0: CLOSE
  $A123,3,2:1 $A1: GET
  $A126,3,2:1 $A2: NEW
N $A129 next are the secondary command keywords, these can not start a statement
  $A129,4,3:1 $A3: TAB(
  $A12D,2,1:1 $A4: TO
  $A12F,2,1:1 $A5: FN
  $A131,4,3:1 $A6: SPC(
  $A135,4,3:1 $A7: THEN
  $A139,3,2:1 $A8: NOT
  $A13C,4,3:1 $A9: STEP
N $A140 next are the operators
  $A140,1 $AA: +
  $A141,1 $AB: -
  $A142,1 $AC: *
  $A143,1 $AD: /
  $A144,1 $AE: ^
  $A145,3,2:1 $AF: AND
  $A148,2,1:1 $B0: OR
  $A14A,1 $B1: >
  $A14B,1 $B2: =
  $A14C,1 $B3: <
N $A14D and finally the functions
  $A14D,3,2:1 $B4: SGN
  $A150,3,2:1 $B5: INT
  $A153,3,2:1 $B6: ABS
  $A156,3,2:1 $B7: USR
  $A159,3,2:1 $B8: FRE
  $A15C,3,2:1 $B9: POS
  $A15F,3,2:1 $BA: SQR
  $A162,3,2:1 $BB: RND
  $A165,3,2:1 $BC: LOG
  $A168,3,2:1 $BD: EXP
  $A16B,3,2:1 $BE: COS
  $A16E,3,2:1 $BF: SIN
  $A171,3,2:1 $C0: TAN
  $A174,3,2:1 $C1: ATN
  $A177,4,3:1 $C2: PEEK
  $A17B,3,2:1 $C3: LEN
  $A17E,4,3:1 $C4: STR$
  $A182,3,2:1 $C5: VAL
  $A185,3,2:1 $C6: ASC
  $A188,4,3:1 $C7: CHR$
  $A18C,5,4:1 $C8: LEFT$
  $A191,6,5:1 $C9: RIGHT$
  $A197,4,3:1 $CA: MID$
N $A19B lastly is GO, this is an add on so that GO TO, as well as GOTO, will work
  $A19B,2,1:1 $CB: GO
B $A19D,1 end marker

t $A19E BASIC error messages
  $A19E,14,13:1
  $A1AC,9,8:1
  $A1B5,13,12:1
  $A1C2,14,13:1
  $A1D0,18,17:1
  $A1E2,14,13:1
  $A1F0,15,14:1
  $A1FF,17,16:1
  $A210,21,20:1
  $A225,16,15:1
  $A235,6,5:1
  $A23B,20,19:1
  $A24F,11,10:1
  $A25A,16,15:1
  $A26A,8,7:1
  $A272,13,12:1
  $A27F,17,16:1
  $A290,13,12:1
  $A29D,13,12:1
  $A2AA,16,15:1
  $A2BA,14,13:1
  $A2C8,13,12:1
  $A2D5,15,14:1
  $A2E4,9,8:1
  $A2ED,19,18:1
  $A300,14,13:1
  $A30E,16,15:1
  $A31E,6,5:1
  $A324,4,3:1

w $A328 error message pointer table
  $A328 $01: TOO MANY FILES
  $A32A $02: FILE OPEN
  $A32C $03: FILE NOT OPEN
  $A32E $04: FILE NOT FOUND
  $A330 $05: DEVICE NOT PRESENT
  $A332 $06: NOT INPUT FILE
  $A334 $07: NOT OUTPUT FILE
  $A336 $08: MISSING FILE NAME
  $A338 $09: ILLEGAL DEVICE NUMBER
  $A33A $0A: NEXT WITHOUT FOR
  $A33C $0B: SYNTAX
  $A33E $0C: RETURN WITHOUT GOSUB
  $A340 $0D: OUT OF DATA
  $A342 $0E: ILLEGAL QUANTITY
  $A344 $0F: OVERFLOW
  $A346 $10: OUT OF MEMORY
  $A348 $11: UNDEF'D STATEMENT
  $A34A $12: BAD SUBSCRIPT
  $A34C $13: REDIM'D ARRAY
  $A34E $14: DIVISION BY ZERO
  $A350 $15: ILLEGAL DIRECT
  $A352 $16: TYPE MISMATCH
  $A354 $17: STRING TOO LONG
  $A356 $18: FILE DATA
  $A358 $19: FORMULA TOO COMPLEX
  $A35A $1A: CAN'T CONTINUE
  $A35C $1B: UNDEF'D FUNCTION
  $A35E $1C: VERIFY
  $A360 $1D: LOAD
  $A362 $1E: BREAK

t $A364 BASIC messages
B $A364,5,1:c2:2
B $A369,8,c7:1
B $A371,5,c4:1
B $A376,11,2:c6:3
B $A381,2,2
B $A383,6,c5:1

u $A389 spare byte, not referenced

c $A38A search the stack for FOR or GOSUB activity
D $A38A return Zb=1 if FOR variable found
  $A38A copy stack pointer
  $A38B +1 pass return address
  $A38C +2 pass return address
  $A38D +3 pass calling routine return address
  $A38E +4 pass calling routine return address
  $A38F get the token byte from the stack
  $A392 is it the FOR token
  $A394 if not FOR token just exit
N $A396 it was the FOR token
  $A396 get FOR/NEXT variable pointer high byte
  $A398 branch if not null
  $A39A get FOR variable pointer low byte
  $A39D save FOR/NEXT variable pointer low byte
  $A39F get FOR variable pointer high byte
  $A3A2 save FOR/NEXT variable pointer high byte
  $A3A4 compare variable pointer with stacked variable pointer high byte
  $A3A7 branch if no match
  $A3A9 get FOR/NEXT variable pointer low byte
  $A3AB compare variable pointer with stacked variable pointer low byte
  $A3AE exit if match found
  $A3B0 copy index
  $A3B1 clear carry for add
  $A3B2 add FOR stack use size
  $A3B4 copy back to index
  $A3B5 loop if not at start of stack
  $A3B7

c $A3B8 open up a space in the memory, set the end of arrays
  $A3B8 check available memory, do out of memory error if no room
  $A3BB set end of arrays low byte
  $A3BD set end of arrays high byte
N $A3BF open up a space in the memory, don't set the array end
  $A3BF set carry for subtract
  $A3C0 get block end low byte
  $A3C2 subtract block start low byte
  $A3C4 save MOD(block length/$100) byte
  $A3C6 copy MOD(block length/$100) byte to `Y`
  $A3C7 get block end high byte
  $A3C9 subtract block start high byte
  $A3CB copy block length high byte to `X`
  $A3CC +1 to allow for count=0 exit
  $A3CD copy block length low byte to `A`
  $A3CE branch if length low byte=0
N $A3D0 block is (`X`-1)*256+`Y` bytes, do the `Y` bytes first
  $A3D0 get block end low byte
  $A3D2 set carry for subtract
  $A3D3 subtract MOD(block length/$100) byte
  $A3D5 save corrected old block end low byte
  $A3D7 branch if no underflow
  $A3D9 else decrement block end high byte
  $A3DB set carry for subtract
  $A3DC get destination end low byte
  $A3DE subtract MOD(block length/$100) byte
  $A3E0 save modified new block end low byte
  $A3E2 branch if no underflow
  $A3E4 else decrement block end high byte
  $A3E6 branch always
  $A3E8 get byte from source
  $A3EA copy byte to destination
  $A3EC decrement index
  $A3ED loop until `Y`=0
N $A3EF now do `Y`=0 indexed byte
  $A3EF get byte from source
  $A3F1 save byte to destination
  $A3F3 decrement source pointer high byte
  $A3F5 decrement destination pointer high byte
  $A3F7 decrement block count
  $A3F8 loop until count = $0
  $A3FA

c $A3FB check room on stack for `A` bytes
D $A3FB if stack too deep do out of memory error
  $A3FB *2
  $A3FC need at least $3E bytes free
  $A3FE if overflow go do out of memory error then warm start
  $A400 save result in temp byte
  $A402 copy stack
  $A403 compare new limit with stack
  $A405 if stack < limit do out of memory error then warm start
  $A407

c $A408 check available memory, do out of memory error if no room
  $A408 compare with bottom of string space high byte
  $A40A if less then exit (is ok)
  $A40C skip next test if greater (tested <)
N $A40E high byte was =, now do low byte
  $A40E compare with bottom of string space low byte
  $A410 if less then exit (is ok)
N $A412 address is > string storage ptr (oops!)
  $A412 push address low byte
  $A413 set index to save $57 to $60 inclusive
  $A415 copy address high byte (to push on stack)
N $A416 save misc numeric work area
  $A416 push byte
  $A417 get byte from $57 to $60
  $A419 decrement index
  $A41A loop until all done
  $A41C do garbage collection routine
N $A41F restore misc numeric work area
  $A41F set index to restore bytes
  $A421 pop byte
  $A422 save byte to $57 to $60
  $A424 increment index
  $A425 loop while -ve
  $A427 pop address high byte
  $A428 copy back to `Y`
  $A429 pop address low byte
  $A42A compare with bottom of string space high byte
  $A42C if less then exit (is ok)
  $A42E if greater do out of memory error then warm start
N $A430 high byte was =, now do low byte
  $A430 compare with bottom of string space low byte
  $A432 if >= do out of memory error then warm start
N $A434 ok exit, carry clear
  $A434

c $A435 do out of memory error then warm start
  $A435 error code $10, out of memory error
N $A437 do error #`X` then warm start
  $A437 do error message

c $A43A do error #`X` then warm start
D $A43A the error message vector is initialised to point here
  $A43A copy error number
  $A43B *2
  $A43C copy to index
  $A43D get error message pointer low byte
  $A440 save it
  $A442 get error message pointer high byte
  $A445 save it
  $A447 close input and output channels
  $A44A clear `A`
  $A44C clear current I/O channel, flag default
  $A44E print CR/LF
  $A451 print "?"
  $A454 clear index
  $A456 get byte from message
  $A458 save status
  $A459,b mask 0xxx xxxx, clear b7
  $A45B output character
  $A45E increment index
  $A45F restore status
  $A460 loop if character was not end marker
  $A462 flush BASIC stack and clear continue pointer
  $A465 set " ERROR" pointer low byte
  $A467 set " ERROR" pointer high byte

c $A469 print string and do warm start, break entry
  $A469 print null terminated string
  $A46C get current line number high byte
  $A46E increment it
  $A46F branch if was in immediate mode
  $A471 do " IN " line number message

c $A474 do warm start
  $A474 set "READY." pointer low byte
  $A476 set "READY." pointer high byte
  $A478 print null terminated string
  $A47B set for control messages only
  $A47D control kernal messages
  $A480 do BASIC warm start

c $A483 BASIC warm start
D $A483 the warm start vector is initialised to point here
  $A483 call for BASIC input
  $A486 save BASIC execute pointer low byte
  $A488 save BASIC execute pointer high byte
  $A48A increment and scan memory
  $A48D copy byte to set flags
  $A48E loop if no input
N $A490 got to interpret the input line now ....
  $A490 current line high byte to -1, indicates immediate mode
  $A492 set current line number high byte
  $A494 if numeric character go handle new BASIC line
N $A496 no line number .. immediate mode
  $A496 crunch keywords into BASIC tokens
  $A499 go scan and interpret code

c $A49C handle new BASIC line
  $A49C get fixed-point number into temporary integer
  $A49F crunch keywords into BASIC tokens
  $A4A2 save index pointer to end of crunched line
  $A4A4 search BASIC for temporary integer line number
  $A4A7 if not found skip the line delete
N $A4A9 line # already exists so delete it
  $A4A9 set index to next line pointer high byte
  $A4AB get next line pointer high byte
  $A4AD save it
  $A4AF get start of variables low byte
  $A4B1 save it
  $A4B3 get found line pointer high byte
  $A4B5 save it
  $A4B7 get found line pointer low byte
  $A4B9 decrement index
  $A4BA subtract next line pointer low byte
  $A4BC clear carry for add
  $A4BD add start of variables low byte
  $A4BF set start of variables low byte
  $A4C1 save destination pointer low byte
  $A4C3 get start of variables high byte
  $A4C5 -1 + carry
  $A4C7 set start of variables high byte
  $A4C9 subtract found line pointer high byte
  $A4CB copy to block count
  $A4CC set carry for subtract
  $A4CD get found line pointer low byte
  $A4CF subtract start of variables low byte
  $A4D1 copy to bytes in first block count
  $A4D2 branch if no underflow
  $A4D4 increment block count, correct for = 0 loop exit
  $A4D5 decrement destination high byte
  $A4D7 clear carry for add
  $A4D8 add source pointer low byte
  $A4DA branch if no overflow
  $A4DC else decrement source pointer high byte
  $A4DE clear carry
N $A4DF close up memory to delete old line
  $A4DF get byte from source
  $A4E1 copy to destination
  $A4E3 increment index
  $A4E4 while <> 0 do this block
  $A4E6 increment source pointer high byte
  $A4E8 increment destination pointer high byte
  $A4EA decrement block count
  $A4EB loop until all done
N $A4ED got new line in buffer and no existing same #
  $A4ED reset execution to start, clear variables, flush stack and return
  $A4F0 rebuild BASIC line chaining
  $A4F3 get first byte from buffer
  $A4F6 if no line go do BASIC warm start
N $A4F8 else insert line into memory
  $A4F8 clear carry for add
  $A4F9 get start of variables low byte
  $A4FB save as source end pointer low byte
  $A4FD add index pointer to end of crunched line
  $A4FF save as destination end pointer low byte
  $A501 get start of variables high byte
  $A503 save as source end pointer high byte
  $A505 branch if no carry to high byte
  $A507 else increment high byte
  $A508 save as destination end pointer high byte
  $A50A open up space in memory
N $A50D most of what remains to do is copy the crunched line into the space opened up in memory, however, before the crunched line comes the next line pointer and the line number. the line number is retrieved from the temporary integer and stored in memory, this overwrites the bottom two bytes on the stack. next the line is copied and the next line pointer is filled with whatever was in two bytes above the line number in the stack. this is ok because the line pointer gets fixed in the line chain re-build.
  $A50D get line number low byte
  $A50F get line number high byte
  $A511 save line number low byte before crunched line
  $A514 save line number high byte before crunched line
  $A517 get end of arrays low byte
  $A519 get end of arrays high byte
  $A51B set start of variables low byte
  $A51D set start of variables high byte
  $A51F get index to end of crunched line
  $A521 -1
  $A522 get byte from crunched line
  $A525 save byte to memory
  $A527 decrement index
  $A528 loop while more to do
N $A52A reset execution, clear variables, flush stack, rebuild BASIC chain and do warm start
  $A52A reset execution to start, clear variables and flush stack
  $A52D rebuild BASIC line chaining
  $A530 go do BASIC warm start

c $A533 rebuild BASIC line chaining
  $A533 get start of memory low byte
  $A535 get start of memory high byte
  $A537 set line start pointer low byte
  $A539 set line start pointer high byte
  $A53B clear carry for add
  $A53C set index to pointer to next line high byte
  $A53E get pointer to next line high byte
  $A540 exit if null, [EOT]
  $A542 point to first code byte of line
N $A544 there is always 1 byte + [EOL] as null entries are deleted
  $A544 next code byte
  $A545 get byte
  $A547 loop if not [EOL]
  $A549 point to byte past [EOL], start of next line
  $A54A copy it
  $A54B add line start pointer low byte
  $A54D copy to `X`
  $A54E clear index, point to this line's next line pointer
  $A550 set next line pointer low byte
  $A552 get line start pointer high byte
  $A554 add any overflow
  $A556 increment index to high byte
  $A557 set next line pointer high byte
  $A559 set line start pointer low byte
  $A55B set line start pointer high byte
  $A55D go do next line, branch always
  $A55F

c $A560 call for BASIC input
  $A560 set channel $00, keyboard
  $A562 input character from channel with error check
  $A565 compare with [CR]
  $A567 if [CR] set `XY` to $200 - 1, print [CR] and exit
N $A569 character was not [CR]
  $A569 save character to buffer
  $A56C increment buffer index
  $A56D compare with max+1
  $A56F branch if < max+1
  $A571 error $17, string too long error
  $A573 do error #`X` then warm start
  $A576 set `XY` to $200 - 1 and print [CR]

c $A579 crunch BASIC tokens vector
  $A579 do crunch BASIC tokens

c $A57C crunch BASIC tokens
D $A57C the crunch BASIC tokens vector is initialised to point here
  $A57C get BASIC execute pointer low byte
  $A57E set save index
  $A580 clear open quote/DATA flag
  $A582 get a byte from the input buffer
  $A585 if b7 clear go do crunching
  $A587 compare with the token for PI, this token is input directly from the keyboard as the PI character
  $A589 if PI save byte then continue crunching
N $A58B this is the bit of code that stops you being able to enter some keywords as just single shifted characters. If this dropped through you would be able to enter GOTO as just [SHIFT]G
  $A58B increment read index
  $A58C loop if more to do, branch always
  $A58E,c compare with [SPACE]
  $A590 if [SPACE] save byte then continue crunching
  $A592 save buffer byte as search character
  $A594 compare with quote character
  $A596 if quote go copy quoted string
  $A598 get open quote/DATA token flag
  $A59A branch if b6 of quote set, was DATA
N $A59C go save byte then continue crunching
  $A59C,2 compare with "?" character
  $A59E if not "?" continue crunching
  $A5A0 else the keyword token is $99, PRINT
  $A5A2 go save byte then continue crunching, branch always
  $A5A4,c compare with "0"
  $A5A6 branch if <, continue crunching
  $A5A8,c compare with "<"
  $A5AA if <, 0123456789:; go save byte then continue crunching
N $A5AC gets here with next character not numeric, ";" or ":"
  $A5AC copy save index
  $A5AE clear table pointer
  $A5B0 clear word index
  $A5B2 adjust for pre increment loop
  $A5B3 save BASIC execute pointer low byte, buffer index
  $A5B5 adjust for pre increment loop
  $A5B6 next table byte
  $A5B7 next buffer byte
  $A5B8 get byte from input buffer
  $A5BB set carry for subtract
  $A5BC subtract table byte
  $A5BF go compare next if match
  $A5C1 was it end marker match ?
  $A5C3 branch if not, not found keyword; actually this works even if the input buffer byte is the end marker, i.e. a shifted character. As you can't enter any keywords as a single shifted character, see above, you can enter keywords in shorthand by shifting any character after the first. so RETURN can be entered as R[SHIFT]E, RE[SHIFT]T, RET[SHIFT]U or RETU[SHIFT]R. RETUR[SHIFT]N however will not work because the [SHIFT]N will match the RETURN end marker so the routine will try to match the next character.
N $A5C5 else found keyword
  $A5C5 OR with word index, +$80 in `A` makes token
  $A5C7 restore save index
N $A5C9 save byte then continue crunching
  $A5C9 increment buffer read index
  $A5CA increment save index
  $A5CB save byte to output
  $A5CE get byte from output, set flags
  $A5D1 branch if was null [EOL]
N $A5D3 `A` holds the token here
  $A5D3 set carry for subtract
  $A5D4,c subtract ":"
  $A5D6 branch if it was (is now $00)
N $A5D8 `A` now holds token-':'
  $A5D8 compare with the token for DATA-':'
  $A5DA if not DATA go try REM
N $A5DC token was : or DATA
  $A5DC save the token-$3A
  $A5DE set carry for subtract
  $A5DF subtract the token for REM-':'
  $A5E1 if wasn't REM crunch next bit of line
  $A5E3 else was REM so set search for [EOL]
N $A5E5 loop for "..." etc.
  $A5E5 get byte from input buffer
  $A5E8 if null [EOL] save byte then continue crunching
  $A5EA compare with stored character
  $A5EC if match save byte then continue crunching
  $A5EE increment save index
  $A5EF save byte to output
  $A5F2 increment buffer index
  $A5F3 loop while <> 0, should never reach 0
N $A5F5 not found keyword this go
  $A5F5 restore BASIC execute pointer low byte
  $A5F7 increment word index (next word)
N $A5F9 now find end of this word in the table
  $A5F9 increment table index
  $A5FA get table byte
  $A5FD loop if not end of word yet
  $A5FF get byte from keyword table
  $A602 go test next word if not zero byte, end of table
N $A604 reached end of table with no match
  $A604 restore byte from input buffer
  $A607 branch always, all unmatched bytes in the buffer are $00 to $7F, go save byte in output and continue crunching
N $A609 reached [EOL]
  $A609 save [EOL]
  $A60C decrement BASIC execute pointer high byte
  $A60E point to start of buffer-1
  $A610 set BASIC execute pointer low byte
  $A612

c $A613 search BASIC for temporary integer line number
  $A613 get start of memory low byte
  $A615 get start of memory high byte

c $A617 search Basic for temp integer line number from `AX`
D $A617 returns carry set if found
  $A617 set index to next line pointer high byte
  $A619 save low byte as current
  $A61B save high byte as current
  $A61D get next line pointer high byte from address
  $A61F pointer was zero so done, exit
  $A621 increment index ...
  $A622 ... to line # high byte
  $A623 get temporary integer high byte
  $A625 compare with line # high byte
  $A627 exit if temp < this line, target line passed
  $A629 go check low byte if =
  $A62B else decrement index
  $A62C branch always
  $A62E get temporary integer low byte
  $A630 decrement index to line # low byte
  $A631 compare with line # low byte
  $A633 exit if temp < this line, target line passed
  $A635 exit if temp = (found line#)
N $A637 not quite there yet
  $A637 decrement index to next line pointer high byte
  $A638 get next line pointer high byte
  $A63A copy to `X`
  $A63B decrement index to next line pointer low byte
  $A63C get next line pointer low byte
  $A63E go search for line # in temporary integer from `AX`, carry always set
  $A640 clear found flag
  $A641

c $A642 perform NEW
  $A642 exit if following byte to allow syntax error
  $A644 clear `A`
  $A646 clear index
  $A647 clear pointer to next line low byte
  $A649 increment index
  $A64A clear pointer to next line high byte, erase program
  $A64C get start of memory low byte
  $A64E clear carry for add
  $A64F add null program length
  $A651 set start of variables low byte
  $A653 get start of memory high byte
  $A655 add carry
  $A657 set start of variables high byte

c $A659 reset execute pointer and do CLR
  $A659 set BASIC execute pointer to start of memory - 1
  $A65C set Zb for CLR entry

c $A65E perform CLR
  $A65E exit if following byte to allow syntax error
  $A660 close all channels and files
  $A663 get end of memory low byte
  $A665 get end of memory high byte
  $A667 set bottom of string space low byte, clear strings
  $A669 set bottom of string space high byte
  $A66B get start of variables low byte
  $A66D get start of variables high byte
  $A66F set end of variables low byte, clear variables
  $A671 set end of variables high byte
  $A673 set end of arrays low byte, clear arrays
  $A675 set end of arrays high byte

c $A677 do RESTORE and clear stack
  $A677 perform RESTORE

c $A67A flush BASIC stack and clear the continue pointer
  $A67A get the descriptor stack start
  $A67C set the descriptor stack pointer
  $A67E pull the return address low byte
  $A67F copy it
  $A680 pull the return address high byte
  $A681 set the cleared stack pointer
  $A683 set the stack
  $A684 push the return address high byte
  $A685 restore the return address low byte
  $A686 push the return address low byte
  $A687 clear `A`
  $A689 clear the continue pointer high byte
  $A68B clear the subscript/FNX flag
  $A68D

c $A68E set BASIC execute pointer to start of memory - 1
  $A68E clear carry for add
  $A68F get start of memory low byte
  $A691 add -1 low byte
  $A693 set BASIC execute pointer low byte
  $A695 get start of memory high byte
  $A697 add -1 high byte
  $A699 save BASIC execute pointer high byte
  $A69B

c $A69C perform LIST
  $A69C branch if next character not token (LIST n...)
  $A69E branch if next character [NULL] (LIST)
  $A6A0 compare with token for -
  $A6A2 exit if not - (LIST -m)
N $A6A4 LIST [[n][-m]]; this bit sets the n, if present, as the start and end
  $A6A4 get fixed-point number into temporary integer
  $A6A7 search BASIC for temporary integer line number
  $A6AA scan memory
  $A6AD branch if no more chrs
N $A6AF this bit checks the - is present
  $A6AF compare with token for -
  $A6B1 return if not "-" (will be SN error)
N $A6B3 LIST [n]-m; the - was there so set m as the end value
  $A6B3 increment and scan memory
  $A6B6 get fixed-point number into temporary integer
  $A6B9 exit if not ok
  $A6BB dump return address low byte, exit via warm start
  $A6BC dump return address high byte
  $A6BD get temporary integer low byte
  $A6BF OR temporary integer high byte
  $A6C1 branch if start set
  $A6C3 set for -1
  $A6C5 set temporary integer low byte
  $A6C7 set temporary integer high byte
  $A6C9 set index for line
  $A6CB clear open quote flag
  $A6CD get next line pointer high byte
  $A6CF if null all done so exit
  $A6D1 do CRTL-C check vector
  $A6D4 print CR/LF
  $A6D7 increment index for line
  $A6D8 get line number low byte
  $A6DA copy to `X`
  $A6DB increment index
  $A6DC get line number high byte
  $A6DE compare with temporary integer high byte
  $A6E0 branch if no high byte match
  $A6E2 compare with temporary integer low byte
  $A6E4 branch if = last line to do, < will pass next branch
N $A6E6 else ...
  $A6E6 if greater all done so exit
  $A6E8 save index for line
  $A6EA print `XA` as unsigned integer
  $A6ED,c space is the next character
  $A6EF get index for line
  $A6F1,b mask out top bit of character
  $A6F3 go print the character
  $A6F6 was it " character
  $A6F8 if not skip the quote handle
N $A6FA we are either entering or leaving a pair of quotes
  $A6FA get open quote flag
  $A6FC toggle it
  $A6FE save it back
  $A700 increment index
  $A701 line too long so just bail out and do a warm start
  $A703 get next byte
  $A705 if not [EOL] (go print character)
N $A707 was [EOL]
  $A707 else clear index
  $A708 get next line pointer low byte
  $A70A copy to `X`
  $A70B increment index
  $A70C get next line pointer high byte
  $A70E set pointer to line low byte
  $A710 set pointer to line high byte
  $A712 go do next line if not [EOT]
N $A714 else ...
  $A714 do warm start
  $A717 do uncrunch BASIC tokens

c $A71A uncrunch BASIC tokens
D $A71A the uncrunch BASIC tokens vector is initialised to point here
  $A71A just go print it if not token byte
N $A71C else was token byte so uncrunch it
  $A71C compare with the token for PI. in this case the token is the same as the PI character so it just needs printing
  $A71E just print it if so
  $A720 test the open quote flag
  $A722 just go print character if open quote set
  $A724 else set carry for subtract
  $A725 reduce token range to 1 to whatever
  $A727 copy token # to `X`
  $A728 save index for line
  $A72A start from -1, adjust for pre increment
  $A72C decrement token #
  $A72D if now found go do printing
  $A72F else increment index
  $A730 get byte from keyword table
  $A733 loop until keyword end marker
  $A735 go test if this is required keyword, branch always
N $A737 found keyword, it's the next one
  $A737 increment keyword table index
  $A738 get byte from table
  $A73B go restore index, mask byte and print if byte was end marker
  $A73D else go print the character
  $A740 go get next character, branch always

c $A742 perform FOR
  $A742 set FNX
  $A744 set subscript/FNX flag
  $A746 perform LET
  $A749 search the stack for FOR or GOSUB activity
  $A74C branch if FOR, this variable, not found
N $A74E FOR, this variable, was found so first we dump the old one
  $A74E copy index
  $A74F add FOR structure size-2
  $A751 copy to index
  $A752 set stack (dump FOR structure (-2 bytes))
  $A753 pull return address
  $A754 pull return address
  $A755 we need 18d bytes !
  $A757 check room on stack for 2*A bytes
  $A75A scan for next BASIC statement ([:] or [EOL])
  $A75D clear carry for add
  $A75E copy index to `A`
  $A75F add BASIC execute pointer low byte
  $A761 push onto stack
  $A762 get BASIC execute pointer high byte
  $A764 add carry
  $A766 push onto stack
  $A767 get current line number high byte
  $A769 push onto stack
  $A76A get current line number low byte
  $A76C push onto stack
  $A76D set "TO" token
  $A76F scan for CHR$(`A`), else do syntax error then warm start
  $A772 check if source is numeric, else do type mismatch
  $A775 evaluate expression and check is numeric, else do type mismatch
  $A778 get FAC1 sign (b7)
  $A77A set all non sign bits
  $A77C and FAC1 mantissa 1
  $A77E save FAC1 mantissa 1
  $A780 set return address low byte
  $A782 set return address high byte
  $A784 save return address low byte
  $A786 save return address high byte
  $A788 round FAC1 and put on stack, returns to next instruction
  $A78B set 1 pointer low address, default step size
  $A78D set 1 pointer high address
  $A78F unpack memory (`AY`) into FAC1
  $A792 scan memory
  $A795 compare with STEP token
  $A797 if not "STEP" continue
N $A799 was step so ....
  $A799 increment and scan memory
  $A79C evaluate expression and check is numeric, else do type mismatch
  $A79F get FAC1 sign, return `A` = $FF -ve, `A` = $01 +ve
  $A7A2 push sign, round FAC1 and put on stack
  $A7A5 get FOR/NEXT variable pointer high byte
  $A7A7 push on stack
  $A7A8 get FOR/NEXT variable pointer low byte
  $A7AA push on stack
  $A7AB get FOR token
  $A7AD push on stack

c $A7AE interpreter inner loop
  $A7AE do CRTL-C check vector
  $A7B1 get the BASIC execute pointer low byte
  $A7B3 get the BASIC execute pointer high byte
  $A7B5 compare the high byte with $02xx
  $A7B7 unused byte
  $A7B8 if immediate mode skip the continue pointer save
  $A7BA save the continue pointer low byte
  $A7BC save the continue pointer high byte
  $A7BE clear the index
  $A7C0 get a BASIC byte
  $A7C2 if not [EOL] go test for ":"
  $A7C4 else set the index
  $A7C6 get next line pointer high byte
  $A7C8 clear carry for no "BREAK" message
  $A7C9 branch if not end of program
  $A7CB else go to immediate mode,was immediate or [EOT] marker
  $A7CE increment index
  $A7CF get line number low byte
  $A7D1 save current line number low byte
  $A7D3 increment index
  $A7D4 get line # high byte
  $A7D6 save current line number high byte
  $A7D8 `A` now = 4
  $A7D9 add BASIC execute pointer low byte, now points to code
  $A7DB save BASIC execute pointer low byte
  $A7DD branch if no overflow
  $A7DF else increment BASIC execute pointer high byte
  $A7E1 do start new BASIC code
N $A7E4 the start new BASIC code vector is initialised to point here
  $A7E4 increment and scan memory
  $A7E7 go interpret BASIC code from BASIC execute pointer
  $A7EA loop
N $A7ED interpret BASIC code from BASIC execute pointer
  $A7ED if the first byte is null just exit
  $A7EF normalise the token
  $A7F1 if wasn't token go do LET
  $A7F3 compare with token for TAB(-$80
  $A7F5 branch if >= TAB(
  $A7F7 *2 bytes per vector
  $A7F8 copy to index
  $A7F9 get vector high byte
  $A7FC push on stack
  $A7FD get vector low byte
  $A800 push on stack
  $A801 increment and scan memory and return. the return in this case calls the command code, the return from that will eventually return to the interpreter inner loop above
  $A804 perform LET
N $A807 was not [EOL]
  $A807,c compare with ":"
  $A809 if ":" go execute new code
N $A80B else ...
  $A80B do syntax error then warm start
N $A80E token was >= TAB(
  $A80E compare with the token for GO
  $A810 if not "GO" do syntax error then warm start
N $A812 else was "GO"
  $A812 increment and scan memory
  $A815 set "TO" token
  $A817 scan for CHR$(`A`), else do syntax error then warm start
  $A81A perform GOTO

c $A81D perform RESTORE
  $A81D set carry for subtract
  $A81E get start of memory low byte
  $A820 -1
  $A822 get start of memory high byte
  $A824 branch if no rollunder
  $A826 else decrement high byte
  $A827 set DATA pointer low byte
  $A829 set DATA pointer high byte
  $A82B

c $A82C do CRTL-C check vector
  $A82C scan stop key

c $A82F perform STOP
  $A82F if carry set do BREAK instead of just END

c $A831 perform END
  $A831 clear carry
  $A832 return if wasn't CTRL-C
  $A834 get BASIC execute pointer low byte
  $A836 get BASIC execute pointer high byte
  $A838 get current line number high byte
  $A83A increment it
  $A83B branch if was immediate mode
  $A83D save continue pointer low byte
  $A83F save continue pointer high byte
  $A841 get current line number low byte
  $A843 get current line number high byte
  $A845 save break line number low byte
  $A847 save break line number high byte
  $A849 dump return address low byte
  $A84A dump return address high byte
  $A84B set [CR][LF]"BREAK" pointer low byte
  $A84D set [CR][LF]"BREAK" pointer high byte
  $A84F if was program end skip the print string
  $A851 print string and do warm start
  $A854 do warm start

c $A857 perform CONT
  $A857 exit if following byte to allow syntax error
  $A859 error code $1A, can't continue error
  $A85B get continue pointer high byte
  $A85D go do continue if we can
  $A85F else do error #`X` then warm start
N $A862 we can continue so ...
  $A862 get continue pointer low byte
  $A864 save BASIC execute pointer low byte
  $A866 save BASIC execute pointer high byte
  $A868 get break line low byte
  $A86A get break line high byte
  $A86C set current line number low byte
  $A86E set current line number high byte
  $A870

c $A871 perform RUN
  $A871 save status
  $A872 no control or kernal messages
  $A874 control kernal messages
  $A877 restore status
  $A878 branch if RUN n
  $A87A reset execution to start, clear variables, flush stack and return
  $A87D go do "CLEAR"
  $A880 get n and do GOTO n

c $A883 perform GOSUB
  $A883 need 6 bytes for GOSUB
  $A885 check room on stack for 2*A bytes
  $A888 get BASIC execute pointer high byte
  $A88A save it
  $A88B get BASIC execute pointer low byte
  $A88D save it
  $A88E get current line number high byte
  $A890 save it
  $A891 get current line number low byte
  $A893 save it
  $A894 token for GOSUB
  $A896 save it
  $A897 scan memory
  $A89A perform GOTO
  $A89D go do interpreter inner loop

c $A8A0 perform GOTO
  $A8A0 get fixed-point number into temporary integer
  $A8A3 scan for next BASIC line
  $A8A6 set carry for subtract
  $A8A7 get current line number low byte
  $A8A9 subtract temporary integer low byte
  $A8AB get current line number high byte
  $A8AD subtract temporary integer high byte
  $A8AF if current line number >= temporary integer, go search from the start of memory
  $A8B1 else copy line index to `A`
  $A8B2 set carry (+1)
  $A8B3 add BASIC execute pointer low byte
  $A8B5 get BASIC execute pointer high byte
  $A8B7 branch if no overflow to high byte
  $A8B9 increment high byte
  $A8BA branch always (can never be carry)

c $A8BC search for line number in temporary integer from start of memory pointer
  $A8BC get start of memory low byte
  $A8BE get start of memory high byte

c $A8C0 search for line # in temporary integer from (`AX`)
  $A8C0 search Basic for temp integer line number from `AX`
  $A8C3 if carry clear go do undefined statement error
N $A8C5 carry already set for subtract
  $A8C5 get pointer low byte
  $A8C7 -1
  $A8C9 save BASIC execute pointer low byte
  $A8CB get pointer high byte
  $A8CD subtract carry
  $A8CF save BASIC execute pointer high byte
  $A8D1

c $A8D2 perform RETURN
  $A8D2 exit if following token to allow syntax error
  $A8D4 set byte so no match possible
  $A8D6 save FOR/NEXT variable pointer high byte
  $A8D8 search the stack for FOR or GOSUB activity, get token off stack
  $A8DB correct the stack
  $A8DC compare with GOSUB token
  $A8DE if matching GOSUB go continue RETURN
  $A8E0 else error code $04, return without gosub error
B $A8E2,1 makes next line BIT $11A2
  $A8E3 error code $11, undefined statement error
  $A8E5 do error #`X` then warm start

c $A8E8 do syntax error then warm start
  $A8E8 do syntax error then warm start

c $A8EB perform RETURN (continued)
  $A8EB dump token byte
  $A8EC pull return line low byte
  $A8ED save current line number low byte
  $A8EF pull return line high byte
  $A8F0 save current line number high byte
  $A8F2 pull return address low byte
  $A8F3 save BASIC execute pointer low byte
  $A8F5 pull return address high byte
  $A8F6 save BASIC execute pointer high byte

c $A8F8 perform DATA
  $A8F8 scan for next BASIC statement ([:] or [EOL])

c $A8FB add `Y` to the BASIC execute pointer
  $A8FB copy index to `A`
  $A8FC clear carry for add
  $A8FD add BASIC execute pointer low byte
  $A8FF save BASIC execute pointer low byte
  $A901 skip increment if no carry
  $A903 else increment BASIC execute pointer high byte
  $A905

c $A906 scan for next BASIC statement ([:] or [EOL])
D $A906 returns `Y` as index to [:] or [EOL]
  $A906,c set look for character = ":"
B $A908,1 makes next line BIT $00A2

c $A909 scan for next BASIC line
D $A909 returns `Y` as index to [EOL]
  $A909 set alternate search character = [EOL]
  $A90B store alternate search character
  $A90D set search character = [EOL]
  $A90F save the search character
  $A911 get search character
  $A913 get alternate search character
  $A915 make search character = alternate search character
  $A917 make alternate search character = search character
  $A919 get BASIC byte
  $A91B exit if null [EOL]
  $A91D compare with search character
  $A91F exit if found
  $A921 else increment index
  $A922 compare current character with open quote
  $A924 if found go swap search character for alternate search character
  $A926 loop for next character, branch always

c $A928 perform IF
  $A928 evaluate expression
  $A92B scan memory
  $A92E compare with "GOTO" token
  $A930 if it was the token for GOTO go do IF ... GOTO
N $A932 wasn't IF ... GOTO so must be IF ... THEN
  $A932 set "THEN" token
  $A934 scan for CHR$(`A`), else do syntax error then warm start
  $A937 get FAC1 exponent
  $A939 if result was non zero continue execution, else REM rest of line

c $A93B perform REM
  $A93B scan for next BASIC line
  $A93E add `Y` to the BASIC execute pointer and return, branch always
N $A940 result was non zero so do rest of line
  $A940 scan memory
  $A943 branch if not numeric character, is variable or keyword
  $A945 else perform GOTO n
N $A948 is variable or keyword
  $A948 interpret BASIC code from BASIC execute pointer

c $A94B perform ON
  $A94B get byte parameter
  $A94E push next character
  $A94F compare with GOSUB token
  $A951 if GOSUB go see if it should be executed
  $A953 compare with GOTO token
  $A955 if not GOTO do syntax error then warm start
N $A957 next character was GOTO or GOSUB, see if it should be executed
  $A957 decrement the byte value
  $A959 if not zero go see if another line number exists
  $A95B pull keyword token
  $A95C go execute it
  $A95F increment and scan memory
  $A962 get fixed-point number into temporary integer
N $A965 skip this n
  $A965,c compare next character with ","
  $A967 loop if ","
  $A969 else pull keyword token, ran out of options
  $A96A

c $A96B get fixed-point number into temporary integer
  $A96B clear `X`
  $A96D clear temporary integer low byte
  $A96F clear temporary integer high byte
  $A971 return if carry set, end of scan, character was not 0-9
  $A973 subtract $30, $2F+carry, from byte
  $A975 store #
  $A977 get temporary integer high byte
  $A979 save it for now
  $A97B compare with $19
  $A97D branch if >=
@ $A97F ignoreua:m
N $A97F this makes the maximum line number 63999 because the next bit does $1900 * $0A = $FA00 = 64000 decimal. the branch target is really the SYNTAX error at $A8E8 but that is too far so an intermediate compare and branch to that location is used. the problem with this is that line number that gives a partial result from $8900 to $89FF, 35072x to 35327x, will pass the new target compare and will try to execute the remainder of the ON n GOTO/GOSUB. a solution to this is to copy the byte in `A` before the branch to `X` and then branch to $A955 skipping the second compare
  $A97F get temporary integer low byte
  $A981 *2 low byte
  $A982 *2 high byte
  $A984 *2 low byte
  $A985 *2 high byte (*4)
  $A987 + low byte (*5)
  $A989 save it
  $A98B get high byte temp
  $A98D + high byte (*5)
  $A98F save it
  $A991 *2 low byte (*10d)
  $A993 *2 high byte (*10d)
  $A995 get low byte
  $A997 add #
  $A999 save low byte
  $A99B branch if no overflow to high byte
  $A99D else increment high byte
  $A99F increment and scan memory
  $A9A2 loop for next character

c $A9A5 perform LET
  $A9A5 get variable address
  $A9A8 save variable address low byte
  $A9AA save variable address high byte
  $A9AC $B2 is "=" token
  $A9AE scan for CHR$(`A`), else do syntax error then warm start
  $A9B1 get data type flag, $80 = integer, $00 = float
  $A9B3 push data type flag
  $A9B4 get data type flag, $FF = string, $00 = numeric
  $A9B6 push data type flag
  $A9B7 evaluate expression
  $A9BA pop data type flag
  $A9BB string bit into carry
  $A9BC do type match check
  $A9BF branch if string
  $A9C1 pop integer/float data type flag
N $A9C2 assign value to numeric variable
  $A9C2 branch if float expression is numeric integer
  $A9C4 round FAC1
  $A9C7 evaluate integer expression, no sign check
  $A9CA clear index
  $A9CC get FAC1 mantissa 3
  $A9CE save as integer variable low byte
  $A9D0 increment index
  $A9D1 get FAC1 mantissa 4
  $A9D3 save as integer variable high byte
  $A9D5
  $A9D6 pack FAC1 into variable pointer and return
N $A9D9 assign value to numeric variable
  $A9D9 dump integer/float data type flag
  $A9DA get variable pointer high byte
  $A9DC was it TI$ pointer
  $A9DE branch if not
N $A9E0 else it's TI$ = <expr$>
  $A9E0 pop string off descriptor stack, or from top of string; space returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $A9E3 compare length with 6
  $A9E5 if length not 6 do illegal quantity error then warm start
  $A9E7 clear index
  $A9E9 clear FAC1 exponent
  $A9EB clear FAC1 sign (b7)
  $A9ED save index
  $A9EF check and evaluate numeric digit
  $A9F2 multiply FAC1 by 10
  $A9F5 increment index
  $A9F7 restore index
  $A9F9 check and evaluate numeric digit
  $A9FC round and copy FAC1 to FAC2
  $A9FF copy FAC1 exponent
  $AA00 branch if FAC1 zero
  $AA02 increment index, * 2
  $AA03 copy back to `A`
  $AA04 FAC1 = (FAC1 + (FAC2 * 2)) * 2 = FAC1 * 6
  $AA07 get index
  $AA09 increment index
  $AA0A compare index with 6
  $AA0C loop if not 6
  $AA0E multiply FAC1 by 10
  $AA11 convert FAC1 floating to fixed
  $AA14 get FAC1 mantissa 3
  $AA16 get FAC1 mantissa 2
  $AA18 get FAC1 mantissa 4
  $AA1A set real time clock and return

c $AA1D check and evaluate numeric digit
  $AA1D get byte from string
  $AA1F clear Cb if numeric. this call should be to $84 as the code from $80 first compares the byte with [SPACE] and does a BASIC increment and get if it is
  $AA22 branch if numeric
  $AA24 do illegal quantity error then warm start
  $AA27 subtract $2F + carry to convert ASCII to binary
  $AA29 evaluate new ASCII digit and return

c $AA2C assign value to numeric variable, but not TI$
  $AA2C index to string pointer high byte
  $AA2E get string pointer high byte
  $AA30 compare with bottom of string space high byte
  $AA32 branch if string pointer high byte is less than bottom of string space high byte
  $AA34 branch if string pointer high byte is greater than bottom of string space high byte
N $AA36 else high bytes were equal
  $AA36 decrement index to string pointer low byte
  $AA37 get string pointer low byte
  $AA39 compare with bottom of string space low byte
  $AA3B branch if string pointer low byte is less than bottom of string space low byte
  $AA3D get descriptor pointer high byte
  $AA3F compare with start of variables high byte
  $AA41 branch if less, is on string stack
  $AA43 if greater make space and copy string
N $AA45 else high bytes were equal
  $AA45 get descriptor pointer low byte
  $AA47 compare with start of variables low byte
  $AA49 if greater or equal make space and copy string
  $AA4B get descriptor pointer low byte
  $AA4D get descriptor pointer high byte
  $AA4F go copy descriptor to variable
  $AA52 clear index
  $AA54 get string length
  $AA56 copy descriptor pointer and make string space `A` bytes long
  $AA59 copy old descriptor pointer low byte
  $AA5B copy old descriptor pointer high byte
  $AA5D save old descriptor pointer low byte
  $AA5F save old descriptor pointer high byte
  $AA61 copy string from descriptor to utility pointer
  $AA64 get descriptor pointer low byte
  $AA66 get descriptor pointer high byte
  $AA68 save descriptor pointer low byte
  $AA6A save descriptor pointer high byte
  $AA6C clean descriptor stack, `YA` = pointer
  $AA6F clear index
  $AA71 get string length from new descriptor
  $AA73 copy string length to variable
  $AA75 increment index
  $AA76 get string pointer low byte from new descriptor
  $AA78 copy string pointer low byte to variable
  $AA7A increment index
  $AA7B get string pointer high byte from new descriptor
  $AA7D copy string pointer high byte to variable
  $AA7F

c $AA80 perform PRINT#
  $AA80 perform CMD
  $AA83 close input and output channels and return

c $AA86 perform CMD
  $AA86 get byte parameter
  $AA89 branch if following byte is ":" or [EOT]
  $AA8B,c set ","
  $AA8D scan for CHR$(`A`), else do syntax error then warm start
  $AA90 save status
  $AA91 set current I/O channel
  $AA93 open channel for output with error check
  $AA96 restore status
  $AA97 perform PRINT

c $AA9A print string and scan memory
  $AA9A print string from utility pointer
  $AA9D scan memory

c $AAA0 perform PRINT
  $AAA0 if nothing following just print CR/LF
  $AAA2 exit if nothing following, end of PRINT branch
  $AAA4 compare with token for TAB(
  $AAA6 if TAB( go handle it
  $AAA8 compare with token for SPC(
  $AAAA flag SPC(
  $AAAB if SPC( go handle it
  $AAAD,c compare with ","
  $AAAF if "," go skip to the next TAB position
  $AAB1,c compare with ";"
  $AAB3 if ";" go continue the print loop
  $AAB5 evaluate expression
  $AAB8 test data type flag, $FF = string, $00 = numeric
  $AABA if string go print string, scan memory and continue PRINT
  $AABC convert FAC1 to ASCII string result in (`AY`)
  $AABF print " terminated string to utility pointer
  $AAC2 print string from utility pointer
  $AAC5 print [SPACE] or [CURSOR RIGHT]
  $AAC8 go scan memory and continue PRINT, branch always

c $AACA set `XY` to $0200 - 1 and print [CR]
  $AACA clear `A`
  $AACC clear first byte of input buffer
  $AACF $0200 - 1 low byte
  $AAD1 $0200 - 1 high byte
  $AAD3 get current I/O channel
  $AAD5 exit if not default channel

c $AAD7 print CR/LF
  $AAD7 set [CR]
  $AAD9 print the character
  $AADC test current I/O channel
  $AADE if ?? toggle `A`, EOR #$FF and return
  $AAE0 set [LF]
  $AAE2 print the character
N $AAE5 toggle `A`
  $AAE5 invert `A`
  $AAE7

c $AAE8 skip to the next TAB position
  $AAE8 set Cb for read cursor position
  $AAE9 read/set X,Y cursor position
  $AAEC copy cursor Y
  $AAED set carry for subtract
  $AAEE subtract one TAB length
  $AAF0 loop if result was +ve
  $AAF2 complement it
  $AAF4 +1, twos complement
  $AAF6 always print `A` spaces, result is never $00
  $AAF8 save TAB( or SPC( status
  $AAF9 set Cb for read cursor position
  $AAFA read/set X,Y cursor position
  $AAFD save current cursor position
  $AAFF scan and get byte parameter
  $AB02,c compare with ")"
  $AB04 if not ")" do syntax error
  $AB06 restore TAB( or SPC( status
  $AB07 branch if was SPC(
N $AB09 else was TAB(
  $AB09 copy TAB() byte to `A`
  $AB0A subtract current cursor position
  $AB0C go loop for next if already past requited position
  $AB0E copy [SPACE] count to `X`
  $AB0F increment count
  $AB10 decrement count
  $AB11 branch if count was not zero
N $AB13 was ";" or [SPACES] printed
  $AB13 increment and scan memory
  $AB16 continue print loop
  $AB19 print [SPACE] or [CURSOR RIGHT]
  $AB1C loop, branch always

c $AB1E print null terminated string
  $AB1E print " terminated string to utility pointer

c $AB21 print string from utility pointer
  $AB21 pop string off descriptor stack, or from top of string space; returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $AB24 copy length
  $AB25 clear index
  $AB27 increment length, for pre decrement loop
  $AB28 decrement length
  $AB29 exit if done
  $AB2B get byte from string
  $AB2D print the character
  $AB30 increment index
  $AB31 compare byte with [CR]
  $AB33 loop if not [CR]
  $AB35 toggle `A`, EOR #$FF. what is the point of this ??
  $AB38 loop

c $AB3B print [SPACE] or [CURSOR RIGHT]
  $AB3B get current I/O channel
  $AB3D if default channel go output [CURSOR RIGHT]
  $AB3F,c else output [SPACE]
B $AB41,1 makes next line BIT $1DA9
  $AB42 set [CURSOR RIGHT]
B $AB44,1 makes next line BIT $3FA9

c $AB45 print "?"
  $AB45,c set "?"

c $AB47 print character
  $AB47 output character to channel with error check
  $AB4A set the flags on `A`
  $AB4C

c $AB4D bad input routine
  $AB4D get INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
  $AB4F branch if INPUT
  $AB51 branch if READ
N $AB53 else was GET
  $AB53 set current line high byte to -1, indicate immediate mode
  $AB55 branch always
  $AB57 get current DATA line number low byte
  $AB59 get current DATA line number high byte
  $AB5B set current line number low byte
  $AB5D set current line number high byte
  $AB5F do syntax error then warm start
N $AB62 was INPUT
  $AB62 get current I/O channel
  $AB64 branch if default channel
  $AB66 else error $18, file data error
  $AB68 do error #`X` then warm start
  $AB6B set "?REDO FROM START" pointer low byte
  $AB6D set "?REDO FROM START" pointer high byte
  $AB6F print null terminated string
  $AB72 get continue pointer low byte
  $AB74 get continue pointer high byte
  $AB76 save BASIC execute pointer low byte
  $AB78 save BASIC execute pointer high byte
  $AB7A

c $AB7B perform GET
  $AB7B check not Direct, back here if ok
  $AB7E,c compare with "#"
  $AB80 branch if not GET#
  $AB82 increment and scan memory
  $AB85 get byte parameter
  $AB88,c set ","
  $AB8A scan for CHR$(`A`), else do syntax error then warm start
  $AB8D set current I/O channel
  $AB8F open channel for input with error check
  $AB92 set pointer low byte
  $AB94 set pointer high byte
  $AB96 clear `A`
  $AB98 ensure null terminator
  $AB9B input mode = GET
  $AB9D perform the GET part of READ
  $ABA0 get current I/O channel
  $ABA2 if not default channel go do channel close and return
  $ABA4

c $ABA5 perform INPUT#
  $ABA5 get byte parameter
  $ABA8,c set ","
  $ABAA scan for CHR$(`A`), else do syntax error then warm start
  $ABAD set current I/O channel
  $ABAF open channel for input with error check
  $ABB2 perform INPUT with no prompt string

c $ABB5 close input and output channels
  $ABB5 get current I/O channel
  $ABB7 close input and output channels
  $ABBA clear `X`
  $ABBC clear current I/O channel, flag default
  $ABBE

c $ABBF perform INPUT
  $ABBF compare next byte with open quote
  $ABC1 if no prompt string just do INPUT
  $ABC3 print "..." string
  $ABC6,c load `A` with ";"
  $ABC8 scan for CHR$(`A`), else do syntax error then warm start
  $ABCB print string from utility pointer
N $ABCE done with prompt, now get data
  $ABCE check not Direct, back here if ok
  $ABD1,c set ","
  $ABD3 save to start of buffer - 1
  $ABD6 print "? " and get BASIC input
  $ABD9 get current I/O channel
  $ABDB branch if default I/O channel
  $ABDD read I/O status word
  $ABE0,b mask no DSR/timeout
  $ABE2 branch if not error
  $ABE4 close input and output channels
  $ABE7 perform DATA
  $ABEA get first byte in input buffer
  $ABED branch if not null
N $ABEF else ..
  $ABEF get current I/O channel
  $ABF1 if not default channel go get BASIC input
  $ABF3 scan for next BASIC statement ([:] or [EOL])
  $ABF6 add `Y` to the BASIC execute pointer and return

c $ABF9 print "? " and get BASIC input
  $ABF9 get current I/O channel
  $ABFB skip "?" prompt if not default channel
  $ABFD print "?"
  $AC00 print [SPACE] or [CURSOR RIGHT]
  $AC03 call for BASIC input and return

c $AC06 perform READ
  $AC06 get DATA pointer low byte
  $AC08 get DATA pointer high byte
  $AC0A set input mode = READ
B $AC0C,1 makes next line BIT $00A9
  $AC0D set input mode = INPUT

c $AC0F perform GET
  $AC0F set input mode flag, $00 = INPUT, $40 = GET, $98 = READ
  $AC11 save READ pointer low byte
  $AC13 save READ pointer high byte
N $AC15 READ, GET or INPUT next variable from list
  $AC15 get variable address
  $AC18 save address low byte
  $AC1A save address high byte
  $AC1C get BASIC execute pointer low byte
  $AC1E get BASIC execute pointer high byte
  $AC20 save BASIC execute pointer low byte
  $AC22 save BASIC execute pointer high byte
  $AC24 get READ pointer low byte
  $AC26 get READ pointer high byte
  $AC28 save as BASIC execute pointer low byte
  $AC2A save as BASIC execute pointer high byte
  $AC2C scan memory
  $AC2F branch if not null
N $AC31 pointer was to null entry
  $AC31 test input mode flag, $00 = INPUT, $40 = GET, $98 = READ
  $AC33 branch if not GET
N $AC35 else was GET
  $AC35 get character from input device with error check
  $AC38 save to buffer
  $AC3B set pointer low byte
  $AC3D set pointer high byte
  $AC3F go interpret single character
  $AC41 branch if READ
N $AC43 else was INPUT
  $AC43 get current I/O channel
  $AC45 skip "?" prompt if not default channel
  $AC47 print "?"
  $AC4A print "? " and get BASIC input
  $AC4D save BASIC execute pointer low byte
  $AC4F save BASIC execute pointer high byte
  $AC51 increment and scan memory, execute pointer now points to start of next data or null terminator
  $AC54 test data type flag, $FF = string, $00 = numeric
  $AC56 branch if numeric type is string
  $AC58 test INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
  $AC5A branch if not GET
N $AC5C else do string GET
  $AC5C clear `X` ??
  $AC5D save BASIC execute pointer low byte
  $AC5F clear `A`
  $AC61 clear search character
  $AC63 branch always
N $AC65 is string INPUT or string READ
  $AC65 save search character
  $AC67 compare with "
  $AC69 branch if quote
N $AC6B string is not in quotes so ":", "," or $00 are the termination characters
  $AC6B,c set ":"
  $AC6D set search character
  $AC6F,c set ","
  $AC71 clear carry for add
  $AC72 set scan quotes flag
  $AC74 get BASIC execute pointer low byte
  $AC76 get BASIC execute pointer high byte
  $AC78 add to pointer low byte. this add increments the pointer
N $AC7A if the mode is INPUT or READ and the data is a "..." string
  $AC7A branch if no rollover
  $AC7C else increment pointer high byte
  $AC7D print string to utility pointer
  $AC80 restore BASIC execute pointer from temp
  $AC83 perform string LET
  $AC86 continue processing command
N $AC89 GET, INPUT or READ is numeric
  $AC89 get FAC1 from string
  $AC8C get data type flag, $80 = integer, $00 = float
  $AC8E assign value to numeric variable
  $AC91 scan memory
  $AC94 branch if ":" or [EOL]
  $AC96,c compare with ","
  $AC98 branch if ","
  $AC9A else go do bad input routine
N $AC9D string terminated with ":", "," or $00
  $AC9D get BASIC execute pointer low byte
  $AC9F get BASIC execute pointer high byte
  $ACA1 save READ pointer low byte
  $ACA3 save READ pointer high byte
  $ACA5 get saved BASIC execute pointer low byte
  $ACA7 get saved BASIC execute pointer high byte
  $ACA9 restore BASIC execute pointer low byte
  $ACAB restore BASIC execute pointer high byte
  $ACAD scan memory
  $ACB0 branch if ":" or [EOL]
  $ACB2 scan for ",", else do syntax error then warm start
  $ACB5 go READ or INPUT next variable from list
N $ACB8 was READ
  $ACB8 scan for next BASIC statement ([:] or [EOL])
  $ACBB increment index to next byte
  $ACBC copy byte to `X`
  $ACBD branch if ":"
  $ACBF else set error $0D, out of data error
  $ACC1 increment index to next line pointer high byte
  $ACC2 get next line pointer high byte
  $ACC4 branch if program end, eventually does error `X`
  $ACC6 increment index
  $ACC7 get next line # low byte
  $ACC9 save current DATA line low byte
  $ACCB increment index
  $ACCC get next line # high byte
  $ACCE increment index
  $ACCF save current DATA line high byte
  $ACD1 add `Y` to the BASIC execute pointer
  $ACD4 scan memory
  $ACD7 copy the byte
  $ACD8 compare it with token for DATA
  $ACDA loop if not DATA
  $ACDC continue evaluating READ
  $ACDF get READ pointer low byte
  $ACE1 get READ pointer high byte
  $ACE3 get INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
  $ACE5 branch if INPUT or GET
  $ACE7 else set data pointer and exit
  $ACEA clear index
  $ACEC get READ byte
  $ACEE exit if [EOL]
  $ACF0 get current I/O channel
  $ACF2 exit if not default channel
  $ACF4 set "?EXTRA IGNORED" pointer low byte
  $ACF6 set "?EXTRA IGNORED" pointer high byte
  $ACF8 print null terminated string
  $ACFB

t $ACFC input error messages
  $ACFC,16,14:n2
  $AD0C,18,16:n2

c $AD1E perform NEXT
  $AD1E branch if NEXT variable
  $AD20 else clear `Y`
  $AD22 branch always
N $AD24 NEXT variable
  $AD24 get variable address
  $AD27 save FOR/NEXT variable pointer low byte
  $AD29 save FOR/NEXT variable pointer high byte (high byte cleared if no variable defined)
  $AD2B search the stack for FOR or GOSUB activity
  $AD2E branch if FOR, this variable, found
  $AD30 else set error $0A, next without for error
  $AD32 do error #`X` then warm start
N $AD35 found this FOR variable
  $AD35 update stack pointer
  $AD36 copy stack pointer
  $AD37 clear carry for add
  $AD38 point to STEP value
  $AD3A save it
  $AD3B point to TO value
  $AD3D save pointer to TO variable for compare
  $AD3F restore pointer to STEP value
  $AD40 point to stack page
  $AD42 unpack memory (`AY`) into FAC1
  $AD45 get stack pointer back
  $AD46 get step sign
  $AD49 save FAC1 sign (b7)
  $AD4B get FOR/NEXT variable pointer low byte
  $AD4D get FOR/NEXT variable pointer high byte
  $AD4F add FOR variable to FAC1
  $AD52 pack FAC1 into FOR variable
  $AD55 point to stack page
  $AD57 compare FAC1 with TO value
  $AD5A get stack pointer back
  $AD5B set carry for subtract
  $AD5C subtract step sign
  $AD5F branch if =, loop complete
N $AD61 loop back and do it all again
  $AD61 get FOR line low byte
  $AD64 save current line number low byte
  $AD66 get FOR line high byte
  $AD69 save current line number high byte
  $AD6B get BASIC execute pointer low byte
  $AD6E save BASIC execute pointer low byte
  $AD70 get BASIC execute pointer high byte
  $AD73 save BASIC execute pointer high byte
  $AD75 go do interpreter inner loop
N $AD78 NEXT loop comlete
  $AD78 stack copy to `A`
  $AD79 add $12, $11 + carry, to dump FOR structure
  $AD7B copy back to index
  $AD7C copy to stack pointer
  $AD7D scan memory
  $AD80,c compare with ","
  $AD82 if not "," go do interpreter inner loop
N $AD84 was "," so another NEXT variable to do
  $AD84 increment and scan memory
  $AD87 do NEXT variable

c $AD8A evaluate expression and check type mismatch
  $AD8A evaluate expression
N $AD8D check if source and destination are numeric
  $AD8D
B $AD8E,1 makes next line BIT $38
N $AD8F check if source and destination are string
  $AD8F destination is string
N $AD90 type match check, set C for string, clear C for numeric
  $AD90 test data type flag, $FF = string, $00 = numeric
  $AD92 branch if string
  $AD94 if destiantion is numeric do type missmatch error
  $AD96
  $AD97 exit if destination is string
N $AD99 do type mismatch error
  $AD99 error code $16, type mismatch error
  $AD9B do error #`X` then warm start

c $AD9E evaluate expression
  $AD9E get BASIC execute pointer low byte
  $ADA0 skip next if not zero
  $ADA2 else decrement BASIC execute pointer high byte
  $ADA4 decrement BASIC execute pointer low byte
  $ADA6 set null precedence, flag done
B $ADA8,1 makes next line BIT $48
  $ADA9 push compare evaluation byte if branch to here
  $ADAA copy precedence byte
  $ADAB push precedence byte
  $ADAC 2 bytes
  $ADAE check room on stack for `A`*2 bytes
  $ADB1 get value from line
  $ADB4 clear `A`
  $ADB6 clear comparrison evaluation flag
  $ADB8 scan memory
  $ADBB set carry for subtract
  $ADBC subtract the token for ">"
  $ADBE branch if < ">"
  $ADC0 compare with ">" to +3
  $ADC2 branch if >= 3
N $ADC4 was token for ">" "=" or "<"
  $ADC4 compare with token for =
  $ADC6 *2, b0 = carry (=1 if token was = or <)
  $ADC7,b toggle b0
  $ADC9 EOR with comparison evaluation flag
  $ADCB compare with comparison evaluation flag
  $ADCD if < saved flag do syntax error then warm start
  $ADCF save new comparison evaluation flag
  $ADD1 increment and scan memory
  $ADD4 go do next character
  $ADD7 get comparison evaluation flag
  $ADD9 branch if compare function
  $ADDB go do functions
N $ADDD else was < TK_GT so is operator or lower
  $ADDD add # of operators (+, -, *, /, ^, AND or OR)
  $ADDF branch if < + operator
N $ADE1 carry was set so token was +, -, *, /, ^, AND or OR
  $ADE1 add data type flag, $FF = string, $00 = numeric
  $ADE3 branch if not string or not + token
N $ADE5 will only be $00 if type is string and token was +
  $ADE5 add strings, string 1 is in the descriptor, string 2 is in line, and return
  $ADE8 -1 (corrects for carry add)
  $ADEA save it
  $ADEC *2
  $ADED *3
  $ADEF copy to index
  $ADF0 pull previous precedence
  $ADF1 compare with precedence byte
  $ADF4 branch if `A` >=
  $ADF6 check if source is numeric, else do type mismatch
  $ADF9 save precedence
  $ADFA get vector, execute function then continue evaluation
  $ADFD restore precedence
  $ADFE get precedence stacked flag
  $AE00 branch if stacked values
  $AE02 copy precedence, set flags
  $AE03 exit if done
  $AE05 else pop FAC2 and return, branch always
  $AE07 clear data type flag, $FF = string, $00 = numeric
  $AE09 copy compare function flag
  $AE0A <<1, shift data type flag into b0, 1 = string, 0 = num
  $AE0B get BASIC execute pointer low byte
  $AE0D branch if no underflow
  $AE0F else decrement BASIC execute pointer high byte
  $AE11 decrement BASIC execute pointer low byte
  $AE13 set offset to = operator precedence entry
  $AE15 save new comparison evaluation flag
  $AE17 branch always
  $AE19 compare with stacked function precedence
  $AE1C if `A` >=, pop FAC2 and return
  $AE1E else go stack this one and continue, branch always

c $AE20 get vector, execute function then continue evaluation
  $AE20 get function vector high byte onto stack
  $AE24 get function vector low byte onto stack
N $AE28 now push sign, round FAC1 and put on stack
  $AE28 function will return here, then the next RTS will call the function
  $AE2B get comparrison evaluation flag
  $AE2D continue evaluating expression

c $AE30 do syntax error then warm start
  $AE30 do syntax error then warm start

c $AE33 get vector, execute function then continue evaluation (continued)
  $AE33 get FAC1 sign (b7)
  $AE35 get precedence byte

c $AE38 push sign, round FAC1 and put on stack
  $AE38 copy sign
  $AE39 get return address low byte
  $AE3A save it
  $AE3C increment it as return-1 is pushed
N $AE3E note, no check is made on the high byte so if the calling routine ever assembles to a page edge then this all goes horribly wrong!
  $AE3E get return address high byte
  $AE3F save it
  $AE41 restore sign
  $AE42 push sign

c $AE43 round FAC1 and put on stack
  $AE43 round FAC1
  $AE46 get FAC1 mantissa 4
  $AE48 save it
  $AE49 get FAC1 mantissa 3
  $AE4B save it
  $AE4C get FAC1 mantissa 2
  $AE4E save it
  $AE4F get FAC1 mantissa 1
  $AE51 save it
  $AE52 get FAC1 exponent
  $AE54 save it
  $AE55 return, sort of

c $AE58 do functions
  $AE58 flag function
  $AE5A pull precedence byte
  $AE5B exit if done
  $AE5D compare previous precedence with $64
  $AE5F branch if was $64 (< function)
  $AE61 check if source is numeric, else do type mismatch
  $AE64 save precedence stacked flag
N $AE66 pop FAC2 and return
  $AE66 pop byte
  $AE67 shift out comparison evaluation lowest bit
  $AE68 save the comparison evaluation flag
  $AE6A pop exponent
  $AE6B save FAC2 exponent
  $AE6D pop mantissa 1
  $AE6E save FAC2 mantissa 1
  $AE70 pop mantissa 2
  $AE71 save FAC2 mantissa 2
  $AE73 pop mantissa 3
  $AE74 save FAC2 mantissa 3
  $AE76 pop mantissa 4
  $AE77 save FAC2 mantissa 4
  $AE79 pop sign
  $AE7A save FAC2 sign (b7)
  $AE7C EOR FAC1 sign (b7)
  $AE7E save sign compare (FAC1 EOR FAC2)
  $AE80 get FAC1 exponent
  $AE82

c $AE83 get value from line
  $AE83 get arithmetic element

c $AE86 get arithmetic element
D $AE86 the get arithmetic element vector is initialised to point here
  $AE86 clear byte
  $AE88 clear data type flag, $FF = string, $00 = numeric
  $AE8A increment and scan memory
  $AE8D branch if not numeric character
N $AE8F else numeric string found (e.g. 123)
  $AE8F get FAC1 from string and return
N $AE92 wasn't a number so ...
  $AE92 check byte, return Cb = 0 if<"A" or >"Z"
  $AE95 branch if not variable name
  $AE97 variable name set-up and return
  $AE9A compare with token for PI
  $AE9C branch if not PI
  $AE9E get PI pointer low byte
  $AEA0 get PI pointer high byte
  $AEA2 unpack memory (`AY`) into FAC1
  $AEA5 increment and scan memory and return
B $AEA8,5 3.141592653 (PI as floating number)
N $AEAD wasn't variable name so ...
  $AEAD,c compare with "."
  $AEAF if so get FAC1 from string and return, e.g. was .123
N $AEB1 wasn't .123 so ...
  $AEB1 compare with token for -
  $AEB3 branch if - token, do set-up for functions
N $AEB5 wasn't -123 so ...
  $AEB5 compare with token for +
  $AEB7 branch if + token, +1 = 1 so ignore leading +
N $AEB9 it wasn't any sort of number so ...
  $AEB9 compare with "
  $AEBB branch if not open quote
N $AEBD was open quote so get the enclosed string
N $AEBD print "..." string to string utility area
  $AEBD get BASIC execute pointer low byte
  $AEBF get BASIC execute pointer high byte
  $AEC1 add carry to low byte
  $AEC3 branch if no overflow
  $AEC5 increment high byte
  $AEC6 print " terminated string to utility pointer
  $AEC9 restore BASIC execute pointer from temp and return
N $AECC wasn't a string so ...
  $AECC compare with token for NOT
  $AECE branch if not token for NOT
N $AED0 was NOT token
  $AED0 offset to NOT function
  $AED2 do set-up for function then execute, branch always
N $AED4 do = compare
  $AED4 evaluate integer expression, no sign check
  $AED7 get FAC1 mantissa 4
  $AED9 invert it
  $AEDB copy it
  $AEDC get FAC1 mantissa 3
  $AEDE invert it
  $AEE0 convert fixed integer `AY` to float FAC1 and return
N $AEE3 wasn't a string or NOT so ...
  $AEE3 compare with token for FN
  $AEE5 branch if not token for FN
  $AEE7 else go evaluate FNx
N $AEEA wasn't a string, NOT or FN so ...
  $AEEA compare with token for SGN
  $AEEC if less than SGN token evaluate expression in parentheses
N $AEEE else was a function token
  $AEEE go set up function references, branch always
N $AEF1 if here it can only be something in brackets so .... evaluate expression within parentheses
  $AEF1 scan for "(", else do syntax error then warm start
  $AEF4 evaluate expression
N $AEF7 all the 'scan for' routines return the character after the sought character
N $AEF7 scan for ")", else do syntax error then warm start
  $AEF7,c load `A` with ")"
B $AEF9,1 makes next line BIT $28A9
N $AEFA scan for "(", else do syntax error then warm start
  $AEFA,c load `A` with "("
B $AEFC,1 makes next line BIT $2CA9
N $AEFD scan for ",", else do syntax error then warm start
  $AEFD,c load `A` with ","
N $AEFF scan for CHR$(`A`), else do syntax error then warm start
  $AEFF clear index
  $AF01 compare with BASIC byte
  $AF03 if not expected byte do syntax error then warm start
  $AF05 else increment and scan memory and return
N $AF08 syntax error then warm start
  $AF08 error code $0B, syntax error
  $AF0A do error #`X` then warm start
  $AF0D set offset from base to > operator
  $AF0F dump return address low byte
  $AF10 dump return address high byte
  $AF11 execute function then continue evaluation

c $AF14 check address range
D $AF14 return Cb = 1 if address in BASIC ROM
  $AF14 set carry for subtract
  $AF15 get variable address low byte
@ $AF17 ignoreua
  $AF17 subtract $A000 low byte
  $AF19 get variable address high byte
@ $AF1B ignoreua
  $AF1B subtract $A000 high byte
@ $AF1D ignoreua
  $AF1D exit if address < $A000
  $AF1F get end of BASIC marker low byte
  $AF21 subtract variable address low byte
  $AF23 get end of BASIC marker high byte
  $AF25 subtract variable address high byte
  $AF27

c $AF28 variable name set-up
  $AF28 get variable address
  $AF2B save variable pointer low byte
  $AF2D save variable pointer high byte
  $AF2F get current variable name first character
  $AF31 get current variable name second character
  $AF33 get data type flag, $FF = string, $00 = numeric
  $AF35 branch if numeric
N $AF37 variable is string
  $AF37 else clear `A`
  $AF39 clear FAC1 rounding byte
  $AF3B check address range
  $AF3E exit if not in BASIC ROM
  $AF40,c compare variable name first character with "T"
  $AF42 exit if not "T"
  $AF44,c compare variable name second character with "I$"
  $AF46 exit if not "I$"
N $AF48 variable name was "TI$"
  $AF48 read real time clock into FAC1 mantissa, 0HML
  $AF4B clear exponent count adjust
  $AF4D `Y` = $FF
  $AF4E set output string index, -1 to allow for pre increment
  $AF50 HH:MM:SS is six digits
  $AF52 set number of characters before the decimal point
  $AF54 index to jiffy conversion table
  $AF56 convert jiffy count to string
  $AF59 exit via STR$() code tail
  $AF5C
N $AF5D variable name set-up, variable is numeric
  $AF5D test data type flag, $80 = integer, $00 = float
  $AF5F branch if float
  $AF61 clear index
  $AF63 get integer variable low byte
  $AF65 copy to `X`
  $AF66 increment index
  $AF67 get integer variable high byte
  $AF69 copy to `Y`
  $AF6A copy loa byte to `A`
  $AF6B convert fixed integer `AY` to float FAC1 and return
N $AF6E variable name set-up, variable is float
  $AF6E check address range
  $AF71 if not in BASIC ROM get pointer and unpack into FAC1
  $AF73,c compare variable name first character with "T"
  $AF75 branch if not "T"
  $AF77,c compare variable name second character with "I"
  $AF79 branch if not "I"
N $AF7B variable name was "TI"
  $AF7B read real time clock into FAC1 mantissa, 0HML
  $AF7E clear `A`
  $AF7F set exponent to 32 bit value
  $AF81 set exponent = `X` and normalise FAC1
N $AF84 read real time clock into FAC1 mantissa, 0HML
  $AF84 read real time clock
  $AF87 save jiffy clock mid byte as FAC1 mantissa 3
  $AF89 save jiffy clock high byte as FAC1 mantissa 2
  $AF8B save jiffy clock low byte as FAC1 mantissa 4
  $AF8D clear `Y`
  $AF8F clear FAC1 mantissa 1
  $AF91
N $AF92 variable name set-up, variable is float and not "Tx"
  $AF92,c compare variable name first character with "S"
  $AF94 if not "S" go do normal floating variable
  $AF96,c compare variable name second character with "T"
  $AF98 if not "T" go do normal floating variable
N $AF9A variable name was "ST"
  $AF9A read I/O status word
  $AF9D save `A` as integer byte and return
N $AFA0 variable is float
  $AFA0 get variable pointer low byte
  $AFA2 get variable pointer high byte
  $AFA4 unpack memory (`AY`) into FAC1

c $AFA7 get value from line continued
D $AFA7 only functions left so .. set up function references
  $AFA7 *2 (2 bytes per function address)
  $AFA8 save function offset
  $AFA9 copy function offset
  $AFAA increment and scan memory
  $AFAD compare function offset to CHR$ token offset+1
  $AFAF branch if < LEFT$ (can not be =)
N $AFB1 get value from line .. continued
N $AFB1 was LEFT$, RIGHT$ or MID$ so..
  $AFB1 scan for "(", else do syntax error then warm start
  $AFB4 evaluate, should be string, expression
  $AFB7 scan for ",", else do syntax error then warm start
  $AFBA check if source is string, else do type mismatch
  $AFBD restore function offset
  $AFBE copy it
  $AFBF get descriptor pointer high byte
  $AFC1 push string pointer high byte
  $AFC2 get descriptor pointer low byte
  $AFC4 push string pointer low byte
  $AFC5 restore function offset
  $AFC6 save function offset
  $AFC7 get byte parameter
  $AFCA restore function offset
  $AFCB copy function offset
  $AFCC copy byte parameter to `A`
  $AFCD push byte parameter
  $AFCE go call function
N $AFD1 get value from line .. continued
N $AFD1 was SGN() to CHR$() so..
  $AFD1 evaluate expression within parentheses
  $AFD4 restore function offset
  $AFD5 copy to index
  $AFD6 get function jump vector low byte
  $AFD9 save functions jump vector low byte
  $AFDB get function jump vector high byte
  $AFDE save functions jump vector high byte
  $AFE0 do function call
  $AFE3 check if source is numeric and RTS, else do type mismatch; string functions avoid this by dumping the return address

c $AFE6 perform OR
D $AFE6 this works because NOT(NOT(x) AND NOT(y)) = x OR y
  $AFE6 set `Y` for OR
B $AFE8,1 makes next line BIT $00A0

c $AFE9 perform AND
  $AFE9 clear `Y` for AND
  $AFEB set AND/OR invert value
  $AFED evaluate integer expression, no sign check
  $AFF0 get FAC1 mantissa 3
  $AFF2 EOR low byte
  $AFF4 save it
  $AFF6 get FAC1 mantissa 4
  $AFF8 EOR high byte
  $AFFA save it
  $AFFC copy FAC2 to FAC1, get 2nd value in expression
  $AFFF evaluate integer expression, no sign check
  $B002 get FAC1 mantissa 4
  $B004 EOR high byte
  $B006 AND with expression 1 high byte
  $B008 EOR result high byte
  $B00A save in `Y`
  $B00B get FAC1 mantissa 3
  $B00D EOR low byte
  $B00F AND with expression 1 low byte
  $B011 EOR result low byte
  $B013 convert fixed integer `AY` to float FAC1 and return

c $B016 perform comparisons
D $B016 do < compare
  $B016 type match check, set C for string
  $B019 branch if string
N $B01B do numeric < compare
  $B01B get FAC2 sign (b7)
  $B01D set all non sign bits
  $B01F and FAC2 mantissa 1 (AND in sign bit)
  $B021 save FAC2 mantissa 1
  $B023 set pointer low byte to FAC2
  $B025 set pointer high byte to FAC2
  $B027 compare FAC1 with (`AY`)
  $B02A copy the result
  $B02B go evaluate result
N $B02E do string < compare
  $B02E clear byte
  $B030 clear data type flag, $FF = string, $00 = numeric
  $B032 clear < bit in comparrison evaluation flag
  $B034 pop string off descriptor stack, or from top of string space
N $B037 returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B037 save length
  $B039 save string pointer low byte
  $B03B save string pointer high byte
  $B03D get descriptor pointer low byte
  $B03F get descriptor pointer high byte
  $B041 pop (`YA`) descriptor off stack or from top of string space
N $B044 returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B044 save string pointer low byte
  $B046 save string pointer high byte
  $B048 copy length
  $B049 set carry for subtract
  $B04A subtract string 1 length
  $B04C branch if str 1 length = string 2 length
  $B04E set str 1 length > string 2 length
  $B050 branch if so
  $B052 get string 1 length
  $B054 set str 1 length < string 2 length
  $B056 save length compare
  $B058 set index
  $B05A adjust for loop
  $B05B increment index
  $B05C decrement count
  $B05D branch if still bytes to do
  $B05F get length compare back
  $B061 branch if str 1 < str 2
  $B063 flag str 1 <= str 2
  $B064 go evaluate result
  $B066 get string 2 byte
  $B068 compare with string 1 byte
  $B06A loop if bytes =
  $B06C set str 1 < string 2
  $B06E branch if so
  $B070 set str 1 > string 2
  $B072 x = 0, 1 or 2
  $B073 copy to `A`
  $B074 * 2 (1, 2 or 4)
  $B075 AND with the comparison evaluation flag
  $B077 branch if 0 (compare is false)
  $B079 else set result true
  $B07B save `A` as integer byte and return

c $B07E perform DIM
  $B07E scan for ",", else do syntax error then warm start
N $B081 This is the main entry point of the routine.
  $B081 copy "DIM" flag to `X`
  $B082 search for variable
  $B085 scan memory
  $B088 scan for "," and loop if not null
  $B08A

c $B08B search for variable
  $B08B set DIM flag = $00
  $B08D scan memory, 1st character
  $B090 save DIM flag
  $B092 save 1st character
  $B094 scan memory
  $B097 check byte, return Cb = 0 if<"A" or >"Z"
  $B09A branch if ok
  $B09C else syntax error then warm start
N $B09F was variable name so ...
  $B09F clear 2nd character temp
  $B0A1 clear data type flag, $FF = string, $00 = numeric
  $B0A3 clear data type flag, $80 = integer, $00 = float
  $B0A5 increment and scan memory, 2nd character
  $B0A8 if character = "0"-"9" (ok) go save 2nd character
N $B0AA 2nd character wasn't "0" to "9" so ...
  $B0AA check byte, return Cb = 0 if<"A" or >"Z"
  $B0AD branch if <"A" or >"Z" (go check if string)
  $B0AF copy 2nd character
N $B0B0 ignore further (valid) characters in the variable name
  $B0B0 increment and scan memory, 3rd character
  $B0B3 loop if character = "0"-"9" (ignore)
  $B0B5 check byte, return Cb = 0 if<"A" or >"Z"
  $B0B8 loop if character = "A"-"Z" (ignore)
N $B0BA check if string variable
  $B0BA,c compare with "$"
  $B0BC branch if not string
N $B0BE type is string
  $B0BE set data type = string
  $B0C0 set data type flag, $FF = string, $00 = numeric
  $B0C2 branch always
  $B0C4,c compare with "%"
  $B0C6 branch if not integer
  $B0C8 get subscript/FNX flag
  $B0CA if ?? do syntax error then warm start
  $B0CC set integer type
  $B0CE set data type = integer
  $B0D0 OR current variable name first byte
  $B0D2 save current variable name first byte
  $B0D4 get 2nd character back
  $B0D5 set top bit, indicate string or integer variable
  $B0D7 copy back to 2nd character temp
  $B0D8 increment and scan memory
  $B0DB save 2nd character
  $B0DD set carry for subtract
  $B0DE or with subscript/FNX flag - or FN name
  $B0E0,c subtract "("
  $B0E2 branch if not "("
  $B0E4 go find, or make, array
N $B0E7 either find or create variable
N $B0E7 variable name wasn't xx(.... so look for plain variable
  $B0E7 clear `A`
  $B0E9 clear subscript/FNX flag
  $B0EB get start of variables low byte
  $B0ED get start of variables high byte
  $B0EF save search address high byte
  $B0F1 save search address low byte
  $B0F3 compare with end of variables high byte
  $B0F5 skip next compare if <>
N $B0F7 high addresses were = so compare low addresses
  $B0F7 compare low address with end of variables low byte
  $B0F9 if not found go make new variable
  $B0FB get 1st character of variable to find
  $B0FD compare with variable name 1st character
  $B0FF branch if no match
N $B101 1st characters match so compare 2nd character
  $B101 get 2nd character of variable to find
  $B103 index to point to variable name 2nd character
  $B104 compare with variable name 2nd character
  $B106 branch if match (found variable)
  $B108 else decrement index (now = $00)
  $B109 clear carry for add
  $B10A get search address low byte
  $B10C +7, offset to next variable name
  $B10E loop if no overflow to high byte
  $B110 else increment high byte
  $B111 loop always, RAM doesn't extend to $FFFF
N $B113 check byte, return Cb = 0 if<"A" or >"Z"
  $B113,c compare with "A"
  $B115 exit if less
N $B117 carry is set
  $B117 subtract "Z"+1
  $B119 set carry
  $B11A subtract $A5 (restore byte)
N $B11C carry clear if byte > $5A
  $B11C
N $B11D reached end of variable memory without match ... so create new variable
  $B11D pop return address low byte
  $B11E push return address low byte
  $B11F compare with expected calling routine return low byte
  $B121 if not get variable go create new variable
N $B123 this will only drop through if the call was from #R$AF28 and is only called from there if it is searching for a variable from the right hand side of a LET a=b statement, it prevents the creation of variables not assigned a value.
N $B123 value returned by this is either numeric zero, exponent byte is $00, or null string, descriptor length byte is $00. in fact a pointer to any $00 byte would have done. else return dummy null value
  $B123 set result pointer low byte
  $B125 set result pointer high byte
  $B127
N $B128 create new numeric variable
  $B128 get variable name first character
  $B12A get variable name second character
  $B12C,c compare first character with "T"
  $B12E branch if not "T"
  $B130,c compare second character with "I$"
  $B132 if "I$" return null value
  $B134,c compare second character with "I"
  $B136 branch if not "I"
N $B138 if name is "TI" do syntax error
  $B138 do syntax error then warm start
  $B13B,c compare first character with "S"
  $B13D branch if not "S"
  $B13F,c compare second character with "T"
  $B141 if name is "ST" do syntax error
  $B143 get end of variables low byte
  $B145 get end of variables high byte
  $B147 save old block start low byte
  $B149 save old block start high byte
  $B14B get end of arrays low byte
  $B14D get end of arrays high byte
  $B14F save old block end low byte
  $B151 save old block end high byte
  $B153 clear carry for add
  $B154 +7, space for one variable
  $B156 branch if no overflow to high byte
  $B158 else increment high byte
  $B159 set new block end low byte
  $B15B set new block end high byte
  $B15D open up space in memory
  $B160 get new start low byte
  $B162 get new start high byte (-$100)
  $B164 correct high byte
  $B165 set end of variables low byte
  $B167 set end of variables high byte
  $B169 clear index
  $B16B get variable name 1st character
  $B16D save variable name 1st character
  $B16F increment index
  $B170 get variable name 2nd character
  $B172 save variable name 2nd character
  $B174 clear `A`
  $B176 increment index
  $B177 initialise variable byte
  $B179 increment index
  $B17A initialise variable byte
  $B17C increment index
  $B17D initialise variable byte
  $B17F increment index
  $B180 initialise variable byte
  $B182 increment index
  $B183 initialise variable byte
N $B185 found a match for variable
  $B185 get variable address low byte
  $B187 clear carry for add
  $B188 +2, offset past variable name bytes
  $B18A get variable address high byte
  $B18C branch if no overflow from add
  $B18E else increment high byte
  $B18F save current variable pointer low byte
  $B191 save current variable pointer high byte
  $B193

c $B194 set-up array pointer to first element in array
  $B194 get # of dimensions (1, 2 or 3)
  $B196 *2 (also clears the carry !)
  $B197 +5 (result is 7, 9 or 11 here)
  $B199 add array start pointer low byte
  $B19B get array pointer high byte
  $B19D branch if no overflow
  $B19F else increment high byte
  $B1A0 save array data pointer low byte
  $B1A2 save array data pointer high byte
  $B1A4

b $B1A5 -32768 as floating value
  $B1A5,5 -32768

c $B1AA convert float to fixed
  $B1AA evaluate integer expression, no sign check
  $B1AD get result low byte
  $B1AF get result high byte
  $B1B1

c $B1B2 evaluate integer expression
  $B1B2 increment and scan memory
  $B1B5 evaluate expression
N $B1B8 evaluate integer expression, sign check
  $B1B8 check if source is numeric, else do type mismatch
  $B1BB get FAC1 sign (b7)
  $B1BD do illegal quantity error if -ve
N $B1BF evaluate integer expression, no sign check
  $B1BF get FAC1 exponent
  $B1C1 compare with exponent = 2^16 (n>2^15)
  $B1C3 if n<2^16 go convert FAC1 floating to fixed and return
  $B1C5 set pointer low byte to -32768
  $B1C7 set pointer high byte to -32768
  $B1C9 compare FAC1 with (`AY`)
  $B1CC if <> do illegal quantity error then warm start
  $B1CE convert FAC1 floating to fixed and return

c $B1D1 find or make array
D $B1D1 an array is stored as follows
D $B1D1 #TABLE(default,,:w,:w,:w,:w)<nowrap>
. { =r5 array name       | =c4 two bytes with the following patterns for different types }
. {                        =h 1st char b7 | =h 2nd char b7 | =h type        | =h element size }
. {                        0              | 0              | floating point | 5 }
. {                        0              | 1              | string         | 3 }
. {                        1              | 1              | integer        | 2 }
. { offset to next array | =c4 word }
. { dimension count      | =c4 byte }
. { 1st dimension size   | =c4 word, this is the number of elements including 0 }
. { 2nd dimension size   | =c4 word, only here if the array has a second dimension }
. { 3rd dimension size   | =c4 word, only here if the array has a third dimension }
. TABLE#
D $B1D1 note: the dimension size word is in high byte low byte format, not like most 6502 words then for each element the required number of bytes given as the element size above
N $B1D1 find or make array
  $B1D1 get DIM flag
  $B1D3 OR with data type flag
  $B1D5 push it
  $B1D6 get data type flag, $FF = string, $00 = numeric
  $B1D8 push it
  $B1D9 clear dimensions count
N $B1DB now get the array dimension(s) and stack it (them) before the data type and DIM flag
  $B1DB copy dimensions count
  $B1DC save it
  $B1DD get array name 2nd byte
  $B1DF save it
  $B1E0 get array name 1st byte
  $B1E2 save it
  $B1E3 evaluate integer expression
  $B1E6 pull array name 1st byte
  $B1E7 restore array name 1st byte
  $B1E9 pull array name 2nd byte
  $B1EA restore array name 2nd byte
  $B1EC pull dimensions count
  $B1ED restore it
  $B1EE copy stack pointer
  $B1EF get DIM flag
  $B1F2 push it
  $B1F3 get data type flag
  $B1F6 push it
  $B1F7 get this dimension size high byte
  $B1F9 stack before flag bytes
  $B1FC get this dimension size low byte
  $B1FE stack before flag bytes
  $B201 increment dimensions count
  $B202 scan memory
  $B205,c compare with ","
  $B207 if found go do next dimension
  $B209 store dimensions count
  $B20B scan for ")", else do syntax error then warm start
  $B20E pull data type flag
  $B20F restore data type flag, $FF = string, $00 = numeric
  $B211 pull data type flag
  $B212 restore data type flag, $80 = integer, $00 = float
  $B214,b mask dim flag
  $B216 restore DIM flag
  $B218 set end of variables low byte (array memory start low byte)
  $B21A set end of variables high byte (array memory start high byte)
N $B21C now check to see if we are at the end of array memory, we would be if there were no arrays.
  $B21C save as array start pointer low byte
  $B21E save as array start pointer high byte
  $B220 compare with end of arrays high byte
  $B222 branch if not reached array memory end
  $B224 else compare with end of arrays low byte
  $B226 go build array if not found
N $B228 search for array
  $B228 clear index
  $B22A get array name first byte
  $B22C increment index to second name byte
  $B22D compare with this array name first byte
  $B22F branch if no match
  $B231 else get this array name second byte
  $B233 compare with array name second byte
  $B235 array found so branch
N $B237 no match
  $B237 increment index
  $B238 get array size low byte
  $B23A clear carry for add
  $B23B add array start pointer low byte
  $B23D copy low byte to `X`
  $B23E increment index
  $B23F get array size high byte
  $B241 add array memory pointer high byte
  $B243 if no overflow go check next array
N $B245 do bad subscript error
  $B245 error $12, bad subscript error
B $B247,1 makes next line BIT $0EA2
N $B248 do illegal quantity error
  $B248 error $0E, illegal quantity error
  $B24A do error #`X` then warm start
N $B24D found the array
  $B24D set error $13, double dimension error
  $B24F get DIM flag
  $B251 if we are trying to dimension it do error #`X` then warm start
N $B253 found the array and we're not dimensioning it so we must find an element in it
  $B253 set-up array pointer to first element in array
  $B256 get dimensions count
  $B258 set index to array's # of dimensions
  $B25A compare with no of dimensions
  $B25C if wrong do bad subscript error
  $B25E found array so go get element
N $B261 array not found, so build it
  $B261 set-up array pointer to first element in array
  $B264 check available memory, do out of memory error if no room
  $B267 clear `Y`
  $B269 clear array data size high byte
  $B26B set default element size
  $B26D get variable name 1st byte
  $B26F save array name 1st byte
  $B271 branch if not string or floating point array
  $B273 decrement element size, $04
  $B274 increment index
  $B275 get variable name 2nd byte
  $B277 save array name 2nd byte
  $B279 branch if not integer or string
  $B27B decrement element size, $03
  $B27C decrement element size, $02
  $B27D save element size
  $B27F get dimensions count
  $B281 increment index ..
  $B282 .. to array ..
  $B283 .. dimension count
  $B284 save array dimension count
  $B286 set default dimension size low byte
  $B288 set default dimension size high byte
  $B28A test DIM flag
  $B28C branch if default to be used
  $B28E pull dimension size low byte
  $B28F clear carry for add
  $B290 add 1, allow for zeroeth element
  $B292 copy low byte to `X`
  $B293 pull dimension size high byte
  $B294 add carry to high byte
  $B296 incement index to dimension size high byte
  $B297 save dimension size high byte
  $B299 incement index to dimension size low byte
  $B29A copy dimension size low byte
  $B29B save dimension size low byte
  $B29D compute array size
  $B2A0 save result low byte
  $B2A2 save result high byte
  $B2A4 restore index
  $B2A6 decrement dimensions count
  $B2A8 loop if not all done
  $B2AA add array data pointer high byte
  $B2AC if overflow do out of memory error then warm start
  $B2AE save array data pointer high byte
  $B2B0 copy array data pointer high byte
  $B2B1 copy array size low byte
  $B2B2 add array data pointer low byte
  $B2B4 branch if no rollover
  $B2B6 else increment next array pointer high byte
  $B2B7 if rolled over do out of memory error then warm start
  $B2B9 check available memory, do out of memory error if no room
  $B2BC set end of arrays low byte
  $B2BE set end of arrays high byte
N $B2C0 now the aray is created we need to zero all the elements in it
  $B2C0 clear `A` for array clear
  $B2C2 increment array size high byte, now block count
  $B2C4 get array size low byte, now index to block
  $B2C6 branch if $00
  $B2C8 decrement index, do 0 to n-1
  $B2C9 clear array element byte
  $B2CB loop until this block done
  $B2CD decrement array pointer high byte
  $B2CF decrement block count high byte
  $B2D1 loop until all blocks done
  $B2D3 correct for last loop
  $B2D5 set carry for subtract
  $B2D6 get end of arrays low byte
  $B2D8 subtract array start low byte
  $B2DA index to array size low byte
  $B2DC save array size low byte
  $B2DE get end of arrays high byte
  $B2E0 index to array size high byte
  $B2E1 subtract array start high byte
  $B2E3 save array size high byte
  $B2E5 get default DIM flag
  $B2E7 exit if this was a DIM command
N $B2E9 else, find element
  $B2E9 set index to # of dimensions, the dimension indices are on the stack and will be removed as the position of the array element is calculated
  $B2EA get array's dimension count
  $B2EC save it
  $B2EE clear byte
  $B2F0 clear array data pointer low byte
  $B2F2 save array data pointer high byte
  $B2F4 increment index, point to array bound high byte
  $B2F5 pull array index low byte
  $B2F6 copy to `X`
  $B2F7 save index low byte to FAC1 mantissa 3
  $B2F9 pull array index high byte
  $B2FA save index high byte to FAC1 mantissa 4
  $B2FC compare with array bound high byte
  $B2FE branch if within bounds
  $B300 if outside bounds do bad subscript error
N $B302 else high byte was = so test low bytes
  $B302 index to array bound low byte
  $B303 get array index low byte
  $B304 compare with array bound low byte
  $B306 branch if within bounds
  $B308 do bad subscript error
  $B30B do out of memory error then warm start
  $B30E index to array bound low byte
  $B30F get array data pointer high byte
  $B311 OR with array data pointer low byte
  $B313 clear carry for either add, carry always clear here ??
  $B314 branch if array data pointer = null, skip multiply
  $B316 compute array size
  $B319 get result low byte
  $B31A add index low byte from FAC1 mantissa 3
  $B31C save result low byte
  $B31D get result high byte
  $B31E restore index
  $B320 add index high byte from FAC1 mantissa 4
  $B322 save array data pointer low byte
  $B324 decrement dimensions count
  $B326 loop if dimensions still to do
  $B328 save array data pointer high byte
  $B32A set default element size
  $B32C get variable name 1st byte
  $B32E branch if not string or floating point array
  $B330 decrement element size, $04
  $B331 get variable name 2nd byte
  $B333 branch if not integer or string
  $B335 decrement element size, $03
  $B336 decrement element size, $02
  $B337 save dimension size low byte
  $B339 clear dimension size high byte
  $B33B compute array size
  $B33E copy array size low byte
  $B33F add array data start pointer low byte
  $B341 save as current variable pointer low byte
  $B343 copy array size high byte
  $B344 add array data start pointer high byte
  $B346 save as current variable pointer high byte
  $B348 copy high byte to `Y`
  $B349 get current variable pointer low byte
N $B34B pointer to element is now in `AY`
  $B34B
N $B34C compute array size, result in `XY`
  $B34C save index
  $B34E get dimension size low byte
  $B350 save dimension size low byte
  $B352 decrement index
  $B353 get dimension size high byte
  $B355 save dimension size high byte
  $B357 count = $10 (16 bit multiply)
  $B359 save bit count
  $B35B clear result low byte
  $B35D clear result high byte
  $B35F get result low byte
  $B360 *2
  $B361 save result low byte
  $B362 get result high byte
  $B363 *2
  $B364 save result high byte
  $B365 if overflow go do "Out of memory" error
  $B367 shift element size low byte
  $B369 shift element size high byte
  $B36B skip add if no carry
  $B36D else clear carry for add
  $B36E get result low byte
  $B36F add dimension size low byte
  $B371 save result low byte
  $B372 get result high byte
  $B373 add dimension size high byte
  $B375 save result high byte
  $B376 if overflow go do "Out of memory" error
  $B378 decrement bit count
  $B37A loop until all done
  $B37C

c $B37D perform FRE()
  $B37D get data type flag, $FF = string, $00 = numeric
  $B37F branch if numeric
  $B381 pop string off descriptor stack, or from top of string space; returns with `A` = length, `X`=$71=pointer low byte, `Y`=$72=pointer high byte
N $B384 FRE(n) was numeric so do this
  $B384 go do garbage collection
  $B387 set carry for subtract
  $B388 get bottom of string space low byte
  $B38A subtract end of arrays low byte
  $B38C copy result to `Y`
  $B38D get bottom of string space high byte
  $B38F subtract end of arrays high byte

c $B391 convert fixed integer `AY` to float FAC1
  $B391 set type = numeric
  $B393 clear data type flag, $FF = string, $00 = numeric
  $B395 save FAC1 mantissa 1
  $B397 save FAC1 mantissa 2
  $B399 set exponent=2^16 (integer)
  $B39B set exp = `X`, clear FAC1 3 and 4, normalise and return

c $B39E perform POS()
  $B39E set Cb for read cursor position
  $B39F read/set X,Y cursor position
  $B3A2 clear high byte
  $B3A4 convert fixed integer `AY` to float FAC1, branch always
N $B3A6 check not Direct, used by DEF and INPUT
  $B3A6 get current line number high byte
  $B3A8 increment it
  $B3A9 return if not direct mode
N $B3AB else do illegal direct error
  $B3AB error $15, illegal direct error
B $B3AD,1 makes next line BIT $1BA2
  $B3AE error $1B, undefined function error
  $B3B0 do error #`X` then warm start

c $B3B3 perform DEF
  $B3B3 check FNx syntax
  $B3B6 check not direct, back here if ok
  $B3B9 scan for "(", else do syntax error then warm start
  $B3BC set flag for FNx
  $B3BE save subscript/FNx flag
  $B3C0 get variable address
  $B3C3 check if source is numeric, else do type mismatch
  $B3C6 scan for ")", else do syntax error then warm start
  $B3C9 get = token
  $B3CB scan for CHR$(`A`), else do syntax error then warm start
  $B3CE push next character
  $B3CF get current variable pointer high byte
  $B3D1 push it
  $B3D2 get current variable pointer low byte
  $B3D4 push it
  $B3D5 get BASIC execute pointer high byte
  $B3D7 push it
  $B3D8 get BASIC execute pointer low byte
  $B3DA push it
  $B3DB perform DATA
  $B3DE put execute pointer and variable pointer into function and return

c $B3E1 check FNx syntax
  $B3E1 set FN token
  $B3E3 scan for CHR$(`A`), else do syntax error then warm start
  $B3E6 set FN flag bit
  $B3E8 save FN name
  $B3EA search for FN variable
  $B3ED save function pointer low byte
  $B3EF save function pointer high byte
  $B3F1 check if source is numeric and return, else do type mismatch

c $B3F4 Evaluate FNx
  $B3F4 check FNx syntax
  $B3F7 get function pointer high byte
  $B3F9 push it
  $B3FA get function pointer low byte
  $B3FC push it
  $B3FD evaluate expression within parentheses
  $B400 check if source is numeric, else do type mismatch
  $B403 pop function pointer low byte
  $B404 restore it
  $B406 pop function pointer high byte
  $B407 restore it
  $B409 index to variable pointer high byte
  $B40B get variable address low byte
  $B40D save current variable pointer low byte
  $B40F copy address low byte
  $B410 index to variable address high byte
  $B411 get variable pointer high byte
  $B413 branch if high byte zero
  $B415 save current variable pointer high byte
  $B417 index to mantissa 3
N $B418 now stack the function variable value before use
  $B418 get byte from variable
  $B41A stack it
  $B41B decrement index
  $B41C loop until variable stacked
  $B41E get current variable pointer high byte
  $B420 pack FAC1 into (`XY`)
  $B423 get BASIC execute pointer high byte
  $B425 push it
  $B426 get BASIC execute pointer low byte
  $B428 push it
  $B429 get function execute pointer low byte
  $B42B save BASIC execute pointer low byte
  $B42D index to high byte
  $B42E get function execute pointer high byte
  $B430 save BASIC execute pointer high byte
  $B432 get current variable pointer high byte
  $B434 push it
  $B435 get current variable pointer low byte
  $B437 push it
  $B438 evaluate expression and check is numeric, else do type mismatch
  $B43B pull variable address low byte
  $B43C save variable address low byte
  $B43E pull variable address high byte
  $B43F save variable address high byte
  $B441 scan memory
  $B444 branch if null (should be [EOL] marker)
  $B446 else syntax error then warm start

c $B449 restore BASIC execute pointer and function variable from stack
  $B449 pull BASIC execute pointer low byte
  $B44A save BASIC execute pointer low byte
  $B44C pull BASIC execute pointer high byte
  $B44D save BASIC execute pointer high byte
N $B44F put execute pointer and variable pointer into function
  $B44F clear index
  $B451 pull BASIC execute pointer low byte
  $B452 save to function
  $B454 pull BASIC execute pointer high byte
  $B455 increment index
  $B456 save to function
  $B458 pull current variable address low byte
  $B459 increment index
  $B45A save to function
  $B45C pull current variable address high byte
  $B45D increment index
  $B45E save to function
  $B460 pull ??
  $B461 increment index
  $B462 save to function
  $B464

c $B465 perform STR$()
  $B465 check if source is numeric, else do type mismatch
  $B468 set string index
  $B46A convert FAC1 to string
  $B46D dump return address (skip type check)
  $B46E dump return address (skip type check)
  $B46F set result string low pointer
  $B471 set result string high pointer
  $B473 print null terminated string to utility pointer

c $B475 do string vector
D $B475 copy descriptor pointer and make string space `A` bytes long
  $B475 get descriptor pointer low byte
  $B477 get descriptor pointer high byte
  $B479 save descriptor pointer low byte
  $B47B save descriptor pointer high byte

c $B47D make string space `A` bytes long
  $B47D make space in string memory for string `A` long
  $B480 save string pointer low byte
  $B482 save string pointer high byte
  $B484 save length
  $B486

c $B487 scan, set up string
D $B487 print " terminated string to utility pointer
  $B487 set terminator to "
  $B489 set search character, terminator 1
  $B48B set terminator 2
N $B48D print search or alternate terminated string to utility pointer source is `AY`
  $B48D store string start low byte
  $B48F store string start high byte
  $B491 save string pointer low byte
  $B493 save string pointer high byte
  $B495 set length to -1
  $B497 increment length
  $B498 get byte from string
  $B49A exit loop if null byte [EOS]
  $B49C compare with search character, terminator 1
  $B49E branch if terminator
  $B4A0 compare with terminator 2
  $B4A2 loop if not terminator 2
  $B4A4 compare with "
  $B4A6 branch if " (carry set if = !)
  $B4A8 clear carry for add (only if [EOL] terminated string)
  $B4A9 save length in FAC1 exponent
  $B4AB copy length to `A`
  $B4AC add string start low byte
  $B4AE save string end low byte
  $B4B0 get string start high byte
  $B4B2 branch if no low byte overflow
  $B4B4 else increment high byte
  $B4B5 save string end high byte
  $B4B7 get string start high byte
  $B4B9 branch if in utility area
  $B4BB compare with input buffer memory high byte
  $B4BD branch if not in input buffer memory
N $B4BF string in input buffer or utility area, move to string memory
  $B4BF copy length to `A`
  $B4C0 copy descriptor pointer and make string space `A` bytes long
  $B4C3 get string start low byte
  $B4C5 get string start high byte
  $B4C7 store string `A` bytes long from `XY` to utility pointer
N $B4CA check for space on descriptor stack then ... put string address and length on descriptor stack and update stack pointers
  $B4CA get the descriptor stack pointer
  $B4CC compare it with the maximum + 1
  $B4CE if there is space on the string stack continue
N $B4D0 else do string too complex error
  $B4D0 error $19, string too complex error
  $B4D2 do error #`X` then warm start
N $B4D5 put string address and length on descriptor stack and update stack pointers
  $B4D5 get the string length
  $B4D7 put it on the string stack
  $B4D9 get the string pointer low byte
  $B4DB put it on the string stack
  $B4DD get the string pointer high byte
  $B4DF put it on the string stack
  $B4E1 clear `Y`
  $B4E3 save the string descriptor pointer low byte
  $B4E5 save the string descriptor pointer high byte, always $00
  $B4E7 clear FAC1 rounding byte
  $B4E9 `Y` = $FF
  $B4EA save the data type flag, $FF = string
  $B4EC save the current descriptor stack item pointer low byte
  $B4EE update the stack pointer
  $B4EF update the stack pointer
  $B4F0 update the stack pointer
  $B4F1 save the new descriptor stack pointer
  $B4F3

c $B4F4 make space in string memory for string `A` long
D $B4F4 return `X` = pointer low byte, `Y` = pointer high byte
  $B4F4 clear garbage collected flag (b7)
N $B4F6 make space for string `A` long
  $B4F6 save string length
  $B4F7 complement it
  $B4F9 set carry for subtract, two's complement add
  $B4FA add bottom of string space low byte, subtract length
  $B4FC get bottom of string space high byte
  $B4FE skip decrement if no underflow
  $B500 decrement bottom of string space high byte
  $B501 compare with end of arrays high byte
  $B503 do out of memory error if less
  $B505 if not = skip next test
  $B507 compare with end of arrays low byte
  $B509 do out of memory error if less
  $B50B save bottom of string space low byte
  $B50D save bottom of string space high byte
  $B50F save string utility ptr low byte
  $B511 save string utility ptr high byte
  $B513 copy low byte to `X`
  $B514 get string length back
  $B515
  $B516 error code $10, out of memory error
  $B518 get garbage collected flag
  $B51A if set then do error code `X`
  $B51C else go do garbage collection
  $B51F flag for garbage collected
  $B521 set garbage collected flag
  $B523 pull length
  $B524 go try again (loop always, length should never be = $00)

c $B526 garbage collection routine
  $B526 get end of memory low byte
  $B528 get end of memory high byte
N $B52A re-run routine from last ending
  $B52A set bottom of string space low byte
  $B52C set bottom of string space high byte
  $B52E clear index
  $B530 clear working pointer high byte
  $B532 clear working pointer low byte
  $B534 get end of arrays low byte
  $B536 get end of arrays high byte
  $B538 save as highest uncollected string pointer low byte
  $B53A save as highest uncollected string pointer high byte
  $B53C set descriptor stack pointer
  $B53E clear `X`
  $B540 save descriptor stack pointer low byte
  $B542 save descriptor stack pointer high byte ($00)
  $B544 compare with descriptor stack pointer
  $B546 branch if =
  $B548 check string salvageability
  $B54B loop always
N $B54D done stacked strings, now do string variables
  $B54D set step size = $07, collecting variables
  $B54F save garbage collection step size
  $B551 get start of variables low byte
  $B553 get start of variables high byte
  $B555 save as pointer low byte
  $B557 save as pointer high byte
  $B559 compare end of variables high byte, start of arrays high byte
  $B55B branch if no high byte match
  $B55D else compare end of variables low byte, start of arrays low byte
  $B55F branch if = variable memory end
  $B561 check variable salvageability
  $B564 loop always
N $B566 done string variables, now do string arrays
  $B566 save start of arrays low byte as working pointer
  $B568 save start of arrays high byte as working pointer
  $B56A set step size, collecting descriptors
  $B56C save step size
  $B56E get pointer low byte
  $B570 get pointer high byte
  $B572 compare with end of arrays high byte
  $B574 branch if not at end
  $B576 else compare with end of arrays low byte
  $B578 branch if not at end
  $B57A collect string, tidy up and exit if at end ??
  $B57D save pointer low byte
  $B57F save pointer high byte
  $B581 set index
  $B583 get array name first byte
  $B585 copy it
  $B586 increment index
  $B587 get array name second byte
  $B589 push the flags
  $B58A increment index
  $B58B get array size low byte
  $B58D add start of this array low byte
  $B58F save start of next array low byte
  $B591 increment index
  $B592 get array size high byte
  $B594 add start of this array high byte
  $B596 save start of next array high byte
  $B598 restore the flags
  $B599 skip if not string array
N $B59B was possibly string array so ...
  $B59B get name first byte back
  $B59C skip if not string array
  $B59E increment index
  $B59F get # of dimensions
  $B5A1 clear index
  $B5A3 *2
  $B5A4 +5 (array header size)
  $B5A6 add pointer low byte
  $B5A8 save pointer low byte
  $B5AA branch if no rollover
  $B5AC else increment pointer hgih byte
  $B5AE get pointer high byte
  $B5B0 compare pointer high byte with end of this array high byte
  $B5B2 branch if not there yet
  $B5B4 compare pointer low byte with end of this array low byte
  $B5B6 if at end of this array go check next array
  $B5B8 check string salvageability
  $B5BB loop
N $B5BD check variable salvageability
  $B5BD get variable name first byte
  $B5BF add step and exit if not string
  $B5C1 increment index
  $B5C2 get variable name second byte
  $B5C4 add step and exit if not string
  $B5C6 increment index
N $B5C7 check string salvageability
  $B5C7 get string length
  $B5C9 add step and exit if null string
  $B5CB increment index
  $B5CC get string pointer low byte
  $B5CE copy to `X`
  $B5CF increment index
  $B5D0 get string pointer high byte
  $B5D2 compare string pointer high byte with bottom of string space high byte
  $B5D4 if bottom of string space greater go test against highest uncollected string
  $B5D6 if bottom of string space less string has been collected so go update pointers, step to next and return
N $B5D8 high bytes were equal so test low bytes
  $B5D8 compare string pointer low byte with bottom of string space low byte
  $B5DA if bottom of string space less string has been collected so go update pointers, step to next and return
N $B5DC else test string against highest uncollected string so far
  $B5DC compare string pointer high byte with highest uncollected string high byte
  $B5DE if highest uncollected string is greater then go update pointers, step to next and return
  $B5E0 if highest uncollected string is less then go set this string as highest uncollected so far
N $B5E2 high bytes were equal so test low bytes
  $B5E2 compare string pointer low byte with highest uncollected string low byte
  $B5E4 if highest uncollected string is greater then go update pointers, step to next and return
N $B5E6 else set current string as highest uncollected string
  $B5E6 save string pointer low byte as highest uncollected string low byte
  $B5E8 save string pointer high byte as highest uncollected string high byte
  $B5EA get descriptor pointer low byte
  $B5EC get descriptor pointer high byte
  $B5EE save working pointer high byte
  $B5F0 save working pointer low byte
  $B5F2 get step size
  $B5F4 copy step size
  $B5F6 get step size
  $B5F8 clear carry for add
  $B5F9 add pointer low byte
  $B5FB save pointer low byte
  $B5FD branch if no rollover
  $B5FF else increment pointer high byte
  $B601 get pointer high byte
  $B603 flag not moved
  $B605
N $B606 collect string
  $B606 get working pointer low byte
  $B608 OR working pointer high byte
  $B60A exit if nothing to collect
  $B60C get copied step size
  $B60E mask step size, $04 for variables, $00 for array or stack
  $B610 >> 1
  $B611 copy to index
  $B612 save offset to descriptor start
  $B614 get string length low byte
  $B616 add string start low byte
  $B618 set block end low byte
  $B61A get string start high byte
  $B61C add carry
  $B61E set block end high byte
  $B620 get bottom of string space low byte
  $B622 get bottom of string space high byte
  $B624 save destination end low byte
  $B626 save destination end high byte
  $B628 open up space in memory, don't set array end. this copies the string from where it is to the end of the uncollected string memory
  $B62B restore offset to descriptor start
  $B62D increment index to string pointer low byte
  $B62E get new string pointer low byte
  $B630 save new string pointer low byte
  $B632 copy string pointer low byte
  $B633 increment new string pointer high byte
  $B635 get new string pointer high byte
  $B637 increment index to string pointer high byte
  $B638 save new string pointer high byte
  $B63A re-run routine from last ending, `XA` holds new bottom of string memory pointer

c $B63D concatenate
D $B63D add strings, the first string is in the descriptor, the second string is in line
  $B63D get descriptor pointer high byte
  $B63F put on stack
  $B640 get descriptor pointer low byte
  $B642 put on stack
  $B643 get value from line
  $B646 check if source is string, else do type mismatch
  $B649 get descriptor pointer low byte back
  $B64A set pointer low byte
  $B64C get descriptor pointer high byte back
  $B64D set pointer high byte
  $B64F clear index
  $B651 get length of first string from descriptor
  $B653 clear carry for add
  $B654 add length of second string
  $B656 branch if no overflow
  $B658 else error $17, string too long error
  $B65A do error #`X` then warm start
  $B65D copy descriptor pointer and make string space `A` bytes long
  $B660 copy string from descriptor to utility pointer
  $B663 get descriptor pointer low byte
  $B665 get descriptor pointer high byte
  $B667 pop (`YA`) descriptor off stack or from top of string space
N $B66A returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B66A store string from pointer to utility pointer
  $B66D get descriptor pointer low byte
  $B66F get descriptor pointer high byte
  $B671 pop (`YA`) descriptor off stack or from top of string space
N $B674 returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B674 check space on descriptor stack then put string address and length on descriptor stack and update stack pointers
  $B677 continue evaluation

c $B67A copy string from descriptor to utility pointer
  $B67A clear index
  $B67C get string length
  $B67E save it
  $B67F increment index
  $B680 get string pointer low byte
  $B682 copy to `X`
  $B683 increment index
  $B684 get string pointer high byte
  $B686 copy to `Y`
  $B687 get length back
  $B688 save string pointer low byte
  $B68A save string pointer high byte
N $B68C store string from pointer to utility pointer
  $B68C copy length as index
  $B68D branch if null string
  $B68F save length
  $B690 decrement length/index
  $B691 get byte from string
  $B693 save byte to destination
  $B695 copy length/index
  $B696 loop if not all done yet
  $B698 restore length
  $B699 clear carry for add
  $B69A add string utility ptr low byte
  $B69C save string utility ptr low byte
  $B69E branch if no rollover
  $B6A0 increment string utility ptr high byte
  $B6A2

c $B6A3 evaluate string
  $B6A3 check if source is string, else do type mismatch
N $B6A6 pop string off descriptor stack, or from top of string space. returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B6A6 get descriptor pointer low byte
  $B6A8 get descriptor pointer high byte
N $B6AA pop (`YA`) descriptor off stack or from top of string space. returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B6AA save string pointer low byte
  $B6AC save string pointer high byte
  $B6AE clean descriptor stack, `YA` = pointer
  $B6B1 save status flags
  $B6B2 clear index
  $B6B4 get length from string descriptor
  $B6B6 put on stack
  $B6B7 increment index
  $B6B8 get string pointer low byte from descriptor
  $B6BA copy to `X`
  $B6BB increment index
  $B6BC get string pointer high byte from descriptor
  $B6BE copy to `Y`
  $B6BF get string length back
  $B6C0 restore status
  $B6C1 branch if pointer <> last_sl,last_sh
  $B6C3 compare with bottom of string space high byte
  $B6C5 branch if <>
  $B6C7 else compare with bottom of string space low byte
  $B6C9 branch if <>
  $B6CB save string length
  $B6CC clear carry for add
  $B6CD add bottom of string space low byte
  $B6CF set bottom of string space low byte
  $B6D1 skip increment if no overflow
  $B6D3 increment bottom of string space high byte
  $B6D5 restore string length
  $B6D6 save string pointer low byte
  $B6D8 save string pointer high byte
  $B6DA

c $B6DB clean descriptor stack
D $B6DB `YA` = pointer. checks if `AY` is on the descriptor stack, if so does a stack discard
  $B6DB compare high byte with current descriptor stack item pointer high byte
  $B6DD exit if <>
  $B6DF compare low byte with current descriptor stack item pointer low byte
  $B6E1 exit if <>
  $B6E3 set descriptor stack pointer
  $B6E5 update last string pointer low byte
  $B6E7 save current descriptor stack item pointer low byte
  $B6E9 clear high byte
  $B6EB

c $B6EC perform CHR$()
  $B6EC evaluate byte expression, result in `X`
  $B6EF copy to `A`
  $B6F0 save character
  $B6F1 string is single byte
  $B6F3 make string space `A` bytes long
  $B6F6 get character back
  $B6F7 clear index
  $B6F9 save byte in string - byte IS string!
  $B6FB dump return address (skip type check)
  $B6FC dump return address (skip type check)
  $B6FD check space on descriptor stack then put string address and length on descriptor stack and update stack pointers

c $B700 perform LEFT$()
  $B700 pull string data and byte parameter from stack. return pointer in descriptor, byte in `A` (and `X`), `Y`=0
  $B703 compare byte parameter with string length
  $B705 clear `A`
  $B706 branch if string length > byte parameter
  $B708 else make parameter = length
  $B70A copy to byte parameter copy
  $B70B clear string start offset
  $B70C save string start offset
  $B70D copy byte parameter (or string length if <)
  $B70E save string length
  $B70F make string space `A` bytes long
  $B712 get descriptor pointer low byte
  $B714 get descriptor pointer high byte
  $B716 pop (`YA`) descriptor off stack or from top of string space. returns with `A` = length, `X` = pointer low byte, `Y` = pointer high byte
  $B719 get string length back
  $B71A copy length to `Y`
  $B71B get string start offset back
  $B71C clear carry for add
  $B71D add start offset to string start pointer low byte
  $B71F save string start pointer low byte
  $B721 branch if no overflow
  $B723 else increment string start pointer high byte
  $B725 copy length to `A`
  $B726 store string from pointer to utility pointer
  $B729 check space on descriptor stack then put string address and length on descriptor stack and update stack pointers

c $B72C perform RIGHT$()
  $B72C pull string data and byte parameter from stack. return pointer in descriptor, byte in `A` (and `X`), `Y`=0
  $B72F clear carry for add-1
  $B730 subtract string length
  $B732 invert it (`A`=LEN(expression$)-l)
  $B734 go do rest of LEFT$()

c $B737 perform MID$()
  $B737 set default length = 255
  $B739 save default length
  $B73B scan memory
  $B73E,c compare with ")"
  $B740 branch if = ")" (skip second byte get)
  $B742 scan for ",", else do syntax error then warm start
  $B745 get byte parameter
  $B748 pull string data and byte parameter from stack. return pointer in descriptor, byte in `A` (and `X`), `Y`=0
  $B74B if null do illegal quantity error then warm start
  $B74D decrement start index
  $B74E copy to `A`
  $B74F save string start offset
  $B750 clear carry for sub-1
  $B751 clear output string length
  $B753 subtract string length
  $B755 if start>string length go do null string
  $B757 complement -length
  $B759 compare byte parameter
  $B75B if length>remaining string go do RIGHT$
  $B75D get length byte
  $B75F go do string copy, branch always

c $B761 pull string data and byte parameter from stack
D $B761 return pointer in descriptor, byte in `A` (and `X`), `Y`=0
  $B761 scan for ")", else do syntax error then warm start
  $B764 pull return address low byte
  $B765 save return address low byte
  $B766 pull return address high byte
  $B767 save return address high byte
  $B769 dump call to function vector low byte
  $B76A dump call to function vector high byte
  $B76B pull byte parameter
  $B76C copy byte parameter to `X`
  $B76D pull string pointer low byte
  $B76E save it
  $B770 pull string pointer high byte
  $B771 save it
  $B773 get return address high byte
  $B775 back on stack
  $B776 get return address low byte
  $B777 back on stack
  $B778 clear index
  $B77A copy byte parameter
  $B77B

c $B77C perform LEN()
  $B77C evaluate string, get length in `A` (and `Y`)
  $B77F convert `Y` to byte in FAC1 and return

c $B782 evaluate string, get length in `Y`
  $B782 evaluate string
  $B785 set data type = numeric
  $B787 clear data type flag, $FF = string, $00 = numeric
  $B789 copy length to `Y`
  $B78A

c $B78B perform ASC()
  $B78B evaluate string, get length in `A` (and `Y`)
  $B78E if null do illegal quantity error then warm start
  $B790 set index to first character
  $B792 get byte
  $B794 copy to `Y`
  $B795 convert `Y` to byte in FAC1 and return

c $B798 do illegal quantity error then warm start
  $B798 do illegal quantity error then warm start

c $B79B scan and get byte parameter
  $B79B increment and scan memory

c $B79E get byte parameter
  $B79E evaluate expression and check is numeric, else do type mismatch

c $B7A1 evaluate byte expression, result in `X`
  $B7A1 evaluate integer expression, sign check
  $B7A4 get FAC1 mantissa 3
  $B7A6 if not null do illegal quantity error then warm start
  $B7A8 get FAC1 mantissa 4
  $B7AA scan memory and return

c $B7AD perform VAL()
  $B7AD evaluate string, get length in `A` (and `Y`)
  $B7B0 branch if not null string
N $B7B2 string was null so set result = $00
  $B7B2 clear FAC1 exponent and sign and return
  $B7B5 get BASIC execute pointer low byte
  $B7B7 get BASIC execute pointer high byte
  $B7B9 save BASIC execute pointer low byte
  $B7BB save BASIC execute pointer high byte
  $B7BD get string pointer low byte
  $B7BF save BASIC execute pointer low byte
  $B7C1 clear carry for add
  $B7C2 add string length
  $B7C4 save string end low byte
  $B7C6 get string pointer high byte
  $B7C8 save BASIC execute pointer high byte
  $B7CA branch if no high byte increment
  $B7CC increment string end high byte
  $B7CD save string end high byte
  $B7CF set index to $00
  $B7D1 get string end byte
  $B7D3 push it
  $B7D4 clear `A`
  $B7D5 terminate string with $00
  $B7D7 scan memory
  $B7DA get FAC1 from string
  $B7DD restore string end byte
  $B7DE clear index
  $B7E0 put string end byte back

c $B7E2 restore BASIC execute pointer from temp
  $B7E2 get BASIC execute pointer low byte back
  $B7E4 get BASIC execute pointer high byte back
  $B7E6 save BASIC execute pointer low byte
  $B7E8 save BASIC execute pointer high byte
  $B7EA

c $B7EB get parameters for POKE/WAIT
  $B7EB evaluate expression and check is numeric, else do type mismatch
  $B7EE convert FAC_1 to integer in temporary integer
  $B7F1 scan for ",", else do syntax error then warm start
  $B7F4 get byte parameter and return

c $B7F7 convert FAC_1 to integer in temporary integer
  $B7F7 get FAC1 sign
  $B7F9 if -ve do illegal quantity error then warm start
  $B7FB get FAC1 exponent
  $B7FD compare with exponent = 2^16
  $B7FF if >= do illegal quantity error then warm start
  $B801 convert FAC1 floating to fixed
  $B804 get FAC1 mantissa 3
  $B806 get FAC1 mantissa 4
  $B808 save temporary integer low byte
  $B80A save temporary integer high byte
  $B80C

c $B80D perform PEEK()
  $B80D get line number high byte
  $B80F save line number high byte
  $B810 get line number low byte
  $B812 save line number low byte
  $B813 convert FAC_1 to integer in temporary integer
  $B816 clear index
  $B818 read byte
  $B81A copy byte to `A`
  $B81B pull byte
  $B81C restore line number low byte
  $B81E pull byte
  $B81F restore line number high byte
  $B821 convert `Y` to byte in FAC_1 and return

c $B824 perform POKE
  $B824 get parameters for POKE/WAIT
  $B827 copy byte to `A`
  $B828 clear index
  $B82A write byte
  $B82C

c $B82D perform WAIT
  $B82D get parameters for POKE/WAIT
  $B830 save byte
  $B832 clear mask
  $B834 scan memory
  $B837 skip if no third argument
  $B839 scan for "," and get byte, else syntax error then warm start
  $B83C save EOR argument
  $B83E clear index
  $B840 get byte via temporary integer (address)
  $B842 EOR with second argument (mask)
  $B844 AND with first argument (byte)
  $B846 loop if result is zero
  $B848

c $B849 add 0.5 to FAC1 (round FAC1)
  $B849 set 0.5 pointer low byte
  $B84B set 0.5 pointer high byte
  $B84D add (`AY`) to FAC1

c $B850 perform subtraction, FAC1 from (`AY`)
  $B850 unpack memory (`AY`) into FAC2

c $B853 perform subtraction, FAC1 from FAC2
  $B853 get FAC1 sign (b7)
  $B855 complement it
  $B857 save FAC1 sign (b7)
  $B859 EOR with FAC2 sign (b7)
  $B85B save sign compare (FAC1 EOR FAC2)
  $B85D get FAC1 exponent
  $B85F add FAC2 to FAC1 and return

c $B862 shift FACX `A` times right
  $B862 shift FACX `A` times right (>8 shifts)
  $B865 go subtract mantissas
N $B867 add (`AY`) to FAC1
  $B867 unpack memory (`AY`) into FAC2

c $B86A add FAC2 to FAC1
  $B86A branch if FAC1 is not zero
  $B86C FAC1 was zero so copy FAC2 to FAC1 and return
N $B86F FAC1 is non zero
  $B86F get FAC1 rounding byte
  $B871 save as FAC2 rounding byte
  $B873 set index to FAC2 exponent address
  $B875 get FAC2 exponent
  $B877 copy exponent
  $B878 exit if zero
  $B87A set carry for subtract
  $B87B subtract FAC1 exponent
  $B87D if equal go add mantissas
  $B87F if FAC2 < FAC1 then go shift FAC2 right
N $B881 else FAC2 > FAC1
  $B881 save FAC1 exponent
  $B883 get FAC2 sign (b7)
  $B885 save FAC1 sign (b7)
  $B887 complement `A`
  $B889 +1, twos complement, carry is set
  $B88B clear `Y`
  $B88D clear FAC2 rounding byte
  $B88F set index to FAC1 exponent address
  $B891 branch always
N $B893 FAC2 < FAC1
  $B893 clear `Y`
  $B895 clear FAC1 rounding byte
  $B897 compare exponent diff with $F9
  $B899 branch if range $79-$F8
  $B89B copy exponent difference to `Y`
  $B89C get FAC1 rounding byte
  $B89E shift FAC? mantissa 1
  $B8A0 shift FACX `Y` times right
N $B8A3 exponents are equal now do mantissa subtract
  $B8A3 test sign compare (FAC1 EOR FAC2)
  $B8A5 if = add FAC2 mantissa to FAC1 mantissa and return
  $B8A7 set the `Y` index to FAC1 exponent address
  $B8A9 compare `X` to FAC2 exponent address
  $B8AB if = continue, `Y` = FAC1, `X` = FAC2
  $B8AD else set the `Y` index to FAC2 exponent address
N $B8AF subtract the smaller from the bigger (take the sign of the bigger)
  $B8AF set carry for subtract
  $B8B0 ones complement `A`
  $B8B2 add FAC2 rounding byte
  $B8B4 save FAC1 rounding byte
  $B8B6 get FACY mantissa 4
  $B8B9 subtract FACX mantissa 4
  $B8BB save FAC1 mantissa 4
  $B8BD get FACY mantissa 3
  $B8C0 subtract FACX mantissa 3
  $B8C2 save FAC1 mantissa 3
  $B8C4 get FACY mantissa 2
  $B8C7 subtract FACX mantissa 2
  $B8C9 save FAC1 mantissa 2
  $B8CB get FACY mantissa 1
  $B8CE subtract FACX mantissa 1
  $B8D0 save FAC1 mantissa 1

c $B8D2 do ABS and normalise FAC1
  $B8D2 branch if number is +ve
  $B8D4 negate FAC1

c $B8D7 normalise FAC1
  $B8D7 clear `Y`
  $B8D9 clear `A`
  $B8DA clear carry for add
  $B8DB get FAC1 mantissa 1
  $B8DD if not zero normalise FAC1
  $B8DF get FAC1 mantissa 2
  $B8E1 save FAC1 mantissa 1
  $B8E3 get FAC1 mantissa 3
  $B8E5 save FAC1 mantissa 2
  $B8E7 get FAC1 mantissa 4
  $B8E9 save FAC1 mantissa 3
  $B8EB get FAC1 rounding byte
  $B8ED save FAC1 mantissa 4
  $B8EF clear FAC1 rounding byte
  $B8F1 add x to exponent offset
  $B8F3 compare with $20, max offset, all bits would be = 0
  $B8F5 loop if not max

c $B8F7 clear FAC1 exponent and sign
  $B8F7 clear `A`
  $B8F9 set FAC1 exponent

c $B8FB save FAC1 sign
  $B8FB save FAC1 sign (b7)
  $B8FD

c $B8FE add FAC2 mantissa to FAC1 mantissa
  $B8FE add FAC2 rounding byte
  $B900 save FAC1 rounding byte
  $B902 get FAC1 mantissa 4
  $B904 add FAC2 mantissa 4
  $B906 save FAC1 mantissa 4
  $B908 get FAC1 mantissa 3
  $B90A add FAC2 mantissa 3
  $B90C save FAC1 mantissa 3
  $B90E get FAC1 mantissa 2
  $B910 add FAC2 mantissa 2
  $B912 save FAC1 mantissa 2
  $B914 get FAC1 mantissa 1
  $B916 add FAC2 mantissa 1
  $B918 save FAC1 mantissa 1
  $B91A test and normalise FAC1 for C=0/1
  $B91D add 1 to exponent offset
  $B91F shift FAC1 rounding byte
  $B921 shift FAC1 mantissa 4
  $B923 shift FAC1 mantissa 3
  $B925 shift FAC1 mantissa 2
  $B927 shift FAC1 mantissa 1
N $B929 normalise FAC1
  $B929 loop if not normalised
  $B92B set carry for subtract
  $B92C subtract FAC1 exponent
  $B92E branch if underflow (set result = $0)
  $B930 complement exponent
  $B932 +1 (twos complement)
  $B934 save FAC1 exponent
N $B936 test and normalise FAC1 for C=0/1
  $B936 exit if no overflow
N $B938 normalise FAC1 for C=1
  $B938 increment FAC1 exponent
  $B93A if zero do overflow error then warm start
  $B93C shift FAC1 mantissa 1
  $B93E shift FAC1 mantissa 2
  $B940 shift FAC1 mantissa 3
  $B942 shift FAC1 mantissa 4
  $B944 shift FAC1 rounding byte
  $B946

c $B947 negate FAC1
  $B947 get FAC1 sign (b7)
  $B949 complement it
  $B94B save FAC1 sign (b7)
N $B94D twos complement FAC1 mantissa
  $B94D get FAC1 mantissa 1
  $B94F complement it
  $B951 save FAC1 mantissa 1
  $B953 get FAC1 mantissa 2
  $B955 complement it
  $B957 save FAC1 mantissa 2
  $B959 get FAC1 mantissa 3
  $B95B complement it
  $B95D save FAC1 mantissa 3
  $B95F get FAC1 mantissa 4
  $B961 complement it
  $B963 save FAC1 mantissa 4
  $B965 get FAC1 rounding byte
  $B967 complement it
  $B969 save FAC1 rounding byte
  $B96B increment FAC1 rounding byte
  $B96D exit if no overflow
N $B96F increment FAC1 mantissa
  $B96F increment FAC1 mantissa 4
  $B971 finished if no rollover
  $B973 increment FAC1 mantissa 3
  $B975 finished if no rollover
  $B977 increment FAC1 mantissa 2
  $B979 finished if no rollover
  $B97B increment FAC1 mantissa 1
  $B97D

c $B97E do overflow error then warm start
  $B97E error $0F, overflow error
  $B980 do error #`X` then warm start

c $B983 shift FCAtemp << `A`+8 times
  $B983 set the offset to FACtemp
  $B985 get FACX mantissa 4
  $B987 save as FAC1 rounding byte
  $B989 get FACX mantissa 3
  $B98B save FACX mantissa 4
  $B98D get FACX mantissa 2
  $B98F save FACX mantissa 3
  $B991 get FACX mantissa 1
  $B993 save FACX mantissa 2
  $B995 get FAC1 overflow byte
  $B997 save FACX mantissa 1
N $B999 shift FACX -`A` times right (> 8 shifts)
  $B999 add 8 to shift count
  $B99B go do 8 shift if still -ve
  $B99D go do 8 shift if zero
  $B99F else subtract 8 again
  $B9A1 save count to `Y`
  $B9A2 get FAC1 rounding byte
  $B9A4
  $B9A6 shift FACX mantissa 1
  $B9A8 branch if +ve
  $B9AA this sets b7 eventually
  $B9AC shift FACX mantissa 1 (correct for ASL)
  $B9AE shift FACX mantissa 1 (put carry in b7)
N $B9B0 shift FACX `Y` times right
  $B9B0 shift FACX mantissa 2
  $B9B2 shift FACX mantissa 3
  $B9B4 shift FACX mantissa 4
  $B9B6 shift FACX rounding byte
  $B9B7 increment exponent diff
  $B9B8 branch if range adjust not complete
  $B9BA just clear it
  $B9BB

b $B9BC constants and series for LOG(n)
  $B9BC,5 1
  $B9C1,1 series counter
  $B9C2,5 .434255942
  $B9C7,5 .576584541
  $B9CC,5 .961800759
  $B9D1,5 2.88539007
  $B9D6,5 .707106781 = 1/SQR(2)
  $B9DB,5 1.41421356 = SQR(2)
  $B9E0,5 -.5
  $B9E5,5 .693147181 = LOG(2)

c $B9EA perform LOG()
  $B9EA test sign and zero
  $B9ED if zero do illegal quantity error then warm start
  $B9EF skip error if +ve
  $B9F1 do illegal quantity error then warm start
  $B9F4 get FAC1 exponent
  $B9F6 normalise it
  $B9F8 save it
  $B9F9 set exponent to zero
  $B9FB save FAC1 exponent
  $B9FD pointer to 1/root 2 low byte
  $B9FF pointer to 1/root 2 high byte
  $BA01 add (`AY`) to FAC1 (1/root2)
  $BA04 pointer to root 2 low byte
  $BA06 pointer to root 2 high byte
  $BA08 convert `AY` and do (`AY`)/FAC1 (root2/(x+(1/root2)))
  $BA0B pointer to 1 low byte
  $BA0D pointer to 1 high byte
  $BA0F subtract FAC1 ((root2/(x+(1/root2)))-1) from (`AY`)
  $BA12 pointer to series for LOG(n) low byte
  $BA14 pointer to series for LOG(n) high byte
  $BA16 ^2 then series evaluation
  $BA19 pointer to -0.5 low byte
  $BA1B pointer to -0.5 high byte
  $BA1D add (`AY`) to FAC1
  $BA20 restore FAC1 exponent
  $BA21 evaluate new ASCII digit
  $BA24 pointer to LOG(2) low byte
  $BA26 pointer to LOG(2) high byte

c $BA28 do convert `AY`, FCA1*(`AY`)
  $BA28 unpack memory (`AY`) into FAC2
  $BA2B multiply FAC1 by FAC2 ??
  $BA2D exit if zero
  $BA30 test and adjust accumulators
  $BA33 clear `A`
  $BA35 clear temp mantissa 1
  $BA37 clear temp mantissa 2
  $BA39 clear temp mantissa 3
  $BA3B clear temp mantissa 4
  $BA3D get FAC1 rounding byte
  $BA3F go do shift/add FAC2
  $BA42 get FAC1 mantissa 4
  $BA44 go do shift/add FAC2
  $BA47 get FAC1 mantissa 3
  $BA49 go do shift/add FAC2
  $BA4C get FAC1 mantissa 2
  $BA4E go do shift/add FAC2
  $BA51 get FAC1 mantissa 1
  $BA53 go do shift/add FAC2
  $BA56 copy temp to FAC1, normalise and return
  $BA59 branch if byte <> zero
  $BA5B shift FCAtemp << `A`+8 times
N $BA5E else do shift and add
  $BA5E shift byte
  $BA5F set top bit (mark for 8 times)
  $BA61 copy result
  $BA62 skip next if bit was zero
  $BA64 clear carry for add
  $BA65 get temp mantissa 4
  $BA67 add FAC2 mantissa 4
  $BA69 save temp mantissa 4
  $BA6B get temp mantissa 3
  $BA6D add FAC2 mantissa 3
  $BA6F save temp mantissa 3
  $BA71 get temp mantissa 2
  $BA73 add FAC2 mantissa 2
  $BA75 save temp mantissa 2
  $BA77 get temp mantissa 1
  $BA79 add FAC2 mantissa 1
  $BA7B save temp mantissa 1
  $BA7D shift temp mantissa 1
  $BA7F shift temp mantissa 2
  $BA81 shift temp mantissa 3
  $BA83 shift temp mantissa 4
  $BA85 shift temp rounding byte
  $BA87 get byte back
  $BA88 shift byte
  $BA89 loop if all bits not done
  $BA8B

c $BA8C unpack memory (`AY`) into FAC2
  $BA8C save pointer low byte
  $BA8E save pointer high byte
  $BA90 5 bytes to get (0-4)
  $BA92 get mantissa 4
  $BA94 save FAC2 mantissa 4
  $BA96 decrement index
  $BA97 get mantissa 3
  $BA99 save FAC2 mantissa 3
  $BA9B decrement index
  $BA9C get mantissa 2
  $BA9E save FAC2 mantissa 2
  $BAA0 decrement index
  $BAA1 get mantissa 1 + sign
  $BAA3 save FAC2 sign (b7)
  $BAA5 EOR with FAC1 sign (b7)
  $BAA7 save sign compare (FAC1 EOR FAC2)
  $BAA9 recover FAC2 sign (b7)
  $BAAB set 1xxx xxx (set normal bit)
  $BAAD save FAC2 mantissa 1
  $BAAF decrement index
  $BAB0 get exponent byte
  $BAB2 save FAC2 exponent
  $BAB4 get FAC1 exponent
  $BAB6

c $BAB7 test and adjust accumulators
  $BAB7 get FAC2 exponent
  $BAB9 branch if FAC2 = $00 (handle underflow)
  $BABB clear carry for add
  $BABC add FAC1 exponent
  $BABE branch if sum of exponents < $0100
  $BAC0 do overflow error
  $BAC2 clear carry for the add
B $BAC3,1 makes next line BIT $1410
  $BAC4 if +ve go handle underflow
  $BAC6 adjust exponent
  $BAC8 save FAC1 exponent
  $BACA branch if not zero
  $BACC save FAC1 sign and return
  $BACF get sign compare (FAC1 EOR FAC2)
  $BAD1 save FAC1 sign (b7)
  $BAD3

c $BAD4 handle overflow and underflow
  $BAD4 get FAC1 sign (b7)
  $BAD6 complement it
  $BAD8 do overflow error
N $BADA handle underflow
  $BADA pop return address low byte
  $BADB pop return address high byte
  $BADC clear FAC1 exponent and sign and return
  $BADF do overflow error then warm start

c $BAE2 multiply FAC1 by 10
  $BAE2 round and copy FAC1 to FAC2
  $BAE5 copy exponent (set the flags)
  $BAE6 exit if zero
  $BAE8 clear carry for add
  $BAE9 add two to exponent (*4)
  $BAEB do overflow error if > $FF
N $BAED FAC1 = (FAC1 + FAC2) * 2
  $BAED clear byte
  $BAEF clear sign compare (FAC1 EOR FAC2)
  $BAF1 add FAC2 to FAC1 (*5)
  $BAF4 increment FAC1 exponent (*10)
  $BAF6 if exponent now zero go do overflow error
  $BAF8

b $BAF9 10 as a floating value
  $BAF9,5 10

c $BAFE divide FAC1 by 10
  $BAFE round and copy FAC1 to FAC2
  $BB01 set 10 pointer low byte
  $BB03 set 10 pointer high byte
  $BB05 clear sign

c $BB07 divide by (`AY`) (`X`=sign)
  $BB07 save sign compare (FAC1 EOR FAC2)
  $BB09 unpack memory (`AY`) into FAC1
  $BB0C do FAC2/FAC1
N $BB0F Perform divide-by

c $BB0F convert `AY` and do (`AY`)/FAC1
  $BB0F unpack memory (`AY`) into FAC2
  $BB12 if zero go do /0 error
  $BB14 round FAC1
  $BB17 clear `A`
  $BB19 set carry for subtract
  $BB1A subtract FAC1 exponent (2s complement)
  $BB1C save FAC1 exponent
  $BB1E test and adjust accumulators
  $BB21 increment FAC1 exponent
  $BB23 if zero do overflow error
  $BB25 set index to FAC temp
  $BB27 set byte
  $BB29 get FAC2 mantissa 1
  $BB2B compare FAC1 mantissa 1
  $BB2D branch if <>
  $BB2F get FAC2 mantissa 2
  $BB31 compare FAC1 mantissa 2
  $BB33 branch if <>
  $BB35 get FAC2 mantissa 3
  $BB37 compare FAC1 mantissa 3
  $BB39 branch if <>
  $BB3B get FAC2 mantissa 4
  $BB3D compare FAC1 mantissa 4
  $BB3F save FAC2-FAC1 compare status
  $BB40 shift byte
  $BB41 skip next if no carry
  $BB43 increment index to FAC temp
  $BB44
  $BB46
  $BB48
  $BB4A
  $BB4C restore FAC2-FAC1 compare status
  $BB4D if FAC2 >= FAC1 then do subtract
N $BB4F FAC2 = FAC2*2
  $BB4F shift FAC2 mantissa 4
  $BB51 shift FAC2 mantissa 3
  $BB53 shift FAC2 mantissa 2
  $BB55 shift FAC2 mantissa 1
  $BB57 loop with no compare
  $BB59 loop with compare
  $BB5B loop with no compare, branch always
  $BB5D save FAC2-FAC1 compare status
  $BB5E get FAC2 mantissa 4
  $BB60 subtract FAC1 mantissa 4
  $BB62 save FAC2 mantissa 4
  $BB64 get FAC2 mantissa 3
  $BB66 subtract FAC1 mantissa 3
  $BB68 save FAC2 mantissa 3
  $BB6A get FAC2 mantissa 2
  $BB6C subtract FAC1 mantissa 2
  $BB6E save FAC2 mantissa 2
  $BB70 get FAC2 mantissa 1
  $BB72 subtract FAC1 mantissa 1
  $BB74 save FAC2 mantissa 1
  $BB76 restore FAC2-FAC1 compare status
  $BB77
  $BB7A
  $BB7C branch always
N $BB7E do `A`<<6, save as FAC1 rounding byte, normalise and return
  $BB7E
  $BB7F
  $BB80
  $BB81
  $BB82
  $BB83
  $BB84 save FAC1 rounding byte
  $BB86 dump FAC2-FAC1 compare status
  $BB87 copy temp to FAC1, normalise and return
N $BB8A do "Divide by zero" error
  $BB8A error $14, divide by zero error
  $BB8C do error #`X` then warm start
  $BB8F get temp mantissa 1
  $BB91 save FAC1 mantissa 1
  $BB93 get temp mantissa 2
  $BB95 save FAC1 mantissa 2
  $BB97 get temp mantissa 3
  $BB99 save FAC1 mantissa 3
  $BB9B get temp mantissa 4
  $BB9D save FAC1 mantissa 4
  $BB9F normalise FAC1 and return

c $BBA2 unpack memory (`AY`) into FAC1
  $BBA2 save pointer low byte
  $BBA4 save pointer high byte
  $BBA6 5 bytes to do
  $BBA8 get fifth byte
  $BBAA save FAC1 mantissa 4
  $BBAC decrement index
  $BBAD get fourth byte
  $BBAF save FAC1 mantissa 3
  $BBB1 decrement index
  $BBB2 get third byte
  $BBB4 save FAC1 mantissa 2
  $BBB6 decrement index
  $BBB7 get second byte
  $BBB9 save FAC1 sign (b7)
  $BBBB set 1xxx xxxx (add normal bit)
  $BBBD save FAC1 mantissa 1
  $BBBF decrement index
  $BBC0 get first byte (exponent)
  $BBC2 save FAC1 exponent
  $BBC4 clear FAC1 rounding byte
  $BBC6

c $BBC7 pack FAC1 into $5C
  $BBC7 set pointer low byte
B $BBC9,1 makes next line BIT $57A2

c $BBCA pack FAC1 into $57
  $BBCA set pointer low byte
  $BBCC set pointer high byte
  $BBCE pack FAC1 into (`XY`) and return, branch always

c $BBD0 pack FAC1 into variable pointer
  $BBD0 get destination pointer low byte
  $BBD2 get destination pointer high byte

c $BBD4 pack FAC1 into (`XY`)
  $BBD4 round FAC1
  $BBD7 save pointer low byte
  $BBD9 save pointer high byte
  $BBDB set index
  $BBDD get FAC1 mantissa 4
  $BBDF store in destination
  $BBE1 decrement index
  $BBE2 get FAC1 mantissa 3
  $BBE4 store in destination
  $BBE6 decrement index
  $BBE7 get FAC1 mantissa 2
  $BBE9 store in destination
  $BBEB decrement index
  $BBEC get FAC1 sign (b7)
  $BBEE set bits x111 1111
  $BBF0 AND in FAC1 mantissa 1
  $BBF2 store in destination
  $BBF4 decrement index
  $BBF5 get FAC1 exponent
  $BBF7 store in destination
  $BBF9 clear FAC1 rounding byte
  $BBFB

c $BBFC copy FAC2 to FAC1
  $BBFC get FAC2 sign (b7)
N $BBFE save FAC1 sign and copy ABS(FAC2) to FAC1
  $BBFE save FAC1 sign (b7)
  $BC00 5 bytes to copy
  $BC02 get byte from FAC2,X
  $BC04 save byte at FAC1,X
  $BC06 decrement count
  $BC07 loop if not all done
  $BC09 clear FAC1 rounding byte
  $BC0B

c $BC0C round and copy FAC1 to FAC2
  $BC0C round FAC1
N $BC0F copy FAC1 to FAC2
  $BC0F 6 bytes to copy
  $BC11 get byte from FAC1,X
  $BC13 save byte at FAC2,X
  $BC15 decrement count
  $BC16 loop if not all done
  $BC18 clear FAC1 rounding byte
  $BC1A

c $BC1B round FAC1
  $BC1B get FAC1 exponent
  $BC1D exit if zero
  $BC1F shift FAC1 rounding byte
  $BC21 exit if no overflow
N $BC23 round FAC1 (no check)
  $BC23 increment FAC1 mantissa
  $BC26 branch if no overflow
  $BC28 nornalise FAC1 for C=1 and return

c $BC2B get FAC1 sign
D $BC2B return `A` = $FF, Cb = 1/-ve `A` = $01, Cb = 0/+ve, `A` = $00, Cb = ?/0
  $BC2B get FAC1 exponent
  $BC2D exit if zero (already correct SGN(0)=0)
N $BC2F return `A` = $FF, Cb = 1/-ve `A` = $01, Cb = 0/+ve
N $BC2F no = 0 check
  $BC2F else get FAC1 sign (b7)
N $BC31 return `A` = $FF, Cb = 1/-ve `A` = $01, Cb = 0/+ve
N $BC31 no = 0 check, sign in `A`
  $BC31 move sign bit to carry
  $BC32 set byte for -ve result
  $BC34 return if sign was set (-ve)
  $BC36 else set byte for +ve result
  $BC38

c $BC39 perform SGN()
  $BC39 get FAC1 sign, return `A` = $FF -ve, `A` = $01 +ve

c $BC3C save `A` as integer byte
  $BC3C save FAC1 mantissa 1
  $BC3E clear `A`
  $BC40 clear FAC1 mantissa 2
  $BC42 set exponent
N $BC44 set exponent = `X`, clear FAC1 3 and 4 and normalise
  $BC44 get FAC1 mantissa 1
  $BC46 complement it
  $BC48 sign bit into carry
N $BC49 set exponent = `X`, clear mantissa 4 and 3 and normalise FAC1
  $BC49 clear `A`
  $BC4B clear FAC1 mantissa 4
  $BC4D clear FAC1 mantissa 3
N $BC4F set exponent = `X` and normalise FAC1
  $BC4F set FAC1 exponent
  $BC51 clear FAC1 rounding byte
  $BC53 clear FAC1 sign (b7)
  $BC55 do ABS and normalise FAC1

c $BC58 perform ABS()
  $BC58 clear FAC1 sign, put zero in b7
  $BC5A

c $BC5B compare FAC1 with (`AY`)
D $BC5B returns `A`=$00 if FAC1 = (`AY`). returns `A`=$01 if FAC1 > (`AY`). returns `A`=$FF if FAC1 < (`AY`)
  $BC5B save pointer low byte
  $BC5D save pointer high byte
  $BC5F clear index
  $BC61 get exponent
  $BC63 increment index
  $BC64 copy (`AY`) exponent to `X`
  $BC65 branch if (`AY`) exponent=0 and get FAC1 sign
N $BC67 `A` = $FF, Cb = 1/-ve `A` = $01, Cb = 0/+ve
  $BC67 get (`AY`) mantissa 1, with sign
  $BC69 EOR FAC1 sign (b7)
  $BC6B if signs <> do return `A` = $FF, Cb = 1/-ve
N $BC6D `A` = $01, Cb = 0/+ve and return
  $BC6D compare (`AY`) exponent with FAC1 exponent
  $BC6F branch if different
  $BC71 get (`AY`) mantissa 1, with sign
  $BC73 normalise top bit
  $BC75 compare with FAC1 mantissa 1
  $BC77 branch if different
  $BC79 increment index
  $BC7A get mantissa 2
  $BC7C compare with FAC1 mantissa 2
  $BC7E branch if different
  $BC80 increment index
  $BC81 get mantissa 3
  $BC83 compare with FAC1 mantissa 3
  $BC85 branch if different
  $BC87 increment index
  $BC88 set for 1/2 value rounding byte
  $BC8A compare with FAC1 rounding byte (set carry)
  $BC8C get mantissa 4
  $BC8E subtract FAC1 mantissa 4
  $BC90 exit if mantissa 4 equal
N $BC92 gets here if number <> FAC1
  $BC92 get FAC1 sign (b7)
  $BC94 branch if FAC1 > (`AY`)
  $BC96 else toggle FAC1 sign
  $BC98 return `A` = $FF, Cb = 1/-ve `A` = $01, Cb = 0/+ve

c $BC9B convert FAC1 floating to fixed
  $BC9B get FAC1 exponent
  $BC9D if zero go clear FAC1 and return
  $BC9F set carry for subtract
  $BCA0 subtract maximum integer range exponent
  $BCA2 test FAC1 sign (b7)
  $BCA4 branch if FAC1 +ve
N $BCA6 FAC1 was -ve
  $BCA6 copy subtracted exponent
  $BCA7 overflow for -ve number
  $BCA9 set FAC1 overflow byte
  $BCAB twos complement FAC1 mantissa
  $BCAE restore subtracted exponent
  $BCAF set index to FAC1
  $BCB1 compare exponent result
  $BCB3 if < 8 shifts shift FAC1 `A` times right and return
  $BCB5 shift FAC1 `A` times right (> 8 shifts)
  $BCB8 clear FAC1 overflow byte
  $BCBA

c $BCBB shift FAC1 `A` times right
  $BCBB copy shift count
  $BCBC get FAC1 sign (b7)
  $BCBE,b mask sign bit only (x000 0000)
  $BCC0 shift FAC1 mantissa 1
  $BCC2 OR sign in b7 FAC1 mantissa 1
  $BCC4 save FAC1 mantissa 1
  $BCC6 shift FAC1 `Y` times right
  $BCC9 clear FAC1 overflow byte
  $BCCB

c $BCCC perform INT()
  $BCCC get FAC1 exponent
  $BCCE compare with max int
  $BCD0 exit if >= (allready int, too big for fractional part!)
  $BCD2 convert FAC1 floating to fixed
  $BCD5 save FAC1 rounding byte
  $BCD7 get FAC1 sign (b7)
  $BCD9 save FAC1 sign (b7)
  $BCDB,b toggle FAC1 sign
  $BCDD shift into carry
  $BCDE set new exponent
  $BCE0 save FAC1 exponent
  $BCE2 get FAC1 mantissa 4
  $BCE4 save FAC1 mantissa 4 for power function
  $BCE6 do ABS and normalise FAC1

c $BCE9 clear FAC1
  $BCE9 clear FAC1 mantissa 1
  $BCEB clear FAC1 mantissa 2
  $BCED clear FAC1 mantissa 3
  $BCEF clear FAC1 mantissa 4
  $BCF1 clear `Y`
  $BCF2

c $BCF3 get FAC1 from string
  $BCF3 clear `Y`
  $BCF5 set index
  $BCF7 clear byte
  $BCF9 decrement index
  $BCFA loop until numexp to negnum (and FAC1) = $00
  $BCFC branch if first character is numeric
  $BCFE,c else compare with "-"
  $BD00 branch if not "-"
  $BD02 set flag for -ve n (negnum = $FF)
  $BD04 branch always
  $BD06,c else compare with "+"
  $BD08 branch if not "+"
  $BD0A increment and scan memory
  $BD0D branch if numeric character
  $BD0F,c else compare with "."
  $BD11 branch if "."
  $BD13,c else compare with "E"
  $BD15 branch if not "E"
N $BD17 was "E" so evaluate exponential part
  $BD17 increment and scan memory
  $BD1A branch if numeric character
  $BD1C else compare with token for -
  $BD1E branch if token for -
  $BD20,c else compare with "-"
  $BD22 branch if "-"
  $BD24 else compare with token for +
  $BD26 branch if token for +
  $BD28,c else compare with "+"
  $BD2A branch if "+"
  $BD2C branch always
  $BD2E set exponent -ve flag (C, which=1, into b7)
  $BD30 increment and scan memory
  $BD33 branch if numeric character
  $BD35 test exponent -ve flag
  $BD37 if +ve go evaluate exponent
N $BD39 else do exponent = -exponent
  $BD39 clear result
  $BD3B set carry for subtract
  $BD3C subtract exponent byte
  $BD3E go evaluate exponent
  $BD41 set decimal point flag
  $BD43 test decimal point flag
  $BD45 branch if only one decimal point so far
N $BD47 evaluate exponent
  $BD47 get exponent count byte
  $BD49 set carry for subtract
  $BD4A subtract numerator exponent
  $BD4C save exponent count byte
  $BD4E branch if no adjustment
  $BD50 else if +ve go do FAC1*10^expcnt
N $BD52 else go do FAC1/10^(0-expcnt)
  $BD52 divide FAC1 by 10
  $BD55 increment exponent count byte
  $BD57 loop until all done
  $BD59 branch always
  $BD5B multiply FAC1 by 10
  $BD5E decrement exponent count byte
  $BD60 loop until all done
  $BD62 get -ve flag
  $BD64 if -ve do - FAC1 and return
  $BD66

c $BD67 do - FAC1
  $BD67 do - FAC1

c $BD6A do unsigned FAC1*10+number
  $BD6A save character
  $BD6B test decimal point flag
  $BD6D skip exponent increment if not set
  $BD6F else increment number exponent
  $BD71 multiply FAC1 by 10
  $BD74 restore character
  $BD75 set carry for subtract
  $BD76,c convert to binary
  $BD78 evaluate new ASCII digit
  $BD7B go do next character

c $BD7E evaluate new ASCII digit
D $BD7E multiply FAC1 by 10 then (ABS) add in new digit
  $BD7E save digit
  $BD7F round and copy FAC1 to FAC2
  $BD82 restore digit
  $BD83 save `A` as integer byte
  $BD86 get FAC2 sign (b7)
  $BD88 toggle with FAC1 sign (b7)
  $BD8A save sign compare (FAC1 EOR FAC2)
  $BD8C get FAC1 exponent
  $BD8E add FAC2 to FAC1 and return

c $BD91 evaluate next character of exponential part of number
  $BD91 get exponent count byte
  $BD93 compare with 10 decimal
  $BD95 branch if less
  $BD97 make all -ve exponents = -100 decimal (causes underflow)
  $BD99 test exponent -ve flag
  $BD9B branch if -ve
  $BD9D else do overflow error then warm start
  $BDA0 *2
  $BDA1 *4
  $BDA2 clear carry for add
  $BDA3 *5
  $BDA5 *10
  $BDA6 clear carry for add
  $BDA7 set index
  $BDA9 add character (will be $30 too much!)
  $BDAB set carry for subtract
  $BDAC,c convert character to binary
  $BDAE save exponent count byte
  $BDB0 go get next character

b $BDB3 limits for scientific mode
  $BDB3,5 99999999.90625, maximum value with at least one decimal
  $BDB8,5 999999999.25, maximum value before scientific notation
  $BDBD,5 1000000000

c $BDC2 do " IN " line number message
  $BDC2 set " IN " pointer low byte
  $BDC4 set " IN " pointer high byte
  $BDC6 print null terminated string
  $BDC9 get the current line number high byte
  $BDCB get the current line number low byte

c $BDCD print `XA` as unsigned integer
  $BDCD save high byte as FAC1 mantissa1
  $BDCF save low byte as FAC1 mantissa2
  $BDD1 set exponent to 16d bits
  $BDD3 set integer is +ve flag
  $BDD4 set exponent = `X`, clear mantissa 4 and 3 and normalise FAC1
  $BDD7 convert FAC1 to string
  $BDDA print null terminated string

c $BDDD convert FAC1 to ASCII string result in (`AY`)
  $BDDD set index = 1
  $BDDF,c character = " " (assume +ve)
  $BDE1 test FAC1 sign (b7)
  $BDE3 branch if +ve
  $BDE5,c else character = "-"
  $BDE7 save leading character (" " or "-")
  $BDEA save FAC1 sign (b7)
  $BDEC save index
  $BDEE increment index
  $BDEF,c set character = "0"
  $BDF1 get FAC1 exponent
  $BDF3 branch if FAC1<>0
N $BDF5 exponent was $00 so FAC1 is 0
  $BDF5 save last character, [EOT] and exit
N $BDF8 FAC1 is some non zero value
  $BDF8 clear (number exponent count)
  $BDFA compare FAC1 exponent with $80 (<1.00000)
  $BDFC branch if 0.5 <= FAC1 < 1.0
  $BDFE branch if FAC1=>1
  $BE00 set 1000000000 pointer low byte
  $BE02 set 1000000000 pointer high byte
  $BE04 do convert `AY`, FCA1*(`AY`)
  $BE07 set number exponent count
  $BE09 save number exponent count
  $BE0B set 999999999.25 pointer low byte (max before sci note)
  $BE0D set 999999999.25 pointer high byte
  $BE0F compare FAC1 with (`AY`)
  $BE12 exit if FAC1 = (`AY`)
  $BE14 go do /10 if FAC1 > (`AY`)
N $BE16 FAC1 < (`AY`)
  $BE16 set 99999999.90625 pointer low byte
  $BE18 set 99999999.90625 pointer high byte
  $BE1A compare FAC1 with (`AY`)
  $BE1D branch if FAC1 = (`AY`) (allow decimal places)
  $BE1F branch if FAC1 > (`AY`) (no decimal places)
N $BE21 FAC1 <= (`AY`)
  $BE21 multiply FAC1 by 10
  $BE24 decrement number exponent count
  $BE26 go test again, branch always
  $BE28 divide FAC1 by 10
  $BE2B increment number exponent count
  $BE2D go test again, branch always
N $BE2F now we have just the digits to do
  $BE2F add 0.5 to FAC1 (round FAC1)
  $BE32 convert FAC1 floating to fixed
  $BE35 set default digits before dp = 1
  $BE37 get number exponent count
  $BE39 clear carry for add
  $BE3A up to 9 digits before point
  $BE3C if -ve then 1 digit before dp
  $BE3E `A`>=$0B if n>=1E9
  $BE40 branch if >= $0B
N $BE42 carry is clear
  $BE42 take 1 from digit count
  $BE44 copy to `X`
  $BE45 set exponent adjust
  $BE47 set carry for subtract
  $BE48 -2
  $BE4A save exponent adjust
  $BE4C save digits before dp count
  $BE4E copy to `A`
  $BE4F branch if no digits before dp
  $BE51 branch if digits before dp
  $BE53 get output string index
  $BE55,c character "."
  $BE57 increment index
  $BE58 save to output string
  $BE5B
  $BE5C
  $BE5E,c character "0"
  $BE60 increment index
  $BE61 save to output string
  $BE64 save output string index
  $BE66 clear index (point to 100,000)
  $BE68
  $BE6A get FAC1 mantissa 4
  $BE6C clear carry for add
  $BE6D add byte 4, least significant
  $BE70 save FAC1 mantissa4
  $BE72 get FAC1 mantissa 3
  $BE74 add byte 3
  $BE77 save FAC1 mantissa3
  $BE79 get FAC1 mantissa 2
  $BE7B add byte 2
  $BE7E save FAC1 mantissa2
  $BE80 get FAC1 mantissa 1
  $BE82 add byte 1, most significant
  $BE85 save FAC1 mantissa1
  $BE87 increment the digit, set the sign on the test sense bit
  $BE88 if the carry is set go test if the result was positive
N $BE8A else the result needs to be negative
  $BE8A not -ve so try again
  $BE8C else done so return the digit
  $BE8E not +ve so try again
N $BE90 else done so return the digit
  $BE90 copy the digit
  $BE91 if Cb=0 just use it
  $BE93 else make the 2's complement ..
  $BE95 .. and subtract it from 10
  $BE97 add "0"-1 to result
  $BE99 increment ..
  $BE9A .. index to ..
  $BE9B .. next less ..
  $BE9C .. power of ten
  $BE9D save current variable pointer low byte
  $BE9F get output string index
  $BEA1 increment output string index
  $BEA2 copy character to `X`
  $BEA3,b mask out top bit
  $BEA5 save to output string
  $BEA8 decrement # of characters before the dp
  $BEAA branch if still characters to do
N $BEAC else output the point
  $BEAC,c character "."
  $BEAE increment output string index
  $BEAF save to output string
  $BEB2 save output string index
  $BEB4 get current variable pointer low byte
  $BEB6 get character back
  $BEB7 toggle the test sense bit
  $BEB9 clear the digit
  $BEBB copy it to the new digit
  $BEBC compare the table index with the max for decimal numbers
  $BEBE if at the max exit the digit loop
  $BEC0 compare the table index with the max for time
  $BEC2 loop if not at the max
N $BEC4 now remove trailing zeroes
  $BEC4 restore the output string index
  $BEC6 get character from output string
  $BEC9 decrement output string index
  $BECA,c compare with "0"
  $BECC loop until non "0" character found
  $BECE,c compare with "."
  $BED0 branch if was dp
N $BED2 restore last character
  $BED2 increment output string index
  $BED3,c character "+"
  $BED5 get exponent count
  $BED7 if zero go set null terminator and exit
N $BED9 exponent isn't zero so write exponent
  $BED9 branch if exponent count +ve
  $BEDB clear `A`
  $BEDD set carry for subtract
  $BEDE subtract exponent count adjust (convert -ve to +ve)
  $BEE0 copy exponent count to `X`
  $BEE1,c character "-"
  $BEE3 save to output string
  $BEE6,c character "E"
  $BEE8 save exponent sign to output string
  $BEEB get exponent count back
  $BEEC one less than "0" character
  $BEEE set carry for subtract
  $BEEF increment 10's character
  $BEF0 subtract 10 from exponent count
  $BEF2 loop while still >= 0
  $BEF4,c add character ":" ($30+$0A, result is 10 less that value)
  $BEF6 save to output string
  $BEF9 copy 10's character
  $BEFA save to output string
  $BEFD set null terminator
  $BEFF save to output string
  $BF02 go set string pointer (`AY`) and exit, branch always
N $BF04 save last character, [EOT] and exit
  $BF04 save last character to output string
N $BF07 set null terminator and exit
  $BF07 set null terminator
  $BF09 save after last character
N $BF0C set string pointer (`AY`) and exit
  $BF0C set result string pointer low byte
  $BF0E set result string pointer high byte
  $BF10

b $BF11 constants
  $BF11,2 0.5, first two bytes
  $BF13,3 null return for undefined variables
@ $BF16 label=C_NEG100M
  $BF16,4 -100 000 000
  $BF1A,4 +10 000 000
  $BF1E,4 -1 000 000
  $BF22,4 +100 000
  $BF26,4 -10 000
  $BF2A,4 +1 000
  $BF2E,4 - 100
  $BF32,4 +10
  $BF36,4 -1

b $BF3A jiffy counts
  $BF3A,4 -2160000: 10s hours
  $BF3E,4 +216000: hours
  $BF42,4 -36000: 10s mins
  $BF46,4 +3600: mins
  $BF4A,4 -600: 10s secs
  $BF4E,4 +60: secs

b $BF52 not referenced
  $BF52,1 checksum byte

b $BF53 spare bytes, not referenced
  $BF53,5
  $BF58,8
  $BF60,8
  $BF68,8
  $BF70,1

c $BF71 perform SQR()
  $BF71 round and copy FAC1 to FAC2
  $BF74 set 0.5 pointer low address
  $BF76 set 0.5 pointer high address
  $BF78 unpack memory (`AY`) into FAC1

c $BF7B perform power function
  $BF7B perform EXP()
  $BF7D get FAC2 exponent
  $BF7F branch if FAC2<>0
  $BF81 clear FAC1 exponent and sign and return
  $BF84 set destination pointer low byte
  $BF86 set destination pointer high byte
  $BF88 pack FAC1 into (`XY`)
  $BF8B get FAC2 sign (b7)
  $BF8D branch if FAC2>0
N $BF8F else FAC2 is -ve and can only be raised to an integer power which gives an x + j0 result
  $BF8F perform INT()
  $BF92 set source pointer low byte
  $BF94 set source pointer high byte
  $BF96 compare FAC1 with (`AY`)
  $BF99 branch if FAC1 <> (`AY`) to allow Function Call error. this will leave FAC1 -ve and cause a Function Call error when LOG() is called
  $BF9B clear sign b7
  $BF9C get FAC1 mantissa 4 from INT() function as sign in `Y` for possible later negation, b0 only needed
  $BF9E save FAC1 sign and copy ABS(FAC2) to FAC1
  $BFA1 copy sign back ..
  $BFA2 .. and save it
  $BFA3 perform LOG()
  $BFA6 set pointer low byte
  $BFA8 set pointer high byte
  $BFAA do convert `AY`, FCA1*(`AY`)
  $BFAD perform EXP()
  $BFB0 pull sign from stack
  $BFB1 b0 is to be tested
  $BFB2 if no bit then exit
N $BFB4 do - FAC1
  $BFB4 get FAC1 exponent
  $BFB6 exit if FAC1_e = $00
  $BFB8 get FAC1 sign (b7)
  $BFBA complement it
  $BFBC save FAC1 sign (b7)
  $BFBE

b $BFBF exp(n) constant and series
  $BFBF,5 1.44269504 = 1/LOG(2)
  $BFC4,1 series count
  $BFC5,5 2.14987637E-5
  $BFCA,5 1.43523140E-4
  $BFCF,5 1.34226348E-3
  $BFD4,5 9.61401701E-3
  $BFD9,5 5.55051269E-2
  $BFDE,5 2.40226385E-1
  $BFE3,5 6.93147186E-1
  $BFE8,5 1.00000000

c $BFED perform EXP()
  $BFED set 1.443 pointer low byte
  $BFEF set 1.443 pointer high byte
  $BFF1 do convert `AY`, FCA1*(`AY`)
  $BFF4 get FAC1 rounding byte
  $BFF6 +$50/$100
  $BFF8 skip rounding if no carry
  $BFFA round FAC1 (no check)
  $BFFD continue EXP()

i $C000
@ $E000 org

c $E000 start of the kernal ROM
D $E000 EXP() continued
  $E000 save FAC2 rounding byte
  $E002 copy FAC1 to FAC2
  $E005 get FAC1 exponent
  $E007 compare with EXP limit (256d)
  $E009 branch if less
  $E00B handle overflow and underflow
  $E00E perform INT()
  $E011 get mantissa 4 from INT()
  $E013 clear carry for add
  $E014 normalise +1
  $E016 if $00 result has overflowed so go handle it
  $E018 set carry for subtract
  $E019 exponent now correct
  $E01B save FAC2 exponent
N $E01C swap FAC1 and FAC2
  $E01C 4 bytes to do
  $E01E get FAC2,X
  $E020 get FAC1,X
  $E022 save FAC1,X
  $E024 save FAC2,X
  $E026 decrement count/index
  $E027 loop if not all done
  $E029 get FAC2 rounding byte
  $E02B save as FAC1 rounding byte
  $E02D perform subtraction, FAC2 from FAC1
  $E030 do - FAC1
  $E033 set counter pointer low byte
  $E035 set counter pointer high byte
  $E037 go do series evaluation
  $E03A clear `A`
  $E03C clear sign compare (FAC1 EOR FAC2)
  $E03E get saved FAC2 exponent
  $E03F test and adjust accumulators
  $E042

c $E043 ^2 then series evaluation
  $E043 save count pointer low byte
  $E045 save count pointer high byte
  $E047 pack FAC1 into $57
  $E04A set pointer low byte (Y already $00)
  $E04C do convert `AY`, FCA1*(`AY`)
  $E04F go do series evaluation
  $E052 pointer to original # low byte
  $E054 pointer to original # high byte
  $E056 do convert `AY`, FCA1*(`AY`)

c $E059 do series evaluation
  $E059 save count pointer low byte
  $E05B save count pointer high byte
  $E05D pack FAC1 into $5C
  $E060 get constants count
  $E062 save constants count
  $E064 get count pointer low byte
  $E066 increment it (now constants pointer)
  $E067 copy it
  $E068 skip next if no overflow
  $E06A else increment high byte
  $E06C save low byte
  $E06E get high byte
  $E070 do convert `AY`, FCA1*(`AY`)
  $E073 get constants pointer low byte
  $E075 get constants pointer high byte
  $E077 clear carry for add
  $E078 +5 to low pointer (5 bytes per constant)
  $E07A skip next if no overflow
  $E07C increment high byte
  $E07D save pointer low byte
  $E07F save pointer high byte
  $E081 add (`AY`) to FAC1
  $E084 set pointer low byte to partial
  $E086 set pointer high byte to partial
  $E088 decrement constants count
  $E08A loop until all done
  $E08C

b $E08D RND values
  $E08D,5 11879546 (multiplier)
  $E092,5 3.927677739E-8 (offset)

c $E097 perform RND()
  $E097 get FAC1 sign
N $E09A return `A` = $FF -ve, `A` = $01 +ve
  $E09A if n<0 copy byte swapped FAC1 into RND() seed
  $E09C if n>0 get next number in RND() sequence
N $E09E else n=0 so get the RND() number from VIA 1 timers
  $E09E return base address of I/O devices
  $E0A1 save pointer low byte
  $E0A3 save pointer high byte
  $E0A5 set index to T1 low byte
  $E0A7 get T1 low byte
  $E0A9 save FAC1 mantissa 1
  $E0AB increment index
  $E0AC get T1 high byte
  $E0AE save FAC1 mantissa 3
  $E0B0 set index to T2 low byte
  $E0B2 get T2 low byte
  $E0B4 save FAC1 mantissa 2
  $E0B6 increment index
  $E0B7 get T2 high byte
  $E0B9 save FAC1 mantissa 4
  $E0BB set exponent and exit
  $E0BE set seed pointer low address
  $E0C0 set seed pointer high address
  $E0C2 unpack memory (`AY`) into FAC1
  $E0C5 set 11879546 pointer low byte
  $E0C7 set 11879546 pointer high byte
  $E0C9 do convert `AY`, FCA1*(`AY`)
  $E0CC set 3.927677739E-8 pointer low byte
  $E0CE set 3.927677739E-8 pointer high byte
  $E0D0 add (`AY`) to FAC1
  $E0D3 get FAC1 mantissa 4
  $E0D5 get FAC1 mantissa 1
  $E0D7 save FAC1 mantissa 4
  $E0D9 save FAC1 mantissa 1
  $E0DB get FAC1 mantissa 2
  $E0DD get FAC1 mantissa 3
  $E0DF save FAC1 mantissa 2
  $E0E1 save FAC1 mantissa 3
  $E0E3 clear byte
  $E0E5 clear FAC1 sign (always +ve)
  $E0E7 get FAC1 exponent
  $E0E9 save FAC1 rounding byte
  $E0EB set exponent = $80
  $E0ED save FAC1 exponent
  $E0EF normalise FAC1
  $E0F2 set seed pointer low address
  $E0F4 set seed pointer high address

c $E0F6 pack FAC1 into (`XY`)
  $E0F6 pack FAC1 into (`XY`)

c $E0F9 handle BASIC I/O error
  $E0F9 compare error with $F0
  $E0FB branch if not $F0
  $E0FD set end of memory high byte
  $E0FF set end of memory low byte
  $E101 clear from start to end and return
N $E104 error was not $F0
  $E104 copy error #
  $E105 branch if not $00
  $E107 else error $1E, break error
  $E109 do error #`X` then warm start

c $E10C output character to channel with error check
  $E10C output character to channel
  $E10F if error go handle BASIC I/O error
  $E111

c $E112 input character from channel with error check
  $E112 input character from channel
  $E115 if error go handle BASIC I/O error
  $E117

c $E118 open channel for output with error check
  $E118 open channel for output
  $E11B if error go handle BASIC I/O error
  $E11D

c $E11E open channel for input with error check
  $E11E open channel for input
  $E121 if error go handle BASIC I/O error
  $E123

c $E124 get character from input device with error check
  $E124 get character from input device
  $E127 if error go handle BASIC I/O error
  $E129

c $E12A perform SYS
  $E12A evaluate expression and check is numeric, else do type mismatch
  $E12D convert FAC_1 to integer in temporary integer
  $E130 get return address high byte
  $E132 push as return address
  $E133 get return address low byte
  $E135 push as return address
  $E136 get saved status register
  $E139 put on stack
  $E13A get saved `A`
  $E13D get saved `X`
  $E140 get saved `Y`
  $E143 pull processor status
  $E144 call SYS address
N $E147 tail end of SYS code
  $E147 save status
  $E148 save returned `A`
  $E14B save returned `X`
  $E14E save returned `Y`
  $E151 restore saved status
  $E152 save status
  $E155

c $E156 perform SAVE
  $E156 get parameters for LOAD/SAVE
  $E159 get start of variables low byte
  $E15B get start of variables high byte
  $E15D index to start of program memory
  $E15F save RAM to device, `A` = index to start address, `XY` = end address low/high
  $E162 if error go handle BASIC I/O error
  $E164

c $E165 perform VERIFY
  $E165 flag verify
B $E167,1 makes next line BIT $00A9

c $E168 perform LOAD
  $E168 flag load
  $E16A set load/verify flag
  $E16C get parameters for LOAD/SAVE
  $E16F get load/verify flag
  $E171 get start of memory low byte
  $E173 get start of memory high byte
  $E175 load RAM from a device
  $E178 if error go handle BASIC I/O error
  $E17A get load/verify flag
  $E17C branch if load
  $E17E error $1C, verify error
  $E180 read I/O status word
  $E183,b mask for tape read error
  $E185 branch if no read error
  $E187 get the BASIC execute pointer low byte. is this correct ?? won't this mean the "OK" prompt when doing a load from within a program ?
  $E189
  $E18B if ?? skip "OK" prompt
  $E18D set "OK" pointer low byte
  $E18F set "OK" pointer high byte
  $E191 print null terminated string
  $E194

c $E195 do READY return to BASIC
  $E195 read I/O status word
  $E198,b mask x0xx xxxx, clear read error
  $E19A branch if no errors
  $E19C error $1D, load error
  $E19E do error #`X` then warm start
  $E1A1 get BASIC execute pointer high byte
  $E1A3 compare with $02xx
  $E1A5 branch if not immediate mode
  $E1A7 set start of variables low byte
  $E1A9 set start of variables high byte
  $E1AB set "READY." pointer low byte
  $E1AD set "READY." pointer high byte
  $E1AF print null terminated string
  $E1B2 reset execution, clear variables, flush stack, rebuild BASIC chain and do warm start
  $E1B5 set BASIC execute pointer to start of memory - 1
  $E1B8 rebuild BASIC line chaining
  $E1BB rebuild BASIC line chaining, do RESTORE and return

c $E1BE perform OPEN
  $E1BE get parameters for OPEN/CLOSE
  $E1C1 open a logical file
  $E1C4 branch if error
  $E1C6

c $E1C7 perform CLOSE
  $E1C7 get parameters for OPEN/CLOSE
  $E1CA get logical file number
  $E1CC close a specified logical file
  $E1CF exit if no error
  $E1D1 go handle BASIC I/O error

c $E1D4 get parameters for LOAD/SAVE
  $E1D4 clear file name length
  $E1D6 clear the filename
  $E1D9 set default device number, cassette
  $E1DB set default command
  $E1DD set logical, first and second addresses
  $E1E0 exit function if [EOT] or ":"
  $E1E3 set filename
  $E1E6 exit function if [EOT] or ":"
  $E1E9 scan and get byte, else do syntax error then warm start
  $E1EC clear command
  $E1EE save device number
  $E1F0 set logical, first and second addresses
  $E1F3 exit function if [EOT] or ":"
  $E1F6 scan and get byte, else do syntax error then warm start
  $E1F9 copy command to `A`
  $E1FA copy command to `Y`
  $E1FB get device number back
  $E1FD set logical, first and second addresses and return

c $E200 scan and get byte, else do syntax error then warm start
  $E200 scan for ",byte", else do syntax error then warm start
  $E203 get byte parameter and return

c $E206 exit function if [EOT] or ":"
  $E206 scan memory
  $E209 branch if not [EOL] or ":"
  $E20B dump return address low byte
  $E20C dump return address high byte
  $E20D

c $E20E scan for ",valid byte", else do syntax error then warm start
  $E20E scan for ",", else do syntax error then warm start

c $E211 scan for valid byte, not [EOL] or ":", else do syntax error then warm start
  $E211 scan memory
  $E214 exit if following byte
  $E216 else do syntax error then warm start

c $E219 get parameters for OPEN/CLOSE
  $E219 clear the filename length
  $E21B clear the filename
  $E21E scan for valid byte, else do syntax error then warm start
  $E221 get byte parameter, logical file number
  $E224 save logical file number
  $E226 copy logical file number to `A`
  $E227 set default device number, cassette
  $E229 set default command
  $E22B set logical, first and second addresses
  $E22E exit function if [EOT] or ":"
  $E231 scan and get byte, else do syntax error then warm start
  $E234 save device number
  $E236 clear command
  $E238 get logical file number
  $E23A compare device number with screen
  $E23C branch if less than screen
  $E23E else decrement command
  $E23F set logical, first and second addresses
  $E242 exit function if [EOT] or ":"
  $E245 scan and get byte, else do syntax error then warm start
  $E248 copy command to `A`
  $E249 copy command to `Y`
  $E24A get device number
  $E24C get logical file number
  $E24E set logical, first and second addresses
  $E251 exit function if [EOT] or ":"
  $E254 scan for ",byte", else do syntax error then warm start

c $E257 set filename
  $E257 evaluate expression
  $E25A evaluate string
  $E25D get string pointer low byte
  $E25F get string pointer high byte
  $E261 set the filename and return

c $E264 perform COS()
  $E264 set pi/2 pointer low byte
  $E266 set pi/2 pointer high byte
  $E268 add (`AY`) to FAC1

c $E26B perform SIN()
  $E26B round and copy FAC1 to FAC2
  $E26E set 2*pi pointer low byte
  $E270 set 2*pi pointer high byte
  $E272 get FAC2 sign (b7)
  $E274 divide by (`AY`) (`X`=sign)
  $E277 round and copy FAC1 to FAC2
  $E27A perform INT()
  $E27D clear byte
  $E27F clear sign compare (FAC1 EOR FAC2)
  $E281 perform subtraction, FAC2 from FAC1
  $E284 set 0.25 pointer low byte
  $E286 set 0.25 pointer high byte
  $E288 perform subtraction, FAC1 from (`AY`)
  $E28B get FAC1 sign (b7)
  $E28D save FAC1 sign
  $E28E branch if +ve
N $E290 FAC1 sign was -ve
  $E290 add 0.5 to FAC1 (round FAC1)
  $E293 get FAC1 sign (b7)
  $E295 branch if -ve
  $E297 get the comparison evaluation flag
  $E299 toggle flag
  $E29B save the comparison evaluation flag
  $E29D do - FAC1
  $E2A0 set 0.25 pointer low byte
  $E2A2 set 0.25 pointer high byte
  $E2A4 add (`AY`) to FAC1
  $E2A7 restore FAC1 sign
  $E2A8 branch if was +ve
N $E2AA else correct FAC1
  $E2AA do - FAC1
  $E2AD set pointer low byte to counter
  $E2AF set pointer high byte to counter
  $E2B1 ^2 then series evaluation and return

c $E2B4 perform TAN()
  $E2B4 pack FAC1 into $57
  $E2B7 clear `A`
  $E2B9 clear the comparison evaluation flag
  $E2BB perform SIN()
  $E2BE set sin(n) pointer low byte
  $E2C0 set sin(n) pointer high byte
  $E2C2 pack FAC1 into (`XY`)
  $E2C5 set n pointer low byte
  $E2C7 set n pointer high byte
  $E2C9 unpack memory (`AY`) into FAC1
  $E2CC clear byte
  $E2CE clear FAC1 sign (b7)
  $E2D0 get the comparison evaluation flag
  $E2D2 save flag and go do series evaluation
  $E2D5 set sin(n) pointer low byte
  $E2D7 set sin(n) pointer high byte
  $E2D9 convert `AY` and do (`AY`)/FAC1

c $E2DC save comparison flag and do series evaluation
  $E2DC save comparison flag
  $E2DD add 0.25, ^2 then series evaluation

b $E2E0 constants and series for SIN/COS(n)
  $E2E0,5 1.570796371, pi/2, as floating number
  $E2E5,5 6.28319, 2*pi, as floating number
  $E2EA,5 0.25
  $E2EF,1 series counter
  $E2F0,5 -14.3813907
  $E2F5,5 42.0077971
  $E2FA,5 -76.7041703
  $E2FF,5 81.6052237
  $E304,5 -41.3147021
  $E309,5 6.28318531, 2*pi

c $E30E perform ATN()
  $E30E get FAC1 sign (b7)
  $E310 save sign
  $E311 branch if +ve
  $E313 else do - FAC1
  $E316 get FAC1 exponent
  $E318 push exponent
  $E319 compare with 1
  $E31B branch if FAC1 < 1
  $E31D pointer to 1 low byte
  $E31F pointer to 1 high byte
  $E321 convert `AY` and do (`AY`)/FAC1
  $E324 pointer to series low byte
  $E326 pointer to series high byte
  $E328 ^2 then series evaluation
  $E32B restore old FAC1 exponent
  $E32C compare with 1
  $E32E branch if FAC1 < 1
  $E330 pointer to (pi/2) low byte
  $E332 pointer to (pi/2) low byte
  $E334 perform subtraction, FAC1 from (`AY`)
  $E337 restore FAC1 sign
  $E338 exit if was +ve
  $E33A else do - FAC1 and return
  $E33D

b $E33E series for ATN(n)
  $E33E,1 series counter
  $E33F,5 -6.84793912E-04
  $E344,5 4.85094216E-03
  $E349,5 -.0161117015
  $E34E,5 .034209638
  $E353,5 -.054279133
  $E358,5 .0724571965
  $E35D,5 -.0898019185
  $E362,5 .110932413
  $E367,5 -.142839808
  $E36C,5 .19999912
  $E371,5 -.333333316
  $E376,5 1

c $E37B BASIC warm start entry point
  $E37B close input and output channels
  $E37E clear `A`
  $E380 set current I/O channel, flag default
  $E382 flush BASIC stack and clear continue pointer
  $E385 enable the interrupts
  $E386 set -ve error, just do warm start
@ $E388 ignoreua
  $E388 go handle error message, normally $E38B
  $E38B copy the error number
  $E38C if -ve go do warm start
  $E38E else do error #`X` then warm start
  $E391 do warm start

c $E394 BASIC cold start entry point
  $E394 initialise the BASIC vector table
  $E397 initialise the BASIC RAM locations
  $E39A print the start up message and initialise the memory pointers
N $E39D not ok ??
  $E39D value for start stack
  $E39F set stack pointer
  $E3A0 do "READY." warm start, branch always

c $E3A2 character get subroutine for zero page
@ $E3A2 ignoreua:d
D $E3A2 the target address for the LDA $EA60 becomes the BASIC execute pointer once the block is copied to its destination, any non zero page address will do at assembly time, to assemble a three byte instruction. $EA60 is RTS, NOP.
D $E3A2 page 0 initialisation table from $0073. increment and scan memory
  $E3A2 increment BASIC execute pointer low byte
  $E3A4 branch if no carry
  $E3A6 else increment BASIC execute pointer high byte
N $E3A8 page 0 initialisation table from $0079. scan memory
  $E3A8 get byte to scan, address set by call routine
  $E3AB,c compare with ":"
  $E3AD exit if>=
N $E3AF page 0 initialisation table from $0080. clear Cb if numeric
  $E3AF,c compare with " "
  $E3B1 if " " go do next
  $E3B3 set carry for SBC
  $E3B4,c subtract "0"
  $E3B6 set carry for SBC
  $E3B7 subtract -"0"
N $E3B9 clear carry if byte = "0"-"9"
  $E3B9

b $E3BA spare bytes, not referenced
  $E3BA,5 0.811635157

c $E3BF initialise BASIC RAM locations
  $E3BF opcode for JMP
  $E3C1 save for functions vector jump
  $E3C3 save for USR() vector jump
N $E3C6 set USR() vector to illegal quantity error
  $E3C6 set USR() vector low byte
  $E3C8 set USR() vector high byte
  $E3CA save USR() vector low byte
  $E3CD save USR() vector high byte
  $E3D0 set fixed to float vector low byte
  $E3D2 set fixed to float vector high byte
  $E3D4 save fixed to float vector low byte
  $E3D6 save fixed to float vector high byte
  $E3D8 set float to fixed vector low byte
  $E3DA set float to fixed vector high byte
  $E3DC save float to fixed vector low byte
  $E3DE save float to fixed vector high byte
N $E3E0 copy the character get subroutine from #R$E3A2 to $0074
  $E3E0 set the byte count
  $E3E2 get a byte from the table
  $E3E5 save the byte in page zero
  $E3E7 decrement the count
  $E3E8 loop if not all done
N $E3EA clear descriptors, strings, program area and mamory pointers
  $E3EA set the step size, collecting descriptors
  $E3EC save the garbage collection step size
  $E3EE clear `A`
  $E3F0 clear FAC1 overflow byte
  $E3F2 clear the current I/O channel, flag default
  $E3F4 clear the current descriptor stack item pointer high byte
  $E3F6 set `X`
  $E3F8 set the chain link pointer low byte
  $E3FB set the chain link pointer high byte
  $E3FE initial the value for descriptor stack
  $E400 set descriptor stack pointer
  $E402 set Cb = 1 to read the bottom of memory
  $E403 read/set the bottom of memory
  $E406 save the start of memory low byte
  $E408 save the start of memory high byte
  $E40A set Cb = 1 to read the top of memory
  $E40B read/set the top of memory
  $E40E save the end of memory low byte
  $E410 save the end of memory high byte
  $E412 set the bottom of string space low byte
  $E414 set the bottom of string space high byte
  $E416 clear the index
  $E418 clear the `A`
  $E419 clear the the first byte of memory
  $E41B increment the start of memory low byte
  $E41D if no rollover skip the high byte increment
  $E41F increment start of memory high byte
  $E421

c $E422 print the start up message and initialise the memory pointers
  $E422 get the start of memory low byte
  $E424 get the start of memory high byte
  $E426 check available memory, do out of memory error if no room
  $E429 set "**** COMMODORE 64 BASIC V2 ****" pointer low byte
  $E42B set "**** COMMODORE 64 BASIC V2 ****" pointer high byte
  $E42D print a null terminated string
  $E430 get the end of memory low byte
  $E432 set carry for subtract
  $E433 subtract the start of memory low byte
  $E435 copy the result to `X`
  $E436 get the end of memory high byte
  $E438 subtract the start of memory high byte
  $E43A print `XA` as unsigned integer
  $E43D set " BYTES FREE" pointer low byte
  $E43F set " BYTES FREE" pointer high byte
  $E441 print a null terminated string
  $E444 do NEW, CLEAR, RESTORE and return

w $E447 BASIC vectors
D $E447 these are copied to RAM from $0300 onwards
  $E447 $0300: error message
  $E449 $0302: BASIC warm start
  $E44B $0304: crunch BASIC tokens
  $E44D $0306: uncrunch BASIC tokens
  $E44F $0308: start new BASIC code
  $E451 $030A: get arithmetic element

c $E453 initialise the BASIC vectors
  $E453 set byte count
  $E455 get byte from table
  $E458 save byte to RAM
  $E45B decrement index
  $E45C loop if more to do
  $E45E

u $E45F unused

t $E460 BASIC startup messages
  $E460,19,17:n2
B $E473,2
  $E475,36,35:n1
B $E499,1
  $E49A,18,17:n1

u $E4AC unused

c $E4AD open channel for output
  $E4AD save the flag byte
  $E4AE open channel for output
  $E4B1 copy the returned flag byte
  $E4B2 restore the alling flag byte
  $E4B3 if there is no error skip copying the error flag
  $E4B5 else copy the error flag
  $E4B6

u $E4B7 unused bytes

c $E4D3 flag the RS232 start bit and set the parity
  $E4D3 save the start bit check flag, set start bit received
  $E4D5 set the initial parity state
  $E4D7 save the receiver parity bit
  $E4D9

c $E4DA save the current colour to the colour RAM
  $E4DA get the current colour code
  $E4DD save it to the colour RAM
  $E4DF

c $E4E0 wait ~8.5 seconds for any key from the STOP key column
  $E4E0 set the number of jiffies to wait
  $E4E2 read the stop key column
  $E4E4 test for $FF, no keys pressed
  $E4E5 if any keys were pressed just exit
  $E4E7 compare the wait time with the jiffy clock mid byte
  $E4E9 if not there yet go wait some more
  $E4EB

w $E4EC baud rate tables for PAL C64
D $E4EC baud rate word is calculated from ..
D $E4EC (system clock / baud rate) / 2 - 100
D $E4EC #TABLE(default) { =h,c2 system clock } { PAL | 985248 Hz } { NTSC | 1022727 Hz } TABLE#
  $E4EC 50 baud (985300)
  $E4EE 75 baud (985200)
  $E4F0 110 baud (985160)
  $E4F2 134.5 baud (984540)
  $E4F4 150 baud (985200)
  $E4F6 300 baud (985200)
  $E4F8 600 baud (985200)
  $E4FA 1200 baud (986400)
  $E4FC 1800 baud (986400)
  $E4FE 2400 baud (984000)

c $E500 return the base address of the I/O devices
  $E500 get the I/O base address low byte
  $E502 get the I/O base address high byte
  $E504

c $E505 return the x,y organization of the screen
  $E505 get the x size
  $E507 get the y size
  $E509

c $E50A read/set the x,y cursor position
  $E50A if read cursor go do read
  $E50C save the cursor row
  $E50E save the cursor column
  $E510 set the screen pointers for the cursor row, column
  $E513 get the cursor row
  $E515 get the cursor column
  $E517

c $E518 initialise the screen and keyboard
  $E518 initialise the vic chip
  $E51B clear `A`
  $E51D clear the shift mode switch
  $E520 clear the cursor blink phase
  $E522 get the keyboard decode logic pointer low byte
  $E524 save the keyboard decode logic pointer low byte
  $E527 get the keyboard decode logic pointer high byte
  $E529 save the keyboard decode logic pointer high byte
  $E52C set the maximum size of the keyboard buffer
  $E52E save the maximum size of the keyboard buffer
  $E531 save the repeat delay counter
  $E534 set light blue
  $E536 save the current colour code
  $E539 speed 4
  $E53B save the repeat speed counter
  $E53E set the cursor flash timing
  $E540 save the cursor timing countdown
  $E542 save the cursor enable, $00 = flash cursor

c $E544 clear the screen
  $E544 get the screen memory page
  $E547 set the high bit, flag every line is a logical line start
  $E549 copy to `Y`
  $E54A clear the line start low byte
  $E54C clear the index
  $E54D save the start of line `X` pointer high byte
  $E54F clear carry for add
  $E550 add the line length to the low byte
  $E552 if no rollover skip the high byte increment
  $E554 else increment the high byte
  $E555 increment the line index
  $E556 compare it with the number of lines + 1
  $E558 loop if not all done
  $E55A set the end of table marker
  $E55C mark the end of the table
  $E55E set the line count, 25 lines to do, 0 to 24
  $E560 clear screen line `X`
  $E563 decrement the count
  $E564 loop if more to do

c $E566 home the cursor
  $E566 clear `Y`
  $E568 clear the cursor column
  $E56A clear the cursor row

c $E56C set screen pointers for cursor row, column
  $E56C get the cursor row
  $E56E get the cursor column
  $E570 get start of line `X` pointer high byte
  $E572 if it is the logical line start continue
  $E574 else clear carry for add
  $E575 add one line length
  $E577 save the cursor column
  $E579 decrement the cursor row
  $E57A loop, branch always
  $E57C fetch a screen address
  $E57F set the line length
  $E581 increment the cursor row
  $E582 get the start of line `X` pointer high byte
  $E584 if logical line start exit
  $E586 else clear carry for add
  $E587 add one line length to the current line length
  $E589 increment the cursor row
  $E58A loop, branch always
  $E58C save current screen line length
  $E58E calculate the pointer to colour RAM and return

c $E591 find and set the pointers for the start of logical line
  $E591 compare it with the input cursor row
  $E593 if there just exit
  $E595 else go ??
  $E598

c $E599 orphan bytes ??
  $E599 huh
  $E59A initialise the vic chip
  $E59D home the cursor and return

c $E5A0 initialise the vic chip
  $E5A0 set the screen as the output device
  $E5A2 save the output device number
  $E5A4 set the keyboard as the input device
  $E5A6 save the input device number
  $E5A8 set the count/index
@ $E5AA nowarn
  $E5AA get a vic ii chip initialisation value
  $E5AD save it to the vic ii chip
  $E5B0 decrement the count/index
  $E5B1 loop if more to do
  $E5B3

c $E5B4 input from the keyboard buffer
  $E5B4 get the current character from the buffer
  $E5B7 clear the index
  $E5B9 get the next character,X from the buffer
  $E5BC save it as the current character,X in the buffer
  $E5BF increment the index
  $E5C0 compare it with the keyboard buffer index
  $E5C2 loop if more to do
  $E5C4 decrement keyboard buffer index
  $E5C6 copy the key to `A`
  $E5C7 enable the interrupts
  $E5C8 flag got byte
  $E5C9

c $E5CA write character and wait for key
  $E5CA output character

c $E5CD wait for a key from the keyboard
  $E5CD get the keyboard buffer index
  $E5CF cursor enable, $00 = flash cursor, $xx = no flash
  $E5D1 screen scrolling flag, $00 = scroll, $xx = no scroll. this disables both the cursor flash and the screen scroll while there are characters in the keyboard buffer
  $E5D4 loop if the buffer is empty
  $E5D6 disable the interrupts
  $E5D7 get the cursor blink phase
  $E5D9 if cursor phase skip the overwrite
N $E5DB else it is the character phase
  $E5DB get the character under the cursor
  $E5DD get the colour under the cursor
  $E5E0 clear `Y`
  $E5E2 clear the cursor blink phase
  $E5E4 print character `A` and colour `X`
  $E5E7 input from the keyboard buffer
  $E5EA compare with [SHIFT][RUN]
  $E5EC if not [SHIFT][RUN] skip the buffer fill
N $E5EE keys are [SHIFT][RUN] so put "LOAD",$0D,"RUN",$0D into the buffer
  $E5EE set the byte count
  $E5F0 disable the interrupts
  $E5F1 set the keyboard buffer index
@ $E5F3 nowarn
  $E5F3 get byte from the auto load/run table
  $E5F6 save it to the keyboard buffer
  $E5F9 decrement the count/index
  $E5FA loop while more to do
  $E5FC loop for the next key, branch always
N $E5FE was not [SHIFT][RUN]
  $E5FE compare the key with [CR]
  $E600 if not [CR] print the character and get the next key
N $E602 else it was [CR]
  $E602 get the current screen line length
  $E604 input from keyboard or screen, $xx = screen, $00 = keyboard
  $E606 get the character from the current screen line
  $E608,c compare it with [SPACE]
  $E60A if not [SPACE] continue
  $E60C else eliminate the space, decrement end of input line
  $E60D loop, branch always
  $E60F increment past the last non space character on line
  $E610 save the input [EOL] pointer
  $E612 clear `A`
  $E614 clear the screen scrolling flag, $00 = scroll
  $E617 clear the cursor column
  $E619 clear the cursor quote flag, $xx = quote, $00 = no quote
  $E61B get the input cursor row
  $E61D
  $E61F get the cursor row
  $E621 find and set the pointers for the start of logical line
  $E624 compare with input cursor row
  $E626
  $E628 get the input cursor column
  $E62A save the cursor column
  $E62C compare the cursor column with input [EOL] pointer
  $E62E if less, cursor is in line, go ??
  $E630 else the cursor is beyond the line end, branch always

c $E632 input from screen or keyboard
  $E632 copy `Y`
  $E633 save `Y`
  $E634 copy `X`
  $E635 save `X`
  $E636 input from keyboard or screen, $xx = screen, $00 = keyboard
  $E638 if keyboard go wait for key
  $E63A get the cursor column
  $E63C get character from the current screen line
  $E63E save temporary last character
  $E640,b mask key bits
  $E642 << temporary last character
  $E644 test it
  $E646 branch if not [NO KEY]
  $E648
  $E64A
  $E64C get the cursor quote flag, $xx = quote, $00 = no quote
  $E64E if in quote mode go ??
  $E650
  $E652
  $E654 increment the cursor column
  $E656 if open quote toggle the cursor quote flag
  $E659 compare ?? with input [EOL] pointer
  $E65B if not at line end go ??
  $E65D clear `A`
  $E65F clear input from keyboard or screen, $xx = screen, $00 = keyboard
  $E661 set character [CR]
  $E663 get the input device number
  $E665 compare the input device with the screen
  $E667 if screen go ??
  $E669 get the output device number
  $E66B compare the output device with the screen
  $E66D if screen go ??
  $E66F output the character
  $E672 set character [CR]
  $E674 save character
  $E676 pull `X`
  $E677 restore `X`
  $E678 pull `Y`
  $E679 restore `Y`
  $E67A restore character
  $E67C
  $E67E
  $E680
  $E682 flag ok
  $E683

c $E684 if open quote toggle cursor quote flag
  $E684 compare byte with "
  $E686 exit if not "
  $E688 get cursor quote flag, $xx = quote, $00 = no quote
  $E68A,b toggle it
  $E68C save cursor quote flag
  $E68E restore the "
  $E690

c $E691 insert uppercase/graphic character
  $E691 change to uppercase/graphic
  $E693 get the reverse flag
  $E695 branch if not reverse
N $E697 else ... insert reversed character
  $E697 reverse character
  $E699 get the insert count
  $E69B branch if none
  $E69D else decrement the insert count
  $E69F get the current colour code
  $E6A2 print character `A` and colour `X`
  $E6A5 advance the cursor
N $E6A8 restore the registers, set the quote flag and exit
  $E6A8 pull `Y`
  $E6A9 restore `Y`
  $E6AA get the insert count
  $E6AC skip quote flag clear if inserts to do
  $E6AE clear cursor quote flag, $xx = quote, $00 = no quote
  $E6B0 pull `X`
  $E6B1 restore `X`
  $E6B2 restore `A`
  $E6B3
  $E6B4 enable the interrupts
  $E6B5

c $E6B6 advance the cursor
  $E6B6 test for line increment
  $E6B9 increment the cursor column
  $E6BB get current screen line length
  $E6BD compare ?? with the cursor column
  $E6BF exit if line length >= cursor column
  $E6C1 compare with max length
  $E6C3 if at max clear column, back cursor up and do newline
  $E6C5 get the autoscroll flag
  $E6C8 branch if autoscroll on
  $E6CA else open space on screen
  $E6CD get the cursor row
  $E6CF compare with max + 1
  $E6D1 if less than max + 1 go add this row to the current logical line
  $E6D3 else scroll the screen
  $E6D6 decrement the cursor row
  $E6D8 get the cursor row
N $E6DA add this row to the current logical line
  $E6DA shift start of line `X` pointer high byte
  $E6DC shift start of line `X` pointer high byte back,
N $E6DE make next screen line start of logical line, increment line length and set pointers. clear b7, start of logical line
  $E6DE increment screen row
  $E6DF get start of line `X` pointer high byte
  $E6E1,b mark as start of logical line
  $E6E3 set start of line `X` pointer high byte
  $E6E5 restore screen row
  $E6E6 get current screen line length
N $E6E8 add one line length and set the pointers for the start of the line
  $E6E8 clear carry for add
  $E6E9 add one line length
  $E6EB save current screen line length
  $E6ED get start of line `X` pointer high byte
  $E6EF exit loop if start of logical line
  $E6F1 else back up one line
  $E6F2 loop if not on first line
  $E6F4 fetch a screen address
  $E6F7 decrement the cursor row
  $E6F9 do newline
  $E6FC clear `A`
  $E6FE clear the cursor column
  $E700

c $E701 back onto the previous line if possible
  $E701 get the cursor row
  $E703 branch if not top row
  $E705 clear cursor column
  $E707 dump return address low byte
  $E708 dump return address high byte
  $E709 restore registers, set quote flag and exit, branch always
  $E70B decrement the cursor row
  $E70C save the cursor row
  $E70E set the screen pointers for cursor row, column
  $E711 get current screen line length
  $E713 save the cursor column
  $E715

c $E716 output a character to the screen
  $E716 save character
  $E717 save temporary last character
  $E719 copy `X`
  $E71A save `X`
  $E71B copy `Y`
  $E71C save `Y`
  $E71D clear `A`
  $E71F clear input from keyboard or screen, $xx = screen, $00 = keyboard
  $E721 get cursor column
  $E723 restore last character
  $E725 branch if unshifted
  $E727 do shifted characters and return
  $E72A compare with [CR]
  $E72C branch if not [CR]
  $E72E else output [CR] and return
  $E731,c compare with [SPACE]
  $E733 branch if < [SPACE], not a printable character
  $E735
  $E737 branch if $20 to $5F
N $E739 character is $60 or greater
  $E739 conversion of PETSCII character to screen code
  $E73B branch always
N $E73D character is $20 to $5F
  $E73D conversion of PETSCII character to screen code
  $E73F if open quote toggle cursor direct/programmed flag
  $E742
N $E745 character was < [SPACE] so is a control character of some sort
  $E745 get the insert count
  $E747 if no characters to insert continue
  $E749 insert reversed character
  $E74C compare the character with [INSERT]/[DELETE]
  $E74E if not [INSERT]/[DELETE] go ??
  $E750
  $E751
  $E753 back onto the previous line if possible
  $E756
  $E759 test for line decrement
N $E75C now close up the line
  $E75C decrement index to previous character
  $E75D save the cursor column
  $E75F calculate the pointer to colour RAM
  $E762 increment index to next character
  $E763 get character from current screen line
  $E765 decrement index to previous character
  $E766 save character to current screen line
  $E768 increment index to next character
  $E769 get colour RAM byte
  $E76B decrement index to previous character
  $E76C save colour RAM byte
  $E76E increment index to next character
  $E76F compare with current screen line length
  $E771 loop if not there yet
  $E773,c set [SPACE]
  $E775 clear last character on current screen line
  $E777 get the current colour code
  $E77A save to colour RAM
  $E77C branch always
  $E77E get cursor quote flag, $xx = quote, $00 = no quote
  $E780 branch if not quote mode
  $E782 insert reversed character
  $E785 compare with [RVS ON]
  $E787 if not [RVS ON] skip setting the reverse flag
  $E789 else set the reverse flag
  $E78B compare with [CLR HOME]
  $E78D if not [CLR HOME] continue
  $E78F home the cursor
  $E792 compare with [CURSOR RIGHT]
  $E794 if not [CURSOR RIGHT] go ??
  $E796 increment the cursor column
  $E797 test for line increment
  $E79A save the cursor column
  $E79C decrement the cursor column
  $E79D compare cursor column with current screen line length
  $E79F exit if less
N $E7A1 else the cursor column is >= the current screen line length so back onto the current line and do a newline
  $E7A1 decrement the cursor row
  $E7A3 do newline
  $E7A6 clear cursor column
  $E7A8 save the cursor column
  $E7AA restore the registers, set the quote flag and exit
  $E7AD compare with [CURSOR DOWN]
  $E7AF if not [CURSOR DOWN] go ??
  $E7B1 clear carry for add
  $E7B2 copy the cursor column
  $E7B3 add one line
  $E7B5 copy back to `Y`
  $E7B6 increment the cursor row
  $E7B8 compare cursor column with current screen line length
  $E7BA if less go save cursor column and exit
  $E7BC if equal go save cursor column and exit
N $E7BE else the cursor has moved beyond the end of this line so back it up until it's on the start of the logical line
  $E7BE decrement the cursor row
  $E7C0 subtract one line
  $E7C2 if on previous line exit the loop
  $E7C4 else save the cursor column
  $E7C6 loop if not at the start of the line
  $E7C8 do newline
  $E7CB restore the registers, set the quote flag and exit
  $E7CE set the colour code
  $E7D1 go check for special character codes
  $E7D4,b mask 0xxx xxxx, clear b7
  $E7D6 was it $FF before the mask
  $E7D8 branch if not
  $E7DA else make it $5E
  $E7DC,c compare the character with [SPACE]
  $E7DE if < [SPACE] go ??
  $E7E0 insert uppercase/graphic character and return
N $E7E3 character was $80 to $9F and is now $00 to $1F
  $E7E3 compare with [CR]
  $E7E5 if not [CR] continue
  $E7E7 else output [CR] and return
N $E7EA was not [CR]
  $E7EA get the cursor quote flag, $xx = quote, $00 = no quote
  $E7EC branch if quote mode
  $E7EE compare with [INSERT DELETE]
  $E7F0 if not [INSERT DELETE] go ??
  $E7F2 get current screen line length
  $E7F4 get character from current screen line
  $E7F6,c compare the character with [SPACE]
  $E7F8 if not [SPACE] continue
  $E7FA compare the current column with the cursor column
  $E7FC if not cursor column go open up space on line
  $E7FE compare current column with max line length
  $E800 if at line end just exit
  $E802 else open up a space on the screen
N $E805 now open up space on the line to insert a character
  $E805 get current screen line length
  $E807 calculate the pointer to colour RAM
  $E80A decrement the index to previous character
  $E80B get the character from the current screen line
  $E80D increment the index to next character
  $E80E save the character to the current screen line
  $E810 decrement the index to previous character
  $E811 get the current screen line colour RAM byte
  $E813 increment the index to next character
  $E814 save the current screen line colour RAM byte
  $E816 decrement the index to the previous character
  $E817 compare the index with the cursor column
  $E819 loop if not there yet
  $E81B,c set [SPACE]
  $E81D clear character at cursor position on current screen line
  $E81F get current colour code
  $E822 save to cursor position on current screen line colour RAM
  $E824 increment insert count
  $E826 restore the registers, set the quote flag and exit
  $E829 get the insert count
  $E82B branch if no insert space
  $E82D change to uppercase/graphic
  $E82F insert reversed character
  $E832 compare with [CURSOR UP]
  $E834 branch if not [CURSOR UP]
  $E836 get the cursor row
  $E838 if on the top line go restore the registers, set the quote flag and exit
  $E83A decrement the cursor row
  $E83C get the cursor column
  $E83E set carry for subtract
  $E83F subtract one line length
  $E841 branch if stepped back to previous line
  $E843 else save the cursor column ..
  $E845 .. and exit, branch always
  $E847 set the screen pointers for cursor row, column ..
  $E84A .. and exit, branch always
  $E84C compare with [RVS OFF]
  $E84E if not [RVS OFF] continue
  $E850 else clear `A`
  $E852 clear the reverse flag
  $E854 compare with [CURSOR LEFT]
  $E856 if not [CURSOR LEFT] go ??
  $E858 copy the cursor column
  $E859 if at start of line go back onto the previous line
  $E85B test for line decrement
  $E85E decrement the cursor column
  $E85F save the cursor column
  $E861 restore the registers, set the quote flag and exit
  $E864 back onto the previous line if possible
  $E867 restore the registers, set the quote flag and exit
  $E86A compare with [CLR]
  $E86C if not [CLR] continue
  $E86E clear the screen
  $E871 restore the registers, set the quote flag and exit
  $E874,b restore b7, colour can only be black, cyan, magenta or yellow
  $E876 set the colour code
  $E879 go check for special character codes except for switch to lower case

c $E87C do newline
  $E87C shift >> input cursor row
  $E87E get the cursor row
  $E880 increment the row
  $E881 compare it with last row + 1
  $E883 if not last row + 1 skip the screen scroll
  $E885 else scroll the screen
  $E888 get start of line `X` pointer high byte
  $E88A loop if not start of logical line
  $E88C save the cursor row
  $E88E set the screen pointers for cursor row, column and return

c $E891 output [CR]
  $E891 clear `X`
  $E893 clear the insert count
  $E895 clear the reverse flag
  $E897 clear the cursor quote flag, $xx = quote, $00 = no quote
  $E899 save the cursor column
  $E89B do newline
  $E89E restore the registers, set the quote flag and exit

c $E8A1 test for line decrement
  $E8A1 set the count
  $E8A3 set the column
  $E8A5 compare the column with the cursor column
  $E8A7 if at the start of the line go decrement the cursor row and exit
  $E8A9 else clear carry for add
  $E8AA increment to next line
  $E8AC decrement loop count
  $E8AD loop if more to test
  $E8AF
  $E8B0 else decrement the cursor row
  $E8B2

c $E8B3 test for line increment
D $E8B3 if at end of the line, but not at end of the last line, increment the cursor row
  $E8B3 set the count
  $E8B5 set the column
  $E8B7 compare the column with the cursor column
  $E8B9 if at end of line test and possibly increment cursor row
  $E8BB else clear carry for add
  $E8BC increment to the next line
  $E8BE decrement the loop count
  $E8BF loop if more to test
  $E8C1
N $E8C2 cursor is at end of line
  $E8C2 get the cursor row
  $E8C4 compare it with the end of the screen
  $E8C6 if at the end of screen just exit
  $E8C8 else increment the cursor row
  $E8CA

c $E8CB set the colour code
D $E8CB enter with the colour character in `A`. if `A` does not contain a colour character this routine exits without changing the colour
  $E8CB set the colour code count
  $E8CD compare the character with a table code
  $E8D0 if a match go save the colour and exit
  $E8D2 else decrement the index
  $E8D3 loop if more to do
  $E8D5
  $E8D6 save the current colour code
  $E8D9

b $E8DA ASCII colour code table
  $E8DA,1 144 (black)
  $E8DB,1 5 (white)
  $E8DC,1 28 (red)
  $E8DD,1 159 (cyan)
  $E8DE,1 156 (purple)
  $E8DF,1 30 (green)
  $E8E0,1 31 (blue)
  $E8E1,1 158 (yellow)
  $E8E2,1 129 (orange)
  $E8E3,1 149 (brown)
  $E8E4,1 150 (light red)
  $E8E5,1 151 (dark grey)
  $E8E6,1 152 (medium grey)
  $E8E7,1 153 (light green)
  $E8E8,1 154 (light blue)
  $E8E9,1 155 (light grey)

c $E8EA scroll the screen
  $E8EA copy the tape buffer start pointer
  $E8EC save it
  $E8ED copy the tape buffer start pointer
  $E8EF save it
  $E8F0 copy the tape buffer end pointer
  $E8F2 save it
  $E8F3 copy the tape buffer end pointer
  $E8F5 save it
  $E8F6 set to -1 for pre increment loop
  $E8F8 decrement the cursor row
  $E8FA decrement the input cursor row
  $E8FC decrement the screen row marker
  $E8FF increment the line number
  $E900 fetch a screen address, set the start of line `X`
  $E903 compare with last line
  $E905 branch if >= $16
  $E907 get the start of the next line pointer low byte
  $E90A save the next line pointer low byte
  $E90C get the start of the next line pointer high byte
  $E90E shift the screen line up
  $E911 loop, branch always
  $E913 clear screen line `X`
N $E916 now shift up the start of logical line bits
  $E916 clear index
  $E918 get the start of line `X` pointer high byte
  $E91A clear the line `X` start of logical line bit
  $E91C get the start of the next line pointer high byte
  $E91E if next line is not a start of line skip the start set
  $E920 set line `X` start of logical line bit
  $E922 set start of line `X` pointer high byte
  $E924 increment line number
  $E925 compare with last line
  $E927 loop if not last line
  $E929 get start of last line pointer high byte
  $E92B mark as start of logical line
  $E92D set start of last line pointer high byte
  $E92F get start of first line pointer high byte
  $E931 if not start of logical line loop back and scroll the screen up another line
  $E933 increment the cursor row
  $E935 increment screen row marker
  $E938 set keyboard column c7
  $E93A save VIA 1 DRA, keyboard column drive
  $E93D read VIA 1 DRB, keyboard row port
  $E940 compare with row r2 active, [CTL]
  $E942 save status
  $E943 set keyboard column c7
  $E945 save VIA 1 DRA, keyboard column drive
  $E948 restore status
  $E949 skip delay if ??
N $E94B first time round the inner loop `X` will be $16
  $E94B clear delay outer loop count, do this 256 times
  $E94D waste cycles
  $E94E decrement inner loop count
  $E94F loop if not all done
  $E951 decrement outer loop count
  $E952 loop if not all done
  $E954 clear the keyboard buffer index
  $E956 get the cursor row
N $E958 restore the tape buffer pointers and exit
  $E958 pull tape buffer end pointer
  $E959 restore it
  $E95B pull tape buffer end pointer
  $E95C restore it
  $E95E pull tape buffer pointer
  $E95F restore it
  $E961 pull tape buffer pointer
  $E962 restore it
  $E964

c $E965 open up a space on the screen
  $E965 get the cursor row
  $E967 increment the row
  $E968 get the start of line `X` pointer high byte
  $E96A loop if not start of logical line
  $E96C save the screen row marker
  $E96F compare it with the last line
  $E971 if = last line go ??
  $E973 if < last line go ??
N $E975 else it was > last line
  $E975 scroll the screen
  $E978 get the screen row marker
  $E97B decrement the screen row marker
  $E97C decrement the cursor row
  $E97E add this row to the current logical line and return
  $E981 copy tape buffer pointer
  $E983 save it
  $E984 copy tape buffer pointer
  $E986 save it
  $E987 copy tape buffer end pointer
  $E989 save it
  $E98A copy tape buffer end pointer
  $E98C save it
  $E98D set to end line + 1 for predecrement loop
  $E98F decrement the line number
  $E990 fetch a screen address
  $E993 compare it with the screen row marker
  $E996 if < screen row marker go ??
  $E998 if = screen row marker go ??
  $E99A else get the start of the previous line low byte from the ROM table
  $E99D save previous line pointer low byte
  $E99F get the start of the previous line pointer high byte
  $E9A1 shift the screen line down
  $E9A4 loop, branch always
  $E9A6 clear screen line `X`
  $E9A9
  $E9AB compare it with the screen row marker
  $E9AE
  $E9B0
  $E9B2
  $E9B4 get start of line `X` pointer high byte
  $E9B6
  $E9B8
  $E9BA
  $E9BC
  $E9BD
  $E9BF get the screen row marker
  $E9C2 add this row to the current logical line
  $E9C5 restore the tape buffer pointers and exit

c $E9C8 shift screen line up/down
  $E9C8,b mask 0000 00xx, line memory page
  $E9CA OR with screen memory page
  $E9CD save next/previous line pointer high byte
  $E9CF calculate pointers to screen lines colour RAM
  $E9D2 set the column count
  $E9D4 get character from next/previous screen line
  $E9D6 save character to current screen line
  $E9D8 get colour from next/previous screen line colour RAM
  $E9DA save colour to current screen line colour RAM
  $E9DC decrement column index/count
  $E9DD loop if more to do
  $E9DF

c $E9E0 calculate pointers to screen lines colour RAM
  $E9E0 calculate the pointer to the current screen line colour RAM
  $E9E3 get the next screen line pointer low byte
  $E9E5 save the next screen line colour RAM pointer low byte
  $E9E7 get the next screen line pointer high byte
  $E9E9,b mask 0000 00xx, line memory page
  $E9EB,b set 1101 10xx, colour memory page
  $E9ED save the next screen line colour RAM pointer high byte
  $E9EF

c $E9F0 fetch a screen address
  $E9F0 get the start of line low byte from the ROM table
  $E9F3 set the current screen line pointer low byte
  $E9F5 get the start of line high byte from the RAM table
  $E9F7,b mask 0000 00xx, line memory page
  $E9F9 OR with the screen memory page
  $E9FC save the current screen line pointer high byte
  $E9FE

c $E9FF clear screen line `X`
  $E9FF set number of columns to clear
  $EA01 fetch a screen address
  $EA04 calculate the pointer to colour RAM
  $EA07 save the current colour to the colour RAM
  $EA0A,c set [SPACE]
  $EA0C clear character in current screen line
  $EA0E decrement index
  $EA0F loop if more to do
  $EA11

u $EA12 orphan byte
C $EA12 unused

c $EA13 print character `A` and colour `X`
  $EA13 copy the character
  $EA14 set the count to $02, usually $14 ??
  $EA16 save the cursor countdown
  $EA18 calculate the pointer to colour RAM
  $EA1B get the character back

c $EA1C save the character and colour to the screen @ the cursor
  $EA1C get the cursor column
  $EA1E save the character from current screen line
  $EA20 copy the colour to `A`
  $EA21 save to colour RAM
  $EA23

c $EA24 calculate the pointer to colour RAM
  $EA24 get current screen line pointer low byte
  $EA26 save pointer to colour RAM low byte
  $EA28 get current screen line pointer high byte
  $EA2A,b mask 0000 00xx, line memory page
  $EA2C,b set 1101 10xx, colour memory page
  $EA2E save pointer to colour RAM high byte
  $EA30

c $EA31 IRQ vector
  $EA31 increment the real time clock
  $EA34 get the cursor enable, $00 = flash cursor
  $EA36 if flash not enabled skip the flash
  $EA38 decrement the cursor timing countdown
  $EA3A if not counted out skip the flash
  $EA3C set the flash count
  $EA3E save the cursor timing countdown
  $EA40 get the cursor column
  $EA42 shift b0 cursor blink phase into carry
  $EA44 get the colour under the cursor
  $EA47 get the character from current screen line
  $EA49 branch if cursor phase b0 was 1
  $EA4B set the cursor blink phase to 1
  $EA4D save the character under the cursor
  $EA4F calculate the pointer to colour RAM
  $EA52 get the colour RAM byte
  $EA54 save the colour under the cursor
  $EA57 get the current colour code
  $EA5A get the character under the cursor
  $EA5C,b toggle b7 of character under cursor
  $EA5E save the character and colour to the screen @ the cursor
  $EA61 read the 6510 I/O port
  $EA63,b mask 000x 0000, the cassette switch sense
  $EA65 if the cassette sense is low skip the motor stop
N $EA67 the cassette sense was high, the switch was open, so turn off the motor and clear the interlock
  $EA67 clear `Y`
  $EA69 clear the tape motor interlock
  $EA6B read the 6510 I/O port
  $EA6D,b mask xx1x xxxx, turn off the motor
  $EA6F go save the port value, branch always
N $EA71 the cassette sense was low so turn the motor on, perhaps
  $EA71 get the tape motor interlock
  $EA73 if the cassette interlock <> 0 don't turn on motor
  $EA75 read the 6510 I/O port
  $EA77,b mask xx0x xxxx, turn on the motor
  $EA79 save the 6510 I/O port
  $EA7B scan the keyboard
  $EA7E read VIA 1 ICR, clear the timer interrupt flag
  $EA81 pull `Y`
  $EA82 restore `Y`
  $EA83 pull `X`
  $EA84 restore `X`
  $EA85 restore `A`
  $EA86

c $EA87 scan the keyboard
D $EA87 scan keyboard performs the following ..
. #LIST(contents,)
. { 1) check if key pressed, if not then exit the routine }
. { 2) init I/O ports of VIA ?? for keyboard scan and set pointers to decode
. table 1. clear the character counter }
. { 3) set one line of port B low and test for a closed key on port A by
. shifting the byte read from the port. if the carry is clear then a key is
. closed so save the count which is incremented on each shift. check for
. shift/stop/cbm keys and flag if closed }
. { 4) repeat step 3 for the whole matrix }
. { 5) evaluate the SHIFT/CTRL/C= keys, this may change the decode table
. selected }
. { 6) use the key count saved in step 3 as an index into the table selected in
. step 5 }
. { 7) check for key repeat operation }
. { 8) save the decoded key to the buffer if first press or repeat }
. LIST#
  $EA87 clear `A`
  $EA89 clear the keyboard shift/control/c= flag
  $EA8C set no key
  $EA8E save which key
  $EA90 clear VIA 1 DRA, keyboard column drive
  $EA93 read VIA 1 DRB, keyboard row port
  $EA96 compare with all bits set
  $EA98 if no key pressed clear current key and exit (does further BEQ to #R$EB26)
  $EA9A clear the key count
  $EA9B get the decode table low byte
  $EA9D save the keyboard pointer low byte
  $EA9F get the decode table high byte
  $EAA1 save the keyboard pointer high byte
  $EAA3 set column 0 low
  $EAA5 save VIA 1 DRA, keyboard column drive
  $EAA8 set the row count
  $EAAA save the column
  $EAAB read VIA 1 DRB, keyboard row port
  $EAAE compare it with itself
  $EAB1 loop if changing
  $EAB3 shift row to Cb
  $EAB4 if no key closed on this row go do next row
  $EAB6 save row
  $EAB7 get character from decode table
  $EAB9 compare with $05, there is no $05 key but the control keys are all less than $05
  $EABB if not shift/control/c=/stop go save key count
N $EABD else was shift/control/c=/stop key
  $EABD compare with $03, stop
  $EABF if stop go save key count and continue
N $EAC1 character is $01 - shift, $02 - c= or $04 - control
  $EAC1 OR it with the keyboard shift/control/c= flag
  $EAC4 save the keyboard shift/control/c= flag
  $EAC7 skip save key, branch always
  $EAC9 save key count
  $EACB restore row
  $EACC increment key count
  $EACD compare with max+1
  $EACF exit loop if >= max+1
N $EAD1 else still in matrix
  $EAD1 decrement row count
  $EAD2 loop if more rows to do
  $EAD4 set carry for keyboard column shift
  $EAD5 restore the column
  $EAD6 shift the keyboard column
  $EAD7 save VIA 1 DRA, keyboard column drive
  $EADA loop for next column, branch always
  $EADC dump the saved column
  $EADD evaluate the SHIFT/CTRL/C= keys, #R$EB48
N $EAE0 key decoding continues here after the SHIFT/CTRL/C= keys are evaluated
  $EAE0 get saved key count
  $EAE2 get character from decode table
  $EAE4 copy character to `X`
  $EAE5 compare key count with last key count
  $EAE7 if this key = current key, key held, go test repeat
  $EAE9 set the repeat delay count
  $EAEB save the repeat delay count
  $EAEE go save key to buffer and exit, branch always
  $EAF0,b clear b7
  $EAF2 test key repeat
  $EAF5 if repeat all go ??
  $EAF7 if repeat none go ??
  $EAF9 compare with end marker
  $EAFB if $00/end marker go save key to buffer and exit
  $EAFD compare with [INSERT]/[DELETE]
  $EAFF if [INSERT]/[DELETE] go test for repeat
  $EB01,c compare with [SPACE]
  $EB03 if [SPACE] go test for repeat
  $EB05 compare with [CURSOR RIGHT]
  $EB07 if [CURSOR RIGHT] go test for repeat
  $EB09 compare with [CURSOR DOWN]
  $EB0B if not [CURSOR DOWN] just exit
N $EB0D was one of the cursor movement keys, insert/delete key or the space bar so always do repeat tests
  $EB0D get the repeat delay counter
  $EB10 if delay expired go ??
  $EB12 else decrement repeat delay counter
  $EB15 if delay not expired go ??
N $EB17 repeat delay counter has expired
  $EB17 decrement the repeat speed counter
  $EB1A branch if repeat speed count not expired
  $EB1C set for 4/60ths of a second
  $EB1E save the repeat speed counter
  $EB21 get the keyboard buffer index
  $EB23 decrement it
  $EB24 if the buffer isn't empty just exit else repeat the key immediately
N $EB26 possibly save the key to the keyboard buffer. if there was no key pressed or the key was not found during the scan (possibly due to key bounce) then `X` will be $FF here
  $EB26 get the key count
  $EB28 save it as the current key count
  $EB2A get the keyboard shift/control/c= flag
  $EB2D save it as last keyboard shift pattern
  $EB30 compare the character with the table end marker or no key
  $EB32 if it was the table end marker or no key just exit
  $EB34 copy the character to `A`
  $EB35 get the keyboard buffer index
  $EB37 compare it with the keyboard buffer size
  $EB3A if the buffer is full just exit
  $EB3C save the character to the keyboard buffer
  $EB3F increment the index
  $EB40 save the keyboard buffer index
  $EB42 enable column 7 for the stop key
  $EB44 save VIA 1 DRA, keyboard column drive
  $EB47

c $EB48 evaluate the SHIFT/CTRL/C= keys
  $EB48 get the keyboard shift/control/c= flag
  $EB4B compare with [SHIFT][C=]
  $EB4D if not [SHIFT][C=] go ??
  $EB4F compare with last
  $EB52 exit if still the same
  $EB54 get the shift mode switch $00 = enabled, $80 = locked
  $EB57 if locked continue keyboard decode
N $EB59 toggle text mode
  $EB59 get the start of character memory address
  $EB5C,b toggle address b1
  $EB5E save the start of character memory address
  $EB61 continue the keyboard decode
N $EB64 select keyboard table
  $EB64 << 1
  $EB65 compare with [CTRL]
  $EB67 if [CTRL] is not pressed skip the index change
  $EB69 else [CTRL] was pressed so make the index = $06
  $EB6B copy the index to `X`
  $EB6C get the decode table pointer low byte
  $EB6F save the decode table pointer low byte
  $EB71 get the decode table pointer high byte
  $EB74 save the decode table pointer high byte
  $EB76 continue the keyboard decode

w $EB79 table addresses
  $EB79 standard
  $EB7B shift
  $EB7D commodore
  $EB7F control

b $EB81 standard keyboard table
  $EB81,8
  $EB89,8
  $EB91,8
  $EB99,8
  $EBA1,8
  $EBA9,8
  $EBB1,8
  $EBB9,8
  $EBC1,1

b $EBC2 shifted keyboard table
  $EBC2,8
  $EBCA,8
  $EBD2,8
  $EBDA,8
  $EBE2,8
  $EBEA,8
  $EBF2,8
  $EBFA,8
  $EC02,1

b $EC03 CBM key keyboard table
  $EC03,8
  $EC0B,8
  $EC13,8
  $EC1B,8
  $EC23,8
  $EC2B,8
  $EC33,8
  $EC3B,8
  $EC43,1

c $EC44 check for special character codes
  $EC44 compare with [SWITCH TO LOWER CASE]
  $EC46 if not [SWITCH TO LOWER CASE] skip the switch
  $EC48 get the start of character memory address
  $EC4B,b mask xxxx xx1x, set lower case characters
  $EC4D go save the new value, branch always
N $EC4F check for special character codes except for switch to lower case
  $EC4F compare with [SWITCH TO UPPER CASE]
  $EC51 if not [SWITCH TO UPPER CASE] go do the [SHIFT]+[C=] key check
  $EC53 get the start of character memory address
  $EC56,b mask xxxx xx0x, set upper case characters
  $EC58 save the start of character memory address
  $EC5B restore the registers, set the quote flag and exit
N $EC5E do the [SHIFT]+[C=] key check
  $EC5E compare with disable [SHIFT][C=]
  $EC60 if not disable [SHIFT][C=] skip the set
  $EC62 set to lock shift mode switch
  $EC64 OR it with the shift mode switch
  $EC67 go save the value, branch always
  $EC69 compare with enable [SHIFT][C=]
  $EC6B exit if not enable [SHIFT][C=]
  $EC6D set to unlock shift mode switch
  $EC6F AND it with the shift mode switch
  $EC72 save the shift mode switch $00 = enabled, $80 = locked
  $EC75 restore the registers, set the quote flag and exit

b $EC78 control keyboard table
  $EC78,8
  $EC80,8
  $EC88,8
  $EC90,8
  $EC98,8
  $ECA0,8
  $ECA8,8
  $ECB0,8
  $ECB8,1

b $ECB9 vic ii chip initialisation values
  $ECB9,2 sprite 0 x,y
  $ECBB,2 sprite 1 x,y
  $ECBD,2 sprite 2 x,y
  $ECBF,2 sprite 3 x,y
  $ECC1,2 sprite 4 x,y
  $ECC3,2 sprite 5 x,y
  $ECC5,2 sprite 6 x,y
  $ECC7,2 sprite 7 x,y
  $ECC9,1 sprites 0 to 7 x bit 8
  $ECCA,1 enable screen, enable 25 rows
N $ECCB vertical fine scroll and control
. #TABLE(default,centre)
. { =h bit | =h function }
. { 7 | raster compare bit 8 }
. { 6 | 1 = enable extended color text mode }
. { 5 | 1 = enable bitmap graphics mode }
. { 4 | 1 = enable screen, 0 = blank screen }
. { 3 | 1 = 25 row display, 0 = 24 row display }
. { 2-0 | vertical scroll count }
. TABLE#
  $ECCB,1 raster compare
  $ECCC,1 light pen x
  $ECCD,1 light pen y
  $ECCE,1 sprite 0 to 7 enable
  $ECCF,1 enable 40 column display
N $ECD0 horizontal fine scroll and control
. #TABLE(default,centre)
. { =h bit | =h function }
. { 7-6 | unused }
. { 5 | 1 = vic reset, 0 = vic on }
. { 4 | 1 = enable multicolor mode }
. { 3 | 1 = 40 column display, 0 = 38 column display }
. { 2-0 | horizontal scroll count }
. TABLE#
  $ECD0,1 sprite 0 to 7 y expand
  $ECD1,1 memory control
N $ECD2 #TABLE(default,centre)
. { =h bit | =h function }
. { 7-4 | video matrix base address }
. { 3-1 | character data base address }
. { 0 | unused }
. TABLE#
  $ECD2,1 clear all interrupts
N $ECD3 interrupt flags
. #TABLE(default,centre)
. { =h bit | =h function }
. { 7 | 1 = interrupt }
. { 6-4 | unused }
. { 3 | 1 = light pen interrupt }
. { 2 | 1 = sprite to sprite collision interrupt }
. { 1 | 1 = sprite to foreground collision interrupt }
. { 0 | 1 = raster compare interrupt }
. TABLE#
  $ECD3,1 all vic IRQs disabled
N $ECD4 IRQ enable
. #TABLE(default,centre)
. { =h bit | =h function }
. { 7-4 | unused }
. { 3 | 1 = enable light pen }
. { 2 | 1 = enable sprite to sprite collision }
. { 1 | 1 = enable sprite to foreground collision }
. { 0 | 1 = enable raster compare }
. TABLE#
  $ECD4,1 sprite 0 to 7 foreground priority
  $ECD5,1 sprite 0 to 7 multicolour
  $ECD6,1 sprite 0 to 7 x expand
  $ECD7,1 sprite 0 to 7 sprite collision
  $ECD8,1 sprite 0 to 7 foreground collision
  $ECD9,1 border colour
  $ECDA,1 background colour 0
  $ECDB,1 background colour 1
  $ECDC,1 background colour 2
  $ECDD,1 background colour 3
  $ECDE,1 sprite multicolour 0
  $ECDF,1 sprite multicolour 1
  $ECE0,1 sprite 0 colour
  $ECE1,1 sprite 1 colour
  $ECE2,1 sprite 2 colour
  $ECE3,1 sprite 3 colour
  $ECE4,1 sprite 4 colour
  $ECE5,1 sprite 5 colour
  $ECE6,1 sprite 6 colour
E $ECB9 sprite 7 colour is actually the first character of #R$ECE7("LOAD") ($4C)

t $ECE7 keyboard buffer for auto load/run
  $ECE7,5,4:n1
  $ECEC,4,3:n1

b $ECF0 low bytes of screen line addresses
  $ECF0,25,5

c $ED09 command serial bus device to TALK
  $ED09 OR with the TALK command
B $ED0B,1 makes next line BIT $2009

c $ED0C command devices on the serial bus to LISTEN
  $ED0C OR with the LISTEN command
  $ED0E check RS232 bus idle

c $ED11 send a control character
  $ED11 save device address
  $ED12 test deferred character flag
  $ED14 if no defered character continue
  $ED16 else flag EOI
  $ED17 rotate into EOI flag byte
  $ED19 Tx byte on serial bus
  $ED1C clear deferred character flag
  $ED1E clear EOI flag
  $ED20 restore the device address

c $ED21 defer a command
  $ED21 save as serial defered character
  $ED23 disable the interrupts
  $ED24 set the serial data out high
  $ED27 compare read byte with $3F
  $ED29 branch if not $3F, this branch will always be taken as after VIA 2's PCR is read it is ANDed with $DF, so the result can never be $3F ??
  $ED2B set the serial clock out high
  $ED2E read VIA 2 DRA, serial port and video address
  $ED31,b mask xxxx 1xxx, set serial ATN low
  $ED33 save VIA 2 DRA, serial port and video address
N $ED36 if the code drops through to here the serial clock is low and the serial data has been released so the following code will have no effect apart from delaying the first byte by 1ms
N $ED36 set the serial clk/data, wait and Tx byte on the serial bus
  $ED36 disable the interrupts
  $ED37 set the serial clock out low
  $ED3A set the serial data out high
  $ED3D 1ms delay

c $ED40 Tx byte on serial bus
  $ED40 disable the interrupts
  $ED41 set the serial data out high
  $ED44 get the serial data status in Cb
  $ED47 if the serial data is high go do 'device not present'
  $ED49 set the serial clock out high
  $ED4C test the EOI flag
  $ED4E if not EOI go ??
N $ED50 I think this is the EOI sequence so the serial clock has been released and the serial data is being held low by the peripheral. first up wait for the serial data to rise
  $ED50 get the serial data status in Cb
  $ED53 loop if the data is low
N $ED55 now the data is high, EOI is signalled by waiting for at least 200#us without pulling the serial clock line low again. the listener should respond by pulling the serial data line low
  $ED55 get the serial data status in Cb
  $ED58 loop if the data is high
N $ED5A the serial data has gone low ending the EOI sequence, now just wait for the serial data line to go high again or, if this isn't an EOI sequence, just wait for the serial data to go high the first time
  $ED5A get the serial data status in Cb
  $ED5D loop if the data is low
N $ED5F serial data is high now pull the clock low, preferably within 60#us
  $ED5F set the serial clock out low
N $ED62 now the C64 has to send the eight bits, LSB first. first it sets the serial data line to reflect the bit in the byte, then it sets the serial clock to high. The serial clock is left high for 26 cycles, 23#us on a PAL Vic, before it is again pulled low and the serial data is allowed high again
  $ED62 eight bits to do
  $ED64 set serial bus bit count
  $ED66 read VIA 2 DRA, serial port and video address
  $ED69 compare it with itself
  $ED6C if changed go try again
  $ED6E shift the serial data into Cb
  $ED6F if the serial data is low go do serial bus timeout
  $ED71 rotate the transmit byte
  $ED73 if the bit = 1 go set the serial data out high
  $ED75 else set the serial data out low
  $ED78 continue, branch always
  $ED7A set the serial data out high
  $ED7D set the serial clock out high
  $ED80 waste ..
  $ED81 .. a ..
  $ED82 .. cycle ..
  $ED83 .. or two
  $ED84 read VIA 2 DRA, serial port and video address
  $ED87,b mask xx0x xxxx, set the serial data out high
  $ED89,b mask xxx1 xxxx, set the serial clock out low
  $ED8B save VIA 2 DRA, serial port and video address
  $ED8E decrement the serial bus bit count
  $ED90 loop if not all done
N $ED92 now all eight bits have been sent it's up to the peripheral to signal the byte was received by pulling the serial data low. this should be done within one milisecond
  $ED92 wait for up to about 1ms
  $ED94 save VIA 1 timer B high byte
  $ED97 load timer B, timer B single shot, start timer B
  $ED99 save VIA 1 CRB
  $ED9C read VIA 1 ICR
  $ED9F read VIA 1 ICR
  $EDA2,b mask 0000 00x0, timer A interrupt
  $EDA4 if timer A interrupt go do serial bus timeout
  $EDA6 get the serial data status in Cb
  $EDA9 if the serial data is high go wait some more
  $EDAB enable the interrupts
  $EDAC
N $EDAD device not present
  $EDAD error $80, device not present
B $EDAF,1 makes next line BIT $03A9
N $EDB0 timeout on serial bus
  $EDB0 error $03, read timeout, write timeout
  $EDB2 OR into the serial status byte
  $EDB5 enable the interrupts
  $EDB6 clear for branch
  $EDB7 ATN high, delay, clock high then data high, branch always

c $EDB9 send secondary address after LISTEN
  $EDB9 save the defered Tx byte
  $EDBB set the serial clk/data, wait and Tx the byte

c $EDBE set serial ATN high
  $EDBE read VIA 2 DRA, serial port and video address
  $EDC1,b mask xxxx 0xxx, set serial ATN high
  $EDC3 save VIA 2 DRA, serial port and video address
  $EDC6

c $EDC7 send secondary address after TALK
  $EDC7 save the defered Tx byte
  $EDC9 set the serial clk/data, wait and Tx the byte

c $EDCC wait for the serial bus end after send
D $EDCC return address from patch 6
  $EDCC disable the interrupts
  $EDCD set the serial data out low
  $EDD0 set serial ATN high
  $EDD3 set the serial clock out high
  $EDD6 get the serial data status in Cb
  $EDD9 loop if the clock is high
  $EDDB enable the interrupts
  $EDDC

c $EDDD output a byte to the serial bus
  $EDDD test the deferred character flag
  $EDDF if there is a defered character go send it
  $EDE1 set carry
  $EDE2 shift into the deferred character flag
  $EDE4 save the byte and exit, branch always
  $EDE6 save the byte
  $EDE7 Tx byte on serial bus
  $EDEA restore the byte
  $EDEB save the defered Tx byte
  $EDED flag ok
  $EDEE

c $EDEF command serial bus to UNTALK
  $EDEF disable the interrupts
  $EDF0 set the serial clock out low
  $EDF3 read VIA 2 DRA, serial port and video address
  $EDF6,b mask xxxx 1xxx, set the serial ATN low
  $EDF8 save VIA 2 DRA, serial port and video address
  $EDFB set the UNTALK command
B $EDFD,1 makes next line BIT $3FA9

c $EDFE command serial bus to UNLISTEN
  $EDFE set the UNLISTEN command
  $EE00 send a control character
  $EE03 set serial ATN high
N $EE06 1ms delay, clock high then data high
  $EE06 save the device number
  $EE07 short delay
  $EE09 decrement the count
  $EE0A loop if not all done
  $EE0C restore the device number
  $EE0D set the serial clock out high
  $EE10 set the serial data out high and return

c $EE13 input a byte from the serial bus
  $EE13 disable the interrupts
  $EE14 set 0 bits to do, will flag EOI on timeour
  $EE16 save the serial bus bit count
  $EE18 set the serial clock out high
  $EE1B get the serial data status in Cb
  $EE1E loop if the serial clock is low
  $EE20 set the timeout count high byte
  $EE22 save VIA 1 timer B high byte
  $EE25 load timer B, timer B single shot, start timer B
  $EE27 save VIA 1 CRB
  $EE2A set the serial data out high
  $EE2D read VIA 1 ICR
  $EE30 read VIA 1 ICR
  $EE33,b mask 0000 00x0, timer A interrupt
  $EE35 if timer A interrupt go ??
  $EE37 get the serial data status in Cb
  $EE3A loop if the serial clock is low
  $EE3C else go set 8 bits to do, branch always
N $EE3E timer A timed out
  $EE3E get the serial bus bit count
  $EE40 if not already EOI then go flag EOI
  $EE42 else error $02, read timeour
  $EE44 set the serial status and exit
  $EE47 set the serial data out low
  $EE4A set the serial clock out high
  $EE4D set EOI
  $EE4F OR into the serial status byte
  $EE52 increment the serial bus bit count, do error on the next timeout
  $EE54 go try again, branch always
  $EE56 set 8 bits to do
  $EE58 save the serial bus bit count
  $EE5A read VIA 2 DRA, serial port and video address
  $EE5D compare it with itself
  $EE60 if changing go try again
  $EE62 shift the serial data into the carry
  $EE63 loop while the serial clock is low
  $EE65 shift the data bit into the receive byte
  $EE67 read VIA 2 DRA, serial port and video address
  $EE6A compare it with itself
  $EE6D if changing go try again
  $EE6F shift the serial data into the carry
  $EE70 loop while the serial clock is high
  $EE72 decrement the serial bus bit count
  $EE74 loop if not all done
  $EE76 set the serial data out low
  $EE79 test the serial status byte
  $EE7B if EOI not set skip the bus end sequence
  $EE7D 1ms delay, clock high then data high
  $EE80 get the receive byte
  $EE82 enable the interrupts
  $EE83 flag ok
  $EE84

c $EE85 set the serial clock out high
  $EE85 read VIA 2 DRA, serial port and video address
  $EE88,b mask xxx0 xxxx, set serial clock out high
  $EE8A save VIA 2 DRA, serial port and video address
  $EE8D

c $EE8E set the serial clock out low
  $EE8E read VIA 2 DRA, serial port and video address
  $EE91,b mask xxx1 xxxx, set serial clock out low
  $EE93 save VIA 2 DRA, serial port and video address
  $EE96

c $EE97 set the serial data out high
  $EE97 read VIA 2 DRA, serial port and video address
  $EE9A,b mask xx0x xxxx, set serial data out high
  $EE9C save VIA 2 DRA, serial port and video address
  $EE9F

c $EEA0 set the serial data out low
  $EEA0 read VIA 2 DRA, serial port and video address
  $EEA3,b mask xx1x xxxx, set serial data out low
  $EEA5 save VIA 2 DRA, serial port and video address
  $EEA8

c $EEA9 get the serial data status in Cb
  $EEA9 read VIA 2 DRA, serial port and video address
  $EEAC compare it with itself
  $EEAF if changing got try again
  $EEB1 shift the serial data into Cb
  $EEB2

c $EEB3 1ms delay
  $EEB3 save `X`
  $EEB4 set the loop count
  $EEB6 decrement the loop count
  $EEB7 loop if more to do
  $EEB9 restore `X`
  $EEBA

c $EEBB RS232 Tx NMI routine
  $EEBB get RS232 bit count
  $EEBD if zero go setup next RS232 Tx byte and return
  $EEBF if -ve go do stop bit(s)
N $EEC1 else bit count is non zero and +ve
  $EEC1 shift RS232 output byte buffer
  $EEC3 set $00 for bit = 0
  $EEC5 branch if bit was 0
  $EEC7 set $FF for bit = 1
  $EEC8 copy bit to `A`
  $EEC9 EOR with RS232 parity byte
  $EECB save RS232 parity byte
  $EECD decrement RS232 bit count
  $EECF if RS232 bit count now zero go do parity bit
N $EED1 save bit and exit
  $EED1 copy bit to `A`
  $EED2,b mask 0000 0x00, RS232 Tx DATA bit
  $EED4 save the next RS232 data bit to send
  $EED6

c $EED7 do RS232 parity bit
D $EED7 enters with RS232 bit count = 0
  $EED7,b mask 00x0 0000, parity enable bit
  $EED9 test the pseudo 6551 command register
  $EEDC if parity disabled go ??
  $EEDE if fixed mark or space parity go ??
  $EEE0 if even parity go ??
N $EEE2 else odd parity
  $EEE2 get RS232 parity byte
  $EEE4 if parity not zero leave parity bit = 0
  $EEE6 make parity bit = 1
  $EEE7 decrement RS232 bit count, 1 stop bit
  $EEE9 get pseudo 6551 control register
  $EEEC if 1 stop bit save parity bit and exit
N $EEEE else two stop bits ..
  $EEEE decrement RS232 bit count, 2 stop bits
  $EEF0 save bit and exit, branch always
N $EEF2 parity is disabled so the parity bit becomes the first, and possibly only, stop bit. to do this increment the bit count which effectively decrements the stop bit count.
  $EEF2 increment RS232 bit count, = -1 stop bit
  $EEF4 set stop bit = 1 and exit
N $EEF6 do even parity
  $EEF6 get RS232 parity byte
  $EEF8 if parity zero leave parity bit = 0
  $EEFA else make parity bit = 1, branch always
N $EEFC fixed mark or space parity
  $EEFC if fixed space parity leave parity bit = 0
  $EEFE else fixed mark parity make parity bit = 1, branch always
N $EF00 decrement stop bit count, set stop bit = 1 and exit. $FF is one stop bit, $FE is two stop bits
  $EF00 decrement RS232 bit count
  $EF02 set stop bit = 1
  $EF04 save stop bit and exit, branch always

c $EF06 setup next RS232 Tx byte
  $EF06 read the 6551 pseudo command register
  $EF09 handshake bit inot Cb
  $EF0A if 3 line interface go ??
  $EF0C test VIA 2 DRB, RS232 port
  $EF0F if DSR = 0 set DSR signal not present and exit
  $EF11 if CTS = 0 set CTS signal not present and exit
N $EF13 was 3 line interface
  $EF13 clear `A`
  $EF15 clear the RS232 parity byte
  $EF17 clear the RS232 next bit to send
  $EF19 get the number of bits to be sent/received
  $EF1C set the RS232 bit count
  $EF1E get the index to the Tx buffer start
  $EF21 compare it with the index to the Tx buffer end
  $EF24 if all done go disable T?? interrupt and return
  $EF26 else get a byte from the buffer
  $EF28 save it to the RS232 output byte buffer
  $EF2A increment the index to the Tx buffer start
  $EF2D

c $EF2E set DSR signal not present
  $EF2E set DSR signal not present
B $EF30,1 makes next line BIT $10A9

c $EF31 set CTS signal not present
  $EF31 set CTS signal not present
  $EF33 OR it with the RS232 status register
  $EF36 save the RS232 status register

c $EF39 disable timer A interrupt
  $EF39 disable timer A interrupt

c $EF3B set VIA 2 ICR from `A`
  $EF3B save VIA 2 ICR
  $EF3E EOR with the RS-232 interrupt enable byte
  $EF41 set the interrupts enable bit
  $EF43 save the RS-232 interrupt enable byte
  $EF46 save VIA 2 ICR
  $EF49

c $EF4A compute bit count
  $EF4A set bit count to 9, 8 data + 1 stop bit
  $EF4C,b mask for 8/7 data bits
  $EF4E test pseudo 6551 control register
  $EF51 branch if 8 bits
  $EF53 else decrement count for 7 data bits
  $EF54 branch if 7 bits
  $EF56 else decrement count ..
  $EF57 .. for 5 data bits
  $EF58

c $EF59 RS232 Rx NMI
  $EF59 get start bit check flag
  $EF5B if no start bit received go ??
  $EF5D decrement receiver bit count in
  $EF5F if the byte is complete go add it to the buffer
  $EF61
  $EF63 get the RS232 received data bit
  $EF65 EOR with the receiver parity bit
  $EF67 save the receiver parity bit
  $EF69 shift the RS232 received data bit
  $EF6B
  $EF6D
  $EF6E decrement receiver bit count in
  $EF70 get the RS232 received data bit
  $EF72
  $EF74 get pseudo 6551 control register
  $EF77 shift the stop bit flag to Cb
  $EF78 + 1
  $EF7A add receiver bit count in
  $EF7C exit, branch always

c $EF7E setup to receive an RS232 bit
  $EF7E enable FLAG interrupt
  $EF80 save VIA 2 ICR
  $EF83 OR with the RS-232 interrupt enable byte
  $EF86 save the RS-232 interrupt enable byte
  $EF89 set start bit check flag, set no start bit received
  $EF8B disable timer B interrupt
  $EF8D set VIA 2 ICR from `A` and return

c $EF90 no RS232 start bit received
  $EF90 get the RS232 received data bit
  $EF92 if ?? go setup to receive an RS232 bit and return
  $EF94 flag the RS232 start bit and set the parity

c $EF97 received a whole byte, add it to the buffer
  $EF97 get index to Rx buffer end
  $EF9A increment index
  $EF9B compare with index to Rx buffer start
  $EF9E if buffer full go do Rx overrun error
  $EFA0 save index to Rx buffer end
  $EFA3 decrement index
  $EFA4 get assembled byte
  $EFA6 get bit count
  $EFA9 compare with byte + stop
  $EFAB branch if all nine bits received
  $EFAD else shift byte
  $EFAE increment bit count
  $EFAF loop, branch always
  $EFB1 save received byte to Rx buffer
  $EFB3,b mask 00x0 0000, parity enable bit
  $EFB5 test the pseudo 6551 command register
  $EFB8 branch if parity disabled
  $EFBA branch if mark or space parity
  $EFBC get the RS232 received data bit
  $EFBE EOR with the receiver parity bit
  $EFC0
  $EFC2 if ?? just exit
@ $EFC4 ignoreua
B $EFC4,1 makes next line BIT $A650
  $EFC5 if ?? just exit
  $EFC7 set Rx parity error
B $EFC9,1 makes next line BIT $04A9
  $EFCA set Rx overrun error
B $EFCC,1 makes next line BIT $80A9
  $EFCD set Rx break error
B $EFCF,1 makes next line BIT $02A9
  $EFD0 set Rx frame error
  $EFD2 OR it with the RS232 status byte
  $EFD5 save the RS232 status byte
  $EFD8 setup to receive an RS232 bit and return

c $EFDB
  $EFDB
  $EFDD if ?? do frame error
  $EFDF else do break error, branch always

c $EFE1 open RS232 channel for output
  $EFE1 save the output device number
  $EFE3 read the pseudo 6551 command register
  $EFE6 shift handshake bit to carry
  $EFE7 if 3 line interface go ??
  $EFE9,b mask 0000 00x0, RTS out
  $EFEB test VIA 2 DRB, RS232 port
  $EFEE if DSR = 0 set DSR not present and exit
  $EFF0 if RTS = 1 just exit
  $EFF2 get the RS-232 interrupt enable byte
  $EFF5 mask 0000 00x0, timer B interrupt
  $EFF7 loop while the timer B interrupt is enebled
  $EFF9 test VIA 2 DRB, RS232 port
  $EFFC loop while CTS high
  $EFFE read VIA 2 DRB, RS232 port
  $F001,b mask xxxx xx1x, set RTS high
  $F003 save VIA 2 DRB, RS232 port
  $F006 test VIA 2 DRB, RS232 port
  $F009 exit if CTS high
  $F00B loop while DSR high
N $F00D set no DSR and exit
  $F00D set DSR signal not present
  $F00F save the RS232 status register
  $F012 flag ok
  $F013

c $F014 send byte to the RS232 buffer
  $F014 setup for RS232 transmit
N $F017 send byte to the RS232 buffer, no setup
  $F017 get index to Tx buffer end
  $F01A + 1
  $F01B compare with index to Tx buffer start
  $F01E loop while buffer full
  $F020 set index to Tx buffer end
  $F023 index to available buffer byte
  $F024 read the RS232 character buffer
  $F026 save the byte to the buffer

c $F028 setup for RS232 transmit
  $F028 get the RS-232 interrupt enable byte
  $F02B shift the enable bit to Cb
  $F02C if interrupts are enabled just exit
  $F02E start timer A
  $F030 save VIA 2 CRA
  $F033 get the baud rate bit time low byte
  $F036 save VIA 2 timer A low byte
  $F039 get the baud rate bit time high byte
  $F03C save VIA 2 timer A high byte
  $F03F enable timer A interrupt
  $F041 set VIA 2 ICR from `A`
  $F044 setup next RS232 Tx byte
  $F047 load timer A, start timer A
  $F049 save VIA 2 CRA
  $F04C

c $F04D input from RS232 buffer
  $F04D save the input device number
  $F04F get pseudo 6551 command register
  $F052 shift the handshake bit to Cb
  $F053 if 3 line interface go ??
  $F055,b mask the duplex bit, pseudo 6551 command is >> 1
  $F057 if full duplex go ??
  $F059 mask 0000 00x0, RTS out
  $F05B test VIA 2 DRB, RS232 port
  $F05E if DSR = 0 set no DSR and exit
  $F060 if RTS = 0 just exit
  $F062 get the RS-232 interrupt enable byte
  $F065 shift the timer A interrupt enable bit to Cb
  $F066 loop while the timer A interrupt is enabled
  $F068 read VIA 2 DRB, RS232 port
  $F06B,b mask xxxx xx0x, clear RTS out
  $F06D save VIA 2 DRB, RS232 port
  $F070 read VIA 2 DRB, RS232 port
  $F073,b mask xxxx x1xx, DTR in
  $F075 loop while DTR low
  $F077 enable the FLAG interrupt
  $F079 flag ok
  $F07A set VIA 2 ICR from `A` and return
  $F07D get the RS-232 interrupt enable byte
  $F080,b mask 000x 00x0
  $F082 if FLAG or timer B bits set go enable the FLAG interrupt
  $F084 flag ok
  $F085

c $F086 get byte from RS232 buffer
  $F086 get the RS232 status register
  $F089 get index to Rx buffer start
  $F08C compare with index to Rx buffer end
  $F08F return null if buffer empty
  $F091 clear the Rx buffer empty bit
  $F093 save the RS232 status register
  $F096 get byte from Rx buffer
  $F098 increment index to Rx buffer start
  $F09B
  $F09C set the Rx buffer empty bit
  $F09E save the RS232 status register
  $F0A1 return null
  $F0A3

c $F0A4 check RS232 bus idle
  $F0A4 save `A`
  $F0A5 get the RS-232 interrupt enable byte
  $F0A8 if no interrupts enabled just exit
  $F0AA get the RS-232 interrupt enable byte
  $F0AD,b mask 0000 00xx, the error bits
  $F0AF if there are errors loop
  $F0B1 disable FLAG interrupt
  $F0B3 save VIA 2 ICR
  $F0B6 clear `A`
  $F0B8 clear the RS-232 interrupt enable byte
  $F0BB restore `A`
  $F0BC

t $F0BD kernel I/O messages
  $F0BD,12,n1:10:1
  $F0C9,11,n1:9:1
  $F0D4,4,3:1
  $F0D8,19,n1:17:1
  $F0EB,27,26:1
  $F106,8,n1:6:1
  $F10E,8,n1:6:1
  $F116,10,n1:8:1
  $F120,7,n1:5:1
  $F127,4,n1:2:n1

c $F12B display control I/O message if in direct mode
  $F12B test message mode flag
  $F12D exit if control messages off
N $F12F display kernel I/O message
  $F12F get byte from message table
  $F132 save status
  $F133,b clear b7
  $F135 output character to channel
  $F138 increment index
  $F139 restore status
  $F13A loop if not end of message
  $F13C
  $F13D

c $F13E get character from the input device
  $F13E get the input device number
  $F140 if not the keyboard go handle other devices
N $F142 the input device was the keyboard
  $F142 get the keyboard buffer index
  $F144 if the buffer is empty go flag no byte and return
  $F146 disable the interrupts
  $F147 get input from the keyboard buffer and return
N $F14A the input device was not the keyboard
  $F14A compare the device with the RS232 device
  $F14C if not the RS232 device go ??
N $F14E the input device is the RS232 device
  $F14E save `Y`
  $F150 get a byte from RS232 buffer
  $F153 restore `Y`
  $F155 flag no error
  $F156

c $F157 input a character from channel
  $F157 get the input device number
  $F159 if not the keyboard continue
N $F15B the input device was the keyboard
  $F15B get the cursor column
  $F15D set the input cursor column
  $F15F get the cursor row
  $F161 set the input cursor row
  $F163 input from screen or keyboard
N $F166 the input device was not the keyboard
  $F166 compare device number with screen
  $F168 if not screen continue
N $F16A the input device was the screen
  $F16A input from keyboard or screen, $xx = screen, $00 = keyboard
  $F16C get current screen line length
  $F16E save input [EOL] pointer
  $F170 input from screen or keyboard
N $F173 the input device was not the screen
  $F173 if input device > screen go do IEC devices
N $F175 the input device was < screen
  $F175 compare the device with the RS232 device
  $F177 if RS232 device go get a byte from the RS232 device
N $F179 only the tape device left ..
  $F179 save `X`
  $F17B get a byte from tape
  $F17E if error just exit
  $F180 save the byte
  $F181 get the next byte from tape
  $F184 if error just exit
  $F186 if end reached ??
  $F188 set EOI
  $F18A OR into the serial status byte
  $F18D decrement tape buffer index
  $F18F restore `X`
  $F191 restore the saved byte
  $F192
  $F193 copy the error byte
  $F194 dump the saved byte
  $F195 restore error byte
  $F196 restore `X`
  $F198

c $F199 get byte from tape
  $F199 bump tape pointer
  $F19C if not end get next byte and exit
  $F19E initiate tape read
  $F1A1 exit if error flagged
  $F1A3 clear `A`
  $F1A5 clear tape buffer index
  $F1A7 loop, branch always
  $F1A9 get next byte from buffer
  $F1AB flag no error
  $F1AC

c $F1AD input device was serial bus
  $F1AD get the serial status byte
  $F1AF if no errors flagged go input byte and return
  $F1B1 else return [EOL]
  $F1B3 flag no error
  $F1B4
  $F1B5 input byte from serial bus and return

c $F1B8 input device was RS232 device
  $F1B8 get byte from RS232 device
  $F1BB branch if error, this doesn't get taken as the last instruction in the get byte from RS232 device routine is CLC ??
  $F1BD compare with null
  $F1BF exit if not null
  $F1C1 get the RS232 status register
  $F1C4,b mask 0xx0 0000, DSR detected and ??
  $F1C6 if ?? return null
  $F1C8 else loop, branch always

c $F1CA output character to channel
  $F1CA save the character to output
  $F1CB get the output device number
  $F1CD compare the output device with the screen
  $F1CF if not the screen go ??
  $F1D1 else restore the output character
  $F1D2 go output the character to the screen
  $F1D5 if < screen go ??
  $F1D7 else restore the output character
  $F1D8 go output the character to the serial bus
  $F1DB shift b0 of the device into Cb
  $F1DC restore the output character

c $F1DD output the character to the cassette or RS232 device
  $F1DD save the character to the character buffer
  $F1DF copy `X`
  $F1E0 save `X`
  $F1E1 copy `Y`
  $F1E2 save `Y`
  $F1E3 if Cb is clear it must be the RS232 device
N $F1E5 output the character to the cassette
  $F1E5 bump the tape pointer
  $F1E8 if not end save next byte and exit
  $F1EA initiate tape write
  $F1ED exit if error
  $F1EF set data block type ??
  $F1F1 clear index
  $F1F3 save type to buffer ??
  $F1F5 increment index
  $F1F6 save tape buffer index
  $F1F8 restore character from character buffer
  $F1FA save to buffer
  $F1FC flag no error
  $F1FD pull `Y`
  $F1FE restore `Y`
  $F1FF pull `X`
  $F200 restore `X`
  $F201 get the character from the character buffer
  $F203 exit if no error
  $F205 else clear `A`
  $F207
N $F208 output the character to the RS232 device
  $F208 send byte to the RS232 buffer, no setup
  $F20B do no error exit

c $F20E open channel for input
  $F20E find a file
  $F211 if the file is open continue
  $F213 else do 'file not open' error and return
  $F216 set file details from table,X
  $F219 get the device number
  $F21B if the device was the keyboard save the device #, flag ok and exit
  $F21D compare the device number with the screen
  $F21F if the device was the screen save the device #, flag ok and exit
  $F221 if the device was a serial bus device go ??
  $F223 else compare the device with the RS232 device
  $F225 if not the RS232 device continue
  $F227 else go get input from the RS232 buffer and return
  $F22A get the secondary address
  $F22C
  $F22E
  $F230 go do 'not input file' error and return
  $F233 save the input device number
  $F235 flag ok
  $F236
N $F237 the device was a serial bus device
  $F237 copy device number to `X`
  $F238 command serial bus device to TALK
  $F23B get the secondary address
  $F23D
  $F23F wait for the serial bus end after send
  $F242
  $F245 send secondary address after TALK
  $F248 copy device back to `A`
  $F249 test the serial status byte
  $F24B if device present save device number and exit
  $F24D do 'device not present' error and return

c $F250 open channel for output
  $F250 find a file
  $F253 if file found continue
  $F255 else do 'file not open' error and return
  $F258 set file details from table,X
  $F25B get the device number
  $F25D if the device is not the keyboard go ??
  $F25F go do 'not output file' error and return
  $F262 compare the device with the screen
  $F264 if the device is the screen go save output the output device number and exit
  $F266 if > screen then go handle a serial bus device
  $F268 compare the device with the RS232 device
  $F26A if not the RS232 device then it must be the tape device
  $F26C else go open RS232 channel for output
N $F26F open a tape channel for output
  $F26F get the secondary address
  $F271
  $F273 if ?? do not output file error and return
  $F275 save the output device number
  $F277 flag ok
  $F278
  $F279 copy the device number
  $F27A command devices on the serial bus to LISTEN
  $F27D get the secondary address
  $F27F if address to send go ??
  $F281 else set serial ATN high
  $F284 go ??, branch always
  $F286 send secondary address after LISTEN
  $F289 copy device number back to `A`
  $F28A test the serial status byte
  $F28C if the device is present go save the output device number and exit
  $F28E else do 'device not present error' and return

c $F291 close a specified logical file
  $F291 find file `A`
  $F294 if file found go close it
  $F296 else the file was closed so just flag ok
  $F297
N $F298 file found so close it
  $F298 set file details from table,X
  $F29B copy file index to `A`
  $F29C save file index
  $F29D get the device number
  $F29F if it is the keyboard go restore the index and close the file
  $F2A1 compare the device number with the screen
  $F2A3 if it is the screen go restore the index and close the file
  $F2A5 if > screen go do serial bus device close
  $F2A7 compare the device with the RS232 device
  $F2A9 if not the RS232 device go ??
N $F2AB else close RS232 device
  $F2AB restore file index
  $F2AC close file index `X`
  $F2AF initialise RS232 output
  $F2B2 read the top of memory
  $F2B5 get the RS232 input buffer pointer high byte
  $F2B7 if no RS232 input buffer go ??
  $F2B9 else reclaim RS232 input buffer memory
  $F2BA get the RS232 output buffer pointer high byte
  $F2BC if no RS232 output buffer skip the reclaim
  $F2BE else reclaim the RS232 output buffer memory
  $F2BF clear `A`
  $F2C1 clear the RS232 input buffer pointer high byte
  $F2C3 clear the RS232 output buffer pointer high byte
  $F2C5 go set the top of memory to F0xx
N $F2C8 is not the RS232 device
  $F2C8 get the secondary address
  $F2CA,b mask the device #
  $F2CC if ?? restore index and close file
  $F2CE get tape buffer start pointer in `XY`
  $F2D1 character $00
  $F2D3 flag the tape device
  $F2D4 output the character to the cassette or RS232 device
  $F2D7 initiate tape write
  $F2DA
  $F2DC
  $F2DD
  $F2DF
  $F2E0 get the secondary address
  $F2E2
  $F2E4 if not ?? restore index and close file
  $F2E6 set logical end of the tape
  $F2E8 write tape header
  $F2EB restore index and close file

c $F2EE serial bus device close
  $F2EE close serial bus device
  $F2F1 restore file index

c $F2F2 close file index `X`
  $F2F2 copy index to file to close
  $F2F3 decrement the open file count
  $F2F5 compare the index with the open file count
  $F2F7 exit if equal, last entry was closing file
N $F2F9 else entry was not last in list so copy last table entry file details over the details of the closing one
  $F2F9 get the open file count as index
  $F2FB get last+1 logical file number from logical file table
  $F2FE save logical file number over closed file
  $F301 get last+1 device number from device number table
  $F304 save device number over closed file
  $F307 get last+1 secondary address from secondary address table
  $F30A save secondary address over closed file
  $F30D flag ok
  $F30E

c $F30F find a file
  $F30F clear `A`
  $F311 clear the serial status byte
  $F313 copy the logical file number to `A`

c $F314 find file `A`
  $F314 get the open file count
  $F316 decrememnt the count to give the index
  $F317 if no files just exit
  $F319 compare the logical file number with the table logical file number
  $F31C if no match go try again
  $F31E

c $F31F set file details from table,X
  $F31F get logical file from logical file table
  $F322 save the logical file
  $F324 get device number from device number table
  $F327 save the device number
  $F329 get secondary address from secondary address table
  $F32C save the secondary address
  $F32E

c $F32F close all channels and files
  $F32F clear `A`
  $F331 clear the open file count

c $F333 close input and output channels
  $F333 set the screen device
  $F335 compare the screen with the output device number
  $F337 if <= screen skip the serial bus unlisten
  $F339 else command the serial bus to UNLISTEN
  $F33C compare the screen with the input device number
  $F33E if <= screen skip the serial bus untalk
  $F340 else command the serial bus to UNTALK
  $F343 save the screen as the output device number
  $F345 set the keyboard as the input device
  $F347 save the input device number
  $F349

c $F34A open a logical file
  $F34A get the logical file
  $F34C if there is a file continue
  $F34E else do 'not input file error' and return
  $F351 find a file
  $F354 if file not found continue
  $F356 else do 'file already open' error and return
  $F359 get the open file count
  $F35B compare it with the maximum + 1
  $F35D if less than maximum + 1 go open the file
  $F35F else do 'too many files error' and return
  $F362 increment the open file count
  $F364 get the logical file
  $F366 save it to the logical file table
  $F369 get the secondary address
  $F36B OR with the OPEN CHANNEL command
  $F36D save the secondary address
  $F36F save it to the secondary address table
  $F372 get the device number
  $F374 save it to the device number table
  $F377 if it is the keyboard go do the ok exit
  $F379 compare the device number with the screen
  $F37B if it is the screen go do the ok exit
  $F37D if tape or RS232 device go ??
N $F37F else it is a serial bus device
  $F37F send the secondary address and filename
  $F382 go do ok exit, branch always
  $F384
  $F386
  $F388 go open RS232 device and return
  $F38B get tape buffer start pointer in `XY`
  $F38E if >= $0200 go ??
  $F390 else do 'illegal device number' and return
  $F393 get the secondary address
  $F395
  $F397
  $F399 wait for PLAY
  $F39C exit if STOP was pressed
  $F39E print "Searching..."
  $F3A1 get file name length
  $F3A3 if null file name just go find header
  $F3A5 find specific tape header
  $F3A8 branch if no error
  $F3AA exit if ??
  $F3AC do file not found error and return
  $F3AF find tape header, exit with header in buffer
  $F3B2 exit if end of tape found
  $F3B4
  $F3B6
  $F3B8 wait for PLAY/RECORD
  $F3BB exit if STOP was pressed
  $F3BD set data file header
  $F3BF write tape header
  $F3C2
  $F3C4 get the secondary address
  $F3C6
  $F3C8
  $F3CA clear index
  $F3CC
  $F3CE save to tape buffer
  $F3D0 clear `A`
  $F3D1 save tape buffer index
  $F3D3 flag ok
  $F3D4

c $F3D5 send secondary address and filename
  $F3D5 get the secondary address
  $F3D7 ok exit if -ve
  $F3D9 get file name length
  $F3DB ok exit if null
  $F3DD clear `A`
  $F3DF clear the serial status byte
  $F3E1 get the device number
  $F3E3 command devices on the serial bus to LISTEN
  $F3E6 get the secondary address
  $F3E8 OR with the OPEN command
  $F3EA send secondary address after LISTEN
  $F3ED get the serial status byte
  $F3EF if device present skip the 'device not present' error
  $F3F1 else dump calling address low byte
  $F3F2 dump calling address high byte
  $F3F3 do 'device not present' error and return
  $F3F6 get file name length
  $F3F8 branch if null name
  $F3FA clear index
  $F3FC get file name byte
  $F3FE output byte to serial bus
  $F401 increment index
  $F402 compare with file name length
  $F404 loop if not all done
  $F406 command serial bus to UNLISTEN and return

c $F409 open RS232 device
  $F409 initialise RS232 output
  $F40C save the RS232 status register
  $F40F compare with file name length
  $F411 exit loop if done
  $F413 get file name byte
  $F415 copy to 6551 register set
  $F418 increment index
  $F419 compare with $04
  $F41B loop if not to 4 yet
  $F41D compute bit count
  $F420 save bit count
  $F423 get pseudo 6551 control register
  $F426,b mask 0000 xxxx, baud rate
  $F428 if zero skip the baud rate setup
  $F42A * 2 bytes per entry
  $F42B copy to the index
  $F42C get the PAL/NTSC flag
  $F42F if PAL go set PAL timing
@ $F431 nowarn
  $F431 get the NTSC baud rate value high byte
@ $F434 nowarn
  $F434 get the NTSC baud rate value low byte
  $F437 go save the baud rate values
  $F43A get the PAL baud rate value high byte
  $F43D get the PAL baud rate value low byte
  $F440 save the nonstandard bit timing high byte
  $F443 save the nonstandard bit timing low byte
  $F446 get the nonstandard bit timing low byte
  $F449 * 2
  $F44A
  $F44D read the pseudo 6551 command register
  $F450 shift the `X` line/3 line bit into Cb
  $F451 if 3 line skip the DRS test
  $F453 read VIA 2 DRB, RS232 port
  $F456 shift DSR in into Cb
  $F457 if DSR present skip the error set
  $F459 set no DSR
  $F45C get index to Rx buffer end
  $F45F set index to Rx buffer start, clear Rx buffer
  $F462 get index to Tx buffer end
  $F465 set index to Tx buffer start, clear Tx buffer
  $F468 read the top of memory
  $F46B get the RS232 input buffer pointer high byte
  $F46D if buffer already set skip the save
  $F46F decrement top of memory high byte, 256 byte buffer
  $F470 save the RS232 input buffer pointer high byte
  $F472 save the RS232 input buffer pointer low byte
  $F474 get the RS232 output buffer pointer high byte
  $F476 if ?? go set the top of memory to F0xx
  $F478
  $F479 save the RS232 output buffer pointer high byte
  $F47B save the RS232 output buffer pointer low byte

c $F47D set the top of memory to F0xx
  $F47D read the top of memory
@ $F47E ignoreua
  $F47E set $F000
  $F480 set the top of memory and return

c $F483 initialise RS232 output
  $F483 disable all interrupts
  $F485 save VIA 2 ICR
  $F488 set RS232 DTR output, RS232 RTS output
  $F48A save VIA 2 DDRB, RS232 port
  $F48D save VIA 2 DRB, RS232 port
  $F490,b mask xxxx x1xx, set RS232 Tx DATA high
  $F492 OR it with VIA 2 DRA, serial port and video address
  $F495 save VIA 2 DRA, serial port and video address
  $F498 clear `Y`
  $F49A clear the RS-232 interrupt enable byte
  $F49D

c $F49E load RAM from a device
  $F49E set kernal setup pointer low byte
  $F4A0 set kernal setup pointer high byte
  $F4A2 do LOAD vector, usually points to #R$F4A5

c $F4A5 load
  $F4A5 save load/verify flag
  $F4A7 clear `A`
  $F4A9 clear the serial status byte
  $F4AB get the device number
  $F4AD if not the keyboard continue
N $F4AF do 'illegal device number'
  $F4AF else do 'illegal device number' and return
  $F4B2
  $F4B4
  $F4B6
  $F4B8 get file name length
  $F4BA if not null name go ??
  $F4BC else do 'missing file name' error and return
  $F4BF get the secondary address
  $F4C1 print "Searching..."
  $F4C4
  $F4C6 save the secondary address
  $F4C8 send secondary address and filename
  $F4CB get the device number
  $F4CD command serial bus device to TALK
  $F4D0 get the secondary address
  $F4D2 send secondary address after TALK
  $F4D5 input byte from serial bus
  $F4D8 save program start address low byte
  $F4DA get the serial status byte
  $F4DC shift time out read ..
  $F4DD .. into carry bit
  $F4DE if timed out go do file not found error and return
  $F4E0 input byte from serial bus
  $F4E3 save program start address high byte
  $F4E5 copy secondary address
  $F4E6 load location not set in LOAD call, so continue with the load
  $F4E8 get the load address low byte
  $F4EA save the program start address low byte
  $F4EC get the load address high byte
  $F4EE save the program start address high byte
  $F4F0
  $F4F3,b mask xxxx xx0x, clear time out read bit
  $F4F5 mask the serial status byte
  $F4F7 set the serial status byte
  $F4F9 scan stop key, return Zb = 1 = [STOP]
  $F4FC if not [STOP] go ??
  $F4FE else close the serial bus device and flag stop
  $F501 input byte from serial bus
  $F504 copy byte
  $F505 get the serial status byte
  $F507 shift time out read ..
  $F508 .. into carry bit
  $F509 if timed out go try again
  $F50B copy received byte back
  $F50C get load/verify flag
  $F50E if load go load
N $F510 else is verify
  $F510 clear index
  $F512 compare byte with previously loaded byte
  $F514 if match go ??
  $F516 flag read error
  $F518 OR into the serial status byte
@ $F51B ignoreua
B $F51B,1 makes next line BIT $AE91
  $F51C save byte to memory
  $F51E increment save pointer low byte
  $F520 if no rollover go ??
  $F522 else increment save pointer high byte
  $F524 test the serial status byte
  $F526 loop if not end of file
N $F528 close file and exit
  $F528 command serial bus to UNTALK
  $F52B close serial bus device
  $F52E if ?? go flag ok and exit
  $F530 do file not found error and return

c $F533 ??
  $F533
  $F534
  $F536 else do 'illegal device number' and return
  $F539 get tape buffer start pointer in `XY`
  $F53C if ??
  $F53E else do 'illegal device number' and return
  $F541 wait for PLAY
  $F544 exit if STOP was pressed
  $F546 print "Searching..."
  $F549 get file name length
  $F54B
  $F54D find specific tape header
  $F550 if no error continue
  $F552 exit if ??
  $F554 , branch always
  $F556 find tape header, exit with header in buffer
  $F559 exit if ??
  $F55B
  $F55D get the serial status byte
  $F55F,b mask 000x 0000, read error
  $F561 flag fail
  $F562 if read error just exit
  $F564
  $F566
  $F568
  $F56A
  $F56C
  $F56E
  $F570
  $F572
  $F573
  $F575
  $F577
  $F579 get the secondary address
  $F57B
  $F57D
  $F57F
  $F581
  $F583
  $F585
  $F586
  $F588
  $F58A
  $F58C
  $F58E
  $F58F
  $F590
  $F591
  $F593
  $F595
  $F596
  $F598
  $F59A
  $F59C set I/O start addresses low byte
  $F59E
  $F5A0 set I/O start addresses high byte
  $F5A2 display "LOADING" or "VERIFYING"
  $F5A5 do the tape read
B $F5A8,1 makes next line BIT $18, keep the error flag in Cb
  $F5A9 flag ok
  $F5AA get the LOAD end pointer low byte
  $F5AC get the LOAD end pointer high byte
  $F5AE

c $F5AF print "Searching..."
  $F5AF get message mode flag
  $F5B1 exit if control messages off
  $F5B3 index to "SEARCHING "
  $F5B5 display kernel I/O message
  $F5B8 get file name length
  $F5BA exit if null name
  $F5BC else index to "FOR "
  $F5BE display kernel I/O message

c $F5C1 print file name
  $F5C1 get file name length
  $F5C3 exit if null file name
  $F5C5 clear index
  $F5C7 get file name byte
  $F5C9 output character to channel
  $F5CC increment index
  $F5CD compare with file name length
  $F5CF loop if more to do
  $F5D1

c $F5D2 display "LOADING" or "VERIFYING"
  $F5D2 point to "LOADING"
  $F5D4 get load/verify flag
  $F5D6 branch if load
  $F5D8 point to "VERIFYING"
  $F5DA display kernel I/O message if in direct mode and return

c $F5DD save RAM to device
D $F5DD `A` = index to start address, `XY` = end address low/high
  $F5DD save end address low byte
  $F5DF save end address high byte
  $F5E1 copy index to start pointer
  $F5E2 get start address low byte
  $F5E4 set I/O start addresses low byte
  $F5E6 get start address high byte
  $F5E8 set I/O start addresses high byte
  $F5EA go save, usually points to #R$F5ED

c $F5ED save
  $F5ED get the device number
  $F5EF if not keyboard go ??
N $F5F1 else ..
  $F5F1 else do 'illegal device number' and return
  $F5F4 compare device number with screen
  $F5F6 if screen do illegal device number and return
  $F5F8 branch if < screen
N $F5FA is greater than screen so is serial bus
  $F5FA set secondary address to $01
N $F5FC when a secondary address is to be sent to a device on the serial bus the address must first be ORed with $60
  $F5FC save the secondary address
  $F5FE get the file name length
  $F600 if filename not null continue
  $F602 else do 'missing file name' error and return
  $F605 send secondary address and filename
  $F608 print saving <file name>
  $F60B get the device number
  $F60D command devices on the serial bus to LISTEN
  $F610 get the secondary address
  $F612 send secondary address after LISTEN
  $F615 clear index
  $F617 copy I/O start address to buffer address
  $F61A get buffer address low byte
  $F61C output byte to serial bus
  $F61F get buffer address high byte
  $F621 output byte to serial bus
  $F624 check read/write pointer, return Cb = 1 if pointer >= end
  $F627 go do UNLISTEN if at end
  $F629 get byte from buffer
  $F62B output byte to serial bus
  $F62E scan stop key
  $F631 if stop not pressed go increment pointer and loop for next
N $F633 else .. close the serial bus device and flag stop
  $F633 close serial bus device
  $F636
  $F638 flag stop
  $F639
  $F63A increment read/write pointer
  $F63D loop, branch always
  $F63F command serial bus to UNLISTEN
N $F642 close serial bus device
  $F642 test the secondary address
  $F644 if already closed just exit
  $F646 get the device number
  $F648 command devices on the serial bus to LISTEN
  $F64B get the secondary address
  $F64D,b mask the channel number
  $F64F,b OR with the CLOSE command
  $F651 send secondary address after LISTEN
  $F654 command serial bus to UNLISTEN
  $F657 flag ok
  $F658
  $F659
  $F65A if not RS232 device ??
  $F65C else do 'illegal device number' and return
  $F65F get tape buffer start pointer in `XY`
  $F662 if < $0200 do illegal device number and return
  $F664 wait for PLAY/RECORD
  $F667 exit if STOP was pressed
  $F669 print saving <file name>
  $F66C set header for a non relocatable program file
  $F66E get the secondary address
  $F670,b mask non relocatable bit
  $F672 if non relocatable program go ??
  $F674 else set header for a relocatable program file
  $F676 copy header type to `A`
  $F677 write tape header
  $F67A exit if error
  $F67C do tape write, 20 cycle count
  $F67F exit if error
  $F681 get the secondary address
  $F683,b mask end of tape flag
  $F685 if not end of tape go ??
  $F687 else set logical end of the tape
  $F689 write tape header
B $F68C,1 makes next line BIT $18 so Cb is not changed
  $F68D flag ok
  $F68E

c $F68F print saving <file name>
  $F68F get message mode flag
  $F691 exit if control messages off
  $F693 index to "SAVING "
  $F695 display kernel I/O message
  $F698 print file name and return

c $F69B increment the real time clock
  $F69B clear `X`
  $F69D increment the jiffy clock low byte
  $F69F if no rollover ??
  $F6A1 increment the jiffy clock mid byte
  $F6A3 branch if no rollover
  $F6A5 increment the jiffy clock high byte
N $F6A7 now subtract a days worth of jiffies from current count and remember only the Cb result
  $F6A7 set carry for subtract
  $F6A8 get the jiffy clock low byte
  $F6AA subtract $4F1A01 low byte
  $F6AC get the jiffy clock mid byte
  $F6AE subtract $4F1A01 mid byte
  $F6B0 get the jiffy clock high byte
  $F6B2 subtract $4F1A01 high byte
  $F6B4 if less than $4F1A01 jiffies skip the clock reset
N $F6B6 else ..
  $F6B6 clear the jiffy clock high byte
  $F6B8 clear the jiffy clock mid byte
  $F6BA clear the jiffy clock low byte
N $F6BC this is wrong, there are $4F1A00 jiffies in a day so the reset to zero should occur when the value reaches $4F1A00 and not $4F1A01. this would give an extra jiffy every day and a possible TI value of 24:00:00
  $F6BC read VIA 1 DRB, keyboard row port
  $F6BF compare it with itself
  $F6C2 loop if changing
  $F6C4
  $F6C5
  $F6C7 set c6
  $F6C9 save VIA 1 DRA, keyboard column drive
  $F6CC read VIA 1 DRB, keyboard row port
  $F6CF compare it with itself
  $F6D2 loop if changing
  $F6D4 save VIA 1 DRA, keyboard column drive
  $F6D7
  $F6D8
  $F6DA save the stop key column
  $F6DC

c $F6DD read the real time clock
  $F6DD disable the interrupts
  $F6DE get the jiffy clock low byte
  $F6E0 get the jiffy clock mid byte
  $F6E2 get the jiffy clock high byte

c $F6E4 set the real time clock
  $F6E4 disable the interrupts
  $F6E5 save the jiffy clock low byte
  $F6E7 save the jiffy clock mid byte
  $F6E9 save the jiffy clock high byte
  $F6EB enable the interrupts
  $F6EC

c $F6ED scan the stop key
D $F6ED return Zb = 1 = [STOP]
  $F6ED read the stop key column
  $F6EF compare with [STP] down
  $F6F1 if not [STP] or not just [STP] exit
N $F6F3 just [STP] was pressed
  $F6F3 save status
  $F6F4 close input and output channels
  $F6F7 save the keyboard buffer index
  $F6F9 restore status
  $F6FA

c $F6FB file error messages
  $F6FB 'too many files' error
B $F6FD,1 makes next line BIT $02A9
  $F6FE 'file already open' error
B $F700,1 makes next line BIT $03A9
  $F701 'file not open' error
B $F703,1 makes next line BIT $04A9
  $F704 'file not found' error
B $F706,1 makes next line BIT $05A9
  $F707 'device not present' error
B $F709,1 makes next line BIT $06A9
  $F70A 'not input file' error
B $F70C,1 makes next line BIT $07A9
  $F70D 'not output file' error
B $F70F,1 makes next line BIT $08A9
  $F710 'missing file name' error
B $F712,1 makes next line BIT $09A9
  $F713 do 'illegal device number'
  $F715 save the error #
  $F716 close input and output channels
  $F719 index to "I/O ERROR #"
  $F71B test message mode flag
  $F71D exit if kernal messages off
  $F71F display kernel I/O message
  $F722 restore error #
  $F723 copy error #
  $F724,c convert to ASCII
  $F726 output character to channel
  $F729 pull error number
  $F72A flag error
  $F72B

c $F72C find the tape header, exit with header in buffer
  $F72C get load/verify flag
  $F72E save load/verify flag
  $F72F initiate tape read
  $F732 restore load/verify flag
  $F733 save load/verify flag
  $F735 exit if error
  $F737 clear the index
  $F739 read first byte from tape buffer
  $F73B compare with logical end of the tape
  $F73D if end of the tape exit
  $F73F compare with header for a relocatable program file
  $F741 if program file header go ??
  $F743 compare with header for a non relocatable program file
  $F745 if program file header go ??
  $F747 compare with data file header
  $F749 if data file loop to find the tape header
N $F74B was a program file header
  $F74B copy header type
  $F74C get message mode flag
  $F74E exit if control messages off
  $F750 index to "FOUND "
  $F752 display kernel I/O message
  $F755 index to the tape filename
  $F757 get byte from tape buffer
  $F759 output character to channel
  $F75C increment the index
  $F75D compare it with end+1
  $F75F loop if more to do
  $F761 get the jiffy clock mid byte
  $F763 wait ~8.5 seconds for any key from the STOP key column
  $F766 waste cycles
  $F767 flag no error
  $F768 decrement the index
  $F769

c $F76A write the tape header
  $F76A save header type
  $F76C get tape buffer start pointer in `XY`
  $F76F if < $0200 just exit ??
  $F771 get I/O start address high byte
  $F773 save it
  $F774 get I/O start address low byte
  $F776 save it
  $F777 get tape end address high byte
  $F779 save it
  $F77A get tape end address low byte
  $F77C save it
  $F77D index to header end
  $F77F,c clear byte, [SPACE]
  $F781 clear header byte
  $F783 decrement index
  $F784 loop if more to do
  $F786 get the header type back
  $F788 write it to header
  $F78A increment the index
  $F78B get the I/O start address low byte
  $F78D write it to header
  $F78F increment the index
  $F790 get the I/O start address high byte
  $F792 write it to header
  $F794 increment the index
  $F795 get the tape end address low byte
  $F797 write it to header
  $F799 increment the index
  $F79A get the tape end address high byte
  $F79C write it to header
  $F79E increment the index
  $F79F save the index
  $F7A1 clear `Y`
  $F7A3 clear the name index
  $F7A5 get name index
  $F7A7 compare with file name length
  $F7A9 if all done exit the loop
  $F7AB get file name byte
  $F7AD get buffer index
  $F7AF save file name byte to buffer
  $F7B1 increment file name index
  $F7B3 increment tape buffer index
  $F7B5 loop, branch always
  $F7B7 set tape buffer start and end pointers
  $F7BA set write lead cycle count
  $F7BC save write lead cycle count
  $F7BE do tape write, no cycle count set
  $F7C1
  $F7C2 pull tape end address low byte
  $F7C3 restore it
  $F7C5 pull tape end address high byte
  $F7C6 restore it
  $F7C8 pull I/O start addresses low byte
  $F7C9 restore it
  $F7CB pull I/O start addresses high byte
  $F7CC restore it
  $F7CE
  $F7CF

c $F7D0 get the tape buffer start pointer
  $F7D0 get tape buffer start pointer low byte
  $F7D2 get tape buffer start pointer high byte
  $F7D4 compare high byte with $02xx
  $F7D6

c $F7D7 set the tape buffer start and end pointers
  $F7D7 get tape buffer start pointer in `XY`
  $F7DA copy tape buffer start pointer low byte
  $F7DB save as I/O address pointer low byte
  $F7DD clear carry for add
  $F7DE add buffer length low byte
  $F7E0 save tape buffer end pointer low byte
  $F7E2 copy tape buffer start pointer high byte
  $F7E3 save as I/O address pointer high byte
  $F7E5 add buffer length high byte
  $F7E7 save tape buffer end pointer high byte
  $F7E9

c $F7EA find specific tape header
  $F7EA find tape header, exit with header in buffer
  $F7ED just exit if error
  $F7EF index to name
  $F7F1 save as tape buffer index
  $F7F3 clear `Y`
  $F7F5 save as name buffer index
  $F7F7 compare with file name length
  $F7F9 ok exit if match
  $F7FB get file name byte
  $F7FD get index to tape buffer
  $F7FF compare with tape header name byte
  $F801 if no match go get next header
  $F803 else increment name buffer index
  $F805 increment tape buffer index
  $F807 get name buffer index
  $F809 loop, branch always
  $F80B flag ok
  $F80C

c $F80D bump tape pointer
  $F80D get tape buffer start pointer in `XY`
  $F810 increment tape buffer index
  $F812 get tape buffer index
  $F814 compare with buffer length
  $F816

c $F817 wait for PLAY
  $F817 return cassette sense in Zb
  $F81A if switch closed just exit
N $F81C cassette switch was open
  $F81C index to "PRESS PLAY ON TAPE"
  $F81E display kernel I/O message
  $F821 scan stop key and flag abort if pressed
N $F824 note if STOP was pressed the return is to the routine that called this one and not here
  $F824 return cassette sense in Zb
  $F827 loop if the cassette switch is open
  $F829 index to "OK"
  $F82B display kernel I/O message and return

c $F82E return cassette sense in Zb
  $F82E,b set the mask for the cassette switch
  $F830 test the 6510 I/O port
  $F832 branch if cassette sense high
  $F834 test the 6510 I/O port
  $F836
  $F837

c $F838 wait for PLAY/RECORD
  $F838 return the cassette sense in Zb
  $F83B exit if switch closed
N $F83D cassette switch was open
  $F83D index to "PRESS RECORD & PLAY ON TAPE"
  $F83F display message and wait for switch, branch always

c $F841 initiate a tape read
  $F841 clear `A`
  $F843 clear serial status byte
  $F845 clear the load/verify flag
  $F847 set the tape buffer start and end pointers
  $F84A wait for PLAY
  $F84D exit if STOP was pressed, uses a further BCS at the target address to reach final target at #R$F8DC
  $F84F disable interrupts
  $F850 clear `A`
  $F852
  $F854
  $F856 clear tape timing constant min byte
  $F858 clear tape pass 1 error log/char buffer
  $F85A clear tape pass 2 error log corrected
  $F85C clear byte received flag
  $F85E enable CA1 interrupt ??
  $F860 set index for tape read vector
  $F862 go do tape read/write, branch always

c $F864 initiate a tape write
  $F864 set tape buffer start and end pointers
N $F867 do tape write, 20 cycle count
  $F867 set write lead cycle count
  $F869 save write lead cycle count
N $F86B do tape write, no cycle count set
  $F86B wait for PLAY/RECORD
  $F86E if STOPped clear save IRQ address and exit
  $F870 disable interrupts
  $F871 enable ?? interrupt
  $F873 set index for tape write tape leader vector

c $F875 tape read/write
  $F875 disable all interrupts
  $F877 save VIA 1 ICR, disable all interrupts
  $F87A save VIA 1 ICR, enable interrupts according to `A`
N $F87D check RS232 bus idle
  $F87D read VIA 1 CRA
  $F880 load timer B, timer B single shot, start timer B
  $F882 save VIA 1 CRB
  $F885,b mask x00x 000x, TOD clock, load timer `A`, start timer `A`
  $F887 save VIA 1 CRB shadow copy
  $F88A
  $F88D read the vertical fine scroll and control register
  $F890,b mask xxx0 xxxx, blank the screen
  $F892 save the vertical fine scroll and control register
  $F895 get IRQ vector low byte
  $F898 save IRQ vector low byte
  $F89B get IRQ vector high byte
  $F89E save IRQ vector high byte
  $F8A1 set the tape vector
  $F8A4 set copies count. the first copy is the load copy, the
N $F8A6 second copy is the verify copy
  $F8A6 save copies count
  $F8A8 new tape byte setup
  $F8AB read the 6510 I/O port
  $F8AD,b mask 000x xxxx, cassette motor on ??
  $F8AF save the 6510 I/O port
  $F8B1 set the tape motor interlock
N $F8B3 326656 cycle delay, allow tape motor speed to stabilise
  $F8B3 outer loop count
  $F8B5 inner loop count
  $F8B7 decrement inner loop count
  $F8B8 loop if more to do
  $F8BA decrement outer loop count
  $F8BB loop if more to do
  $F8BD enable tape interrupts
  $F8BE get saved IRQ high byte
  $F8C1 compare with the current IRQ high byte
  $F8C4 flag ok
  $F8C5 if tape write done go clear saved IRQ address and exit
  $F8C7 scan stop key and flag abort if pressed
N $F8CA note if STOP was pressed the return is to the routine that called this one and not here
  $F8CA increment real time clock
  $F8CD loop

c $F8D0 scan stop key and flag abort if pressed
  $F8D0 scan stop key
  $F8D3 flag no stop
  $F8D4 exit if no stop
  $F8D6 restore everything for STOP
  $F8D9 flag stopped
  $F8DA dump return address low byte
  $F8DB dump return address high byte

c $F8DC clear saved IRQ address
  $F8DC clear `A`
  $F8DE clear saved IRQ address high byte
  $F8E1

c $F8E2 set timing
  $F8E2 save tape timing constant max byte
  $F8E4 get tape timing constant min byte
  $F8E6 *2
  $F8E7 *4
  $F8E8 clear carry for add
  $F8E9 add tape timing constant min byte *5
  $F8EB clear carry for add
  $F8EC add tape timing constant max byte
  $F8EE save tape timing constant max byte
  $F8F0
  $F8F2 test tape timing constant min byte
  $F8F4 branch if b7 set
  $F8F6 else shift carry into ??
  $F8F7 shift tape timing constant max byte
  $F8F9
  $F8FA shift tape timing constant max byte
  $F8FC
  $F8FD
  $F8FE get VIA 1 timer B low byte
  $F901 compare with ??
  $F903 loop if less
  $F905 add tape timing constant max byte
  $F907 save VIA 1 timer A low byte
  $F90A
  $F90B add VIA 1 timer B high byte
  $F90E save VIA 1 timer A high byte
  $F911 read VIA 1 CRB shadow copy
  $F914 save VIA 1 CRA
  $F917 save VIA 1 CRA shadow copy
  $F91A read VIA 1 ICR
  $F91D,b mask 000x 0000, FLAG interrupt
  $F91F if no FLAG interrupt just exit
N $F921 else first call the IRQ routine
  $F921 set the return address high byte
  $F923 push the return address high byte
  $F924 set the return address low byte
  $F926 push the return address low byte
  $F927 save the status and do the IRQ routine
  $F92A enable interrupts
  $F92B

c $F92C read tape bits, IRQ routine
D $F92C On Commodore computers, the streams consist of four kinds of symbols that denote different kinds of low-to-high-to-low transitions on the read or write signals of the Commodore cassette interface.
D $F92C #LIST
. { A break in the communications, or a pulse with very long cycle time. }
. { A short pulse, whose cycle time typically ranges from 296 to 424
. microseconds, depending on the computer model. }
. { A medium-length pulse, whose cycle time typically ranges from 440 to 576
. microseconds, depending on the computer model. }
. { A long pulse, whose cycle time typically ranges from 600 to 744
. microseconds, depending on the computer model. }
. LIST#
D $F92C The actual interpretation of the serial data takes a little more work to explain. The typical ROM tape loader (and the turbo loaders) will initialize a timer with a specified value and start it counting down. If either the tape data changes or the timer runs out, an IRQ will occur. The loader will determine which condition caused the IRQ. If the tape data changed before the timer ran out, we have a short pulse, or a "0" bit. If the timer ran out first, we have a long pulse, or a "1" bit. Doing this continuously and we decode the entire file.
N $F92C read T2C which has been counting down from $FFFF. subtract this from $FFFF
  $F92C read VIA 1 timer B high byte
  $F92F set $FF
  $F931 `A` = $FF
  $F932 subtract VIA 1 timer B low byte
  $F935 compare it with VIA 1 timer B high byte
  $F938 if timer low byte rolled over loop
  $F93A save tape timing constant max byte
  $F93C copy $FF - T2C_l
  $F93D save VIA 1 timer B low byte
  $F940 save VIA 1 timer B high byte
  $F943 load timer B, timer B single shot, start timer B
  $F945 save VIA 1 CRB
  $F948 read VIA 1 ICR
  $F94B save VIA 1 ICR shadow copy
  $F94E `Y` = $FF
  $F94F subtract tape timing constant max byte
N $F951 `A` = $FF - T2C_h
  $F951 save tape timing constant max byte
N $F953 $B1 = $FF - T2C_l
  $F953 `A` = $FF - T2C_h >> 1
  $F954 shift tape timing constant max byte
N $F956 $B1 = $FF - T2C_l >> 1
  $F956 `A` = $FF - T2C_h >> 1
  $F957 shift tape timing constant max byte
N $F959 $B1 = $FF - T2C_l >> 1
  $F959 get tape timing constant min byte
  $F95B clear carry for add
  $F95C
  $F95E compare with tape timing constant max byte
N $F960 compare with ($FFFF - T2C) >> 2
  $F960 branch if min + $3C >= ($FFFF - T2C) >> 2
N $F962 min + $3C < ($FFFF - T2C) >> 2
  $F962 get byte received flag
  $F964 if not byte received ??
  $F966 store the tape character
  $F969 get EOI flag byte
  $F96B
  $F96D
  $F96F
  $F971 add tape timing constant min byte
  $F973 compare with tape timing constant max byte
  $F975
  $F977
  $F978
  $F97A add tape timing constant min byte
  $F97C compare with tape timing constant max byte
  $F97E
  $F980
  $F982 add tape timing constant min byte
  $F984 compare with tape timing constant max byte
  $F986
  $F988
  $F98B get the bit count
  $F98D if all done go ??
  $F98F save receiver bit count in
  $F991 branch always
  $F993 increment ?? start bit check flag
  $F995
  $F997 decrement ?? start bit check flag
  $F999
  $F99A
  $F99C subtract tape timing constant max byte
  $F99E add timing constant for tape
  $F9A0 save timing constant for tape
  $F9A2 get tape bit cycle phase
  $F9A4,b
  $F9A6 save tape bit cycle phase
  $F9A8
  $F9AA
  $F9AC get the bit count
  $F9AE if all done go ??
  $F9B0 read VIA 1 ICR shadow copy
  $F9B3,b mask 0000 000x, timer A interrupt enabled
  $F9B5 if timer A is enabled go ??
  $F9B7 read VIA 1 CRA shadow copy
  $F9BA if ?? just exit
  $F9BC clear `A`
  $F9BE clear the tape bit cycle phase
  $F9C0 save VIA 1 CRA shadow copy
  $F9C3 get EOI flag byte
  $F9C5
  $F9C7
  $F9C9 set timimg max byte
  $F9CB set timing
  $F9CE
  $F9D0
  $F9D2 restore registers and exit interrupt
  $F9D5 get timing constant for tape
  $F9D7
  $F9D9
  $F9DB decrement tape timing constant min byte
@ $F9DD ignoreua
B $F9DD,1 makes next line BIT $B0E6
  $F9DE increment tape timing constant min byte
  $F9E0
  $F9E2 clear timing constant for tape
  $F9E4
  $F9E6
  $F9E8
  $F9E9
  $F9EB get start bit check flag
  $F9ED
  $F9EF
  $F9F1
  $F9F3 save cassette block synchronization number
  $F9F5
  $F9F7
  $F9F8
  $F9FA
  $F9FC
  $F9FE
  $FA00 decrement EOI flag byte
  $FA02
  $FA04
  $FA06 parity count
  $FA08 set timimg max byte
  $FA0A set timing
  $FA0D restore registers and exit interrupt
  $FA10 get cassette block synchronization number
  $FA12
  $FA14
  $FA16
  $FA18 get EOI flag byte
  $FA1A
  $FA1C
  $FA1F shift tape timing constant max byte
  $FA21
  $FA23
  $FA24 subtract tape timing constant max byte
  $FA26 add tape timing constant min byte
  $FA28
  $FA29 copy timimg high byte
  $FA2A set timing
  $FA2D
  $FA2F
  $FA31
  $FA33 get cassette block synchronization number
  $FA35
  $FA37 save receiver bit count in
  $FA39 clear `A`
  $FA3B clear cassette block synchronization number
  $FA3D enable timer A interrupt
  $FA3F save VIA 1 ICR
  $FA42
  $FA44 get cassette block synchronization number
  $FA46
  $FA48
  $FA4A
  $FA4C
  $FA4E disable timer A interrupt
  $FA50 save VIA 1 ICR
  $FA53 parity count
  $FA55 save RS232 parity byte
  $FA57 get receiver bit count in
  $FA59 OR with start bit check flag
  $FA5B
  $FA5D restore registers and exit interrupt

c $FA60 store character
  $FA60 new tape byte setup
  $FA63 clear byte received flag
  $FA65 set timimg max byte
  $FA67 set timing
  $FA6A get copies count
  $FA6C
  $FA6E save receiver input bit temporary storage
  $FA70
  $FA72
  $FA74
  $FA76
  $FA78
  $FA7A get copies count
  $FA7C
  $FA7D if ?? restore registers and exit interrupt
  $FA7F set short block
  $FA81 OR into serial status byte
  $FA84 restore registers and exit interrupt, branch always
  $FA86
  $FA88
  $FA8A restore registers and exit interrupt
  $FA8D
  $FA8F
  $FA91
  $FA93
  $FA95
  $FA97
  $FA99 get receiver input bit temporary storage
  $FA9B
  $FA9C get RS232 parity byte
  $FA9E
  $FAA0
  $FAA2
  $FAA3
  $FAA5
  $FAA7
  $FAA9
  $FAAB
  $FAAD
  $FAAF
  $FAB1 copy I/O start address to buffer address
  $FAB4
  $FAB6
  $FAB8
  $FABA
  $FABC
  $FABE restore registers and exit interrupt, branch always
  $FAC0
  $FAC2
  $FAC4
  $FAC6 OR into serial status byte
  $FAC9
  $FACB
  $FACE check read/write pointer, return Cb = 1 if pointer >= end
  $FAD1
  $FAD3
  $FAD6 get receiver input bit temporary storage
  $FAD8
  $FAD9
  $FADB get load/verify flag
  $FADD if load go ??
  $FADF clear index
  $FAE1 get RS232 parity byte
  $FAE3
  $FAE5
  $FAE7
  $FAE9
  $FAEB
  $FAED
  $FAEF
  $FAF1
  $FAF3
  $FAF5
  $FAF7
  $FAF9
  $FAFC
  $FAFE
  $FB01
  $FB02
  $FB03
  $FB05
  $FB08
  $FB0A
  $FB0C
  $FB0E
  $FB10
  $FB13
  $FB15
  $FB17
  $FB1A
  $FB1C
  $FB1E
  $FB20 get load/verify flag
  $FB22 if load ??
  $FB24 get RS232 parity byte
  $FB26
  $FB28
  $FB2A
  $FB2C
  $FB2D
  $FB2F
  $FB31
  $FB33
  $FB35 OR into serial status byte
  $FB38
  $FB3A get load/verify flag
  $FB3C if verify go ??
  $FB3E
  $FB3F get RS232 parity byte
  $FB41
  $FB43 increment read/write pointer
  $FB46 restore registers and exit interrupt, branch always
  $FB48
  $FB4A
  $FB4C
  $FB4D disable timer A interrupt
  $FB4F save VIA 1 ICR
  $FB52 read VIA 1 ICR
  $FB55 get copies count
  $FB57
  $FB58
  $FB5A save copies count
  $FB5C decrement receiver input bit temporary storage
  $FB5E
  $FB60
  $FB62 if ?? restore registers and exit interrupt
  $FB64 save copies count
  $FB66 restore registers and exit interrupt, branch always
  $FB68 restore everything for STOP
  $FB6B copy I/O start address to buffer address
  $FB6E clear index
  $FB70 clear checksum
  $FB72 get byte from buffer
  $FB74 XOR with checksum
  $FB76 save new checksum
  $FB78 increment read/write pointer
  $FB7B check read/write pointer, return Cb = 1 if pointer >= end
  $FB7E loop if not at end
  $FB80 get computed checksum
  $FB82 compare with stored checksum ??
  $FB84 if checksum ok restore registers and exit interrupt
  $FB86 else set checksum error
  $FB88 OR into the serial status byte
  $FB8B restore registers and exit interrupt

c $FB8E copy I/O start address to buffer address
  $FB8E get I/O start address high byte
  $FB90 set buffer address high byte
  $FB92 get I/O start address low byte
  $FB94 set buffer address low byte
  $FB96

c $FB97 new tape byte setup
  $FB97 eight bits to do
  $FB99 set bit count
  $FB9B clear `A`
  $FB9D clear tape bit cycle phase
  $FB9F clear start bit first cycle done flag
  $FBA1 clear byte parity
  $FBA3 clear start bit check flag, set no start bit yet
  $FBA5

c $FBA6 send lsb from tape write byte to tape
D $FBA6 this routine tests the least significant bit in the tape write byte and sets VIA 2 T2 depending on the state of the bit. if the bit is a 1 a time of $00B0 cycles is set, if the bot is a 0 a time of $0060 cycles is set. note that this routine does not shift the bits of the tape write byte but uses a copy of that byte, the byte itself is shifted elsewhere
  $FBA6 get tape write byte
  $FBA8 shift lsb into Cb
  $FBA9 set time constant low byte for bit = 0
  $FBAB branch if bit was 0
N $FBAD set time constant for bit = 1 and toggle tape
  $FBAD set time constant low byte for bit = 1
N $FBAF write time constant and toggle tape
  $FBAF set time constant high byte
N $FBB1 write time constant and toggle tape
  $FBB1 save VIA 1 timer B low byte
  $FBB4 save VIA 1 timer B high byte
  $FBB7 read VIA 1 ICR
  $FBBA load timer B, timer B single shot, start timer B
  $FBBC save VIA 1 CRB
  $FBBF read the 6510 I/O port
  $FBC1,b toggle tape out bit
  $FBC3 save the 6510 I/O port
  $FBC5,b mask tape out bit
  $FBC7

c $FBC8 flag block done and exit interrupt
  $FBC8 set carry flag
  $FBC9 set buffer address high byte negative, flag all sync,
N $FBCB data and checksum bytes written
  $FBCB restore registers and exit interrupt, branch always

c $FBCD tape write IRQ routine
D $FBCD this is the routine that writes the bits to the tape. it is called each time VIA 2 T2 times out and checks if the start bit is done, if so checks if the data bits are done, if so it checks if the byte is done, if so it checks if the synchronisation bytes are done, if so it checks if the data bytes are done, if so it checks if the checksum byte is done, if so it checks if both the load and verify copies have been done, if so it stops the tape
  $FBCD get start bit first cycle done flag
  $FBCF if first cycle done go do rest of byte
N $FBD1 each byte sent starts with two half cycles of $0110 system clocks and the whole block ends with two more such half cycles
  $FBD1 set first start cycle time constant low byte
  $FBD3 set first start cycle time constant high byte
  $FBD5 write time constant and toggle tape
  $FBD8 if first half cycle go restore registers and exit interrupt
  $FBDA set start bit first start cycle done flag
  $FBDC get buffer address high byte
  $FBDE if block not complete go restore registers and exit interrupt. the end of a block is indicated by the tape buffer high byte b7 being set to 1
  $FBE0 else do tape routine, block complete exit
N $FBE3 continue tape byte write. the first start cycle, both half cycles of it, is complete so the routine drops straight through to here
  $FBE3 get start bit check flag
  $FBE5 if the start bit is complete go send the byte bits
N $FBE7 after the two half cycles of $0110 ststem clocks the start bit is completed with two half cycles of $00B0 system clocks. this is the same as the first part of a 1 bit
  $FBE7 set time constant for bit = 1 and toggle tape
  $FBEA if first half cycle go restore registers and exit interrupt
  $FBEC set start bit check flag
  $FBEE restore registers and exit interrupt, branch always
N $FBF0 continue tape byte write. the start bit, both cycles of it, is complete so the routine drops straight through to here. now the cycle pairs for each bit, and the parity bit, are sent
  $FBF0 send lsb from tape write byte to tape
  $FBF3 if first half cycle go restore registers and exit interrupt
N $FBF5 else two half cycles have been done
  $FBF5 get tape bit cycle phase
  $FBF7,b toggle b0
  $FBF9 save tape bit cycle phase
  $FBFB if bit cycle phase complete go setup for next bit
N $FBFD each bit is written as two full cycles. a 1 is sent as a full cycle of $0160 system clocks then a full cycle of $00C0 system clocks. a 0 is sent as a full cycle of $00C0 system clocks then a full cycle of $0160 system clocks. to do this each bit from the write byte is inverted during the second bit cycle phase. as the bit is inverted it is also added to the, one bit, parity count for this byte
  $FBFD get tape write byte
  $FBFF,b invert bit being sent
  $FC01 save tape write byte
  $FC03,b mask b0
  $FC05 EOR with tape write byte parity bit
  $FC07 save tape write byte parity bit
  $FC09 restore registers and exit interrupt
N $FC0C the bit cycle phase is complete so shift out the just written bit and test for byte end
  $FC0C shift bit out of tape write byte
  $FC0E decrement tape write bit count
  $FC10 get tape write bit count
  $FC12 if all the data bits have been written go setup for sending the parity bit next and exit the interrupt
  $FC14 if all the data bits are not yet sent just restore the registers and exit the interrupt
N $FC16 do next tape byte
N $FC16 the byte is complete. the start bit, data bits and parity bit have been written to the tape so setup for the next byte
  $FC16 new tape byte setup
  $FC19 enable the interrupts
  $FC1A get cassette synchronization character count
  $FC1C if synchronisation characters done go do block data
N $FC1E at the start of each block sent to tape there are a number of synchronisation bytes that count down to the actual data. the commodore tape system saves two copies of all the tape data, the first is loaded and is indicated by the synchronisation bytes having b7 set, and the second copy is indicated by the synchronisation bytes having b7 clear. the sequence goes $09, $08, ..... $02, $01, data bytes
  $FC1E clear `X`
  $FC20 clear checksum byte
  $FC22 decrement cassette synchronization byte count
  $FC24 get cassette copies count
  $FC26 compare with load block indicator
  $FC28 branch if not the load block
  $FC2A this is the load block so make the synchronisation count go $89, $88, ..... $82, $81
  $FC2C save the synchronisation byte as the tape write byte
  $FC2E restore registers and exit interrupt, branch always
N $FC30 the synchronization bytes have been done so now check and do the actual block data
  $FC30 check read/write pointer, return Cb = 1 if pointer >= end
  $FC33 if not all done yet go get the byte to send
  $FC35 if pointer > end go flag block done and exit interrupt
N $FC37 else the block is complete, it only remains to write the checksum byte to the tape so setup for that
  $FC37 increment buffer pointer high byte, this means the block done branch will always be taken next time without having to worry about the low byte wrapping to zero
  $FC39 get checksum byte
  $FC3B save checksum as tape write byte
  $FC3D restore registers and exit interrupt, branch always
N $FC3F the block isn't finished so get the next byte to write to tape
  $FC3F clear index
  $FC41 get byte from buffer
  $FC43 save as tape write byte
  $FC45 XOR with checksum byte
  $FC47 save new checksum byte
  $FC49 increment read/write pointer
  $FC4C restore registers and exit interrupt, branch always
N $FC4E set parity as next bit and exit interrupt
  $FC4E get parity bit
  $FC50,b toggle it
  $FC52 save as tape write byte
  $FC54 restore registers and exit interrupt
N $FC57 tape routine, block complete exit
  $FC57 decrement copies remaining to read/write
  $FC59 branch if more to do
  $FC5B stop the cassette motor
  $FC5E set tape write leader count
  $FC60 save tape write leader count
  $FC62 set index for write tape leader vector
  $FC64 disable the interrupts
  $FC65 set the tape vector
  $FC68 restore registers and exit interrupt, branch always

c $FC6A write tape leader IRQ routine
  $FC6A set time constant low byte for bit = leader
  $FC6C write time constant and toggle tape
  $FC6F if tape bit high restore registers and exit interrupt
  $FC71 decrement cycle count
  $FC73 if not all done restore registers and exit interrupt
  $FC75 new tape byte setup
  $FC78 decrement cassette leader count
  $FC7A if not all done restore registers and exit interrupt
  $FC7C set index for tape write vector
  $FC7E set the tape vector
  $FC81 enable the interrupts
  $FC82 clear cassette leader counter, was $FF
  $FC84 get cassette block count
  $FC86 if all done restore everything for STOP and exit the interrupt
  $FC88 copy I/O start address to buffer address
  $FC8B set nine synchronisation bytes
  $FC8D save cassette synchronization byte count
  $FC8F
  $FC91 go do the next tape byte, branch always

c $FC93 restore everything for STOP
  $FC93 save status
  $FC94 disable the interrupts
  $FC95 read the vertical fine scroll and control register
  $FC98,b mask xxx1 xxxx, unblank the screen
  $FC9A save the vertical fine scroll and control register
  $FC9D stop the cassette motor
  $FCA0 disable all interrupts
  $FCA2 save VIA 1 ICR
  $FCA5
  $FCA8 get saved IRQ vector high byte
  $FCAB branch if null
  $FCAD restore IRQ vector high byte
  $FCB0 get saved IRQ vector low byte
  $FCB3 restore IRQ vector low byte
  $FCB6 restore status
  $FCB7

c $FCB8 reset vector
  $FCB8 restore everything for STOP
  $FCBB restore registers and exit interrupt, branch always

c $FCBD set tape vector
  $FCBD get tape IRQ vector low byte
  $FCC0 set IRQ vector low byte
  $FCC3 get tape IRQ vector high byte
  $FCC6 set IRQ vector high byte
  $FCC9

c $FCCA stop the cassette motor
  $FCCA read the 6510 I/O port
  $FCCC,b mask xx1x xxxx, turn the cassette motor off
  $FCCE save the 6510 I/O port
  $FCD0

c $FCD1 check read/write pointer
D $FCD1 return Cb = 1 if pointer >= end
  $FCD1 set carry for subtract
  $FCD2 get buffer address low byte
  $FCD4 subtract buffer end low byte
  $FCD6 get buffer address high byte
  $FCD8 subtract buffer end high byte
  $FCDA

c $FCDB increment read/write pointer
  $FCDB increment buffer address low byte
  $FCDD branch if no overflow
  $FCDF increment buffer address low byte
  $FCE1

c $FCE2 RESET, hardware reset starts here
  $FCE2 set `X` for stack
  $FCE4 disable the interrupts
  $FCE5 clear stack
  $FCE6 clear decimal mode
  $FCE7 scan for autostart ROM at $8000
  $FCEA if not there continue startup
  $FCEC else call ROM start code
  $FCEF read the horizontal fine scroll and control register
  $FCF2 initialise SID, CIA and IRQ
  $FCF5 RAM test and find RAM end
  $FCF8 restore default I/O vectors
  $FCFB initialise VIC and screen editor
  $FCFE enable the interrupts
  $FCFF execute BASIC

c $FD02 scan for autostart ROM at $8000
D $FD02 returns Zb=1 if ROM found
  $FD02 five characters to test
  $FD04 get test character
  $FD07 compare wiith byte in ROM space
  $FD0A exit if no match
  $FD0C decrement index
  $FD0D loop if not all done
  $FD0F

b $FD10 autostart ROM signature
  $FD10,5 'CBM80’

c $FD15 restore default I/O vectors
  $FD15 pointer to vector table low byte
  $FD17 pointer to vector table high byte
  $FD19 flag set vectors

c $FD1A set/read vectored I/O from (`XY`)
D $FD1A Cb = 1 to read, Cb = 0 to set
  $FD1A save pointer low byte
  $FD1C save pointer high byte
  $FD1E set byte count
  $FD20 read vector byte from vectors
  $FD23 branch if read vectors
  $FD25 read vector byte from (`XY`)
  $FD27 save byte to (`XY`)
  $FD29 save byte to vector
  $FD2C decrement index
  $FD2D loop if more to do
  $FD2F
@ $FD1A ignoreua:e
E $FD1A The above code works but it tries to write to the ROM. while this is usually harmless systems that use flash ROM may suffer. Here is a version that makes the extra write to RAM instead but is otherwise identical in function.
E $FD1A
. #TABLE(asm,address-1,instruction,comment-1)
. { FD1A | STX $C3     | save pointer low byte }
. { FD1C | STY $C4     | save pointer high byte }
. { FD1E | LDY #$1F    | set byte count }
. { FD20 | LDA ($C3),Y | read vector byte from (`XY`) }
. { FD22 | BCC $FD29   | branch if set vectors }
. { FD24 | LDA $0314,Y | else read vector byte from vectors }
. { FD27 | STA ($C3),Y | save byte to (`XY`) }
. { FD29 | STA $0314,Y | save byte to vector }
. { FD2C | DEY         | decrement index }
. { FD2D | BPL $FD20   | loop if more to do }
. { FD2F | RTS         | }
. TABLE#

w $FD30 kernal vectors
  $FD30 $0314 IRQ vector
  $FD32 $0316 BRK vector
  $FD34 $0318 NMI vector
  $FD36 $031A open a logical file
  $FD38 $031C close a specified logical file
  $FD3A $031E open channel for input
  $FD3C $0320 open channel for output
  $FD3E $0322 close input and output channels
  $FD40 $0324 input character from channel
  $FD42 $0326 output character to channel
  $FD44 $0328 scan stop key
  $FD46 $032A get character from the input device
  $FD48 $032C close all channels and files
N $FD4A Vector to user defined command, currently points to BRK.
N $FD4A This appears to be a holdover from PET days, when the built-in machine language monitor would jump through the $032E vector when it encountered a command that it did not understand, allowing the user to add new commands to the monitor.
N $FD4A Although this vector is initialized to point to the routine called by STOP/RESTORE and the BRK interrupt, and is updated by the kernal vector routine at #R$FD1A, it no longer has any function.
  $FD4A $032E user function
  $FD4C $0330 load
  $FD4E $0332 save

c $FD50 test RAM and find RAM end
  $FD50 clear `A`
  $FD52 clear index
  $FD53 clear page 0, don't do $0000 or $0001
  $FD56 clear page 2
  $FD59 clear page 3
  $FD5C increment index
  $FD5D loop if more to do
  $FD5F set cassette buffer pointer low byte
  $FD61 set cassette buffer pointer high byte
  $FD63 save tape buffer start pointer low byte
  $FD65 save tape buffer start pointer high byte
  $FD67 clear `Y`
  $FD68 set RAM test pointer high byte
  $FD6A save RAM test pointer high byte
  $FD6C increment RAM test pointer high byte
  $FD6E
  $FD70
  $FD71
  $FD73
  $FD75
  $FD77
  $FD79
  $FD7A
  $FD7C
  $FD7E
  $FD80
  $FD81
  $FD83
  $FD84
  $FD86
  $FD88
  $FD89
  $FD8A
  $FD8C
  $FD8D set the top of memory
  $FD90
  $FD92 save the OS start of memory high byte
  $FD95
  $FD97 save the screen memory page
  $FD9A

w $FD9B tape IRQ vectors
  $FD9B $08 write tape leader IRQ routine
  $FD9D $0A tape write IRQ routine
  $FD9F $0C normal IRQ vector
  $FDA1 $0E read tape bits IRQ routine

c $FDA3 initialise SID, CIA and IRQ
  $FDA3 disable all interrupts
  $FDA5 save VIA 1 ICR
  $FDA8 save VIA 2 ICR
  $FDAB save VIA 1 DRA, keyboard column drive
  $FDAE set timer single shot
  $FDB0 save VIA 1 CRA
  $FDB3 save VIA 2 CRA
  $FDB6 save VIA 1 CRB
  $FDB9 save VIA 2 CRB
  $FDBC set all inputs
  $FDBE save VIA 1 DDRB, keyboard row
  $FDC1 save VIA 2 DDRB, RS232 port
  $FDC4 clear the volume and filter select register
  $FDC7 set `X` = $FF
  $FDC8 save VIA 1 DDRA, keyboard column
  $FDCB DATA out high, CLK out high, ATN out high, RE232 Tx DATA high, video address 15 = 1, video address 14 = 1
  $FDCD save VIA 2 DRA, serial port and video address
  $FDD0 set serial DATA input, serial CLK input
  $FDD2 save VIA 2 DDRA, serial port and video address
  $FDD5 set 1110 0111, motor off, enable I/O, enable KERNAL, enable BASIC
  $FDD7 save the 6510 I/O port
  $FDD9 set 0010 1111, 0 = input, 1 = output
  $FDDB save the 6510 I/O port direction register
  $FDDD get the PAL/NTSC flag
  $FDE0 if NTSC go set NTSC timing
N $FDE2 else set PAL timing
  $FDE2
  $FDE4 save VIA 1 timer A low byte
  $FDE7
  $FDE9
  $FDEC
  $FDEE save VIA 1 timer A low byte
  $FDF1
  $FDF3 save VIA 1 timer A high byte
  $FDF6

c $FDF9 set filename
  $FDF9 set file name length
  $FDFB set file name pointer low byte
  $FDFD set file name pointer high byte
  $FDFF

c $FE00 set logical, first and second addresses
  $FE00 save the logical file
  $FE02 save the device number
  $FE04 save the secondary address
  $FE06

c $FE07 read I/O status word
  $FE07 get the device number
  $FE09 compare device with RS232 device
  $FE0B if not RS232 device go ??
N $FE0D get RS232 device status
  $FE0D get the RS232 status register
  $FE10 save the RS232 status value
  $FE11 clear `A`
  $FE13 clear the RS232 status register
  $FE16 restore the RS232 status value
  $FE17

c $FE18 control kernal messages
  $FE18 set message mode flag
  $FE1A read the serial status byte

c $FE1C OR into the serial status byte
  $FE1C OR with the serial status byte
  $FE1E save the serial status byte
  $FE20

c $FE21 set timeout on serial bus
  $FE21 save serial bus timeout flag
  $FE24

c $FE25 read/set the top of memory
D $FE25 Cb = 1 to read, Cb = 0 to set
  $FE25 if Cb clear go set the top of memory

c $FE27 read the top of memory
  $FE27 get memory top low byte
  $FE2A get memory top high byte

c $FE2D set the top of memory
  $FE2D set memory top low byte
  $FE30 set memory top high byte
  $FE33

c $FE34 read/set the bottom of memory
D $FE34 Cb = 1 to read, Cb = 0 to set
  $FE34 if Cb clear go set the bottom of memory
  $FE36 get the OS start of memory low byte
  $FE39 get the OS start of memory high byte
  $FE3C save the OS start of memory low byte
  $FE3F save the OS start of memory high byte
  $FE42

c $FE43 NMI vector
  $FE43 disable the interrupts
  $FE44 do NMI vector

c $FE47 NMI handler
  $FE47 save `A`
  $FE48 copy `X`
  $FE49 save `X`
  $FE4A copy `Y`
  $FE4B save `Y`
  $FE4C disable all interrupts
  $FE4E save VIA 2 ICR
  $FE51 save VIA 2 ICR
  $FE54
  $FE56 scan for autostart ROM at $8000
  $FE59 branch if no autostart ROM
  $FE5B else do autostart ROM break entry
  $FE5E increment real time clock
  $FE61 scan stop key
  $FE64 if not [STOP] restore registers and exit interrupt

c $FE66 user function default vector
D $FE66 BRK handler
  $FE66 restore default I/O vectors
  $FE69 initialise SID, CIA and IRQ
  $FE6C initialise the screen and keyboard
  $FE6F do BASIC break entry

c $FE72 RS232 NMI routine
  $FE72
  $FE73 AND with the RS-232 interrupt enable byte
  $FE76
  $FE77
  $FE79
  $FE7B read VIA 2 DRA, serial port and video address
  $FE7E,b mask xxxx x0xx, clear RS232 Tx DATA
  $FE80 OR in the RS232 transmit data bit
  $FE82 save VIA 2 DRA, serial port and video address
  $FE85 get the RS-232 interrupt enable byte
  $FE88 save VIA 2 ICR
  $FE8B
  $FE8C
  $FE8E
  $FE90
  $FE92
  $FE94
  $FE97
  $FE9A
  $FE9D
  $FEA0
  $FEA3 get active interrupts back
  $FEA4,b mask ?? interrupt
  $FEA6 branch if not ?? interrupt
N $FEA8 was ?? interrupt
  $FEA8
  $FEAB
  $FEAE get active interrupts back
  $FEAF,b mask CB1 interrupt, Rx data bit transition
  $FEB1 if no bit restore registers and exit interrupt
  $FEB3
  $FEB6 get the RS-232 interrupt enable byte
  $FEB9 save VIA 2 ICR
  $FEBC pull `Y`
  $FEBD restore `Y`
  $FEBE pull `X`
  $FEBF restore `X`
  $FEC0 restore `A`
  $FEC1

w $FEC2 baud rate tables for NTSC C64
D $FEC2 baud rate word is calculated from ..
D $FEC2 (system clock / baud rate) / 2 - 100
D $FEC2 #TABLE(default)
. { =h,c2 system clock }
. { PAL  | 985248 Hz }
. { NTSC | 1022727 Hz }
. TABLE#
  $FEC2 50 baud (1027700)
  $FEC4 75 baud (1022700)
  $FEC6 110 baud (1022780)
  $FEC8 134.5 baud (1022200)
  $FECA 150 baud (1022700)
  $FECC 300 baud (1023000)
  $FECE 600 baud (1022400)
  $FED0 1200 baud (1022400)
  $FED2 1800 baud (1022400)
  $FED4 2400 baud (1022400)

c $FED6 ??
  $FED6 read VIA 2 DRB, RS232 port
  $FED9,b mask 0000 000x, RS232 Rx DATA
  $FEDB save the RS232 received data bit
  $FEDD get VIA 2 timer B low byte
  $FEE0
  $FEE2
  $FEE5 save VIA 2 timer B low byte
  $FEE8 get VIA 2 timer B high byte
  $FEEB
  $FEEE save VIA 2 timer B high byte
  $FEF1 set timer B single shot, start timer B
  $FEF3 save VIA 2 CRB
  $FEF6 get the RS-232 interrupt enable byte
  $FEF9 save VIA 2 ICR
  $FEFC
  $FEFE save VIA 2 timer B low byte
  $FF01 save VIA 2 timer B high byte
  $FF04

c $FF07 ??
  $FF07 nonstandard bit timing low byte
  $FF0A save VIA 2 timer B low byte
  $FF0D nonstandard bit timing high byte
  $FF10 save VIA 2 timer B high byte
  $FF13 set timer B single shot, start timer B
  $FF15 save VIA 2 CRB
  $FF18
  $FF1A EOR with the RS-232 interrupt enable byte
  $FF1D save the RS-232 interrupt enable byte
  $FF20
  $FF22 save VIA 2 timer B low byte
  $FF25 save VIA 2 timer B high byte
  $FF28
  $FF2B
  $FF2D

c $FF2E ??
  $FF2E
  $FF2F nonstandard bit timing high byte
  $FF32
  $FF33
  $FF34
  $FF35
  $FF37
  $FF3A
  $FF3B add any carry
  $FF3D
  $FF40

u $FF41 unused bytes
C $FF41 waste cycles
C $FF42 waste cycles

c $FF43 save the status and do the IRQ routine
  $FF43 save the processor status
  $FF44 pull the processor status
  $FF45,b mask xxx0 xxxx, clear the break bit
  $FF47 save the modified processor status

c $FF48 IRQ vector
  $FF48 save `A`
  $FF49 copy `X`
  $FF4A save `X`
  $FF4B copy `Y`
  $FF4C save `Y`
  $FF4D copy stack pointer
  $FF4E get stacked status register
  $FF51,b mask BRK flag
  $FF53 branch if not BRK
  $FF55 else do BRK vector (iBRK)
  $FF58 do IRQ vector (iIRQ)

c $FF5B initialise VIC and screen editor
  $FF5B initialise the screen and keyboard
  $FF5E read the raster compare register
  $FF61 loop if not raster line $00
  $FF63 read the vic interrupt flag register
  $FF66,b mask the raster compare flag
  $FF68 save the PAL/NTSC flag
  $FF6B

c $FF6E ??
  $FF6E enable timer A interrupt
  $FF70 save VIA 1 ICR
  $FF73 read VIA 1 CRA
  $FF76,b mask x000 0000, TOD clock
  $FF78,b mask xxx1 xxx1, load timer A, start timer A
  $FF7A save VIA 1 CRA
  $FF7D set the serial clock out low and return

u $FF80 unused

c $FF81 initialise VIC and screen editor
  $FF81 initialise VIC and screen editor

c $FF84 initialise SID, CIA and IRQ, unused
  $FF84 initialise SID, CIA and IRQ

c $FF87 RAM test and find RAM end
  $FF87 RAM test and find RAM end

c $FF8A restore default I/O vectors
D $FF8A this routine restores the default values of all system vectors used in KERNAL and BASIC routines and interrupts.
  $FF8A restore default I/O vectors

c $FF8D read/set vectored I/O
D $FF8D this routine manages all system vector jump addresses stored in RAM. Calling this routine with the carry bit set will store the current contents of the RAM vectors in a list pointed to by the `X` and `Y` registers. When this routine is called with the carry bit clear, the user list pointed to by the `X` and `Y` registers is copied to the system RAM vectors. NOTE: This routine requires caution in its use. The best way to use it is to first read the entire vector contents into the user area, alter the desired vectors and then copy the contents back to the system vectors.
  $FF8D read/set vectored I/O

c $FF90 control kernal messages
D $FF90 this routine controls the printing of error and control messages by the KERNAL. Either print error messages or print control messages can be selected by setting the accumulator when the routine is called. FILE NOT FOUND is an example of an error message. PRESS PLAY ON CASSETTE is an example of a control message. bits 6 and 7 of this value determine where the message will come from. If bit 7 is set one of the error messages from the KERNAL will be printed. If bit 6 is set a control message will be printed.
  $FF90 control kernal messages

c $FF93 send secondary address after LISTEN
D $FF93 this routine is used to send a secondary address to an I/O device after a call to the LISTEN routine is made and the device commanded to LISTEN. The routine cannot be used to send a secondary address after a call to the TALK routine. A secondary address is usually used to give set-up information to a device before I/O operations begin. When a secondary address is to be sent to a device on the serial bus the address must first be ORed with $60.
  $FF93 send secondary address after LISTEN

c $FF96 send secondary address after TALK
D $FF96 this routine transmits a secondary address on the serial bus for a TALK device. This routine must be called with a number between 4 and 31 in the accumulator. The routine will send this number as a secondary address command over the serial bus. This routine can only be called after a call to the TALK routine. It will not work after a LISTEN.
  $FF96 send secondary address after TALK

c $FF99 read/set the top of memory
D $FF99 this routine is used to read and set the top of RAM. When this routine is called with the carry bit set the pointer to the top of RAM will be loaded into `XY`. When this routine is called with the carry bit clear `XY` will be saved as the top of memory pointer changing the top of memory.
  $FF99 read/set the top of memory

c $FF9C read/set the bottom of memory
D $FF9C this routine is used to read and set the bottom of RAM. When this routine is called with the carry bit set the pointer to the bottom of RAM will be loaded into `XY`. When this routine is called with the carry bit clear `XY` will be saved as the bottom of memory pointer changing the bottom of memory.
  $FF9C read/set the bottom of memory

c $FF9F scan the keyboard
D $FF9F this routine will scan the keyboard and check for pressed keys. It is the same routine called by the interrupt handler. If a key is down, its ASCII value is placed in the keyboard queue.
  $FF9F scan keyboard

c $FFA2 set timeout on serial bus
D $FFA2 this routine sets the timeout flag for the serial bus. When the timeout flag is set, the computer will wait for a device on the serial port for 64 milliseconds. If the device does not respond to the computer's DAV signal within that time the computer will recognize an error condition and leave the handshake sequence. When this routine is called and the accumulator contains a 0 in bit 7, timeouts are enabled. A 1 in bit 7 will disable the timeouts. NOTE: The the timeout feature is used to communicate that a disk file is not found on an attempt to OPEN a file.
  $FFA2 set timeout on serial bus

c $FFA5 input byte from serial bus
D $FFA5 this routine reads a byte of data from the serial bus using full handshaking. the data is returned in the accumulator. before using this routine the TALK routine, #R$FFB4, must have been called first to command the device on the serial bus to send data on the bus. if the input device needs a secondary command it must be sent by using the TKSA routine, #R$FF96, before calling this routine.
D $FFA5 errors are returned in the status word which can be read by calling the READST routine, #R$FFB7.
  $FFA5 input byte from serial bus

c $FFA8 output a byte to serial bus
D $FFA8 this routine is used to send information to devices on the serial bus. A call to this routine will put a data byte onto the serial bus using full handshaking. Before this routine is called the LISTEN routine, #R$FFB1, must be used to command a device on the serial bus to get ready to receive data. the accumulator is loaded with a byte to output as data on the serial bus. A device must be listening or the status word will return a timeout. This routine always buffers one character. So when a call to the UNLISTEN routine, #R$FFAE, is made to end the data transmission, the buffered character is sent with EOI set. Then the UNLISTEN command is sent to the device.
  $FFA8 output byte to serial bus

c $FFAB command serial bus to UNTALK
D $FFAB this routine will transmit an UNTALK command on the serial bus. All devices previously set to TALK will stop sending data when this command is received.
  $FFAB command serial bus to UNTALK

c $FFAE command serial bus to UNLISTEN
D $FFAE this routine commands all devices on the serial bus to stop receiving data from the computer. Calling this routine results in an UNLISTEN command being transmitted on the serial bus. Only devices previously commanded to listen will be affected. This routine is normally used after the computer is finished sending data to external devices. Sending the UNLISTEN will command the listening devices to get off the serial bus so it can be used for other purposes.
  $FFAE command serial bus to UNLISTEN

c $FFB1 command devices on the serial bus to LISTEN
D $FFB1 this routine will command a device on the serial bus to receive data. The accumulator must be loaded with a device number between 4 and 31 before calling this routine. LISTEN convert this to a listen address then transmit this data as a command on the serial bus. The specified device will then go into listen mode and be ready to accept information.
  $FFB1 command devices on the serial bus to LISTEN

c $FFB4 command serial bus device to TALK
D $FFB4 to use this routine the accumulator must first be loaded with a device number between 4 and 30. When called this routine converts this device number to a talk address. Then this data is transmitted as a command on the Serial bus.
  $FFB4 command serial bus device to TALK

c $FFB7 read I/O status word
D $FFB7 this routine returns the current status of the I/O device in the accumulator. The routine is usually called after new communication to an I/O device. The routine will give information about device status, or errors that have occurred during the I/O operation.
  $FFB7 read I/O status word

c $FFBA set logical, first and second addresses
D $FFBA this routine will set the logical file number, device address, and secondary address, command number, for other KERNAL routines.
D $FFBA the logical file number is used by the system as a key to the file table created by the OPEN file routine. Device addresses can range from 0 to 30. The following codes are used by the computer to stand for the following CBM devices:
D $FFBA #TABLE(default,centre)
. { =h ADDRESS | =h DEVICE }
. { 0          | Keyboard }
. { 1          | Cassette #1 }
. { 2          | RS-232C device }
. { 3          | CRT display }
. { 4          | Serial bus printer }
. { 8          | CBM Serial bus disk drive }
. TABLE#
D $FFBA device numbers of four or greater automatically refer to devices on the serial bus.
D $FFBA a command to the device is sent as a secondary address on the serial bus after the device number is sent during the serial attention handshaking sequence. If no secondary address is to be sent `Y` should be set to $FF.
  $FFBA set logical, first and second addresses

c $FFBD set the filename
D $FFBD this routine is used to set up the file name for the OPEN, SAVE, or LOAD routines. The accumulator must be loaded with the length of the file and `XY` with the pointer to file name, `X` being th low byte. The address can be any valid memory address in the system where a string of characters for the file name is stored. If no file name desired the accumulator must be set to 0, representing a zero file length, in that case `XY` may be set to any memory address.
  $FFBD set the filename

c $FFC0 open a logical file
D $FFC0 this routine is used to open a logical file. Once the logical file is set up it can be used for input/output operations. Most of the I/O KERNAL routines call on this routine to create the logical files to operate on. No arguments need to be set up to use this routine, but both the SETLFS, #R$FFBA, and SETNAM, #R$FFBD, KERNAL routines must be called before using this routine.
  $FFC0 do open a logical file

c $FFC3 close a specified logical file
D $FFC3 this routine is used to close a logical file after all I/O operations have been completed on that file. This routine is called after the accumulator is loaded with the logical file number to be closed, the same number used when the file was opened using the OPEN routine.
  $FFC3 do close a specified logical file

c $FFC6 open channel for input
D $FFC6 any logical file that has already been opened by the OPEN routine, #R$FFC0, can be defined as an input channel by this routine. the device on the channel must be an input device or an error will occur and the routine will abort.
D $FFC6 if you are getting data from anywhere other than the keyboard, this routine must be called before using either the CHRIN routine, #R$FFCF, or the GETIN routine, #R$FFE4. if you are getting data from the keyboard and no other input channels are open then the calls to this routine and to the OPEN routine, #R$FFC0, are not needed.
D $FFC6 when used with a device on the serial bus this routine will automatically send the listen address specified by the OPEN routine, #R$FFC0, and any secondary address.
D $FFC6 possible errors are:
D $FFC6 #LIST
. { 3 : file not open }
. { 5 : device not present }
. { 6 : file is not an input file }
. LIST#
  $FFC6 do open channel for input

c $FFC9 open channel for output
D $FFC9 any logical file that has already been opened by the OPEN routine, #R$FFC0, can be defined as an output channel by this routine the device on the channel must be an output device or an error will occur and the routine will abort.
D $FFC9 if you are sending data to anywhere other than the screen this routine must be called before using the CHROUT routine, #R$FFD2. if you are sending data to the screen and no other output channels are open then the calls to this routine and to the OPEN routine, #R$FFC0, are not needed.
D $FFC9 when used with a device on the serial bus this routine will automatically send the listen address specified by the OPEN routine, #R$FFC0, and any secondary address.
D $FFC9 possible errors are:
D $FFC9 #LIST
. { 3 : file not open }
. { 5 : device not present }
. { 7 : file is not an output file }
. LIST#
  $FFC9 do open channel for output

c $FFCC close input and output channels
D $FFCC this routine is called to clear all open channels and restore the I/O channels to their original default values. It is usually called after opening other I/O channels and using them for input/output operations. The default input device is 0, the keyboard. The default output device is 3, the screen. If one of the channels to be closed is to the serial port, an UNTALK signal is sent first to clear the input channel or an UNLISTEN is sent to clear the output channel. By not calling this routine and leaving listener(s) active on the serial bus, several devices can receive the same data from the VIC at the same time. One way to take advantage of this would be to command the printer to TALK and the disk to LISTEN. This would allow direct printing of a disk file.
  $FFCC do close input and output channels

c $FFCF input character from channel
D $FFCF this routine will get a byte of data from the channel already set up as the input channel by the CHKIN routine, #R$FFC6.
D $FFCF If CHKIN, #R$FFC6, has not been used to define another input channel the data is expected to be from the keyboard. the data byte is returned in the accumulator. the channel remains open after the call.
D $FFCF input from the keyboard is handled in a special way. first, the cursor is turned on and it will blink until a carriage return is typed on the keyboard. all characters on the logical line, up to 80 characters, will be stored in the BASIC input buffer. then the characters can be returned one at a time by calling this routine once for each character. when the carriage return is returned the entire line has been processed. the next time this routine is called the whole process begins again.
  $FFCF do input character from channel

c $FFD2 output character to channel
D $FFD2 this routine will output a character to an already opened channel. Use the OPEN routine, #R$FFC0, and the CHKOUT routine, #R$FFC9, to set up the output channel before calling this routine. If these calls are omitted, data will be sent to the default output device, device 3, the screen. The data byte to be output is loaded into the accumulator, and this routine is called. The data is then sent to the specified output device. The channel is left open after the call. NOTE: Care must be taken when using routine to send data to a serial device since data will be sent to all open output channels on the bus. Unless this is desired, all open output channels on the serial bus other than the actually intended destination channel must be closed by a call to the KERNAL close channel routine.
  $FFD2 do output character to channel

c $FFD5 load RAM from a device
D $FFD5 this routine will load data bytes from any input device directly into the memory of the computer. It can also be used for a verify operation comparing data from a device with the data already in memory, leaving the data stored in RAM unchanged. The accumulator must be set to 0 for a load operation or 1 for a verify. If the input device was OPENed with a secondary address of 0 the header information from device will be ignored. In this case `XY` must contain the starting address for the load. If the device was addressed with a secondary address of 1 or 2 the data will load into memory starting at the location specified by the header. This routine returns the address of the highest RAM location which was loaded. Before this routine can be called, the SETLFS, #R$FFBA, and SETNAM, #R$FFBD, routines must be called.
  $FFD5 load RAM from a device

c $FFD8 save RAM to a device
D $FFD8 this routine saves a section of memory. Memory is saved from an indirect address on page 0 specified by `A`, to the address stored in `XY`, to a logical file. The SETLFS, #R$FFBA, and SETNAM, #R$FFBD, routines must be used before calling this routine. However, a file name is not required to SAVE to device 1, the cassette. Any attempt to save to other devices without using a file name results in an error. NOTE: device 0, the keyboard, and device 3, the screen, cannot be SAVEd to. If the attempt is made, an error will occur, and the SAVE stopped.
  $FFD8 save RAM to device

c $FFDB set the real time clock
D $FFDB the system clock is maintained by an interrupt routine that updates the clock every 1/60th of a second. The clock is three bytes long which gives the capability to count from zero up to 5,184,000 jiffies - 24 hours plus one jiffy. At that point the clock resets to zero. Before calling this routine to set the clock the new time, in jiffies, should be in `YXA`, the accumulator containing the most significant byte.
  $FFDB set real time clock

c $FFDE read the real time clock
D $FFDE this routine returns the time, in jiffies, in `AXY`. The accumulator contains the most significant byte.
  $FFDE read real time clock

c $FFE1 scan the stop key
D $FFE1 if the STOP key on the keyboard is pressed when this routine is called the Z flag will be set. All other flags remain unchanged. If the STOP key is not pressed then the accumulator will contain a byte representing the last row of the keyboard scan. The user can also check for certain other keys this way.
  $FFE1 do scan stop key

c $FFE4 get character from input device
D $FFE4 in practice this routine operates identically to the CHRIN routine, #R$FFCF, for all devices except for the keyboard. If the keyboard is the current input device this routine will get one character from the keyboard buffer. It depends on the IRQ routine to read the keyboard and put characters into the buffer. If the keyboard buffer is empty the value returned in the accumulator will be zero.
  $FFE4 do get character from input device

c $FFE7 close all channels and files
D $FFE7 this routine closes all open files. When this routine is called, the pointers into the open file table are reset, closing all files. Also the routine automatically resets the I/O channels.
  $FFE7 do close all channels and files

c $FFEA increment real time clock
D $FFEA this routine updates the system clock. Normally this routine is called by the normal KERNAL interrupt routine every 1/60th of a second. If the user program processes its own interrupts this routine must be called to update the time. Also, the STOP key routine must be called if the stop key is to remain functional.
  $FFEA increment real time clock

c $FFED return X,Y organization of screen
D $FFED this routine returns the x,y organisation of the screen in `X`,`Y`
  $FFED return X,Y organization of screen

c $FFF0 read/set X,Y cursor position
D $FFF0 this routine, when called with the carry flag set, loads the current position of the cursor on the screen into the `X` and `Y` registers. `X` is the column number of the cursor location and `Y` is the row number of the cursor. A call with the carry bit clear moves the cursor to the position determined by the `X` and `Y` registers.
  $FFF0 read/set X,Y cursor position

c $FFF3 return the base address of the I/O devices
D $FFF3 this routine will set `XY` to the address of the memory section where the memory mapped I/O devices are located. This address can then be used with an offset to access the memory mapped I/O devices in the computer.
  $FFF3 return the base address of the I/O devices

t $FFF6 RRBY
  $FFF6,4

w $FFFA hardware vectors
  $FFFA NMI vector
  $FFFC RESET vector
  $FFFE IRQ vector
