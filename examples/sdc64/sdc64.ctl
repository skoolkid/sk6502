; Copyright 2021 Richard Dymond (rjdymond@gmail.com)
;
; SkoolKit control file for the Commodore 64 version of Skool Daze.
;
; First install SkoolKit, and copy the 'sk6502' directory (which contains the
; SkoolKit components for MOS 6502 disassembly) and templates.ini into the
; current directory alongside this control file (sdc64.ctl) and the other
; source files.
;
; Next, obtain a VSF snapshot of Skool Daze, and use it to build a skool file:
;
; $ sna2skool.py skooldaze.vsf > sdc64.skool
;
; To convert the skool file into an HTML disassembly:
;
; $ skool2html.py sdc64.skool
;
; To convert the skool file into an assembly language source file:
;
; $ skool2asm.py -w sdc64.skool > sdc64.asm
;
; To convert the skool file into a memory dump:
;
; $ skool2bin.py sdc64.skool

@ $0002 start
@ $0002 org
@ $0002 set-handle-unsupported-macros=1
@ $0002 expand=#DEF1(#ZXR(addr)(text) #HTML(<a href="https://skoolkid.github.io/skooldaze/asm/{addr:04X}.html">{text}</a>))
@ $0002 expand=#DEF1(#ZX(addr) #HTML(This corresponds to #ZXR{addr}(${addr:04X}) in the ZX Spectrum version.))
@ $0002 expand=#DEF1(#AS(state)(text) #LINK:AnimatoryStates#{state:02X}({text}))
@ $0002 expand=#DEF1(#SPRITE(addr) #UDGARRAY3,$0F;{addr}-({addr}+$32)-1-$18,,3{{height=42}}(s{addr:04x}))
@ $0002 expand=#DEF(#A(addr) #R$addr($#N($addr,,,,1)))
@ $0002 expand=#DEF(#BUG #LINK:Bugs)
@ $0002 replace=/`([AXY]+)`/#REG(\1)
@ $0002 defs=$FE
u $0002 Unused
B $0002,1,1
g $0003 Teachers' safe combination letters
D $0003 #ZX$7FA3
D $0003 Used by the routines at #A$292F and #A$298B. The safe combination itself is stored at #A$90.
B $0003,1,1 MR WACKER's safe combination letter is stored here.
B $0004,1,1 MR ROCKITT's safe combination letter is stored here.
B $0005,1,1 MR WITHIT's safe combination letter is stored here.
B $0006,1,1 MR CREAK's safe combination letter is stored here.
b $0007 Temporary variables
B $0007,1,1 Used by the routine at #A$0E59 and #A$0ECF.
B $0008,2,1 Used by the routines at #A$0C3F and #A$1B2E.
B $000A,1,1 Used by the routines at #A$0E59, #A$1BFA, #A$27D2 and #A$2B52.
B $000B,1,1 Used by the routines at #A$0E59, #A$0ECF, #A$1BFA, #A$27D2, #A$29C8 and #A$2B52.
B $000C,1,1 Used by the routines at #A$1BFA, #A$27D2, #A$29C8 and #A$2B52.
B $000D,2,1 Used by the routine at #A$1BFA.
u $000F ERIC's knockout counter (unused)
D $000F Used by the unused routine at #A$3472.
B $000F,1,1
g $0010 ERIC's midstride and post-midstride y-coordinate increments
D $0010 Used by the routines at #A$34B5, #A$350B, #A$3558, #A$35EF and #A$365C.
B $0010,1,1 ERIC's midstride y-coordinate increment.
B $0011,1,1 ERIC's post-midstride y-coordinate increment.
b $0012 Temporary variable
D $0012 Used by the routines at #A$1C8E, #A$3558, #A$359E and #A$3687.
B $0012,1,1
b $0013 Unused variable
D $0013 Set to 5 by the routine at #A$364E, but never used.
B $0013,1,1
g $0014 ERIC's posture indicator
D $0014 Used by the routines at #A$0800, #A$149F, #A$15B3, #A$169B, #A$19A5, #A$29C8, #A$2D47, #A$3472 and #A$3687. Holds $FF if ERIC is standing up, or $00 otherwise (meaning he's sitting on a chair, a staircase or the floor, or he's lying on his back).
B $0014,1,1
b $0015 Temporary variables
B $0015,2,1 Used by the routines at #A$11CF, #A$1294, #A$1468 and #A$16E9 to store blackboard character cell coordinates.
B $0017,2,2 Used by the routines at #A$13D5, #A$1421 and #A$1445 to store a blackboard buffer address.
b $0019 Blackboard pixel column counter
D $0019 Used by the routines at #A$1129, #A$11CF and #A$16E9.
B $0019,1,1
b $001A Number of the character who last wrote on the blackboard
D $001A Used by the routines at #A$0A58, #A$1129, #A$16E9, #A$176F, #A$19A5 and #A$1FA0.
B $001A,1,1
b $001B Temporary variables
B $001B,2,1 Used by the routines at #A$11CF, #A$1294 and #A$1994.
B $001D,2,1 Used by the routines at #A$108B and #A$2AAA.
u $001F Unused
B $001F,2,2
b $0021 Temporary variables
D $0021 Used by the routine at #A$11CF.
B $0021,3,1
u $0024 Unused
B $0024,2,2
b $0026 Animatory state
D $0026 Used by the routines at #A$0800, #A$0C3F, #A$0FBA, #A$1129, #A$12B5, #A$136F, #A$13F3, #A$149F, #A$15B3, #A$1640, #A$169B, #A$16E9, #A$176F, #A$17E5, #A$191B, #A$1A04, #A$1A51, #A$1B2E, #A$1C59, #A$1CB4, #A$1CCB, #A$1CEC, #A$267A, #A$2696, #A$26E0, #A$270D, #A$27D2, #A$2873, #A$2A43, #A$2B21, #A$2B3F, #A$2B52, #A$2B9F, #A$2CA5, #A$322E, #A$3472, #A$34B5, #A$350B, #A$3558, #A$359E, #A$35EF, #A$364E, #A$365C and #A$3687.
B $0026,1,1
b $0027 Temporary variables
D $0027 Used by the routines at #A$2EE6, #A$2F8C, #A$31EA and #A$3326.
B $0027,2,1
b $0029 Primary command routine address
D $0029 Used by the routines at #A$0B3B, #A$12B5, #A$1A04, #A$1D16, #A$1D2D, #A$1EE3, #A$1F4D, #A$1F77, #A$1FA0, #A$27AB, #A$2E13 and #A$3B5E.
W $0029,2,2
g $002B ERIC's status flags
D $002B #ZX$7FFB
D $002B Used by the routines at #A$0800, #A$15B3, #A$169B, #A$191B, #A$1BFA, #A$1EC2, #A$2696, #A$2757, #A$28BC, #A$290F, #A$29C8, #A$2D47 and #A$3472. If ERIC is doing anything other than walking or standing still, one of the bits here will be set.
D $002B #TABLE(default,centre,:w,centre,:w)<nowrap> { =h Bit | =h Meaning if set } { 0      | ERIC is firing the catapult. } { 1      | ERIC is jumping. } { 2      | ERIC is hitting. } { 3      | ERIC is writing on a blackboard. } { 4      | ERIC has just been knocked down or unseated. } { 5      | ERIC is being spoken to by little boy no. 10. } { 6      | ERIC is immobilised. } { 7      | Unused. } TABLE#
B $002B,1,1
g $002C Sound effect identifier
D $002C Used by the routines at #A$189D, #A$2BB0, #A$2D47, #A$3AD5 and #A$BD00.
D $002C Holds one of the following values to indicate the sound effect currently being played:
D $002C #TABLE(default,centre) { =h Value | =h Sound effect } { 0        | None } { 1        | A shield has been hit } { 2        | ERIC is jumping } { 3        | Bell is ringing } TABLE#
B $002C,1,1
g $002D Sound effect timer
D $002D Used by the routines at #A$189D, #A$2BB0, #A$2D47, #A$3AD5 and #A$BD00.
B $002D,1,1
g $002E Timing counter
D $002E Used by the routines at #A$0800 at #A$39C7.
B $002E,1,1
b $002F Temporary variable
D $002F Used by the routines at #A$17E5, #A$2696 and #A$29C8.
B $002F,1,1
g $0030 ERIC's knockout delay counter
D $0030 #ZX$7FF5
D $0030 Used by the routine at #A$15B3.
B $0030,1,1
b $0031 Temporary variable
D $0031 Used by the routines at #A$2573, #A$3868 and #A$BE09.
B $0031,1,1
u $0032 Unused
B $0032,7,7
b $0039 Continual subcommand routine address
D $0039 Used by the routines at #A$2797, #A$2865, #A$2885, #A$2E13 and #A$3B5E.
W $0039,2,2
b $003B Address reached in the command list
D $003B Used by the routines at #A$2E13, #A$3B5E and #A$3BE7.
W $003B,2,2
b $003D Command list start address
D $003D Used by the routines at #A$1D4A, #A$2E13, #A$3AD5 and #A$3B5E.
W $003D,2,2
b $003F Various flags
D $003F This byte holds various flags. These flags are checked by the character-moving routine at #A$3B5E.
D $003F #TABLE(default,centre,:w) { =h Bit(s) | =h Description } { 0         | Unused; always reset for every character. } { 1         | Character is running continuously; reset for everyone initially; reset by the routines at #A$12B5, #A$1A04 and #A$27AB; set for a stampeding boy by the routines at #A$2797 and #A$2885; set for MR WACKER by the routine at #A$284F when he's looking for the pea-shooter. } { 2         | Always set for teachers; set for EINSTEIN by the routine at #A$1F4D when he's answering a question. } { 3         | Set for EINSTEIN by the routine at #A$1F4D when he's waiting to answer a question. } { 4, 5      | Unused; always reset for every character. } { 6         | Character is running or otherwise moving quickly; set by the routines at #A$0C3F and #A$1F4D; may be reset by the routine at #A$3B5E on a movement speed change. } { 7         | If set, the routine at #A$3B5E restarts the command list (and then resets the flag); set by the routines at #A$0EB4, #A$1D4A and #A$3AD5; additionally checked by the routine at #A$2745. } TABLE#
B $003F,1,1
g $0040 MSB of the lesson clock
D $0040 #ZX$7FF7
D $0040 Used by the routines at #A$0800, #A$0C31, #A$0EC2, #A$149F, #A$1D4A, #A$277D, #A$28BC, #A$2BB0, #A$2D47 and #A$3AD5. The LSB of the lesson clock is at #A$FD.
B $0040,1,1
g $0041 Current lesson number
D $0041 #ZX$7FF9
D $0041 Used by the routines at #A$2D47 and #A$3AD5.
B $0041,1,1
b $0042 Temporary variables
B $0042,1,1 Used by the routines at #A$3AD5 and #A$3B46 to store the current lesson identifier.
B $0043,1,1 Used by the routine at #A$3AD5 to form the MSB of the address of a character's personal timetable entry. The LSB is the lesson identifier at $42 above.
B $0044,1,1 The value $44 is placed here by the routine at #A$2D47 but never used.
u $0045 Unused
B $0045,1,1
g $0046 Game mode indicator
D $0046 #ZX$7FEA
D $0046 Used by the routines at #A$0800, #A$176F, #A$1FA0, #A$2241, #A$2573, #A$2A43, #A$2BB0, #A$2D47, #A$3B46 and #A$BE09.
D $0046 #TABLE(default,centre) { =h Value | =h Meaning } { 0        | Demo mode. } { 1        | Shields need to be flashed. } { 2        | All shields flashing; safe not open. } { 3        | ERIC has opened the safe; shields need to be unflashed. } TABLE#
B $0046,1,1
b $0047 Temporary variables
B $0047,1,1 Used by the routine at #A$13F3.
B $0048,1,1 Used by the routine at #A$12B5.
B $0049,2,1 Used by the routines at #A$11CF, #A$16E9, #A$322E and #A$36E3.
g $004B ERIC's midstride indicator
D $004B The value here is non-zero when ERIC is midstride. Used by the routines at #A$0800, #A$15B3, #A$2D47, #A$3472 and #A$365C.
B $004B,1,1
g $004C Keyboard/joystick reading
D $004C The following byte holds the result of reading the keyboard and joystick, as done by the interrupt routine at #A$39C7. It holds $00 if there was no input, the ASCII code of the key pressed (if any), or one of the following values if the joystick was moved:
D $004C #TABLE(default,centre) { =h Value | =h Meaning } { $D1     | Up ('Q' with bit 7 set) } { $C1     | Down ('A' with bit 7 set) } { $CF     | Left ('O' with bit 7 set) } { $D0     | Right ('P' with bit 7 set) } { $46     | Fire ('F') } TABLE#
D $004C Used by the routines at #A$0800, #A$184E, #A$189D, #A$290F, #A$2D47, #A$3940, #A$39C7 and #A$BE09.
B $004C,1,1
b $004D Temporary variables
B $004D,1,1 Used by the routines at #A$0800, #A$0C3F and #A$1B2E.
B $004E,2,1 Used by the routines at #A$0B3B, #A$0D67, #A$0D91, #A$0DD4, #A$0E59, #A$0ECF, #A$11CF, #A$12B5, #A$169B, #A$1B2E, #A$1BFA, #A$1D37, #A$1D4A, #A$1F77, #A$212A, #A$2156, #A$2387, #A$246B, #A$2500, #A$2620, #A$292F, #A$2BB0, #A$2CA5, #A$2D47, #A$2DAD, #A$2DCB, #A$2E05, #A$2E13, #A$2F20, #A$2F56, #A$2FB6, #A$3047, #A$3072, #A$3113, #A$31EA, #A$3279, #A$33BF, #A$3868, #A$38AC, #A$38EF, #A$392D, #A$3AD5, #A$8FE8, #A$BA90, #A$BAA3, #A$BAB4 and #A$BE09.
B $0050,2,1 Used by the routines at #A$0DD4, #A$2241, #A$2620, #A$2DCB, #A$2E13, #A$2F20, #A$2F56, #A$2FB6, #A$3047, #A$3072, #A$3113, #A$322E, #A$3326, #A$3868, #A$38AC, #A$38EF, #A$3AD5 and #A$BE09.
B $0052,2,1 Used by the routines at #A$2241, #A$24A7, #A$2FB6, #A$3072, #A$3113, #A$3326, #A$36E3 and #A$BE09.
B $0054,2,1 Used by the routines at #A$20F5, #A$292F, #A$2FB6, #A$3072, #A$3113, #A$3326 and #A$36E3.
B $0056,1,1 Used by the routines at #A$0DD4, #A$108B, #A$1294, #A$1B2E, #A$2005, #A$20F5, #A$27D2, #A$292F, #A$29C8, #A$2AF9, #A$2B0D, #A$2BB0, #A$31B6, #A$31C4, #A$31D2 and #A$36E3.
B $0057,1,1 Used by the routines at #A$09E9, #A$0C3F, #A$0DD4, #A$108B, #A$1294, #A$12B5, #A$136F, #A$1640, #A$176F, #A$184E, #A$1A04, #A$1A51, #A$1B2E, #A$1BFA, #A$1C59, #A$1D4A, #A$1DB7, #A$1EE3, #A$2005, #A$2043, #A$213B, #A$2156, #A$2241, #A$2387, #A$2696, #A$27D2, #A$292F, #A$29C8, #A$2AAA, #A$2AF9, #A$2B0D, #A$2BB0, #A$31B6, #A$31C4, #A$31D2, #A$31EA, #A$322E, #A$35EF, #A$3BE7 and #A$BD00.
g $0058 x-coordinates of the leftmost columns of the skool on screen and off
D $0058 #ZX$7F00
D $0058 Used by the routines at #A$11CF, #A$16E9, #A$2043, #A$2387, #A$2D47, #A$2EE6, #A$3012, #A$3072, #A$3113, #A$31EA, #A$322E, #A$35EF, #A$39C7 and #A$3A90.
B $0058,1,1 x-coordinate of the leftmost column of the skool on screen (x, say).
B $0059,1,1 x-coordinate of the leftmost column of the skool off screen (x+40).
b $005A Temporary variables
B $005A,2,2 Used by the routines at #A$2D47, #A$2EE6, #A$2F8C, #A$3072, #A$3113 and #A$3326.
B $005C,2,1 Used by the routines at #A$2D47, #A$2EE6, #A$2F8C, #A$3072, #A$3113, #A$3326, #A$9868 and #A$98E8.
b $005E Vector used for addressing the play area tile back buffer
D $005E Initialised to #A$4000 by the routine at #A$2D47, and used by the routine at #A$3326.
W $005E,2,2
g $0060 Current character number ($00-$14)
D $0060 Used by the routines at #A$0800, #A$09E9, #A$1129, #A$149F, #A$15B3, #A$1640, #A$17E5, #A$191B, #A$1D4A, #A$1EE3, #A$1F29, #A$1FA0, #A$2241, #A$2387, #A$2696, #A$27D2, #A$298B, #A$29C8, #A$2A43, #A$2B52, #A$2D47, #A$2E13, #A$3279, #A$33BF, #A$3AB4, #A$3AD5, #A$3B5E and #A$BE09.
B $0060,1,1
u $0061 Unused
B $0061,15,8,7
g $0070 Lesson descriptor
D $0070 #ZX$7FF4
D $0070 Used by the routines at #A$09E9, #A$0D91, #A$149F, #A$2573 and #A$3AD5. See the list of lesson descriptors at #A$8CE0.
B $0070,1,1
g $0071 Character number of the teacher who last gave ERIC lines
D $0071 #ZX$7FF3
D $0071 Used by the routine at #A$149F.
B $0071,1,1
b $0072 Temporary variables
B $0072,1,1 Used by the routines at #A$0B3B, #A$0ECF, #A$149F, #A$191B, #A$1DB7, #A$2552, #A$8FE8 and #A$BE09.
B $0073,4,1 Used by the routines at #A$0BAC and #A$0D67 to store the coordinate ranges within which a character can see or be seen.
B $0077,1,1 Used by the routine at #A$0C3F.
B $0078,1,1 Used by the routine at #A$0E59.
B $0079,3,1 Used by the routine at #A$0ECF.
g $007C Score
D $007C #ZX$7FC4
D $007C Used by the routines at #A$0800, #A$1D37, #A$2BB0 and #A$2E13.
B $007C,2,1
g $007E Lines total
D $007E #ZX$7FC6
D $007E Used by the routines at #A$0800, #A$1D4A and #A$2E13.
B $007E,2,1
u $0080 Unused
B $0080,1,1
g $0081 ERIC's stand-up delay counter
D $0081 #ZX$7FC1
D $0081 Used by the main loop at #A$0800.
B $0081,1,1
g $0082 Interrupt counter
D $0082 Incremented on every pass through the interrupt routine at #A$39C7, and used by the main loop at #A$0800 to adjust ERIC's walking speed in demo mode.
B $0082,1,1
u $0083 Unused
B $0083,1,1
b $0084 Temporary variables
B $0084,1,1 Used by the routines at #A$1DB7, #A$1F29 and #A$2043.
B $0085,1,1 Used by the routine at #A$1DB7.
B $0086,2,1 Used by the routines at #A$0A58, #A$1DB7, #A$1F29, #A$1F3A, #A$2043 and #A$298B.
B $0088,2,1 Used by the routines at #A$1DB7, #A$1F3A, #A$2043 and #A$298B.
B $008A,1,1 Used by the routine at #A$217E.
B $008B,1,1 Used by the routines at #A$217E and #A$2241.
B $008C,1,1 Used by the routines at #A$217E, #A$2241 and #A$2500.
B $008D,2,1 Used by the routines at #A$1DB7, #A$217E, #A$2241 and #A$2500.
u $008F Unused
B $008F,1,1
g $0090 Safe combination code
D $0090 #ZX$7F9F
D $0090 Used by the routines at #A$176F, #A$1F3A and #A$292F. The teachers' safe combination letters are stored at #A$03.
B $0090,4,1
g $0094 MR CREAK's year of birth
D $0094 #ZX$7F9B
D $0094 Used by the routines at #A$1FA0 and #A$2AAA.
B $0094,4,1
u $0098 Unused
B $0098,2,2
b $009A Temporary variables
B $009A,1,1 Used by the routine at #A$2043.
B $009B,2,1 Used by the routines at #A$2043 and #A$3724.
B $009D,1,1 Used by the routines at #A$2043, #A$20F5, #A$213B, #A$2573, #A$2620, #A$2BB0 and #A$BE09.
B $009E,2,1 Used by the routine at #A$20F5.
u $00A0 Unused
B $00A0,2,2
b $00A2 Temporary variables
B $00A2,1,1 Used by the routines at #A$212A, #A$213B and #A$2156 to store the text graphic buffer pixel column counter.
B $00A3,1,1 Used by the routines at #A$1DB7, #A$217E, #A$2241, #A$2500 and #A$2620.
B $00A4,1,1 Used by the routines at #A$217E, #A$2241, #A$2500 and #A$2620.
g $00A5 Identifier for MR CREAK's birth year battle
D $00A5 #ZX$7F9A
D $00A5 Used by the routines at #A$2241 and #A$2AAA.
B $00A5,1,1
b $00A6 Destination coordinates or walkabout parameters
D $00A6 Used by the routines at #A$105B, #A$12B5, #A$1A04, #A$27AB, #A$284F, #A$28BC and #A$2E13.
B $00A6,1,1 Destination x-coordinate or walkabout event identifier.
B $00A7,1,1 Destination y-coordinate or walkabout origin x-coordinate.
b $00A8 Number of mini-walkabouts remaining
D $00A8 Used by the routines at #A$12B5, #A$27AB and #A$2E13.
B $00A8,1,1
b $00A9 Message repetition delay counter
D $00A9 Used by the routines at #A$28BC and #A$2E13.
B $00A9,1,1
b $00AA Interruptible subcommand routine address
D $00AA Used by the routines at #A$0C3F, #A$0EB4, #A$1129, #A$12B5, #A$136F, #A$16E9, #A$1A04, #A$1D28, #A$1EE3, #A$1F77, #A$1FA0, #A$2241, #A$2387, #A$2E13 and #A$3B5E.
W $00AA,2,2
b $00AC Bytes $6B and and $6C of the character's buffer
D $00AC Holds one of the following:
D $00AC #LIST { address of the next character in the message being written on a blackboard or spoken } { coordinates of the next location to move to in pursuit of ERIC } { number of movements remaining to navigate a staircase ($AC) } { walkabout or intermediate destination x-coordinate ($AC) } { walkabout or intermediate destination pace counter ($AD) } { number of movements remaining to wipe the blackboard ($AC) } { x-coordinate of the next column of the blackboard to wipe ($AD) } LIST#
D $00AC Used by the routines at #A$09E9, #A$0A58, #A$0C3F, #A$0E35, #A$108B, #A$1129, #A$12B5, #A$136F, #A$13F3, #A$16E9, #A$1A04, #A$1EE3, #A$1FA0, #A$2241, #A$246B, #A$2500, #A$2757, #A$277D, #A$28BC, #A$2E13 and #A$BE09.
B $00AC,2,1
b $00AE Bytes $6D and and $6E of the character's buffer
D $00AE Holds one of the following:
D $00AE #LIST { address of the next character in the submessage being written on a blackboard or spoken } { address of the routine to call after the character has found ERIC } { y-coordinate of the top row of the blackboard being wiped ($AE) } LIST#
D $00AE Used by the routines at #A$0B3B, #A$108B, #A$1129, #A$16E9, #A$2387, #A$2A99 and #A$2E13.
B $00AE,2,1
b $00B0 Uninterruptible subcommand routine address
D $00B0 Used by the routines at #A$0FBA, #A$1CB4, #A$1CCB, #A$1D16, #A$1D32, #A$267A, #A$2696, #A$26E0, #A$270D, #A$27D2, #A$29C8, #A$2B21, #A$2B3F, #A$2B52, #A$2B9F, #A$2CA5, #A$2E13 and #A$3B5E.
W $00B0,2,2
b $00B2 Knockout delay or pellet distance counter
D $00B2 Holds one of the following:
D $00B2 #LIST { counter determining how much longer the character will stay down after being punched, hit by a catapult pellet, knocked out of a chair, or tripped up by a stampeding kid } { distance remaining for a catapult pellet to travel } LIST#
D $00B2 Used by the routines at #A$0FBA, #A$1042, #A$29C8, #A$2A43, #A$2B52, #A$2BB0 and #A$2E13.
B $00B2,1,1
b $00B3 Pre-action animatory state
D $00B3 Holds a character's animatory state as it was before he is knocked over, throws a punch (ANGELFACE), or fires a catapult (BOY WONDER).
D $00B3 Used by the routines at #A$267A, #A$26E0, #A$2A43, #A$2B21 and #A$2E13.
B $00B3,1,1
b $00B4 Unused variable
D $00B4 Initialised to zero by the routine at #A$2E13, but never used.
B $00B4,1,1
b $00B5 Dethroning delay counter
D $00B5 Used by the routines at #A$1CB4, #A$1CCB and #A$2E13.
B $00B5,1,1
u $00B6 Unused
B $00B6,10,2,8
b $00C0 Temporary variables
B $00C0,1,1 Used by the routines at #A$0A58, #A$191B and #A$2241.
B $00C1,1,1 Used by the routines at #A$17E5 and #A$2241.
g $00C2 Birth year question indicator
D $00C2 Used by the routines at #A$2241 and #A$3AD5.
B $00C2,1,1
b $00C3 Temporary variable
D $00C3 Used by the routine at #A$2241.
B $00C3,1,1
u $00C4 Unused
B $00C4,1,1
g $00C5 Copy of keyboard/joystick reading
D $00C5 This byte holds a copy of the keyboard/joystick reading at #A$4C. It is copied here by the routine at #A$0800. Also used by the routines at #A$290F and #A$365C.
B $00C5,1,1
g $00C6 Lines-giving delay counter
D $00C6 #ZX$7FF2
D $00C6 Used by the routine at #A$149F.
B $00C6,1,1
b $00C7 Temporary variable
D $00C7 Used by the routines at #A$0D91 and #A$149F to store the identifier for ERIC's location.
B $00C7,1,1
g $00C8 Identifier of next lines reprimand for the teacher fetching the truant ERIC
D $00C8 Used by the routines at #A$149F and #A$3AD5.
B $00C8,1,1
g $00C9 Shield/safe timing counter
D $00C9 Used by the routine at #A$39C7.
B $00C9,1,1
b $00CA Temporary variables
D $00CA Used by the routine at #A$3940.
B $00CA,2,1
u $00CC Unused
B $00CC,2,2
b $00CE Temporary variables
B $00CE,2,2 Used by the routine at #A$3940.
B $00D0,1,1 Used by the routine at #A$1DB7.
B $00D1,1,1 Used by the routine at #A$2387.
g $00D2 ERIC's pre-action animatory state
D $00D2 Set by the routine at #A$169B and then used by the routine at #A$191B.
B $00D2,1,1
b $00D3 Temporary variables
D $00D3 Used by the routine at #A$1640.
B $00D3,2,1
g $00D5 Safe status indicator
D $00D5 Holds $FF if the safe is flashing, $00 otherwise. Used by the routines at #A$176F, #A$2BB0 and #A$39C7.
B $00D5,1,1
b $00D6 Temporary variables
B $00D6,2,2 Used by the routines at #A$2005, #A$2043, #A$2573, #A$2620, #A$2BB0, #A$8FE8 and #A$BE09.
B $00D8,1,1 Used by the routines at #A$0B3B, #A$0ECF, #A$149F, #A$191B, #A$1DB7 and #A$2552 to store a lines reprimand identifier.
g $00D9 Shield counter
D $00D9 #ZX$7FEB
D $00D9 Used by the routines at #A$2BB0 and #A$2D47.
B $00D9,1,1
b $00DA Temporary variables
B $00DA,1,1 Used by the routines at #A$1129, #A$1468, #A$16E9 and #A$19A5 to store a blackboard identifier.
B $00DB,2,1 Used by the routines at #A$191B and #A$2B52.
u $00DD Unused
B $00DD,2,2
b $00DF Last four bytes of the blackboard's buffer
D $00DF Used by the routines at #A$176F, #A$184E, #A$19A5 and #A$1FA0.
B $00DF,4,1
b $00E3 Temporary variables
D $00E3 Used by the routine at #A$253E.
B $00E3,2,1
g $00E5 ERIC's midstride and input timer
D $00E5 Decremented on each pass through the main loop at #A$0800. When the timer reaches zero, either ERIC is moved from the midstride position (if he is midstride), or the keyboard/joystick input is checked, whereupon the timer is reset to 4. It is initialised to 1 by the routine at #A$2D47, and reset to either 2 or 6 by the routine at #A$365C after moving ERIC midstride.
B $00E5,1,1
b $00E6 Temporary variable
D $00E6 Used by the routine at #A$2620.
B $00E6,1,1
u $00E7 Unused
B $00E7,2,2
b $00E9 Temporary variables
D $00E9 Used by the routine at #A$176F.
B $00E9,2,1
g $00EB Keyboard delay counter
D $00EB Used by the routines at #A$2D47 and #A$3940.
B $00EB,1,1
b $00EC Temporary variables
B $00EC,1,1 Used by the routine at #A$149F.
B $00ED,4,2,1 Used by the routine at #A$39C7.
u $00F1 Unused
B $00F1,1,1
b $00F2 Temporary variables
B $00F2,2,2 Used by the routines at #A$39C7 and #A$3A90.
B $00F4,1,1 Used by the routine at #A$39C7.
B $00F5,1,1 Used by the routine at #A$3A90.
B $00F6,1,1 Used by the routines at #A$1DB7 and #A$298B.
g $00F7 Hi-score
D $00F7 #ZX$7FC2
D $00F7 Used by the routine at #A$2E13.
@ $00F7 keep
W $00F7,2,2
u $00F9 Unused
B $00F9,2,2
b $00FB Character's (y,x) coordinates
D $00FB Used by the routines at #A$09E9, #A$0A58, #A$0BAC, #A$0C3F, #A$0E59, #A$0ECF, #A$0FBA, #A$1042, #A$12B5, #A$136F, #A$13F3, #A$1468, #A$1640, #A$16E9, #A$176F, #A$17E5, #A$189D, #A$19A5, #A$1A04, #A$1A51, #A$1B2E, #A$1BFA, #A$1C8E, #A$1CCB, #A$2043, #A$2387, #A$2696, #A$270D, #A$27AB, #A$27D2, #A$2873, #A$29C8, #A$2B52, #A$2CA5, #A$322E, #A$34B5, #A$350B, #A$3558, #A$359E, #A$35EF, #A$365C, #A$3687 and #A$BE09.
B $00FB,1,1 y-coordinate.
B $00FC,1,1 x-coordinate.
g $00FD LSB of the lesson clock
D $00FD #ZX$7FF7
D $00FD Used by the routines at #A$0800, #A$270D, #A$292F, #A$2BB0 and #A$2D47. The MSB of the lesson clock is at #A$40.
B $00FD,1,1
g $00FE ERIC's action timer
D $00FE #ZX$7FF6
D $00FE Used by the routines at #A$169B, #A$17E5, #A$184E, #A$189D, #A$191B and #A$2D47.
B $00FE,1,1
b $00FF Movement speed change delay counter
D $00FF Used by the character-moving routine at #A$3B5E.
B $00FF,1,1
i $0100
B $0100,1792,16
c $0800 Main loop
D $0800 We start here after the game has loaded.
C $0800,3 Initialise interrupts, screen memory and page 0.
N $0803 This entry point is used by the routine at #A$2757 to enter demo mode after a game has ended.
C $0803,2 Pick up the game mode indicator from #A$46.
C $0805,2 Branch if we're in demo mode.
C $0807,3 Change the characters' names if required.
C $080A,3 Change the lesson.
C $080D,3 Play the theme tune.
C $0810,3 Bring the skool into view.
N $0813 The main loop proper starts here.
C $0813,4 Initialise the timing counter at #A$2E to 1.
C $0817,2 Decrement the LSB of the lesson clock at #A$FD.
C $0819,2 Branch unless it's zero.
C $081B,2 Decrement the MSB of the lesson clock at #A$40.
C $081D,2 Branch unless it's zero.
C $081F,3 Change the lesson.
C $0822,3 Make any nearby teacher give ERIC lines if necessary.
C $0825,3 Manage any sound effect that is currently playing.
C $0828,2 Pick up ERIC's status flags from #A$2B.
C $082A,2 Branch if ERIC is walking or standing still.
C $082C,3 Deal with ERIC if he's doing something other than walking or standing still.
C $082F,12 Move four characters.
C $083B,3 Jump forward.
C $083E,12 Move four characters.
C $084A,5 Set voice #3 control register: voice off, noise enabled.
C $084F,2 Decrement ERIC's midstride and input timer at #A$E5.
C $0851,2 Branch if it's zero now.
C $0853,3 Otherwise jump forward to update the display before returning to the start of the main loop.
N $0856 The timer at #A$E5 has reached zero. Time to either move ERIC from the midstride position or check for input from the keyboard or joystick.
C $0856,2 Pick up the game mode indicator from #A$46.
C $0858,2 Branch unless we're in demo mode.
C $085A,8 Copy the keyboard/joystick reading from #A$4C to #A$C5 and reset #A$4C to zero.
C $0862,2 Pick up the keyboard/joystick reading from #A$C5.
C $0864,2 Branch if there was no keyboard or joystick input.
C $0866,4 Set the game mode indicator at #A$46 to 1.
C $086A,3 Jump back to start a new game.
C $086D,3 Jump forward to continue with demo mode.
C $0870,2 Pick up the current character number from #A$60.
C $0872,1 Save it temporarily.
C $0873,2 Character number $14 is ERIC.
C $0875,2 Update the current character number at #A$60.
C $0877,3 Copy ERIC's character buffer into page 0.
C $087A,2 Pick up ERIC's midstride indicator from #A$4B.
C $087C,2 Branch if it's zero (ERIC is not midstride).
C $087E,3 Otherwise jump forward to move ERIC from the midstride position.
N $0881 Now we check for input from the keyboard or joystick.
C $0881,8 Copy the keyboard/joystick reading from #A$4C to #A$C5 and then reset #A$4C to zero.
C $0889,2 Pick up the keyboard/joystick reading from #A$C5.
C $088B,2 Branch if there was any input.
C $088D,3 Otherwise jump forward.
C $0890,4 Reset ERIC's midstride and input timer at #A$E5 to 4.
C $0894,2 Pick up the keyboard/joystick reading from #A$C5.
C $0896,2 Clear bit 7 (which is set for joystick input).
C $0898,2 Was 'O' pressed or the joystick moved left?
C $089A,2 Branch if not.
C $089C,3 Handle this keypress ('O', left).
C $089F,3 Jump forward.
C $08A2,2 Was 'P' pressed or the joystick moved right?
C $08A4,2 Branch if not.
C $08A6,3 Handle this keypress ('P', right).
C $08A9,3 Jump forward.
C $08AC,2 Was 'Q' pressed or the joystick moved up?
C $08AE,2 Branch if not.
C $08B0,3 Handle this keypress ('Q', up).
C $08B3,3 Jump forward.
C $08B6,2 Was 'A' pressed or the joystick moved down?
C $08B8,2 Branch if not.
C $08BA,3 Handle this keypress ('A', down).
C $08BD,3 Jump forward.
C $08C0,2 Was 'S' (sit/stand) pressed?
C $08C2,2 Branch if not.
C $08C4,3 Handle this keypress ('S', sit/stand).
C $08C7,3 Jump forward.
C $08CA,2 Was 'H' (hit) pressed?
C $08CC,2 Branch if not.
C $08CE,3 Handle this keypress ('H', hit).
C $08D1,3 Jump forward.
C $08D4,2 Was 'W' (write) pressed?
C $08D6,2 Branch if not.
C $08D8,3 Handle this keypress ('W', write).
C $08DB,3 Jump forward.
C $08DE,2 Was 'J' (jump) pressed?
C $08E0,2 Branch if so.
C $08E2,2 Was 'L' (jump) pressed?
C $08E4,2 Branch if not.
C $08E6,3 Handle this keypress ('J' or 'L', jump).
C $08E9,3 Jump forward.
C $08EC,2 Was 'F' or the joystick fire button pressed?
C $08EE,2 Branch if so.
C $08F0,2 Was SPACE (fire catapult) pressed?
C $08F2,2 Branch if not.
C $08F4,3 Handle this keypress ('F' or SPACE, fire).
C $08F7,3 Jump forward.
N $08FA There was no keyboard input or joystick movement.
C $08FA,2 Increment ERIC's midstride and input timer at #A$E5 to 1.
C $08FC,3 Jump forward.
N $08FF ERIC is midstride.
C $08FF,4 Reset ERIC's midstride and input timer at #A$E5 to 4.
C $0903,4 Clear ERIC's midstride indicator at #A$4B.
C $0907,3 Move ERIC from the midstride position.
C $090A,3 Restore the current character number to #A$60.
C $090D,3 Jump forward.
C $0910,3 Restore ERIC's character buffer from page 0.
C $0913,3 Restore the current character number to #A$60.
C $0916,3 Update the display.
C $0919,4 Wait until the interrupt routine at #A$39C7 has decremented the timing counter at #A$2E below 0.
C $091D,3 Jump back to the start of the main loop.
N $0920 We're in demo mode and there was no keyboard or joystick input.
C $0920,6 Set the score at #A$7C to zero.
C $0926,4 Set the lines total at #A$7E to zero.
C $092A,3 Pick up the current character number from #A$60 and save it temporarily.
C $092D,4 Set the current character number at #A$60 to $14 (ERIC).
C $0931,3 Copy ERIC's character buffer to page 0.
C $0934,2 Pick up ERIC's midstride indicator from #A$4B.
C $0936,2 Branch if it's zero (ERIC is not midstride).
C $0938,2 Otherwise branch back to move ERIC from the midstride position.
C $093A,2 Pick up ERIC's animatory state from #A$26.
C $093C,2 Is ERIC sitting on a chair?
C $093E,2 Branch if so.
C $0940,2 Pick up ERIC's posture indicator from #A$14.
C $0942,2 Branch if ERIC is not standing up.
C $0944,2 Pick up ERIC's status flags from #A$2B.
C $0946,2 Has ERIC just been knocked down or unseated?
C $0948,2 Branch if so.
C $094A,2 Otherwise branch forward.
C $094C,4 Set the current character number at #A$60 to $0A (little boy no. 11).
C $0950,3 Copy little boy no. 11's character buffer to page 0.
C $0953,2 Pick up little boy no. 11's animatory state from #A$26.
C $0955,2 Is he sitting on a chair?
C $0957,2 Branch if not.
C $0959,3 Jump forward.
N $095C ERIC is sitting in a chair, but little boy no. 11 isn't. ERIC should stand up now or soon.
C $095C,2 Pick up ERIC's stand-up delay counter from #A$81.
C $095E,2 Branch unless it's zero at the moment.
C $0960,4 Initialise ERIC's stand-up delay counter at #A$81 to $40 (little boy no. 11 has only just stood up).
C $0964,3 Jump forward.
C $0967,2 Decrement ERIC's stand-up delay counter at #A$81.
C $0969,2 Branch unless it's time for ERIC to stand up.
C $096B,4 Store the code for 'S' (sit/stand) at #A$C5.
C $096F,3 Jump forward.
C $0972,4 Character number $0A is little boy no. 11. Store this character number at #A$4D for the following subroutine call.
C $0976,3 Determine ERIC's next move in his pursuit of little boy no. 11.
C $0979,2 Branch if ERIC will stay where he is.
C $097B,2 Should ERIC go (or continue going) upstairs?
C $097D,2 Branch if not.
C $097F,2 This is the code for 'Q' (up).
C $0981,3 Jump forward to store this code at #A$C5.
C $0984,2 Should ERIC go (or continue going) downstairs?
C $0986,2 Branch if not.
C $0988,2 This is the code for 'A' (down).
C $098A,3 Jump forward to store this code at #A$C5.
C $098D,2 Should ERIC go left?
C $098F,2 Branch if not.
C $0991,2 This is the code for 'O' (left).
C $0993,3 Jump forward to store this code at #A$C5.
C $0996,2 This is the code for 'P' (right).
C $0998,2 Store the code for the simulated keypress at #A$C5.
C $099A,2 Pick up the value of the interrupt counter from #A$82.
C $099C,2 Is it $81 or more?
C $099E,2 Branch if so.
C $09A0,3 Otherwise jump forward.
C $09A3,7 Set bit 7 of the simulated keyboard/joystick reading at #A$C5. This makes ERIC move faster.
C $09AA,3 Jump forward.
C $09AD,4 Set the current character number at #A$60 to $0A (little boy no. 11).
C $09B1,3 Copy little boy no. 11's character buffer to page 0.
C $09B4,2 Pick up little boy no. 11's animatory state from #A$26.
C $09B6,2 Is little boy no. 11 sitting on a chair?
C $09B8,2 Branch if so.
C $09BA,3 Otherwise jump forward.
C $09BD,4 Set the current character number at #A$60 to $14 (ERIC).
C $09C1,3 Copy ERIC's character buffer to page 0.
C $09C4,2 Pick up ERIC's animatory state from #A$26.
C $09C6,1 Is ERIC facing left?
C $09C7,2 Branch if so.
C $09C9,4 Store the code for 'O' (left) at #A$C5. This will make ERIC turn round and face left.
C $09CD,3 Jump forward.
C $09D0,4 Store the code for 'S' (sit/stand) at #A$C5.
C $09D4,4 Set the current character number at #A$60 to $14 (ERIC).
C $09D8,3 Copy ERIC's character buffer to page 0.
C $09DB,3 Jump back.
C $09DE,4 Set the current character number at #A$60 to $14 (ERIC).
C $09E2,3 Copy ERIC's character buffer to page 0.
C $09E5,3 Jump back.
u $09E8 Unused
B $09E8,1,1
c $09E9 Make a teacher conduct a class
D $09E9 #ZX$7DB2
D $09E9 Used by command lists #R$4080($80), #R$4095($82), #R$40AE($84) and #R$40C3($86).
C $09E9,2 Pick up the lesson descriptor from #A$70.
C $09EB,2 Keep only ERIC's teacher ID (bits 4-7).
C $09ED,2 Store this teacher ID at #A$57.
C $09EF,2 Pick up the teacher's character number ($0B-$0E) from #A$60.
C $09F1,3 Now `A` holds 0, 1, 2 or 3.
C $09F4,4 Shift this teacher identifier into bits 4-7 of `A`.
C $09F8,2 Are we dealing with ERIC's teacher?
C $09FA,2 Branch if not.
C $09FC,3 Start the lesson with ERIC.
N $09FF This teacher is not teaching ERIC.
C $09FF,2 Pick up the teacher's y-coordinate from #A$FB.
C $0A01,2 Is the teacher on the top floor?
C $0A03,2 Branch if so.
C $0A05,3 Jump forward.
C $0A08,2 Pick up the teacher's x-coordinate from #A$FC.
C $0A0A,2 Is the teacher in the Map Room?
C $0A0C,2 Branch if so (there's no blackboard in the Map Room).
M $0A0E,5 Place the address of the interruptible subcommand routine at #A$16E9 into the teacher's buffer and jump to it. This makes him wipe the blackboard and return here when he's done.
W $0A11,2,2
C $0A13,2 Pick up the teacher's x-coordinate from #A$FC.
C $0A15,7 Add 3 to this x-coordinate and store the result at #A$AC and #A$AD.
M $0A1C,5 Place the address of the interruptible subcommand routine at #A$136F into the teacher's buffer and jump to it. This makes him walk to the middle of the blackboard before returning here.
W $0A1F,2,2
C $0A21,3 Generate a random value in `A`.
C $0A24,2 Is it less than $AB?
C $0A26,2 Branch if so.
M $0A28,5 Place the address of the interruptible subcommand routine at #A$1129 into the teacher's buffer and jump to it. This makes him write on the blackboard and return here when he's done.
W $0A2B,2,2
C $0A2D,3 Generate a random value in `A`.
C $0A30,2 Is it less than $A1?
C $0A32,2 Branch if so.
C $0A34,8 Store #A$5CD6 (WRITE AN ESSAY WITH THIS TITLE) at #A$AC.
C $0A3C,3 Jump forward.
C $0A3F,3 Prepare a message telling the kids to go to a certain page in their books
M $0A42,5 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer and jump to it. This makes him tell the kids to write an essay or read their books, and then return here.
W $0A45,2,2
C $0A47,2 Pick up the teacher's x-coordinate from #A$FC.
C $0A49,6 Flip bits 0 and 1 and store the result at #A$AC and #A$AD.
M $0A4F,5 Place the address of the interruptible subcommand routine at #A$136F into the teacher's buffer and jump to it. This makes him turn round, walk a few paces and then return here.
W $0A52,2,2
C $0A54,3 Jump back to make the teacher turn round and walk another few paces.
c $0A57 Do nothing
D $0A57 Used by command lists #R$40DC($88), #R$40E5($8A), #R$40E7($8C), #R$40FA($8E), #R$4118($92), #R$4123($94), #R$413D($96), #R$415B($9A), #R$4166($9C), #R$4180($9E), #R$419E($A2), #R$41A9($A4) and #R$41C3($A6).
c $0A58 Make a teacher conduct a class with ERIC
D $0A58 #ZX$F300
D $0A58 Used by the routine at #A$09E9.
C $0A58,3 Wait for EINSTEIN to sit down and ERIC to show up.
N $0A5B This entry point is used by the routine at #A$0B3B.
C $0A5B,2 Event #R$4400($01): ERIC should be in class now.
C $0A5D,3 Raise the signal for this event.
C $0A60,2 Event #R$4400($02): ERIC's lesson has started.
C $0A62,3 Raise the signal for this event.
C $0A65,3 Check whether ERIC is in class.
C $0A68,3 Generate a random value in `A`.
C $0A6B,2 Should EINSTEIN tell the teacher that ERIC hit him?
C $0A6D,2 Branch if not.
C $0A6F,4 Set `YX` to #A$5AF9: Please Sir I cannot tell a lie . . ERIC hit me.
C $0A73,3 Make EINSTEIN tell the teacher that ERIC hit him.
C $0A76,2 Character number $14 is ERIC.
C $0A78,2 Lines reprimand #R$4B80($08): NOW DON'T DO IT AGAIN.
C $0A7A,3 Make the teacher give lines to EINSTEIN or ERIC.
C $0A7D,3 Check whether ERIC is in class.
C $0A80,2 Pick up the teacher's y-coordinate from #A$FB.
C $0A82,2 Is the teacher on the top floor?
C $0A84,2 Branch if not.
C $0A86,2 Pick up the teacher's x-coordinate from #A$FC.
C $0A88,2 Is the teacher in the Map Room?
C $0A8A,2 Branch if not.
C $0A8C,3 Jump forward (there's no blackboard in the Map Room).
C $0A8F,3 Get the identifier and coordinates of the blackboard next to the teacher.
C $0A92,2 Pick up the second byte of the blackboard's buffer from #A$1A.
C $0A94,2 Was ERIC the last person to write on this blackboard?
C $0A96,2 Branch if so.
C $0A98,2 Was BOY WONDER the last person to write on this blackboard?
C $0A9A,2 Branch if so.
C $0A9C,3 Jump forward.
C $0A9F,3 Generate a random value in `A`.
C $0AA2,2 Is this random value $C9 or more?
C $0AA4,2 Branch if so.
C $0AA6,2 Character number $10 is BOY WONDER.
C $0AA8,3 Jump forward.
C $0AAB,2 Character number $14 is ERIC.
C $0AAD,1 Save the character number temporarily.
C $0AAE,8 Store #A$5B12 (Please Sir I cannot tell a lie . . ERIC wrote on the blackboard) at #A$86.
C $0AB6,2 `Y` will point at the character name identifier in this message.
C $0AB8,3 Restore the character number of the boy that EINSTEIN will blame for writing on the blackboard and store it at #A$C0.
C $0ABB,2 Is EINSTEIN going to blame BOY WONDER?
C $0ABD,2 Branch if so.
C $0ABF,2 Character name identifier #R$4780($10): ERIC.
C $0AC1,3 Jump forward.
C $0AC4,2 Character name identifier #R$478E($11): BOY WONDER.
C $0AC6,2 Place the character name identifier of the boy that EINSTEIN will blame into the message at #A$5B12.
C $0AC8,4 `YX`=#A$5B12: Please Sir I cannot tell a lie . . ERIC/BOY WONDER wrote on the blackboard.
C $0ACC,3 Make EINSTEIN tell the teacher that ERIC or BOY WONDER wrote on the blackboard.
C $0ACF,2 Pick up the character number of the boy that EINSTEIN blamed for writing on the blackboard.
C $0AD1,2 Lines reprimand #R$4C80($0C): DON'T TOUCH BLACKBOARDS.
C $0AD3,3 Make the teacher give lines to ERIC, BOY WONDER or EINSTEIN.
M $0AD6,5 Place the address of the interruptible subcommand routine at #A$16E9 into the teacher's buffer and jump to it. This makes the teacher wipe the blackboard and return here when he's done.
W $0AD9,2,2
C $0ADB,2 Pick up the teacher's x-coordinate from #A$FC.
C $0ADD,7 Add 3 to this x-coordinate and store the result in the the teacher's buffer at #A$AC and #A$AD.
M $0AE4,5 Place the address of the interruptible subcommand routine at #A$136F into the teacher's buffer and jump to it. This makes the teacher walk to the middle of the blackboard before returning here.
W $0AE7,2,2
C $0AE9,3 Generate a random value in `A`.
C $0AEC,2 Should the teacher write on the blackboard?
C $0AEE,2 Branch if not.
M $0AF0,5 Place the address of the interruptible subcommand routine at #A$1129 into the teacher's buffer and jump to it. This makes him write on the blackboard and return here when he's done.
W $0AF3,2,2
C $0AF5,3 Generate a random value in `A`.
C $0AF8,2 Should the teacher tell the kids to write an essay?
C $0AFA,2 Branch if not.
C $0AFC,8 Store #A$5CD6 (WRITE AN ESSAY WITH THIS TITLE) at #A$AC.
M $0B04,5 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer and jump to it. This makes him tell the kids to write an essay or read their books, and then return here.
W $0B07,2,2
C $0B09,3 Check whether ERIC is in class.
C $0B0C,2 Pick up the teacher's x-coordinate from #A$FC.
C $0B0E,6 Flip bits 0 and 1 of this x-coordinate and store the result in the teacher's buffer at #A$AC and #A$AD.
M $0B14,5 Place the address of the interruptible subcommand routine at #A$136F into the teacher's buffer and jump to it. This makes him turn round, walk a few paces and then return here.
W $0B17,2,2
C $0B19,3 Jump back to make the teacher turn round and walk another few paces.
C $0B1C,3 Generate a random value in `A`.
C $0B1F,2 Is this going to be a questions-and-answers lesson?
C $0B21,2 Branch if so.
C $0B23,3 Prepare a message telling the kids to go to a certain page in their books.
C $0B26,3 Jump back to make the teacher deliver this message.
N $0B29 This will be a questions-and-answers lesson.
C $0B29,3 Check whether ERIC is in class.
C $0B2C,3 Prepare a question and answer.
M $0B2F,5 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer and jump to it. This makes the teacher ask a question and then return here.
W $0B32,2,2
C $0B34,3 Wait until EINSTEIN has answered the question.
C $0B37,3 Jump back for another question and answer.
u $0B3A Unused
B $0B3A,1,1
c $0B3B Check whether ERIC and EINSTEIN are in class
D $0B3B #ZX$7CD0
D $0B3B Used by the routine at #A$0A58.
C $0B3B,8 Store the base address of EINSTEIN's character buffer (#A$8960) at #A$4E.
C $0B43,4 Pick up EINSTEIN's animatory state.
C $0B47,2 Is EINSTEIN sitting on a chair?
C $0B49,2 Branch if so.
C $0B4B,6 Pull the return address from the stack and place it at #A$29.
C $0B51,11 Subtract two from the address, making it point at the JSR instruction that called this routine. This address is now the teacher's primary command routine address.
C $0B5C,3 Return to the character-moving routine at #A$3B5E.
N $0B5F EINSTEIN is sitting on a chair. Now where's ERIC?
C $0B5F,3 Is ERIC in class?
C $0B62,2 Return if so.
C $0B64,2 Drop the return address from the stack.
C $0B66,4 `YX`=#A$5B03: Please Sir I cannot tell a lie . . ERIC is not here.
C $0B6A,3 Make EINSTEIN tell the teacher that ERIC is not here.
C $0B6D,2 Character number $11 is EINSTEIN.
C $0B6F,3 Make the teacher give EINSTEIN lines if he's in the mood.
C $0B72,3 Prepare a message telling the kids to go to a certain page in their books.
M $0B75,5 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer and jump to it. This makes the teacher tell the kids to read their books and then return here.
W $0B78,2,2
C $0B7A,3 Is ERIC in class?
C $0B7D,2 Branch if so.
C $0B7F,2 Event #R$4400($01): ERIC should be in class now.
C $0B81,3 Raise the signal for this event.
N $0B84 This entry point is used by the routine at #A$0E35.
C $0B84,8 Store the address of the routine at #A$2745 at #A$AE. This routine handles the teacher when he has found the truant ERIC.
M $0B8C,5 Place the address of the interruptible subcommand routine at #A$0C3F into the teacher's buffer and jump to it. This makes the teacher find ERIC and bring him to the classroom, and then restarts the teacher's command list.
W $0B8F,2,2
N $0B91 ERIC has shown up in class while the teacher was telling the kids to read their books.
C $0B91,2 Event #R$4400($01): ERIC should be in class now.
C $0B93,3 Has the signal already been raised for this event?
C $0B96,2 Branch if not.
C $0B98,2 Lines reprimand #R$4BE0($0B): AND STAY THIS TIME.
C $0B9A,3 Jump forward.
C $0B9D,2 Lines reprimand #R$4BC0($0A): NEVER BE LATE AGAIN.
C $0B9F,2 Store this lines reprimand identifier at #A$D8.
C $0BA1,2 Character number $14 is ERIC.
C $0BA3,2 Store this at #A$72.
C $0BA5,3 Make the teacher give lines to ERIC.
C $0BA8,3 Start or resume the lesson now that ERIC is present.
c $0BAC Compute the coordinate ranges within which a character can see or be seen
D $0BAC Used by the routines at #A$0E59 and #A$0ECF.
R $0BAC /O:(#A$73)/ Minimum y-coordinate
R $0BAC /O:(#A$74)/ Maximum y-coordinate
R $0BAC /O:(#A$75)/ Minimum x-coordinate
R $0BAC /O:(#A$76)/ Maximum x-coordinate
C $0BAC,2 Pick up the character's y-coordinate from #A$FB.
C $0BAE,3 Subtract 3 to get the minimum y-coordinate.
C $0BB1,2 Branch unless the result is negative.
C $0BB3,2 The minimum y-coordinate will be 0.
C $0BB5,2 Store the minimum y-coordinate at #A$73.
C $0BB7,2 Pick up the character's y-coordinate from #A$FB.
C $0BB9,5 Add 3 to get the maximum y-coordinate and store the result at #A$74.
C $0BBE,2 Pick up the character's y-coordinate from #A$FB.
C $0BC0,2 Is the character on the top floor?
C $0BC2,2 Branch if so.
C $0BC4,2 Is the character between the middle and top floors?
C $0BC6,2 Branch if so.
N $0BC8 The character is between the bottom and middle floors.
C $0BC8,2 Pick up the character's x-coordinate from #A$FC.
C $0BCA,5 Add 10 to get the maximum x-coordinate and store the result at #A$76.
C $0BCF,2 Pick up the character's x-coordinate from #A$FC.
C $0BD1,5 Subtract 10 from `A` to get the minimum x-coordinate and store the result at #A$75.
C $0BD6,2 Branch if the result was negative.
C $0BD8,3 Return.
C $0BDB,4 Store 0 (the minimum x-coordinate) at #A$75.
C $0BDF,3 Return.
N $0BE2 The character is between the middle and top floors.
C $0BE2,2 Pick up the character's x-coordinate from #A$FC.
C $0BE4,2 Is he to the left of the Exam Room wall?
C $0BE6,2 Branch if so.
C $0BE8,5 Add 10 to the character's x-coordinate and store it at #A$76. This is the maximum x-coordinate.
C $0BED,2 Pick up the character's x-coordinate from #A$FC.
C $0BEF,2 Is the character's x-coordinate greater than 47?
C $0BF1,2 Branch if so.
C $0BF3,4 Store the x-coordinate of the Exam Room wall (38) at #A$75: teachers can't see through it into the White Room.
C $0BF7,3 Return.
C $0BFA,2 Is the character's x-coordinate less than 28?
C $0BFC,2 Branch if so.
C $0BFE,4 Store the x-coordinate of the White Room wall (37) at #A$76: teachers can't see through it into the Exam Room.
C $0C02,3 Jump back. (This is a #BUG#invisibilityRange(bug). The jump should be to #A$0BCF instead.)
N $0C05 The character is on the top floor.
C $0C05,2 Pick up the character's x-coordinate from #A$FC.
C $0C07,2 Is the character to the left of the Map Room wall?
C $0C09,2 Branch if so.
C $0C0B,5 Add 10 to the character's x-coordinate and store it at #A$76. This is the maximum x-coordinate.
C $0C10,2 Pick up the character's x-coordinate from #A$FC.
C $0C12,2 Is the character's x-coordinate 67 or more?
C $0C14,2 Branch if so.
C $0C16,4 Store the x-coordinate of the Map Room wall (57) at #A$75: teachers can't see through it into the Reading Room.
C $0C1A,3 Return.
C $0C1D,2 Is the character's x-coordinate less than 47?
C $0C1F,2 Branch if so.
C $0C21,4 Store the x-coordinate of the Reading Room wall (56) at #A$76: teachers can't see through it into the Map Room.
C $0C25,3 Jump back. (This is a #BUG#invisibilityRange(bug). The jump should be to #A$0BCF instead.)
C $0C28,5 Add 10 to the character's x-coordinate and store it at #A$76. This is the maximum x-coordinate.
C $0C2D,3 Jump back. (This is a #BUG#invisibilityRange(bug). The jump should be to #A$0BCF instead.)
c $0C31 Adjust the lesson length if a character is looking for ERIC
D $0C31 Used by the interruptible subcommand routine at #A$0C3F after having its address placed at #A$AE by the routine at #A$2A99.
R $0C31 P Carry flag set if the character has found ERIC
C $0C31,2 Branch unless the character has found ERIC.
C $0C33,4 Set the MSB of the lesson clock at #A$40 to $0F.
C $0C37,3 Terminate the interruptible subcommand.
C $0C3A,4 Set the MSB of the lesson clock at #A$40 to $FF: the character needs more time to find ERIC.
c $0C3F Make a character track down ERIC
D $0C3F The address of this interruptible subcommand routine is placed into a character's buffer by the routines at #A$0B3B and #A$2A99.
C $0C3F,6 Set bit 6 of the flags byte at #A$3F: the character is running.
C $0C45,3 Get ERIC's coordinates.
C $0C48,4 Save ERIC's coordinates at #A$08 and #A$09.
C $0C4C,3 Is the character on a staircase?
C $0C4F,2 Branch if so.
C $0C51,2 Pick up the character's y-coordinate from #A$FB.
C $0C53,2 Is ERIC's y-coordinate less than the character's?
C $0C55,2 Branch if so.
C $0C57,2 Pick up ERIC's y-coordinate from #A$09.
C $0C59,3 Subtract the character's y-coordinate from ERIC's y-coordinate.
C $0C5C,2 Is ERIC within 4 y-coordinates of the character?
C $0C5E,2 Branch if not.
C $0C60,3 Jump forward.
C $0C63,3 Subtract ERIC's y-coordinate from the character's y-coordinate.
C $0C66,2 Is ERIC within 4 y-coordinates of the character?
C $0C68,2 Branch if not.
N $0C6A ERIC and the character looking for him are less than 4 y-coordinates away from each other.
C $0C6A,2 Pick up the character's animatory state from #A$26.
C $0C6C,1 Is he facing right?
C $0C6D,2 Branch if so.
C $0C6F,2 Pick up the character's x-coordinate from #A$FC.
C $0C71,2 Is ERIC's x-coordinate greater than the character's?
C $0C73,2 Branch if so (ERIC is behind the character).
C $0C75,2 Pick up ERIC's x-coordinate from #A$08.
C $0C77,3 Add 3 to ERIC's x-coordinate.
C $0C7A,2 Is ERIC within 3 x-coordinates in front of the character?
C $0C7C,2 Branch if not.
C $0C7E,3 Jump forward.
C $0C81,2 Pick up the character's x-coordinate from #A$FC.
C $0C83,2 Is ERIC's x-coordinate greater than the character's?
C $0C85,2 Branch if not (ERIC is behind the character).
C $0C87,2 Pick up ERIC's x-coordinate from #A$08.
C $0C89,3 Subtract 4 from ERIC's x-coordinate.
C $0C8C,2 Is ERIC within 4 x-coordinates in front of the character?
C $0C8E,2 Branch if not.
N $0C90 The character has found ERIC and is facing him.
C $0C90,1 Set the carry flag to indicate that the lesson clock can be restarted.
C $0C91,3 Jump to #A$0C31 (with the carry flag set) or #A$2745.
N $0C94 ERIC and the character looking for him are 4 or more y-coordinates away from each other.
C $0C94,4 Store ERIC's character number ($14) at #A$4D for the following subroutine call.
C $0C98,5 Determine the next move of the character in his search for ERIC and store its identifier at #A$77.
C $0C9D,3 Update the SRB for the character's current animatory state and location.
C $0CA0,2 Pick up the next move identifier from #A$77.
C $0CA2,2 Branch if there is a move to be made.
C $0CA4,3 Otherwise return.
C $0CA7,2 Should the character go left?
C $0CA9,2 Branch if not.
N $0CAB The character looking for ERIC should go left.
C $0CAB,2 Pick up the character's animatory state from #A$26.
C $0CAD,1 Is the character facing left?
C $0CAE,2 Branch if so.
C $0CB0,6 Flip bit 7 of the character's animatory state, thus turning him round.
C $0CB6,3 Update the SRB for the character's current animatory state and location.
C $0CB9,3 Is the character on a staircase?
C $0CBC,2 Branch if not.
C $0CBE,3 Otherwise return.
C $0CC1,3 Jump to #A$0C31 (with the carry flag clear) or #A$2745.
C $0CC4,6 Pick up the character's x-coordinate from #A$FC, subtract 1 from it and store the result at #A$AC.
C $0CCA,4 Pick up the character's y-coordinate from #A$FB and store it at #A$AD.
C $0CCE,2 Increment the character's animatory state.
C $0CD0,8 Replace the address of this interruptible subcommand routine in the character's buffer with that of #A$0D40 (below).
C $0CD8,3 Update the SRB for the character's new animatory state.
C $0CDB,3 Return.
C $0CDE,2 Should the character go right?
C $0CE0,2 Branch if not.
N $0CE2 The character looking for ERIC should go right.
C $0CE2,2 Pick up the character's animatory state from #A$26.
C $0CE4,1 Is the character facing left?
C $0CE5,2 Branch if so to turn him round.
C $0CE7,6 Pick up the character's x-coordinate from #A$FC, add 1 to it and store the result at #A$AC.
C $0CED,3 Jump back to move the character midstride.
C $0CF0,2 Should the character start or continue going upstairs?
C $0CF2,2 Branch if not.
N $0CF4 The character looking for ERIC should start or continue going upstairs.
C $0CF4,2 Pick up the character's x-coordinate from #A$FC.
C $0CF6,2 Is it 48 or more (on the right-hand side of the skool)?
C $0CF8,2 Branch if so.
C $0CFA,6 Reset bit 7 of the character's animatory state at #A$26, thus making him face left.
C $0D00,3 Jump forward.
C $0D03,6 Set bit 7 of the character's animatory state at #A$26, thus making him face right.
C $0D09,2 Decrement the character's y-coordinate at #A$FB.
C $0D0B,4 Pick up this new y-coordinate and store it at #A$AD.
C $0D0F,4 Pick up the character's x-coordinate from #A$FC and store it at #A$AC.
C $0D13,2 Pick up the character's animatory state from #A$26.
C $0D15,1 Is the character facing left?
C $0D16,2 Branch if so.
C $0D18,2 Increment the x-coordinate at #A$AC.
C $0D1A,3 Jump back.
C $0D1D,2 Decrement the x-coordinate at #A$AC.
C $0D1F,3 Jump back to move the character midstride.
N $0D22 The character looking for ERIC should start or continue going downstairs.
C $0D22,2 Pick up the character's x-coordinate from #A$FC.
C $0D24,2 Is it 48 or more (on the right-hand side of the skool)?
C $0D26,2 Branch if so.
C $0D28,6 Set bit 7 of the character's animatory state at #A$26, thus making him face right.
C $0D2E,3 Jump forward.
C $0D31,6 Reset bit 7 of the character's animatory state at #A$26, thus making him face left.
C $0D37,2 Increment the character's y-coordinate at #A$FB.
C $0D39,4 Pick up this new y-coordinate and store it at #A$AD.
C $0D3D,3 Jump back to compute the character's next x-coordinate.
N $0D40 The address of this entry point is placed into the character's buffer at #A$0CD0 above. It takes care of moving the character looking for ERIC from the midstride position.
C $0D40,8 Replace the address of this entry point in the character's buffer with that of the main entry point at #A$0C3F.
C $0D48,3 Update the SRB for the character's current animatory state and location.
C $0D4B,2 Pick up the character's next x-coordinate from #A$AC.
C $0D4D,2 Update the character's x-coordinate at #A$FC.
C $0D4F,2 Pick up the character's next y-coordinate from #A$AD.
C $0D51,2 Update the character's y-coordinate at #A$FB.
C $0D53,6 Pick up the character's animatory state from #A$26, clear bits 0-2, and store the result at #A$57.
C $0D59,2 Pick up the character's new x-coordinate from #A$FC.
C $0D5B,8 Adjust the character's animatory state depending on whether the new x-coordinate is even or odd.
C $0D63,3 Jump back.
c $0D67 Check whether a character is within a coordinate range
D $0D67 Used by the routines at #A$0E59 and #A$0ECF.
R $0D67 A Character number ($00-$14)
R $0D67 /(#A$73)/ Minimum y-coordinate
R $0D67 /(#A$74)/ Maximum y-coordinate
R $0D67 /(#A$75)/ Minimum x-coordinate
R $0D67 /(#A$76)/ Maximum x-coordinate
R $0D67 O:P Carry flag set if the character is within the coordinate range
C $0D67,9 Store the base address of the character's buffer at #A$4E.
C $0D70,4 Pick up the character's x-coordinate.
C $0D74,2 Is it less than the minimum x-coordinate?
C $0D76,2 Return with the carry flag reset if so.
C $0D78,2 Increment the maximum x-coordinate at #A$76. (This is a #BUG#creaksSuperiorVision(bug).)
C $0D7A,2 Is the character's x-coordinate greater than the maximum x-coordinate?
C $0D7C,2 Return with the carry flag reset if so.
C $0D7E,3 Pick up the character's y-coordinate.
C $0D81,2 Is it less than the minimum y-coordinate?
C $0D83,2 Return with the carry flag reset if so.
C $0D85,2 Increment the maximum y-coordinate at #A$74. (This is a #BUG#creaksSuperiorVision(bug).)
C $0D87,2 Is the character's y-coordinate greater than the maximum y-coordinate?
C $0D89,2 Return with the carry flag reset if so.
C $0D8B,4 Return with the the carry flag set.
C $0D8F,1 Clear the carry flag.
c $0D91 Get the identifier for ERIC's location
D $0D91 Used by the routines at #A$0B3B, #A$0E35, #A$149F and #A$2745. Obtains the identifier for ERIC's current location, which has one of the following values:
D $0D91 #TABLE(default,centre) { =h ID | =h Meaning } { 0     | ERIC should never be here (head's study or staff room) } { 1     | Reading Room } { 2     | Map Room } { 3     | White Room } { 4     | Exam Room } { 5     | Revision Library } { 6     | Dinner hall } { 7     | None of the above } TABLE#
R $0D91 /O:(#A$C7)/ ERIC's location identifier (see above)
R $0D91 O:P Zero flag set if ERIC's in the classroom he should be in
C $0D91,3 Pick up ERIC's y-coordinate from his character buffer.
C $0D94,2 Is ERIC closer to the top floor than any other?
C $0D96,2 Branch if so.
C $0D98,2 Is ERIC closer to the middle floor than any other?
C $0D9A,2 Branch if so.
C $0D9C,8 The skool region data table for the bottom floor is at #A$46B6. Store its address at #A$4E.
C $0DA4,3 Jump forward.
C $0DA7,8 The skool region data table for the middle floor is at #A$46AC. Store its address at #A$4E.
C $0DAF,3 Jump forward.
C $0DB2,8 The skool region data table for the top floor is at #A$46A0. Store its address at #A$4E.
C $0DBA,2 `Y` is the index into the skool region data table.
C $0DBC,2 Pick up an x-coordinate from the data table.
C $0DBE,3 Is it less than ERIC's x-coordinate?
C $0DC1,2 Branch if not.
C $0DC3,2 Point at the next entry in the skool region data table.
C $0DC5,3 Jump back to examine the next entry.
C $0DC8,5 Pick up the region identifier from the skool region data table and store it at #A$C7.
C $0DCD,2 Pick up the current lesson descriptor from #A$70.
C $0DCF,4 Set the zero flag if ERIC's in the classroom he should be in.
c $0DD4 Prepare message box sprite graphic data from the text graphic buffer
D $0DD4 Used by the routine at #A$2043.
R $0DD4 /(#A$57)/ $06 (top line) or $21 (bottom line)
C $0DD4,8 $45C0 is in the text graphic buffer at #A$4500. Store this address at #A$4E.
C $0DDC,11 Store the address $CAC6 or $CAE1 (in the upper and lower portions of the graphic data for the lines message sprite at $CAC0) at #A$50.
C $0DE7,2 Initialise the index in `Y`.
C $0DE9,4 Initialise the tile counter at #A$57 to 8
C $0DED,4 Initialise the byte counter at #A$56 to 8
C $0DF1,2 Pick up a byte from the text graphic buffer.
C $0DF3,2 Copy it into the sprite graphic data area at $CAC0, $CB00 or $CB40.
C $0DF5,6 Increment the text graphic buffer address at #A$4E.
C $0DFB,11 Add 3 to the sprite graphic data address at #A$50. This makes it point at the next pixel row down in the same column.
C $0E06,2 Decrement the byte counter at #A$56.
C $0E08,2 Branch back until all 8 bytes of a tile have been copied.
C $0E0A,11 Subtract 23 from the sprite graphic data address at #A$50. This makes it point at the top pixel row in the next column to the right.
C $0E15,2 Decrement the tile counter at #A$57.
C $0E17,2 Return if we're done.
C $0E19,2 Pick up the tile counter from #A$57.
C $0E1B,2 Is it 5 now?
C $0E1D,2 Branch if so.
C $0E1F,2 Is it 2 now?
C $0E21,2 Branch if so.
C $0E23,3 Jump back to copy the next tile.
C $0E26,11 Add 61 to the sprite graphic data address at #A$50. This makes it point at the top pixel row in the first tile of the next lines message sprite graphic data area at $CB00 or $CB40.
C $0E31,3 Jump back to copy the next tile.
c $0E35 Make a teacher perform dinner duty
D $0E35 #ZX$7C6E
D $0E35 Used by command list #R$423B($B8).
C $0E35,2 Event #R$4400($01): ERIC should be in the dinner hall now.
C $0E37,3 Raise the signal for this event.
C $0E3A,4 Initialise the teacher's walkabout x-coordinate at #A$AC to 62 (at the far right end of the dinner hall).
C $0E3E,3 Is ERIC in the dinner hall?
C $0E41,2 Branch if so.
C $0E43,3 Otherwise make the teacher go and find ERIC.
C $0E46,6 Flip the teacher's walkabout x-coordinate at #A$AC between 62 and 49 (the middle of the dinner hall).
C $0E4C,4 Initialise the counter at #A$AD to 0, giving the teacher more than enough time to reach his destination.
M $0E50,5 Place the address of the interruptible subcommand routine at #A$136F into the teacher's buffer and jump to it. This makes the teacher walk to either the middle or the far right end of the dinner hall.
W $0E53,2,2
C $0E55,3 Jump back to check where ERIC is.
u $0E58 Unused
B $0E58,1,1
c $0E59 Check whether a boy can be seen by a teacher
D $0E59 #ZX$6E3C
D $0E59 Used by the routines at #A$149F, #A$191B, #A$270D and #A$2CA5.
R $0E59 O:P Carry flag set if the boy can be seen by a teacher
R $0E59 O:A Teacher's character number ($0B-$0E)
C $0E59,2 `A`=$FF, corresponding to no particular teacher.
N $0E5B This entry point is used by the routine at #A$149F with `A` holding a teacher's character number.
C $0E5B,2 Store $FF or the teacher's character number at #A$78.
C $0E5D,3 Compute the coordinate ranges within which the boy can be seen.
C $0E60,2 Character number $0B is MR WACKER.
C $0E62,2 Store the teacher's character number at #A$07.
C $0E64,2 Does this teacher's character number match the one at #A$78?
C $0E66,2 Branch if so to skip this teacher.
C $0E68,3 Can the teacher see the boy?
C $0E6B,2 Branch if not.
C $0E6D,11 Store the base address of the teacher's character buffer at #A$4E.
C $0E78,6 Pick up the teacher's animatory state and store it at #A$0A.
C $0E7E,5 Pick up the teacher's x-coordinate and store it at #A$0B.
C $0E83,4 Is the teacher currently controlled by an uninterruptible subcommand routine?
C $0E87,2 Consider the next teacher if so (this one is busy).
C $0E89,2 Pick up the boy's x-coordinate from #A$FC.
C $0E8B,4 Is the boy's x-coordinate greater than the teacher's?
C $0E8F,2 Branch if so.
C $0E91,2 Pick up the teacher's animatory state.
C $0E93,1 Is the teacher facing the boy?
C $0E94,2 Branch if not.
C $0E96,1 Set the carry flag: the boy can be seen.
C $0E97,3 Jump forward.
C $0E9A,2 Pick up the teacher's animatory state.
C $0E9C,1 Is the teacher facing the boy?
C $0E9D,2 Branch if not.
C $0E9F,1 Set the carry flag: the boy can be seen.
C $0EA0,3 Jump forward.
C $0EA3,2 Pick up the teacher's character number.
C $0EA5,2 Have we checked all four teachers yet?
C $0EA7,2 Branch if so.
C $0EA9,2 Next teacher.
C $0EAB,2 Pick up the next teacher's character number.
C $0EAD,3 Jump back to consider him.
C $0EB0,1 Clear the carry flag: the boy cannot be seen.
C $0EB1,2 Pick up the teacher's character number.
c $0EB4 Restart the command list
D $0EB4 #ZX$7C47
D $0EB4 Used by command lists #R$422B($B6), #R$4255($BE), #R$4272($C2), #R$4290($C4), #R$42AD($CC), #R$42CF($CE) and #R$436E($DC).
C $0EB4,6 Set bit 7 of the flags byte at #A$3F, signalling to the character-moving routine at #A$3B5E that a command list restart is required.
C $0EBA,4 Remove the address of any interruptible subcommand routine from the character's buffer.
C $0EBE,3 Terminate this primary command.
u $0EC1 Unused
B $0EC1,1,1
c $0EC2 Restart the command list unless it's time to start the lesson
D $0EC2 #ZX$7C3F
D $0EC2 Used by command lists #R$4080($80), #R$4095($82), #R$40AE($84), #R$40C3($86) and #R$423B($B8).
C $0EC2,2 Pick up the MSB of the lesson clock from #A$40.
C $0EC4,2 Is it still 11 or greater?
C $0EC6,2 Branch if so.
C $0EC8,3 Otherwise terminate this primary command.
C $0ECB,3 Restart the command list.
u $0ECE Unused
B $0ECE,1,1
c $0ECF Make a teacher give lines to the closest main kid
D $0ECF #ZX$78AA
D $0ECF Used by the routine at #A$2A43. Makes a teacher who has been knocked over give lines to the closest main kid (if any).
C $0ECF,3 Compute the coordinate ranges within which the teacher can see.
C $0ED2,4 #A$79 will hold the distance from the teacher to the closest main kid. Initialise it to $FF.
N $0ED6 First we check whether ERIC is in range.
C $0ED6,2 Character number $14 is ERIC.
C $0ED8,2 Store this potential target character number at #A$07.
C $0EDA,3 Is ERIC close to the teacher?
C $0EDD,2 Branch if not to check EINSTEIN.
C $0EDF,11 Prepare to address ERIC's character buffer at #A$8C60.
C $0EEA,6 Pick up ERIC's x-coordinate from his character buffer and store it at #A$0B.
C $0EF0,2 Is it less than the teacher's x-coordinate?
C $0EF2,2 Branch if so.
C $0EF4,3 Now `A` holds the difference between the teacher's and ERIC's x-coordinates.
C $0EF7,3 Jump forward.
C $0EFA,2 Pick up the teacher's x-coordinate from #A$FC.
C $0EFC,3 Now `A` holds the difference between the teacher's and ERIC's x-coordinates.
C $0EFF,2 Store this x-coordinate difference at #A$7A.
C $0F01,2 Is it greater than any x-coordinate difference already calculated?
C $0F03,2 Branch if so (this branch is never made).
C $0F05,6 Otherwise store this new minimum x-coordinate difference at #A$79, and ERIC's character number at #A$7B.
N $0F0B Next we check whether EINSTEIN is in range.
C $0F0B,4 Character number $11 is EINSTEIN. Store this potential target character number at #A$07.
C $0F0F,3 Is EINSTEIN close to the teacher?
C $0F12,2 Branch if not to check BOY WONDER.
C $0F14,11 Prepare to address EINSTEIN's character buffer at #A$8960.
C $0F1F,6 Pick up EINSTEIN's x-coordinate from his character buffer and store it at #A$0B.
C $0F25,2 Is it less than the teacher's x-coordinate?
C $0F27,2 Branch if so.
C $0F29,3 Now `A` holds the difference between the teacher's and EINSTEIN's x-coordinates.
C $0F2C,3 Jump forward.
C $0F2F,2 Pick up the teacher's x-coordinate from #A$FC.
C $0F31,3 Now `A` holds the difference between the teacher's and EINSTEIN's x-coordinates.
C $0F34,2 Store this x-coordinate difference at #A$7A.
C $0F36,2 Is it greater than any x-coordinate difference already calculated?
C $0F38,2 Branch if so.
C $0F3A,6 Otherwise store this new minimum x-coordinate difference at #A$79, and EINSTEIN's character number at #A$7B.
N $0F40 Next we check whether BOY WONDER is in range.
C $0F40,4 Character number $11 is BOY WONDER. Store this potential target character number at #A$07.
C $0F44,3 Is BOY WONDER close to the teacher?
C $0F47,2 Branch if not to check ANGELFACE.
C $0F49,11 Prepare to address BOY WONDER's character buffer at #A$8860.
C $0F54,6 Pick up BOY WONDER's x-coordinate from his character buffer and store it at #A$0B.
C $0F5A,2 Is it less than the teacher's x-coordinate?
C $0F5C,2 Branch if so.
C $0F5E,3 Now `A` holds the difference between the teacher's and BOY WONDER's x-coordinates.
C $0F61,3 Jump forward.
C $0F64,2 Pick up the teacher's x-coordinate from #A$FC.
C $0F66,3 Now `A` holds the difference between the teacher's and BOY WONDER's x-coordinates.
C $0F69,2 Store this x-coordinate difference at #A$7A.
C $0F6B,2 Is it greater than any x-coordinate difference already calculated?
C $0F6D,2 Branch if so.
C $0F6F,6 Otherwise store this new minimum x-coordinate difference at #A$79, and BOY WONDER's character number at #A$7B.
N $0F75 Finally we check whether ANGELFACE is in range.
C $0F75,4 Character number $0F is ANGELFACE. Store this potential target character number at #A$07.
C $0F79,3 Is ANGELFACE close to the teacher?
C $0F7C,2 Branch if not.
C $0F7E,11 Prepare to address ANGELFACE's character buffer at #A$8760.
C $0F89,6 Pick up ANGELFACE's x-coordinate from his character buffer and store it at #A$0B.
C $0F8F,2 Is it less than the teacher's x-coordinate?
C $0F91,2 Branch if so.
C $0F93,3 Now `A` holds the difference between the teacher's and ANGELFACE's x-coordinates.
C $0F96,3 Jump forward.
C $0F99,2 Pick up the teacher's x-coordinate from #A$FC.
C $0F9B,3 Now `A` holds the difference between the teacher's and ANGELFACE's x-coordinates.
C $0F9E,2 Store this x-coordinate difference at #A$7A.
C $0FA0,2 Is it greater than any x-coordinate difference already calculated?
C $0FA2,2 Branch if so.
C $0FA4,6 Otherwise store this new minimum x-coordinate difference at #A$79, and ANGELFACE's character number at #A$7B.
N $0FAA Having checked whether ERIC, EINSTEIN, BOY WONDER and ANGELFACE are in range, we now see which (if any) is closest to the teacher.
C $0FAA,2 Were any of the main kids within lines-receiving range?
C $0FAC,2 Return if not.
C $0FAE,4 Pick up the character number of the closest main kid and store it at #A$72.
C $0FB2,2 Lines reprimand #R$4B80($08): NOW DON'T DO IT AGAIN.
C $0FB4,2 Store this lines reprimand identifier at #A$D8.
C $0FB6,3 Make the teacher gives lines to the closest main kid.
c $0FBA Control the horizontal flight of a catapult pellet
D $0FBA #ZX$6D1C
D $0FBA The address of this uninterruptible subcommand routine is placed into a pellet's buffer by the routine at #A$2B52.
C $0FBA,3 Update the SRB for the pellet's current location.
C $0FBD,2 Has the pellet finished its flight yet?
C $0FBF,2 Branch if not.
N $0FC1 This entry point is used by the routine at #A$1042 to terminate the vertical portion of the pellet's flight.
C $0FC1,4 Hide the pellet at x-coordinate 150.
C $0FC5,4 Remove the uninterruptible subcommand routine address from the pellet's buffer.
C $0FC9,3 Return.
C $0FCC,2 Pick up the pellet's animatory state from #A$26.
C $0FCE,1 Is the pellet moving right?
C $0FCF,2 Branch if so.
C $0FD1,2 Decerement the pellet's x-coordinate at #A$FC.
C $0FD3,3 Jump forward.
C $0FD6,2 Increment the pellet's x-coordinate at #A$FC.
C $0FD8,2 Pick up the pellet's new x-coordinate from #A$FC.
C $0FDA,2 Is it now 96 or greater?
C $0FDC,2 Terminate the pellet if so.
C $0FDE,2 Pick up the pellet's y-coordinate from #A$FB.
C $0FE0,2 Is the pellet at boys' eye level on the top floor?
C $0FE2,2 Branch if so.
C $0FE4,2 Is the pellet at boys' eye level on the middle floor?
C $0FE6,2 Branch if so.
C $0FE8,2 Is the pellet at boys' eye level on the bottom floor?
C $0FEA,2 Branch if so.
C $0FEC,3 Update the SRB for the pellet's new location.
C $0FEF,3 Check whether the pellet has hit a shield.
C $0FF2,2 Pick up the pellet's x-coordinate from #A$FC.
C $0FF4,2 Is it 38 (equal to that of the Exam Room wall)?
C $0FF6,2 Branch if not.
C $0FF8,3 Otherwise jump back to terminate the pellet.
C $0FFB,2 Pick up the pellet's x-coordinate from #A$FC.
C $0FFD,2 Is it 57 (equal to the Map Room wall)?
C $0FFF,2 Branch if not.
C $1001,3 Otherwise jump back to terminate the pellet.
C $1004,3 Update the SRB for the pellet's new location.
C $1007,2 Pick up the pellet's remaining distance to travel from #A$B2.
C $1009,2 Is the pellet ready to hit something?
C $100B,2 Return if not.
C $100D,4 Pick up the pellet's coordinates in `X` and `Y`.
C $1011,3 Check whether anyone has been hit by the pellet.
C $1014,1 Save `A` temporarily.
C $1015,2 Branch if someone was knocked over by the pellet.
C $1017,1 Restore `A`.
C $1018,2 Was anyone hit by the pellet?
C $101A,2 Return if not.
C $101C,8 Place the address of the uninterruptible subcommand routine at #A$1042 into the pellet's buffer. This will control the vertical portion of the pellet's flight.
C $1024,4 Set the remaining distance for the pellet to travel to 5.
C $1028,2 Pick up the pellet's y-coordinate from #A$FB.
C $102A,2 Is the pellet on the top floor?
C $102C,2 Branch if not.
C $102E,2 Otherwise adjust the remaining distance to 3.
C $1030,3 Return.
C $1033,4 Set the remaining distance for the pellet to travel to 1. This ensures that it's terminated on the next pass.
C $1037,1 Now `A` holds the number of the character who was knocked over by the pellet.
C $1038,2 Was it EINSTEIN?
C $103A,2 Return if not.
C $103C,5 Add 30 to the score and print it.
c $1042 Control the vertical flight of a catapult pellet
D $1042 #ZX$6DC6
D $1042 The address of this uninterruptible subcommand routine is placed into the pellet's buffer by the routine at #A$0FBA.
C $1042,3 Update the SRB for the pellet's current location.
C $1045,2 Has the pellet finished its journey upwards yet?
C $1047,2 Branch if not.
C $1049,3 Otherwise terminate the pellet.
C $104C,2 Decrement the pellet's y-coordinate.
C $104E,3 Update the SRB for the pellet's new location.
N $1051 This entry point is used by the routine at #A$0FBA.
C $1051,6 Pick up the coordinates of the pellet's potential target in `XY`.
C $1057,3 Check whether the pellet has hit a shield.
u $105A Unused
B $105A,1,1
c $105B Make a character go to a random location
D $105B #ZX$69E7
D $105B Used by command lists #R$422B($B6), #R$4255($BE), #R$4272($C2), #R$4290($C4), #R$42AD($CC), #R$42E3($D0), #R$42FB($D2), #R$4309($D4), #R$4334($D8), #R$436E($DC) and #R$438A($E0).
C $105B,5 Generate a random value between 0 and 3.
C $1060,2 Branch unless it's 0.
C $1062,4 These are the coordinates of the bookcase in the Revision Library just outside the Reading Room.
C $1066,3 Jump forward.
C $1069,2 Is the random value equal to 1?
C $106B,2 Branch if not.
C $106D,4 These are the coordinates of the far end of the fire escape.
C $1071,3 Jump forward.
C $1074,2 Is the random value equal to 2?
C $1076,2 Branch if not.
C $1078,4 These are the coordinates of a spot between the big window and the stairs leading up to the staff room.
C $107C,3 Jump forward.
C $107F,4 These are the coordinates of the far end of the gym.
N $1083 This entry point is used by the routine at #A$2885.
C $1083,4 Store the destination coordinates at #A$A6 in the character's buffer.
C $1087,3 Make the character go to this location.
u $108A Unused
B $108A,1,1
c $108B Get the next character of a message being spoken or written
D $108B #ZX$70D2
D $108B Used by the routines at #A$1129 and #A$246B.
R $108B O:A Code of the next character
C $108B,2 Prepare `Y` for indexed addressing.
C $108D,2 Is there a submessage address at #A$AE?
C $108F,2 Branch if not.
C $1091,2 Pick up the next character from the submessage.
C $1093,6 Increment the submessage address at #A$AE.
C $1099,2 Is the submessage finished?
C $109B,2 Branch if so.
C $109D,3 Otherwise return.
C $10A0,2 Clear the submessage address from #A$AE.
C $10A2,2 Pick up the next character from the message.
C $10A4,6 Increment the message address at #A$AC.
C $10AA,2 Is the character code $80 or greater?
C $10AC,2 Branch if so.
C $10AE,2 Is the character code between $20 and $7F?
C $10B0,2 Return if so.
C $10B2,2 Is the character code less than $10?
C $10B4,2 Return if so.
C $10B6,1 Save the character code ($11-$1F, $80-$FF) temporarily.
C $10B7,2 Is the character code $80 or greater?
C $10B9,2 Branch if so.
C $10BB,2 Is the character code between $18 and $1F?
C $10BD,2 Branch if so.
C $10BF,8 The character names are stored at intervals of $0E from #A$4780 onwards. Store this base address at #A$1D.
C $10C7,3 Jump forward.
C $10CA,8 Store #A$47F0 (Please Sir - I cannot tell a lie . .) at #A$1D.
C $10D2,1 Restore the character code ($18-$1F) to `A`.
C $10D3,3 Jump forward with submessage address #A$47F0 at #A$1D.
C $10D6,1 Restore the character code ($11-$17) to `A`.
C $10D7,2 Clear bit 4.
C $10D9,13 Multiply `A` by 14.
C $10E6,5 Add `A` to the address stored at #A$1D.
C $10EB,3 Jump forward with this character name submessage address at #A$1D.
C $10EE,4 Initialise the MSB of the submessage address to $4D.
C $10F2,1 Restore the character code ($80-$FF) to `A`.
C $10F3,2 Clear bit 7.
C $10F5,2 Is the character code now less than $16?
C $10F7,2 Branch if so with the MSB equal to $4D.
C $10F9,26 Set the MSB of the submessage address to $4E if the character code is between $16 and $2A, $4F if the character code is between $2B and $3F, $50 if the character code is between $40 and $55, $51 if the character code is between $56 and $6A, or $52 if the character code is greater than $6B.
C $1113,8 Multiply `A` by 12. The result is the LSB of the submessage address.
C $111B,2 Store the LSB at #A$1D.
C $111D,8 Copy the submessage address from #A$1D to #A$AE.
C $1125,3 Jump back to pick up the first character from the submessage.
c $1129 Make a character write on a blackboard
D $1129 #ZX$7264
D $1129 The address of this interruptible subcommand routine is placed into a character's buffer by the routines at #A$09E9, #A$0A58 and #A$28AB.
C $1129,3 Copy the details of the blackboard nearest to the character into page 0.
C $112C,2 Is the blackboard clean?
C $112E,2 Branch if so.
C $1130,3 Otherwise terminate this interruptible subcommand.
C $1133,4 Pick up the current character number from #A$60 and store it in the second byte of the blackboard buffer as a record of who last wrote on the blackboard.
C $1137,6 Clear any existing submessage address from #A$AE.
C $113D,2 Pick up the current character number from #A$60.
C $113F,3 Reduce `A` to 0-3 (a teacher) or 5 (BOY WONDER).
C $1142,2 Is the current character BOY WONDER?
C $1144,2 Branch if not.
C $1146,1 Set the carry flag to prepare for subtraction.
C $1147,2 Subtract 1. Now `A` holds 4.
C $1149,5 Add $53 to obtain the base page number of the blackboard messages for this character ($53-$57) and store it at #A$AD.
C $114E,5 Generate random value between 0 and 7.
C $1153,5 Multiply by 32, giving the LSB of the address of a blackboard message.
C $1158,2 Store this LSB at #A$AC.
C $115A,8 Replace the address of this interruptible subcommand routine in the character's buffer with that of #A$1167 below.
C $1162,2 Pick up the blackboard identifier from #A$DA.
C $1164,3 Restore the blackboard buffer from page 0.
N $1167 After the initial call to this routine, each subsequent call enters here.
C $1167,3 Copy the details of the blackboard nearest to the character into page 0.
C $116A,3 Get the code of the next character to be written on the blackboard.
C $116D,2 Is the message finished?
C $116F,2 Branch if not.
C $1171,3 Update the SRB for the character's current animatory state and location.
C $1174,2 Pick up the character's animatory state.
C $1176,2 Is a teacher (as opposed to BOY WONDER) writing on the blackboard?
C $1178,2 Branch if so.
C $117A,2 Pick up BOY WONDER's animatory state.
C $117C,2 Clear bits 0-3, lowering his arm.
C $117E,3 Jump forward.
C $1181,2 Pick up the teacher's animatory state.
C $1183,2 Clear bits 0-2, lowering his arm.
C $1185,2 Update the character's animatory state.
C $1187,3 Update the SRB for the character's new animatory state.
C $118A,3 Terminate this interruptible subcommand.
N $118D The character hasn't finished writing on the board yet.
C $118D,2 Is the next character in the message a newline?
C $118F,2 Branch if not.
C $1191,4 Update the blackboard's pixel column counter at #A$19 to $40 (start of the second line).
C $1195,3 Jump forward.
C $1198,3 Write the character on the blackboard.
C $119B,3 Update the SRB for the character's current animatory state and location.
C $119E,2 Pick up the character's animatory state.
C $11A0,2 Is BOY WONDER (as opposed to a teacher) writing on the blackboard?
C $11A2,2 Branch if so.
N $11A4 A teacher is writing on the blackboard.
C $11A4,2 Pick up the teacher's animatory state.
C $11A6,2 Clear bits 0-2.
C $11A8,2 Is the teacher's arm raised?
C $11AA,2 Branch if so.
C $11AC,3 Add 5 to the teacher's animatory state, thus raising his arm.
C $11AF,2 Update the teacher's animatory state (raising or lowering his arm).
C $11B1,3 Jump forward.
N $11B4 BOY WONDER is writing on the blackboard.
C $11B4,2 Pick up BOY WONDER's animatory state.
C $11B6,2 Keep only the direction bit (bit 7).
C $11B8,3 Add #AS$3C($3C) - the animatory state of BOY WONDER with his arm raised (phase 1).
C $11BB,2 Is BOY WONDER's arm raised (phase 1)?
C $11BD,2 Branch if so.
C $11BF,2 Otherwise set BOY WONDER's animatory state to #AS$3C($3C/$BC) (arm raised, phase 1).
C $11C1,3 Jump forward.
C $11C4,2 Set BOY WONDER's animatory state to #AS$3D($3D/$BD) (arm raised, phase 2).
C $11C6,3 Update the SRB for the character's new animatory state.
C $11C9,2 Pick up the blackboard identifier from #A$DA.
C $11CB,3 Restore the blackboard buffer from page 0.
c $11CF Write a single character on a blackboard
D $11CF #ZX$7142
D $11CF Used by the routines at #A$1129 and #A$184E.
R $11CF A Character code ($20-$7F)
C $11CF,6 Store the address that holds the font character bitmap width at #A$21.
C $11D5,2 Pick up the blackboard's pixel column counter from #A$19.
C $11D7,2 Set bits 6 and 7.
C $11D9,3 Add 1 to advance to the next pixel column.
C $11DC,2 Branch if we've reached the end of a line.
C $11DE,5 Add the width of the font character bitmap.
C $11E3,2 Branch if the bitmap will fit on the current line.
C $11E5,8 Set the blackboard's pixel column counter at #A$19 to either $00 (start of the top line) or $40 (start of the bottom line).
C $11ED,2 Pick up the blackboard's pixel column counter from #A$19.
C $11EF,8 Clear bits 6 and 7, divide by 8, and add the x-coordinate of the top left corner of the blackboard. This gives the play area x-coordinate of the target character cell.
C $11F7,2 Store this x-coordinate at #A$15.
C $11F9,2 Pick up the blackboard's pixel column counter from #A$19.
C $11FB,2 Are we on the top line of the blackboard?
C $11FD,2 Branch if so.
C $11FF,2 Increment the target blackboard character cell y-coordinate at #A$16.
C $1201,2 Pick up the target blackboard character cell x-coordinate from #A$15.
C $1203,3 Subtract the x-coordinate of the leftmost column of the skool on screen, giving the screen x-coordinate.
C $1206,2 Store this screen x-coordinate at #A$49.
C $1208,4 Copy the target blackboard character cell y-coordinate from #A$16 to #A$4A.
C $120C,3 Update the SRB for the target blackboard character cell.
C $120F,2 Increment the x-coordinate at #A$49.
C $1211,3 Update the SRB for the next character cell to the right.
C $1214,2 Pick up the blackboard's pixel column counter from #A$19.
C $1216,11 Prepare a mask in `A` such that the only reset bit corresponds to the target pixel column in the target character cell.
C $1221,2 Store this mask at #A$23.
C $1223,3 Get the address of the skool tile corresponding to the blackboard character cell.
C $1226,6 Pick up the font character bitmap width and store this counter at #A$4E.
N $122C The loop that draws the font character into the blackboard character cell starts here.
C $122C,2 Point at the next pixel column of the font character bitmap.
C $122E,2 There are 8 pixels in the column to be drawn.
C $1230,2 Store this counter at #A$4F.
C $1232,2 Pick up the next pixel column of the font character bitmap.
C $1234,1 Push the bit to be drawn into the carry flag.
C $1235,1 Save the remainder of the pixel column temporarily.
C $1236,2 Branch if the pixel is a 0 (nothing to draw).
C $1238,6 Pick up the mask from #A$23 and apply it to the skool tile graphic data byte for the target blackboard character cell.
C $123E,2 Move to the next byte of skool tile graphic data.
C $1240,1 Restore the remainder of the pixel column to `A`.
C $1241,2 Have we drawn all 8 pixels in the column yet?
C $1243,2 Branch back if not.
C $1245,4 Increment the blackboard's pixel column counter at #A$19 and pick up the new value.
C $1249,2 Have we just drawn in the rightmost pixel column of the target character cell?
C $124B,2 Branch if so.
C $124D,7 Reset the skool tile graphic data pointer back to the first byte in the tile.
C $1254,3 Jump forward.
C $1257,2 Increment the target blackboard cell x-coordinate at #A$15.
C $1259,3 Get the address of the skool tile corresponding to the blackboard character cell.
C $125C,2 Have we drawn every pixel column in the font character bitmap now?
C $125E,2 Branch if so.
C $1260,3 Otherwise shift the reset bit in the mask at #A$23 one place to right, ready for the next pixel column.
C $1263,2 Branch unless the reset bit fell into the carry flag.
C $1265,2 Rotate the reset bit into bit 7.
C $1267,3 Jump back to start drawing the next pixel column.
C $126A,2 Increment the blackboard's pixel column counter at #A$19.
c $126D Get the play area region identifier for a given location
D $126D Used by the routines at #A$12B5, #A$1A51, #A$1ADD and #A$1B2E.
D $126D The region identifiers are as follows:
D $126D #TABLE(default,centre) { =h ID | =h Region } { 0     | Top floor, to the left of the Map Room wall } { 1     | Middle floor, to the left of the Exam Room wall } { 2     | Bottom floor } { 3     | Middle floor, to the right of the Exam Room wall } { 4     | Top floor, to the right of the Map Room wall } TABLE#
R $126D X Play area x-coordinate (0-95)
R $126D Y Play area y-coordinate (0-17)
R $126D O:A Play area region identifier
C $126D,2 Is the y-coordinate less than 14?
C $126F,2 Branch if so.
C $1271,5 Return with `A`=2 when `Y`>=14.
C $1276,2 Is the y-coordinate less than 7?
C $1278,2 Branch if so.
C $127A,2 Is the x-coordinate less than 39?
C $127C,2 Branch if so.
C $127E,5 Return with `A`=3 when 7<=`Y`<14 and `X`>=39.
C $1283,5 Return with `A`=1 when 7<=`Y`<14 and `X`<39.
C $1288,2 Is the x-coordinate less than 58?
C $128A,2 Branch if so.
C $128C,5 Return with `A`=4 when `Y`<7 and `X`>=58.
C $1291,2 Return with `A`=0 when `Y`<7 and `X`<58.
c $1294 Get the address of a skool tile corresponding to a blackboard character cell
D $1294 Used by the routines at #A$11CF and #A$1994.
R $1294 /(#A$15)/ Blackboard character cell x-coordinate
R $1294 /(#A$16)/ Blackboard character cell y-coordinate
R $1294 /O:(#A$1B,#A$1C)/ Address of corresponding skool tile
C $1294,11 Place the address of the skool tile reference for the blackboard character cell at the given coordinates into #A$56.
C $129F,6 Pick up the skool tile reference and store it at #A$1B. This is the LSB of the skool tile address.
C $12A5,2 Pick up the blackboard character cell x-coordinate.
C $12A7,2 Is it 32 or greater?
C $12A9,2 Branch if so.
C $12AB,2 The skool tiles for x-coordinates 0-31 are in pages #R$6000($60-$67).
C $12AD,3 Jump forward.
C $12B0,2 The skool tiles for x-coordinates 32-63 are in pages #R$6800($68-$6F).
C $12B2,2 Store the MSB of the skool tile address at #A$1C.
c $12B5 Make a character go to a location
D $12B5 #ZX$63BE
D $12B5 The address of this primary command routine is found in many #R$4480(command lists).
C $12B5,5 Collect the destination x-coordinate from the command list and store it at #A$A6.
C $12BA,1 Transfer the destination x-coordinate to `X`.
C $12BB,5 Collect the destination y-coordinate from the command list and store it at #A$A7.
C $12C0,1 Transfer the destination y-coordinate to `Y`.
N $12C1 This entry point is used by the routine at #A$105B.
C $12C1,6 Reset bit 1 in the flags byte at #A$3F: the character is not running continuously.
N $12C7 This entry point is used by the routine at #A$284F.
C $12C7,5 Determine the region identifier for the destination coordinates and store it at #A$A8.
C $12CC,8 Replace the address of this primary command routine in the character's buffer with that of #A$12E8 below.
C $12D4,2 Pick up the character's animatory state from #A$26.
C $12D6,2 Keep only bits 0-2.
C $12D8,2 Is the character sitting on a chair?
C $12DA,2 Branch if not.
C $12DC,3 Update the SRB for the character's current animatory state and location.
C $12DF,6 Clear bits 0-2 of the character's animatory state, making him stand up.
C $12E5,3 Update the SRB for the character's new animatory state.
N $12E8 This entry point is used on the second and subsequent passes.
C $12E8,2 Pick up the character's animatory state from #A$26.
C $12EA,1 Is the character midstride?
C $12EB,2 Branch if not.
C $12ED,3 Move the character from the midstride position.
N $12F0 The character is ready to start making his way to the destination.
C $12F0,4 Pick up the character's current coordinates from #A$FB.
C $12F4,5 Determine the region identifier for these coordinates and store it at #A$48.
C $12F9,2 Is the character already in the destination region?
C $12FB,2 Branch if not.
N $12FD The character is in the destination region, so it's just a straight walk left or right from here.
C $12FD,2 Pick up the destination x-coordinate from #A$A6.
C $12FF,2 Does it match the character's x-coordinate?
C $1301,2 Branch if not.
C $1303,3 Otherwise terminate this primary command: the character has reached his destination.
C $1306,2 Store the destination x-coordinate at #A$AC.
C $1308,8 Place the address of the interruptible subcommand routine at #A$136F into the character's buffer.
C $1310,3 Jump to #A$136F.
N $1313 The character is not in the destination region. One or more staircases need to be navigated.
C $1313,2 Branch if the current region identifier is less than the destination region identifier.
C $1315,8 Prepare to address the staircase endpoint data table at #A$4454.
C $131D,3 Jump forward.
C $1320,8 Prepare to address the staircase endpoint data table at #A$4440.
C $1328,12 Set `A` equal to 4 multiplied by the region identifier for the character's current location.
C $1334,3 Pick up a staircase endpoint x-coordinate from the table at #A$4440 or #A$4454.
C $1337,2 Is the character at the top or bottom of the staircase?
C $1339,2 Branch if so.
C $133B,2 Store the staircase endpoint x-coordinate at #A$AC.
C $133D,8 Place the address of the interruptible subcommand routine at #A$136F into the character's buffer.
C $1345,3 Jump to #A$136F.
N $1348 The character is at the top or bottom of a staircase that must be navigated.
C $1348,3 Pick up the staircase direction indicator ($00 or $80) from the table at #A$4440 or #A$4454.
C $134B,1 Save it temporarily.
C $134C,2 Pick up the character's animatory state from #A$26.
C $134E,4 Keep only the direction bit (bit 7) and store the result at #A$57.
C $1352,1 Restore the staircase direction indicator to `A`.
C $1353,2 Is the character facing the right way to start climbing or descending the staircase?
C $1355,2 Branch if so.
C $1357,3 Update the SRB for the character's current animatory state and location.
C $135A,3 Turn the character round.
N $135D The character is at the top or bottom of a staircase that must be navigated, and is facing the right way to begin the ascent or descent.
C $135D,2 Going up or down a staircase requires 15 movements.
C $135F,2 Store this counter at #A$AC.
C $1361,10 Collect the interruptible subcommand routine address (#A$13F3 or #A$13FA) from the table at #A$4440 or #A$4454 and place it into the character's buffer.
C $136B,3 Jump to the interruptible subcommand routine.
u $136E Unused
B $136E,1,1
c $136F Guide a character to an intermediate destination
D $136F #ZX$633C
D $136F The address of this interruptible subcommand routine is placed into a character's buffer by the routines at #A$09E9, #A$0A58, #A$0E35, #A$12B5 and #A$1A04.
C $136F,4 Initialise the counter at #A$AD that determines how long this interruptible subcommand will have control.
C $1373,8 Replace the address of this interruptible subcommand routine in the character's buffer with that of #A$137B below.
N $137B This entry point is used by the routine at #A$BE09.
C $137B,2 Decrement the counter at #A$AD.
C $137D,2 Branch unless it's zero now.
C $137F,3 Otherwise terminate this interruptible subcommand.
C $1382,2 Pick up the character's x-coordinate from #A$FC.
C $1384,2 Has the character reached the intermediate destination?
C $1386,2 Branch if not.
C $1388,2 Pick up the character's animatory state from #A$26.
C $138A,1 Is the character midstride?
C $138B,2 Branch if so.
C $138D,3 Otherwise terminate this interruptible subcommand.
N $1390 This entry point is used by the routine at #A$12B5.
C $1390,3 Update the SRB for the character's current animatory state and location.
C $1393,2 Pick up the character's animatory state from #A$26.
C $1395,1 Is the character midstride?
C $1396,2 Branch if not.
N $1398 This entry point is used by the routines at #A$13F3 and #A$1CEC.
C $1398,2 Is the character facing left?
C $139A,2 Branch if so.
C $139C,2 Increment the character's x-coordinate at #A$FC.
C $139E,3 Jump forward.
C $13A1,2 Decrement the character's x-coordinate at #A$FC.
C $13A3,15 Adjust the character's animatory state at #A$26 depending on whether his x-coordinate is even or odd.
C $13B2,3 Jump forward.
C $13B5,2 Pick up the character's animatory state from #A$26.
C $13B7,4 Keep only the direction bit (bit 7) and store it at #A$57.
C $13BB,2 Pick up the character's x-coordinate from #A$FC.
C $13BD,5 Subtract the intermediate destination x-coordinate, and keep only the resulting sign bit (bit 7).
C $13C2,2 Is the character facing the right way to get to the intermediate destination?
C $13C4,2 Branch if so.
N $13C6 This entry point is used by the routine at #A$12B5.
C $13C6,6 Flip bit 7 of the character's animatory state at #A$26, thus turning him round.
C $13CC,3 Jump forward.
C $13CF,2 Increment the character's animatory state at #A$26.
C $13D1,3 Update the SRB for the character's new animatory state and location.
c $13D5 Determine the address of a blackboard buffer
D $13D5 Used by the routines at #A$1421 and #A$1445.
R $13D5 Y Blackboard identifier (0, 1, 2)
R $13D5 /O:#R$17(($17,$18))/ Blackboard buffer address
C $13D5,8 Prepare to address the Reading Room blackboard buffer at #A$4420.
C $13DD,1 Transfer the blackboard identifier to `A`.
C $13DE,2 Branch if it's the Reading Room blackboard (0).
C $13E0,7 Prepare to address the White Room blackboard buffer at #A$4426.
C $13E7,2 Do we want the Exam Room blackboard (2)?
C $13E9,2 Branch if not.
C $13EB,7 Prepare to address the Exam Room blackboard buffer at #A$442C.
c $13F3 Guide a character up or down a staircase
D $13F3 The address of this interruptible subcommand routine appears in the staircase endpoint data tables at #A$4440 and #A$4454.
C $13F3,4 Store the direction indicator (zero, down) at #A$47.
C $13F7,3 Jump forward.
N $13FA The address of this entry point appears in the staircase endpoint data tables at #A$4440 and #A$4454.
C $13FA,4 Store the direction indicator (non-zero, up) at #A$47.
C $13FE,2 Decrement the movement counter at #A$AC.
C $1400,2 Branch unless the character has reached the top or bottom of the staircase.
C $1402,3 Terminate this interruptible subcommand routine.
C $1405,3 Update the SRB for the character's current animatory state and location.
C $1408,2 Pick up the character's animatory state from #A$26.
C $140A,1 Is the character midstride?
C $140B,2 Branch if not.
C $140D,3 Move the character from the midstride position.
C $1410,2 Increment the character's animatory state.
C $1412,2 Pick up the direction indicator from #A$47.
C $1414,2 Branch if the character is going down the stairs.
C $1416,2 Decrement the character's y-coordinate.
C $1418,3 Jump forward.
C $141B,2 Increment the character's y-coordinate.
C $141D,3 Update the SRB for the character's new animatory state and location.
c $1421 Copy a blackboard buffer into page 0
D $1421 Used by the routines at #A$1468 and #A$176F.
R $1421 Y Blackboard identifier (0, 1, 2)
C $1421,3 Determine the address of the blackboard buffer and store it at #A$17.
C $1424,6 Copy the first byte of the blackboard buffer to #A$19.
C $142A,5 Copy the second byte of the blackboard buffer to #A$1A.
C $142F,5 Copy the third byte of the blackboard buffer to #A$DF.
C $1434,5 Copy the fourth byte of the blackboard buffer to #A$E0.
C $1439,5 Copy the fifth byte of the blackboard buffer to #A$E1.
C $143E,5 Copy the sixth byte of the blackboard buffer to #A$E2.
C $1443,1 Now `Y`=6. This instruction is redundant.
c $1445 Restore a blackboard buffer from page 0
D $1445 Used by the routines at #A$1129, #A$16E9 and #A$19A5.
R $1445 Y Blackboard identifier (0, 1, 2)
C $1445,3 Determine the address of the blackboard buffer and store it at #A$17.
C $1448,6 Copy the first byte of the blackboard buffer from #A$19.
C $144E,5 Copy the second byte of the blackboard buffer from #A$1A.
C $1453,5 Copy the third byte of the blackboard buffer from #A$DF.
C $1458,5 Copy the fourth byte of the blackboard buffer from #A$E0.
C $145D,5 Copy the fifth byte of the blackboard buffer from #A$E1.
C $1462,5 Copy the sixth byte of the blackboard buffer from #A$E2.
c $1468 Get the identifier and coordinates of the blackboard closest to a character
D $1468 #ZX$7128
D $1468 Used by the routines at #A$0A58, #A$1129, #A$16E9, #A$184E, #A$19A5 and #A$1FA0. This routine also copies the #LINK:BlackboardBuffer(blackboard's buffer) into page 0.
R $1468 /O:(#A$DA)/ Blackboard identifier
R $1468 /O:(#R$15($15,$16))/ Blackboard coordinates
C $1468,3 Check which floor the character is on.
C $146B,2 Is the character on the top floor?
C $146D,2 Branch if not.
C $146F,8 Store the coordinates of the Reading Room blackboard at #A$15.
C $1477,2 `Y`=0: Reading Room blackboard.
C $1479,3 Jump forward.
C $147C,2 Pick up the character's x-coordinate from #A$FC.
C $147E,2 Is the character to the right of the Exam Room wall?
C $1480,2 Branch if so.
C $1482,8 Store the coordinates of the White Room blackboard at #A$15.
C $148A,2 `Y`=1: White Room blackboard.
C $148C,3 Jump forward.
C $148F,8 Store the coordinates of the Exam Room blackboard at #A$15.
C $1497,2 `Y`=2: Exam Room blackboard.
C $1499,2 Store the blackboard identifier at #A$DA.
C $149B,3 Copy the blackboard's buffer into page 0.
c $149F Make any nearby teacher give ERIC lines if necessary
D $149F #ZX$77AC
D $149F Called from the main loop at #A$0800.
C $149F,2 Pick up the current character number from #A$60.
C $14A1,1 Save it temporarily.
C $14A2,4 Set the current character number at #A$60 to $14 (ERIC).
C $14A6,3 Copy ERIC's character buffer into page 0.
C $14A9,2 Decrement the lines-giving delay counter at #A$C6.
C $14AB,2 Pick up the lines-giving delay counter from #A$C6.
C $14AD,2 Is the low nibble zero?
C $14AF,2 Branch if so.
C $14B1,3 Otherwise there's nothing to do.
C $14B4,2 Pick up the lines-giving delay counter from #A$C6.
C $14B6,2 Clear bits 0-3.
C $14B8,2 Is the high nibble 5 or less?
C $14BA,2 Branch if so.
C $14BC,3 Otherwise there's nothing to do.
C $14BF,2 Pick up the lines-giving delay counter from #A$C6.
C $14C1,2 Is the high nibble zero?
C $14C3,2 Branch if not.
C $14C5,2 Prepare to reset the lines-giving delay counter to $10.
C $14C7,2 Update the lines-giving delay counter at #A$C6 (the low nibble is now zero).
C $14C9,3 Get ERIC's coordinates in `X` and `Y`.
C $14CC,2 Is ERIC on the top floor?
C $14CE,2 Branch if so.
C $14D0,2 Is ERIC on the middle floor?
C $14D2,2 Branch if so.
C $14D4,2 Is ERIC on the bottom floor?
C $14D6,2 Branch if so.
C $14D8,2 Pick up ERIC's posture indicator from #A$14.
C $14DA,2 Branch unless ERIC is sitting on a staircase.
C $14DC,2 Lines reprimand #R$4980($00): DON'T SIT ON THE STAIRS.
C $14DE,3 Make any nearby teacher give lines to ERIC.
C $14E1,3 Is ERIC in the classroom he should be in?
C $14E4,2 Branch if not.
C $14E6,2 `A`=$00: ERIC's where he should be.
C $14E8,3 Jump forward.
C $14EB,2 `A`=$FF: ERIC's not where he should be.
C $14ED,2 Store this indicator at #A$EC.
C $14EF,2 Pick up the region identifier (0-7) for ERIC's location.
C $14F1,2 Branch unless ERIC's in the head's study or the staff room.
C $14F3,2 Lines reprimand #R$49A0($01): THE ROOM IS PRIVATE.
C $14F5,3 Make any nearby teacher give lines to ERIC.
C $14F8,2 Event #R$4400($01): ERIC should be in class or the dinner hall now.
C $14FA,3 Has the signal for this event been raised?
C $14FD,2 Branch if so.
C $14FF,2 Pick up the region identifier (0-7) for ERIC's location.
C $1501,2 Is ERIC in a classroom?
C $1503,2 Branch if so.
C $1505,2 Pick up ERIC's animatory state from #A$26.
C $1507,2 Keep only bits 0-2.
C $1509,2 Is ERIC sitting on the floor?
C $150B,2 Branch if so.
C $150D,2 Is ERIC lying on his back?
C $150F,2 Branch if so.
C $1511,3 Otherwise jump forward.
C $1514,2 Lines reprimand #R$4A80($04): GET OFF THE FLOOR.
C $1516,3 Make any nearby teacher give lines to ERIC.
C $1519,2 Pick up the MSB of the lesson clock from #A$40.
C $151B,2 Is it 8 or more?
C $151D,2 Branch if so.
C $151F,2 Is ERIC where he should be?
C $1521,2 Branch if so.
C $1523,2 Lines reprimand #R$49C0($02): GET TO WHERE YOU SHOULD BE.
C $1525,3 Make any nearby teacher give lines to ERIC.
C $1528,2 Event #R$4400($02): ERIC's lesson has started.
C $152A,3 Has the signal for this event been raised?
C $152D,2 Branch if not.
C $152F,2 Pick up ERIC's posture indicator from #A$14.
C $1531,2 Branch if ERIC is standing up.
C $1533,3 Otherwise jump forward.
C $1536,2 Lines reprimand #R$49E0($03): NOW FIND A SEAT.
C $1538,2 Store the lines reprimand identifier at #A$D8.
C $153A,2 Pick up the lines giving delay counter from #A$C6.
C $153C,2 Is the high nibble equal to 1?
C $153E,2 Branch if so.
C $1540,2 Pick up the character number of the teacher who last gave ERIC lines from #A$71.
C $1542,3 Check whether ERIC can be seen by any other teacher.
C $1545,3 Jump forward.
C $1548,3 Can ERIC be seen by a teacher?
C $154B,2 Branch if so.
C $154D,3 Otherwise jump forward.
N $1550 ERIC has been spotted by a teacher doing something he shouldn't be doing.
C $1550,2 Store the character number of the teacher who can see ERIC at #A$71.
C $1552,4 Reset the high and low nibbles of the lines-giving delay counter at #A$C6 to 10 and 0 respectively.
C $1556,2 Pick up the lines reprimand identifier from #A$D8.
C $1558,2 Is it #R$49C0($02) (GET TO WHERE YOU SHOULD BE)?
C $155A,2 Branch if not.
C $155C,2 Pick up the current lesson descriptor from #A$70.
C $155E,2 Keep only the teacher bits (4-7).
C $1560,1 Transfer them to `Y`.
C $1561,2 Is ERIC's teacher for this lesson MR WACKER?
C $1563,2 Branch if not.
C $1565,2 $0B is MR WACKER's character number.
C $1567,3 Jump forward.
C $156A,2 Is ERIC's teacher for this lesson MR ROCKITT?
C $156C,2 Branch if not.
C $156E,2 $0C is MR ROCKITT's character number.
C $1570,3 Jump forward.
C $1573,2 Is ERIC's teacher for this lesson MR WITHIT?
C $1575,2 Branch if not.
C $1577,2 $0D is MR WITHIT's character number.
C $1579,3 Jump forward.
C $157C,2 Is ERIC's teacher for this lesson MR CREAK?
C $157E,2 Branch if not.
C $1580,2 $0E is MR CREAK's character number.
C $1582,3 Jump forward.
C $1585,2 Set `A` to $FF, indicating that ERIC has no teacher for this period.
C $1587,2 Was ERIC seen by his teacher for this lesson?
C $1589,2 Branch if not.
N $158B The truant ERIC has been spotted by his teacher for this period.
C $158B,2 Lines reprimand #R$4AA0($05): COME ALONG WITH ME BOY.
C $158D,2 Store this lines reprimand identifier at #A$D8.
C $158F,4 Increment the identifier of the lines reprimand message at #A$C8 and pick up its new value.
C $1593,2 Has the teacher just found ERIC?
C $1595,2 Branch if so.
C $1597,5 Now `A` is either #R$4AC0($06) (HURRY UP YOU HORROR) or #R$4AE0($07) (DON'T TRY MY PATIENCE BOY).
C $159C,2 Store this lines reprimand identifier at #A$D8.
C $159E,2 Character number $14 is ERIC.
C $15A0,2 Store this lines recipient identifier at #A$72.
C $15A2,2 Pick up the character number of the teacher who saw ERIC.
C $15A4,2 Update the current character number at #A$60.
C $15A6,3 Copy this teacher's buffer to page 0.
C $15A9,3 Make the teacher give lines to ERIC.
C $15AC,3 Restore the current character number to #A$60.
C $15AF,3 Copy the current character's buffer to page 0.
c $15B3 Deal with ERIC
D $15B3 Called from the main loop at #A$0800 to deal with ERIC when he's doing something other than walking or standing still.
C $15B3,2 Pick up the current character number from #A$60.
C $15B5,1 Save it temporarily.
C $15B6,4 Set the current character number at #A$60 to $14 (ERIC).
C $15BA,3 Copy ERIC's character buffer to page 0.
C $15BD,2 Pick up ERIC's status flags from #A$2B.
C $15BF,2 Is bit 6 set?
C $15C1,2 Branch if not.
N $15C3 Bit 6 of ERIC's status flags is set, indicating that he's immobilised.
C $15C3,3 Deal with ERIC if he's being spoken to by little boy no. 10.
C $15C6,3 Jump forward.
C $15C9,2 Is bit 4 of ERIC's status flags set?
C $15CB,2 Branch if not.
N $15CD Bit 4 of ERIC's status flags is set, indicating that he's just been knocked down or unseated.
C $15CD,4 Clear ERIC's midstride indicator at #A$4B.
C $15D1,2 Pick up ERIC's knockout delay counter from #A$30.
C $15D3,2 Branch if it's zero (ERIC's just been knocked over).
C $15D5,2 Is ERIC's knockout delay counter less than $0B?
C $15D7,2 Branch if so (this always happens).
C $15D9,5 Set voice #3 attack length to 8ms and and decay length to 1.5s.
C $15DE,5 Set voice #3 control register: voice on, attack-decay-sustain cycle; noise enabled.
C $15E3,4 Initialise ERIC's knockout delay counter at #A$30 to $0A.
C $15E7,3 Update the SRB for the ERIC's current animatory state and location.
C $15EA,2 Pick up ERIC's animatory state from #A$26.
C $15EC,2 Keep only bits 1 and 2.
C $15EE,2 Compare the result with $05.
C $15F0,2 This branch is never made.
C $15F2,2 Pick up ERIC's animatory state from #A$26.
C $15F4,2 Keep only the direction bit (bit 7).
C $15F6,3 Now `A`=#AS$07($07 or $87): ERIC lying on his back.
C $15F9,3 Jump forward.
C $15FC,2 Pick up ERIC's animatory state from #A$26.
C $15FE,2 Keep only the direction bit (bit 7).
C $1600,3 Now `A`=#AS$06($06 or $86): ERIC sitting on the floor.
C $1603,2 Update ERIC's animatory state.
C $1605,3 Update the SRB for the ERIC's new animatory state.
C $1608,2 Decrement ERIC's knockout delay counter at #A$30.
C $160A,2 Branch unless it's zero now.
C $160C,4 Clear ERIC's status flags at #A$2B.
C $1610,2 Set ERIC's posture indicator at #A$14 to 0: he's not standing up.
C $1612,3 Jump forward.
C $1615,1 Is bit 3 of ERIC's status flags set?
C $1616,2 Branch if not.
N $1618 Bit 3 of ERIC's status flags is set, indicating that he's writing on a blackboard.
C $1618,3 Deal with ERIC when he's writing on a blackboard.
C $161B,3 Jump forward.
C $161E,1 Is bit 2 of ERIC's status flags set?
C $161F,2 Branch if not.
N $1621 Bit 2 of ERIC's status flags is set, indicating that he's hitting.
C $1621,3 Deal with ERIC when he's hitting.
C $1624,3 Jump forward.
C $1627,1 Is bit 1 of ERIC's status flags set?
C $1628,2 Branch if not.
N $162A Bit 1 of ERIC's status flags is set, indicating that he's jumping.
C $162A,3 Deal with ERIC when he's jumping.
C $162D,3 Jump forward.
C $1630,1 Is bit 0 of ERIC's status flags set?
C $1631,2 Branch if not.
N $1633 Bit 0 of ERIC's status flags is set, indicating that he's firing the catapult.
C $1633,3 Deal with ERIC when he's firing the catapult.
C $1636,3 Restore ERIC's character buffer from page 0.
C $1639,3 Restore the current character number to #A$60.
C $163C,3 Copy the current character's buffer to page 0.
c $1640 Check whether ERIC is standing on a boy
D $1640 Used by the routine at #A$189D.
R $1640 O:P Carry flag set if ERIC is standing on a boy
C $1640,2 There are 11 little boys.
C $1642,2 Store this counter at #A$57.
C $1644,6 Pick up ERIC's y-coordinate from #A$FB, store a copy at #A$D4 and increment it. If ERIC is standing on a boy, this would be the boy's y-coordinate.
C $164A,4 Pick up ERIC's x-coordinate from #A$FC and store a copy at #A$D3.
C $164E,4 Set the current character number at #A$60 to $00 (little boy no. 1).
C $1652,3 Is ERIC standing on any of the little boys?
C $1655,2 Branch if not.
C $1657,3 Otherwise return with the carry flag set.
C $165A,2 There are three main kids besides ERIC: ANGELFACE, BOY WONDER and EINSTEIN.
C $165C,2 Store this counter at #A$57.
C $165E,4 Set the current character number at #A$60 to $0F (ANGELFACE).
C $1662,3 Copy the current character's buffer to page 0.
C $1665,2 Pick up the y-coordinate from #A$D4.
C $1667,2 Does it match the character's y-coordinate?
C $1669,2 Branch if not.
C $166B,2 Decrement the x-coordinate at #A$D3.
C $166D,2 Pick up the character's x-coordinate from #A$FC.
C $166F,2 Is the character's x-coordinate smaller?
C $1671,2 Branch if so (without restoring the x-coordinate at #A$D3 to its original value, which is a #BUG#leapsOfFaith(bug)).
C $1673,6 Add two to the x-coordinate at #A$D3 and pick up its new value.
C $1679,2 Is the character's x-coordinate greater?
C $167B,2 Branch if so (without restoring the x-coordinate at #A$D3 to its original value, which is a #BUG#leapsOfFaith(bug)).
C $167D,2 Pick up the boy's animatory state from #A$26.
C $167F,2 Keep only bits 0-3.
C $1681,2 Is the boy lying flat on his back?
C $1683,2 Branch if not.
C $1685,2 Character number $14 is ERIC.
C $1687,3 Copy ERIC's character buffer into page 0.
C $168A,1 Set the carry flag: ERIC is standing on a boy.
C $168B,3 Return.
C $168E,2 Increment the current character number at #A$60.
C $1690,2 Decrement the character counter at #A$57.
C $1692,2 Branch back to check any remaining boys.
C $1694,2 Character number $14 is ERIC.
C $1696,3 Copy ERIC's character buffer into page 0.
C $1699,1 Clear the carry flag: ERIC is not standing on a boy.
c $169B 'F' or SPACE pressed - fire catapult
D $169B #ZX$F46E
D $169B Called from the main loop at #A$0800.
C $169B,8 Prepare to address the buffer for ERIC's pellet at #A$8B60.
C $16A3,4 Pick up the pellet's x-coordinate.
C $16A7,2 Is the pellet already airborne?
C $16A9,2 Return if so.
C $16AB,2 Bit 0 set (ERIC is firing the catapult).
C $16AD,2 #AS$08($08) is the animatory state of ERIC raising the catapult.
C $16AF,2 This will initialise the catapult-firing action timer to $18.
N $16B1 This entry point is used by the routines at #A$16D0 (with `A`=$10, `X`=$02 and `Y`=#AS$0C($0C) when ERIC has just jumped), #A$16DF (with `A`=$12, `X`=$04 and `Y`=#AS$0A($0A) when ERIC has just begun to throw a punch) and #A$19A5 (with `A`=$0A, `X`=$08 and `Y`=#AS$0D($0D) when ERIC has just started writing on a blackboard).
C $16B1,2 Initialise ERIC's action timer at #A$FE.
C $16B3,2 Pick up ERIC's posture indicator from #A$14.
C $16B5,2 Return unless ERIC is standing up.
C $16B7,2 Update ERIC's status flags at #A$2B.
C $16B9,1 Transfer ERIC's next animatory state to `A`.
C $16BA,1 Save it temporarily.
C $16BB,3 Update the SRB for ERIC's current animatory state.
C $16BE,4 Pick up ERIC's current animatory state from #A$26 and store it at #A$D2.
C $16C2,2 Clear all but the direction bit (bit 7).
C $16C4,2 Save this base animatory state at #A$26.
C $16C6,1 Restore ERIC's next animatory state to `A`.
C $16C7,3 Adjust bit 7 according to the direction ERIC's facing.
C $16CA,2 Save the new animatory state with the correct bit 7.
C $16CC,3 Update the SRB for ERIC's new animatory state.
c $16D0 'J' or 'L' pressed - jump
D $16D0 #ZX$F499
D $16D0 Called from the main loop at #A$0800.
C $16D0,3 Is ERIC on a staircase?
C $16D3,2 Return if so.
C $16D5,2 Bit 1 set: ERIC is jumping.
C $16D7,2 #AS$0C($0C) is the animatory state of ERIC with his arm raised.
C $16D9,2 This will initialise ERIC's action timer at #A$FE to $10.
C $16DB,3 Start the jump.
c $16DF 'H' pressed - hit
D $16DF #ZX$F492
D $16DF Called from the main loop at #A$0800.
C $16DF,2 Bit 2 set: ERIC is hitting.
C $16E1,2 #AS$0A($0A) is the animatory state of ERIC raising his fist.
C $16E3,2 This will initialise ERIC's action timer at #A$FE to $12.
C $16E5,3 Start the punch.
u $16E8 Unused
B $16E8,1,1
c $16E9 Make a teacher wipe a blackboard
D $16E9 #ZX$71E8
D $16E9 The address of this interruptible subcommand routine is placed into a teacher's buffer by the routines at #A$09E9 and #A$0A58.
C $16E9,8 Replace the address of this interruptible subcommand routine in the teacher's buffer with that of #A$170E below.
C $16F1,3 Get the identifier and coordinates of the blackboard closest to the teacher.
C $16F4,4 Wiping a blackboard requires 32 distinct actions (in 8 groups of 4: two paces forward, arm up, arm down).
C $16F8,2 Pick up the x-coordinate of the leftmost column of the blackboard.
C $16FA,5 Add 7 and store the result at #A$AD. This is the x-coordinate of the rightmost column of the blackboard, and the first to be wiped.
C $16FF,4 Pick up the y-coordinate of the top row of the blackboard and store it at #A$AE.
C $1703,6 Reset the blackboard pixel column counter at #A$19, and the number of the character who last wrote on the board at #A$1A.
C $1709,2 Pick up the blackboard identifier from #A$DA.
C $170B,3 Restore the blackboard's buffer from page 0.
N $170E After the initial call to this routine, each subsequent call enters here.
C $170E,2 Pick up the number of board-wiping actions remaining.
C $1710,2 Branch unless the teacher has finished wiping the board.
C $1712,3 Terminate this interruptible subcommand.
C $1715,3 Update the SRB for the teacher's current animatory state and location.
C $1718,4 Decrement the board-wiping action counter at #A$AC and pick up its new value.
C $171C,1 Is the teacher midstride or does he have his arm raised?
C $171D,2 Branch if not.
C $171F,1 Save the shifted board-wiping action counter temporarily.
C $1720,6 Clear bits 0-2 of the teacher's animatory state at #A$26, thus moving him from the midstride position or lowering his arm.
C $1726,1 Restore the shifted board-wiping action counter.
C $1727,1 Was the teacher midstride?
C $1728,2 Branch if not.
C $172A,2 Decrement the teacher's x-coordinate at #A$FC, moving him forward to the next blackboard column.
C $172C,3 Update the SRB for the teacher's new animatory state and location.
C $172F,3 Return.
C $1732,1 Is the teacher ready to raise his arm (and wipe)?
C $1733,2 Branch if so.
C $1735,2 Otherwise increment the teacher's animatory state at #A$26, moving him midstride on his way to the next blackboard column.
C $1737,3 Jump back.
N $173A The teacher is ready to raise his arm and wipe a column of the board.
C $173A,7 Add 5 to the teacher's animatory state at #A$26, making him raise his arm.
C $1741,3 Update the SRB for the teacher's new animatory state.
C $1744,2 Pick up the x-coordinate of the column of the blackboard to wipe.
C $1746,5 Subtract the x-coordinate of the leftmost column of the skool on screen; store the resulting screen x-coordinate at #A$49.
C $174B,4 Pick up the y-coordinate of the top row of the blackboard to wipe and copy it to #A$4A.
C $174F,3 Update the SRB for the character cell in the top row of the blackboard.
C $1752,2 Increment the y-coordinate at #A$4A.
C $1754,3 Update the SRB for the character cell in the bottom row of the blackboard.
C $1757,4 Pick up the x-coordinate of the column of the blackboard to wipe and copy it to #A$15.
C $175B,4 Pick up the y-coordinate of the top row of the blackboard to wipe and copy it to #A$16.
C $175F,3 Wipe the blackboard character cell in the top row clean.
C $1762,2 Increment the y-coordinate at #A$16.
C $1764,3 Wipe the blackboard character cell in the bottom row clean.
C $1767,2 Decrement the blackboard column x-coordinate at #A$AD.
c $176F Check whether ERIC has jumped up to the safe or a shield
D $176F Used by the routine at #A$189D.
C $176F,3 Update the SRB for ERIC's current animatory state and location.
C $1772,2 Increment ERIC's animatory state at #A$26.
C $1774,2 Decrement ERIC's y-coordinate at #A$FB.
C $1776,3 Update the SRB for ERIC's new animatory state and location.
C $1779,4 Pick up ERIC's x-coordinate from #A$FC and store a copy at #A$E9.
C $177D,4 Pick up ERIC's y-coordinate from #A$FB and store a copy at #A$EA.
C $1781,2 Pick up ERIC's animatory state from #A$26.
C $1783,1 Is ERIC facing left?
C $1784,2 Branch if so.
C $1786,4 ERIC is facing right. Adjust #A$E9 to get the x-coordinate of his hand.
C $178A,4 Is ERIC's hand at x-coordinate 10 (where the safe is)?
C $178E,2 Branch if so.
C $1790,4 Pick up the coordinates of ERIC's hand.
C $1794,3 Check whether ERIC has jumped up to a shield.
C $1797,4 Is ERIC on the middle floor?
C $179B,2 Branch if not.
N $179D ERIC has just jumped up to the safe.
C $179D,2 Pick up the game mode indicator from #A$46.
C $179F,2 Are all the shields flashing?
C $17A1,2 Return if not.
C $17A3,2 $02 is the identifier for the Exam Room blackboard.
C $17A5,2 Store this identifier at #A$57.
C $17A7,1 Transfer the blackboard identifier to `Y`.
C $17A8,3 Copy the blackboard's buffer into page 0.
C $17AB,2 Character number $14 is ERIC.
C $17AD,2 Was ERIC the last person to write on this blackboard?
C $17AF,2 Branch if not to check the next blackboard.
C $17B1,4 Pick up the first character written on the board by ERIC and convert it to upper case.
C $17B5,2 Does it match the first letter of the safe combination?
C $17B7,2 Branch if not to check the next blackboard.
C $17B9,4 Pick up the second character written on the board by ERIC and convert it to upper case.
C $17BD,2 Does it match the second letter of the safe combination?
C $17BF,2 Branch if not to check the next blackboard.
C $17C1,4 Pick up the third character written on the board by ERIC and convert it to upper case.
C $17C5,2 Does it match the third letter of the safe combination?
C $17C7,2 Branch if not to check the next blackboard.
C $17C9,4 Pick up the fourth character written on the board by ERIC and convert it to upper case.
C $17CD,2 Does it match the fourth letter of the safe combination?
C $17CF,2 Branch if not to check the next blackboard.
C $17D1,3 Jump forward.
C $17D4,2 Move to the next blackboard.
C $17D6,2 Pick up the blackboard identifier from #A$57.
C $17D8,2 Return if we've checked every blackboard.
C $17DA,3 Otherwise jump back to check the next blackboard.
N $17DD ERIC has just opened the safe.
C $17DD,4 Set the safe status indicator at #A$D5 to $FF: the safe is flashing.
C $17E1,3 Move to the next phase of the game.
c $17E5 Deal with ERIC when he's hitting
D $17E5 #ZX$F4A4
D $17E5 Used by the routine at #A$15B3.
C $17E5,2 Decrement ERIC's action timer at #A$FE.
C $17E7,2 Branch unless it's zero now.
C $17E9,3 Otherwise restore ERIC's animatory state to what it was before he threw the punch.
C $17EC,2 Pick up ERIC's action timer from #A$FE.
C $17EE,2 Is it time to raise the fist to eye level?
C $17F0,2 Branch if not.
C $17F2,3 Raise ERIC's fist to eye level.
C $17F5,2 Is it time to check whether anyone was hit?
C $17F7,2 Branch if not.
C $17F9,2 Pick up ERIC's y-coordinate from #A$FB.
C $17FB,2 Pick up ERIC's animatory state from #A$26.
C $17FD,1 Is ERIC facing right?
C $17FE,2 Branch if so.
C $1800,2 Pick up ERIC's x-coordinate from #A$FC.
C $1802,3 Subtract 2 from it to get the x-coordinate of ERIC's fist.
C $1805,3 Jump forward.
C $1808,2 Pick up ERIC's x-coordinate from #A$FC.
C $180A,3 Add 2 to it to get the x-coordinate of ERIC's fist.
C $180D,1 Transfer the x-coordinate of ERIC's fist to `X`.
C $180E,3 Did ERIC hit anyone?
C $1811,2 Branch if not.
C $1813,2 Character number $0F is ANGELFACE.
C $1815,2 Store the character number of ERIC's victim at #A$C1.
C $1817,2 Branch unless ERIC hit ANGELFACE.
C $1819,5 Add 30 to the score and print it.
C $181E,3 Restore the character's buffer from page 0.
C $1821,4 Pick up the current character number from #A$60 and copy it to #A$2F.
C $1825,4 Pick up the character number of ERIC's victim from #A$C1 and copy it to #A$60.
C $1829,3 Copy the victim's character buffer into page 0.
C $182C,3 Knock the victim to the floor.
C $182F,10 Set voice #2 frequency to $1000.
C $1839,5 Set voice #2 attack length to 24ms and decay length to 114ms.
C $183E,5 Set voice #2 sustain volume to 0 and release length to 6ms.
C $1843,5 Set voice #2 control register: voice on, attack-decay-sustain cycle; noise enabled.
C $1848,2 Lines reprimand #R$4CC0($0E): DON'T HIT YOUR MATES.
C $184A,3 Make any nearby teacher give ERIC lines.
c $184E Deal with ERIC when he's writing on a blackboard
D $184E #ZX$F6AA
D $184E Used by the routine at #A$15B3.
C $184E,4 Decrement ERIC's action timer at #A$FE (which is reset to $0A by the routine at #A$19A5 when ERIC starts writing on the blackboard and each time he writes a character on it) and pick up the new value.
C $1852,2 Is it 4 now?
C $1854,2 Branch if not.
C $1856,3 Lower ERIC's arm.
C $1859,2 Is ERIC's action timer zero now?
C $185B,2 Branch if so.
C $185D,3 Otherwise return.
C $1860,4 Reset ERIC's action timer at #A$FE to 1.
C $1864,4 Pick up the keyboard/joystick reading from #A$4C and copy it to #A$57.
C $1868,4 Clear the keyboard/joystick reading at #A$4C.
C $186C,2 Pick up the keyboard/joystick reading from #A$57.
C $186E,2 Return if no key was pressed.
C $1870,2 Was RETURN pressed?
C $1872,2 Branch if not.
C $1874,3 Make ERIC stop writing on the blackboard.
C $1877,2 Is the character code of the keypress less than $20?
C $1879,2 Return if so.
C $187B,2 Is the character code of the keypress $80 or more?
C $187D,2 Return if so.
C $187F,3 Get the identifier and coordinates of the blackboard closest to ERIC and copy its buffer into page 0.
C $1882,2 Prepare `X` to check the last byte of the blackboard's buffer.
C $1884,2 Pick up one of the last four bytes of the blackboard's buffer from #R$DF($DF-$E2).
C $1886,2 Is a character code stored here?
C $1888,2 Branch if so to check the previous byte.
C $188A,4 Otherwise store the character code of the last keypress at this location in the blackboard's buffer.
C $188E,3 Jump forward.
C $1891,1 Move to the previous byte in the blackboard's buffer.
C $1892,2 Branch back to check the character code there.
C $1894,2 Pick up the keyboard/joystick reading from #A$57.
C $1896,3 Write the corresponding character on the blackboard.
C $1899,3 Raise ERIC's arm.
c $189D Deal with ERIC when he's jumping
D $189D #ZX$F533
D $189D Used by the routine at #A$15B3.
C $189D,2 Decrement ERIC's action timer at #A$FE.
C $189F,2 Branch unless it's zero.
C $18A1,3 Make ERIC finish the jump.
C $18A4,2 Pick up ERIC's action timer from #A$FE.
C $18A6,2 Is ERIC's action timer now $0D?
C $18A8,2 Branch if not.
C $18AA,3 Check whether ERIC has jumped up to the safe or a shield.
C $18AD,2 Is it time to give ERIC lines for jumping?
C $18AF,2 Branch if not.
C $18B1,2 Lines reprimand #R$4CE0($0F): YOU ARE NOT A KANGAROO.
C $18B3,3 Make any nearby teacher give ERIC lines.
C $18B6,2 Is it time to make the jumping sound effect?
C $18B8,2 Branch if not.
C $18BA,4 Set the sound effect identifier at #A$2C.
C $18BE,4 Initialise the sound effect timer at #A$2D.
C $18C2,3 Return.
C $18C5,2 Is it time to move ERIC's arm back?
C $18C7,2 Branch if not.
C $18C9,3 Decrement ERIC's animatory state and return.
C $18CC,2 Is it time to bring ERIC back down to the floor?
C $18CE,2 Branch if not.
C $18D0,3 Update the SRB for the ERIC's current animatory state and location.
C $18D3,2 Increment ERIC's y-coordinate, bringing him back to the floor.
C $18D5,3 Update the SRB for ERIC's new location.
C $18D8,3 Return.
C $18DB,2 Is ERIC's action timer equal to $86 now?
C $18DD,2 Branch if not.
C $18DF,3 Return.
C $18E2,2 Is ERIC's action timer equal to $80 now (meaning ERIC has landed after jumping on a boy)?
C $18E4,2 Branch if not.
C $18E6,4 Set ERIC's action timer at #A$FE to 7.
C $18EA,3 Return.
C $18ED,2 Is ERIC's action timer less than $80 (we know it's not equal to $80)? (This instruction is redundant.)
C $18EF,2 Branch if so.
C $18F1,3 ERIC jumped while standing on a boy, so subtract $80 from his action timer value before performing the usual checks.
C $18F4,3 Jump back.
C $18F7,2 Is it time to check whether ERIC has jumped while standing on a boy?
C $18F9,2 Branch if so.
C $18FB,3 Otherwise return.
C $18FE,2 Pick up the keyboard/joystick reading from #A$4C.
C $1900,1 Save it temporarily.
C $1901,4 Reset the keyboard/joystick reading at #A$4C to zero.
C $1905,1 Restore the keyboard/joystick reading to `A`.
C $1906,2 Was 'J' (jump) pressed?
C $1908,2 Branch if so.
C $190A,2 Was 'L' (jump) pressed?
C $190C,2 Branch if so.
C $190E,3 Otherwise return.
C $1911,3 Is ERIC is standing on a boy?
C $1914,2 Return if not.
C $1916,4 Set the action timer for ERIC at #A$FE to $90. It will remain at $80 or more until the jump above the boy has finished.
c $191B Deal with ERIC when he's firing the catapult
D $191B #ZX$F41F
D $191B Used by the routine at #A$15B3.
C $191B,2 Decrement ERIC's action timer at #A$FE.
C $191D,2 Branch unless it's zero now.
N $191F This entry point is used by the routines at #A$17E5, #A$184E and #A$189D.
C $191F,4 Clear ERIC's status flags at #A$2B.
C $1923,5 Set voice #2 control register: voice off, release cycle; triangle waveform enabled.
N $1928 This entry point is used by the routine at #A$184E.
C $1928,3 Update the SRB for the ERIC's current animatory state and location.
C $192B,4 Restore ERIC's pre-action animatory state from #A$D2.
C $192F,3 Update the SRB for ERIC's new animatory state.
C $1932,3 Return.
C $1935,2 Pick up ERIC's action timer from #A$FE.
C $1937,2 Is it time to raise the catapult to eye level?
C $1939,2 Branch if not.
C $193B,3 Make ERIC raise the catapult to eye level.
C $193E,2 Is it time to start lowering the catapult?
C $1940,2 Branch if not.
C $1942,3 Make ERIC lower the catapult.
C $1945,2 Is it time to launch the pellet?
C $1947,2 Branch if so.
C $1949,3 Otherwise return.
C $194C,4 Pick up the current character number from #A$60 and store a copy at #A$DB.
C $1950,2 Character number $13 is ERIC's pellet.
C $1952,2 Store this at #A$DC.
C $1954,3 Set the pellet on its way from ERIC's catapult.
C $1957,10 Set voice #2 frequency to $3000.
C $1961,5 Set voice #2 attack length to 8ms and decay length to 2.4s.
C $1966,5 Set voice #2 sustain volume to 0 and release length to 6ms.
C $196B,5 Set voice #2 control register: voice on, attack-sustain-decay cycle; triangle waveform enabled.
C $1970,2 Lines reprimand #R$4CA0($0D): CATAPULTS ARE FORBIDDEN.
N $1972 This entry point is used by the routines at #A$17E5 (with `A`=#R$4CC0($0E): DON'T HIT YOUR MATES) and #A$189D (with `A`=#R$4CE0($0F): YOU ARE NOT A KANGAROO).
C $1972,2 Store the lines reprimand identifier at #A$D8.
C $1974,3 Was ERIC seen by a teacher?
C $1977,2 Return if not.
C $1979,2 Copy the character number of the teacher who saw ERIC to #A$C0. (This might overwrite the character number already stored there by the routine at #A$0A58, which is a #BUG#bullyAndBlackboard(bug).)
C $197B,4 Store ERIC's character number ($14) at #A$72.
C $197F,3 Restore ERIC's character buffer from page 0.
C $1982,2 Pick up the character number of the teacher who saw ERIC from #A$C0.
C $1984,2 Update the current character number at #A$60.
C $1986,3 Copy the teacher's character buffer to page 0.
C $1989,3 Make the teacher give ERIC lines.
C $198C,4 Set the current character number at #A$60 to $14 (ERIC).
C $1990,3 Copy ERIC's character buffer to page 0.
c $1994 Wipe a blackboard character cell clean
D $1994 Used by the routine at #A$16E9.
R $1994 /(#A$15)/ Blackboard character cell x-coordinate
R $1994 /(#A$16)/ Blackboard character cell y-coordinate
C $1994,3 Get the address of the skool tile corresponding to the blackboard character cell.
C $1997,2 `X` will count the 8 bytes in the skool tile.
C $1999,2 Prepare `Y` for indexed addressing.
C $199B,9 Set every bit in the skool tile, thus wiping the blackboard character cell clean.
c $19A5 'W' pressed - write
D $19A5 #ZX$F650
D $19A5 Called from the main loop at #A$0800.
C $19A5,2 Pick up ERIC's posture indicator from #A$14.
C $19A7,2 Branch if ERIC is standing up.
C $19A9,3 Otherwise return.
C $19AC,2 Pick up ERIC's y-coordinate from #A$FB.
C $19AE,2 is ERIC on the top floor?
C $19B0,2 Branch if so.
C $19B2,2 Is ERIC on the middle floor?
C $19B4,2 Branch if so.
C $19B6,3 Otherwise return.
N $19B9 ERIC is on the middle floor.
C $19B9,2 Pick up ERIC's x-coordinate from #A$FC.
C $19BB,2 Is it less than 43?
C $19BD,2 Branch if so.
C $19BF,2 Is ERIC's x-coordinate 47 or more?
C $19C1,2 Branch if so.
C $19C3,3 Jump forward (ERIC is beside the Exam Room blackboard).
C $19C6,2 Is ERIC's x-coordinate less than 28?
C $19C8,2 Return if so.
C $19CA,2 Is ERIC's x-coordinate 32 or more?
C $19CC,2 Return if so.
C $19CE,3 Jump forward (ERIC is beside the White Room blackboard).
N $19D1 ERIC is on the top floor.
C $19D1,2 Pick up ERIC's x-coordinate from #A$FC.
C $19D3,2 Is it 44 or more?
C $19D5,2 Return if so.
C $19D7,2 Is ERIC's x-coordinate less than 48?
C $19D9,2 Return if so.
N $19DB ERIC is standing beside one of the blackboards.
C $19DB,3 Get the identifier and coordinates of the blackboard closest to ERIC.
C $19DE,2 Is the blackboard clean?
C $19E0,2 Branch if so.
C $19E2,2 $00: this blackboard is dirty.
C $19E4,3 Jump forward.
C $19E7,2 $80: this blackboard is clean.
C $19E9,8 Fill the last four bytes of the blackboard's buffer at #A$DF with either $00 (ERIC is writing on a dirty blackboard) or $80 (ERIC is writing on a clean blackboard).
C $19F1,4 Store $14 at #A$1A, indicating that ERIC has (or will have) written on this blackboard.
N $19F5 This entry point is used by the routine at #A$184E.
C $19F5,2 Pick up the blackboard identifier from #A$DA.
C $19F7,3 Restore the blackboard's buffer from page 0.
C $19FA,2 Bit 3 set: ERIC is writing on a blackboard.
C $19FC,2 #AS$0D($0D) is the animatory state of ERIC with his arm up (as if writing).
C $19FE,2 This will initialise ERIC's action timer at #A$FE to $0A.
C $1A00,3 Raise ERIC's arm.
c $1A04 Make a character walk up and down until a certain time
D $1A04 #ZX$62D7
D $1A04 Used by command lists #R$40DC($88), #R$40E7($8C), #R$40FA($8E), #R$410D($90), #R$4118($92), #R$4123($94), #R$413D($96), #R$4150($98), #R$415B($9A), #R$4166($9C), #R$4180($9E), #R$4193($A0), #R$419E($A2), #R$41A9($A4), #R$41C3($A6), #R$41D6($A8), #R$41E1($AA), #R$41E8($AC), #R$41F7($AE), #R$4206($B0), #R$420D($B2), #R$421C($B4), #R$4247($BA), #R$424E($BC), #R$4298($C6), #R$429F($C8), #R$42A6($CA), #R$42CF($CE), #R$42E3($D0), #R$42FB($D2), #R$4309($D4), #R$431F($D6), #R$4334($D8), #R$4352($DA), #R$4376($DE) and #R$438A($E0).
C $1A04,6 Reset bit 1 of the flags byte at #A$3F: the character is not running continuously.
C $1A0A,5 Collect the event identifier from the command list and store it at #A$A6.
C $1A0F,4 Copy the character's current x-coordinate to #A$A7. This will be the walkabout origin x-coordinate.
C $1A13,8 Replace the address of this primary command routine in the character's buffer with that of #A$1A1B below.
N $1A1B This entry point is used by the routine at #A$27AB.
C $1A1B,2 Pick up the walkabout event identifier from #A$A6.
C $1A1D,3 Has the signal for this event been raised?
C $1A20,2 Branch if not to begin another mini-walkabout.
C $1A22,2 Pick up the character's x-coordinate from #A$FC.
C $1A24,2 Is the character at the walkabout origin?
C $1A26,2 Branch if not.
C $1A28,2 Pick up the character's animatory state from #A$26.
C $1A2A,1 Is the character midstride?
C $1A2B,2 Branch if so.
C $1A2D,3 Otherwise terminate this primary command.
C $1A30,4 Pick up the walkabout origin x-coordinate from #A$A7 and copy it to #A$AC, making it the next mini-walkabout destination.
C $1A34,3 Jump forward.
N $1A37 The signal has not been raised yet, so it's time for another mini-walkabout.
C $1A37,7 Generate a random value between 0 and 7 and store it at #A$57 temporarily.
C $1A3E,2 Pick up the walkabout origin x-coordinate from #A$A7.
C $1A40,5 Subtract the random value between 0 and 7 and store the result at #A$AC. This will be the walkabout destination x-coordinate.
C $1A45,8 Place the address of the interruptible subcommand routine at #A$136F into the character's buffer.
C $1A4D,3 Jump to #A$136F.
u $1A50 Unused
B $1A50,1,1
c $1A51 Check whether a character is beside a chair
D $1A51 #ZX$6BF0
D $1A51 Used by the routines at #A$1CEC and #A$3687. Returns with the carry flag set if the character must turn round first. Otherwise returns with the zero flag set only if the character is standing beside a chair and is facing the right way to sit on it.
C $1A51,2 Pick up the character's animatory state from #A$26.
C $1A53,1 Is the character facing left?
C $1A54,2 Branch if so.
C $1A56,3 Otherwise jump forward.
N $1A59 The character is facing left.
C $1A59,4 Pick up the character's x- and y-coordinates from #A$FB and #A$FC.
C $1A5D,3 Get the play area region identifier for the character's location.
C $1A60,2 Branch if the character's on the top floor, to the left of the Map Room wall.
C $1A62,2 Is the character on the top floor, to the right of the Map Room wall?
C $1A64,2 Branch if so.
N $1A66 The character is facing left, and is on the middle floor.
C $1A66,2 Pick up the character's x-coordinate from #A$FC.
C $1A68,2 Is the character to the right of the Exam Room wall?
C $1A6A,2 Branch if so.
C $1A6C,2 Is the character at or to the right of the leftmost chair in the White Room?
C $1A6E,2 Branch if so.
C $1A70,3 Jump forward (the character should turn round).
C $1A73,2 Is the character to the right of the rightmost chair in the White Room?
C $1A75,2 Branch if so (the character is not beside a chair).
C $1A77,2 Store the character's x-coordinate at #A$57.
C $1A79,1 Is the character's x-coordinate even?
C $1A7A,2 Branch if so (the character is not beside a chair).
C $1A7C,3 Otherwise jump forward (the character is beside a chair).
C $1A7F,3 Jump forward (the character should keep moving in the same direction).
N $1A82 The character is facing left, and is on the middle floor, to the right of the Exam Room wall.
C $1A82,2 Is the character at or to the right of the leftmost chair in the Exam Room?
C $1A84,2 Branch if so.
C $1A86,3 Jump forward (the character should turn round).
C $1A89,2 Is the character to the right of the rightmost chair in the Exam Room?
C $1A8B,2 Branch if so (the character is not beside a chair).
C $1A8D,2 Is the character between the first and last chairs in the set furthest from the blackboard?
C $1A8F,2 Branch if so.
C $1A91,2 Is the character to the right of the set of chairs nearest the blackboard?
C $1A93,2 Branch if so (the character is not beside a chair).
C $1A95,2 Store the character's x-coordinate at #A$57.
C $1A97,1 Is the character's x-coordinate even?
C $1A98,2 Branch if so (the character should keep moving in the same direction).
C $1A9A,3 Otherwise jump forward (the character is beside a chair).
C $1A9D,3 Jump forward (the character should keep moving in the same direction).
C $1AA0,2 Store the character's x-coordinate at #A$57.
C $1AA2,1 Is the character's x-coordinate odd?
C $1AA3,2 Branch if so (the character should keep moving in the same direction).
C $1AA5,3 Otherwise jump forward (the character is beside a chair).
C $1AA8,3 Jump forward (the character should keep moving in the same direction).
N $1AAB The character is facing left, and is on the top floor.
C $1AAB,2 Pick up the character's x-coordinate from #A$FC.
C $1AAD,2 Is the character to the right of the Map Room wall?
C $1AAF,2 Branch if so.
C $1AB1,2 Is the character at or to the right of the leftmost chair in the Reading Room?
C $1AB3,2 Branch if so.
C $1AB5,3 Otherwise jump forward (the character should turn round).
C $1AB8,2 Is the character to the right of the rightmost chair in the Reading Room?
C $1ABA,2 Branch if so (the character is not beside a chair).
C $1ABC,2 Store the character's x-coordinate at #A$57.
C $1ABE,1 Is the character's x-coordinate odd?
C $1ABF,2 Branch if so (the character should keep moving in the same direction).
C $1AC1,3 Otherwise jump forward (the character is beside a chair).
C $1AC4,3 Jump forward (the character should keep moving in the same direction).
N $1AC7 The character is facing left, and is on the top floor, to the right of the Map Room wall.
C $1AC7,2 Is the character at or to the right of the leftmost chair in the Map Room?
C $1AC9,2 Branch if so.
C $1ACB,3 Otherwise jump forward (the character should turn round).
C $1ACE,2 Is the character to the right of the rightmost chair in the Map Room?
C $1AD0,2 Branch if so (the character is not beside a chair).
C $1AD2,2 Store the character's x-coordinate at #A$57.
C $1AD4,1 Is the character's x-coordinate odd?
C $1AD5,2 Branch if so (the character should keep moving in the same direction).
C $1AD7,3 Otherwise jump forward (the character is beside a chair).
C $1ADA,3 Jump forward (the character should keep moving in the same direction).
N $1ADD The character is facing right.
C $1ADD,4 Pick up the character's x- and y-coordinates from #A$FB and #A$FC.
C $1AE1,3 Get the play area region identifier for the character's location.
C $1AE4,2 Branch if the character is on the top floor, to the left of the Map Room wall.
C $1AE6,2 Is the character on the top floor, to the right of the Map Room wall?
C $1AE8,2 Branch if so.
N $1AEA The character is facing right, and is on the middle floor.
C $1AEA,2 Pick up the character's x-coordinate from #A$FC.
C $1AEC,2 Is the character to the right of the Exam Room wall?
C $1AEE,2 Branch if so.
C $1AF0,2 Is the character to the right of the rightmost chair in the White Room?
C $1AF2,2 Branch if so (the character should turn round).
C $1AF4,3 Otherwise jump forward (the character should keep moving in the same direction).
C $1AF7,3 Jump forward (the character should turn round).
N $1AFA The character is facing right, and is on the middle floor, to the right of the Exam Room wall.
C $1AFA,2 Is the character to the right of the rightmost chair in the Exam Room?
C $1AFC,2 Branch if so (the character should turn round).
C $1AFE,3 Otherwise jump forward (the character should keep moving in the same direction).
C $1B01,3 Jump forward (the character should turn round).
N $1B04 The character is facing right, and is on the top floor.
C $1B04,2 Pick up the character's x-coordinate from #A$FC.
C $1B06,2 Is the character to the right of the Map Room wall?
C $1B08,2 Branch if so.
C $1B0A,2 Is the character at or to the right of the rightmost chair in the Reading Room?
C $1B0C,2 Branch if so (the character should turn round).
C $1B0E,3 Otherwise jump forward (the character should keep moving in the same direction).
C $1B11,3 Jump forward (the character should turn round).
N $1B14 The character is facing right, and is on the top floor, to the right of the Map Room wall.
C $1B14,2 Is the character to the right of the rightmost chair in the Map Room?
C $1B16,2 Branch if so (the character should turn round).
C $1B18,3 Otherwise jump forward (the character should keep moving in the same direction).
C $1B1B,3 Jump forward (this instruction is redundant).
C $1B1E,3 Carry flag set and zero flag reset: the character should turn round.
C $1B21,3 Return.
C $1B24,3 Carry flag reset and zero flag reset: the character should keep moving in the same direction.
C $1B27,3 Return.
C $1B2A,3 Carry flag reset and zero flag set: the character is beside a chair and facing the right way to sit down.
c $1B2E Determine the next move of a character following another character
D $1B2E #ZX$7ADC
D $1B2E Called from the main loop at #A$0800, and also used by the routine at #A$0C3F. Returns with one of the following values in `A` depending on the relative locations of the follower and his target:
D $1B2E #TABLE(default) { =h `A` | =h Meaning } { 0    | Follower is at the same coordinates as the target } { 1    | Follower should go (or continue going) upstairs } { 2    | Follower should go (or continue going) downstairs } { 3    | Follower should go left } { 4    | Follower should go right } TABLE#
R $1B2E /(#A$4D)/ Number of the target character being followed
C $1B2E,11 Prepare to address the target character's buffer.
C $1B39,7 Pick up the target character's x-coordinate and copy it to #A$08.
C $1B40,5 Pick up the target character's y-coordinate and copy it to #A$09.
C $1B45,3 Is the follower on a staircase?
C $1B48,2 Branch if not.
N $1B4A The follower is on a staircase.
C $1B4A,2 Pick up the follower's x-coordinate.
C $1B4C,2 Is the follower on a staircase on the right side of the skool?
C $1B4E,2 Branch if so.
C $1B50,2 Pick up the follower's animatory state.
C $1B52,1 Is the follower facing right?
C $1B53,2 Branch if so.
C $1B55,5 Return with `A`=1: the follower should continue going upstairs.
C $1B5A,5 Return with `A`=2: the follower should continue going downstairs.
C $1B5F,2 Pick up the follower's animatory state.
C $1B61,1 Is the follower facing right?
C $1B62,2 Branch if so.
C $1B64,5 Return with `A`=2: the follower should continue going downstairs.
C $1B69,5 Return with `A`=1: the follower should continue going upstairs.
N $1B6E The follower is not on a staircase.
C $1B6E,2 Pick up the follower's y-coordinate from #A$FB.
C $1B70,2 Does it match the target's y-coordinate?
C $1B72,2 Branch if not.
C $1B74,2 Pick up the follower's x-coordinate from #A$FB.
C $1B76,2 Does it match the target's x-coordinate?
C $1B78,2 Branch if not.
C $1B7A,5 Return with `A`=0: the follower is at the same coordinates as the target.
C $1B7F,2 Pick up the follower's y-coordinate from #A$FB.
C $1B81,1 Save it temporarily.
C $1B82,4 Change the follower's y-coordinate to match that of the target.
C $1B86,3 Check whether the target is on a staircase.
C $1B89,3 Restore the follower's y-coordinate at #A$FB.
C $1B8C,2 Branch unless the target is on a staircase.
C $1B8E,2 Is the target's y-coordinate less than the follower's?
C $1B90,2 Branch if so.
C $1B92,4 Set the target y-coordinate at #A$09 to 17 (bottom floor).
C $1B96,3 Jump forward.
C $1B99,4 Set the target y-coordinate at #A$09 to 3 (top floor).
C $1B9D,4 Pick up the follower's x- and y-coordinates from #A$FB and #A$FC.
C $1BA1,5 Get the play area region identifier for the follower's location and store it at #A$57.
C $1BA6,9 Get the play area region identifier for the target location and store it at #A$56.
C $1BAF,2 Is the follower in the same region as the target?
C $1BB1,2 Branch if not.
C $1BB3,2 Pick up the follower's x-coordinate from #A$FC.
C $1BB5,2 Is it less than the target x-coordinate?
C $1BB7,2 Branch if so.
C $1BB9,5 Return with `A`=3: the follower should go left.
C $1BBE,5 Return with `A`=4: the follower should go right.
C $1BC3,2 Branch if the follower's region ID is greater than the target's.
C $1BC5,2 Pick up the follower's region ID from #A$57.
C $1BC7,2 Is it 2 or more?
C $1BC9,2 Branch if so.
C $1BCB,2 This is the x-coordinate of the tops of the staircases on the left side of the skool.
C $1BCD,3 Jump forward.
C $1BD0,2 This is the x-coordinate of the bottoms of the staircases on the right side of the skool.
C $1BD2,3 Jump forward.
C $1BD5,2 Pick up the follower's region ID from #A$57.
C $1BD7,2 Is it 3 or more?
C $1BD9,2 Branch if so.
C $1BDB,2 This is the x-coordinate of the bottoms of the staircases on the left side of the skool.
C $1BDD,3 Jump forward.
C $1BE0,2 This is the x-coordinate of the tops of the staircases on the right side of the skool.
C $1BE2,2 Store the staircase endpoint x-coordinate at #A$08.
C $1BE4,2 Is the follower at the staircase endpoint?
C $1BE6,2 Branch if not.
C $1BE8,2 Pick up the follower's x-coordinate from #A$FC.
C $1BEA,2 Is the follower at the bottom of a staircase on the left side of the skool?
C $1BEC,2 Branch if so.
C $1BEE,2 Is the follower at the bottom of a staircase on the right side of the skool?
C $1BF0,2 Branch if so.
C $1BF2,5 Return with `A`=2: the follower should go downstairs.
C $1BF7,2 Return with `A`=1: the follower should go upstairs.
c $1BFA Check whether a chair is occupied and unseat any occupant
D $1BFA #ZX$6B97
D $1BFA Used by the routine at #A$1C59.
R $1BFA /(#A$57)/ Potential occupant's character number
C $1BFA,8 Store the base address of little boy no. 1's character buffer (#A$7860) at #A$4E.
C $1C02,9 Modify the address stored at #A$4E until it matches that of the target boy's character buffer.
C $1C0B,6 Pick up the target boy's animatory state and store it at #A$0A.
C $1C11,5 Pick up the target boy's y-coordinate and store it at #A$0B.
C $1C16,5 Pick up the target boy's x-coordinate and store it at #A$0C.
C $1C1B,11 Pick up the address of the target boy's uninterruptible subcommand routine and store it at #A$0D.
C $1C26,2 Pick up the current character's y-coordinate.
C $1C28,2 Does it match that of the target boy?
C $1C2A,2 Branch if not.
C $1C2C,2 Pick up the current character's x-coordinate.
C $1C2E,2 Does it match that of the target boy?
C $1C30,2 Branch if not.
C $1C32,2 Pick up the target boy's animatory state.
C $1C34,2 Keep only bits 0-2.
C $1C36,2 Is the target boy sitting on a chair?
C $1C38,2 Branch if not.
C $1C3A,2 Pick up the character number of the target boy.
C $1C3C,2 Is it $14 (ERIC)?
C $1C3E,2 Branch if not.
C $1C40,6 Set bit 4 of ERIC's status flags at #A$2B: ERIC has just been unseated.
C $1C46,3 Return.
C $1C49,2 #A$0E holds the MSB of the target character's uninterruptible subcommand routine.
C $1C4B,2 Return if the target boy is currently controlled by an uninterruptible subcommand.
C $1C4D,11 Place the address of the uninterruptible subcommand routine at #A$1CB4 into the seated boy's character buffer.
c $1C59 Knock the current occupant (if any) out of a chair
D $1C59 #ZX$6B7D
D $1C59 Used by the routines at #A$1CEC and #A$365C.
C $1C59,4 Initialise the potential occupant character number at #A$57.
C $1C5D,2 Next potential occupant.
C $1C5F,3 Check whether the chair is occupied by the potential occupant and unseat him if so.
C $1C62,2 Pick up the potential occupant's character number from #A$57.
C $1C64,2 Have we checked the 11 little boys yet?
C $1C66,2 Branch back if not.
C $1C68,4 Character number $0F (ANGELFACE) is next.
C $1C6C,2 Next potential occupant.
C $1C6E,3 Check whether the chair is occupied by one of the three main kids besides ERIC and unseat him if so.
C $1C71,2 Pick up the potential occupant's character number from #A$57.
C $1C73,2 Have we checked the three main kids besides ERIC yet?
C $1C75,2 Branch back if not.
C $1C77,2 Character number $14 is ERIC.
C $1C79,2 Store this character number at #A$57.
C $1C7B,3 Check whether the chair is occupied by ERIC and unseat him if so.
C $1C7E,9 Adjust the character's animatory state at #A$26 to make him sit on the chair.
C $1C87,3 Update the SRB for the character's new animatory state.
C $1C8A,3 Terminate the character's uninterruptible subcommand.
u $1C8D Unused
B $1C8D,1,1
c $1C8E Check whether a character is on a staircase
D $1C8E #ZX$6648
D $1C8E Used by the routines at #A$0C3F, #A$1468, #A$16D0, #A$1B2E, #A$270D, #A$2873, #A$2CA5, #A$34B5, #A$350B, #A$3558, #A$359E and #A$365C. Returns with the carry flag set if the character is on a staircase, and with `A` (and #A$12) holding one of the following values:
D $1C8E #TABLE(default,centre) { =h `A` | =h Meaning } { $00 | The character is on the bottom floor. } { $01 | The character is on the middle floor. } { $02 | The character is on the top floor. } { $FF | The character is on a staircase. } TABLE#
C $1C8E,2 Pick up the character's y-coordinate from #A$FB.
C $1C90,2 Is the character on the top floor?
C $1C92,2 Branch if not.
C $1C94,1 Clear the carry flag: the character is not on a staircase.
C $1C95,2 `A`=$02: the character is on the top floor.
C $1C97,3 Jump forward.
C $1C9A,2 Is the character on the middle floor?
C $1C9C,2 Branch if not.
C $1C9E,1 Clear the carry flag: the character is not on a staircase.
C $1C9F,2 `A`=$01: the character is on the middle floor.
C $1CA1,3 Jump forward.
C $1CA4,2 Is the character on the bottom floor?
C $1CA6,2 Branch if not.
C $1CA8,1 Clear the carry flag: the character is not on a staircase.
C $1CA9,2 `A`=$00: the character is on the bottom floor.
C $1CAB,3 Jump forward.
C $1CAE,1 Set the carry flag: the character is on a staircase.
C $1CAF,2 `A`=$FF: the character is on a staircase.
C $1CB1,2 Store the location indicator at #A$12.
c $1CB4 Deal with a character who's been dethroned (1)
D $1CB4 #ZX$6C55
D $1CB4 The address of this uninterruptible subcommand routine is placed into a character's buffer by the routine at #A$1BFA.
C $1CB4,4 Initialise the counter that determines how long the character will sit on the floor before rising.
C $1CB8,8 Replace the address of this uninterruptible subcommand routine in the character's buffer with that of #A$1CCB.
C $1CC0,3 Update the SRB for the character's current animatory state and location.
C $1CC3,2 Increment the character's animatory state at #A$26, making him sit on the floor.
C $1CC5,3 Update the SRB for the character's new animatory state.
C $1CC8,3 Return.
c $1CCB Deal with a character who's been dethroned (2)
D $1CCB #ZX$6C64
D $1CCB The address of this uninterruptible subcommand routine is placed into a character's buffer by the routine at #A$1CB4.
C $1CCB,2 Decrement the delay counter at #A$B5.
C $1CCD,2 Branch unless it's time to get up off the floor.
C $1CCF,8 Replace the address of this uninterruptible subcommand routine in the character's buffer with that of #A$1CEC.
C $1CD7,3 Update the SRB for the character's current animatory state and location.
C $1CDA,6 Adjust the character's animatory state at #A$26, making him stand up.
C $1CE0,2 Is the character EINSTEIN (animatory state #AS$10($10))?
C $1CE2,2 Branch if so (only EINSTEIN will sit back in the same chair).
C $1CE4,2 Decrement the character's x-coordinate at #A$FC. This makes him look for another chair.
C $1CE6,3 Update the SRB for the character's new animatory state and location.
C $1CE9,3 Return.
c $1CEC Deal with a character who is looking for a seat
D $1CEC #ZX$6C7C
D $1CEC The address of this uninterruptible subcommand routine is placed into a character's buffer by the routines at #A$1CCB and #A$1D16.
C $1CEC,3 Update the SRB for the character's current animatory state and location.
C $1CEF,2 Pick up the character's animatory state from #A$26.
C $1CF1,1 Is the character midstride?
C $1CF2,2 Branch if not.
C $1CF4,3 Move the character from the midstride position.
C $1CF7,3 Is the character beside a chair?
C $1CFA,2 Branch if not.
C $1CFC,3 Make the character sit in the chair, knocking the current occupant (if any) out first.
C $1CFF,2 Branch unless the character needs to turn round.
C $1D01,6 Flip bit 7 of the character's animatory state, thus turning him round.
C $1D07,3 Update the SRB for the character's new animatory state.
C $1D0A,3 Return.
C $1D0D,2 Increment the character's animatory state.
C $1D0F,3 Update the SRB for the character's new animatory state.
C $1D12,3 Return. (This instruction is redundant.)
N $1D15 This entry point is used by the routines at #A$1CB4 and #A$1CCB.
c $1D16 Make a character find a seat
D $1D16 #ZX$6CA0
D $1D16 Used by command lists #R$40DC($88), #R$40E7($8C), #R$40FA($8E), #R$410D($90), #R$4118($92), #R$4123($94), #R$413D($96), #R$4150($98), #R$415B($9A), #R$4166($9C), #R$4180($9E), #R$4193($A0), #R$419E($A2), #R$41A9($A4), #R$41C3($A6) and #R$41D6($A8).
C $1D16,8 Place the address of the uninterruptible subcommand routine at #A$1CEC into the character's buffer.
C $1D1E,6 Remove the address of this primary command routine from the character's buffer.
C $1D24,3 Set the character on his way in search of a seat.
u $1D27 Unused
B $1D27,1,1
c $1D28 Terminate an interruptible subcommand
D $1D28 Used by the routines at #A$0C31, #A$1129, #A$136F, #A$13F3, #A$16E9, #A$1EE3, #A$2387, #A$241B and #A$2745.
C $1D28,4 Remove the interruptible subcommand routine address from the character's buffer.
c $1D2D Terminate a primary command
D $1D2D Used by the routines at #A$0EB4, #A$0EC2, #A$12B5, #A$1A04, #A$277D, #A$27AB, #A$28AB, #A$28BC, #A$2A99, #A$2AF9 and #A$2B0D.
C $1D2D,4 Remove the address of the primary command routine from the character's buffer.
c $1D32 Terminate an uninterruptible subcommand
D $1D32 Used by the routines at #A$1C59 and #A$2A43.
C $1D32,4 Remove the address of the uninterruptible subcommand routine from the character's buffer.
c $1D37 Add to the score and print it
D $1D37 #ZX$6AFB
D $1D37 Used by the routines at #A$0FBA, #A$17E5, #A$1DB7 and #A$2BB0.
R $1D37 A Amount to add to the score (divided by 10)
C $1D37,3 Add the LSB of the current score at #A$7C.
C $1D3A,2 Branch if there was no overflow.
C $1D3C,2 Otherwise increment the MSB of the current score.
C $1D3E,2 Update the LSB of the score at #A$7C.
C $1D40,4 Store the LSB of the address of the score at #A$4E.
C $1D44,2 `A`=0, indicating the score.
C $1D46,3 Print the new score.
u $1D49 Unused
B $1D49,1,1
c $1D4A Add to ERIC's lines total and print it
D $1D4A Used by the routines at #A$1DB7 and #A$277D.
R $1D4A A Number of lines to add (divided by 10)
C $1D4A,2 Store the number of lines to add at #A$57.
C $1D4C,2 Pick up the MSB of the lines total from #A$7F.
C $1D4E,2 Is it 4 or more?
C $1D50,2 Branch if so (the lines total is at least 10240).
C $1D52,2 Is the MSB of the lines total equal to 3?
C $1D54,2 Branch if not (the lines total is less than 7680).
C $1D56,2 Pick up the LSB of the lines total from #A$7E.
C $1D58,2 Is the lines total 10000 or more?
C $1D5A,2 Branch if so.
C $1D5C,11 Increase the lines total at #A$7E by the value stored at #A$57.
C $1D67,2 Pick up the MSB of the lines total from #A$7F.
C $1D69,2 Compare the MSB of the lines total with 3.
C $1D6B,2 Branch if it's less than 3 (the lines total is less than 7680).
C $1D6D,2 Branch if it's 4 or more (the lines total is at least 10240).
C $1D6F,2 Pick up the LSB of the lines total from #A$7E.
C $1D71,2 Is the lines total 10000 or more?
C $1D73,2 Branch if not.
N $1D75 ERIC now has 10000 or more lines.
C $1D75,10 Place the address of the command list at #A$43A2 into MR WACKER's character buffer.
C $1D7F,8 Set bit 7 of byte $7A of MR WACKER's character buffer, triggering a command list restart at the next available opportunity.
C $1D87,2 Pick up the current character number from #A$60.
C $1D89,2 Is it $0B (MR WACKER)?
C $1D8B,2 Branch if not.
C $1D8D,8 Place the address of the command list at #A$43A2 into the copy of MR WACKER's character buffer in page 0.
C $1D95,6 Set bit 7 of the flags byte at #A$3F in the copy of MR WACKER's character buffer in page 0, triggering a command list restart at the next available opportunity.
C $1D9B,4 Set the MSB of the lesson clock at #A$40 to $FF, giving MR WACKER time to find ERIC before the bell rings.
C $1D9F,3 Jump forward.
C $1DA2,11 Increase the lines total at #A$7E by the value stored at #A$57.
C $1DAD,4 Store the LSB of the address of the lines total at #A$4E.
C $1DB1,2 `A`=1, indicating the lines total.
C $1DB3,3 Print the new lines total.
u $1DB6 Unused
B $1DB6,1,1
c $1DB7 Make a teacher give lines
D $1DB7 #ZX$7700
D $1DB7 Used by the routines at #A$0B3B, #A$0ECF, #A$149F, #A$191B and #A$2552. Note that this routine does not first check whether the teacher is currently on screen before adding lines to ERIC's total or starting the lines-giving sound effect, which is a #BUG#hiddenAccusers(bug).
R $1DB7 /(#A$72)/ Character number of the lines recipient ($0F, $10, $11 or $14)
R $1DB7 /(#A$D8)/ Lines reprimand identifier ($00-$0F)
C $1DB7,5 Pick up the current value of the sprite enable register and store a copy at #A$F6.
C $1DBC,2 Branch if no sprites are enabled at the moment.
C $1DBE,3 Back up existing sprite information.
C $1DC1,8 Store the address of the first line of the lines message (#A$46C0) at #A$86.
C $1DC9,8 Store the address #A$46D0 (where the message number of the lines recipient's name will be placed) at #A$88.
C $1DD1,2 Pick up the character number of the lines recipient from #A$72.
C $1DD3,2 Is ERIC the lines recipient?
C $1DD5,2 Branch if not.
C $1DD7,2 The background colour of the lines message box for ERIC is cyan.
C $1DD9,3 Jump forward.
C $1DDC,2 Is BOY WONDER the lines recipient?
C $1DDE,2 Branch if not.
C $1DE0,2 The background colour of the lines message box for BOY WONDER is green.
C $1DE2,3 Jump forward.
C $1DE5,2 The background colour of the lines message box for ANGELFACE and EINSTEIN is yellow.
C $1DE7,2 Store the lines message box colour information at #A$84.
C $1DE9,5 Generate a random value between 0 and 15.
C $1DEE,5 Add 3 to get 3-18 and store the result at #A$57.
C $1DF3,7 Now multiply by 5 and store the result at #A$85. This will be the number of lines to give (divided by 10): 15, 20, 25...80, 85 or 90.
C $1DFA,2 Pick up the character number of the lines recipient from #A$72.
C $1DFC,2 Is ERIC the lines recipient?
C $1DFE,2 Branch if not.
C $1E00,2 Message number #R$4780($10): ERIC.
C $1E02,3 Jump forward.
C $1E05,2 Is EINSTEIN the lines recipient?
C $1E07,2 Branch if not.
C $1E09,2 Message number #R$47AA($13): EINSTEIN.
C $1E0B,3 Jump forward.
C $1E0E,2 Is BOY WONDER the lines recipient?
C $1E10,2 Branch if not.
C $1E12,2 Message number #R$478E($11): BOY WONDER.
C $1E14,3 Jump forward.
C $1E17,2 Message number #R$479C($12): ANGELFACE.
C $1E19,2 Store the message number of the lines recipient's name at #A$D0, where it will never be used.
C $1E1B,4 Place the message number of the lines recipient's name at #A$46D0.
C $1E1F,4 Copy the number of lines to give (divided by 10) from #A$85 to #A$A3.
C $1E23,3 Generate the character codes of the first two digits of the lines amount.
C $1E26,11 Copy the character codes of the first two digits of the lines amount to #A$46C0.
C $1E31,2 Pick up the character number of the lines recipient from #A$72.
C $1E33,2 Is BOY WONDER the lines recipient?
C $1E35,2 Branch if so.
C $1E37,2 Is ERIC the lines recipient?
C $1E39,2 Branch if so.
C $1E3B,2 Pick up the number of lines to give from #A$85.
C $1E3D,3 Add this value to the score and print it.
C $1E40,3 Jump forward.
C $1E43,2 Pick up the number of lines to give from #A$85.
C $1E45,3 Add them to ERIC's lines total.
C $1E48,5 Set voice #1 attack length to 2ms and and decay length to 6ms.
C $1E4D,3 Set the LSB of voice #1's frequency to 0.
C $1E50,5 Set voice #1 sustain volume to $0F and release length to 300ms.
C $1E55,5 Set voice #1 frequency to $3100.
C $1E5A,5 Set voice #1 control register: voice on, attack-decay-sustain cycle; saw waveform enabled.
C $1E5F,3 Print the lines message above the teacher's head.
C $1E62,14 Change the address at #A$86 to #A$4980 (the address of the first line of the first lines reprimand message) and the address at #A$88 to #A$4990 (the address of the second line of the first lines reprimand message.
C $1E70,2 Pick up the lines reprimand identifier from #A$D8.
C $1E72,24 Add 0, 1, 2 or 3 to the MSBs of the lines reprimand message addresses at #A$86 and #A$88 depending on whether bits 3 and 2 of `A` are 00, 01, 10 or 11.
C $1E8A,2 Pick up the lines reprimand identifier from #A$D8.
C $1E8C,33 Add $00, $20, $40 or $60 to the LSBs of the lines reprimand message addresses at #A$86 and #A$88 depending on whether bits 1 and 0 of `A` are 00, 01, 10 or 11.
C $1EAD,5 Set voice #1 frequency to $2900.
C $1EB2,3 Print the lines reprimand message above the teacher's head.
C $1EB5,5 Set voice #1 control register: voice off, release cycle; saw waveform enabled.
C $1EBA,2 Were any sprites enabled before this routine was called?
C $1EBC,2 Return if not.
C $1EBE,3 Otherwise restore the previous sprite information.
c $1EC2 Get ERIC's coordinates
D $1EC2 #ZX$79FD
D $1EC2 Used by the routines at #A$0C3F and #A$149F.
R $1EC2 O:X ERIC's x-coordinate
R $1EC2 O:Y ERIC's y-coordinate (adjusted if he's jumping)
C $1EC2,2 Pick up ERIC's status flags from #A$2B.
C $1EC4,3 Pick up ERIC's x-coordinate from his character buffer.
C $1EC7,3 Pick up ERIC's y-coordinate from his character buffer.
C $1ECA,2 Is ERIC jumping (bit 1 set)?
C $1ECC,2 Return if not.
C $1ECE,2 Is ERIC's y-coordinate 3 or more?
C $1ED0,2 Branch if so.
C $1ED2,5 Return with `Y`=3 (ERIC is jumping on the top floor).
C $1ED7,2 Is ERIC's y-coordinate 10 or more?
C $1ED9,2 Branch if so.
C $1EDB,5 Return with `Y`=10 (ERIC is jumping on the middle floor).
C $1EE0,2 Return with `Y`=17 (ERIC is jumping on the bottom floor).
c $1EE3 Make EINSTEIN speak
D $1EE3 Used by the routines at #A$0A58 and #A$0B3B.
R $1EE3 YX Message address
C $1EE3,4 Push the message address formed by `YX` onto the stack.
C $1EE7,3 Restore the current character's buffer from page 0.
C $1EEA,4 Pick up the current character number from #A$60 and store it at #A$57 temporarily.
C $1EEE,4 Set the current character number at #A$60 to $11 (EINSTEIN).
C $1EF2,3 Copy EINSTEIN's character buffer to page 0.
C $1EF5,6 Pull the message address off the stack and place it at #A$AC.
C $1EFB,3 Restore EINSTEIN's character buffer from page 0.
C $1EFE,2 Pick up the saved character number from #A$57.
C $1F00,2 Update the current character number at #A$60.
C $1F02,3 Copy the current character's buffer to page 0.
N $1F05 This entry point is used by the routine at #A$0A58 to make a teacher wait for EINSTEIN to finish speaking.
C $1F05,2 Event #R$4400($03): EINSTEIN is speaking.
C $1F07,3 Raise the signal for this event.
C $1F0A,12 Pull the return address from the stack and place it in the character's buffer as the primary command routine address.
C $1F16,8 Place the address of the interruptible subcommand routine at #A$1F1E (below) into the character's buffer.
C $1F1E,2 Event #R$4400($03): EINSTEIN is speaking.
C $1F20,3 Is EINSTEIN still speaking?
C $1F23,2 Return if so.
C $1F25,3 Otherwise terminate this interruptible subcommand.
c $1F29 Make MR CREAK reveal his safe combination letter
D $1F29 Used by the routine at #A$1FA0.
C $1F29,4 Store the colour information (cyan background) for the safe combination letter message box at #A$84.
C $1F2D,8 Prepare to address the safe combination letter message buffer at #A$4640.
C $1F35,2 Pick up MR CREAK's character number from #A$60.
C $1F37,3 Make MR CREAK reveal his safe combination letter.
u $1F3A Code remnants
D $1F3A This routine is not used.
C $1F3A,1 Transfer the safe combination letter index (0-3) to `X`.
C $1F3B,2 Pick up a safe combination letter from #R$90($90-$93).
C $1F3D,4 Copy it to the address stored at #A$86.
C $1F41,8 #A$4642 is in the safe combination letter message buffer.
C $1F49,3 Print the safe combination letter above the teacher's head.
u $1F4C Unused
B $1F4C,1,1
c $1F4D Control EINSTEIN during class
D $1F4D #ZX$79BA
D $1F4D Used by command lists #R$410D($90), #R$4150($98), #R$4193($A0) and #R$41D6($A8).
C $1F4D,2 Event #R$4400($03): EINSTEIN is speaking.
C $1F4F,3 Is EINSTEIN still speaking?
C $1F52,2 Branch if not.
C $1F54,8 Reset bit 3 (EINSTEIN is not waiting to answer a question) and set bit 2 (EINSTEIN is speaking) and bit 6 (always move EINSTEIN on his turn in the routine at #A$3B5E) in the flags byte at #A$3F.
M $1F5C,5 Place the address of the interruptible subcommand routine at #A$2387 into EINSTEIN's buffer and jump to it.
W $1F5F,2,2
C $1F61,2 Event #R$4400($03): EINSTEIN is speaking.
C $1F63,3 Lower the signal for this event.
C $1F66,8 Place the address of this routine into EINSTEIN's buffer as the primary command routine address.
C $1F6E,8 Reset bit 2 (EINSTEIN is not speaking) and set bits 3 (EINSTEIN is waiting to answer a question) and 6 (always move EINSTEIN on his turn in the routine at #A$3B5E) in the flags byte at #A$3F.
c $1F77 Place an interruptible subcommand routine address into a character's buffer
D $1F77 Used by the routines at #A$09E9, #A$0A58, #A$0B3B, #A$0E35, #A$1F4D, #A$2757, #A$277D, #A$28AB, #A$28BC and #A$2A99.
C $1F77,6 Pull the return address from the stack and store it at #A$4E.
C $1F7D,4 Pick up the value of the first byte after the JSR instruction that called this routine.
C $1F81,2 Store this byte at #A$AA.
C $1F83,6 Increment the address stored at #A$4E.
C $1F89,4 Pick up the value of the second byte after the JSR instruction that called this routine and store it at #R$AA($AB). These two bytes form the address of the interruptible subcommand routine to use for the current character.
C $1F8D,9 Add 2 to the address stored at #A$4E, thus making it point at the first byte after the interruptible subcommand routine address.
C $1F96,6 Store this address at #A$29, effectively making it the address of the character's primary command routine.
C $1F9C,3 Jump to the interruptible subcommand routine.
u $1F9F Unused
B $1F9F,1,1
c $1FA0 Make a teacher tell the kids to sit down
D $1FA0 #ZX$7D84
D $1FA0 Used by command lists #R$4080($80), #R$4095($82), #R$40AE($84) and #R$40C3($86).
C $1FA0,2 Pick up the current character number from #A$60.
C $1FA2,2 Is it $0E (MR CREAK)?
C $1FA4,2 Branch if not.
C $1FA6,2 Pick up the game mode indicator from #A$46.
C $1FA8,2 Has ERIC opened the safe yet?
C $1FAA,2 Branch if not.
C $1FAC,3 Copy the buffer of the blackboard closest to MR CREAK into page 0.
C $1FAF,2 Pick up the character number of whoever last wrote on the blackboard.
C $1FB1,2 Was it ERIC?
C $1FB3,2 Branch if not.
C $1FB5,2 Pick up the first character written on the blackboard by ERIC.
C $1FB7,2 Does it match the first digit of MR CREAK's year of birth?
C $1FB9,2 Branch if not.
C $1FBB,2 Pick up the second character written on the blackboard by ERIC.
C $1FBD,2 Does it match the second digit of MR CREAK's year of birth?
C $1FBF,2 Branch if not.
C $1FC1,2 Pick up the third character written on the blackboard by ERIC.
C $1FC3,2 Does it match the third digit of MR CREAK's year of birth?
C $1FC5,2 Branch if not.
C $1FC7,2 Pick up the fourth character written on the blackboard by ERIC.
C $1FC9,2 Does it match the fourth digit of MR CREAK's year of birth?
C $1FCB,2 Branch if not.
C $1FCD,3 Otherwise make MR CREAK reveal his safe combination letter.
C $1FD0,4 Remove the address of this primary command routine from the teacher's buffer.
C $1FD4,4 $5B is the MSB of the teachers' sit down message addresses. Store it at #A$AD.
C $1FD8,2 Pick up the current character number from #A$60.
C $1FDA,2 Is it $0C (MR ROCKITT)?
C $1FDC,2 Branch if not.
C $1FDE,2 $59 is the LSB of #A$5B59 (MR ROCKITT's sit down message).
C $1FE0,3 Jump forward.
C $1FE3,2 Is the current character number $0D (MR WITHIT)?
C $1FE5,2 Branch if not.
C $1FE7,2 $7B is the LSB of #A$5B7B (MR WITHIT's sit down messaage).
C $1FE9,3 Jump forward.
C $1FEC,2 Is the current character number $0E (MR CREAK)?
C $1FEE,2 Branch if not.
C $1FF0,2 $97 is the LSB of #A$5B97 (MR CREAK's sit down message).
C $1FF2,3 Jump forward.
C $1FF5,2 $C1 is the LSB of #A$5BC1 (MR WACKER's sit down message).
C $1FF7,2 Store the LSB of the address of the teacher's sit down message at #A$AC.
C $1FF9,8 Place the address of the interruptible subcommand routine at #A$2387 into the character's buffer.
C $2001,3 Jump to #A$2387 to make the teacher start delivering the sit down message.
u $2004 Unused
B $2004,1,1
c $2005 Write a message into the text graphic buffer
D $2005 Used by the routines at #A$2043, #A$2573, #A$2620, #A$2BB0 and #A$BFF5.
R $2005 /(#R$D6($D6,$D7))/ Address of the message
C $2005,3 Clear the text graphic buffer at #A$4500.
C $2008,2 Initialise the message character index to 0.
C $200A,4 Collect a character code from the message to be written and store it at #A$57.
C $200E,2 Return if the message is finished.
C $2010,2 Is the character printable?
C $2012,2 Branch if so.
C $2014,8 Store #A$4780 (ERIC) at #A$D6
C $201C,2 Pick up the unprintable character code from #A$57.
C $201E,2 Reset bit 4. Now 1 <= `A` <= 15.
C $2020,13 Multiply `A` by 14.
C $202D,5 Add this value to the address stored at #A$D6, giving the address of the name of one of the boys or teachers.
C $2032,2 Initialise the message character index to 0.
C $2034,3 Jump back to deal with the new message.
C $2037,3 Increment the message character index in `Y` and save it temporarily.
C $203A,3 Insert the appropriate font character bitmap into the text graphic buffer at #A$4500.
C $203D,2 Restore the message character index to `Y`.
C $203F,3 Jump back to deal with the next character in the message.
c $2043 Print a lines message or safe combination letter above a teacher's head
D $2043 Used by the routines at #A$1DB7, #A$1F3A and #A$298B.
R $2043 /(#R$86($86,$87))/ Address of the first line of the message
R $2043 /(#R$88($88,$89))/ Address of the second line of the message
R $2043 /(#A$84)/ Colour information
N $2043 We start by comparing the teacher's x-coordinate (T) with the x-coordinates of the leftmost columns of the skool that are on screen (S) and off (S'=S+40).
C $2043,2 Pick up the teacher's x-coordinate from #A$FC.
C $2045,2 Is S'>T (meaning the teacher is not fully off screen to the right)?
C $2047,2 Branch if so.
C $2049,3 Otherwise return (the teacher is fully off screen to the right).
C $204C,2 Is S>T (meaning the teacher is partially or fully off screen to the left)?
C $204E,2 Branch if not.
C $2050,3 Otherwise return (the teacher is partially or fully off screen to the left).
C $2053,2 Pick up the teacher's x-coordinate from #A$FC.
C $2055,5 Is S>T-4 (meaning the teacher is close to the left edge of the screen)?
C $205A,2 Branch if so.
C $205C,2 Pick up the teacher's x-coordinate from #A$FC.
C $205E,5 Is S'>T+5 (meaning the teacher is a good distance from the right edge of the screen)?
C $2063,2 Branch if not.
C $2065,2 Pick up the teacher's x-coordinate from #A$FC.
C $2067,6 Subtract 3 and then S (the x-coordinate of the leftmost column of the skool on screen) to get the cell x-coordinate of the left edge of the message box. This actually shifts the centre of the message box well to the left of the teacher's head, which is probably a #BUG#misplacedMessageBox(bug).
C $206D,3 Jump forward.
C $2070,2 When the teacher is close to the left edge of the screen, this sets the x-coordinate of sprite #1 (and therefore the left edge of the message box) to 32.
C $2072,3 Jump forward.
C $2075,2 When the teacher is close to the right edge of the screen, this sets the x-coordinate of sprite #1 (and therefore the left edge of the message box) to 256.
C $2077,2 Save this cell x-coordinate at #A$9A, where it will never be used.
C $2079,3 Multiply by 8 to get the corresponding pixel x-coordinate.
C $207C,2 Branch unless the pixel x-coordinate is greater than 256.
C $207E,5 Set bit 8 of the x-coordinates of sprites #0-#7.
C $2083,3 Jump forward.
C $2086,5 Reset bit 8 of the x-coordinates of sprites #0-#7.
C $208B,2 Store bits 0-7 of the pixel x-coordinate at #A$9B.
C $208D,2 Pick up the teacher's y-coordinate from #A$FB.
C $208F,3 Subtract 3 to get the y-coordinate of the top edge of the message box.
C $2092,3 Multiply by 8 to get the corresponding pixel y-coordinate.
C $2095,2 Store this pixel y-coordinate at #A$9C.
C $2097,8 Set the colour of sprites #4 and #5 using the colour information at #A$84.
C $209F,11 Set the background and foreground colours of sprites #1, #2 and #3 to black.
C $20AA,2 The message box will be 8 character cells wide.
C $20AC,2 Store this width at #A$9D.
C $20AE,8 Copy the address of the first line of the message from #A$86 to #A$D6.
C $20B6,3 Write the first line of the lines or safe combination letter message into the text graphic buffer.
C $20B9,3 Centre the text in the text graphic buffer.
C $20BC,4 Indicate to the routine at #A$0DD4 that this is the first line of the message.
C $20C0,3 Prepare sprite graphic data from the text graphic buffer for the first line of the message.
C $20C3,8 Copy the address of the second line of the message from #A$88 to #A$D6.
C $20CB,3 Write the second line of the lines or safe combination letter message into the text graphic buffer.
C $20CE,3 Centre the text in the text graphic buffer.
C $20D1,4 Indicate to the routine at #A$0DD4 that this is the second line of the message.
C $20D5,3 Prepare sprite graphic data from the text graphic buffer for the second line of the message.
C $20D8,3 Set up sprites #1-#5.
C $20DB,5 Enable and draw sprites #1-#5.
C $20E0,15 Pause.
C $20EF,5 Disable all sprites.
c $20F5 Insert a pixel column into the text graphic buffer
D $20F5 Used by the routines at #A$213B and #A$2156.
R $20F5 A Pixel column
R $20F5 /(#A$9D)/ Width (in character cells) of the target message box
C $20F5,4 Initialise the pixel counter at #A$56.
C $20F9,4 Now `XY` is #A$4500, the address of the text graphic buffer.
C $20FD,2 Store the MSB of this address at #A$9F.
C $20FF,4 Pick up the width of the target message box from #A$9D and copy it to #A$55.
C $2103,4 Pick up the pixel counter from #A$56 and copy it to #A$9E (the LSB of the text graphic buffer address).
C $2107,1 Rotate a pixel from the pixel column into the carry flag.
C $2108,1 Save the remainder of the pixel column temporarily.
C $2109,5 Rotate a byte in the text graphic buffer, bringing the new pixel into bit 0.
C $210E,5 Store the pixel that was rotated out of bit 7 of the text graphic buffer byte in bit 0 at #A$54 temporarily.
C $2113,7 Subtract 8 from the text graphic buffer address at #A$9E. Now it points at the next graphic byte to the left.
C $211A,2 Decrement the message box width counter at #A$55.
C $211C,2 Branch if we've just finished shifting an entire pixel row of the text graphic buffer left.
C $211E,3 Pick up the pixel that was rotated out of bit 7 of the last text graphic buffer byte and rotate it into the carry flag.
C $2121,3 Jump back to rotate it into the next graphic byte to the left.
C $2124,1 Restore the remainder of the pixel column to `A`.
C $2125,2 Next pixel in the column.
C $2127,2 Branch back until all 8 pixels have been inserted.
c $212A Clear the text graphic buffer
D $212A Used by the routines at #A$2005 and #A$2573.
C $212A,8 Prepare to address the text graphic buffer at #A$4500.
C $2132,1 Initialise `Y` to 0.
C $2133,5 Fill the 256-byte buffer at #A$4500 with zeroes.
C $2138,2 Initialise the pixel column counter at #A$A2 to 0.
c $213B Centre the text in the text graphic buffer
D $213B Used by the routines at #A$2043, #A$2573, #A$2BB0 and #A$BFF5.
R $213B /(#A$9D)/ Width (in character cells) of the target message box
R $213B /(#A$A2)/ Number of pixel columns already inserted into the buffer
C $213B,5 Pick up the width (in character cells) of the target message box from #A$9D and multiply by 8 to get the width in pixels.
C $2140,3 Subtract the number of pixel columns that have been inserted into the text graphic buffer.
C $2143,2 Return if the buffer is already full (no centring required).
C $2145,2 Are there fewer than two free pixel columns remaining?
C $2147,2 Return if so (no centring required).
C $2149,3 Divide `A` by 2 and store the result at #A$57. This is the number of pixel columns by which the message will be shifted in order to centre it.
C $214C,5 Insert a blank pixel column into the text graphic buffer at #A$4500.
C $2151,2 Is the message centred yet?
C $2153,2 Branch back if not.
c $2156 Insert a font character bitmap into the text graphic buffer
D $2156 Used by the routine at #A$2005.
R $2156 /(#A$57)/ Font character code
R $2156 /(#A$A2)/ Number of pixel columns already inserted into the buffer
C $2156,4 Pick up the character code from #A$57 and copy it to #A$4E.
C $215A,4 Now #A$4E holds the address of the corresponding font character bitmap width from the table at #A$4720.
C $215E,6 Pick up the font character bitmap width and store it at #A$57.
C $2164,2 Increment the pixel column counter at #A$A2.
C $2166,7 Add the width of the font character bitmap to the pixel column counter.
N $216D Here we enter a loop that pushes the pixel columns of the font character bitmap into the buffer at #A$4500.
C $216D,2 Next column of the font character bitmap.
C $216F,2 Pick up the pixel column value in `A`.
C $2171,3 Push it into the buffer at #A$4500.
C $2174,2 Have we done every pixel column yet?
C $2176,2 Branch back if not.
C $2178,5 Finish by pushing a blank pixel column into the buffer.
u $217D Unused
B $217D,1,1
c $217E Generate the character codes of the digits of a number
D $217E Used by the routines at #A$2241, #A$2500 and #A$2620.
R $217E /(#R$A3($A3,$A4))/ The number
C $217E,12 Prepare 5 space characters at #R$8A($8A-$8E).
C $218A,2 Pick up the MSB of the number.
C $218C,2 Is it less than 40 (meaning the number is less than 10240)?
C $218E,2 Branch if so.
C $2190,9 Increment the character code of the first digit at #A$8A from space to '1', '1' to '2' etc.
C $2199,8 Set the character code of the second, third and fourth digits at #A$8B, #A$8C and #A$8D to '0'.
C $21A1,18 Subtract $2774 (10100) from the number at #A$A3. (This is a #BUG#mistrialSubtraction(bug).)
C $21B3,3 Jump back to consider the 10000's digit again.
C $21B6,2 Is the MSB of the number 39 (meaning the number is at least 9984)?
C $21B8,2 Branch if not.
C $21BA,2 Pick up the LSB of the number.
C $21BC,2 Is it 116 or more (meaning the number is 10100 or more)? (This is a #BUG#mistrialSubtraction(bug).)
C $21BE,2 Branch back to deal with the 10000s digit if so.
N $21C0 The 10000s digit has been computed. Now for the 1000s digit.
C $21C0,2 Pick up the MSB of what remains of the number.
C $21C2,2 Is it less than 4 (meaning the number is less than 1024)?
C $21C4,2 Branch if so.
C $21C6,9 Increment the character code of the second digit at #A$8B from space or '0' to '1', '1' to '2' etc.
C $21CF,6 Set the character code of the third and fourth digits at #A$8C and #A$8D to '0'.
C $21D5,18 Subtract $03E8 (1000) from the number at #A$A3.
C $21E7,3 Jump back to consider the 1000s digit again.
C $21EA,2 Is the MSB of the number 3 (meaning the number is at least 768)?
C $21EC,2 Branch if not.
C $21EE,2 Pick up the LSB of the number.
C $21F0,2 Is it 232 or more (meaning the number is 1000 or more)?
C $21F2,2 Branch back to deal with the 1000s digit if so.
N $21F4 The 1000s digit has been computed. Now for the 100s digit.
C $21F4,2 Pick up the MSB of what remains of the number.
C $21F6,2 Branch if it's zero (meaning the number is less than 256).
C $21F8,9 Increment the character code of the third digit at #A$8C from space or '0' to '1', '1' to '2' etc.
C $2201,11 Subtract $64 (100) from the number at #A$A3.
C $220C,4 Set the character code of the fourth digit at #A$8D to '0'.
C $2210,3 Jump back to consider the 100s digit again.
C $2213,2 Pick up the LSB of the number.
C $2215,2 Is it 100 or more?
C $2217,2 Branch back to deal with the 100s digit if so.
C $2219,3 Otherwise jump forward to compute the 10s digit.
N $221C This entry point is used by the routines at #A$1DB7 (to generate the character codes of the first two digits of a lines amount) and #A$2241 (to generate the character codes of the digits in a number used in a question asked by MR WACKER).
C $221C,6 Set the character codes of the last two digits at #A$8D and #A$8E to 32 (space).
N $2222 The 100s digit has been computed. Now for the 10s digit.
C $2222,2 Pick up the LSB of what remains of the number.
C $2224,2 Is it less than 10?
C $2226,2 Branch if so.
C $2228,9 Increment the character code of the fourth digit at #A$8D from space or '0' to '1', '1' to '2' etc.
C $2231,7 Subtract 10 from the number at #A$A3.
C $2238,3 Jump back to consider the 10s digit again.
N $223B The 10s digit has been computed. Now for the 1s digit.
C $223B,5 Add 48 to the remaining value to get the character code of the final digit, and store it at #A$8E.
c $2241 Prepare a question and answer
D $2241 #ZX$7A32
D $2241 Used by the routine at #A$0A58.
C $2241,2 Pick up the current character number from #A$60.
C $2243,2 Is it $0B (MR WACKER)?
C $2245,2 Branch if so.
C $2247,3 Otherwise jump forward.
N $224A MR WACKER is conducting this lesson, so we have to prepare a multiplication question and answer. First, generate two random numbers and store the ASCII codes of their digits in the question message.
C $224A,11 Generate a random number between 32 and 99 and store it at #A$A3 and #A$C0.
C $2255,4 Store the code for '0' at #A$8B for no apparent reason.
C $2259,3 Generate the character codes of the digits of this number at #A$8D and #A$8E.
C $225C,8 Store #A$5A00 (WHAT IS 12 x 34?) at #A$50.
C $2264,11 Replace the '12' in this message with the digits of the number.
C $226F,11 Generate another random number between 32 and 99 and store it at #A$A3 and #A$C1.
C $227A,4 Store the code for '0' at #A$8B for no apparent reason.
C $227E,3 Generate the character codes of the digits of this number at #A$8D and #A$8E.
C $2281,11 Replace the '34' in the question message with the digits of the number.
C $228C,25 Multiply the two numbers and store the product at #A$A3 and #A$A4.
C $22A5,3 Generate the character codes of the digits of this product.
C $22A8,8 Store #A$5A11 (Please Sir I cannot tell a lie . . It's 1234) at #A$52.
C $22B0,21 Replace the '1234' in this message with the digits of the answer to the multiplication question.
C $22C5,2 Pick up the teacher's character number from #A$60.
C $22C7,1 Save it temporarily.
C $22C8,4 Set the current character number at #A$60 to $11 (EINSTEIN).
C $22CC,3 Copy EINSTEIN's character buffer to page 0.
C $22CF,8 Copy the address of the answer message into EINSTEIN's character buffer.
C $22D7,3 Restore EINSTEIN's buffer from page 0.
C $22DA,1 Restore the teacher's character number to `A`.
C $22DB,2 Update the current character number at #A$60.
C $22DD,3 Copy the teacher's character buffer to page 0.
C $22E0,8 Copy the address of the question message into the teacher's buffer.
C $22E8,8 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer to make him ask the question.
C $22F0,3 Return.
N $22F3 Some teacher other than MR WACKER is conducting this lesson. Check whether MR CREAK needs to ask what happened in the year that he was born.
C $22F3,2 Is the current character number $0E (MR CREAK)?
C $22F5,2 Branch if not.
C $22F7,2 Pick up the game mode indicator from #A$46.
C $22F9,2 Branch if we're in demo mode.
C $22FB,2 Has ERIC already opened the safe?
C $22FD,2 Branch if so.
C $22FF,2 Has MR CREAK already asked the birth year question in this lesson?
C $2301,2 Branch if so.
C $2303,4 Update the birth year question indicator at #A$C2.
C $2307,8 Store #A$5B2D (WHAT HAPPENED IN THE YEAR THAT I WAS BORN) at #A$50.
C $230F,8 Store #A$5AE1 (Please Sir I cannot tell a lie . . It was the BATTLE OF Q) at #A$52.
C $2317,6 Replace the 'Q' in this message with the message number of MR CREAK's year of birth.
C $231D,3 Jump back to prepare MR CREAK and EINSTEIN.
N $2320 Now we randomly select a question-answer pair.
C $2320,9 Generate a random value between $00 and $29 and store it at #A$57.
C $2329,2 Pick up the current character number from #A$60.
C $232B,2 Is it $0C (MR ROCKITT)?
C $232D,2 Branch if so.
C $232F,2 Is the current character number $0D (MR WITHIT)?
C $2331,2 Branch if so.
C $2333,2 The history message numbers are in the range $D4-$FD.
C $2335,3 Jump forward.
C $2338,2 The chemistry message numbers are in the range $80-$A9.
C $233A,3 Jump forward.
C $233D,2 The geography message numbers are in the range $AA-$D3.
C $233F,5 Add the random value between $00 and $29 chosen earlier to the base message number, and store the result at #A$C3.
C $2344,2 Pick up the teacher's character number ($0C-$0E) from #A$60.
C $2346,7 Change it to 0 (MR ROCKITT), 4 (MR WITHIT) or 8 (MR CREAK), and store it at #A$57.
C $234D,2 Pick up the message number from #A$C3.
C $234F,1 Is the message number even?
C $2350,2 Branch if so.
C $2352,7 Add 12 to the teacher identifier at #A$57, giving 12 (MR ROCKITT), 16 (MR WITHIT) or 20 (MR CREAK).
C $2359,8 Pick up the LSB of the address of the question message from the data table at #A$46E0 and copy it to #A$50.
C $2361,4 Set the MSB of the address of the question message to #A$5A.
C $2365,9 Replace the 'Q' in the question message with the randomly chosen message number saved at #A$C3.
C $236E,6 Pick up the LSB of the address of the answer message from the data table at #A$46E0 and copy it to #A$52.
C $2374,4 Set the MSB of the address of the question message to #A$5A.
C $2378,11 Replace the 'Q' in the answer message with the appropriate message number.
C $2383,3 Jump back to prepare the teacher and EINSTEIN.
c $2387 Make a character speak
D $2387 #ZX$7986
D $2387 The address of this interruptible subcommand routine is placed into a character's buffer by the routines at #A$09E9, #A$0A58, #A$0B3B, #A$1F4D, #A$1FA0, #A$2241, #A$2757, #A$277D and #A$28BC.
C $2387,6 Remove any submessage address from the character's buffer.
C $238D,2 Pick up the character's x-coordinate.
C $238F,4 Store it at #A$57 and increment it.
C $2393,2 Pick up the x-coordinate of the leftmost column of the skool on screen.
C $2395,2 Is the character off-screen to the left?
C $2397,2 Branch if not.
C $2399,3 Otherwise terminate this interruptible subcommand.
C $239C,2 Pick up the x-coordinate of the leftmost column of the skool that is off screen.
C $239E,4 Is the character off-screen to the right?
C $23A2,2 Branch if not.
C $23A4,3 Otherwise terminate this interruptible subcommand.
C $23A7,3 Are any sprites enabled at the moment?
C $23AA,2 Branch if not.
C $23AC,3 Otherwise return (someone else is speaking).
N $23AF The character is on-screen and no one else is speaking at the moment.
C $23AF,8 Replace the address of this interruptible subcommand routine in the character's buffer with that of #A$2458 (below).
C $23B7,8 Store $CA40 (the address of the sprite for the first middle section of the speech bubble) at #A$4E.
C $23BF,11 Remove any existing text from this sprite.
C $23CA,4 Store $CA80 (the address of the sprite for the second middle section of the speech bubble) at #A$4E.
C $23CE,11 Remove any existing text from this sprite.
C $23D9,2 Pick up the current character number from #A$60.
C $23DB,2 Is it $00-$0A (one of the little boys)?
C $23DD,2 Branch if not.
C $23DF,3 Jump forward.
C $23E2,2 Is the current character a teacher ($0B-$0E)?
C $23E4,2 Branch if not.
C $23E6,2 Pick up the teacher's y-coordinate from #A$FB.
C $23E8,3 Subtract 3 from the teacher's y-coordinate. This will be the y-coordinate of the speech bubble.
C $23EB,3 Jump forward.
C $23EE,2 Pick up the boy's y-coordinate.
C $23F0,3 Subtract 2 from the boy's y-coordinate. This will be the y-coordinate of the speech bubble.
C $23F3,3 Multiply this y-coordinate by 8 to get the screen pixel y-coordinate.
C $23F6,5 Add 52 to this pixel y-coordinate and store the result at #A$D1.
C $23FB,5 Reset bit 8 of the x-coordinates of all sprites.
C $2400,2 Pick up the character's x-coordinate.
C $2402,3 Add 4 to the character's x-coordinate.
C $2405,3 Subtract the x-coordinate of the leftmost column of the skool on screen.
C $2408,3 Multiply by 8 to get the screen pixel x-coordinate of the lip section of the speech bubble.
C $240B,2 Branch unless the multiplication overflowed.
C $240D,5 Set bit 8 of the x-coordinates of sprites #3 and #5.
C $2412,3 Jump forward.
C $2415,3 Prepare sprites #0-#6 for the speech bubble with the lip on the left.
C $2418,3 Jump forward.
C $241B,3 Prepare sprites #0-#6 for the speech bubble with the lip on the right.
C $241E,5 Stretch sprite #6 (the filled in middle section of the speech bubble) to double width.
C $2423,14 Set the colour of sprites #0-#3 (the outline sections of the speech bubble) to black.
C $2431,11 Set the colour of sprites #4-#6 (the filled in sections of the speech bubble) to white.
C $243C,23 Set the y-coordinates of sprites #0-#6.
C $2453,5 Enable sprites #0-#6 and draw them.
N $2458 This entry point is used while the character is speaking.
C $2458,3 Slide a message character into the speech bubble text window.
C $245B,2 Branch unless the message has finished.
C $245D,5 Disable all sprites, effectively removing the speech bubble.
C $2462,3 Terminate this interruptible subcommand.
C $2465,3 Slide another message character into the speech bubble text window.
C $2468,2 Branch if the message has finished.
c $246B Slide a message character into the speech bubble text window
D $246B #ZX$740A
D $246B Used by the routine at #A$2387.
R $246B O:P Carry flag set if the message has finished
C $246B,3 Get the next character of the message being spoken.
C $246E,2 Has the message finished?
C $2470,2 Branch if not.
C $2472,1 Set the carry flag: the message has finished.
C $2473,3 Return.
C $2476,2 Is the character code $02?
C $2478,2 If so, branch forward to replace it with $20 (space).
C $247A,2 Is the character code $03 (8 spaces)?
C $247C,2 Branch if not.
C $247E,8 Store #A$4816 (8 spaces) at #A$AC.
C $2486,2 $20 is ' ' (space).
C $2488,6 Store the address that holds the width of the next character at #A$4E.
C $248E,4 Pick up the width of the next character.
C $2492,1 Transfer the width to `X`, which will count the pixel columns.
C $2493,2 Save the pixel column counter temporarily.
C $2495,4 Pick up a pixel column of the font character bitmap.
C $2499,3 Slide the pixel column into the speech bubble text window.
C $249C,2 Restore the pixel column counter to `X`.
C $249E,1 Decrement the pixel column counter.
C $249F,2 Branch unless every pixel column has been done.
C $24A1,1 `A`=0.
C $24A2,3 Slide a blank pixel column into the speech bubble text window.
C $24A5,1 Clear the carry flag: the message has not finished.
c $24A7 Insert a pixel column into the speech bubble text window
D $24A7 Used by the routine at #A$246B.
R $24A7 A Pixel column
C $24A7,2 `X` will count the 8 pixels in the pixel column.
C $24A9,1 Save the pixel column temporarily.
C $24AA,8 Prepare to start drawing at the rightmost end of the first row of pixels in the second middle section speech bubble sprite at $CA80.
C $24B2,1 Restore the pixel column to `A`.
C $24B3,2 Initialise `Y` for addressing the speech bubble sprite.
C $24B5,1 Rotate a pixel from the pixel column into the carry flag.
C $24B6,1 Save the remainder of the pixel column temporarily.
C $24B7,5 Rotate a graphic byte in the speech bubble sprite, bringing the new pixel into bit 0, and the pixel that was in bit 7 into the carry flag.
C $24BC,2 Move one byte to the left in the speech bubble sprite.
C $24BE,5 Rotate this graphic byte, bringing the pixel from the previous byte into bit 0, and the pixel that was in bit 7 into the carry flag.
C $24C3,2 Move one byte to the left in the speech bubble sprite.
C $24C5,5 Rotate this graphic byte, bringing the pixel from the previous byte into bit 0, and the pixel that was in bit 7 into the carry flag.
C $24CA,2 Rotate the carry flag into bit 0 of `A` and save it temporarily.
C $24CC,11 Subtract 62 from the sprite graphic address. This points it at the rightmost end of the corresponding row of pixels in the first middle section speech bubble sprite at $CA40.
C $24D7,2 Restore the carry flag that was saved in bit 0 of `A`.
C $24D9,5 Rotate a graphic byte in the speech bubble sprite, bringing the new pixel into bit 0, and the pixel that was in bit 7 into the carry flag.
C $24DE,2 Move one byte to the left in the speech bubble sprite.
C $24E0,5 Rotate this graphic byte, bringing the pixel from the previous byte into bit 0, and the pixel that was in bit 7 into the carry flag.
C $24E5,2 Move one byte to the left in the speech bubble sprite.
C $24E7,5 Rotate this graphic byte, bringing the pixel from the previous byte into bit 0. The pixel that was in bit 7 is discarded.
C $24EC,1 Have we done all 8 bits in the pixel column yet?
C $24ED,2 Branch if so.
C $24EF,11 Add 69 to the sprite graphic address. This points it at the rightmost end of the next row of pixels down in the second middle section speech bubble sprite at $CA80.
C $24FA,1 Restore the remainder of the pixel column to `A`.
C $24FB,3 Jump back to deal with the next pixel.
C $24FE,1 Balance the stack before returning.
c $2500 Prepare a message telling the kids to go to a certain page in their books
D $2500 Used by the routines at #A$09E9, #A$0A58 and #A$0B3B.
C $2500,3 Generate a random number in `A`.
C $2503,8 Set bit 7 to ensure that the number has three digits and store the result as a two-byte value at #A$A3. This will be the page number.
C $250B,3 Generate the character codes for the digits of this value.
C $250E,3 Generate a random value in `A`.
C $2511,1 Is bit 7 set?
C $2512,2 Branch if so.
C $2514,4 $9D is the LSB of #A$5C9D: ANSWER THE QUESTIONS ON PAGE 123 OF YOUR LOVELY TEXTBOOK.
C $2518,4 $BA is the LSB of the address of the '1' in this message.
C $251C,3 Jump forward.
C $251F,4 $62 is the LSB of #A$5C62: TURN TO PAGE 123 OF YOUR BOOKS,BE SILENT AND START READING.
C $2523,4 $6F is the LSB of the address of the '1' in this message.
C $2527,4 Set the MSB of the message address at #A$AC.
C $252B,2 Set the MSB of the address of the '1' at #A$4E.
C $252D,16 Copy the character codes of the digits of the page number from #A$8C, #A$8D and #A$8E into the message.
c $253E Generate a random value in a given range
D $253E Used by the routine at #A$2241.
R $253E X Minimum (m)
R $253E Y Maximum (M)
R $253E O:A Random value
C $253E,2 Store the minimum value (m) at #A$E3.
C $2540,7 Store 1+M-m at #A$E4.
C $2547,3 Generate a random value (R) in `A`.
C $254A,3 Now `A`=R-m (if R>=m) or 256-m+R (if R<m).
C $254D,2 Is 0<=`A`<=M-m (i.e. m<=R<=M)?
C $254F,2 Branch back to generate another random value if not.
C $2551,1 Return without first adding m back to `A` to get R. (This is a #BUG#lowProductValues(bug).)
c $2552 Make a teacher give lines to EINSTEIN or the boy he's telling tales on
D $2552 Used by the routines at #A$0A58 and #A$0B3B.
R $2552 A Character number of EINSTEIN or the boy that he's telling tales on
R $2552 Y Lines reprimand identifier for the boy that EINSTEIN is telling tales on
C $2552,3 Save the character number on the stack and at #A$72.
C $2555,3 Generate a random value in `A`.
C $2558,2 Is this random value $B5 or greater?
C $255A,2 Branch if so.
C $255C,1 Retrieve the character number from the stack.
C $255D,2 Is it $11 (EINSTEIN)?
C $255F,2 Return if so.
C $2561,2 Store the lines reprimand identifier at #A$D8.
C $2563,3 Make the teacher give lines to the boy that EINSTEIN is telling tales on.
C $2566,1 Retrieve the character number from the stack.
C $2567,2 Lines reprimand #R$4BA0($09): DON'T TELL TALES.
C $2569,2 Store this lines reprimand identifier at #A$D8.
C $256B,2 Character number $11 is EINSTEIN.
C $256D,2 Store this character number at #A$72.
C $256F,3 Make the teacher give lines to EINSTEIN.
c $2573 Print the lesson
D $2573 #ZX$F9A5
D $2573 Used by the routine at #A$3AD5.
C $2573,2 Pick up the game mode indicator from #A$46.
C $2575,2 Branch unless we're in demo mode.
N $2577 We're in demo mode.
C $2577,8 Store #A$4600 (DEMO, - PRESS) at #A$D6.
C $257F,4 Store the width of the lesson box (in character cells) at #A$9D.
C $2583,4 Store the number of bytes to copy from the text graphic buffer at #A$31.
C $2587,3 Write the first line of text ('DEMO, - PRESS') into the text graphic buffer at #A$4500.
C $258A,3 Centre the text in the text graphic buffer.
C $258D,4 These are the coordinates at which to print the first line of text.
C $2591,3 Copy the text graphic buffer to the screen.
C $2594,3 Clear the text graphic buffer.
C $2597,8 Store #A$4610 (A KEY TO PLAY) at #A$D6.
C $259F,3 Write the second line of text ('A KEY TO PLAY') into the text graphic buffer at #A$4500.
C $25A2,3 Centre the text in the text graphic buffer.
C $25A5,4 These are the coordinates at which to print the second line of text.
C $25A9,3 Copy the text graphic buffer to the screen.
C $25AC,3 Return.
N $25AF A game is in progress.
C $25AF,4 Store the width of the lesson box (in character cells) at #A$9D.
C $25B3,4 Store the number of bytes to copy from the text graphic buffer at #A$31.
C $25B7,3 Clear the text graphic buffer.
C $25BA,2 Pick up the lesson descriptor from #A$70.
C $25BC,2 Keep only the room bits (0-2).
C $25BE,2 Is this lesson in a classroom?
C $25C0,2 Branch if not.
C $25C2,2 Pick up the lesson descriptor from #A$70.
C $25C4,2 Keep only the teacher bits (4-7).
C $25C6,2 Branch unless the teacher is MR WACKER.
C $25C8,2 This is the LSB of #A$47B8 (MR WACKER).
C $25CA,3 Jump forward.
C $25CD,2 Is the teacher MR ROCKITT?
C $25CF,2 Branch if not.
C $25D1,2 This is the LSB of #A$47C6 (MR ROCKITT).
C $25D3,3 Jump forward.
C $25D6,2 Is the teacher MR WITHIT?
C $25D8,2 Branch if not.
C $25DA,2 This is the LSB of #A$47D4 (MR WITHIT).
C $25DC,3 Jump forward.
C $25DF,2 This is the LSB of #A$47E2 (MR CREAK).
C $25E1,6 Store the address of the teacher's name at #A$D6.
C $25E7,3 Jump forward.
C $25EA,2 Branch unless the lesson is REVISION LIBRARY.
C $25EC,8 Store #A$4880 (REVISION) at #A$D6.
C $25F4,3 Write the first line of text ('REVISION' or the teacher's name) into the text graphic buffer at #A$4500.
C $25F7,3 Centre the text in the text graphic buffer.
C $25FA,4 These are the coordinates at which to print the first line of text.
C $25FE,3 Copy the text graphic buffer to the screen.
C $2601,2 Pick up the lesson descriptor from #A$70.
C $2603,2 Keep only the room bits (0-2).
C $2605,4 Shift the room bits into bits 4-6.
C $2609,9 Store the address of the room name (or 'LIBRARY', 'DINNER' or 'PLAYTIME') at #A$D6.
C $2612,3 Write the second line of text into the text graphic buffer at #A$4500.
C $2615,3 Centre the text in the text graphic buffer.
C $2618,4 These are the coordinates at which to print the second line of text.
C $261C,3 Copy the text graphic buffer to the screen.
c $2620 Print the score, lines total or hi-score
D $2620 Used by the routines at #A$1D37 (to print the score), #A$1D4A (to print the lines total) and #A$2E13 (to print the hi-score).
R $2620 A 0 (score), 1 (lines total) or 2 (hi-score)
R $2620 /(#A$4E)/ LSB of the address of the value to print
C $2620,2 Store the number identifier at #A$E6.
C $2622,4 Set the MSB of the address of the value to print.
C $2626,10 Copy the value to print to #A$A3.
C $2630,3 Generate the character codes of the digits of this value at #R$8A($8A-$8E).
C $2633,4 Store the width (in character cells) of the area in which the number will be printed at #A$9D.
C $2637,8 Store the address of the digit character codes (#A$8A) at #A$D6.
C $263F,3 Write the digits of the value into the text graphic buffer.
C $2642,2 Pick up the number identifier from #A$E6.
C $2644,2 Branch unless it's the score.
C $2646,8 Store the screen bitmap address for the score ($FB40) at #A$50.
C $264E,3 Jump forward.
C $2651,2 Are we printing the lines total?
C $2653,2 Branch if not.
C $2655,8 Store the screen bitmap address for the lines total ($FC80) at #A$50.
C $265D,3 Jump forward.
C $2660,8 Store the screen bitmap address for the hi-score ($FDC0) at #A$50.
C $2668,2 `Y` will count the bytes to copy from the text graphic buffer.
C $266A,8 Store the address of the first byte to copy from the text graphic buffer ($45E8) at #A$4E.
C $2672,7 Copy 24 bytes (3 character cells) from the text graphic buffer to the screen.
c $267A Make ANGELFACE throw a punch (1)
D $267A #ZX$6F80
D $267A The address of this uninterruptible subcommand routine is placed into ANGELFACE's buffer by the routine at #A$270D.
C $267A,8 Replace the address of this uninterruptible subcommand routine in ANGERLFACE's buffer with that of #A$2696.
C $2682,3 Update the SRB for ANGELFACE's current animatory state and location.
C $2685,4 Copy ANGELFACE's pre-punch animatory state from #A$26 to #A$B3.
C $2689,7 Set ANGELFACE's animatory state to #AS$2A($2A/$AA): hitting phase 1.
C $2690,3 Update the SRB for ANGELFACE's new animatory state.
C $2693,3 Return.
c $2696 Make ANGELFACE throw a punch (2)
D $2696 #ZX$6F8E
D $2696 The address of this uninterruptible subcommand routine is placed into ANGELFACE's buffer by the routine at #A$267A.
C $2696,8 Replace the address of this uninterruptible subcommand routine in ANGELFACE's buffer with that of #A$26E0.
C $269E,3 Update the SRB for ANGELFACE's current animatory state and location.
C $26A1,2 Increment ANGELFACE's animatory state to #AS$2B($2B/$AB): hitting phase 2.
C $26A3,3 Update the SRB for ANGELFACE's new animatory state.
C $26A6,2 Pick up ANGELFACE's y-coordinate from #A$FB.
C $26A8,2 Pick up ANGELFACE's animatory state from #A$26.
C $26AA,1 Is ANGELFACE facing right?
C $26AB,2 Branch if so.
C $26AD,2 Pick up ANGELFACE's x-coordinate from #A$FC.
C $26AF,3 Subtract 2 to get the x-coordinate of ANGELFACE's fist.
C $26B2,3 Jump forward.
C $26B5,2 Pick up ANGELFACE's x-coordinate from #A$FC.
C $26B7,3 Add 2 to get the x-coordinate of ANGELFACE's fist.
C $26BA,1 Transfer the fist x-coordinate to `X`.
C $26BB,3 Did ANGELFACE's fist land on anyone's jaw?
C $26BE,2 Return if not.
C $26C0,2 Was ERIC hit?
C $26C2,2 Branch if so.
C $26C4,2 Store the character number of ANGELFACE's victim at #A$57.
C $26C6,3 Restore ANGELFACE's character buffer from page 0.
C $26C9,4 Pick up ANGELFACE's character number from #A$60 and store it at #A$2F.
C $26CD,2 Pick up the character number of ANGELFACE's victim from #A$57.
C $26CF,2 Update the current character number at #A$60.
C $26D1,3 Copy the character buffer of ANGELFACE's victim to page 0.
C $26D4,3 Knock ANGELFACE's victim over.
C $26D7,6 Set bit 4 of ERIC's status flags at #A$2B: ERIC has just been knocked down.
C $26DD,3 Return.
c $26E0 Make ANGELFACE finish punching or BOY WONDER finish firing his catapult
D $26E0 The address of this uninterruptible subcommand routine is placed into ANGELFACE's buffer by the routine at #A$2696 and into BOY WONDER's buffer by the routine at #A$2B9F.
C $26E0,3 Update the SRB for the character's current animatory state and location.
C $26E3,4 Restore the character's pre-action animatory state from #A$B3.
C $26E7,4 Remove the address of this routine from the character's buffer, effectively terminating the subcommand.
C $26EB,3 Update the SRB for the character's new animatory state.
N $26EE This entry point is used by the routines at #A$267A and #A$2696.
c $26EF Check whether ANGELFACE is touching ERIC
D $26EF The address of this continual subcommand routine is placed into MR ROCKITT's buffer by command list #R$4376($DE).
C $26EF,8 Set bit 1 of byte $7A of ANGELFACE's character buffer: he is running continuously.
C $26F7,3 Pick up ANGELFACE's x-coordinate.
C $26FA,3 Does it match ERIC's x-coordinate?
C $26FD,2 Return if not.
C $26FF,3 Pick up ANGELFACE's y-coordinate.
C $2702,3 Does it match ERIC's y-coordinate?
C $2705,2 Return if not.
C $2707,2 Event #R$4400($0C): ERIC has mumps.
C $2709,3 Raise the signal for this event.
c $270D Make ANGELFACE hit now and then
D $270D #ZX$6F1E
D $270D The address of this continual subcommand routine is placed into ANGELFACE's buffer by command lists #R$40FA($8E), #R$413D($96), #R$4180($9E), #R$41C3($A6), #R$41F7($AE), #R$421C($B4), #R$422B($B6) and #R$436E($DC).
C $270D,2 Pick up ANGELFACE's animatory state from #A$26.
C $270F,1 Is ANGELFACE midstride?
C $2710,2 Return if so.
C $2712,2 Pick up the LSB of the lesson clock from #A$FD.
C $2714,2 Is bit 1 set?
C $2716,2 Return if so.
C $2718,3 Is ANGELFACE on a staircase?
C $271B,2 Return if so.
C $271D,3 Can ANGELFACE be seen by a teacher at this moment?
C $2720,2 Return if so.
N $2722 ANGELFACE is not on a staircase, and there are no teachers nearby. Are there any potential victims nearby?
C $2722,2 Pick up ANGELFACE's y-coordinate from #A$FB.
C $2724,2 Pick up ANGELFACE's animatory state from #A$26.
C $2726,1 Is ANGELFACE facing right?
C $2727,2 Branch if so.
C $2729,2 Pick up ANGELFACE's x-coordinate from #A$FC.
C $272B,3 Subtract 3 to get the target x-coordinate of a potential victim.
C $272E,3 Jump forward.
C $2731,2 Pick up ANGELFACE's x-coordinate from #A$FC.
C $2733,3 Add 3 to get the target x-coordinate of a potential victim.
C $2736,1 Transfer the target x-coordinate to `X`.
C $2737,3 Is there anyone at the target coordinates?
C $273A,2 Return if not.
C $273C,8 Place the address of the uninterruptible subcommand routine at #A$267A into ANGELFACE's buffer to make him throw a punch.
C $2744,1 Return to the character-handling routine at #A$3B5E, which then has the opportunity of moving ANGELFACE midstride before he begins the punch. This is a #BUG#pairOfJerks(bug).
c $2745 Deal with a teacher who has found the truant ERIC
D $2745 Used by the routine at #A$0C3F after having its address placed at #A$AE by the routine at #A$0B3B.
C $2745,2 Pick up the flags byte from #A$3F.
C $2747,2 Has the teacher's command list been marked for a restart?
C $2749,2 Branch if not.
C $274B,3 Terminate the interruptible subcommand.
C $274E,3 Is ERIC in the classroom he should be in?
C $2751,2 Return if not.
C $2753,3 Otherwise restart the teacher's command list.
c $2757 Make a teacher tell ERIC to go home, and end the game
D $2757 #ZX$F9F6
D $2757 Used by command list #R$4376($DE) and the command list at #A$43A2.
C $2757,6 Set bit 6 of ERIC's status flags at #A$2B, indicating that he is immobilised.
C $275D,5 Set the opcode of the instruction at #A$1DB7 to $60 (RTS) to prevent the teachers from giving ERIC (or anyone else) lines.
C $2762,10 Collect the message address from the command list and store it at #A$AC.
M $276C,5 Place the address of the interruptible subcommand routine at #A$2387 into the teacher's buffer and jump to it.
W $276F,2,2
N $2771 Control returns here after ERIC has been told to go home.
C $2771,5 Set the opcode of the instruction at #A$1DB7 back to $AD (LDA absolute).
C $2776,3 Prepare for demo mode.
C $2779,3 Enter demo mode.
u $277C Unused
B $277C,1,1
c $277D Make MR WACKER give ERIC 2000 lines
D $277D #ZX$F7E0
D $277D Used by command lists #R$431F($D6) and #R$4352($DA).
C $277D,8 Place #A$4C00 (TAKE 2000 LINES YOU NASTY BOY) at #A$AC.
M $2785,5 Place the address of the interruptible subcommand routine at #A$2387 into MR WACKER's buffer and jump to it.
W $2788,2,2
N $278A Control returns here after MR WACKER has spoken to ERIC.
C $278A,4 Set the MSB of the lesson clock at #A$40 to 1 so that the bell will ring soon.
C $278E,5 Add 2000 lines to ERIC's total.
C $2793,3 Terminate this primary command.
u $2796 Unused
B $2796,1,1
c $2797 Make the stampede leader trip people up on the way to a random location
D $2797 The address of this continual subcommand routine is placed into the stampede leader's buffer by command list #R$42AD($CC).
C $2797,2 This instruction is redundant.
C $2799,6 Set bit 1 of the flags byte at #A$3F: this character is running continuously.
C $279F,8 Replace the address of this continual subcommand routine in the boy's buffer with that of #A$2873.
C $27A7,3 Make the boy go to a random location.
u $27AA Unused
B $27AA,1,1
c $27AB Make a character walk up and down a few times or until a certain time
D $27AB #ZX$6B3D
D $27AB Used by command lists #R$422B($B6), #R$425D($C0), #R$4272($C2), #R$4290($C4) and #R$42AD($CC).
C $27AB,6 Reset bit 1 of the flags byte at #A$3F: the character is not running continuously.
C $27B1,5 Collect the next byte (the number of walkabouts) from the command list and store it at #A$A8.
C $27B6,5 Collect the next byte (the event identifier, always 0) from the command list and store it at #A$A6.
C $27BB,4 Pick up the character's x-coordinate from #A$FC and store it at #A$A7. This will be the walkabout origin.
C $27BF,8 Replace the address of this primary command routine in the character's buffer with that of #A$27C7 below.
C $27C7,2 Decrement the number of mini-walkabouts remaining.
C $27C9,2 Branch unless it's now zero.
C $27CB,3 Terminate this primary command.
C $27CE,3 Set the character off on a mini-walkabout.
u $27D1 Unused
B $27D1,1,1
c $27D2 Check whether anyone was or can be punched by ERIC or ANGELFACE
D $27D2 Used by the routines at #A$17E5, #A$2696 and #A$270D.
R $27D2 X Target x-coordinate
R $27D2 Y Target y-coordinate
R $27D2 O:A Character number of the potential victim (if any)
R $27D2 O:P Carry flag set if there is someone punchable at the target coordinates
C $27D2,4 Pick up ERIC's or ANGELFACE's animatory state from #A$26 and store it at #A$0A.
C $27D6,4 Store the target coordinates at #A$0B and #A$0C.
C $27DA,3 Restore ERIC's or ANGELFACE's buffer from page 0.
C $27DD,2 Pick up the current character number from #A$60.
C $27DF,1 Save it temporarily.
C $27E0,4 Set the current character number at #A$60 to $14 (ERIC).
C $27E4,3 Copy ERIC's character buffer to page 0.
C $27E7,2 Pick up ERIC's y-coordinate from #A$FB.
C $27E9,2 Does it match the target y-coordinate?
C $27EB,2 Branch if not.
C $27ED,2 Pick up ERIC's x-coordinate from #A$FC.
C $27EF,2 Does it match the target x-coordinate?
C $27F1,2 Branch if not.
C $27F3,2 Pick up ERIC's animatory state from #A$26.
C $27F5,3 Is ERIC facing the puncher?
C $27F8,2 Branch if not.
C $27FA,2 Pick up ERIC's character number from #A$60.
C $27FC,1 Set the carry flag: there is someone (ERIC) at the target coordinates.
C $27FD,3 Jump forward.
C $2800,4 Set the current character number at #A$60 to $0F (ANGELFACE).
N $2804 Here we enter a loop to check whether ANGELFACE, BOY WONDER, EINSTEIN or any of the little boys are at the target location.
C $2804,3 Copy the current character's buffer to page 0.
C $2807,2 Pick up the character's y-coordinate from #A$FB.
C $2809,2 Does it match the target y-coordinate?
C $280B,2 Branch if not.
C $280D,2 Pick up the character's x-coordinate from #A$FC.
C $280F,2 Does it match the target x-coordinate?
C $2811,2 Branch if not.
C $2813,2 Is the character currently controlled by an uninterruptible subcommand routine?
C $2815,2 Branch if so.
C $2817,2 Pick up the character's animatory state from #A$26.
C $2819,3 Is the character facing the puncher?
C $281C,2 Branch if not.
C $281E,2 Pick up the current character's number from #A$60.
C $2820,1 Set the carry flag: there is someone at the target coordinates.
C $2821,3 Jump forward.
C $2824,2 Pick up the current character number from #A$60.
C $2826,2 Have we just checked character number $11 (EINSTEIN)?
C $2828,2 Branch if not.
C $282A,2 Otherwise start checking the little boys.
C $282C,2 Update the current character number at #A$60.
C $282E,3 Jump back to the start of the loop.
C $2831,2 Is the current character number $0A (little boy no. 11)?
C $2833,2 Branch if not.
C $2835,1 Clear the carry flag: there is no one at the target coordinates.
C $2836,3 Jump forward.
C $2839,2 Increment the current character number at #A$60.
C $283B,3 Jump back to the start of the loop.
C $283E,2 Store the character number of the potential victim at #A$57.
C $2840,3 Rotate the carry flag into bit 0 of `A` and store it at #A$56 temporarily.
C $2843,1 Restore the current character number to `A`.
C $2844,2 Update the current character number at #A$60.
C $2846,3 Copy the current character's buffer into page 0.
C $2849,3 Restore the carry flag from bit 0 at #A$56.
C $284C,2 Pick up the character number of the potential victim.
c $284F Make MR WACKER run to a given location
D $284F Used by command list #R$4352($DA).
C $284F,6 Set bit 1 of the flags byte at #A$3F: MR WACKER is running continuously.
C $2855,6 Collect the destination x-coordinate from the command list, store it at #A$A6 and transfer it to `X`.
C $285B,6 Collect the destination y-coordinate from the command list, store it at #A$A7 and transfer it to `Y`.
C $2861,3 Make MR WACKER go to the location.
u $2864 Unused
B $2864,1,1
c $2865 Place a continual subcommand routine address into a character's buffer
D $2865 #ZX$7C5A
D $2865 Used by command lists #R$40E7($8C), #R$40FA($8E), #R$4123($94), #R$413D($96), #R$4166($9C), #R$4180($9E), #R$41A9($A4), #R$41C3($A6), #R$41E8($AC), #R$41F7($AE), #R$420D($B2), #R$421C($B4), #R$422B($B6), #R$4272($C2), #R$42AD($CC), #R$42CF($CE), #R$4334($D8), #R$436E($DC) and #R$4376($DE). The continual subcommand routine address collected from the command list will be one of the following:
D $2865 #TABLE(default,centre,:w) { =h Address | =h Description } { #A$26EF | #D$26EF } { #A$270D | #D$270D } { #A$2797 | #D$2797 } { #A$2873 | #D$2873 } { #A$2CA5 | #D$2CA5 } TABLE#
C $2865,10 Collect the address of the continual subcommand routine from the command list and store it at #A$39.
C $286F,3 Move to the next command in the command list.
u $2872 Unused
B $2872,1,1
c $2873 Make a little boy trip people up
D $2873 #ZX$69F6
D $2873 The address of this continual subcommand routine is placed into a little boy's buffer by command lists #R$42AD($CC) and #R$42CF($CE), and is also placed into the stampede leader's buffer by the routine at #A$2797.
C $2873,2 Pick up the boy's animatory state from #A$26.
C $2875,1 Is the boy midstride?
C $2876,2 Return if so.
C $2878,3 Is the boy on a staircase?
C $287B,2 Return if so.
C $287D,4 Pick up the boy's x- and y-coordinates from #A$FC and #A$FB.
C $2881,3 Knock down any potential victim at these coordinates.
c $2885 Make a little boy find and follow little boy no. 1
D $2885 #ZX$6A82
D $2885 Used by command list #R$42CF($CE).
C $2885,6 Set bit 1 of the flags byte at #A$3F: this character is running continuously.
C $288B,14 Pick up the address of the continual subcommand routine from bytes $7B and $7C of little boy no. 1's character buffer, and return unless it is #A$2873.
C $2899,8 Place the address of the continual subcommand routine at #A$2873 into this little boy's buffer at #A$39.
C $28A1,6 Pick up little boy no. 1's destination coordinates from bytes $65 and $66 of his character buffer.
C $28A7,3 Make them this little boy's destination coordinates and set him on his way there.
c $28AB Make BOY WONDER write on a blackboard
D $28AB #ZX$7DA7
D $28AB Used by command lists #R$4123($94), #R$4166($9C), #R$41A9($A4) and #R$425D($C0).
C $28AB,3 Collect the event identifier from the command list.
C $28AE,3 Has the signal for this event been raised?
C $28B1,2 Branch if so.
M $28B3,5 Place the address of the interruptible subcommand routine at #A$1129 into BOY WONDER's buffer and jump to it.
W $28B6,2,2
C $28B8,3 Terminate this primary command.
u $28BB Unused
B $28BB,1,1
c $28BC Make little boy no. 10 give ERIC a message
D $28BC #ZX$F800
D $28BC Used by command lists #R$42E3($D0) and #R$42FB($D2).
C $28BC,6 Set bit 6 of ERIC's status flags at #A$2B, indicating that he is immobilised.
C $28C2,10 Collect the message address from the command list and store it at #A$A6.
C $28CC,4 Set the MSB of the lesson clock at #A$40 to $FF to ensure that the bell won't ring before the message is delivered.
C $28D0,8 Copy the message address from #A$A6 to #A$AC.
M $28D8,5 Place the address of the interruptible subcommand routine at #A$2387 into little boy no. 10's buffer and jump to it.
W $28DB,2,2
N $28DD Control returns here after the message has been delivered.
C $28DD,6 Set bit 5 of ERIC's status flags at #A$2B, indicating that little boy no. 10 is expecting a response.
C $28E3,8 Store #A$4620 (PRESS 'U' IF YOU UNDERSTAND) at #A$AC.
C $28EB,4 Initialise the message repetition delay counter at #A$A9.
M $28EF,5 Place the address of the interruptible subcommand routine at #A$2387 into little boy no. 10's buffer and jump to it.
W $28F2,2,2
N $28F4 Control returns here after little boy no. 10 has asked ERIC if he understands.
C $28F4,2 Pick up ERIC's status flags from #A$2B.
C $28F6,2 Is bit 6 set, indicating that he is still immobolised?
C $28F8,2 Branch if so.
C $28FA,4 Reset the MSB of the lesson clock to $0F.
C $28FE,3 Terminate this primary command.
C $2901,2 Decrement the message repetition delay counter at #A$A9.
C $2903,2 Branch unless it's zero now.
C $2905,6 Reset bit 5 of ERIC's status flags at #A$2B, indicating that little boy no. 10 is no longer expecting a response, because he's going to repeat the message first.
C $290B,3 Jump back to deliver the message again.
c $290F Deal with ERIC if he's being spoken to by little boy no. 10
D $290F Used by the routine at #A$15B3.
C $290F,2 Pick up ERIC's status flags from #A$2B.
C $2911,3 Is bit 5 set, indicating that little boy no. 10 is waiting for a response?
C $2914,2 Return if not.
C $2916,4 Pick up the keyboard/joystick reading from #A$4C and store a copy at #A$C5.
C $291A,4 Clear the keyboard/joystick reading at #A$4C.
C $291E,2 Pick up the keyboard/joystick reading from #A$C5.
C $2920,2 Return if no key was pressed.
C $2922,4 Was 'U' pressed?
C $2926,2 Return if not.
C $2928,6 Otherwise clear bits 4-6 of ERIC's status flags at #A$2B: he is free to move again.
c $292F Generate a safe combination code
D $292F Used by the routines at #A$2BB0 and #A$2E13.
C $292F,2 There are 4 letters in the safe combination code.
C $2931,5 Generate a random value between 0 and 31.
C $2936,3 Add $41 (the ASCII code for 'A').
C $2939,2 Is the result greater than $5A (the code for 'Z')?
C $293B,2 Branch back if so.
C $293D,2 Does this randomly chosen letter match the character at $90+`X` (which might be the first digit of MR CREAK's year of birth at #A$94)?
C $293F,2 Branch back if so to get another one.
C $2941,1 Decrement the letter counter.
C $2942,2 Store a randomly chosen letter at #R$90($90-$93).
C $2944,2 Store a copy of it at #R$4E($4E-$51).
C $2946,2 Branch back until 4 letters have been generated.
C $2948,4 Initialise the shuffle counter at #A$55 to $0A.
C $294C,9 Generate a random number between 1 and 3. Call it P.
C $2955,2 Store P at #A$56.
C $2957,1 Increment `X` for no apparent reason.
C $2958,2 Set the LSB of the lesson clock at #A$FD to P for no apparent reason.
C $295A,9 Generate a random number between 1 and 3. Call it Q.
C $2963,2 Store Q at #A$57.
C $2965,20 Swap the letters stored at $4E+P and $4E+Q.
C $2979,2 Decrement the shuffle counter at #A$55.
C $297B,2 Pick up the shuffle counter from #A$55.
C $297D,2 Branch unless it's zero now.
C $297F,11 Copy the randomly shuffled letters at #R$4E($4E-$51) to #R$03($03-$06).
c $298B Make a stricken teacher reveal his safe combination letter
D $298B Used by the routine at #A$2A43.
C $298B,2 Pick up the current character number from #A$60.
C $298D,2 Is it $00-$0A (a little boy)?
C $298F,2 Return if so.
C $2991,2 Is the current character number $0B-$0D (a teacher other than MR CREAK)?
C $2993,2 Return if not.
N $2995 This entry point is used by the routine at #A$1F29 to make MR CREAK reveal his safe combination letter.
C $2995,3 Reduce the teacher's character number to 0-3.
C $2998,6 Pick up the teacher's safe combination letter from #R$03($03-$06) and store it at #A$4640. This is the first line in the message.
C $299E,8 Prepare the MSBs of the addresses of the first and second lines in the message at #A$87 and #A$89.
C $29A6,5 Store a space character at #A$4642. This is the second line in the message.
C $29AB,8 Prepare the LSBs of the addresses of the first and second lines in the message at #A$86 and #A$88.
C $29B3,5 Pick up the current value of the sprite enable register and store it at #A$F6.
C $29B8,2 Branch if no sprites are enabled at the moment.
C $29BA,3 Back up existing sprite information
C $29BD,3 Print the safe combination letter above the teacher's head.
C $29C0,2 Were any sprites enabled before this routine was called?
C $29C2,2 Return if not.
C $29C4,3 Otherwise restore the previous sprite information.
c $29C8 Check whether a character has been hit by a pellet or a stampeding boy
D $29C8 Used by the routines at #A$0FBA and #A$2873.
R $29C8 X Target x-coordinate
R $29C8 Y Target y-coordinate
R $29C8 O:A Number of character who was hit (or 0 if nobody was hit)
R $29C8 O:P Carry flag set if a character was knocked over
C $29C8,3 Does ERIC's x-coordinate match that of the target?
C $29CB,2 Branch if not.
C $29CD,3 Does ERIC's y-coordinate match that of the target?
C $29D0,2 Branch if not.
C $29D2,6 Set bit 4 of ERIC's status flags at #A$2B: ERIC has been knocked down.
C $29D8,4 Set ERIC's posture indicator at #A$14 to 0: ERIC is not standing up.
C $29DC,2 Character number $14 is ERIC.
C $29DE,1 Set the carry flag: a character (ERIC) was knocked over.
C $29DF,3 Return.
C $29E2,4 Store the target coordinates at #A$0B and #A$0C.
C $29E6,3 Restore the current character's buffer from page 0.
C $29E9,4 Pick up the current character number from #A$60 and store it at #A$2F.
C $29ED,4 Set the current character number at #A$60 to $0B (MR WACKER).
N $29F1 Here we enter a loop to check whether any of the teachers or main kids (besides ERIC) were hit.
C $29F1,3 Copy the potential victim's character buffer to page 0.
C $29F4,2 Pick up the potential victim's x-coordinate.
C $29F6,2 Does it match that of the target?
C $29F8,2 Branch if not.
C $29FA,2 Pick up the potential victim's y-coordinate.
C $29FC,2 Does it match that of the target?
C $29FE,2 Branch if so.
C $2A00,2 Pick up the current character number from #A$60.
C $2A02,2 Is it $11 (EINSTEIN)?
C $2A04,2 Branch if so (there is no one left to check).
C $2A06,2 Increment the current character number at #A$60.
C $2A08,3 Jump back to check the next character.
C $2A0B,2 Is the potential victim currently controlled by an uninterruptible subcommand?
C $2A0D,2 Branch if not.
C $2A0F,2 Pick up the current character number from #A$60.
C $2A11,2 Is it $0B-$0E (a teacher)?
C $2A13,2 Branch if not.
C $2A15,1 Clear the carry flag: no one was knocked over.
C $2A16,3 Jump forward.
N $2A19 This entry point is used by the routines at #A$17E5 and #A$2696.
C $2A19,8 Place the address of the uninterruptible subcommand routine at #A$2A43 into the character's buffer.
C $2A21,4 Initialise the delay counter at #A$B2 that determines how long the character will stay down.
C $2A25,3 Restore the character's buffer from page 0.
C $2A28,2 Pick up the current character number from #A$60.
C $2A2A,1 Set the carry flag: a character was knocked over.
C $2A2B,3 Jump forward.
C $2A2E,2 `A`=0: no one was hit.
C $2A30,1 Clear the carry flag: no one was hit.
C $2A31,2 Store the victim's character number (or 0) at #A$57.
C $2A33,3 Save the carry flag in bit 0 at #A$56 temporarily.
C $2A36,4 Restore the saved character number from #A$2F.
C $2A3A,3 Copy the current character's buffer into page 0.
C $2A3D,3 Restore the carry flag from bit 0 at #A$56.
C $2A40,2 Pick up the victim's character number (or 0) from #A$57.
c $2A43 Deal with a character who has been knocked over
D $2A43 #ZX$6A46
D $2A43 The address of this uninterruptible subcommand routine is placed into a character's buffer by the routine at #A$29C8.
C $2A43,2 Decrement the knockout delay counter at #A$B2.
C $2A45,2 Branch unless the character has already got up.
C $2A47,3 Terminate this uninterruptible subcommand.
C $2A4A,2 Pick up the knockout delay counter from #A$B2.
C $2A4C,2 Has the character only just been hit?
C $2A4E,2 Branch if not.
C $2A50,4 Pick up the character's pre-knockout animatory state from #A$26 and store it at #A$B3 for later retrieval.
C $2A54,3 Update the SRB for the character's current animatory state and location.
C $2A57,2 Pick up the character's animatory state.
C $2A59,7 Update it to that of the character lying on the floor.
C $2A60,3 Update the SRB for the character's new animatory state.
C $2A63,3 Return.
C $2A66,2 Is it time to reveal a safe combination letter?
C $2A68,2 Branch if not.
C $2A6A,2 Pick up the game mode indicator from #A$46.
C $2A6C,2 Are all the shields flashing?
C $2A6E,2 Return if not.
C $2A70,3 If the character is a teacher, make him reveal a safe combination letter.
C $2A73,3 Return.
C $2A76,2 Is it time for the character to get up?
C $2A78,2 Branch if not.
C $2A7A,3 Update the SRB for the character's current animatory state and location.
C $2A7D,4 Restore the character's pre-knockout animatory state from #A$B3.
C $2A81,3 Update the SRB for the character's new animatory state.
C $2A84,3 Return.
C $2A87,2 Is it time to give lines to the nearest main kid?
C $2A89,2 Return if not.
C $2A8B,2 Pick up the current character number from #A$60.
C $2A8D,2 Is it $00-$0A (a little boy)?
C $2A8F,2 Return if so.
C $2A91,2 Is the current character number $0B-$0E (a teacher)?
C $2A93,2 Return if not.
C $2A95,3 Make the teacher give lines to the closest main kid.
c $2A99 Make a character find ERIC
D $2A99 #ZX$F78E
D $2A99 Used by command lists #R$42E3($D0), #R$42FB($D2), #R$431F($D6), #R$4352($DA), #R$4376($DE) and #R$438A($E0), and also by the command list at #A$43A2.
C $2A99,8 Store the address of the routine at #A$0C31 (to be called after the character has found ERIC) at #A$AE.
M $2AA1,5 Place the address of the interruptible subcommand routine at #A$0C3F into the character's buffer and jump to it.
W $2AA4,2,2
N $2AA6 Control returns here when the character has found ERIC.
C $2AA6,3 Terminate this primary command.
u $2AA9 Unused
B $2AA9,1,1
c $2AAA Set MR CREAK's birth year
D $2AAA Used by the routines at #A$2BB0 and #A$2E13.
C $2AAA,7 Generate a random value between $00 and $14.
C $2AB1,4 Double it and add $D5. Now $D5<=`A`<=$FD and `A` is odd.
C $2AB5,2 Store this value at #A$A5.
C $2AB7,3 Subtract 1. Now $D4<=`A`<=$FC and `A` is even.
C $2ABA,1 Save this value temporarily.
C $2ABB,4 Initialise the battle year message address MSB at #A$1E to $4D.
C $2AC0,2 Now $54<=`A`<=$7C and `A` is even.
C $2AC2,2 Is `A` less than $16?
C $2AC4,2 Branch if so (this never happens).
C $2AC6,2 Increment the message address MSB at #A$1E to $4E.
C $2AC8,2 Is `A` less than $2B?
C $2ACA,2 Branch if so (this never happens).
C $2ACC,2 Increment the message address MSB at #A$1E to $4F.
C $2ACE,2 Is `A` less than $40?
C $2AD0,2 Branch if so (this never happens).
C $2AD2,2 Increment the message address MSB at #A$1E to $50.
C $2AD4,2 Is the random value less than $56?
C $2AD6,2 Branch if so.
C $2AD8,2 Increment the message address MSB at #A$1E to $51.
C $2ADA,2 Is the random value less than $6B?
C $2ADC,2 Branch if so.
C $2ADE,2 Increment the message address MSB at #A$1E to $52.
C $2AE0,8 Multiply `A` by 12.
C $2AE8,2 Store this battle year message address LSB at #A$1D.
C $2AEA,14 Copy the battle year to #R$94($94-$97).
c $2AF9 Raise the signal for a certain event and move to the next command
D $2AF9 #ZX$6B58
D $2AF9 Used by command lists #R$4080($80), #R$4095($82), #R$40AE($84), #R$40C3($86), #R$42AD($CC), #R$42E3($D0), #R$42FB($D2), #R$4309($D4), #R$431F($D6), #R$4334($D8), #R$4352($DA) and #R$438A($E0),
C $2AF9,4 Collect the event identifier from the command list and transfer it to `Y`.
C $2AFD,8 Prepare to address the signal flags table at #A$4400.
C $2B05,4 Raise the signal for the given event.
C $2B09,3 Terminate this primary command.
u $2B0C Unused
B $2B0C,1,1
c $2B0D Lower the signal for a certain event and move to the next command
D $2B0D #ZX$6B54
D $2B0D Used by command lists #R$42AD($CC) and #R$4334($D8).
C $2B0D,4 Collect the event identifier from the command list and transfer it to `Y`.
C $2B11,8 Prepare to address the signal flags table at #A$4400.
C $2B19,4 Lower the signal for the given event.
C $2B1D,3 Terminate this primary command.
u $2B20 Unused
B $2B20,1,1
c $2B21 Make BOY WONDER fire his catapult (1)
D $2B21 #ZX$702C
D $2B21 The address of this uninterruptible subcommand routine is placed into BOY WONDER's buffer by the routine at #A$2CA5.
C $2B21,4 Pick up BOY WONDER's pre-action animatory state and store it at #A$B3.
C $2B25,8 Replace the address of this uninterruptible subcommand routine in BOY WONDER's buffer with that of #A$2B3F.
C $2B2D,3 Update the SRB for BOY WONDER's current animatory state and location.
C $2B30,9 Set BOY WONDER's animatory state to #AS$38($38/$B8): firing (phase 1).
C $2B39,3 Update the SRB for BOY WONDER's new animatory state.
C $2B3C,3 Return.
c $2B3F Make BOY WONDER fire his catapult (2)
D $2B3F #ZX$703D
D $2B3F The address of this uninterruptible subcommand routine is placed into BOY WONDER's buffer by the routine at #A$2B21.
C $2B3F,8 Replace the address of this uninterruptible subcommand routine in BOY WONDER's buffer with that of #A$2B52.
N $2B47 This entry point is used by the routines at #A$17E5 and #A$191B.
C $2B47,3 Update the SRB for the character's current animatory state and location.
C $2B4A,2 Increment the character's animatory state to the next action phase.
C $2B4C,3 Update the SRB for the character's new animatory state.
C $2B4F,3 Return.
c $2B52 Make BOY WONDER fire his catapult (3)
D $2B52 #ZX$7048
D $2B52 The address of this uninterruptible subcommand routine is placed into BOY WONDER's buffer by the routine at #A$2B3F.
C $2B52,8 Replace the address of this uninterruptible subcommand routine in BOY WONDER's buffer with that of #A$2B9F.
C $2B5A,2 Character number $12 is BOY WONDER's pellet.
C $2B5C,2 Store this character number at #A$DC temporarily.
C $2B5E,2 Character number $10 is BOY WONDER.
C $2B60,2 Store this character number at #A$DB temporarily.
N $2B62 This entry point is used by the routine at #A$191B to initialise ERIC's catapult pellet.
C $2B62,4 Pick up the character's animatory state from #A$26 and store it at #A$0A.
C $2B66,4 Pick up the character's x-coordinate from #A$FC and store it at #A$0B.
C $2B6A,4 Pick up the character's y-coordinate from #A$FB and store it at #A$0C.
C $2B6E,3 Restore the character's buffer from page 0.
C $2B71,2 Pick up the pellet's character number from #A$DC.
C $2B73,2 Update the current character number at #A$60.
C $2B75,3 Copy the pellet's character buffer into page 0.
C $2B78,8 Place the address of the uninterruptible subcommand routine at #A$0FBA into the pellet's buffer.
C $2B80,4 Initialise the distance remaining of the pellet's flight at #A$B2.
C $2B84,4 Initialise the pellet's x-coordinate at #A$FC.
C $2B88,4 Initialise the pellet's y-coordinate at #A$FB.
C $2B8C,6 Initialise the pellet's animatory state at #A$26 to #AS$7F($7F) (flying left) or #AS$7F($FF) (flying right).
C $2B92,3 Restore the pellet's buffer from page 0.
C $2B95,4 Restore the original character number at #A$60.
C $2B99,3 Copy the firing character's buffer into page 0.
C $2B9C,3 Return.
c $2B9F Make BOY WONDER fire his catapult (4)
D $2B9F #ZX$7067
D $2B9F The address of this uninterruptible subcommand routine is placed into BOY WONDER's buffer by the routine at #A$2B52.
C $2B9F,8 Replace the address of this uninterruptible subcommand routine in BOY WONDER's buffer with that of #A$26E0.
N $2BA7 This entry point is used by the routines at #A$189D and #A$191B.
C $2BA7,3 Update the SRB for the character's current animatory state and location.
C $2BAA,2 Decrement the character's animatory state, moving him to the next action phase.
C $2BAC,3 Update the SRB for the character's new animatory state.
N $2BAF This entry point is used by the routines at #A$2B21, #A$2B3F and #A$2B52.
c $2BB0 Check whether a shield has been hit or jumped up to
D $2BB0 Used by the routines at #A$1042 and #A$176F.
R $2BB0 XY Coordinates of ERIC's hand or a catapult pellet
C $2BB0,4 Store the target x-coordinate at #A$56 and the target y-coordinate at #A$57.
C $2BB4,8 Prepare to address the shield locations and status table at #A$58E0.
C $2BBC,2 We start with the last shield and work backwards.
C $2BBE,2 Pick up a shield y-coordinate.
C $2BC0,2 Does it match the target y-coordinate?
C $2BC2,2 Branch if so.
C $2BC4,2 Have we checked every shield yet?
C $2BC6,2 Return if so.
C $2BC8,3 Otherwise point at the next shield in the table.
C $2BCB,3 Jump back to check it.
C $2BCE,3 Return.
C $2BD1,3 Point at the shield's x-coordinate and pick it up.
C $2BD4,2 Does it match the target x-coordinate?
C $2BD6,2 Branch if so.
C $2BD8,2 Have we checked every shield yet?
C $2BDA,2 Return if so.
C $2BDC,2 Otherwise point at the next shield in the table.
C $2BDE,3 Jump back to check it.
N $2BE1 A shield has been hit.
C $2BE1,2 Pick up the game mode indicator from #A$46.
C $2BE3,2 Have all the shields been flashed yet?
C $2BE5,2 Branch if not.
C $2BE7,2 Has ERIC opened the safe?
C $2BE9,2 Branch if so.
C $2BEB,3 Jump forward.
C $2BEE,4 Point at the shield's status byte and pick it up.
C $2BF2,2 Branch if the shield is flashing.
C $2BF4,3 Otherwise jump forward to terminate the pellet's flight.
C $2BF7,4 Set the shield's status byte to 0: it is no longer flashing.
C $2BFB,3 Jump forward.
C $2BFE,4 Point at the shield's status byte and pick it up.
C $2C02,2 Branch if the shield is not flashing.
C $2C04,3 Otherwise jump forward to terminate the pellet's flight.
C $2C07,4 Set the shield's status byte to 1: it is flashing.
C $2C0B,2 Pick up the target y-coordinate from #A$57.
C $2C0D,2 Is the shield on the top floor?
C $2C0F,2 Branch if so.
C $2C11,2 Is the shield on the middle floor?
C $2C13,2 Branch if so.
C $2C15,2 A shield on the bottom floor is worth 400 points.
C $2C17,3 Jump forward.
C $2C1A,2 A shield on the middle floor is worth 200 points.
C $2C1C,3 Jump forward.
C $2C1F,2 A shield on the top floor is worth 100 points.
C $2C21,3 Add to the score and print it.
C $2C24,4 Set the sound effect identifier at #A$2C to 1: a shield has been hit.
C $2C28,4 Initialise the sound effect timer at #A$2D.
C $2C2C,2 Increment the shield counter at #A$D9.
C $2C2E,2 Pick up the new value of the shield counter.
C $2C30,2 Have all 15 shields been hit?
C $2C32,2 Branch if so.
C $2C34,3 Otherwise jump forward to terminate the pellet's flight.
N $2C37 All 15 shields have been hit. This entry point is used by the routine at #A$176F when ERIC has opened the safe.
C $2C37,4 Reset the shield counter at #A$D9 to 0.
C $2C3B,2 Increment the game mode indicator at #A$46.
C $2C3D,2 Pick up the new value of the game mode indicator.
C $2C3F,2 Has the last shield just been unflashed?
C $2C41,2 Branch if so.
C $2C43,2 Has the last shield just been flashed?
C $2C45,2 Branch if so.
C $2C47,2 2000 points will be awarded.
C $2C49,3 Jump forward.
C $2C4C,2 1000 points will be awarded.
C $2C4E,3 Add to the score and print it.
C $2C51,3 Play the 'Got all shields' tune.
C $2C54,3 Jump forward to terminate the pellet's flight.
C $2C57,4 Reset the game mode indicator to 1: ERIC has gone up a year.
C $2C5B,4 5000 points will be awarded.
C $2C5F,3 Add to the score and print it.
C $2C62,3 Generate a new safe combination code.
C $2C65,3 Set MR CREAK's birth year.
C $2C68,4 Store the width (in character cells) of the area in which the WELL DONE message will be printed at #A$9D.
C $2C6C,8 Store #A$4680 (WELL DONE! GO) at #A$D6.
C $2C74,3 Write this message into the text graphic buffer.
C $2C77,3 Centre the text in the text graphic buffer.
C $2C7A,4 These are the coordinates at which to print the first line of text.
C $2C7E,3 Copy the text graphic buffer to the screen.
C $2C81,4 Store #A$4690 (UP A YEAR) at #A$D6.
C $2C85,3 Write this message into the text graphic buffer.
C $2C88,3 Centre the text in the text graphic buffer.
C $2C8B,4 These are the coordinates at which to print the second line of text.
C $2C8F,3 Copy the text graphic buffer to the screen.
C $2C92,4 Set the safe status indicator at #A$D5 to $00: the safe is not flashing.
C $2C96,6 Set the LSB and MSB of the lesson clock to 1. The bell will ring soon.
C $2C9C,3 Play the theme tune.
C $2CA0,4 Set the remaining distance for the pellet to travel to 1, ensuring that it is terminated on the next pass.
c $2CA5 Make BOY WONDER fire his catapult now and then
D $2CA5 #ZX$7000
D $2CA5 The address of this continual subcommand routine is placed into BOY WONDER's buffer by command lists #R$40E7($8C), #R$4123($94), #R$4166($9C), #R$41A9($A4), #R$41E8($AC), #R$420D($B2), #R$4272($C2) and #R$4334($D8).
C $2CA5,2 Pick up BOY WONDER's x-coordinate from #A$FC.
C $2CA7,2 Is it a multiple of 4?
C $2CA9,2 Return if not.
C $2CAB,2 Pick up BOY WONDER's animatory state from #A$26.
C $2CAD,1 Is BOY WONDER midstride?
C $2CAE,2 Return if so.
C $2CB0,3 Is BOY WONDER on a staircase?
C $2CB3,2 Return if so.
C $2CB5,3 Generate a random value in `A`.
C $2CB8,1 Is it odd?
C $2CB9,2 Return if so.
C $2CBB,3 Can BOY WONDER be seen by a teacher at this moment?
C $2CBE,2 Return if so.
C $2CC0,8 Prepare to address the character buffer for BOY WONDER's pellet at #A$8A60.
C $2CC8,4 Pick up the pellet's x-coordinate.
C $2CCC,1 Is the pellet already airborne?
C $2CCD,2 Return if so.
C $2CCF,8 Place the address of the uninterruptible subcommand routine at #A$2B21 into BOY WONDER's buffer.
C $2CD7,1 Return to the character-handling routine at #A$3B5E, which then has the opportunity of moving BOY WONDER midstride before he begins firing. This is a #BUG#pairOfJerks(bug).
u $2CD8 Unused
B $2CD8,1,1
c $2CD9 Initialise interrupts, screen memory and page 0
D $2CD9 Called once from the main loop at #A$0800 after the game has loaded.
C $2CD9,1 Clear the decimal flag to prepare for regular arithmetic.
C $2CDA,1 Disable interrupts.
C $2CDB,3 Page out the KERNAL ROM at $E000-$FFFF.
C $2CDE,10 Set the address of the interrupt routine at $FFFE to #A$39C7.
C $2CE8,16 Set the address of the non-maskable interrupt routine at $FFFA and the address of the cold reset routine at $FFFC to that of the RTI instruction at #A$3A8F.
C $2CF8,1 Enable interrupts.
C $2CF9,3 Clear the screen.
C $2CFC,3 Initialise colour information.
C $2CFF,3 Clear page 0.
C $2D02,3 Set pointers to screen bitmap and colour information.
C $2D05,3 Initialise voice #3.
C $2D08,3 Initialise the game status buffer.
C $2D0B,3 Set standard bitmap mode.
C $2D0E,3 Initialise the speech bubble sprite graphic data at $C800.
C $2D11,3 Draw the Skool Daze logo.
C $2D14,3 Draw the score box.
c $2D18 Page out the KERNAL ROM at $E000-$FFFF
D $2D18 Used by the routine at #A$2CD9.
C $2D18,6 Reset bit 1 of the processor port at $0001, making RAM visible at $E000-$FFFF.
c $2D1F Set pointers to screen bitmap and colour information
D $2D1F Used by the routine at #A$2CD9.
C $2D1F,8 Set bits 0 and 1 at $DD02; this enables bits 0 and 1 in port A to be read and written.
C $2D27,10 Reset bits 0 and 1 at $DD00; this selects VIC bank 3 at $C000-$FFFF.
C $2D31,12 Reset bits 6 and 7 and set bits 3, 4 and 5 at $D018. In bitmap mode, this places colour information at $CC00 and the bitmap at $E000.
c $2D3E Set standard bitmap mode
D $2D3E Used by the routine at #A$2CD9.
C $2D3E,8 Set bit 5 of the screen control register at $D011, enabling bitmap mode.
c $2D47 Initialise the game status buffer
D $2D47 Used by the routines at #A$2CD9 and #A$2E13.
C $2D47,4 Initialise the x-coordinate of the leftmost column of the skool on screen to 32.
C $2D4B,4 Initialise the x-coordinate of the leftmost column of the skool off screen to 72.
C $2D4F,8 Store the address of the play area tile back buffer (#A$4000) at #A$5E for the routine at #A$3326.
C $2D57,8 Store the screen bitmap start address ($E000) at #A$5A. This is redundant because the routines that use the address stored there will reinitialise it.
C $2D5F,8 Store the colour information start address ($CC00) at #A$5C. This is redundant because the routines that use the address stored there will reinitialise it.
C $2D67,4 Initialise the current character number at #A$60 to $FF.
C $2D6B,2 Initialise ERIC's posture indicator at #A$14 to $FF: ERIC is standing up.
C $2D6D,4 Initialise MSB of the lesson clock at #A$40 to $0F.
C $2D71,4 Initialise the LSB of the lesson clock at #A$FD to 0.
C $2D75,2 Initialise the shield counter at #A$D9 to 0.
C $2D77,2 Clear ERIC's midstride indicator at #A$4B.
C $2D79,2 Clear all of ERIC's status flags at #A$2B.
C $2D7B,2 Initialise the game mode indicator at #A$46 to 0.
C $2D7D,2 Initialise the sound effect identifier at #A$2C to 0.
C $2D7F,2 Initialise the sound effect timer at #A$2D to 0.
C $2D81,3 Disable all sprites.
C $2D84,2 Initialise the keyboard/joystick reading at #A$4C to 0.
C $2D86,4 Initialise the keyboard/joystick input timer at #A$E5 to 1.
C $2D8A,4 Initialise ERIC's action timer at #A$FE to 4.
C $2D8E,7 Generate a random value between $00 and $14 in `A`.
C $2D95,1 Transfer the random value to `Y`.
C $2D96,8 Prepare to address of the table of initial lesson numbers at #A$4650.
C $2D9E,6 Pick up a randomly chosen value from this table and store it at #A$41; this initialises the lesson number.
C $2DA4,4 Initialise the keyboard delay counter at #A$EB to 5.
C $2DA8,4 Initialise the value at #A$44 to $44 (this is never used).
c $2DAD Clear the screen
D $2DAD Used by the routine at #A$2CD9.
C $2DAD,8 Prepare to address the screen bitmap at $E000.
C $2DB5,14 Fill addresses $E000-$FEFF with zeroes.
C $2DC3,7 Fill addresses $FF00-$FF37 with zeroes.
c $2DCB Initialise colour information
D $2DCB Used by the routine at #A$2CD9.
C $2DCB,8 Prepare to address the colour information  at $CC00.
C $2DD3,5 Set the border colour to blue.
C $2DD8,16 Fill addresses $CC00-$CEFF with the value $66 (blue background and blue foreground).
C $2DE8,9 Fill addresses $CF00-$CF47 with the value $66 (blue background and blue foreground).
C $2DF1,8 Prepare to address the initial colour information for the bottom four rows of the screen at #A$5D48.
C $2DF9,11 Fill addresses $CF48-$CFE7 with a copy of the colour information at #A$5D48.
c $2E05 Clear page 0
D $2E05 Used by the routine at #A$2CD9.
C $2E05,6 Prepare to address page 0.
C $2E0B,7 Fill addresses $0002-$00FF with zeroes.
c $2E13 Prepare for a new game or demo mode
D $2E13 Used by the routines at #A$2757 and #A$BE09.
C $2E13,8 Store #A$7860 (the base address of little boy no. 1's character buffer) at #A$50.
C $2E1B,2 `X` will be used to index the table of initial animatory states at #A$4900.
C $2E1D,2 `Y` will be used to index the character's buffer.
C $2E1F,3 Pick up the character's initial animatory state from the table at #A$4900.
C $2E22,2 Store it in the character's buffer.
C $2E24,2 Next character buffer.
C $2E26,1 Next initial animatory state.
C $2E27,2 Have we initialised every character's animatory state yet?
C $2E29,2 Branch back if not.
C $2E2B,1 Point at the second byte of the character buffers.
C $2E2C,2 Reset `X` to 0.
C $2E2E,4 Reset the address at #A$50 to that of the little boy no. 1's character buffer.
C $2E32,3 Pick up the character's initial x-coordinate from the table at #A$4A00.
C $2E35,2 Store it in the character's buffer.
C $2E37,2 Next character buffer.
C $2E39,1 Next initial x-coordinate.
C $2E3A,2 Have we initialised every character's x-coordinate yet?
C $2E3C,2 Branch back if not.
C $2E3E,2 Reset `X` to 0.
C $2E40,2 Point at the third byte of the character buffers.
C $2E42,4 Reset the address at #A$50 to that of the little boy no. 1's character buffer.
C $2E46,2 Every character starts at y-coordinate 17 (on the bottom floor).
C $2E48,2 Set the character's y-coordinate.
C $2E4A,2 Next character buffer.
C $2E4C,1 Increment the character counter.
C $2E4D,2 Have we initialised every character's y-coordinate yet?
C $2E4F,2 Branch back if not.
C $2E51,2 Pick up the MSB of the score from #A$7D.
C $2E53,2 Compare it with the MSB of the hi-score.
C $2E55,2 Branch if they're equal.
C $2E57,2 Branch if we have a new hi-score.
C $2E59,2 This branch is always made (no new hi-score).
C $2E5B,2 Pick up the LSB of the score from #A$7C.
C $2E5D,2 Compare it with the MSB of the hi-score.
C $2E5F,2 Branch unless we have a new hi-score.
C $2E61,8 Copy the current score from #A$7C into the hi-score at at #A$F7.
C $2E69,4 Set the current character number at #A$60 to $00 (little boy no. 1).
C $2E6D,4 Reset the score to 0.
C $2E71,4 Reset the lines total to 0.
C $2E75,3 Set MR CREAK's birth year.
C $2E78,3 Generate a safe combination code.
C $2E7B,3 Draw the Skool Daze logo.
C $2E7E,3 Draw the score box.
C $2E81,2 Pick up the MSB of the hi-score.
C $2E83,2 Branch unless it's zero.
C $2E85,2 Pick up the LSB of the hi-score.
C $2E87,2 Branch unless it's zero.
C $2E89,3 Skip printing the hi-score if it's zero.
C $2E8C,4 Store the LSB of the address of the hi-score at #A$4E.
C $2E90,2 `A`=2, indicating the hi-score.
C $2E92,3 Print the hi-score.
C $2E95,3 Copy a character's buffer into page 0.
C $2E98,4 Remove the address of any primary command routine from the character's buffer.
C $2E9C,2 Remove the address of any uninterruptible subcommand routine from the character's buffer.
C $2E9E,2 Remove the address of any interruptible subcommand routine from the character's buffer.
C $2EA0,2 Remove the address of any continual subcommand routine from the character's buffer.
C $2EA2,4 Remove the address reached in the command list from the character's buffer.
C $2EA6,4 Remove the address of the command list from the character's buffer.
C $2EAA,24 Zero out the remainder of the character's buffer.
C $2EC2,3 Restore the character's buffer from page 0.
C $2EC5,2 Increment the current character number at #A$60.
C $2EC7,2 Pick up the current character number from #A$60.
C $2EC9,2 Have we initialised the character buffer of every boy (except ERIC) and teacher?
C $2ECB,2 Branch back if not.
C $2ECD,8 Prepare to address the shield locations and status table at #A$58E0.
C $2ED5,13 Initialise the shields.
C $2EE2,3 Initialise the game status buffer.
c $2EE6 Get the screen bitmap and colour information addresses for a play area tile
D $2EE6 Used by the routine at #A$3326.
R $2EE6 /(#A$27)/ Play area x-coordinate
R $2EE6 /(#A$28)/ Play area y-coordinate
R $2EE6 /O:(#R$5A($5A,$5B))/ Screen bitmap address
R $2EE6 /O:(#R$5C($5C,$5D))/ Colour information address
C $2EE6,2 Pick up the x-coordinate.
C $2EE8,3 Subtract the x-coordinate of the leftmost column of the skool on screen.
C $2EEB,2 Store this relative x-coordinate at #A$5A.
C $2EED,4 Initialise #A$5D to 0.
C $2EF1,2 Pick up the y-coordinate.
C $2EF3,11 Multiply it by 40, storing bits 8 and 9 of the result at #A$5D.
C $2EFE,2 Add the relative x-coordinate.
C $2F00,2 Store the relative x-coordinate at #A$5A.
C $2F02,6 Add the relative x-coordinate to the value at #A$5C.
N $2F08 Now the two-byte value at #A$5C is equal to 40y+x, where (x,y) are the screen coordinates corresponding to the input play area coordinates. This is the index of the tile, counting row by row from the top left of the screen.
C $2F08,15 Multiply the tile index by 8, add $E000 (the base address of the screen bitmap), and store the result at #A$5A.
C $2F17,6 Add $CC00 (the base address of the colour information) to the tile index at #A$5C.
C $2F1D,2 Add 40 to `A` for no good reason.
c $2F20 Draw the Skool Daze logo
D $2F20 Used by the routines at #A$2CD9 and #A$2E13.
C $2F20,8 Prepare to address the Skool Daze logo at #A$5920.
C $2F28,8 Store the screen bitmap address $FA60 at #A$50.
C $2F30,11 Draw the top row of 8 cells in Skool Daze logo.
C $2F3B,13 Draw the middle row of 8 cells in Skool Daze logo.
C $2F48,13 Draw the bottom row of 8 cells in Skool Daze logo.
c $2F56 Draw the score box
D $2F56 Used by the routines at #A$2CD9 and #A$2E13.
C $2F56,8 Prepare to address the score box graphic at #A$5820.
C $2F5E,8 Store the screen bitmap address $FB20 at #A$50.
C $2F66,11 Draw the top row of 8 cells in score box graphic.
C $2F71,13 Draw the middle row of 8 cells in score box graphic.
C $2F7E,13 Draw the bottom row of 8 cells in score box graphic.
c $2F8C Print the play area tiles in a single column of the screen
D $2F8C Used by the routines at #A$3072 and #A$3113.
R $2F8C Y x-coordinate of the column
R $2F8C /(#R$5A($5A,$5B))/ Screen bitmap address
R $2F8C /(#R$5C($5C,$5D))/ Colour information address
C $2F8C,2 Store the x-coordinate at #A$27.
C $2F8E,4 Initialise the row counter at #A$28.
C $2F92,3 Print a play area tile.
C $2F95,13 Add 320 (40x8) to the screen bitmap address at #A$5A to point at the adjacent tile in the row below.
C $2FA2,11 Add 40 to the colour information address at #A$5C to point at the adjacent tile in the row below.
C $2FAD,2 Increment the row counter at #A$28.
C $2FAF,2 Pick up the row counter.
C $2FB1,2 Have we done all 21 rows yet?
C $2FB3,2 Branch back if not.
c $2FB6 Move a column of screen tiles left or right
D $2FB6 Used by the routines at #A$3072 and #A$3113.
R $2FB6 /(#R$4E($4E,$4F))/ Source screen bitmap address
R $2FB6 /(#R$50($50,$51))/ Source colour information address
R $2FB6 /(#R$52($52,$53))/ Destination screen bitmap address
R $2FB6 /(#A$54)/ Source colour information index
R $2FB6 /(#A$55)/ Destination colour information index
C $2FB6,2 There are 21 screen rows to shift.
C $2FB8,2 Initialise the index.
C $2FBA,39 Copy the eight bytes of the source tile to the destination tile.
C $2FE1,8 Copy the colour information of the source tile to the destination tile.
C $2FE9,13 Add 320 (40x8) to the source screen bitmap address at #A$4E. Now it points at the adjacent tile in the row below.
C $2FF6,13 Add 320 (40x8) to the destination screen bitmap address at #A$52. Now it points at the adjacent tile in the row below.
C $3003,11 Add 40 to the source colour information address at #A$50. Now it points at the adjacent tile in the row below.
C $300E,1 Next screen row.
C $300F,2 Branch back until all 21 rows are done.
c $3012 Bring the skool (or a blank screen) into view
D $3012 Used by the routines at #A$0800 and #A$BE09.
C $3012,8 Initialise the x-coordinates of the leftmost columns of the skool on screen and off to -8 and 32.
C $301A,15 Shift the play area window right five times.
c $302A Initialise voice #3
D $302A Used by the routines at #A$2CD9, #A$BA00 and #A$BA48.
C $302A,8 Set voice #3 frequency to $8080.
C $3032,3 Set voice #3 control register: voice off, noise enabled.
C $3035,5 Set volume to maximum.
C $303A,5 Set voice #3 attack length to 2ms and delay length to 6ms.
C $303F,5 Set voice #3 sustain volume to 0 and release length to 6ms.
C $3044,2 Set `A` to $80 for no particular reason.
c $3047 Initialise speech bubble sprites
D $3047 Used by the routine at #A$2CD9.
C $3047,5 Disable all sprites.
C $304C,3 Clear the sprite double width register.
C $304F,8 Prepare to address the initial speech bubble sprite graphic data at #A$3C00.
C $3057,8 Prepare to address the runtime speech bubble sprite graphic data at $C800.
C $305F,18 Copy the contents of addresses #R$3C00($3C00-$3FFF) to $C800-$CBFF.
c $3072 Shift the play area window left
D $3072 Used by the routine at #A$35EF.
C $3072,1 Disable interrupts.
C $3073,2 Pick up the x-coordinate of the leftmost column of the skool on screen from #A$58.
C $3075,2 Is it 8 or more?
C $3077,2 Branch if so.
C $3079,3 Otherwise return now.
C $307C,4 Set the destination colour information index at #A$55 to 8.
C $3080,4 Set the source colour information index at #A$54 to 0.
C $3084,8 Store $E0F8 at #A$5A. This screen bitmap address corresponds to the 32nd tile from the left in the top row of the screen.
C $308C,8 Store $CC1F at #A$5C. This colour information address corresponds to the 32nd tile from the left in the top row of the screen.
C $3094,2 Initialise the column counter in `X`.
C $3096,1 Decrement the column counter in `X`.
C $3097,2 Save the column counter on the stack temporarily.
C $3099,8 Copy the screen bitmap address from #A$5A to #A$4E. This will be the source address.
C $30A1,8 Copy the colour information address from #A$5C to #A$50. This will be the source address.
C $30A9,8 Copy the screen bitmap address from #A$4E to #A$52.
C $30B1,11 Add 64 to the screen bitmap address at #A$52. This corresponds to the tile that is 8 cells to the right in the same row, and will be the destination address.
C $30BC,3 Move a column of screen tiles right.
C $30BF,13 Subtract 8 from the screen bitmap address at #A$5A. This corresponds to the next tile to the left in the top row of the screen.
C $30CC,2 Subtract 1 from the colour information address at #A$5C. This corresponds to the next tile to the left in the top row of the screen.
C $30CE,2 Restore the column counter to `X`.
C $30D0,2 Branch back to deal with the remaining columns.
N $30D2 The 32 leftmost columns of the skool on screen have been shifted right. Time to draw the leftmost 8 columns of the skool.
C $30D2,8 Store $E038 at #A$5A. This screen bitmap address corresponds to the 8th tile from the left in the top row of the screen.
C $30DA,4 Update the colour information address at #A$5C to $CC07. This corresponds to the 8th tile from the left in the top row of the screen.
C $30DE,3 Move sprites #1-#6 right by 64 pixels.
C $30E2,2 There are 8 new play area columns to draw in the gap left by the shifting window.
C $30E4,2 Save this column counter temporarily.
C $30E6,4 Decrement the x-coordinates of the leftmost column of the skool on screen and off.
C $30EA,2 Pick up the x-coordinate of the leftmost column of the skool on screen.
C $30EC,6 Save the screen bitmap address on the stack.
C $30F2,6 Save the colour information address on the stack.
C $30F8,3 Print the play area tiles in a single column of the screen.
C $30FB,6 Restore the saved colour information address to #A$5C.
C $3101,9 Restore the saved screen bitmap address to #A$5A and subtract 8 from it. This points at the next tile to the left in the top row of the screen.
C $310A,2 Subtract 1 from the colour information address at #A$5C. This points at the next tile to the left in the top row of the screen.
C $310C,2 Restore the column counter to `X`.
C $310E,1 Decrement the column counter.
C $310F,2 Branch back to deal with the remaining columns.
C $3111,1 Re-enable interrupts.
c $3113 Shift the play area window right
D $3113 Used by the routines at #A$3012 and #A$35EF.
C $3113,1 Disable interrupts.
C $3114,2 Pick up the x-coordinate of the leftmost column of the skool off screen.
C $3116,2 Is it less than 89?
C $3118,2 Branch if so.
C $311A,3 Otherwise return now.
C $311D,4 Set the source colour information index at #A$54 to 8.
C $3121,4 Set the destination colour information index at #A$55 to 0.
C $3125,8 Store $E000 at #A$5A. This screen bitmap address corresponds to the tile at the top left of the screen.
C $312D,8 Store $CC00 at #A$5C. This colour information address corresponds to the tile at the top left of the screen.
C $3135,2 Initialise the column counter in `X`.
C $3137,1 Increment the column counter in `X`.
C $3138,2 Save the column counter on the stack temporarily.
C $313A,8 Copy the screen bitmap address from #A$5A to #A$52. This will be the destination address.
C $3142,8 Copy the colour information address from #A$5C to #A$50. This will be the source address.
C $314A,8 Copy the screen bitmap address from #A$52 to #A$4E.
C $3152,11 Add 64 to the screen bitmap address at #A$4E. This corresponds to the tile that is 8 cells to the right in the same row, and will be the source address.
C $315D,3 Move a column of screen tiles left.
C $3160,11 Add 8 to the destination screen bitmap address at #A$5A. This corresponds to the next tile to the right in the top row of the screen.
C $316B,2 Increment the colour information address at #A$5C. This corresponds to the next tile to the right in the top row of the screen.
C $316D,2 Restore the column counter to `X`.
C $316F,2 Have we moved 32 columns of screen tiles yet?
C $3171,2 Branch back if not.
N $3173 The 32 rightmost columns of the skool on screen have been shifted left. Time to draw the rightmost 8 columns of the skool.
C $3173,8 Store $E100 at #A$5A. This screen bitmap address corresponds to the 33rd tile from the left in the top row.
C $317B,4 Store $CC20 at #A$5C. This colour information address corresponds to the 33rd tile from the left in the top row.
C $3180,3 Move sprites #0-#6 left by 64 pixels.
C $3183,2 There are 8 new play area columns to draw in the gap left by the shifting window.
C $3185,2 Save this column counter temporarily.
C $3187,4 Increment the x-coordinates of the leftmost column of the skool on screen and off.
C $318B,2 Pick up the x-coordinate of the leftmost column of the skool off screen.
C $318D,1 Now `Y` holds the x-coordinate of the rightmost column of the skool on screen.
C $318E,6 Save the screen bitmap address on the stack.
C $3194,6 Save the colour information address on the stack.
C $319A,3 Print the play area tiles in a single column of the screen.
C $319D,6 Restore the saved colour information address to #A$5C.
C $31A3,10 Restore the saved screen bitmap address to #A$5A and add 8 to it. This points at the next tile to the right in the top row of the screen.
C $31AD,2 Add 1 to the colour information address at #A$5C. This points at the next tile to the right in the top row of the screen.
C $31AF,2 Restore the column counter to `X`.
C $31B1,1 Decrement the column counter.
C $31B2,2 Branch back to deal with the remaining columns.
C $31B4,1 Re-enable interrupts.
c $31B6 Raise the signal for an event
D $31B6 Used by the routines at #A$0A58, #A$0B3B, #A$0E35, #A$1EE3 and #A$26EF.
R $31B6 A Event identifier
C $31B6,1 Transfer the event identifier to `Y`.
C $31B7,8 Prepare to address the signal flags table at #A$4400.
C $31BF,4 Raise the signal for this event.
c $31C4 Lower the signal for an event
D $31C4 Used by the routine at #A$1F4D.
R $31C4 A Event identifier
C $31C4,1 Transfer the event identifier to `Y`.
C $31C5,8 Prepare to address the signal flags table at #A$4400.
C $31CD,4 Lower the signal for this event.
c $31D2 Check whether a signal has been raised
D $31D2 Used by the routines at #A$0B3B, #A$149F, #A$1A04, #A$1EE3, #A$1F4D and #A$28AB.
R $31D2 A Event identifier
R $31D2 O:P Carry flag set if the signal has been raised
C $31D2,1 Transfer the event identifier to `Y`.
C $31D3,8 Prepare to address the signal flags table at #A$4400.
C $31DB,2 Pick up the status byte for the signal.
C $31DD,1 Set the carry flag if the signal has been raised.
c $31DF Pause briefly
D $31DF Used by the routine at #A$2043.
C $31DF,10 Count down from $FFFF to $0000.
c $31EA Update the display
D $31EA #ZX$6992
D $31EA Used by the routines at #A$0800, #A$35EF and #A$BE09.
C $31EA,10 Prepare to address the screen refresh buffer (SRB) at #A$4008, working backwards from the last byte at $4070 to the 11th byte $4012. This ignores the first ten bytes - which correspond to the top two rows of the screen - and is a #BUG#disappearingPellet(bug).
C $31F4,2 Pick up a byte from the screen refresh buffer.
C $31F6,2 Branch if it's zero (no updates required).
C $31F8,2 Store the SRB byte at #A$57.
C $31FA,2 Save `Y` temporarily.
C $31FC,10 Set `X` to 1+8*INT(`Y`/40).
C $3206,6 Increase `X` by INT((`Y`%40)/5)+1. This is the play area y-coordinate of the segment corresponding to the SRB byte under inspection.
C $320C,2 Store this play area y-coordinate at #A$28.
C $320E,2 Now 0<=`A`<5, the remainder when `Y` is divided by 5.
C $3210,5 Multiply by 8 and add the x-coordinate of the leftmost column of the skool on screen. This gives the play area x-coordinate of the leftmost cell in the segment corresponding to the SRB byte under inspection.
C $3215,2 Store this play area x-coordinate at #A$27.
C $3217,2 Move bit 7 of the SRB byte into the carry flag.
C $3219,2 Branch if it's clear (no update required).
C $321B,3 Print the corresponding play area tile.
C $321E,2 Increment the play area x-coordinate at #A$27.
C $3220,2 Pick up the remains of the SRB byte.
C $3222,2 Branch back until it's zero.
C $3224,2 Restore the SRB index to `Y`.
C $3226,4 Clear all bits in this byte of the screen refresh buffer.
C $322A,1 Next byte in the screen refresh buffer.
C $322B,2 Branch back unless we've finished.
c $322E Update the SRB for a character's current animatory state and location
D $322E #ZX$6214
D $322E Used by the routines at #A$0C3F, #A$0FBA, #A$1042, #A$1129, #A$12B5, #A$136F, #A$13F3, #A$15B3, #A$169B, #A$16E9, #A$176F, #A$189D, #A$191B, #A$1C59, #A$1CB4, #A$1CCB, #A$1CEC, #A$267A, #A$2696, #A$26E0, #A$2A43, #A$2B21, #A$2B3F, #A$2B9F, #A$3472, #A$35EF, #A$364E and #A$365C.
C $322E,2 Pick up the character's animatory state from #A$26.
C $3230,8 Prepare to address the animatory state tile references at #A$8D00 onwards.
C $3238,4 Pick up the character's x-coordinate from #A$FC and store it at #A$57. This is the initial play area x-coordinate.
N $323C Here we enter a loop to consider each tile of the character's sprite that is currently on screen, working column by column from left to right.
C $323C,4 Pick up the character's y-coordinate from #A$FB and store it at #A$4A. This is the initial play area y-coordinate.
C $3240,2 Pick up the play area x-coordinate from #A$57.
C $3242,2 Is it less than the x-coordinate of the leftmost column of the skool on screen?
C $3244,2 Branch if not.
C $3246,3 Otherwise jump forward to consider the next column of tiles in the character's sprite.
C $3249,2 Is the play area x-coordinate less than the x-coordinate of the leftmost column of the skool off screen?
C $324B,2 Branch if not to consider the next column of tiles in the character's sprite (which will also be off screen).
C $324D,2 There are four rows of tiles in a character's sprite.
C $324F,2 Pick up the character's animatory state from #A$26.
C $3251,2 Pick up an animatory state tile reference.
C $3253,2 Branch if it's zero (i.e. the blank tile).
C $3255,2 Pick up the play area x-coordinate from #A$57.
C $3257,5 Subtract the x-coordinate of the leftmost column of the skool on screen to obtain the screen x-coordinate, and store it at #A$49.
C $325C,3 Update the SRB for the character cell containing this sprite tile.
C $325F,2 Point at the animatory state tile references for the next row of tiles in the character's sprite.
C $3261,2 Increment the play area y-coordinate at #A$4A.
C $3263,1 Decrement the tile row counter.
C $3264,2 Branch back until all four tiles in this column have been checked.
C $3266,3 Jump forward.
C $3269,7 Add 4 to the MSB of the animatory state tile reference address at #A$51. This now points at the first tile in the next column to the right.
C $3270,2 Increment the play area x-coordinate at #A$57. This now corresponds to the tiles in the next column to the right.
C $3272,2 Pick up the animatory state tile reference address MSB.
C $3274,2 Have we done every tile in the sprite yet?
C $3276,2 Branch back if not.
c $3279 Copy a character buffer into page 0
D $3279 Used by the routines at #A$0800, #A$149F, #A$15B3, #A$1640, #A$17E5, #A$191B, #A$1EE3, #A$2241, #A$2696, #A$27D2, #A$29C8, #A$2B52, #A$2E13, #A$3AB4, #A$3AD5 and #A$BE09.
C $3279,17 Place the base address of the current character's buffer at #A$4E.
C $328A,6 Copy the character's animatory state from byte $60 of his buffer to #A$26.
C $3290,1 `Y`=$01.
C $3291,4 Copy the character's x-coordinate from byte $61 of his buffer to #A$FC.
C $3295,1 `Y`=$02.
C $3296,4 Copy the character's y-coordinate from byte $62 of his buffer to #A$FB.
C $329A,1 `Y`=$03.
C $329B,9 Collect the primary command routine address from bytes $63 and $64 of the character's buffer and place it at #A$29.
C $32A4,1 `Y`=$05.
C $32A5,4 Copy byte $65 of the character's buffer to #A$A6.
C $32A9,1 `Y`=$06.
C $32AA,4 Copy byte $66 of the character's buffer to #A$A7.
C $32AE,1 `Y`=$07.
C $32AF,4 Copy byte $67 of the character's buffer to #A$A8.
C $32B3,1 `Y`=$08.
C $32B4,4 Copy byte $68 of the character's buffer to #A$A9.
C $32B8,1 `Y`=$09.
C $32B9,9 Collect the interruptible subcommand routine address from bytes $69 and $6A of the character's buffer and place it at #A$AA.
C $32C2,1 `Y`=$0B.
C $32C3,4 Copy byte $6B of the character's buffer to #A$AC.
C $32C7,1 `Y`=$0C.
C $32C8,4 Copy byte $6C of the character's buffer to #A$AD.
C $32CC,1 `Y`=$0D.
C $32CD,4 Copy byte $6D of the character's buffer to #A$AE.
C $32D1,1 `Y`=$0E.
C $32D2,4 Copy byte $6E of the character's buffer to #A$AF.
C $32D6,1 `Y`=$0F.
C $32D7,9 Collect the uninterruptible subcommand routine address from bytes $6F and $70 of the character's buffer and place it at #A$B0.
C $32E0,1 `Y`=$11.
C $32E1,4 Copy byte $71 of the character's buffer to #A$B2.
C $32E5,1 `Y`=$12.
C $32E6,4 Copy byte $72 of the character's buffer to #A$B3.
C $32EA,1 `Y`=$13.
C $32EB,4 Copy byte $73 of the character's buffer to #A$B4.
C $32EF,1 `Y`=$14.
C $32F0,4 Copy byte $74 of the character's buffer to #A$B5.
C $32F4,1 `Y`=$15.
C $32F5,9 Collect the address reached in the character's command list from bytes $75 and $76 of the character's buffer and place it at #A$3B.
C $32FE,1 `Y`=$17.
C $32FF,9 Collect the start address of the character's command list from bytes $77 and $78 of the character's buffer and place it at #A$3D.
C $3308,1 `Y`=$19.
C $3309,4 Copy byte $79 of the character's buffer to #A$FF.
C $330D,1 `Y`=$1A.
C $330E,4 Copy byte $7A of the character's buffer to #A$3F.
C $3312,1 `Y`=$1B.
C $3313,9 Collect the continual subcommand routine address from bytes $7B and $7C of the character's buffer and place it at #A$39.
C $331C,1 `Y`=$1D.
C $331D,2 Pick up byte $7D of the character's buffer and do nothing with it.
C $331F,1 `Y`=$1E.
C $3320,2 Pick up byte $7E of the character's buffer and do nothing with it.
C $3322,1 `Y`=$1F.
C $3323,2 Pick up byte $7F of the character's buffer and do nothing with it.
c $3326 Print a play area tile
D $3326 #ZX$610B
D $3326 Used by the routine at #A$31EA.
R $3326 /(#A$27)/ Play area x-coordinate
R $3326 /(#A$28)/ Play area y-coordinate
C $3326,3 Compute the screen bitmap and colour information addresses for the play area tile and place them at #A$5A and #A$5C.
N $3329 This entry point is used by the routine at #A$2F8C.
C $3329,4 Copy the play area x-coordinate to #A$52. This is the LSB of the base address from which the play area tile reference and colour information can be found.
C $332D,9 Keep only bits 5 and 6, shift them into bits 3 and 4, add $67 and store the result ($67, $6F or $77) at #A$55. This is the MSB of the address of the eighth byte in the skool tile at the given play area coordinates.
C $3336,7 Pick up the play area y-coordinate, add $78 and store the result at #A$53. This is the MSB of the address at which the play area tile reference and colour information can be found.
C $333D,8 Copy the colour information byte to the screen.
C $3345,4 Pick up the skool tile reference and store it at #A$54. This is the LSB of the address of the skool tile graphic data.
C $3349,12 Copy the skool tile graphic bytes into the buffer at #A$4000.
N $3355 The back buffer at #A$4000 now contains a copy of the skool tile at the given coordinates. Time to superimpose the tiles of any character sprites at the same location.
C $3355,2 The vector at #A$50 will be used to address sprite tile graphic data. Set the LSB to 0 now.
C $3357,8 Prepare to address the character buffers, starting with little boy no. 1's at #A$7860.
C $335F,2 `X` will count the characters.
C $3361,2 `Y`=1, pointing at the character's x-coordinate.
C $3363,2 Pick up the play area x-coordinate from #A$27.
C $3365,3 Subtract the character's x-coordinate.
C $3368,2 Is the result less than 3?
C $336A,2 Branch if not.
C $336C,4 Multiply by 4 and store the result (0, 4, 8) at #A$55. This indicates the column (left, middle, right) of the character's sprite that aligns with the play area x-coordinate.
C $3370,2 Pick up the play area y-coordinate from #A$28.
C $3372,1 `Y`=2, pointing at the character's y-coordinate.
C $3373,3 Subtract the character's y-coordinate from the play area y-coordinate.
C $3376,2 Is the result less than 4?
C $3378,2 Branch if not.
C $337A,6 Add this y-coordinate difference (0, 1, 2, 3) and $8D to #A$55 to get the MSB of the relevant animatory state tile reference.
C $3380,2 `Y`=0, pointing at the character's animatory state.
C $3382,4 Pick up the character's animatory state and store it at #A$54. This is the LSB of the address of the animatory state tile reference.
C $3386,2 Pick up a tile reference for the character's animatory state.
C $3388,2 Branch if it's zero (the blank tile).
C $338A,1 Transfer the tile reference to `Y`.
C $338B,2 Save the character counter temporarily.
C $338D,2 The sprite graphic data for the boys and the catapult pellet is in pages #R$9900($99-$A8).
C $338F,2 Are we still dealing with little boys 1-11?
C $3391,2 Branch if so.
C $3393,2 Are we dealing with a teacher?
C $3395,2 Branch if not.
C $3397,2 The sprite graphic data for the teachers is in pages #R$A900($A9-$B8).
C $3399,2 Set the MSB of the sprite tile graphic data address at #A$51.
C $339B,2 `X` will count the bytes in sprite tile.
C $339D,12 Modify a byte of the tile in the back buffer at #A$4000 by superimposing a sprite tile byte (using a mask).
C $33A9,2 Point at the next sprite tile mask byte.
C $33AB,1 Have we superimposed the entire sprite tile yet?
C $33AC,2 Branch back if not.
C $33AE,2 Restore the character counter to `X`.
C $33B0,2 Next character buffer.
C $33B2,1 Have we checked every character yet?
C $33B3,2 Branch back if not.
N $33B5 The tile in the back buffer at #A$4000 now consists of the skool tile with all relevant sprite tiles superimposed.
C $33B5,9 Copy the tile from the back buffer to the screen.
c $33BF Restore a character buffer from page 0
D $33BF Used by the routines at #A$0800, #A$15B3, #A$17E5, #A$191B, #A$1EE3, #A$2241, #A$2696, #A$27D2, #A$29C8, #A$2B52, #A$2E13, #A$35EF, #A$3AB4, #A$3AD5 and #A$BE09.
C $33BF,17 Place the base address of the current character's buffer at #A$4E.
C $33D0,6 Copy the character's animatory state from #A$26 to byte $60 of his buffer.
C $33D6,1 `Y`=$01.
C $33D7,4 Copy the character's x-coordinate from #A$FC to byte $61 of his buffer.
C $33DB,1 `Y`=$02.
C $33DC,4 Copy the character's y-coordinate from #A$FB to byte $62 of his buffer.
C $33E0,1 `Y`=$03.
C $33E1,9 Collect the primary command routine address from #A$29 and place it in bytes $63 and $64 of the character's buffer.
C $33EA,1 `Y`=$05.
C $33EB,4 Copy the contents of #A$A6 into byte $65 of the character's buffer.
C $33EF,1 `Y`=$06.
C $33F0,4 Copy the contents of #A$A7 into byte $66 of the character's buffer.
C $33F4,1 `Y`=$07.
C $33F5,4 Copy the contents of #A$A8 into byte $67 of the character's buffer.
C $33F9,1 `Y`=$08.
C $33FA,4 Copy the contents of #A$A9 into byte $68 of the character's buffer.
C $33FE,1 `Y`=$09.
C $33FF,9 Collect the interruptible subcommand routine address from #A$AA and place it into bytes $69 and $6A of the character's buffer.
C $3408,1 `Y`=$0B.
C $3409,4 Copy the contents of #A$AC into byte $6B of the character's buffer.
C $340D,1 `Y`=$0C.
C $340E,4 Copy the contents of #A$AD into byte $6C of the character's buffer.
C $3412,1 `Y`=$0D.
C $3413,4 Copy the contents of #A$AE into byte $6D of the character's buffer.
C $3417,1 `Y`=$0E.
C $3418,4 Copy the contents of #A$AF into byte $6E of the character's buffer.
C $341C,1 `Y`=$0F.
C $341D,9 Collect the uninterruptible subcommand routine address from #A$B0 and place it into bytes $6F and $70 of the character's buffer.
C $3426,1 `Y`=$11.
C $3427,4 Copy the contents of #A$B2 into byte $71 of the character's buffer.
C $342B,1 `Y`=$12.
C $342C,4 Copy the contents of #A$B3 into byte $72 of the character's buffer.
C $3430,1 `Y`=$13.
C $3431,4 Copy the contents of #A$B4 into byte $73 of the character's buffer.
C $3435,1 `Y`=$14.
C $3436,4 Copy the contents of #A$B5 into byte $74 of the character's buffer.
C $343A,1 `Y`=$15.
C $343B,9 Collect the address reached in the character's command list from #A$3B and place it into bytes $75 and $76 of the character's buffer.
C $3444,1 `Y`=$17.
C $3445,9 Collect the start address of the character's command list from #A$3D and place it into bytes $77 and $78 of the character's buffer.
C $344E,1 `Y`=$19.
C $344F,4 Copy the contents of #A$FF into byte $79 of the character's buffer.
C $3453,1 `Y`=$1A.
C $3454,4 Copy the contents of #A$3F into byte $7A of the character's buffer.
C $3458,1 `Y`=$1B.
C $3459,9 Collect the continual subcommand routine address from #A$39 and place it into bytes $7B and $7C of the character's buffer.
C $3462,1 `Y`=$1D.
C $3463,4 Copy the contents of #A$4E (i.e. $60) into the unused byte $7D of the character's buffer.
C $3467,1 `Y`=$1E.
C $3468,4 Copy the contents of #A$4E (i.e. $60) into the unused byte $7E of the character's buffer.
C $346C,1 `Y`=$1F.
C $346D,4 Copy the contents of #A$4E (i.e. $60) into the unused byte $7F of the character's buffer.
u $3472 Code remnants
D $3472 This routine is not used.
C $3472,2 Pick up ERIC's status flags from #A$2B.
C $3474,2 Is ERIC sitting or lying on the floor?
C $3476,2 Branch if so.
C $3478,2 Clear ERIC's midstride indicator at #A$4B.
C $347A,4 Initialise the knockout counter at #A$0F to $14.
C $347E,3 Update the SRB for ERIC's current animatory state and location.
C $3481,5 Set voice #3 attack length to 8ms and decay length to 1.5s.
C $3486,5 Set voice #3 control register: voice on, attack-decay-sustain cycle; noise enabled.
C $348B,2 Pick up ERIC's animatory state from #A$26.
C $348D,2 Is ERIC sitting on a chair?
C $348F,2 Branch if not.
C $3491,2 Set ERIC's animatory state to $06 (sitting on the floor).
C $3493,3 Update the SRB for ERIC's new animatory state.
C $3496,3 Return.
C $3499,2 Pick up ERIC's animatory state from #A$26.
C $349B,2 Keep only the direction bit (bit 7).
C $349D,5 Set ERIC's animatory state to #AS$07($07 or $87) (lying on the floor).
C $34A2,3 Update the SRB for ERIC's new animatory state.
C $34A5,3 Return.
N $34A8 ERIC is sitting or lying on the floor.
C $34A8,2 Decrement the knockout counter at #A$0F.
C $34AA,2 Return unless it's zero.
C $34AC,4 Clear ERIC's status flags at #A$2B.
C $34B0,4 Set ERIC's posture indicator at #A$14 to $FF: ERIC is standing up now.
C $34B4,1
c $34B5 'A' pressed - down
D $34B5 #ZX$657F
D $34B5 Used by the routines at #A$0800, #A$3558 and #A$359E.
C $34B5,2 Pick up ERIC's animatory state from #A$26.
C $34B7,2 Is bit 2 set, indicating that ERIC is sitting or lying down?
C $34B9,2 Return if so.
C $34BB,3 Is ERIC on a staircase?
C $34BE,2 Branch if not.
C $34C0,2 Pick up ERIC's x-coordinate from #A$FC.
C $34C2,2 Is ERIC on a staircase on the right side of the skool?
C $34C4,2 Branch if so.
C $34C6,2 Pick up ERIC's animatory state from #A$26.
C $34C8,1 Is ERIC facing right?
C $34C9,2 Branch if so.
C $34CB,3 Otherwise turn ERIC round to make him face right.
C $34CE,2 Pick up ERIC's animatory state from #A$26.
C $34D0,1 Is ERIC facing left?
C $34D1,2 Branch if so.
C $34D3,3 Otherwise turn ERIC round to make him face left.
C $34D6,2 Pick up ERIC's y-coordinate from #A$FB.
C $34D8,2 Is ERIC on the bottom floor?
C $34DA,2 Branch if so.
C $34DC,2 Pick up ERIC's animatory state from #A$26.
C $34DE,1 Is ERIC facing right?
C $34DF,2 Branch if so.
C $34E1,2 Pick up ERIC's x-coordinate from #A$FC.
C $34E3,2 Is ERIC at the top of a staircase on the right side of the skool?
C $34E5,2 Branch if so.
C $34E7,3 Otherwise move ERIC left.
C $34EA,2 Pick up ERIC's x-coordinate from #A$FC.
C $34EC,2 Is ERIC at the top of a staircase on the left side of the skool?
C $34EE,2 Branch if so.
C $34F0,3 Otherwise move ERIC right.
C $34F3,4 Store 1 at #A$11. This is ERIC's post-midstride y-coordinate increment: down one step.
C $34F7,4 Store 0 at #A$10. This is ERIC's midstride y-coordinate increment for his next movement.
C $34FB,3 Move ERIC midstride.
N $34FE This entry point is used by the routine at #A$350B.
C $34FE,2 Pick up ERIC's animatory state from #A$26.
C $3500,1 Is ERIC facing right?
C $3501,2 Branch if so.
C $3503,3 Otherwise move ERIC left.
C $3506,3 Move ERIC right.
u $350A Unused
B $350A,1,1
c $350B 'Q' pressed - up
D $350B #ZX$65E4
D $350B Used by the routines at #A$0800, #A$3558 and #A$359E.
C $350B,2 Pick up ERIC's animatory state from #A$26.
C $350D,2 Is bit 2 set, indicating that ERIC is sitting or lying down?
C $350F,2 Return if so.
C $3511,3 Is ERIC on a staircase?
C $3514,2 Branch if not.
C $3516,2 Pick up ERIC's x-coordinate from #A$FC.
C $3518,2 Is ERIC on a staircase on the right side of the skool?
C $351A,2 Branch if so.
C $351C,2 Pick up ERIC's animatory state from #A$26.
C $351E,1 Is ERIC facing left?
C $351F,2 Branch if so.
C $3521,3 Otherwise turn ERIC round to make him face left.
C $3524,2 Pick up ERIC's animatory state from #A$26.
C $3526,1 Is ERIC facing right?
C $3527,2 Branch if so.
C $3529,3 Otherwise turn ERIC round to make him face right.
C $352C,2 Pick up ERIC's y-coordinate from #A$FB.
C $352E,2 Is ERIC on the top floor?
C $3530,2 Branch if so.
C $3532,2 Pick up ERIC's animatory state from #A$26.
C $3534,1 Is ERIC facing right?
C $3535,2 Branch if so.
C $3537,2 Pick up ERIC's x-coordinate from #A$FC.
C $3539,2 Is ERIC at the bottom of a staircase on the left side of the skool?
C $353B,2 Branch if so.
C $353D,3 Otherwise move ERIC left.
C $3540,2 Pick up ERIC's x-coordinate from #A$FC.
C $3542,2 Is ERIC at the bottom of a staircase on the right side of the skool?
C $3544,2 Branch if so.
C $3546,3 Otherwise move ERIC right.
C $3549,4 Store 0 at #A$11. This is ERIC's post-midstride y-coordinate increment.
C $354D,4 Store -1 at #A$10. This is ERIC's midstride y-coordinate increment for his next movement: up one step.
C $3551,3 Move ERIC midstride.
C $3554,3 Move ERIC forward in the direction he's facing.
c $3558 'O' pressed - left
D $3558 #ZX$6652
D $3558 Used by the routines at #A$0800, #A$34B5 and #A$350B.
C $3558,2 Pick up ERIC's animatory state from #A$26.
C $355A,2 Is bit 2 set, indicating that ERIC is sitting or lying down?
C $355C,2 Return if so.
C $355E,2 Pick up ERIC's animatory state from #A$26.
C $3560,1 Is ERIC facing left?
C $3561,2 Branch if so.
C $3563,3 Otherwise turn ERIC round to make him face left.
C $3566,3 Is ERIC on a staircase?
C $3569,2 Branch if not.
C $356B,2 Pick up ERIC's x-coordinate from #A$FC.
C $356D,2 Is ERIC on a staircase on the right side of the skool?
C $356F,2 Branch if so.
C $3571,3 Move ERIC up a step.
C $3574,3 Move ERIC down a step.
C $3577,2 Pick up ERIC's x-coordinate from #A$FC.
C $3579,2 Return if it's 0 (ERIC can't go any further left).
C $357B,2 Pick up ERIC's location indicator from #A$12.
C $357D,2 Is ERIC on the top floor?
C $357F,2 Branch if not.
C $3581,2 Pick up ERIC's x-coordinate from #A$FC.
C $3583,2 Is ERIC next to the Map Room wall?
C $3585,2 Return if so (ERIC can't walk through walls).
C $3587,3 Jump forward.
C $358A,2 Is ERIC on the middle floor?
C $358C,2 Branch if not.
C $358E,2 Pick up ERIC's x-coordinate from #A$FC.
C $3590,2 Is ERIC next to the Exam Room wall?
C $3592,2 Return if so (ERIC can't walk through walls).
N $3594 This entry point is used by the routine at #A$359E.
C $3594,6 Set ERIC's midstride and post-midstride y-coordinate increments at #A$10 and #A$11 to 0: ERIC will not move up or down.
C $359A,3 Move ERIC midstride.
c $359E 'P' pressed - right
D $359E #ZX$66AA
D $359E Used by the routines at #A$0800, #A$34B5 and #A$350B.
C $359E,2 Pick up ERIC's animatory state from #A$26.
C $35A0,2 Is bit 2 set, indicating that ERIC is sitting or lying down?
C $35A2,2 Return if so.
C $35A4,2 Pick up ERIC's animatory state from #A$26.
C $35A6,1 Is ERIC facing right?
C $35A7,2 Branch if so.
C $35A9,3 Otherwise turn ERIC round.
C $35AC,3 Is ERIC on a staircase?
C $35AF,2 Branch if not.
C $35B1,2 Pick up ERIC's x-coordinate from #A$FC.
C $35B3,2 Is ERIC on a staircase on the right side of the skool?
C $35B5,2 Branch if so.
C $35B7,3 Move ERIC down a step.
C $35BA,3 Move ERIC up a step.
C $35BD,2 Pick up ERIC's location indicator from #A$12.
C $35BF,2 Is ERIC on the top floor?
C $35C1,2 Branch if not.
C $35C3,2 Pick up ERIC's x-coordinate from #A$FC.
C $35C5,2 Is ERIC next to the Reading Room wall?
C $35C7,2 Return if so (ERIC can't walk through walls).
C $35C9,2 Is ERIC at the far right of the skool?
C $35CB,2 Return if so (ERIC can't go any further right).
C $35CD,3 Otherwise move ERIC midstride.
C $35D0,2 Is ERIC on the middle floor?
C $35D2,2 Branch if not.
C $35D4,2 Pick up ERIC's x-coordinate from #A$FC.
C $35D6,2 Is ERIC next to the White Room wall?
C $35D8,2 Return if so (ERIC can't walk through walls).
C $35DA,2 Is ERIC next to wall outside the Exam Room door?
C $35DC,2 Return if so (ERIC can't walk through walls).
C $35DE,3 Otherwise move ERIC midstride.
C $35E1,2 Is ERIC on the bottom floor?
C $35E3,2 Branch if not.
C $35E5,2 Pick up ERIC's x-coordinate from #A$FC.
C $35E7,2 Is ERIC at the far right of the skool?
C $35E9,2 Return if so (ERIC can't go any further right).
C $35EB,3 Move ERIC midstride.
c $35EF Move ERIC from the midstride position
D $35EF Called from the main loop at #A$0800.
C $35EF,3 Update the SRB for ERIC's current animatory state and location.
C $35F2,2 Pick up ERIC's animatory state from #A$26.
C $35F4,1 Is ERIC facing left?
C $35F5,2 Branch if so.
C $35F7,2 Increment ERIC's x-coordinate.
C $35F9,3 Jump forward.
C $35FC,2 Decrement ERIC's x-coordinate.
C $35FE,7 Adjust ERIC's y-coordinate (by the increment previously stored at #A$11) if he's going down a staircase.
C $3605,2 Pick up ERIC's new x-coordinate from #A$FC.
C $3607,5 Store 0 or 2 at #A$57, according as ERIC's new x-coordinate is even or odd.
C $360C,9 Update ERIC's animatory state to the appropriate walking phase depending on his new x-coordinate.
C $3615,3 Update the SRB for ERIC's new animatory state and location.
C $3618,3 Restore ERIC's character buffer from page 0.
C $361B,3 Update the display.
C $361E,5 Set voice #3 attack length to 2ms and decay length to 24ms.
C $3623,5 Set voice #3 control register: voice on, attack-decay-sustain cycle; noise enabled.
C $3628,2 Pick up ERIC's x-coordinate.
C $362A,3 Subtract the x-coordinate of the leftmost column of the skool on screen.
C $362D,2 Is ERIC 7 character cells from the left of the screen?
C $362F,2 Branch if not.
C $3631,2 Pick up the x-coordinate of the leftmost column of the skool on screen.
C $3633,2 Return if it's 0 (the play area window will not shift).
C $3635,3 Shift the play area window left.
C $3638,3 Return.
C $363B,2 Pick up ERIC's x-coordinate.
C $363D,3 Subtract the x-coordinate of the leftmost column of the skool on screen.
C $3640,2 Is ERIC 31 character cells from the left of the screen?
C $3642,2 Return if not (the play area window will not shift).
C $3644,2 Pick up the x-coordinate of the leftmost column of the skool off screen.
C $3646,2 Is it 96?
C $3648,2 Branch if so (the play area window will not shift).
C $364A,3 Shift the play area window right.
c $364E Turn ERIC round
D $364E #ZX$656A
D $364E Used by the routines at #A$34B5, #A$350B, #A$3558 and #A$359E.
C $364E,3 Update the SRB for ERIC's current animatory state and location.
C $3651,6 Flip bit 7 of ERIC's animatory state at #A$26, thus turning him round.
C $3657,4 Store the value 5 at #A$13, where it will remain unused.
c $365C Move ERIC midstride
D $365C Used by the routines at #A$34B5, #A$350B and #A$3558.
C $365C,3 Update the SRB for ERIC's current animatory state and location.
C $365F,7 Adjust ERIC's y-coordinate at #A$FB (by the increment previously stored at #A$10) if he's going up a staircase.
C $3666,2 Increment ERIC's animatory state.
C $3668,3 Update the SRB for ERIC's new animatory state and location.
C $366B,2 Pick up the keyboard/joystick reading from #A$C5.
C $366D,2 Is it a joystick left/right/up/down reading?
C $366F,2 Branch if so.
C $3671,2 `A`=6 (slow).
C $3673,3 Jump forward.
C $3676,2 `A`=2 (fast).
C $3678,2 Initialise ERIC's midstride timer at #A$E5 to 2 (fast) or 6 (slow).
C $367A,2 Set ERIC's midstride indicator at #A$4B to a non-zero value.
C $367C,5 Set voice #3 attack length to 2ms and decay length to 24ms.
C $3681,5 Set voice #3 control register: voice on, attack-decay-sustain cycle; noise enabled.
c $3687 'S' pressed - sit/stand
D $3687 #ZX$6CAF
D $3687 Called from the main loop at #A$0800.
C $3687,5 Set voice #3 attack length to 8ms and decay length to 1.5s.
C $368C,5 Set voice #3 control register: voice on, attack-decay-sustain cycle; noise enabled.
C $3691,6 Flip the bits in ERIC's posture indicator at #A$14.
C $3697,2 Branch if ERIC is standing up now.
C $3699,3 Update the SRB for ERIC's current animatory state and location.
C $369C,3 Is ERIC on a staircase?
C $369F,2 Branch if not.
C $36A1,2 Pick up ERIC's x-coordinate from #A$FC.
C $36A3,2 Is ERIC on s staircase on the right side of the skool?
C $36A5,2 Branch if so.
C $36A7,2 #AS$05($85) is the animatory state of ERIC sitting (as on a staircase) facing right.
C $36A9,3 Jump forward.
C $36AC,2 #AS$05($05) is the animatory state of ERIC sitting (as on a staircase) facing left.
C $36AE,2 Update ERIC's animatory state at #A$26.
C $36B0,3 Update the SRB for ERIC's new animatory state.
C $36B3,3 Return.
C $36B6,2 Pick up ERIC's location indicator from #A$12.
C $36B8,2 Branch if ERIC's on the bottom floor.
C $36BA,2 Pick up ERIC's animatory state from #A$26.
C $36BC,1 Is ERIC facing right?
C $36BD,2 Branch if so.
C $36BF,3 Is ERIC beside a chair?
C $36C2,2 Branch if not.
C $36C4,3 Sit ERIC in the chair, knocking any current occupant to the floor.
C $36C7,9 Set ERIC's animatory state at #A$26 to #AS$06($06/$86) to make him sit on the floor.
C $36D0,3 Update the SRB for ERIC's new animatory state.
C $36D3,3 Return.
C $36D6,3 Update the SRB for ERIC's current animatory state and location.
C $36D9,6 Set ERIC's animatory state at #A$26 to #AS$00($00/$80) to make him stand up.
C $36DF,3 Update the SRB for ERIC's new animatory state.
c $36E3 Update the SRB for a single character cell
D $36E3 Used by the routines at #A$11CF, #A$16E9 and #A$322E.
R $36E3 /(#A$49)/ x-coordinate
R $36E3 /(#A$4A)/ y-coordinate
C $36E3,8 Prepare to address the screen refresh buffer (SRB) at #A$4008.
C $36EB,14 Calculate the index of the SRB byte that corresponds to the leftmost segment of 8 character cells in the row at the given y-coordinate and store it at #A$55.
C $36F9,7 Pick up the x-coordinate from #A$49, divide by 8 and store the result at #A$56. This will be added to the index at #A$55 later to get the index of the target SRB byte.
C $3700,5 Store the multiple of 8 closest to but not greater than the x-coordinate at #A$54.
C $3705,6 Compute the remainder when the x-coordinate is divided by 8 and transfer it to `Y`. This indicates the bit of the SRB byte that needs to be set.
C $370B,10 Set the bit in `A` that needs to be set in the SRB byte.
C $3715,2 Store `A` (with the appropriate bit set) at #A$54.
C $3717,6 Compute the index of the SRB byte that needs updating and transfer it to `Y`.
C $371D,6 Set the appropriate bit in the SRB byte.
c $3724 Set up sprites #1-#5
D $3724 Used by the routine at #A$2043.
R $3724 /(#A$9B)/ Bits 0-7 of the base x-coordinate
R $3724 /(#A$9C)/ The sprites' y-coordinate
C $3724,5 Add 52 to the y-coordinate.
C $3729,15 Set the y-coordinates of sprites #1-#5.
C $3738,3 Pick up bit 8 of the sprites' x-coordinates.
C $373B,2 Branch unless they're all zero.
C $373D,5 Reset bit 8 of every sprite's x-coordinate.
C $3742,8 Set the x-coordinates of sprites #1 and #4 (bits 0-7).
C $374A,3 Add 16 to the base x-coordinate.
C $374D,3 Set the x-coordinate of sprite #5 (bits 0-7).
C $3750,2 Branch unless the x-coordinate is greater than 255.
C $3752,8 Set bit 8 of the x-coordinates of sprites #2, #3 and #5.
C $375A,6 Pick up bits 0-7 of the x-coordinate of sprite #5 and add 8.
C $3760,3 Set the x-coordinate of sprite #2 (bits 0-7).
C $3763,2 Branch unless this x-coordinate is greater than 255.
C $3765,8 Set bit 8 of the x-coordinates of sprites #2 and #3.
C $376D,6 Pick up the x-coordinate of sprite #2 (bits 0-7) and add 24.
C $3773,3 Set the x-coordinate of sprite #3 (bits 0-7).
C $3776,2 Branch unless this x-coordinate is greater than 255.
C $3778,8 Set bit 8 of the x-coordinate of sprite #3.
C $3780,5 Stretch sprites #4 and #5 to double width.
C $3785,5 Set the pointer for sprite #1 to $2B. This points at $CAC0.
C $378A,5 Set the pointer for sprite #2 to $2C. This points at $CB00.
C $378F,5 Set the pointer for sprite #3 to $2D. This points at $CB40.
C $3794,5 Set the pointer for sprite #4 to $2E. This points at $CB80.
C $3799,5 Set the pointer for sprite #5 to $2F. This points at $CBC0.
c $379F Prepare sprites #0-#6 for the speech bubble with the lip on the left
D $379F Used by the routine at #A$2387.
R $379F A Screen pixel x-coordinate of the lip section
C $379F,6 Set the x-coordinates of sprites #2 and #4 (bits 0-7).
C $37A5,3 Add 8 to this x-coordinate.
C $37A8,6 Make this the x-coordinate of sprites #0 and #6 (bits 0-7).
C $37AE,2 Branch unless the x-coordinate is greater than 255.
C $37B0,8 Set bit 8 of the x-coordinates of sprites #0, #1, #3, #5 and #6.
C $37B8,3 Pick up the x-coordinate of sprite #0 (bits 0-7).
C $37BB,3 Add 24 to this x-coordinate.
C $37BE,3 Make this the x-coordinate of sprite #1 (bits 0-7).
C $37C1,2 Branch unless the x-coordinate is greater than 255.
C $37C3,8 Set bit 8 of the x-coordinates of sprites #1, #3 and #5.
C $37CB,3 Pick up the x-coordinate of sprite #1 (bits 0-7).
C $37CE,3 Add 24 to this x-coordinate.
C $37D1,6 Make this the x-coordinate of sprites #3 and #5 (bits 0-7).
C $37D7,2 Branch unless the x-coordinate is greater than 255.
C $37D9,8 Set bit 8 of the x-coordinates of sprites #3 and #5.
C $37E1,5 Set the pointer for sprite #0 to $29. This points at $CA40 (the first middle outline section of the speech bubble, copied from #A$3E40).
C $37E6,5 Set the pointer for sprite #1 to $2A. This points at $CA80 (the second middle outline section of the speech bubble, copied from #A$3E80).
C $37EB,5 Set the pointer for sprite #2 to $23. This points at $C8C0 (the left-hand lip outline section of the speech bubble, copied from #A$3CC0).
C $37F0,5 Set the pointer for sprite #3 to $25. This points at $C940 (the rightmost outline section of the speech bubble, copied from #A$3D40).
C $37F5,5 Set the pointer for sprite #4 to $22. This points at $C880 (the filled in left-hand lip section of the speech bubble, copied from #A$3C80).
C $37FA,5 Set the pointer for sprite #5 to $24. This points at $C900 (the filled in rightmost section of the speech bubble, copied from #A$3D00).
C $37FF,5 Set the pointer for sprite #6 to $28. This points at $CA00 (the filled in middle section of the speech bubble, copied from #A$3E00).
c $3805 Prepare sprites #0-#6 for the speech bubble with the lip on the right
D $3805 Used by the routine at #A$2387.
R $3805 A Screen pixel x-coordinate of the lip section
C $3805,6 Set the x-coordinates of sprites #3 and #5 (bits 0-7).
C $380B,3 Subtract 56 from this x-coordinate.
C $380E,6 Make this the x-coordinate of sprites #2 and #4 (bits 0-7).
C $3814,2 Branch unless the x-coordinate is greater than 255.
C $3816,5 Set bit 8 of the x-coordinates of sprites #0-#7.
C $381B,3 Pick up the x-coordinate of sprite #2.
C $381E,3 Add 8 to this x-coordinate.
C $3821,6 Make this the x-coordinate of sprites #0 and #6 (bits 0-7).
C $3827,2 Branch unless the x-coordinate is greater than 255.
C $3829,8 Set bit 8 of the x-coordinates of sprites #0, #1 and #6.
C $3831,3 Pick up the x-coordinate of sprite #6 (bits 0-7).
C $3834,3 Add 24 to this x-coordinate.
C $3837,3 Make this the x-coordinate of sprite #1 (bits 0-7).
C $383A,2 Branch unless the x-coordinate is greater than 255.
C $383C,8 Set bit 8 of the x-coordinate of sprite #1.
C $3844,5 Set the pointer for sprite #0 to $29. This points at $CA40 (the first middle outline section of the speech bubble, copied from #A$3E40).
C $3849,5 Set the pointer for sprite #1 to $2A. This points at $CA80 (the second middle outline section of the speech bubble, copied from #A$3E80).
C $384E,5 Set the pointer for sprite #2 to $21. This points at $C840 (the leftmost outline section of the speech bubble, copied from #A$3C40).
C $3853,5 Set the pointer for sprite #3 to $27. This points at $C9C0 (the right-hand lip outline section of the speech bubble, copied from #A$3DC0).
C $3858,5 Set the pointer for sprite #4 to $20. This points at $C800 (the filled in leftmost section of the speech bubble, copied from #R$3C00#$3C00($3C00)).
C $385D,5 Set the pointer for sprite #5 to $26. This points at $C980 (the filled in right-hand lip section of the speech bubble, copied from #A$3D80).
C $3862,5 Set the pointer for sprite #6 to $28. This points at $CA00 (the filled in middle section of the speech bubble, copied from #A$3E00).
c $3868 Copy the text graphic buffer to the screen
D $3868 Used by the routines at #A$2573, #A$2BB0 and #A$BE09.
R $3868 X Character cell x-coordinate (0-39)
R $3868 Y Character cell y-coordinate (0-24)
R $3868 /(#A$31)/ Number of bytes to copy (64 or 128)
C $3868,8 Prepare to address the screen bitmap at $E000.
C $3870,39 Adjust the screen bitmap address at #A$4E to correspond to the given coordinates in `X` and `Y`.
C $3897,8 Prepare to address the text graphic buffer at #A$4500.
C $389F,12 Copy the specified portion of the text graphic buffer to the screen.
c $38AC Back up sprite information
D $38AC Used by the routines at #A$1DB7 and #A$298B.
C $38AC,25 Copy sprite coordinates from $D000-$D010 to #R$B900($B900-$B910).
C $38C5,6 Copy the sprite enable register from $D015 to $B915.
C $38CB,6 Copy the sprite double width register from $D01D to $B91D.
C $38D1,11 Copy the sprite colours from $D027-$D02E to $B927-$B92E.
C $38DC,5 Disable all sprites.
C $38E1,13 Copy the sprite pointers from $CFF8-$CFFF to $B930-$B937.
c $38EF Restore sprite information
D $38EF Used by the routines at #A$1DB7 and #A$298B.
C $38EF,25 Restore sprite coordinates from #R$B900($B900-$B910) to $D000-$D010.
C $3908,6 Restore the sprite enable register from $B915 to $D015.
C $390E,6 Restore the sprite double width register from $B91D to $D01D.
C $3914,11 Restore the sprite colours from $B927-$B92E to $D027-$D02E.
C $391F,13 Restore the sprite pointers from $B390-$B397 to $CFF8-$CFFF.
c $392D Clear all the signal flags
D $392D Used by the routine at #A$3AD5.
C $392D,8 Prepare to address the signal flags table at #A$4400.
C $3935,10 Clear the flag for every signal in the table.
c $3940 Read the keyboard
D $3940 Used by the interrupt routine at #A$39C7. #HTML(This is a modified version of the keyboard reading routine at <a href="https://skoolkid.github.io/sk6502/c64rom/asm/EA87.html">$EA87</a> in the C64 ROM.)
C $3940,2 Pick up the keyboard delay counter from #A$EB.
C $3942,2 Branch if it's zero (time to read the keyboard).
C $3944,2 Is the keyboard delay counter less than $10?
C $3946,2 Branch if so.
C $3948,4 Reset the keyboard delay counter at #A$EB to $10.
C $394C,2 Decrement the keyboard delay counter at #A$EB.
C $394E,3 Return.
C $3951,4 Initialise the modifier key flag at #A$CA.
C $3955,4 Initialise the keyboard indicator at #A$CB to no key.
C $3959,1 Initialise the key index in `Y` to 0.
C $395A,3 Prepare to read the entire keyboard.
C $395D,3 Pick up a keyboard reading.
C $3960,2 Was any key pressed?
C $3962,2 Return if not.
C $3964,8 Prepare to address the standard keyboard table at #A$5F00.
C $396C,5 Prepare to read keyboard matrix column 0.
C $3971,2 `X` will count the keyboard rows.
C $3973,1 Save the keyboard column bit mask temporarily.
C $3974,3 Pick up a keyboard/joystick reading.
C $3977,3 Compare it with itself.
C $397A,2 Branch back to get another reading while it's changing.
C $397C,1 Shift a bit of the keyboard reading into the carry flag.
C $397D,2 Branch if there was no keypress in this row.
C $397F,1 Save the remainder of the keyboard reading temporarily.
C $3980,2 Pick up a character code from the keyboard table at #A$5F00.
C $3982,2 Is a control key being pressed?
C $3984,2 Branch if not.
C $3986,2 Is the STOP key being pressed?
C $3988,2 Branch if so.
C $398A,4 Update the modifier key flag at #A$CA: SHIFT, CTRL or the CBM key is being pressed.
C $398E,2 Skip over the next instruction.
C $3990,2 Store the key index at #A$CB.
C $3992,1 Restore the remainder of the keyboard reading to `A`.
C $3993,1 Increment the key index.
C $3994,2 Have we read every key yet?
C $3996,2 Branch if so.
C $3998,1 Decrement the keyboard row counter.
C $3999,2 Branch back to check the next row.
C $399B,1 Set the carry flag to ensure that a set bit is rotated into bit 0 of the mask in `A`.
C $399C,1 Restore the keyboard column bit mask to `A`.
C $399D,4 Prepare to read the next keyboard matrix column.
C $39A1,2 Branch back to get a reading.
C $39A3,1 Drop the keyboard column bit mask from the stack.
C $39A4,2 Pick up the modifier key flag from #A$CA.
C $39A6,2 Were the SHIFT and CBM keys being pressed?
C $39A8,2 Branch if so to use the standard keyboard table.
C $39AA,1 Shift the modifier key flag left.
C $39AB,2 Was CTRL being pressed?
C $39AD,2 Branch if not.
C $39AF,2 Select the CTRL keyboard table.
C $39B1,11 Collect the appropriate keyboard table address from #A$4438 and store it at #A$CE.
C $39BC,4 Pick up an entry from one of the four keyboard tables at #A$5F00.
C $39C0,2 Set the keyboard reading at #A$4C.
C $39C2,4 Reset the keyboard delay counter at #A$EB to $0F.
c $39C7 Interrupt routine
D $39C7 The address of this routine is placed at $FFFE by the routines at #A$2CD9, #A$BA00 and #A$BA48.
C $39C7,1 Push `A` onto the stack.
C $39C8,2 Push `X` onto the stack.
C $39CA,2 Push `Y` onto the stack.
N $39CC This entry point is used by the routine at #A$BAB4.
C $39CC,2 Increment the interrupt counter at #A$82.
C $39CE,2 Decrement the timing counter at #A$2E.
C $39D0,2 Decrement the shield/safe timing counter at #A$C9.
C $39D2,2 Branch if it's time to adjust the colours of the safe or any shields.
C $39D4,3 Otherwise jump forward.
C $39D7,4 Reset the shield/safe timing counter at #A$C9 to $19.
C $39DB,10 Prepare to read 15 entries from the shield locations and status table at #A$58E0.
C $39E5,2 Initialise the index.
C $39E7,9 Pick up a shield's coordinates and copy them to #A$EF and #A$F0.
C $39F0,3 Pick up the shield's status byte.
C $39F3,2 Branch if it's zero (the shield is not flashing).
C $39F5,2 Pick up the shield's x-coordinate.
C $39F7,2 Is the shield off screen to the left?
C $39F9,2 Branch if so.
C $39FB,2 Is the shield off screen to the right?
C $39FD,2 Branch if so.
C $39FF,2 Store the shield table index at #A$F4 temporarily.
C $3A01,8 Store $CC00 (the base address of the colour information) at #A$F2.
C $3A09,2 Pick up the shield's y-coordinate.
C $3A0B,2 Branch if the y-coordinate is 0 (this never happens).
C $3A0D,14 Adjust the colour information address stored at #A$F2 to the beginning of the row corresponding to the shield's y-coordinate.
C $3A1B,2 Pick up the shield's x-coordinate.
C $3A1D,3 Update the colour information for this flashing shield.
C $3A20,2 Restore the shield table index from #A$F4.
C $3A22,1 Point at the next entry in the shield table.
C $3A23,1 Have we checked every entry yet?
C $3A24,2 Branch back if not.
C $3A26,2 Pick up the safe status indicator from #A$D5.
C $3A28,2 Branch unless the safe is flashing.
C $3A2A,2 10 is the x-coordinate of the safe.
C $3A2C,2 Is the safe off screen to the left?
C $3A2E,2 Branch if so.
C $3A30,2 Is the safe off screen to the right?
C $3A32,2 Branch if so.
C $3A34,8 Store $CD68 at #A$F2. This colour information address corresponds to the beginning of the row where the safe is.
C $3A3C,2 10 is the x-coordinate of the safe.
C $3A3E,3 Update the colour information for the safe.
C $3A41,3 Acknowledge the interrupt.
C $3A44,3 Read the keyboard and store the result at #A$4C.
C $3A47,2 Was a key pressed?
C $3A49,2 Branch if so.
C $3A4B,5 Prepare to read from data port A.
C $3A50,3 Read from data port A.
C $3A53,2 Flip every bit.
C $3A55,1 Save the result temporarily.
C $3A56,2 Keep only bit 4 (joystick fire button).
C $3A58,2 Branch if the fire button was pressed.
C $3A5A,1 Restore the joystick read result to `A`.
C $3A5B,1 Was the joystick moved up?
C $3A5C,2 Branch if not.
C $3A5E,2 Signal: joystick was moved up ('Q' with bit 7 set).
C $3A60,3 Jump forward.
C $3A63,1 Was the joystick moved down?
C $3A64,2 Branch if not.
C $3A66,2 Signal: joystick was moved down ('A' with bit 7 set).
C $3A68,3 Jump forward.
C $3A6B,1 Was the joystick moved left?
C $3A6C,2 Branch if not.
C $3A6E,2 Signal: joystick was moved left ('O' with bit 7 set).
C $3A70,3 Jump forward.
C $3A73,1 Was the joystick moved right?
C $3A74,2 Branch if not.
C $3A76,2 Signal: joystick was moved right ('P' with bit 7 set).
C $3A78,3 Jump forward.
C $3A7B,1 Restore the joystick read result to `A`.
C $3A7C,2 Signal: joystick fire button was pressed ('F').
C $3A7E,3 Jump forward.
C $3A81,2 Signal: joystick was not moved.
C $3A83,2 Store the result of the joystick read at #A$4C.
C $3A85,5 Set all bits in the port A data direction register: every bit of port A can be read and written.
C $3A8A,2 Restore `Y` from the stack.
C $3A8C,2 Restore `X` from the stack.
C $3A8E,1 Restore `A` from the stack.
c $3A90 Update colour information for the safe or a flashing shield
D $3A90 Used by the interrupt routine at #A$39C7.
R $3A90 A Play area x-coordinate
R $3A90 /(#R$F2($F2,$F3))/ Base colour information address for the object's row
C $3A90,3 Subtract the x-coordinate of the leftmost column of the skool on screen to obtain the object's screen x-coordinate.
C $3A93,9 Add this screen x-coordinate to the base colour information address at #A$F2.
C $3A9C,2 Set the index in `Y` to 0.
C $3A9E,2 Initialise #A$F5 to 0.
C $3AA0,2 Pick up the current colour information byte for the object.
C $3AA2,12 Copy bits 0-3 of the colour information byte into bits 4-7 at #A$F5.
C $3AAE,2 Copy bits 4-7 of the colour information byte into bits 0-3 at #A$F5. The background and foreground colours have now been swapped.
C $3AB0,2 Update the colour information for the object.
u $3AB3 Unused
B $3AB3,1,1
c $3AB4 Move the next character
D $3AB4 Called from the main loop at #A$0800.
C $3AB4,2 Increment the current character number at #A$60.
C $3AB6,2 Pick up the current character number from #A$60.
C $3AB8,2 Is it $14 (ERIC)?
C $3ABA,2 Branch if not.
C $3ABC,4 Reset the character number at #A$60 to $00 (little boy no. 1).
C $3AC0,3 Jump forward.
C $3AC3,2 Is the current character number $04 (little boy no. 5)?
C $3AC5,2 Branch if not.
C $3AC7,2 Increment the current character number at #A$60 to $05 (little boy no. 6).
C $3AC9,2 Pick up the current character number from #A$60.
C $3ACB,3 Copy the current character's buffer into page 0.
C $3ACE,3 Move the character.
C $3AD1,3 Restore the character's buffer from page 0.
c $3AD5 Change the lesson
D $3AD5 #ZX$66E6
D $3AD5 Called from the main loop at #A$0800.
C $3AD5,4 Reset the MSB of the lesson clock at #A$40 to $0F.
C $3AD9,4 Increment the current lesson number at #A$41 and pick up the new value.
C $3ADD,2 Is it $40?
C $3ADF,2 Branch if not.
C $3AE1,4 Otherwise reset the lesson number to 0.
C $3AE5,8 Prepare to address the main timetable at #A$5D00.
C $3AED,6 Pick up the current lesson identifier ($E0-$FF) from the #R$5D00(main timetable) and store it at #A$42.
C $3AF3,1 Transfer the current lesson identifier to `Y`.
C $3AF4,4 The table of #R$8CE0(lesson descriptors) is in page $8C.
C $3AF8,4 Copy the lesson descriptor for the new lesson to #A$70.
C $3AFC,3 Print the teacher and room name in the lesson box.
C $3AFF,3 Select a special PLAYTIME occasionally.
C $3B02,4 Set the sound effect identifier at #A$2C to 3: the bell is ringing.
C $3B06,4 Initialise the sound effect timer at #A$2D.
C $3B0A,3 Clear all the signal flags.
C $3B0D,2 There are 18 characters (11 little boys, 4 teachers and 3 main kids) to prepare for the new lesson.
C $3B0F,4 Reset the identifier of the next lines reprimand for the teacher fetching the truant ERIC at #A$C8.
C $3B13,2 Reset the birth year question indicator at #A$C2.
C $3B15,2 Set the current character number at #A$60 to $00 (little boy no. 1).
C $3B17,6 Prepare to address the characters' personal timetables, starting with little boy no. 1's at #A$78E0.
N $3B1D Now we enter a loop to update the command list start address for each character.
C $3B1D,2 Save the character counter on the stack.
C $3B1F,3 Copy the current character's buffer to page 0.
C $3B22,2 Pick up the lesson identifier ($E0-$FF) from #A$42.
C $3B24,4 Obtain the command list number from the character's personal timetable and store it at #A$43.
C $3B28,11 Collect the start address of the command list from the table at #A$4480 and store it in the character's buffer at #A$3D.
C $3B33,6 Set bit 7 at #A$3F, triggering a command list restart at the next available opportunity.
C $3B39,3 Restore the current character's buffer from page 0.
C $3B3C,2 Increment the current character number at #A$60.
C $3B3E,2 Next character's personal timetable.
C $3B40,2 Restore the character counter to `X`.
C $3B42,1 Have we dealt with every character yet?
C $3B43,2 Branch back if not.
c $3B46 Select a special PLAYTIME occasionally
D $3B46 #ZX$6E33
D $3B46 Used by the routine at #A$3AD5.
R $3B46 /(#A$42)/ Current lesson identifier
C $3B46,2 Pick up the current lesson identifier from #A$42.
C $3B48,2 Is it less than $F3 (i.e. not a playtime)?
C $3B4A,2 Return if so.
C $3B4C,2 Pick up the game mode indicator from #A$46.
C $3B4E,2 Return if we're in demo mode.
C $3B50,5 Generate a random value between 0 and 7.
C $3B55,2 Is it 3 or more?
C $3B57,2 Return if so.
C $3B59,2 Now `A`=#LINK:LessonF3($F3), #LINK:LessonF4($F4) or #LINK:LessonF5($F5) (one of the 'special' playtimes).
C $3B5B,2 Make this special playtime the actual playtime.
c $3B5E Move the current character
D $3B5E Used by the routine at #A$3AB4.
C $3B5E,2 Pick up the current character number from #A$60.
C $3B60,2 Is it $12 (BOY WONDER's pellet)?
C $3B62,2 Branch if so.
C $3B64,2 Is the current character number $13 (ERIC's pellet)?
C $3B66,2 Branch if so.
C $3B68,2 Decrement the character's movement speed change delay counter at #A$FF.
C $3B6A,2 Branch if it's time to consider a change in movement speed.
C $3B6C,2 Pick up the character's movement speed change delay counter from #A$FF.
C $3B6E,1 Is the new value even?
C $3B6F,2 Branch if so (half the time) to move the character.
C $3B71,2 Pick up the flags byte from #A$3F.
C $3B73,2 Is bit 6 set, meaning the character is running (or otherwise moving quickly)?
C $3B75,2 Branch if so to move the character now.
C $3B77,3 Otherwise return without having moved the character.
N $3B7A It's time to consider a movement speed change for this character.
C $3B7A,7 Generate a random value between 4 and 67.
C $3B81,1 Now 2<=`A`<=33, and the carry flag is set if the random value is odd.
C $3B82,2 Reinitialise the movement speed change delay counter at #A$FF with this value.
C $3B84,2 Branch if the random value is even.
C $3B86,6 Set bit 6 of the flags byte at #A$3F: the character is running (or otherwise moving quickly).
C $3B8C,2 Is bit 2 of the flags byte set, meaning this character is either a teacher, or EINSTEIN speaking?
C $3B8E,2 Branch if not to move the character now.
C $3B90,6 Reset bit 6 of the flags byte at #A$3F: the character is walking (or otherwise moving) at a normal pace.
C $3B96,2 Is bit 1 or bit 3 of the flags byte set (meaning the character is a stampeding boy, MR WACKER looking for the pea-shooter, or EINSTEIN waiting to answer a teacher's question)?
C $3B98,2 Branch if not to move the character now.
C $3B9A,6 Set bit 6 of the flags byte at #A$3F: the character is running (or otherwise moving quickly).
N $3BA0 Now we consider the character's next move. From this point, the following steps are taken:
N $3BA0 #LIST { If there is an uninterruptible subcommand routine address at #A$B0, jump to it. } { Otherwise, if there is a continual subcommand routine address at #A$39, jump to it (and then return to execute the next step below). } { If there is an interruptible subcommand routine address at #A$AA, jump to it. } { Otherwise, restart the command list if bit 7 of the flags byte at #A$3F is set. } { If there is a primary command routine address at #A$29, jump to it. } { Otherwise, collect the next primary command routine address from the command list, place it at #A$29, and jump to it. } LIST#
N $3BA0 The address of one of the following uninterruptible subcommand routines may be present at #A$B0:
N $3BA0 #TABLE(default,centre,:w) { =h Address | =h Description } { #A$0FBA | #D$0FBA } { #A$1042 | #D$1042 } { #A$1CB4 | #D$1CB4 } { #A$1CCB | #D$1CCB } { #A$1CEC | #D$1CEC } { #A$267A | #D$267A } { #A$2696 | #D$2696 } { #A$26E0 | #D$26E0 } { #A$2A43 | #D$2A43 } { #A$2B21 | #D$2B21 } { #A$2B3F | #D$2B3F } { #A$2B52 | #D$2B52 } { #A$2B9F | #D$2B9F } TABLE#
N $3BA0 The address of one of the following continual subcommand routines may be present at #A$39:
N $3BA0 #TABLE(default,centre,:w) { =h Address | =h Description } { #A$26EF | #D$26EF } { #A$270D | #D$270D } { #A$2797 | #D$2797 } { #A$2873 | #D$2873 } { #A$2CA5 | #D$2CA5 } TABLE#
N $3BA0 The address of one of the following interruptible subcommand routines (or an entry point thereof) may be present at #A$AA:
N $3BA0 #TABLE(default,centre,:w) { =h Address | =h Description } { #A$0C3F | #D$0C3F } { #A$1129 | #D$1129 } { #A$136F | #D$136F } { #A$13F3 | #D$13F3 } { #A$16E9 | #D$16E9 } { #A$1F1E | Make a teacher wait for EINSTEIN to finish speaking } { #A$2387 | #D$2387 } TABLE#
N $3BA0 The address of one of the following primary command routines (or an entry point thereof) may be present at #A$29:
N $3BA0 #TABLE(default,centre,:w) { =h Address | =h Description } { #A$09E9 | #D$09E9 } { #A$0A57 | #D$0A57 } { #A$0A58 | #D$0A58 } { #A$0E35 | #D$0E35 } { #A$0EB4 | #D$0EB4 } { #A$0EC2 | #D$0EC2 } { #A$105B | #D$105B } { #A$1A04 | #D$1A04 } { #A$1D16 | #D$1D16 } { #A$1F4D | #D$1F4D } { #A$1FA0 | #D$1FA0 } { #A$2757 | #D$2757 } { #A$277D | #D$277D } { #A$27AB | #D$27AB } { #A$284F | #D$284F } { #A$2865 | #D$2865 } { #A$2885 | #D$2885 } { #A$28AB | #D$28AB } { #A$28BC | #D$28BC } { #A$2A99 | #D$2A99 } { #A$2AF9 | #D$2AF9 } { #A$2B0D | #D$2B0D } TABLE#
C $3BA0,2 Is there an uninterruptible subcommand routine address at #A$B0?
C $3BA2,2 Branch if not.
C $3BA4,3 Otherwise jump to the uninterruptible subcommand routine.
C $3BA7,2 Is there a continual subcommand routine address at #A$39?
C $3BA9,2 Branch if not.
C $3BAB,6 Push $3BB3 onto the stack so that we return to #A$3BB4 below after executing the continual subcommand routine.
C $3BB1,3 Jump to the continual subcommand routine.
C $3BB4,2 Is there an interruptible subcommand routine address at #A$AA?
C $3BB6,2 Branch if not.
C $3BB8,3 Otherwise jump to the interruptible subcommand routine.
C $3BBB,2 Pick up the flags byte from #A$3F.
C $3BBD,1 Is a command list restart required (bit 7 set)?
C $3BBE,2 Branch if not.
C $3BC0,6 Reset bit 7 of the flags byte at #A$3F.
C $3BC6,8 Copy the command list start address from #A$3D to #A$3B. This has the effect of restarting the command list.
C $3BCE,4 Remove the address of any continual subcommand routine from #A$39.
N $3BD2 This entry point is used by the routine at #A$2865.
C $3BD2,10 Collect the address of the primary command routine from the command list and place it into the character's buffer at #A$29.
C $3BDC,3 Jump forward.
C $3BDF,2 Is there a primary command routine address at #A$29?
C $3BE1,2 Branch back if not to collect one from the command list.
C $3BE3,3 Jump to the primary command routine.
c $3BE7 Collect the next byte from a command list
D $3BE7 #ZX$618C
D $3BE7 Used by the routines at #A$12B5, #A$1A04, #A$2757, #A$27AB, #A$284F, #A$2865, #A$28AB, #A$28BC, #A$2AF9, #A$2B0D, #A$3B5E and #A$3BE7. Returns with `A` holding the byte value.
C $3BE7,2 Save `Y` at #A$57 temporarily.
C $3BE9,4 Pick up the next byte from the command list.
C $3BED,6 Increment the address reached in the command list.
C $3BF3,2 Restore `Y` from #A$57.
u $3BF6 Unused
B $3BF6,10,2,8
b $3C00 Initial graphic data for speech bubble sprites
D $3C00 Copied to $C800-$CBFF by the routine at #A$3047.
B $3C00,64,8 #SPRITE(#PC)
B $3C40,64,8 #SPRITE(#PC)
B $3C80,64,8 #SPRITE(#PC)
B $3CC0,64,8 #SPRITE(#PC)
B $3D00,64,8 #SPRITE(#PC)
B $3D40,64,8 #SPRITE(#PC)
B $3D80,64,8 #SPRITE(#PC)
B $3DC0,64,8 #SPRITE(#PC)
B $3E00,64,8 #SPRITE(#PC)
B $3E40,64,8 #SPRITE(#PC)
B $3E80,64,8 #SPRITE(#PC)
B $3EC0,64,8 #SPRITE(#PC)
B $3F00,64,8 #SPRITE(#PC)
B $3F40,64,8 #SPRITE(#PC)
B $3F80,64,8 #SPRITE(#PC)
B $3FC0,64,8 #SPRITE(#PC)
b $4000 Play area tile back buffer
D $4000 #ZX$7F01
D $4000 Used by the routine at #A$3326.
B $4000,8,8
b $4008 Screen refresh buffer (SRB)
D $4008 #ZX$7F0C
D $4008 Used by the routines at #A$31EA and #A$36E3. Each byte of the SRB corresponds to a segment of 8 character cells on the screen, the leftmost of which will be at x=0, x=8, x=16, x=24 or x=32. Each bit set in an SRB byte corresponds to a cell in the segment that needs refreshing. Bit 7 corresponds to the leftmost cell in the segment, bit 0 to the rightmost cell.
B $4008,105,5
u $4071 Unused
B $4071,15,8,7
b $4080 Command list $80: Map Room - teacher
D $4080 #ZX$FB80
D $4080 Used by MR WACKER in lessons #LINK:LessonED($ED) and #LINK:LessonEF($EF); and by MR WITHIT in lessons #LINK:LessonE5($E5), #LINK:LessonE7($E7), #LINK:LessonE8($E8), #LINK:LessonE9($E9), #LINK:LessonEA($EA), #LINK:LessonEB($EB), #LINK:LessonEC($EC), #LINK:LessonEE($EE), #LINK:LessonF0($F0) and #LINK:LessonF2($F2).
W $4080,2,2 Go to...
B $4082,2,2 ...the fire escape.
W $4084,2,2 Go to...
B $4086,2,2 ...the doorway of the Map Room.
W $4088,2,2 Restart the command list unless it's time to start the lesson.
W $408A,2,2 Signal that...
B $408C,1,1 ...the teacher has arrived at the Map Room.
W $408D,2,2 Tell the kids to sit down.
W $408F,2,2 Go to...
B $4091,2,2 ...the chair nearest the map in the Map Room.
W $4093,2,2 Conduct the class (without first turning round to face the class, which is a #BUG#theWallMostStaredAt(bug)).
b $4095 Command list $82: Reading Room - teacher
D $4095 #ZX$FB9A
D $4095 Used by MR WACKER in lessons #LINK:LessonE4($E4), #LINK:LessonE8($E8) and #LINK:LessonEB($EB); by MR ROCKITT in lessons #LINK:LessonE9($E9), #LINK:LessonEF($EF) and #LINK:LessonF0($F0); by MR WITHIT in lesson #LINK:LessonE2($E2); and by MR CREAK in lessons #LINK:LessonE5($E5), #LINK:LessonE6($E6), #LINK:LessonE7($E7), #LINK:LessonEA($EA), #LINK:LessonEC($EC), #LINK:LessonED($ED), #LINK:LessonEE($EE) and #LINK:LessonF2($F2).
W $4095,2,2 Go to...
B $4097,2,2 ...the middle of the Revision Library.
W $4099,2,2 Go to...
B $409B,2,2 ...the doorway of the Reading Room.
W $409D,2,2 Restart the command list unless it's time to start the lesson.
W $409F,2,2 Signal that...
B $40A1,1,1 ...the teacher has arrived at the Reading Room.
W $40A2,2,2 Tell the kids to sit down.
W $40A4,2,2 Go to...
B $40A6,2,2 ...the place in the Reading Room where teachers go before turning round.
W $40A8,2,2 Go to...
B $40AA,2,2 ...the place in the Reading Room where teachers wait for EINSTEIN to grass.
W $40AC,2,2 Wipe the board and conduct the class.
b $40AE Command list $84: Exam Room - teacher
D $40AE #ZX$FBB4
D $40AE Used by MR WACKER in lessons #LINK:LessonE2($E2), #LINK:LessonE7($E7), #LINK:LessonE9($E9), #LINK:LessonEE($EE) and #LINK:LessonF1($F1); by MR ROCKITT in lessons #LINK:LessonE3($E3), #LINK:LessonE4($E4), #LINK:LessonE8($E8), #LINK:LessonEA($EA), #LINK:LessonEB($EB), #LINK:LessonEC($EC) and #LINK:LessonED($ED); and by MR WITHIT in lessons #LINK:LessonE6($E6) and #LINK:LessonEF($EF).
W $40AE,2,2 Go to...
B $40B0,2,2 ...the fire escape.
W $40B2,2,2 Go to...
B $40B4,2,2 ...the doorway of the Exam Room.
W $40B6,2,2 Restart the command list unless it's time to start the lesson.
W $40B8,2,2 Signal that...
B $40BA,1,1 ...the teacher has arrived at the Exam Room.
W $40BB,2,2 Tell the kids to sit down.
W $40BD,2,2 Go to...
B $40BF,2,2 ...the place in the Exam Room where teachers wait for EINSTEIN to grass.
W $40C1,2,2 Wipe the board and conduct the class.
b $40C3 Command list $86: White Room - teacher
D $40C3 #ZX$FBCA
D $40C3 Used by MR WACKER in lessons #LINK:LessonEA($EA) and #LINK:LessonEC($EC); by MR ROCKITT in lessons #LINK:LessonE6($E6), #LINK:LessonE7($E7), #LINK:LessonEE($EE), #LINK:LessonF1($F1) and #LINK:LessonF2($F2); by MR WITHIT in lesson #LINK:LessonED($ED); and by MR CREAK in lessons #LINK:LessonE4($E4), #LINK:LessonE8($E8), #LINK:LessonE9($E9), #LINK:LessonEB($EB), #LINK:LessonEF($EF) and #LINK:LessonF0($F0).
W $40C3,2,2 Go to...
B $40C5,2,2 ...the staff room.
W $40C7,2,2 Go to...
B $40C9,2,2 ...the doorway of the White Room.
W $40CB,2,2 Restart the command list unless it's time to start the lesson.
W $40CD,2,2 Signal that...
B $40CF,1,1 ...the teacher has arrived at the White Room.
W $40D0,2,2 Tell the kids to sit down.
W $40D2,2,2 Go to...
B $40D4,2,2 ...the spot just past the right end of the board in the White Room.
W $40D6,2,2 Go to...
B $40D8,2,2 ...the right end of the board in the White Room.
W $40DA,2,2 Wipe the board and conduct the class.
b $40DC Command list $88: Map Room - little boy
D $40DC #ZX$FBE4
D $40DC Used by little boy no. 1 in lessons #LINK:LessonE5($E5), #LINK:LessonEC($EC) and #LINK:LessonEE($EE); by little boy no. 2 in lessons #LINK:LessonE5($E5), #LINK:LessonEA($EA), #LINK:LessonEB($EB) and #LINK:LessonF2($F2); by little boy no. 3 in lessons #LINK:LessonE5($E5), #LINK:LessonE8($E8), #LINK:LessonEC($EC), #LINK:LessonEE($EE) and #LINK:LessonF0($F0); by little boy no. 4 in lessons #LINK:LessonED($ED), #LINK:LessonEE($EE) and #LINK:LessonF2($F2); by little boy no. 5 in lessons #LINK:LessonE8($E8) and #LINK:LessonEB($EB); by little boy no. 6 in lessons #LINK:LessonEC($EC) and #LINK:LessonF2($F2); by little boy no. 7 in lessons #LINK:LessonEA($EA) and #LINK:LessonEE($EE); by little boy no. 8 in lessons #LINK:LessonE9($E9), #LINK:LessonEB($EB), #LINK:LessonED($ED) and #LINK:LessonF2($F2); by little boy no. 9 in lessons #LINK:LessonE5($E5), #LINK:LessonE8($E8), #LINK:LessonE9($E9) and #LINK:LessonF2($F2); by little boy no. 10 in lessons #LINK:LessonE5($E5), #LINK:LessonE9($E9) and #LINK:LessonEA($EA); and by little boy no. 11 in lessons #LINK:LessonE7($E7), #LINK:LessonEF($EF) and #LINK:LessonF0($F0).
W $40DC,2,2 Go to...
B $40DE,2,2 ...the Map Room.
W $40E0,2,2 Move about until...
B $40E2,1,1 ...the teacher arrives at the Map Room.
W $40E3,2,2 Find a seat and sit down.
E $40DC This command list continues at #A$40E5.
b $40E5 Command list $8A: Do nothing
D $40E5 #ZX$FBED
D $40E5 This command list appears in the timetables for BOY WONDER's and ERIC's pellets (see #A$8AE0 and #A$8BE0) but is not used by them. Command list #R$40DC($88) also continues here.
W $40E5,2,2 Do nothing.
b $40E7 Command list $8C: Map Room - BOY WONDER
D $40E7 #ZX$FBF0
D $40E7 Used by BOY WONDER in lessons #LINK:LessonE5($E5) and #LINK:LessonF0($F0).
W $40E7,2,2 Put the next address in BOY WONDER's buffer, making him...
W $40E9,2,2 ...fire the catapult now and then.
W $40EB,2,2 Go to...
B $40ED,2,2 ...the Map Room.
W $40EF,2,2 Put the next address in BOY WONDER's buffer, making him...
W $40F1,2,2 ...fire the catapult now and then.
W $40F3,2,2 Move about until...
B $40F5,1,1 ...the teacher arrives at the Map Room.
W $40F6,2,2 Find a seat and sit down.
W $40F8,2,2 Sit still.
b $40FA Command list $8E: Map Room - ANGELFACE
D $40FA #ZX$FC04
D $40FA Used by ANGELFACE in lessons #LINK:LessonE7($E7), #LINK:LessonEF($EF) and #LINK:LessonF0($F0).
W $40FA,2,2 Put the next address in ANGELFACE's buffer, making him...
W $40FC,2,2 ...hit now and then.
W $40FE,2,2 Go to...
B $4100,2,2 ...the Map Room.
W $4102,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4104,2,2 ...hit now and then.
W $4106,2,2 Move about until...
B $4108,1,1 ...the teacher arrives at the Map Room.
W $4109,2,2 Find a seat and sit down.
W $410B,2,2 Sit still.
b $410D Command list $90: Map Room - EINSTEIN
D $410D #ZX$FC18
D $410D Used by EINSTEIN in lessons #LINK:LessonE7($E7), #LINK:LessonEF($EF) and #LINK:LessonF0($F0).
W $410D,2,2 Go to...
B $410F,2,2 ...the Map Room.
W $4111,2,2 Move about until...
B $4113,1,1 ...the teacher arrives at the Map Room.
W $4114,2,2 Find a seat and sit down.
W $4116,2,2 Grass and answer questions.
b $4118 Command list $92: Reading Room - little boy
D $4118 #ZX$FC24
D $4118 Used by little boy no. 1 in lessons #LINK:LessonE2($E2), #LINK:LessonE7($E7), #LINK:LessonEA($EA), #LINK:LessonEB($EB), #LINK:LessonED($ED) and #LINK:LessonF0($F0); by little boy no. 2 in lessons #LINK:LessonE2($E2), #LINK:LessonE4($E4), #LINK:LessonE8($E8), #LINK:LessonEC($EC) and #LINK:LessonF0($F0); by little boy no. 3 in lessons #LINK:LessonE2($E2), #LINK:LessonE4($E4) and #LINK:LessonE7($E7); by little boy no. 4 in lessons #LINK:LessonE2($E2), #LINK:LessonE4($E4), #LINK:LessonE5($E5), #LINK:LessonEB($EB), #LINK:LessonEC($EC) and #LINK:LessonF0($F0); by little boy no. 5 in lessons #LINK:LessonE2($E2), #LINK:LessonE7($E7), #LINK:LessonE9($E9) and #LINK:LessonED($ED); by little boy no. 6 in lessons #LINK:LessonE5($E5) and #LINK:LessonEE($EE); by little boy no. 7 in lessons #LINK:LessonE5($E5), #LINK:LessonE8($E8), #LINK:LessonEB($EB) and #LINK:LessonEF($EF); by little boy no. 8 in lessons #LINK:LessonE5($E5), #LINK:LessonE7($E7), #LINK:LessonEC($EC), #LINK:LessonEE($EE) and #LINK:LessonF0($F0); by little boy no. 9 in lessons #LINK:LessonED($ED), #LINK:LessonEF($EF) and #LINK:LessonF0($F0); by little boy no. 10 in lessons #LINK:LessonEB($EB) and #LINK:LessonEE($EE); and by little boy no. 11 in lessons #LINK:LessonE8($E8), #LINK:LessonE9($E9), #LINK:LessonEA($EA) and #LINK:LessonF2($F2).
W $4118,2,2 Go to...
B $411A,2,2 ...the Reading Room.
W $411C,2,2 Move about until...
B $411E,1,1 ...the teacher arrives at the Reading Room.
W $411F,2,2 Find a seat and sit down.
W $4121,2,2 Sit still.
b $4123 Command list $94: Reading Room - BOY WONDER
D $4123 #ZX$FC30
D $4123 Used by BOY WONDER in lessons #LINK:LessonE8($E8), #LINK:LessonE9($E9), #LINK:LessonEA($EA) and #LINK:LessonF2($F2).
W $4123,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4125,2,2 ...fire the catapult now and then.
W $4127,2,2 Go to...
B $4129,2,2 ...the Reading Room board.
W $412B,2,2 Write on the board unless...
B $412D,1,1 ...the teacher has arrived at the Reading Room.
W $412E,2,2 Go to...
B $4130,2,2 ...the Reading Room.
W $4132,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4134,2,2 ...fire the catapult now and then.
W $4136,2,2 Move about until...
B $4138,1,1 ...the teacher arrives at the Reading Room.
W $4139,2,2 Find a seat and sit down.
W $413B,2,2 Sit still.
b $413D Command list $96: Reading Room - ANGELFACE
D $413D #ZX$FC4B
D $413D Used by ANGELFACE in lessons #LINK:LessonE9($E9), #LINK:LessonEA($EA) and #LINK:LessonF2($F2).
W $413D,2,2 Put the next address in ANGELFACE's buffer, making him...
W $413F,2,2 ...hit now and then.
W $4141,2,2 Go to...
B $4143,2,2 ...the Reading Room.
W $4145,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4147,2,2 ...hit now and then.
W $4149,2,2 Move about until...
B $414B,1,1 ...the teacher arrives at the Reading Room.
W $414C,2,2 Find a seat and sit down.
W $414E,2,2 Sit still.
b $4150 Command list $98: Reading Room - EINSTEIN
D $4150 #ZX$FC5F
D $4150 Used by EINSTEIN in lessons #LINK:LessonE8($E8), #LINK:LessonE9($E9), #LINK:LessonEA($EA) and #LINK:LessonF2($F2).
W $4150,2,2 Go to...
B $4152,2,2 ...the Reading Room.
W $4154,2,2 Move about until...
B $4156,1,1 ...the teacher arrives at the Reading Room.
W $4157,2,2 Find a seat and sit down.
W $4159,2,2 Grass and answer questions.
b $415B Command list $9A: Exam Room - little boy
D $415B #ZX$FC6B
D $415B Used by little boy no. 1 in lessons #LINK:LessonE3($E3), #LINK:LessonE6($E6), #LINK:LessonE9($E9), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 2 in lessons #LINK:LessonE3($E3), #LINK:LessonE9($E9), #LINK:LessonEE($EE) and #LINK:LessonF1($F1); by little boy no. 3 in lessons #LINK:LessonE3($E3), #LINK:LessonE6($E6), #LINK:LessonE9($E9), #LINK:LessonEB($EB), #LINK:LessonED($ED), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 4 in lessons #LINK:LessonE6($E6), #LINK:LessonE8($E8), #LINK:LessonEA($EA) and #LINK:LessonF1($F1); by little boy no. 5 in lessons #LINK:LessonEC($EC), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 6 in lessons #LINK:LessonE2($E2), #LINK:LessonE8($E8), #LINK:LessonEA($EA), #LINK:LessonEB($EB), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 7 in lessons #LINK:LessonE2($E2), #LINK:LessonE4($E4), #LINK:LessonE6($E6), #LINK:LessonE7($E7), #LINK:LessonED($ED) and #LINK:LessonF1($F1); by little boy no. 8 in lessons #LINK:LessonE2($E2), #LINK:LessonE4($E4), #LINK:LessonE8($E8), #LINK:LessonEA($EA), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 9 in lessons #LINK:LessonE2($E2), #LINK:LessonE3($E3), #LINK:LessonE4($E4), #LINK:LessonE7($E7), #LINK:LessonEB($EB), #LINK:LessonEC($EC), #LINK:LessonEE($EE) and #LINK:LessonF1($F1); by little boy no. 10 in lessons #LINK:LessonE2($E2), #LINK:LessonE3($E3), #LINK:LessonE4($E4), #LINK:LessonE7($E7), #LINK:LessonEC($EC), #LINK:LessonED($ED), #LINK:LessonEF($EF) and #LINK:LessonF1($F1); by little boy no. 11 in lessons #LINK:LessonE2($E2) and #LINK:LessonE3($E3); and by MR ROCKITT in lesson #LINK:LessonE5($E5).
W $415B,2,2 Go to...
B $415D,2,2 ...the Exam Room.
W $415F,2,2 Move about until...
B $4161,1,1 ...the teacher arrives at the Exam Room.
W $4162,2,2 Find a seat and sit down.
W $4164,2,2 Sit still.
b $4166 Command list $9C: Exam Room - BOY WONDER
D $4166 #ZX$FC77
D $4166 Used by BOY WONDER in lessons #LINK:LessonE2($E2), #LINK:LessonE3($E3), #LINK:LessonE7($E7) and #LINK:LessonEF($EF).
W $4166,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4168,2,2 ...fire the catapult now and then.
W $416A,2,2 Go to...
B $416C,2,2 ...the Exam Room board.
W $416E,2,2 Write on the board unless...
B $4170,1,1 ...the teacher has arrived at the Exam Room.
W $4171,2,2 Go to...
B $4173,2,2 ...the Exam Room.
W $4175,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4177,2,2 ...fire the catapult now and then.
W $4179,2,2 Move about until...
B $417B,1,1 ...the teacher arrives at the Exam Room.
W $417C,2,2 Find a seat and sit down.
W $417E,2,2 Sit still.
b $4180 Command list $9E: Exam Room - ANGELFACE
D $4180 #ZX$FC92
D $4180 Used by ANGELFACE in lessons #LINK:LessonE2($E2) and #LINK:LessonE3($E3).
W $4180,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4182,2,2 ...hit now and then.
W $4184,2,2 Go to...
B $4186,2,2 ...the Exam Room.
W $4188,2,2 Put the next address in ANGELFACE's buffer, making him...
W $418A,2,2 ...hit now and then.
W $418C,2,2 Move about until...
B $418E,1,1 ...the teacher arrives at the Exam Room.
W $418F,2,2 Find a seat and sit down.
W $4191,2,2 Sit still.
b $4193 Command list $A0: Exam Room - EINSTEIN
D $4193 #ZX$FCA6
D $4193 Used by EINSTEIN in lessons #LINK:LessonE2($E2) and #LINK:LessonE3($E3).
W $4193,2,2 Go to...
B $4195,2,2 ...the Exam Room.
W $4197,2,2 Move about until...
B $4199,1,1 ...the teacher arrives at the Exam Room.
W $419A,2,2 Find a seat and sit down.
W $419C,2,2 Grass and answer questions.
b $419E Command list $A2: White Room - little boy
D $419E #ZX$FCB2
D $419E Used by little boy no. 1 in lessons #LINK:LessonE8($E8) and #LINK:LessonF2($F2); by little boy no. 2 in lessons #LINK:LessonE6($E6), #LINK:LessonE7($E7), #LINK:LessonED($ED) and #LINK:LessonEF($EF); by little boy no. 3 in lessons #LINK:LessonEA($EA) and #LINK:LessonF2($F2); by little boy no. 4 in lessons #LINK:LessonE3($E3), #LINK:LessonE7($E7), #LINK:LessonE9($E9) and #LINK:LessonEF($EF); by little boy no. 5 in lessons #LINK:LessonE3($E3), #LINK:LessonE4($E4), #LINK:LessonE6($E6), #LINK:LessonEA($EA), #LINK:LessonEE($EE), #LINK:LessonF0($F0) and #LINK:LessonF2($F2); by little boy no. 6 in lessons #LINK:LessonE3($E3), #LINK:LessonE4($E4), #LINK:LessonE6($E6), #LINK:LessonE7($E7), #LINK:LessonE9($E9), #LINK:LessonED($ED) and #LINK:LessonF0($F0); by little boy no. 7 in lessons #LINK:LessonE3($E3), #LINK:LessonE9($E9), #LINK:LessonEC($EC), #LINK:LessonF0($F0) and #LINK:LessonF2($F2); by little boy no. 8 in lessons #LINK:LessonE3($E3) and #LINK:LessonE6($E6); by little boy no. 9 in lessons #LINK:LessonE6($E6) and #LINK:LessonEA($EA); by little boy no. 10 in lessons #LINK:LessonE8($E8), #LINK:LessonF0($F0) and #LINK:LessonF2($F2); and by little boy no. 11 in lessons #LINK:LessonEB($EB), #LINK:LessonEC($EC), #LINK:LessonED($ED), #LINK:LessonEE($EE) and #LINK:LessonF1($F1).
W $419E,2,2 Go to...
B $41A0,2,2 ...the White Room.
W $41A2,2,2 Move about until...
B $41A4,1,1 ...the teacher arrives at the White Room.
W $41A5,2,2 Find a seat and sit down.
W $41A7,2,2 Sit still.
b $41A9 Command list $A4: White Room - BOY WONDER
D $41A9 #ZX$FCBE
D $41A9 Used by BOY WONDER in lessons #LINK:LessonEB($EB), #LINK:LessonEE($EE) and #LINK:LessonF1($F1).
W $41A9,2,2 Put the next address in BOY WONDER's buffer, making him...
W $41AB,2,2 ...fire the catapult now and then.
W $41AD,2,2 Go to...
B $41AF,2,2 ...the White Room board.
W $41B1,2,2 Write on the board unless...
B $41B3,1,1 ...the teacher has arrived at the White Room.
W $41B4,2,2 Go to...
B $41B6,2,2 ...the White Room.
W $41B8,2,2 Put the next address in BOY WONDER's buffer, making him...
W $41BA,2,2 ...fire the catapult now and then.
W $41BC,2,2 Move about until...
B $41BE,1,1 ...the teacher arrives at the White Room.
W $41BF,2,2 Find a seat and sit down.
W $41C1,2,2 Sit still.
b $41C3 Command list $A6: White Room - ANGELFACE
D $41C3 #ZX$FCD9
D $41C3 Used by ANGELFACE in lessons #LINK:LessonE4($E4), #LINK:LessonE8($E8), #LINK:LessonEB($EB), #LINK:LessonEC($EC) and #LINK:LessonF1($F1).
W $41C3,2,2 Put the next address in ANGELFACE's buffer, making him...
W $41C5,2,2 ...hit now and then.
W $41C7,2,2 Go to...
B $41C9,2,2 ...the White Room.
W $41CB,2,2 Put the next address in ANGELFACE's buffer, making him...
W $41CD,2,2 ...hit now and then.
W $41CF,2,2 Move about until...
B $41D1,1,1 ...the teacher arrives at the White Room.
W $41D2,2,2 Find a seat and sit down.
W $41D4,2,2 Sit still.
b $41D6 Command list $A8: White Room - EINSTEIN
D $41D6 #ZX$FCED
D $41D6 Used by EINSTEIN in lessons #LINK:LessonEB($EB), #LINK:LessonEC($EC), #LINK:LessonED($ED), #LINK:LessonEE($EE) and #LINK:LessonF1($F1).
W $41D6,2,2 Go to...
B $41D8,2,2 ...the White Room.
W $41DA,2,2 Move about until...
B $41DC,1,1 ...the teacher arrives at the White Room.
W $41DD,2,2 Find a seat and sit down.
W $41DF,2,2 Grass and answer questions.
b $41E1 Command list $AA: Dinner - EINSTEIN/little boy
D $41E1 #ZX$FCF9
D $41E1 Used by little boy no. 1, little boy no. 2, little boy no. 3, little boy no. 4, little boy no. 5, little boy no. 6, little boy no. 7, little boy no. 8, little boy no. 9, little boy no. 10, little boy no. 11 and EINSTEIN in lessons #LINK:LessonE0($E0) and #LINK:LessonE1($E1).
W $41E1,2,2 Go to...
B $41E3,2,2 ...the dinner hall.
W $41E5,2,2 Move about until...
B $41E7,1,1 ...the bell rings.
b $41E8 Command list $AC: Dinner - BOY WONDER
D $41E8 #ZX$FD01
D $41E8 Used by BOY WONDER in lessons #LINK:LessonE0($E0) and #LINK:LessonE1($E1).
W $41E8,2,2 Put the next address in BOY WONDER's buffer, making him...
W $41EA,2,2 ...fire the catapult now and then.
W $41EC,2,2 Go to...
B $41EE,2,2 ...the dinner hall.
W $41F0,2,2 Put the next address in BOY WONDER's buffer, making him...
W $41F2,2,2 ...fire the catapult now and then.
W $41F4,2,2 Move about until...
B $41F6,1,1 ...the bell rings.
b $41F7 Command list $AE: Dinner - ANGELFACE
D $41F7 #ZX$FD11
D $41F7 Used by ANGELFACE in lessons #LINK:LessonE0($E0) and #LINK:LessonE1($E1).
W $41F7,2,2 Put the next address in ANGELFACE's buffer, making him...
W $41F9,2,2 ...hit now and then.
W $41FB,2,2 Go to...
B $41FD,2,2 ...the dinner hall
W $41FF,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4201,2,2 ...hit now and then.
W $4203,2,2 Move about until...
B $4205,1,1 ...the bell rings.
b $4206 Command list $B0: Revision Library - EINSTEIN/little boy
D $4206 #ZX$FD21
D $4206 Used by little boy no. 1 in lessons #LINK:LessonE4($E4), #LINK:LessonF7($F7), #LINK:LessonF8($F8) and #LINK:LessonFE($FE); by little boy no. 2 in lessons #LINK:LessonF8($F8) and #LINK:LessonFF($FF); by little boy no. 4 in lesson #LINK:LessonF7($F7); by little boy no. 5 in lessons #LINK:LessonE5($E5) and #LINK:LessonFE($FE); by little boy no. 7 in lessons #LINK:LessonF7($F7) and #LINK:LessonFF($FF); by little boy no. 8 in lesson #LINK:LessonF9($F9); by little boy no. 9 in lessons #LINK:LessonF9($F9) and #LINK:LessonFE($FE); by little boy no. 10 in lessons #LINK:LessonE6($E6), #LINK:LessonF6($F6), #LINK:LessonFA($FA) and #LINK:LessonFE($FE); by little boy no. 11 in lessons #LINK:LessonE4($E4), #LINK:LessonE5($E5), #LINK:LessonE6($E6), #LINK:LessonF6($F6), #LINK:LessonFA($FA) and #LINK:LessonFE($FE); and by EINSTEIN in lessons #LINK:LessonE4($E4), #LINK:LessonE5($E5) and #LINK:LessonE6($E6).
W $4206,2,2 Go to...
B $4208,2,2 ...the Revision Library.
W $420A,2,2 Move about until...
B $420C,1,1 ...the bell rings.
b $420D Command list $B2: Revision Library - BOY WONDER
D $420D #ZX$FD29
D $420D Used by BOY WONDER in lessons #LINK:LessonE4($E4), #LINK:LessonE6($E6), #LINK:LessonEC($EC) and #LINK:LessonED($ED).
W $420D,2,2 Put the next address in BOY WONDER's buffer, making him...
W $420F,2,2 ...fire the catapult now and then.
W $4211,2,2 Go to...
B $4213,2,2 ...the Revision Library.
W $4215,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4217,2,2 ...fire the catapult now and then.
W $4219,2,2 Move about until...
B $421B,1,1 ...the bell rings.
b $421C Command list $B4: Revision Library - ANGELFACE
D $421C #ZX$FD39
D $421C Used by ANGELFACE in lessons #LINK:LessonE5($E5), #LINK:LessonE6($E6), #LINK:LessonED($ED) and #LINK:LessonEE($EE).
W $421C,2,2 Put the next address in ANGELFACE's buffer, making him...
W $421E,2,2 ...hit now and then.
W $4220,2,2 Go to...
B $4222,2,2 ...the Revision Library.
W $4224,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4226,2,2 ...hit now and then.
W $4228,2,2 Move about until...
B $422A,1,1 ...the bell rings.
b $422B Command list $B6: Walkabout - ANGELFACE
D $422B #ZX$FD49
D $422B Used by ANGELFACE in lessons #LINK:LessonF6($F6), #LINK:LessonF7($F7), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFC($FC), #LINK:LessonFD($FD), #LINK:LessonFE($FE) and #LINK:LessonFF($FF).
W $422B,2,2 Put the next address in ANGELFACE's buffer, making him...
W $422D,2,2 ...hit now and then.
W $422F,2,2 Go to a random location.
W $4231,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4233,2,2 ...hit now and then.
W $4235,2,2 Walk up and down...
B $4237,2,2 ...20 times.
W $4239,2,2 Restart the command list.
b $423B Command list $B8: Dinner duty
D $423B #ZX$FD59
D $423B Used by MR WACKER in lesson #LINK:LessonE1($E1); and by MR WITHIT in lesson #LINK:LessonE0($E0).
W $423B,2,2 Go to...
B $423D,2,2 ...the table in the dinner hall.
W $423F,2,2 Go to...
B $4241,2,2 ...the bottom of the staircase that leads up to the staff room. (This is a #BUG#derelictionOfDinnerDuty(bug).)
W $4243,2,2 Restart the command list unless dinner has started.
W $4245,2,2 Perform dinner duty.
b $4247 Command list $BA: Head's study - MR WACKER
D $4247 #ZX$FD65
D $4247 Used by MR WACKER in lessons #LINK:LessonE0($E0) and #LINK:LessonF7($F7).
W $4247,2,2 Go to...
B $4249,2,2 ...the doorway of the Head's study.
W $424B,2,2 Move about until...
B $424D,1,1 ...the bell rings.
b $424E Command list $BC: Staff room - teacher
D $424E #ZX$FD6C
D $424E Used by MR WACKER in lesson #LINK:LessonFE($FE); by MR ROCKITT in lessons #LINK:LessonE0($E0), #LINK:LessonE1($E1), #LINK:LessonF7($F7), #LINK:LessonF9($F9) and #LINK:LessonFE($FE); by MR WITHIT in lessons #LINK:LessonF7($F7), #LINK:LessonF8($F8), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFE($FE) and #LINK:LessonFF($FF); and by MR CREAK in lessons #LINK:LessonE0($E0), #LINK:LessonE1($E1), #LINK:LessonE2($E2), #LINK:LessonE3($E3), #LINK:LessonF1($F1), #LINK:LessonF6($F6), #LINK:LessonF7($F7), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFE($FE) and #LINK:LessonFF($FF).
W $424E,2,2 Go to...
B $4250,2,2 ...the staff room.
W $4252,2,2 Move about until...
B $4254,1,1 ...the bell rings.
b $4255 Command list $BE: Walkabout - teacher
D $4255 #ZX$FD73
D $4255 Used by MR WACKER in lessons #LINK:LessonE3($E3), #LINK:LessonE5($E5), #LINK:LessonE6($E6), #LINK:LessonF0($F0), #LINK:LessonF2($F2), #LINK:LessonF3($F3), #LINK:LessonF6($F6), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFC($FC) and #LINK:LessonFF($FF); by MR ROCKITT in lessons #LINK:LessonF4($F4), #LINK:LessonF5($F5) and #LINK:LessonF6($F6); by MR WITHIT in lessons #LINK:LessonE3($E3), #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5) and #LINK:LessonF6($F6); and by MR CREAK in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4) and #LINK:LessonF5($F5).
W $4255,2,2 Go to...
B $4257,2,2 ...the Head's study.
W $4259,2,2 Go to a random location.
W $425B,2,2 Restart the command list.
b $425D Command list $C0: Write on the boards - BOY WONDER
D $425D #ZX$FD7C
D $425D Used by BOY WONDER in lessons #LINK:LessonF6($F6), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFA($FA) and #LINK:LessonFE($FE).
W $425D,2,2 Go to...
B $425F,2,2 ...the Exam Room board.
W $4261,2,2 Write on the board unless...
B $4263,1,1 ...playtime has ended (which is never the case).
W $4264,2,2 Go to...
B $4266,2,2 ...the White Room board.
W $4268,2,2 Write on the board unless...
B $426A,1,1 ...playtime has ended (which is never the case).
W $426B,2,2 Go to...
B $426D,2,2 ...the Reading Room board.
W $426F,2,2 Write on the board unless...
B $4271,1,1 ...playtime has ended (which is never the case).
E $425D This command list continues at #A$4272.
b $4272 Command list $C2: Walkabout - BOY WONDER
D $4272 #ZX$FDDC
D $4272 Used by BOY WONDER in lessons #LINK:LessonF7($F7), #LINK:LessonFB($FB), #LINK:LessonFC($FC), #LINK:LessonFD($FD) and #LINK:LessonFF($FF). Command list #R$425D($C0) also continues here.
W $4272,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4274,2,2 ...fire the catapult now and then.
W $4276,2,2 Go to a random location.
W $4278,2,2 Put the next address in BOY WONDER's buffer, making him...
W $427A,2,2 ...fire the catapult now and then.
W $427C,2,2 Walk up and down...
B $427E,2,2 ...20 times.
W $4280,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4282,2,2 ...fire the catapult now and then.
W $4284,2,2 Go to a random location.
W $4286,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4288,2,2 ...fire the catapult now and then.
W $428A,2,2 Walk up and down...
B $428C,2,2 ...20 times.
W $428E,2,2 Restart the command list.
b $4290 Command list $C4: Walkabout
D $4290 #ZX$FD92
D $4290 Used by little boy no. 1 and little boy no. 3 in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5), #LINK:LessonFA($FA), #LINK:LessonFB($FB) and #LINK:LessonFF($FF); by little boy no. 2 in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5), #LINK:LessonFA($FA) and #LINK:LessonFB($FB); by little boy no. 4, little boy no. 5, little boy no. 6, little boy no. 7 and little boy no. 8 in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5) and #LINK:LessonFB($FB); by little boy no. 9 in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5), #LINK:LessonF8($F8) and #LINK:LessonFB($FB); by little boy no. 10 in lessons #LINK:LessonF8($F8), #LINK:LessonF9($F9) and #LINK:LessonFB($FB); by little boy no. 11 in lessons #LINK:LessonF3($F3), #LINK:LessonF4($F4), #LINK:LessonF5($F5), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFB($FB) and #LINK:LessonFF($FF); by MR WACKER in lesson #LINK:LessonFD($FD); by MR ROCKITT in lessons #LINK:LessonE2($E2), #LINK:LessonF8($F8), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFC($FC), #LINK:LessonFD($FD) and #LINK:LessonFF($FF); by MR WITHIT in lessons #LINK:LessonF1($F1), #LINK:LessonF9($F9), #LINK:LessonFC($FC) and #LINK:LessonFD($FD); by MR CREAK in lessons #LINK:LessonFC($FC) and #LINK:LessonFD($FD); by ANGELFACE in lessons #LINK:LessonF4($F4) and #LINK:LessonF5($F5); by BOY WONDER in lessons #LINK:LessonF3($F3) and #LINK:LessonF4($F4); and by EINSTEIN in lessons #LINK:LessonF3($F3), #LINK:LessonF5($F5), #LINK:LessonF6($F6), #LINK:LessonF7($F7), #LINK:LessonF8($F8), #LINK:LessonF9($F9), #LINK:LessonFA($FA), #LINK:LessonFB($FB), #LINK:LessonFC($FC), #LINK:LessonFD($FD), #LINK:LessonFE($FE) and #LINK:LessonFF($FF).
W $4290,2,2 Go to a random location.
W $4292,2,2 Walk up and down...
B $4294,2,2 ...15 times.
W $4296,2,2 Restart the command list.
b $4298 Command list $C6: Walk around the fire escape
D $4298 #ZX$FD9B
D $4298 Used by little boy no. 1 in lesson #LINK:LessonF6($F6); by little boy no. 2 in lessons #LINK:LessonF6($F6), #LINK:LessonF7($F7) and #LINK:LessonFE($FE); by little boy no. 3 in lessons #LINK:LessonF6($F6) and #LINK:LessonF8($F8); by little boy no. 4 in lessons #LINK:LessonF8($F8), #LINK:LessonF9($F9) and #LINK:LessonFF($FF); by little boy no. 5 in lesson #LINK:LessonF7($F7); by little boy no. 6 in lessons #LINK:LessonF9($F9) and #LINK:LessonFE($FE); by little boy no. 8 in lessons #LINK:LessonF7($F7), #LINK:LessonFA($FA) and #LINK:LessonFF($FF); by little boy no. 9 in lesson #LINK:LessonFA($FA); and by MR WITHIT in lesson #LINK:LessonE1($E1).
W $4298,2,2 Go to...
B $429A,2,2 ...the far end of the fire escape.
W $429C,2,2 Move about until...
B $429E,1,1 ...the bell rings.
b $429F Command list $C8: Walk around the gym
D $429F #ZX$FDA3
D $429F Used by little boy no. 3 in lessons #LINK:LessonF7($F7) and #LINK:LessonFE($FE); by little boy no. 4 in lessons #LINK:LessonF6($F6) and #LINK:LessonFA($FA); by little boy no. 5 in lessons #LINK:LessonF6($F6), #LINK:LessonF9($F9), #LINK:LessonFA($FA) and #LINK:LessonFF($FF); by little boy no. 6 in lessons #LINK:LessonF6($F6) and #LINK:LessonF8($F8); by little boy no. 7 in lessons #LINK:LessonF8($F8), #LINK:LessonF9($F9) and #LINK:LessonFE($FE); by little boy no. 9 in lessons #LINK:LessonF7($F7) and #LINK:LessonFF($FF); and by little boy no. 10 in lesson #LINK:LessonF7($F7).
W $429F,2,2 Go to...
B $42A1,2,2 ...the gym.
W $42A3,2,2 Move about until...
B $42A5,1,1 ...the bell rings.
b $42A6 Command list $CA: Walk around the big window
D $42A6 #ZX$FDAB
D $42A6 Used by little boy no. 1, little boy no. 2 and little boy no. 3 in lesson #LINK:LessonF9($F9); by little boy no. 4 in lesson #LINK:LessonFE($FE); by little boy no. 5 in lesson #LINK:LessonF8($F8); by little boy no. 6 in lessons #LINK:LessonF7($F7), #LINK:LessonFA($FA) and #LINK:LessonFF($FF); by little boy no. 7 in lessons #LINK:LessonF6($F6) and #LINK:LessonFA($FA); by little boy no. 8 in lessons #LINK:LessonF6($F6), #LINK:LessonF8($F8) and #LINK:LessonFE($FE); by little boy no. 9 in lesson #LINK:LessonF6($F6); by little boy no. 10 in lesson #LINK:LessonFF($FF); by little boy no. 11 in lesson #LINK:LessonF7($F7); and by MR WITHIT in lesson #LINK:LessonE4($E4).
W $42A6,2,2 Go to...
B $42A8,2,2 ...the vicinity of the big window.
W $42AA,2,2 Move about until...
B $42AC,1,1 ...the bell rings.
b $42AD Command list $CC: Stampede - leader
D $42AD #ZX$FDB3
D $42AD Used by little boy no. 1 in lessons #LINK:LessonFC($FC) and #LINK:LessonFD($FD).
W $42AD,2,2 Walk up and down...
B $42AF,2,2 ...15 times.
W $42B1,2,2 Signal that...
B $42B3,1,1 ...the stampede leader is ready.
W $42B4,2,2 Put the next address in the little boy's buffer, making him...
W $42B6,2,2 ...trip people up.
W $42B8,2,2 Go to a random location.
W $42BA,2,2 Unsignal that...
B $42BC,1,1 ...the stampede leader is ready.
W $42BD,2,2 Walk up and down...
B $42BF,2,2 ...15 times.
W $42C1,2,2 Signal that...
B $42C3,1,1 ...the stampede leader is ready again.
W $42C4,2,2 Put the next address in the little boy's buffer, making him...
W $42C6,2,2 ...trip people up.
W $42C8,2,2 Go to a random location.
W $42CA,2,2 Unsignal that...
B $42CC,1,1 ...the stampede leader is ready again.
W $42CD,2,2 Restart the command list.
b $42CF Command list $CE: Stampede - follower
D $42CF #ZX$FDCF
D $42CF Used by little boy no. 2, little boy no. 3, little boy no. 4, little boy no. 5, little boy no. 6, little boy no. 7, little boy no. 8, little boy no. 9, little boy no. 10 and little boy no. 11 in lessons #LINK:LessonFC($FC) and #LINK:LessonFD($FD).
W $42CF,2,2 Move about until...
B $42D1,1,1 ...the stampede leader is ready.
W $42D2,2,2 Put the next address in the little boy's buffer, making him...
W $42D4,2,2 ...trip people up.
W $42D6,2,2 Find and follow little boy no. 1 (the stampede leader).
W $42D8,2,2 Move about until...
B $42DA,1,1 ...the stampede leader is ready again.
W $42DB,2,2 Put the next address in the little boy's buffer, making him...
W $42DD,2,2 ...trip people up.
W $42DF,2,2 Find and follow little boy no. 1 (the stampede leader).
W $42E1,2,2 Restart the command list.
b $42E3 Command list $D0: Tell ERIC about BOY WONDER
D $42E3 #ZX$FAE6
D $42E3 Used by little boy no. 10 in lesson #LINK:LessonF5($F5).
W $42E3,2,2 Go to...
B $42E5,2,2 ...the gym.
W $42E7,2,2 Move about until...
B $42E9,1,1 ...BOY WONDER is ready.
W $42EA,2,2 Move about until...
B $42EC,1,1 ...MR WACKER is ready.
W $42ED,2,2 Find ERIC.
W $42EF,2,2 Tell ERIC that...
W $42F1,2,2 ...BOY WONDER has hidden a pea-shooter.
W $42F3,2,2 Signal that...
B $42F5,1,1 ...ERIC has been told about BOY WONDER.
W $42F6,2,2 Go to a random location.
W $42F8,2,2 Move about until...
B $42FA,1,1 ...the bell rings.
b $42FB Command list $D2: Tell ERIC about ANGELFACE
D $42FB #ZX$FAF0
D $42FB Used by little boy no. 10 in lesson #LINK:LessonF3($F3).
W $42FB,2,2 Find ERIC.
W $42FD,2,2 Tell ERIC that...
W $42FF,2,2 ...ANGELFACE has mumps.
W $4301,2,2 Signal that...
B $4303,1,1 ...ERIC has been told about ANGELFACE.
W $4304,2,2 Go to a random location.
W $4306,2,2 Move about until...
B $4308,1,1 ...the bell rings.
b $4309 Command list $D4: Grass on ERIC
D $4309 #ZX$FB09
D $4309 Used by EINSTEIN in lesson #LINK:LessonF4($F4).
W $4309,2,2 Go to...
B $430B,2,2 ...the far end of the fire escape.
W $430D,2,2 Signal that...
B $430F,1,1 ...EINSTEIN is ready.
W $4310,2,2 Move about until...
B $4312,1,1 ...ERIC has been told about EINSTEIN.
W $4313,2,2 Go to...
B $4315,2,2 ...just inside the Head's study.
W $4317,2,2 Signal that...
B $4319,1,1 ...EINSTEIN has grassed on ERIC.
W $431A,2,2 Go to a random location.
W $431C,2,2 Move about until...
B $431E,1,1 ...the bell rings.
b $431F Command list $D6: Wait for EINSTEIN to grass on ERIC
D $431F #ZX$FB20
D $431F Used by MR WACKER in lesson #LINK:LessonF4($F4).
W $431F,2,2 Go to...
B $4321,2,2 ...the doorway of the Head's study.
W $4323,2,2 Signal that...
B $4325,1,1 ...MR WACKER is ready.
W $4326,2,2 Move about until...
B $4328,1,1 ...EINSTEIN has grassed on ERIC.
W $4329,2,2 Find ERIC.
W $432B,2,2 Give ERIC 2000 lines.
W $432D,2,2 Go to...
B $432F,2,2 ...the doorway of the Head's study.
W $4331,2,2 Move about until...
B $4333,1,1 ...the bell rings.
b $4334 Command list $D8: Collect the pea-shooter
D $4334 #ZX$FB3A
D $4334 Used by BOY WONDER in lesson #LINK:LessonF5($F5).
W $4334,2,2 Go to...
B $4336,2,2 ...the left end of the Revision Library.
W $4338,2,2 Signal that...
B $433A,1,1 ...BOY WONDER is ready.
W $433B,2,2 Move about until...
B $433D,1,1 ...ERIC has been told about BOY WONDER.
W $433E,2,2 Put the next address in BOY WONDER's buffer, making him...
W $4340,2,2 ...fire the catapult now and then.
W $4342,2,2 Go to...
B $4344,2,2 ...the far end of the fire escape.
W $4346,2,2 Signal that...
B $4348,1,1 ...BOY WONDER has got the pea-shooter.
W $4349,2,2 Go to a random location.
W $434B,2,2 Put the next address in BOY WONDER's buffer, making him...
W $434D,2,2 ...fire the catapult now and then.
W $434F,2,2 Move about until...
B $4351,1,1 ...the bell rings.
b $4352 Command list $DA: Look for the pea-shooter
D $4352 #ZX$FB55
D $4352 Used by MR WACKER in lesson #LINK:LessonF5($F5).
W $4352,2,2 Go to...
B $4354,2,2 ...just inside the Reading Room.
W $4356,2,2 Signal that...
B $4358,1,1 ...MR WACKER is ready.
W $4359,2,2 Move about until...
B $435B,1,1 ...ERIC has been told about BOY WONDER.
W $435C,2,2 Run to...
B $435E,2,2 ...the far end of the fire escape.
W $4360,2,2 Move about until the bell rings if...
B $4362,1,1 ...BOY WONDER has got the pea-shooter.
W $4363,2,2 Find ERIC.
W $4365,2,2 Give ERIC 2000 lines.
W $4367,2,2 Go to...
B $4369,2,2 ...the doorway of the Head's study.
W $436B,2,2 Move about until...
B $436D,1,1 ...the bell rings.
b $436E Command list $DC: Mumps walkabout
D $436E #ZX$FAFF
D $436E Used by ANGELFACE in lesson #LINK:LessonF3($F3).
W $436E,2,2 Put the next address in ANGELFACE's buffer, making him...
W $4370,2,2 ...hit now and then.
W $4372,2,2 Go to a random location.
W $4374,2,2 Restart the command list.
b $4376 Command list $DE: Mumps duty
D $4376 #ZX$FADB
D $4376 Used by MR ROCKITT in lesson #LINK:LessonF3($F3).
W $4376,2,2 Go to...
B $4378,2,2 ...the staff room
W $437A,2,2 Move about until...
B $437C,1,1 ...ERIC has been told about ANGELFACE.
W $437D,2,2 Put the next address in the teacher's buffer, making him...
W $437F,2,2 ...check whether ANGELFACE is touching ERIC.
W $4381,2,2 Move about until...
B $4383,1,1 ...ERIC has mumps.
W $4384,2,2 Find ERIC.
W $4386,2,2 Tell ERIC to go home because...
W $4388,2,2 ...he's got mumps.
b $438A Command list $E0: Tell ERIC about EINSTEIN
D $438A #ZX$FAE6
D $438A Used by little boy no. 10 in lesson #LINK:LessonF4($F4).
W $438A,2,2 Go to...
B $438C,2,2 ...the right end of the dinner hall.
W $438E,2,2 Move about until...
B $4390,1,1 ...EINSTEIN is ready.
W $4391,2,2 Move about until...
B $4393,1,1 ...MR WACKER is ready.
W $4394,2,2 Find ERIC.
W $4396,2,2 Tell ERIC that...
W $4398,2,2 ...EINSTEIN is going to grass on him.
W $439A,2,2 Signal that...
B $439C,1,1 ...ERIC has been told about EINSTEIN.
W $439D,2,2 Go to a random location.
W $439F,2,2 Move about until...
B $43A1,1,1 ...the bell rings.
b $43A2 Command list used to make MR WACKER find and expel ERIC
D $43A2 The address of this command list is placed into MR WACKER's buffer by the routine at #A$1D4A.
W $43A2,2,2 Find ERIC.
W $43A4,2,2 Tell ERIC to go home because...
W $43A6,2,2 ...he has over 10000 lines.
u $43A8 Unused
B $43A8,2,2
t $43AA YOU'VE GOT MUMPS. GO HOME AT ONCE, THIS GAME IS OVER. . . .PRESS A KEY TO PLAY AGAIN
D $43AA Used by command list #R$4376($DE).
B $43AA,84,c18,c41,c25
B $43FE,1,1 #R$4816($03): 8 spaces
u $43FF Unused
B $43FF,1,1
b $4400 Signal flags
D $4400 Used by the routines at #A$2AF9, #A$2B0D, #A$31B6, #A$31C4, #A$31D2 and #A$392D.
B $4400,1,1 Event $00: end of lesson/playtime (always 0).
B $4401,1,1 Event $01: ERIC should be in class or the dinner hall now. This signal is raised by the routines at #A$0A58, #A$0B3B and #A$0E35, and checked by the routines at #A$0B3B and #A$149F.
B $4402,1,1 Event $02: ERIC's lesson has started. This signal is raised by the routine at #A$0A58, and checked by the routine at #A$149F.
B $4403,1,1 Event $03: EINSTEIN is speaking. This signal is raised and checked by the routine at #A$1EE3, and lowered and checked by the routine at #A$1F4D.
B $4404,1,1 Event $04 (unused).
B $4405,1,1 Event $05 (unused).
B $4406,1,1 Event $06 (unused).
B $4407,1,1 Event $07 (unused).
B $4408,1,1 Event $08: teacher has arrived at the Map Room. This signal is raised by command list #R$4080($80), and checked by command lists #R$40DC($88), #R$40E7($8C), #R$40FA($8E) and #R$410D($90).
B $4409,1,1 Event $09: teacher has arrived at the Reading Room. This signal is raised by command list #R$4095($82), and checked by command lists #R$4118($92), #R$4123($94), #R$413D($96) and #R$4150($98).
B $440A,1,1 Event $0A: teacher has arrived at the Exam Room. This signal is raised by command list #R$40AE($84), and checked by command lists #R$415B($9A), #R$4166($9C), #R$4180($9E) and #R$4193($A0).
B $440B,1,1 Event $0B: teacher has arrived at the White Room. This signal is raised by command list #R$40C3($86), and checked by command lists #R$419E($A2), #R$41A9($A4), #R$41C3($A6) and #R$41D6($A8).
B $440C,1,1 Event $0C: ERIC has mumps. This signal is raised by the routine at #A$26EF, and checked by command list #R$4376($DE).
B $440D,1,1 Event $0D (unused).
B $440E,1,1 Event $0E (unused).
B $440F,1,1 Event $0F (unused).
B $4410,1,1 Event $10: little boy no. 1 is ready to stampede. This signal is raised and lowered by command list #R$42AD($CC), and checked by command list #R$42CF($CE).
B $4411,1,1 Event $11: little boy no. 1 is ready to stampede again. This signal is raised and lowered by command list #R$42AD($CC), and checked by command list #R$42CF($CE).
B $4412,1,1 Event $12 (unused).
B $4413,1,1 Event $13 (unused).
B $4414,1,1 Event $14 (unused).
B $4415,1,1 Event $15 (unused).
B $4416,1,1 Event $16 (unused).
B $4417,1,1 Event $17 (unused).
B $4418,1,1 Event $18 (unused).
B $4419,1,1 Event $19 (unused).
B $441A,1,1 Event $1A: EINSTEIN or BOY WONDER is ready. This signal is raised by command lists #R$4309($D4) and #R$4334($D8), and checked by command lists #R$42E3($D0) and #R$438A($E0).
B $441B,1,1 Event $1B: MR WACKER is ready. This signal is raised by command lists #R$431F($D6) and #R$4352($DA), and checked by command lists #R$42E3($D0) and #R$438A($E0).
B $441C,1,1 Event $1C: ERIC has been told about EINSTEIN, BOY WONDER or ANGELFACE. This signal is raised by command lists #R$42E3($D0), #R$42FB($D2) and #R$438A($E0), and checked by command lists #R$4309($D4), #R$4334($D8) and #R$4352($DA).
B $441D,1,1 Event $1D: EINSTEIN has told MR WACKER what ERIC's up to. This signal is raised by command list #R$4309($D4), and checked by command list #R$431F($D6).
B $441E,1,1 Event $1E (unused).
B $441F,1,1 Event $1F (unused).
b $4420 Blackboard buffers
D $4420 Used by the routine at #A$13D5. See the #LINK:BlackboardBuffer(blackboard buffer documentation) for details of how the buffers are used.
B $4420,6,6 Reading Room blackboard.
B $4426,6,6 White Room blackboard.
B $442C,6,6 Exam Room blackboard.
u $4432 Unused
B $4432,6,6
b $4438 Keyboard table addresses
D $4438 Used by the routine at #A$3940.
W $4438,2,2 Standard keyboard with no modifier keys pressed.
W $443A,2,2 Keyboard with SHIFT pressed.
W $443C,2,2 Keyboard with the CBM key pressed.
W $443E,2,2 Keyboard with CTRL pressed.
b $4440 Staircase endpoint data table 1
D $4440 Used by the routine at #A$12B5 when the region identifier for the character's current location (C) is less than the destination region identifier. The second staircase endpoint data table is at #A$4454.
D $4440 The first entry is used when C=0, which means the character is on the top floor, to the left of the Map Room wall.
B $4440,1,1 x-coordinate of the top of the stairs leading down from the head's study.
B $4441,1,1 Direction indicator: face right.
W $4442,2,2 Guide the character down the staircase.
N $4444 The second entry is used when C=1, which means the character is on the middle floor, to the left of the Exam Room wall.
B $4444,1,1 x-coordinate of the top of the stairs leading down from the staff room.
B $4445,1,1 Direction indicator: face right.
W $4446,2,2 Guide the character down the staircase.
N $4448 The third entry is used when C=2, which means the character is on the bottom floor.
B $4448,1,1 x-coordinate of the bottom of the stairs leading up to the Exam Room.
B $4449,1,1 Direction indicator: face right.
W $444A,2,2 Guide the character up the staircase.
N $444C The fourth entry is used when C=3, which means the character is on the middle floor, to the right of the Exam Room wall.
B $444C,1,1 x-coordinate of the bottom of the stairs leading up from the Exam Room.
B $444D,1,1 Direction indicator: face right.
W $444E,2,2 Guide the character up the staircase.
N $4450 The fifth entry is unused (C cannot be 4).
B $4450,4,1*2,2
b $4454 Staircase endpoint data table 2
D $4454 Used by the routine at #A$12B5 when the region identifier for the character's current location (C) is greater than or equal to the destination region identifier. The first staircase endpoint data table is at #A$4440.
D $4454 The first entry is unused (C cannot be 0).
B $4454,4,1*2,2
N $4458 The second entry is used when C=1, which means the character is on the middle floor, to the left of the Exam Room wall.
B $4458,1,1 x-coordinate of the bottom of the stairs leading up to the head's study.
B $4459,1,1 Direction indicator: face left.
W $445A,2,2 Guide the character up the staircase.
N $445C The third entry is used when C=2, which means the character is on the bottom floor.
B $445C,1,1 x-coordinate of the bottom of the stairs leading up to the staff room.
B $445D,1,1 Direction indicator: face left.
W $445E,2,2 Guide the character up the staircase.
N $4460 The fourth entry is used when C=3, which means the character is on the middle floor, to the right of the Exam Room wall.
B $4460,1,1 x-coordinate of the top of the stairs leading down from the Exam Room.
B $4461,1,1 Direction indicator: face left.
W $4462,2,2 Guide the character down the staircase.
N $4464 The fifth entry is used when C=4, which means the character is on the top floor, to the right of the Map Room wall.
B $4464,1,1 x-coordinate of the top of the stairs leading down to the Exam Room.
B $4465,1,1 Direction indicator: face left.
W $4466,2,2 Guide the character down the staircase.
t $4468 Do you want to put in
D $4468 Used by the routine at #A$BE09. See also #A$8DE8.
B $4468,24,c21,3
w $4480 Addresses of command lists
D $4480 #ZX$FE80
D $4480 Used by the routine at #A$3AD5.
W $4480,2,2 Command list #R$4080($80): Map Room - teacher.
W $4482,2,2 Command list #R$4095($82): Reading Room - teacher.
W $4484,2,2 Command list #R$40AE($84): Exam Room - teacher.
W $4486,2,2 Command list #R$40C3($86): White Room - teacher.
W $4488,2,2 Command list #R$40DC($88): Map Room - little boy.
W $448A,2,2 Command list #R$40E5($8A): Do nothing.
W $448C,2,2 Command list #R$40E7($8C): Map Room - BOY WONDER.
W $448E,2,2 Command list #R$40FA($8E): Map Room - ANGELFACE.
W $4490,2,2 Command list #R$410D($90): Map Room - EINSTEIN.
W $4492,2,2 Command list #R$4118($92): Reading Room - little boy.
W $4494,2,2 Command list #R$4123($94): Reading Room - BOY WONDER.
W $4496,2,2 Command list #R$413D($96): Reading Room - ANGELFACE.
W $4498,2,2 Command list #R$4150($98): Reading Room - EINSTEIN.
W $449A,2,2 Command list #R$415B($9A): Exam Room - little boy.
W $449C,2,2 Command list #R$4166($9C): Exam Room - BOY WONDER.
W $449E,2,2 Command list #R$4180($9E): Exam Room - ANGELFACE.
W $44A0,2,2 Command list #R$4193($A0): Exam Room - EINSTEIN.
W $44A2,2,2 Command list #R$419E($A2): White Room - little boy.
W $44A4,2,2 Command list #R$41A9($A4): White Room - BOY WONDER.
W $44A6,2,2 Command list #R$41C3($A6): White Room - ANGELFACE.
W $44A8,2,2 Command list #R$41D6($A8): White Room - EINSTEIN.
W $44AA,2,2 Command list #R$41E1($AA): Dinner - EINSTEIN/little boy.
W $44AC,2,2 Command list #R$41E8($AC): Dinner - BOY WONDER.
W $44AE,2,2 Command list #R$41F7($AE): Dinner - ANGELFACE.
W $44B0,2,2 Command list #R$4206($B0): Revision Library - EINSTEIN/little boy.
W $44B2,2,2 Command list #R$420D($B2): Revision Library - BOY WONDER.
W $44B4,2,2 Command list #R$421C($B4): Revision Library - ANGELFACE.
W $44B6,2,2 Command list #R$422B($B6): Walkabout - ANGELFACE.
W $44B8,2,2 Command list #R$423B($B8): Dinner duty.
W $44BA,2,2 Command list #R$4247($BA): Head's study - MR WACKER.
W $44BC,2,2 Command list #R$424E($BC): Staff room - teacher.
W $44BE,2,2 Command list #R$4255($BE): Walkabout - teacher.
W $44C0,2,2 Command list #R$425D($C0): Write on the boards - BOY WONDER.
W $44C2,2,2 Command list #R$4272($C2): Walkabout - BOY WONDER.
W $44C4,2,2 Command list #R$4290($C4): Walkabout.
W $44C6,2,2 Command list #R$4298($C6): Walk around the fire escape.
W $44C8,2,2 Command list #R$429F($C8): Walk around the gym.
W $44CA,2,2 Command list #R$42A6($CA): Walk around the big window.
W $44CC,2,2 Command list #R$42AD($CC): Stampede - leader.
W $44CE,2,2 Command list #R$42CF($CE): Stampede - follower.
W $44D0,2,2 Command list #R$42E3($D0): Tell ERIC about BOY WONDER.
W $44D2,2,2 Command list #R$42FB($D2): Tell ERIC about ANGELFACE.
W $44D4,2,2 Command list #R$4309($D4): Grass on ERIC.
W $44D6,2,2 Command list #R$431F($D6): Wait for EINSTEIN to grass on ERIC.
W $44D8,2,2 Command list #R$4334($D8): Collect the pea-shooter.
W $44DA,2,2 Command list #R$4352($DA): Look for the pea-shooter.
W $44DC,2,2 Command list #R$436E($DC): Mumps walkabout.
W $44DE,2,2 Command list #R$4376($DE): Mumps duty.
W $44E0,2,2 Command list #R$438A($E0): Tell ERIC about EINSTEIN.
u $44E2 Unused
B $44E2,30,6,8
b $4500 Text graphic buffer
D $4500 Used by the routines at #A$20F5, #A$212A, #A$213B and #A$3868.
B $4500,256,16
t $4600 DEMO, - PRESS A KEY TO PLAY
D $4600 Used by the routine at #A$2573.
B $4600,32,c13,3,c13,3
t $4620 PRESS 'U' IF YOU UNDERSTAND
D $4620 Used by the routine at #A$28BC.
B $4620,32,c27,5
b $4640 Safe combination letter message buffer
D $4640 Used by the routine at #A$298B.
B $4640,4,2
u $4644 Unused
B $4644,12,4,8
b $4650 Initial lesson numbers
D $4650 Used by the routine at #A$2D47.
B $4650,1,1 #A$5D00: PLAYTIME
B $4651,1,1 #A$5D03: PLAYTIME
B $4652,1,1 #A$5D06: PLAYTIME
B $4653,1,1 #A$5D08: PLAYTIME
B $4654,1,1 #A$5D0C: MR CREAK - READING ROOM
B $4655,1,1 #A$5D0E: PLAYTIME
B $4656,1,1 #A$5D10: PLAYTIME
B $4657,1,1 #A$5D13: PLAYTIME
B $4658,1,1 #A$5D17: PLAYTIME
B $4659,1,1 #A$5D19: PLAYTIME (little boys stampede)
B $465A,1,1 #A$5D1D: PLAYTIME
B $465B,1,1 #A$5D20: PLAYTIME
B $465C,1,1 #A$5D24: PLAYTIME
B $465D,1,1 #A$5D27: PLAYTIME
B $465E,1,1 #A$5D29: PLAYTIME
B $465F,1,1 #A$5D2D: PLAYTIME
B $4660,1,1 #A$5D30: PLAYTIME
B $4661,1,1 #A$5D33: PLAYTIME
B $4662,1,1 #A$5D37: PLAYTIME
B $4663,1,1 #A$5D39: PLAYTIME
B $4664,1,1 #A$5D3D: MR WITHIT - WHITE ROOM
u $4665 Unused
B $4665,27,3,8
t $4680 WELL DONE! GO UP A YEAR
D $4680 Used by the routine at #A$2BB0.
B $4680,32,c13,3,c9,7
b $46A0 Skool region data table for the top floor
D $46A0 #ZX$7790
D $46A0 Used by the routine at #A$0D91.
B $46A0,2,2 Head's study (x<=8; always off-limits).
B $46A2,2,2 Head's study door to the Revision Library (8<x<=16).
B $46A4,2,2 Revision Library (16<x<=40).
B $46A6,2,2 Reading Room (40<x<=57).
B $46A8,2,2 Map Room (57<x<=74).
B $46AA,2,2 Map Room door to the fire escape (x>74).
b $46AC Skool region data table for the middle floor
D $46AC #ZX$779C
D $46AC Used by the routine at #A$0D91.
B $46AC,2,2 Staff room (x<=10; always off-limits).
B $46AE,2,2 Between the staff room and the White Room (10<x<=22).
B $46B0,2,2 White Room (22<x<=38).
B $46B2,2,2 Exam Room (38<x<=70).
B $46B4,2,2 Outside the Exam Room door (x>70).
b $46B6 Skool region data table for the bottom floor
D $46B6 #ZX$77A6
D $46B6 Used by the routine at #A$0D91.
B $46B6,2,2 Left of the dinner hall (x<=34).
B $46B8,2,2 Dinner hall (34<x<=51).
B $46BA,2,2 Right of the dinner hall (x>51).
u $46BC Unused
B $46BC,4,4
t $46C0 XX0 LINES
D $46C0 Used by the routine at #A$1DB7.
B $46C0,16,c9,7
B $46D0,1,1 The message number of the lines recipient's name is placed here.
B $46D1,15,7,8
b $46E0 Data table for question and answer messages
D $46E0 Used by the routine at #A$2241.
B $46E0,1,1 LSB of #A$5A1C (WHAT ELEMENT HAS THE SYMBOL Q?).
B $46E1,1,1 Index of the 'Q' in this message.
B $46E2,1,1 LSB of #A$5A3B (Please Sir I cannot tell a lie . . It is Q).
B $46E3,1,1 Index of the 'Q' in this message.
B $46E4,1,1 LSB of #A$5A80 (WHICH COUNTRY'S CAPITAL IS Q?).
B $46E5,1,1 Index of the 'Q' in this message.
B $46E6,1,1 LSB of #A$5A3B (Please Sir I cannot tell a lie . . It is Q).
B $46E7,1,1 Index of the 'Q' in this message.
B $46E8,1,1 LSB of #A$5AB8 (WHICH BATTLE OCCURRED IN Q?).
B $46E9,1,1 Index of the 'Q' in this message.
B $46EA,1,1 LSB of #A$5AE1 (Please Sir I cannot tell a lie . . It was the BATTLE OF Q).
B $46EB,1,1 Index of the 'Q' in this message.
B $46EC,1,1 LSB of #A$5A44 (WHAT IS THE CHEMICAL SYMBOL FOR Q?).
B $46ED,1,1 Index of the 'Q' in this message.
B $46EE,1,1 LSB of #A$5A3B (Please Sir I cannot tell a lie . . It is Q).
B $46EF,1,1 Index of the 'Q' in this message.
B $46F0,1,1 LSB of #A$5A67 (WHAT'S THE CAPITAL OF Q?).
B $46F1,1,1 Index of the 'Q' in this message.
B $46F2,1,1 LSB of #A$5A3B (Please Sir I cannot tell a lie . . It is Q).
B $46F3,1,1 Index of the 'Q' in this message.
B $46F4,1,1 LSB of #A$5A9E (WHEN WAS THE BATTLE OF Q?).
B $46F5,1,1 Index of the 'Q' in this message.
B $46F6,1,1 LSB of #A$5AD4 (Please Sir I cannot tell a lie . . It was in Q).
B $46F7,1,1 Index of the 'Q' in this message.
u $46F8 Unused
B $46F8,8,8
b $4700 Character name entry buffer
D $4700 Used by the routine at #A$BE09.
B $4700,12,8,4
u $470C Unused
B $470C,20,4,8
b $4720 Font character bitmap widths for CHR$(32-127)
D $4720 #ZX$D920
D $4720 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4720,96,8
t $4780 ERIC
D $4780 Used by the routines at #A$108B, #A$2005 and #A$BE09.
B $4780,14,c4,8,2
t $478E BOY WONDER
D $478E Used by the routines at #A$108B, #A$2005 and #A$BE09.
B $478E,14,c10,4
t $479C ANGELFACE
D $479C Used by the routines at #A$108B, #A$2005 and #A$BE09.
B $479C,14,c9,5
t $47AA EINSTEIN
D $47AA Used by the routines at #A$108B, #A$2005 and #A$BE09.
B $47AA,14,c8,6
t $47B8 MR WACKER
D $47B8 Used by the routines at #A$108B, #A$2005, #A$2573 and #A$BE09.
B $47B8,14,c9,5
t $47C6 MR ROCKITT
D $47C6 Used by the routines at #A$2005, #A$2573 and #A$BE09.
B $47C6,14,c10,4
t $47D4 MR WITHIT
D $47D4 Used by the routines at #A$2005, #A$2573 and #A$BE09.
B $47D4,14,c9,5
t $47E2 MR CREAK
D $47E2 Used by the routines at #A$2005, #A$2573 and #A$BE09.
B $47E2,14,c8,6
t $47F0 Please Sir - I cannot tell a lie . .
D $47F0 Used by the routine at #A$108B.
B $47F0,38,c37,1
t $4816 {8 spaces}
D $4816 Used by the routine at #A$246B.
B $4816,10,c8,2
b $4820 Font graphic data for CHR$(32-127) (pixel column 1)
D $4820 #ZX$DA20
D $4820 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4820,96,8
t $4880 REVISION
D $4880 Used by the routine at #A$2573.
B $4880,16,c8,8
t $4890 READING ROOM
D $4890 Used by the routine at #A$2573.
B $4890,16,c12,4
t $48A0 MAP ROOM
D $48A0 Used by the routine at #A$2573.
B $48A0,16,c8,8
t $48B0 WHITE ROOM
D $48B0 Used by the routine at #A$2573.
B $48B0,16,c10,6
t $48C0 EXAM ROOM
D $48C0 Used by the routine at #A$2573.
B $48C0,16,c9,7
t $48D0 LIBRARY
D $48D0 Used by the routine at #A$2573.
B $48D0,16,c7,8,1
t $48E0 DINNER
D $48E0 Used by the routine at #A$2573.
B $48E0,16,c6,8,2
t $48F0 PLAYTIME
D $48F0 Used by the routine at #A$2573.
B $48F0,16,c8,8
b $4900 Initial animatory states of the characters
D $4900 #ZX$DB00
D $4900 Used by the routine at #A$2E13. The characters' initial x-coordinates are located at #A$4A00.
B $4900,1,1 Little boy no. 1 (#AS$40($40) - standing, facing left)
B $4901,1,1 Little boy no. 2 (#AS$40($C0) - standing, facing right)
B $4902,1,1 Little boy no. 3 (#AS$40($40) - standing, facing left)
B $4903,1,1 Little boy no. 4 (#AS$40($C0) - standing, facing right)
B $4904,1,1 Little boy no. 5 (#AS$40($40) - standing, facing left)
B $4905,1,1 Little boy no. 6 (#AS$40($C0) - standing, facing right)
B $4906,1,1 Little boy no. 7 (#AS$40($40) - standing, facing left)
B $4907,1,1 Little boy no. 8 (#AS$40($C0) - standing, facing right)
B $4908,1,1 Little boy no. 9 (#AS$40($40) - standing, facing left)
B $4909,1,1 Little boy no. 10 (#AS$40($C0) - standing, facing right)
B $490A,1,1 Little boy no. 11 (#AS$40($40) - standing, facing left)
B $490B,1,1 MR WACKER (#AS$50($50) - standing, facing left)
B $490C,1,1 MR ROCKITT (#AS$58($58) - standing, facing left)
B $490D,1,1 MR WITHIT (#AS$60($60) - standing, facing left)
B $490E,1,1 MR CREAK (#AS$48($48) - standing, facing left)
B $490F,1,1 ANGELFACE (#AS$20($20) - standing, facing left)
B $4910,1,1 BOY WONDER (#AS$30($30) - standing, facing left)
B $4911,1,1 EINSTEIN (#AS$10($10) - standing, facing left)
B $4912,1,1 BOY WONDER's pellet (#AS$7F($7F))
B $4913,1,1 ERIC's pellet (#AS$7F($7F))
B $4914,1,1 ERIC (#AS$00($00) - standing, facing left)
u $4915 Unused
B $4915,11,8,3
b $4920 Font graphic data for CHR$(32-127) (pixel column 2)
D $4920 #ZX$DB20
D $4920 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4920,96,8
t $4980 DON'T SIT ON THE STAIRS
D $4980 Used by the routine at #A$149F.
B $4980,32,c12,4,c10,6
t $49A0 THE ROOM IS PRIVATE
D $49A0 Used by the routine at #A$149F.
B $49A0,32,c11,5,c7,8,1
t $49C0 GET TO WHERE YOU SHOULD BE
D $49C0 Used by the routine at #A$149F.
B $49C0,32,c12,4,c13,3
t $49E0 NOW FIND A SEAT
D $49E0 Used by the routine at #A$149F.
B $49E0,32,c8,8,c6,8,2
b $4A00 Initial x-coordinates of the characters
D $4A00 #ZX$DC00
D $4A00 Used by the routine at #A$2E13. The characters' initial animatory states are located at #A$4900.
B $4A00,1,1 Little boy no. 1
B $4A01,1,1 Little boy no. 2
B $4A02,1,1 Little boy no. 3
B $4A03,1,1 Little boy no. 4
B $4A04,1,1 Little boy no. 5
B $4A05,1,1 Little boy no. 6
B $4A06,1,1 Little boy no. 7
B $4A07,1,1 Little boy no. 8
B $4A08,1,1 Little boy no. 9
B $4A09,1,1 Little boy no. 10
B $4A0A,1,1 Little boy no. 11
B $4A0B,1,1 MR WACKER
B $4A0C,1,1 MR ROCKITT
B $4A0D,1,1 MR WITHIT
B $4A0E,1,1 MR CREAK
B $4A0F,1,1 ANGELFACE
B $4A10,1,1 BOY WONDER
B $4A11,1,1 EINSTEIN
B $4A12,1,1 BOY WONDER's pellet
B $4A13,1,1 ERIC's pellet
B $4A14,1,1 ERIC
u $4A15 Unused
B $4A15,11,8,3
b $4A20 Font graphic data for CHR$(32-127) (pixel column 3)
D $4A20 #ZX$DC20
D $4A20 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4A20,96,8
t $4A80 GET OFF THE FLOOR
D $4A80 Used by the routine at #A$149F.
B $4A80,32,c7,8,1,c9,7
t $4AA0 COME ALONG WITH ME BOY
D $4AA0 Used by the routine at #A$149F.
B $4AA0,32,c10,6,c11,5
t $4AC0 HURRY UP YOU HORROR
D $4AC0 Used by the routine at #A$149F.
B $4AC0,32,c12,4,c6,8,2
t $4AE0 DON'T TRY MY PATIENCE BOY
D $4AE0 Used by the routine at #A$149F.
B $4AE0,32,c12,4,c12,4
u $4B00 Unused
D $4B00 #ZX$DD00
D $4B00 These values are not used.
B $4B00,21,8*2,5
u $4B15 Unused
B $4B15,11,8,3
b $4B20 Font graphic data for CHR$(32-127) (pixel column 4)
D $4B20 #ZX$DD20
D $4B20 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4B20,96,8
t $4B80 NOW DON'T DO IT AGAIN
D $4B80 Used by the routines at #A$0A58 and #A$0ECF.
B $4B80,32,c9,7,c11,5
t $4BA0 DON'T TELL TALES
D $4BA0 Used by the routine at #A$2552.
B $4BA0,32,c10,6,c5,8,3
t $4BC0 NEVER BE LATE AGAIN
D $4BC0 Used by the routine at #A$0B3B.
B $4BC0,32,c8,8,c10,6
t $4BE0 AND STAY THIS TIME
D $4BE0 Used by the routine at #A$0B3B.
B $4BE0,32,c8,8,c9,7
t $4C00 TAKE 2000 LINES YOU NASTY BOY
D $4C00 Used by the routine at #A$277D.
B $4C00,29,c29
B $4C1D,1,1 #R$4816($03): 8 spaces
u $4C1E Unused
B $4C1E,2,2
b $4C20 Font graphic data for CHR$(32-127) (pixel column 5)
D $4C20 #ZX$DE20
D $4C20 Used by the routines at #A$11CF, #A$2156 and #A$246B.
B $4C20,96,8
t $4C80 DON'T TOUCH BLACKBOARDS
D $4C80 Used by the routine at #A$0A58.
B $4C80,32,c11,5,c11,5
t $4CA0 CATAPULTS ARE FORBIDDEN
D $4CA0 Used by the routine at #A$191B.
B $4CA0,32,c9,7,c13,3
t $4CC0 DON'T HIT YOUR MATES
D $4CC0 Used by the routine at #A$17E5.
B $4CC0,32,c9,7,c10,6
t $4CE0 YOU ARE NOT A KANGAROO
D $4CE0 Used by the routine at #A$189D.
B $4CE0,32,c11,5,c10,6
t $4D00 Sn
D $4D00 Question/answer word no. $80 for MR ROCKITT. The corresponding question/answer word (no. $81) is located at #A$4D0C. Used by the routine at #A$2241.
B $4D00,12,c2,10
t $4D0C Tin
D $4D0C Question/answer word no. $81 for MR ROCKITT. The corresponding question/answer word (no. $80) is located at #A$4D00. Used by the routine at #A$2241.
B $4D0C,12,c3,9
t $4D18 Hg
D $4D18 Question/answer word no. $82 for MR ROCKITT. The corresponding question/answer word (no. $83) is located at #A$4D24. Used by the routine at #A$2241.
B $4D18,12,c2,10
t $4D24 Mercury
D $4D24 Question/answer word no. $83 for MR ROCKITT. The corresponding question/answer word (no. $82) is located at #A$4D18. Used by the routine at #A$2241.
B $4D24,12,c7,5
t $4D30 Au
D $4D30 Question/answer word no. $84 for MR ROCKITT. The corresponding question/answer word (no. $85) is located at #A$4D3C. Used by the routine at #A$2241.
B $4D30,12,c2,10
t $4D3C Gold
D $4D3C Question/answer word no. $85 for MR ROCKITT. The corresponding question/answer word (no. $84) is located at #A$4D30. Used by the routine at #A$2241.
B $4D3C,12,c4,8
t $4D48 Ag
D $4D48 Question/answer word no. $86 for MR ROCKITT. The corresponding question/answer word (no. $87) is located at #A$4D54. Used by the routine at #A$2241.
B $4D48,12,c2,10
t $4D54 Silver
D $4D54 Question/answer word no. $87 for MR ROCKITT. The corresponding question/answer word (no. $86) is located at #A$4D48. Used by the routine at #A$2241.
B $4D54,12,c6,6
t $4D60 Pt
D $4D60 Question/answer word no. $88 for MR ROCKITT. The corresponding question/answer word (no. $89) is located at #A$4D6C. Used by the routine at #A$2241.
B $4D60,12,c2,10
t $4D6C Platinum
D $4D6C Question/answer word no. $89 for MR ROCKITT. The corresponding question/answer word (no. $88) is located at #A$4D60. Used by the routine at #A$2241.
B $4D6C,12,c8,4
t $4D78 Cu
D $4D78 Question/answer word no. $8A for MR ROCKITT. The corresponding question/answer word (no. $8B) is located at #A$4D84. Used by the routine at #A$2241.
B $4D78,12,c2,10
t $4D84 Copper
D $4D84 Question/answer word no. $8B for MR ROCKITT. The corresponding question/answer word (no. $8A) is located at #A$4D78. Used by the routine at #A$2241.
B $4D84,12,c6,6
t $4D90 Mg
D $4D90 Question/answer word no. $8C for MR ROCKITT. The corresponding question/answer word (no. $8D) is located at #A$4D9C. Used by the routine at #A$2241.
B $4D90,12,c2,10
t $4D9C Magnesium
D $4D9C Question/answer word no. $8D for MR ROCKITT. The corresponding question/answer word (no. $8C) is located at #A$4D90. Used by the routine at #A$2241.
B $4D9C,12,c9,3
t $4DA8 Pb
D $4DA8 Question/answer word no. $8E for MR ROCKITT. The corresponding question/answer word (no. $8F) is located at #A$4DB4. Used by the routine at #A$2241.
B $4DA8,12,c2,10
t $4DB4 Lead
D $4DB4 Question/answer word no. $8F for MR ROCKITT. The corresponding question/answer word (no. $8E) is located at #A$4DA8. Used by the routine at #A$2241.
B $4DB4,12,c4,8
t $4DC0 Mn
D $4DC0 Question/answer word no. $90 for MR ROCKITT. The corresponding question/answer word (no. $91) is located at #A$4DCC. Used by the routine at #A$2241.
B $4DC0,12,c2,10
t $4DCC Manganese
D $4DCC Question/answer word no. $91 for MR ROCKITT. The corresponding question/answer word (no. $90) is located at #A$4DC0. Used by the routine at #A$2241.
B $4DCC,12,c9,3
t $4DD8 Sb
D $4DD8 Question/answer word no. $92 for MR ROCKITT. The corresponding question/answer word (no. $93) is located at #A$4DE4. Used by the routine at #A$2241.
B $4DD8,12,c2,10
t $4DE4 Antimony
D $4DE4 Question/answer word no. $93 for MR ROCKITT. The corresponding question/answer word (no. $92) is located at #A$4DD8. Used by the routine at #A$2241.
B $4DE4,12,c8,4
t $4DF0 As
D $4DF0 Question/answer word no. $94 for MR ROCKITT. The corresponding question/answer word (no. $95) is located at #A$4DFC. Used by the routine at #A$2241.
B $4DF0,12,c2,10
t $4DFC Arsenic
D $4DFC Question/answer word no. $95 for MR ROCKITT. The corresponding question/answer word (no. $94) is located at #A$4DF0. Used by the routine at #A$2241.
B $4DFC,12,c7,5
t $4E08 K
D $4E08 Question/answer word no. $96 for MR ROCKITT. The corresponding question/answer word (no. $97) is located at #A$4E14. Used by the routine at #A$2241.
B $4E08,12,c1,11
t $4E14 Potassium
D $4E14 Question/answer word no. $97 for MR ROCKITT. The corresponding question/answer word (no. $96) is located at #A$4E08. Used by the routine at #A$2241.
B $4E14,12,c9,3
t $4E20 Na
D $4E20 Question/answer word no. $98 for MR ROCKITT. The corresponding question/answer word (no. $99) is located at #A$4E2C. Used by the routine at #A$2241.
B $4E20,12,c2,10
t $4E2C Sodium
D $4E2C Question/answer word no. $99 for MR ROCKITT. The corresponding question/answer word (no. $98) is located at #A$4E20. Used by the routine at #A$2241.
B $4E2C,12,c6,6
t $4E38 Cl
D $4E38 Question/answer word no. $9A for MR ROCKITT. The corresponding question/answer word (no. $9B) is located at #A$4E44. Used by the routine at #A$2241.
B $4E38,12,c2,10
t $4E44 Chlorine
D $4E44 Question/answer word no. $9B for MR ROCKITT. The corresponding question/answer word (no. $9A) is located at #A$4E38. Used by the routine at #A$2241.
B $4E44,12,c8,4
t $4E50 Zn
D $4E50 Question/answer word no. $9C for MR ROCKITT. The corresponding question/answer word (no. $9D) is located at #A$4E5C. Used by the routine at #A$2241.
B $4E50,12,c2,10
t $4E5C Zinc
D $4E5C Question/answer word no. $9D for MR ROCKITT. The corresponding question/answer word (no. $9C) is located at #A$4E50. Used by the routine at #A$2241.
B $4E5C,12,c4,8
t $4E68 W
D $4E68 Question/answer word no. $9E for MR ROCKITT. The corresponding question/answer word (no. $9F) is located at #A$4E74. Used by the routine at #A$2241.
B $4E68,12,c1,11
t $4E74 Tungsten
D $4E74 Question/answer word no. $9F for MR ROCKITT. The corresponding question/answer word (no. $9E) is located at #A$4E68. Used by the routine at #A$2241.
B $4E74,12,c8,4
t $4E80 Cs
D $4E80 Question/answer word no. $A0 for MR ROCKITT. The corresponding question/answer word (no. $A1) is located at #A$4E8C. Used by the routine at #A$2241.
B $4E80,12,c2,10
t $4E8C Caesium
D $4E8C Question/answer word no. $A1 for MR ROCKITT. The corresponding question/answer word (no. $A0) is located at #A$4E80. Used by the routine at #A$2241.
B $4E8C,12,c7,5
t $4E98 Si
D $4E98 Question/answer word no. $A2 for MR ROCKITT. The corresponding question/answer word (no. $A3) is located at #A$4EA4. Used by the routine at #A$2241.
B $4E98,12,c2,10
t $4EA4 Silicon
D $4EA4 Question/answer word no. $A3 for MR ROCKITT. The corresponding question/answer word (no. $A2) is located at #A$4E98. Used by the routine at #A$2241.
B $4EA4,12,c7,5
t $4EB0 P
D $4EB0 Question/answer word no. $A4 for MR ROCKITT. The corresponding question/answer word (no. $A5) is located at #A$4EBC. Used by the routine at #A$2241.
B $4EB0,12,c1,11
t $4EBC Phosphorous
D $4EBC Question/answer word no. $A5 for MR ROCKITT. The corresponding question/answer word (no. $A4) is located at #A$4EB0. Used by the routine at #A$2241.
B $4EBC,12,c11,1
t $4EC8 Br
D $4EC8 Question/answer word no. $A6 for MR ROCKITT. The corresponding question/answer word (no. $A7) is located at #A$4ED4. Used by the routine at #A$2241.
B $4EC8,12,c2,10
t $4ED4 Bromine
D $4ED4 Question/answer word no. $A7 for MR ROCKITT. The corresponding question/answer word (no. $A6) is located at #A$4EC8. Used by the routine at #A$2241.
B $4ED4,12,c7,5
t $4EE0 H
D $4EE0 Question/answer word no. $A8 for MR ROCKITT. The corresponding question/answer word (no. $A9) is located at #A$4EEC. Used by the routine at #A$2241.
B $4EE0,12,c1,11
t $4EEC Hydrogen
D $4EEC Question/answer word no. $A9 for MR ROCKITT. The corresponding question/answer word (no. $A8) is located at #A$4EE0. Used by the routine at #A$2241.
B $4EEC,12,c8,4
t $4EF8 Berne
D $4EF8 Question/answer word no. $AA for MR WITHIT. The corresponding question/answer word (no. $AB) is located at #A$4F04. Used by the routine at #A$2241.
B $4EF8,12,c5,7
t $4F04 Switzerland
D $4F04 Question/answer word no. $AB for MR WITHIT. The corresponding question/answer word (no. $AA) is located at #A$4EF8. Used by the routine at #A$2241.
B $4F04,12,c11,1
t $4F10 Helsinki
D $4F10 Question/answer word no. $AC for MR WITHIT. The corresponding question/answer word (no. $AD) is located at #A$4F1C. Used by the routine at #A$2241.
B $4F10,12,c8,4
t $4F1C Finland
D $4F1C Question/answer word no. $AD for MR WITHIT. The corresponding question/answer word (no. $AC) is located at #A$4F10. Used by the routine at #A$2241.
B $4F1C,12,c7,5
t $4F28 Reykjavik
D $4F28 Question/answer word no. $AE for MR WITHIT. The corresponding question/answer word (no. $AF) is located at #A$4F34. Used by the routine at #A$2241.
B $4F28,12,c9,3
t $4F34 Iceland
D $4F34 Question/answer word no. $AF for MR WITHIT. The corresponding question/answer word (no. $AE) is located at #A$4F28. Used by the routine at #A$2241.
B $4F34,12,c7,5
t $4F40 Budapest
D $4F40 Question/answer word no. $B0 for MR WITHIT. The corresponding question/answer word (no. $B1) is located at #A$4F4C. Used by the routine at #A$2241.
B $4F40,12,c8,4
t $4F4C Hungary
D $4F4C Question/answer word no. $B1 for MR WITHIT. The corresponding question/answer word (no. $B0) is located at #A$4F40. Used by the routine at #A$2241.
B $4F4C,12,c7,5
t $4F58 Bucharest
D $4F58 Question/answer word no. $B2 for MR WITHIT. The corresponding question/answer word (no. $B3) is located at #A$4F64. Used by the routine at #A$2241.
B $4F58,12,c9,3
t $4F64 Romania
D $4F64 Question/answer word no. $B3 for MR WITHIT. The corresponding question/answer word (no. $B2) is located at #A$4F58. Used by the routine at #A$2241.
B $4F64,12,c7,5
t $4F70 Tirana
D $4F70 Question/answer word no. $B4 for MR WITHIT. The corresponding question/answer word (no. $B5) is located at #A$4F7C. Used by the routine at #A$2241.
B $4F70,12,c6,6
t $4F7C Albania
D $4F7C Question/answer word no. $B5 for MR WITHIT. The corresponding question/answer word (no. $B4) is located at #A$4F70. Used by the routine at #A$2241.
B $4F7C,12,c7,5
t $4F88 Jakarta
D $4F88 Question/answer word no. $B6 for MR WITHIT. The corresponding question/answer word (no. $B7) is located at #A$4F94. Used by the routine at #A$2241.
B $4F88,12,c7,5
t $4F94 Indonesia
D $4F94 Question/answer word no. $B7 for MR WITHIT. The corresponding question/answer word (no. $B6) is located at #A$4F88. Used by the routine at #A$2241.
B $4F94,12,c9,3
t $4FA0 Pyongyang
D $4FA0 Question/answer word no. $B8 for MR WITHIT. The corresponding question/answer word (no. $B9) is located at #A$4FAC. Used by the routine at #A$2241.
B $4FA0,12,c9,3
t $4FAC North Korea
D $4FAC Question/answer word no. $B9 for MR WITHIT. The corresponding question/answer word (no. $B8) is located at #A$4FA0. Used by the routine at #A$2241.
B $4FAC,12,c11,1
t $4FB8 Vientiane
D $4FB8 Question/answer word no. $BA for MR WITHIT. The corresponding question/answer word (no. $BB) is located at #A$4FC4. Used by the routine at #A$2241.
B $4FB8,12,c9,3
t $4FC4 Laos
D $4FC4 Question/answer word no. $BB for MR WITHIT. The corresponding question/answer word (no. $BA) is located at #A$4FB8. Used by the routine at #A$2241.
B $4FC4,12,c4,8
t $4FD0 Islamabad
D $4FD0 Question/answer word no. $BC for MR WITHIT. The corresponding question/answer word (no. $BD) is located at #A$4FDC. Used by the routine at #A$2241.
B $4FD0,12,c9,3
t $4FDC Pakistan
D $4FDC Question/answer word no. $BD for MR WITHIT. The corresponding question/answer word (no. $BC) is located at #A$4FD0. Used by the routine at #A$2241.
B $4FDC,12,c8,4
t $4FE8 Rangoon
D $4FE8 Question/answer word no. $BE for MR WITHIT. The corresponding question/answer word (no. $BF) is located at #A$4FF4. Used by the routine at #A$2241.
B $4FE8,12,c7,5
t $4FF4 Burma
D $4FF4 Question/answer word no. $BF for MR WITHIT. The corresponding question/answer word (no. $BE) is located at #A$4FE8. Used by the routine at #A$2241.
B $4FF4,12,c5,7
t $5000 Ankara
D $5000 Question/answer word no. $C0 for MR WITHIT. The corresponding question/answer word (no. $C1) is located at #A$500C. Used by the routine at #A$2241.
B $5000,12,c6,6
t $500C Turkey
D $500C Question/answer word no. $C1 for MR WITHIT. The corresponding question/answer word (no. $C0) is located at #A$5000. Used by the routine at #A$2241.
B $500C,12,c6,6
t $5018 Amman
D $5018 Question/answer word no. $C2 for MR WITHIT. The corresponding question/answer word (no. $C3) is located at #A$5024. Used by the routine at #A$2241.
B $5018,12,c5,7
t $5024 Jordan
D $5024 Question/answer word no. $C3 for MR WITHIT. The corresponding question/answer word (no. $C2) is located at #A$5018. Used by the routine at #A$2241.
B $5024,12,c6,6
t $5030 Gabarone
D $5030 Question/answer word no. $C4 for MR WITHIT. The corresponding question/answer word (no. $C5) is located at #A$503C. Used by the routine at #A$2241.
B $5030,12,c8,4
t $503C Botswana
D $503C Question/answer word no. $C5 for MR WITHIT. The corresponding question/answer word (no. $C4) is located at #A$5030. Used by the routine at #A$2241.
B $503C,12,c8,4
t $5048 Lusaka
D $5048 Question/answer word no. $C6 for MR WITHIT. The corresponding question/answer word (no. $C7) is located at #A$5054. Used by the routine at #A$2241.
B $5048,12,c6,6
t $5054 Zambia
D $5054 Question/answer word no. $C7 for MR WITHIT. The corresponding question/answer word (no. $C6) is located at #A$5048. Used by the routine at #A$2241.
B $5054,12,c6,6
t $5060 Monrovia
D $5060 Question/answer word no. $C8 for MR WITHIT. The corresponding question/answer word (no. $C9) is located at #A$506C. Used by the routine at #A$2241.
B $5060,12,c8,4
t $506C Liberia
D $506C Question/answer word no. $C9 for MR WITHIT. The corresponding question/answer word (no. $C8) is located at #A$5060. Used by the routine at #A$2241.
B $506C,12,c7,5
t $5078 La Paz
D $5078 Question/answer word no. $CA for MR WITHIT. The corresponding question/answer word (no. $CB) is located at #A$5084. Used by the routine at #A$2241.
B $5078,12,c6,6
t $5084 Bolivia
D $5084 Question/answer word no. $CB for MR WITHIT. The corresponding question/answer word (no. $CA) is located at #A$5078. Used by the routine at #A$2241.
B $5084,12,c7,5
t $5090 Caracas
D $5090 Question/answer word no. $CC for MR WITHIT. The corresponding question/answer word (no. $CD) is located at #A$509C. Used by the routine at #A$2241.
B $5090,12,c7,5
t $509C Venezuela
D $509C Question/answer word no. $CD for MR WITHIT. The corresponding question/answer word (no. $CC) is located at #A$5090. Used by the routine at #A$2241.
B $509C,12,c9,3
t $50A8 Quito
D $50A8 Question/answer word no. $CE for MR WITHIT. The corresponding question/answer word (no. $CF) is located at #A$50B4. Used by the routine at #A$2241.
B $50A8,12,c5,7
t $50B4 Ecuador
D $50B4 Question/answer word no. $CF for MR WITHIT. The corresponding question/answer word (no. $CE) is located at #A$50A8. Used by the routine at #A$2241.
B $50B4,12,c7,5
t $50C0 Paramaribo
D $50C0 Question/answer word no. $D0 for MR WITHIT. The corresponding question/answer word (no. $D1) is located at #A$50CC. Used by the routine at #A$2241.
B $50C0,12,c10,2
t $50CC Surinam
D $50CC Question/answer word no. $D1 for MR WITHIT. The corresponding question/answer word (no. $D0) is located at #A$50C0. Used by the routine at #A$2241.
B $50CC,12,c7,5
t $50D8 Santiago
D $50D8 Question/answer word no. $D2 for MR WITHIT. The corresponding question/answer word (no. $D3) is located at #A$50E4. Used by the routine at #A$2241.
B $50D8,12,c8,4
t $50E4 Chile
D $50E4 Question/answer word no. $D3 for MR WITHIT. The corresponding question/answer word (no. $D2) is located at #A$50D8. Used by the routine at #A$2241.
B $50E4,12,c5,7
t $50F0 1066
D $50F0 Question/answer word no. $D4 for MR CREAK. The corresponding question/answer word (no. $D5) is located at #A$50FC. Used by the routine at #A$2241.
B $50F0,12,c4,8
t $50FC Hastings
D $50FC Question/answer word no. $D5 for MR CREAK. The corresponding question/answer word (no. $D4) is located at #A$50F0. Used by the routine at #A$2241.
B $50FC,12,c8,4
t $5108 1265
D $5108 Question/answer word no. $D6 for MR CREAK. The corresponding question/answer word (no. $D7) is located at #A$5114. Used by the routine at #A$2241.
B $5108,12,c4,8
t $5114 Evesham
D $5114 Question/answer word no. $D7 for MR CREAK. The corresponding question/answer word (no. $D6) is located at #A$5108. Used by the routine at #A$2241.
B $5114,12,c7,5
t $5120 1314
D $5120 Question/answer word no. $D8 for MR CREAK. The corresponding question/answer word (no. $D9) is located at #A$512C. Used by the routine at #A$2241.
B $5120,12,c4,8
t $512C Bannockburn
D $512C Question/answer word no. $D9 for MR CREAK. The corresponding question/answer word (no. $D8) is located at #A$5120. Used by the routine at #A$2241.
B $512C,12,c11,1
t $5138 1346
D $5138 Question/answer word no. $DA for MR CREAK. The corresponding question/answer word (no. $DB) is located at #A$5144. Used by the routine at #A$2241.
B $5138,12,c4,8
t $5144 Crecy
D $5144 Question/answer word no. $DB for MR CREAK. The corresponding question/answer word (no. $DA) is located at #A$5138. Used by the routine at #A$2241.
B $5144,12,c5,7
t $5150 1356
D $5150 Question/answer word no. $DC for MR CREAK. The corresponding question/answer word (no. $DD) is located at #A$515C. Used by the routine at #A$2241.
B $5150,12,c4,8
t $515C Poitiers
D $515C Question/answer word no. $DD for MR CREAK. The corresponding question/answer word (no. $DC) is located at #A$5150. Used by the routine at #A$2241.
B $515C,12,c8,4
t $5168 1403
D $5168 Question/answer word no. $DE for MR CREAK. The corresponding question/answer word (no. $DF) is located at #A$5174. Used by the routine at #A$2241.
B $5168,12,c4,8
t $5174 Shrewsbury
D $5174 Question/answer word no. $DF for MR CREAK. The corresponding question/answer word (no. $DE) is located at #A$5168. Used by the routine at #A$2241.
B $5174,12,c10,2
t $5180 1415
D $5180 Question/answer word no. $E0 for MR CREAK. The corresponding question/answer word (no. $E1) is located at #A$518C. Used by the routine at #A$2241.
B $5180,12,c4,8
t $518C Agincourt
D $518C Question/answer word no. $E1 for MR CREAK. The corresponding question/answer word (no. $E0) is located at #A$5180. Used by the routine at #A$2241.
B $518C,12,c9,3
t $5198 1485
D $5198 Question/answer word no. $E2 for MR CREAK. The corresponding question/answer word (no. $E3) is located at #A$51A4. Used by the routine at #A$2241.
B $5198,12,c4,8
t $51A4 Bosworth
D $51A4 Question/answer word no. $E3 for MR CREAK. The corresponding question/answer word (no. $E2) is located at #A$5198. Used by the routine at #A$2241.
B $51A4,12,c8,4
t $51B0 1513
D $51B0 Question/answer word no. $E4 for MR CREAK. The corresponding question/answer word (no. $E5) is located at #A$51BC. Used by the routine at #A$2241.
B $51B0,12,c4,8
t $51BC Flodden
D $51BC Question/answer word no. $E5 for MR CREAK. The corresponding question/answer word (no. $E4) is located at #A$51B0. Used by the routine at #A$2241.
B $51BC,12,c7,5
t $51C8 1571
D $51C8 Question/answer word no. $E6 for MR CREAK. The corresponding question/answer word (no. $E7) is located at #A$51D4. Used by the routine at #A$2241.
B $51C8,12,c4,8
t $51D4 Lepanto
D $51D4 Question/answer word no. $E7 for MR CREAK. The corresponding question/answer word (no. $E6) is located at #A$51C8. Used by the routine at #A$2241.
B $51D4,12,c7,5
t $51E0 1014
D $51E0 Question/answer word no. $E8 for MR CREAK. The corresponding question/answer word (no. $E9) is located at #A$51EC. Used by the routine at #A$2241.
B $51E0,12,c4,8
t $51EC Clontarf
D $51EC Question/answer word no. $E9 for MR CREAK. The corresponding question/answer word (no. $E8) is located at #A$51E0. Used by the routine at #A$2241.
B $51EC,12,c8,1,c3
t $51F8 1685
D $51F8 Question/answer word no. $EA for MR CREAK. The corresponding question/answer word (no. $EB) is located at #A$5204. Used by the routine at #A$2241.
B $51F8,12,c4,8
t $5204 Sedgemoor
D $5204 Question/answer word no. $EB for MR CREAK. The corresponding question/answer word (no. $EA) is located at #A$51F8. Used by the routine at #A$2241.
B $5204,12,c9,3
t $5210 1746
D $5210 Question/answer word no. $EC for MR CREAK. The corresponding question/answer word (no. $ED) is located at #A$521C. Used by the routine at #A$2241.
B $5210,12,c4,8
t $521C Culloden
D $521C Question/answer word no. $ED for MR CREAK. The corresponding question/answer word (no. $EC) is located at #A$5210. Used by the routine at #A$2241.
B $521C,12,c8,4
t $5228 1775
D $5228 Question/answer word no. $EE for MR CREAK. The corresponding question/answer word (no. $EF) is located at #A$5234. Used by the routine at #A$2241.
B $5228,12,c4,8
t $5234 Lexington
D $5234 Question/answer word no. $EF for MR CREAK. The corresponding question/answer word (no. $EE) is located at #A$5228. Used by the routine at #A$2241.
B $5234,12,c9,3
t $5240 1781
D $5240 Question/answer word no. $F0 for MR CREAK. The corresponding question/answer word (no. $F1) is located at #A$524C. Used by the routine at #A$2241.
B $5240,12,c4,8
t $524C Yorktown
D $524C Question/answer word no. $F1 for MR CREAK. The corresponding question/answer word (no. $F0) is located at #A$5240. Used by the routine at #A$2241.
B $524C,12,c8,4
t $5258 1805
D $5258 Question/answer word no. $F2 for MR CREAK. The corresponding question/answer word (no. $F3) is located at #A$5264. Used by the routine at #A$2241.
B $5258,12,c4,8
t $5264 Trafalgar
D $5264 Question/answer word no. $F3 for MR CREAK. The corresponding question/answer word (no. $F2) is located at #A$5258. Used by the routine at #A$2241.
B $5264,12,c9,3
t $5270 1815
D $5270 Question/answer word no. $F4 for MR CREAK. The corresponding question/answer word (no. $F5) is located at #A$527C. Used by the routine at #A$2241.
B $5270,12,c4,8
t $527C Waterloo
D $527C Question/answer word no. $F5 for MR CREAK. The corresponding question/answer word (no. $F4) is located at #A$5270. Used by the routine at #A$2241.
B $527C,12,c8,4
t $5288 1812
D $5288 Question/answer word no. $F6 for MR CREAK. The corresponding question/answer word (no. $F7) is located at #A$5294. Used by the routine at #A$2241.
B $5288,12,c4,8
t $5294 Borodino
D $5294 Question/answer word no. $F7 for MR CREAK. The corresponding question/answer word (no. $F6) is located at #A$5288. Used by the routine at #A$2241.
B $5294,12,c8,4
t $52A0 1836
D $52A0 Question/answer word no. $F8 for MR CREAK. The corresponding question/answer word (no. $F9) is located at #A$52AC. Used by the routine at #A$2241.
B $52A0,12,c4,8
t $52AC San Jacinto
D $52AC Question/answer word no. $F9 for MR CREAK. The corresponding question/answer word (no. $F8) is located at #A$52A0. Used by the routine at #A$2241.
B $52AC,12,c11,1
t $52B8 1863
D $52B8 Question/answer word no. $FA for MR CREAK. The corresponding question/answer word (no. $FB) is located at #A$52C4. Used by the routine at #A$2241.
B $52B8,12,c4,8
t $52C4 Gettysburg
D $52C4 Question/answer word no. $FB for MR CREAK. The corresponding question/answer word (no. $FA) is located at #A$52B8. Used by the routine at #A$2241.
B $52C4,12,c10,2
t $52D0 1854
D $52D0 Question/answer word no. $FC for MR CREAK. The corresponding question/answer word (no. $FD) is located at #A$52DC. Used by the routine at #A$2241.
B $52D0,12,c4,8
t $52DC Balaclava
D $52DC Question/answer word no. $FD for MR CREAK. The corresponding question/answer word (no. $FC) is located at #A$52D0. Used by the routine at #A$2241.
B $52DC,12,c9,3
u $52E8 Unused
D $52E8 #ZX$E4E8
B $52E8,4,c4
u $52EC Z80 code remnants
D $52EC #ZX$E4EC
B $52EC,1,1 DI
B $52ED,2,2 LD C,$10
B $52EF,3,3 LD HL,$FE17
B $52F2,2,2 LD A,$01
B $52F4,3,3 LD DE,$4000
B $52F7,3,3 CALL $FE62
B $52FA,1,1 DEC C
B $52FB,2,2 JR NZ,$E4EF
B $52FD,1,1 EI
B $52FE,1,1 RET
B $52FF,1,1
t $5300 THE 47 TIMES TABLE
D $5300 Used by the routine at #A$1129.
B $5300,32,c12,1,c5,8,6
t $5320 QUADRATIC EQUATIONS
D $5320 Used by the routine at #A$1129.
B $5320,32,c9,1,c9,8,5
t $5340 WHY SUMS ARE FUN
D $5340 Used by the routine at #A$1129.
B $5340,32,c12,1,c3,8
t $5360 VECTORS AND MATRICES
D $5360 Used by the routine at #A$1129.
B $5360,32,c11,1,c8,8,4
t $5380 ISOSCELES TRIANGLES
D $5380 Used by the routine at #A$1129.
B $5380,32,c9,1,c9,8,5
t $53A0 PYTHAGORAS THEOREM
D $53A0 Used by the routine at #A$1129.
B $53A0,32,c10,1,c7,8,6
t $53C0 FACTORS
D $53C0 Used by the routine at #A$1129.
B $53C0,32,c7,8*3,1
t $53E0 THE AREA OF A CIRCLE
D $53E0 Used by the routine at #A$1129.
B $53E0,32,c11,1,c8,8,4
t $5400 The Periodic Table
D $5400 Used by the routine at #A$1129.
B $5400,32,c12,1,c5,8,6
t $5420 Splitting The Atom
D $5420 Used by the routine at #A$1129.
B $5420,32,c9,1,c8,8,6
t $5440 Explosions I have known
D $5440 Used by the routine at #A$1129.
B $5440,32,c12,1,c10,8,1
t $5460 How to blow yourself up
D $5460 Used by the routine at #A$1129.
B $5460,32,c11,1,c11,8,1
t $5480 Things to do with TNT
D $5480 Used by the routine at #A$1129.
B $5480,32,c12,1,c8,8,3
t $54A0 Chemistry of dynamite
D $54A0 Used by the routine at #A$1129.
B $54A0,32,c9,1,c11,8,3
t $54C0 First aid for chemists
D $54C0 Used by the routine at #A$1129.
B $54C0,32,c9,1,c12,8,2
t $54E0 Fast ways to open doors
D $54E0 Used by the routine at #A$1129.
B $54E0,32,c12,1,c10,8,1
t $5500 WHY IT RAINS IN MANCHESTER
D $5500 Used by the routine at #A$1129.
B $5500,32,c12,1,c13,6
t $5520 THE CLIMATE OF CLAPHAM
D $5520 Used by the routine at #A$1129.
B $5520,32,c11,1,c10,8,2
t $5540 THE MOUNTAINS OF PERU
D $5540 Used by the routine at #A$1129.
B $5540,32,c13,1,c7,8,3
t $5560 THE DONCASTER RAIN-FOREST
D $5560 Used by the routine at #A$1129.
B $5560,32,c13,1,c11,7
t $5580 THE EXPORTS OF FIJI
D $5580 Used by the routine at #A$1129.
B $5580,32,c11,1,c7,8,5
t $55A0 ACTIVE VOLCANOES
D $55A0 Used by the routine at #A$1129.
B $55A0,32,c6,1,c9,8
t $55C0 POP MUSIC IN ANTARCTICA
D $55C0 Used by the routine at #A$1129.
B $55C0,32,c12,1,c10,8,1
t $55E0 THE UPLANDS OF RUTLAND
D $55E0 Used by the routine at #A$1129.
B $55E0,32,c11,1,c10,8,2
t $5600 Industrial Revolution
D $5600 Used by the routine at #A$1129.
B $5600,32,c10,1,c10,8,3
t $5620 The Norman Conquest
D $5620 Used by the routine at #A$1129.
B $5620,32,c10,1,c8,8,5
t $5640 The Wars of the Roses
D $5640 Used by the routine at #A$1129.
B $5640,32,c11,1,c9,8,3
t $5660 The Spanish Armada
D $5660 Used by the routine at #A$1129.
B $5660,32,c11,1,c6,8,6
t $5680 The First Crusade
D $5680 Used by the routine at #A$1129.
B $5680,32,c9,1,c7,8,7
t $56A0 Magna Carta
D $56A0 Used by the routine at #A$1129.
B $56A0,32,c11,8*2,5
t $56C0 The Boston Tea Party
D $56C0 Used by the routine at #A$1129.
B $56C0,32,c10,1,c9,8,4
t $56E0 The Black Death
D $56E0 Used by the routine at #A$1129.
B $56E0,32,c9,1,c5,8*2,1
t $5700 i hate fizziks
D $5700 Used by the routine at #A$1129.
B $5700,32,c6,1,c7,8*2,2
t $5720 i hate sums
D $5720 Used by the routine at #A$1129.
B $5720,32,c11,8*2,5
t $5740 skool rools o k
D $5740 Used by the routine at #A$1129.
B $5740,32,c11,1,c3,8*2,1
t $5760 i hate skool
D $5760 Used by the routine at #A$1129.
B $5760,32,c12,8*2,4
t $5780 speling iz boaring
D $5780 Used by the routine at #A$1129.
B $5780,32,c10,1,c7,8,6
t $57A0 i love WHEELIE
D $57A0 Used by the routine at #A$1129.
B $57A0,32,c6,1,c7,8*2,2
t $57C0 SKYRANGER is grate
D $57C0 Used by the routine at #A$1129.
B $57C0,32,c9,1,c8,8,6
t $57E0 skool dinners are orrible
D $57E0 Used by the routine at #A$1129.
B $57E0,32,c13,1,c11,7
u $5800 Unused
D $5800 These are remnants of the attributes and graphic data for the score box graphic from the ZX Spectrum version (see #A$5820).
B $5800,32,8
b $5820 Score box graphic
D $5820 #ZX$EE00
D $5820 Used by the routine at #A$2F56. The colour information for the score box can be found at #A$5D48.
D $5820 #UDGTABLE { #UDGARRAY8,$05;$5820-$58D8-8(scorebox) } TABLE#
B $5820,192,8
b $58E0 Shield locations and status
D $58E0 Used by the routines at #A$2BB0, #A$2E13 and #A$39C7. Each 3-byte entry in this table corresponds to a shield. The first two bytes of each entry are the shield's coordinates. The third byte indicates whether the shield has been hit.
B $58E0,3,3 Shield on the left in the head's study.
B $58E3,3,3 Shield on the right in the head's study.
B $58E6,3,3 Shield on the left in the Reading Room.
B $58E9,3,3 Shield on the right in the Reading Room.
B $58EC,3,3 Shield outside the Map Room doorway.
B $58EF,3,3 Leftmost shield in the Exam Room.
B $58F2,3,3 Second shield from the left in the Exam Room.
B $58F5,3,3 Middle shield in the Exam Room.
B $58F8,3,3 Second shield from the right in the Exam Room.
B $58FB,3,3 Rightmost shield in the Exam Room.
B $58FE,3,3 Leftmost shield of the three to the left of the dinner hall.
B $5901,3,3 Middle shield of the three to the left of the dinner hall.
B $5904,3,3 Rightmost shield of the three to the left of the dinner hall.
B $5907,3,3 Leftmost shield of the two to the right of the dinner hall.
B $590A,3,3 Rightmost shield of the two to the right of the dinner hall.
u $590D Unused
B $590D,19,3,8
b $5920 Skool Daze logo
D $5920 #ZX$EF00
D $5920 Used by the routine at #A$2F20. The colour information for the logo can be found at #A$5D48.
D $5920 #UDGTABLE { #UDGARRAY8,$14;$5920-$59D8-8({ImagePath}/logo) } TABLE#
B $5920,192,8
u $59E0 Z80 code remnants
D $59E0 #ZX$EFE0
B $59E0,3,3 LD HL,$1B00
B $59E3,2,2 LD B,$08
B $59E5,1,1 LD (HL),B
B $59E6,1,1 PUSH BC
B $59E7,3,3 CALL $B0E8
B $59EA,1,1 PUSH HL
B $59EB,3,3 CALL $B6E8
B $59EE,1,1 POP HL
B $59EF,3,3 CALL Z,$B868
B $59F2,2,2 JR Z,$59EF
B $59F4,3,3 CALL $B5E8
B $59F7,1,1 POP BC
B $59F8,2,2 DJNZ $59E6
B $59FA,3,3 LD HL,$611B
B $59FD,2,2 LD (HL),$7E
B $59FF,1,1 RET
t $5A00 WHAT IS 12 x 34?
D $5A00 Used by the routine at #A$2241.
B $5A00,16,c16
B $5A10,1,1 #R$4816($03): 8 spaces
t $5A11 {Please Sir I cannot tell a lie . . }It's 1234
D $5A11 Used by the routine at #A$2241.
B $5A11,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5A12,9,c9
B $5A1B,1,1 #R$4816($03): 8 spaces
t $5A1C WHAT ELEMENT HAS THE SYMBOL Q?
D $5A1C Used by the routine at #A$2241.
B $5A1C,30,c30
B $5A3A,1,1 #R$4816($03): 8 spaces
t $5A3B {Please Sir I cannot tell a lie . . }It is Q
D $5A3B Used by the routine at #A$2241.
B $5A3B,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5A3C,7,c7
B $5A43,1,1 #R$4816($03): 8 spaces
t $5A44 WHAT IS THE CHEMICAL SYMBOL FOR Q?
D $5A44 Used by the routine at #A$2241.
B $5A44,34,c34
B $5A66,1,1 #R$4816($03): 8 spaces
t $5A67 WHAT'S THE CAPITAL OF Q?
D $5A67 Used by the routine at #A$2241.
B $5A67,24,c24
B $5A7F,1,1 #R$4816($03): 8 spaces
t $5A80 WHICH COUNTRY'S CAPITAL IS Q?
D $5A80 Used by the routine at #A$2241.
B $5A80,29,c29
B $5A9D,1,1 #R$4816($03): 8 spaces
t $5A9E WHEN WAS THE BATTLE OF Q?
D $5A9E Used by the routine at #A$2241.
B $5A9E,25,c25
B $5AB7,1,1 #R$4816($03): 8 spaces
t $5AB8 WHICH BATTLE OCCURRED IN Q?
D $5AB8 Used by the routine at #A$2241.
B $5AB8,27,c27
B $5AD3,1,1 #R$4816($03): 8 spaces
t $5AD4 {Please Sir I cannot tell a lie . . }It was in Q
D $5AD4 Used by the routine at #A$2241.
B $5AD4,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5AD5,11,c11
B $5AE0,1,1 #R$4816($03): 8 spaces
t $5AE1 {Please Sir I cannot tell a lie . . }It was the BATTLE OF Q
D $5AE1 Used by the routine at #A$2241.
B $5AE1,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5AE2,22,c22
B $5AF8,1,1 #R$4816($03): 8 spaces
t $5AF9 {Please Sir I cannot tell a lie . . }{ERIC} hit me
D $5AF9 Used by the routine at #A$0A58.
B $5AF9,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5AFA,1,1 #R$4780($10): ERIC
B $5AFB,7,c7
B $5B02,1,1 #R$4816($03): 8 spaces
t $5B03 {Please Sir I cannot tell a lie . . }{ERIC} is not here
D $5B03 Used by the routine at #A$0B3B.
B $5B03,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5B04,1,1 #R$4780($10): ERIC
B $5B05,12,c12
B $5B11,1,1 #R$4816($03): 8 spaces
t $5B12 {Please Sir I cannot tell a lie . . }{ERIC/BOY WONDER} wrote on the blackboard
D $5B12 Used by the routine at #A$0A58.
B $5B12,1,1 #R$47F0($18): Please Sir - I cannot tell a lie . .
B $5B13,1,1 #R$4780($10) (ERIC) or #R$478E($11) (BOY WONDER)
B $5B14,24,c24
B $5B2C,1,1 #R$4816($03): 8 spaces
t $5B2D WHAT HAPPENED IN THE YEAR THAT I WAS BORN
D $5B2D Used by the routine at #A$2241.
B $5B2D,41,c41
B $5B56,1,1 #R$4816($03): 8 spaces
u $5B57 Unused
D $5B57 #ZX$F157
B $5B57,1,c1
B $5B58,1,1 #R$4816($03): 8 spaces
t $5B59 RIGHT! SIT DOWN MY LITTLE CHERUBS
D $5B59 Used by the routine at #A$1FA0.
B $5B59,33,c33
B $5B7A,1,1 #R$4816($03): 8 spaces
t $5B7B COME ON CHAPS - SETTLE DOWN
D $5B7B Used by the routine at #A$1FA0.
B $5B7B,27,c27
B $5B96,1,1 #R$4816($03): 8 spaces
t $5B97 BE QUIET AND SEATED YOU NASTY LITTLE BOYS
D $5B97 Used by the routine at #A$1FA0.
B $5B97,36,c36
B $5BBB,1,1 The routine at #A$246B interprets this as a space character.
B $5BBC,4,c4
B $5BC0,1,1 #R$4816($03): 8 spaces
t $5BC1 SILENCE! OR I'LL CANE THE LOT OF YOU
D $5BC1 Used by the routine at #A$1FA0.
B $5BC1,36,c36
B $5BE5,1,1 #R$4816($03): 8 spaces
t $5BE6 YOU HAVE OVER 10000 LINES TO WRITE {ERIC}. DON'T COME BACK TO SCHOOL TILL YOU HAVE DONE THEM ALL. . . .PRESS A KEY TO PLAY AGAIN
D $5BE6 Used by the command list at #A$43A2.
B $5BE6,35,c35
B $5C09,1,1 #R$4780($10): ERIC
B $5C0A,87,c47,c40
B $5C61,1,1 #R$4816($03): 8 spaces
t $5C62 TURN TO PAGE 123 OF YOUR BOOKS,BE SILENT AND START READING
D $5C62 Used by the routine at #A$2500.
B $5C62,58,c31,c27
B $5C9C,1,1 #R$4816($03): 8 spaces
t $5C9D ANSWER THE QUESTIONS ON PAGE 123 OF YOUR LOVELY TEXTBOOK
D $5C9D Used by the routine at #A$2500.
B $5C9D,56,c29,c27
B $5CD5,1,1 #R$4816($03): 8 spaces
t $5CD6 WRITE AN ESSAY WITH THIS TITLE
D $5CD6 Used by the routine at #A$09E9.
B $5CD6,30,c30
B $5CF4,1,1 #R$4816($03): 8 spaces
u $5CF5 Unused
D $5CF5 #ZX$F2F5
B $5CF5,11,c11 11 spaces.
b $5D00 Main timetable
D $5D00 #ZX$FE00
D $5D00 Used by the routine at #A$3AD5.
B $5D00,1,1 $00: #LINK:LessonF6(PLAYTIME)
B $5D01,1,1 $01: #LINK:LessonE2(MR WACKER - EXAM ROOM)
B $5D02,1,1 $02: #LINK:LessonE7(MR WITHIT - MAP ROOM)
B $5D03,1,1 $03: #LINK:LessonF7(PLAYTIME)
B $5D04,1,1 $04: #LINK:LessonEE(MR ROCKITT - WHITE ROOM)
B $5D05,1,1 $05: #LINK:LessonEA(MR CREAK - READING ROOM)
B $5D06,1,1 $06: #LINK:LessonF8(PLAYTIME)
B $5D07,1,1 $07: #LINK:LessonE0(DINNER (MR WITHIT))
B $5D08,1,1 $08: #LINK:LessonF7(PLAYTIME)
B $5D09,1,1 $09: #LINK:LessonED(MR WITHIT - WHITE ROOM)
B $5D0A,1,1 $0A: #LINK:LessonE4(REVISION LIBRARY)
B $5D0B,1,1 $0B: #LINK:LessonF9(PLAYTIME)
B $5D0C,1,1 $0C: #LINK:LessonF2(MR CREAK - READING ROOM)
B $5D0D,1,1 $0D: #LINK:LessonF1(MR ROCKITT - WHITE ROOM)
B $5D0E,1,1 $0E: #LINK:LessonFA(PLAYTIME)
B $5D0F,1,1 $0F: #LINK:LessonEC(MR WACKER - WHITE ROOM)
B $5D10,1,1 $10: #LINK:LessonFB(PLAYTIME)
B $5D11,1,1 $11: #LINK:LessonE8(MR WACKER - READING ROOM)
B $5D12,1,1 $12: #LINK:LessonEB(MR CREAK - WHITE ROOM)
B $5D13,1,1 $13: #LINK:LessonF8(PLAYTIME)
B $5D14,1,1 $14: #LINK:LessonFF(PLAYTIME)
B $5D15,1,1 $15: #LINK:LessonE9(MR ROCKITT - READING ROOM)
B $5D16,1,1 $16: #LINK:LessonEF(MR WACKER - MAP ROOM)
B $5D17,1,1 $17: #LINK:LessonFA(PLAYTIME)
B $5D18,1,1 $18: #LINK:LessonE1(DINNER (MR WACKER))
B $5D19,1,1 $19: #LINK:LessonFD(PLAYTIME (little boys stampede))
B $5D1A,1,1 $1A: #LINK:LessonF2(MR CREAK - READING ROOM)
B $5D1B,1,1 $1B: #LINK:LessonE3(MR ROCKITT - EXAM ROOM)
B $5D1C,1,1 $1C: #LINK:LessonE5(REVISION LIBRARY)
B $5D1D,1,1 $1D: #LINK:LessonF6(PLAYTIME)
B $5D1E,1,1 $1E: #LINK:LessonED(MR WITHIT - WHITE ROOM)
B $5D1F,1,1 $1F: #LINK:LessonE9(MR ROCKITT - READING ROOM)
B $5D20,1,1 $20: #LINK:LessonF9(PLAYTIME)
B $5D21,1,1 $21: #LINK:LessonF0(MR WITHIT - MAP ROOM)
B $5D22,1,1 $22: #LINK:LessonE6(REVISION LIBRARY)
B $5D23,1,1 $23: #LINK:LessonEB(MR CREAK - WHITE ROOM)
B $5D24,1,1 $24: #LINK:LessonFB(PLAYTIME)
B $5D25,1,1 $25: #LINK:LessonEA(MR CREAK - READING ROOM)
B $5D26,1,1 $26: #LINK:LessonF1(MR ROCKITT - WHITE ROOM)
B $5D27,1,1 $27: #LINK:LessonF7(PLAYTIME)
B $5D28,1,1 $28: #LINK:LessonE0(DINNER (MR WITHIT))
B $5D29,1,1 $29: #LINK:LessonF6(PLAYTIME)
B $5D2A,1,1 $2A: #LINK:LessonFF(PLAYTIME)
B $5D2B,1,1 $2B: #LINK:LessonEE(MR ROCKITT - WHITE ROOM)
B $5D2C,1,1 $2C: #LINK:LessonF2(MR CREAK - READING ROOM)
B $5D2D,1,1 $2D: #LINK:LessonFA(PLAYTIME)
B $5D2E,1,1 $2E: #LINK:LessonE5(REVISION LIBRARY)
B $5D2F,1,1 $2F: #LINK:LessonE7(MR WITHIT - MAP ROOM)
B $5D30,1,1 $30: #LINK:LessonF8(PLAYTIME)
B $5D31,1,1 $31: #LINK:LessonE7(MR WITHIT - MAP ROOM)
B $5D32,1,1 $32: #LINK:LessonE8(MR WACKER - READING ROOM)
B $5D33,1,1 $33: #LINK:LessonFA(PLAYTIME)
B $5D34,1,1 $34: #LINK:LessonFE(PLAYTIME)
B $5D35,1,1 $35: #LINK:LessonF1(MR ROCKITT - WHITE ROOM)
B $5D36,1,1 $36: #LINK:LessonF2(MR CREAK - READING ROOM)
B $5D37,1,1 $37: #LINK:LessonF7(PLAYTIME)
B $5D38,1,1 $38: #LINK:LessonE1(DINNER (MR WACKER))
B $5D39,1,1 $39: #LINK:LessonFE(PLAYTIME)
B $5D3A,1,1 $3A: #LINK:LessonE2(MR WACKER - EXAM ROOM)
B $5D3B,1,1 $3B: #LINK:LessonE6(REVISION LIBRARY)
B $5D3C,1,1 $3C: #LINK:LessonF9(PLAYTIME)
B $5D3D,1,1 $3D: #LINK:LessonED(MR WITHIT - WHITE ROOM)
B $5D3E,1,1 $3E: #LINK:LessonEB(MR CREAK - WHITE ROOM)
B $5D3F,1,1 $3F: #LINK:LessonEF(MR WACKER - MAP ROOM)
u $5D40 Z80 code remnants
D $5D40 #ZX$FE40
B $5D40,1,1 PUSH BC
B $5D41,2,2 LD A,$06
B $5D43,2,2 LD C,$08
B $5D45,2,2 XOR $10
B $5D47,1,1
b $5D48 Initial colour information for the bottom four rows of the screen
D $5D48 Copied to the screen colour information area by the routine at #A$2DCB.
B $5D48,40,8 First row.
B $5D70,40,8 Second row.
B $5D98,40,8 Third row.
B $5DC0,40,8 Fourth row.
u $5DE8 Unused
D $5DE8 This corresponds to #ZXR$FEE0($FEE8) in the ZX Spectrum version.
D $5DE8 The full message (that is used) can be found at #A$4680.
B $5DE8,24,c5,3,c9,7
t $5E00 Don't let {ANGELFACE} touch you this playtime - He's got mumps
D $5E00 Used by command list #R$42FB($D2).
B $5E00,10,c10
B $5E0A,1,1 #R$479C($12): ANGELFACE
B $5E0B,41,c41
B $5E34,1,1 #R$4816($03): 8 spaces
t $5E35 {EINSTEIN} is going to tell {MR WACKER} what you're up to. You must stop him getting to his study this break
D $5E35 Used by command list #R$438A($E0).
B $5E35,1,1 #R$47AA($13): EINSTEIN
B $5E36,18,c18
B $5E48,1,1 #R$47B8($14): MR WACKER
B $5E49,69,c34,c35
B $5E8E,1,1 #R$4816($03): 8 spaces
t $5E8F {BOY WONDER} has hidden a pea-shooter with your name on it on the fire-escape. If {MR WACKER} gets there before {BOY WONDER} you'll get lines
D $5E8F Used by command list #R$42E3($D0).
B $5E8F,1,1 #R$478E($11): BOY WONDER
B $5E90,70,c35
B $5ED6,1,1 #R$47B8($14): MR WACKER
B $5ED7,19,c19
B $5EEA,1,1 #R$478E($11): BOY WONDER
B $5EEB,17,c17
B $5EFC,1,1 #R$4816($03): 8 spaces
u $5EFD Unused
D $5EFD #ZX$FFFD
B $5EFD,3,3
b $5F00 Keyboard tables
D $5F00 Used by the routine at #A$3940.
D $5F00 The first table represents the standard keyboard with no modifier keys pressed.
B $5F00,64,8
N $5F40 The next table represents the keyboard with SHIFT pressed.
B $5F40,64,8
N $5F80 The next table represents the keyboard with the CBM key pressed.
B $5F80,64,8
N $5FC0 The next table represents the keyboard with CTRL pressed.
B $5FC0,64,8
b $6000 Skool graphic data for columns 0-31 (tiles $00-$FF)
D $6000 #ZX$8000
D $6000 Used by the routine at #A$3326.
D $6000 #UDGTABLE #FOR(0,15)(n,{ #FOR(0,15)(m,#UDG(#PC+m+16*n,$0F,2,256), | ) } ) TABLE#
B $6000,2048,16
b $6800 Skool graphic data for columns 32-63 (tiles $00-$FF)
D $6800 #ZX$8800
D $6800 Used by the routine at #A$3326.
D $6800 #UDGTABLE #FOR(0,15)(n,{ #FOR(0,15)(m,#UDG(#PC+m+16*n,$0F,2,256), | ) } ) TABLE#
B $6800,2048,16
b $7000 Skool graphic data for columns 64-95 (tiles $00-$FF)
D $7000 #ZX$9000
D $7000 Used by the routine at #A$3326.
D $7000 #UDGTABLE #FOR(0,15)(n,{ #FOR(0,15)(m,#UDG(#PC+m+16*n,$0F,2,256), | ) } ) TABLE#
B $7000,2048,16
b $7800 Skool tile references (LSBs) for row 0
D $7800 #ZX$9800
D $7800 Used by the routine at #A$3326.
B $7800,96,8
b $7860 Character buffer for little boy no. 1
D $7860 #ZX$9860
D $7860 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7860,32,8
b $7880 Skool colour information for row 0
D $7880 #ZX$9880
D $7880 Used by the routine at #A$3326.
B $7880,96,8
b $78E0 Personal timetable for little boy no. 1
D $78E0 #ZX$98E0
D $78E0 Used by the routine at #A$3AD5.
B $78E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $78E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $78E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4118($92) (Reading Room)
B $78E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $78E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $78E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40DC($88) (Map Room)
B $78E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $78E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $78E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$419E($A2) (White Room)
B $78E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$415B($9A) (Exam Room)
B $78EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4118($92) (Reading Room)
B $78EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4118($92) (Reading Room)
B $78EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40DC($88) (Map Room)
B $78ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$4118($92) (Reading Room)
B $78EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40DC($88) (Map Room)
B $78EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $78F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $78F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $78F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $78F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $78F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $78F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $78F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $78F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4206($B0) (Revision Library)
B $78F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4206($B0) (Revision Library)
B $78F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $78FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4290($C4) (Walkabout)
B $78FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $78FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42AD($CC) (Stampede)
B $78FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42AD($CC) (Stampede)
B $78FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4206($B0) (Revision Library)
B $78FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4290($C4) (Walkabout)
b $7900 Skool tile references (LSBs) for row 1
D $7900 #ZX$9900
D $7900 Used by the routine at #A$3326.
B $7900,96,8
b $7960 Character buffer for little boy no. 2
D $7960 #ZX$9960
D $7960 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7960,32,8
b $7980 Skool colour information for row 1
D $7980 #ZX$9980
D $7980 Used by the routine at #A$3326.
B $7980,96,8
b $79E0 Personal timetable for little boy no. 2
D $79E0 #ZX$99E0
D $79E0 Used by the routine at #A$3AD5.
B $79E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $79E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $79E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4118($92) (Reading Room)
B $79E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $79E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $79E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40DC($88) (Map Room)
B $79E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $79E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $79E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4118($92) (Reading Room)
B $79E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$415B($9A) (Exam Room)
B $79EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $79EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40DC($88) (Map Room)
B $79EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$4118($92) (Reading Room)
B $79ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$419E($A2) (White Room)
B $79EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $79EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$419E($A2) (White Room)
B $79F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $79F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $79F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $79F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $79F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $79F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $79F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $79F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $79F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4206($B0) (Revision Library)
B $79F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $79FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4290($C4) (Walkabout)
B $79FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $79FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $79FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $79FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $79FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4206($B0) (Revision Library)
b $7A00 Skool tile references (LSBs) for row 2
D $7A00 #ZX$9A00
D $7A00 Used by the routine at #A$3326.
B $7A00,96,8
b $7A60 Character buffer for little boy no. 3
D $7A60 #ZX$9A60
D $7A60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7A60,32,8
b $7A80 Skool colour information for row 2
D $7A80 #ZX$9A80
D $7A80 Used by the routine at #A$3326.
B $7A80,96,8
b $7AE0 Personal timetable for little boy no. 3
D $7AE0 #ZX$9AE0
D $7AE0 Used by the routine at #A$3AD5.
B $7AE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7AE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7AE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4118($92) (Reading Room)
B $7AE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $7AE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7AE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40DC($88) (Map Room)
B $7AE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $7AE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $7AE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40DC($88) (Map Room)
B $7AE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$415B($9A) (Exam Room)
B $7AEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $7AEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7AEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40DC($88) (Map Room)
B $7AED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7AEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40DC($88) (Map Room)
B $7AEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $7AF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40DC($88) (Map Room)
B $7AF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7AF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $7AF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7AF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7AF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7AF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7AF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7AF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7AF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7AFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7AFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7AFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7AFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7AFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7AFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4290($C4) (Walkabout)
b $7B00 Skool tile references (LSBs) for row 3
D $7B00 #ZX$9B00
D $7B00 Used by the routine at #A$3326.
B $7B00,96,8
b $7B60 Character buffer for little boy no. 4
D $7B60 #ZX$9B60
D $7B60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7B60,32,8
b $7B80 Skool colour information for row 3
D $7B80 #ZX$9B80
D $7B80 Used by the routine at #A$3326.
B $7B80,96,8
b $7BE0 Personal timetable for little boy no. 4
D $7BE0 #ZX$9BE0
D $7BE0 Used by the routine at #A$3AD5.
B $7BE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7BE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7BE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4118($92) (Reading Room)
B $7BE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$419E($A2) (White Room)
B $7BE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7BE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7BE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $7BE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $7BE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$415B($9A) (Exam Room)
B $7BE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$419E($A2) (White Room)
B $7BEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$415B($9A) (Exam Room)
B $7BEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4118($92) (Reading Room)
B $7BEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$4118($92) (Reading Room)
B $7BED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40DC($88) (Map Room)
B $7BEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40DC($88) (Map Room)
B $7BEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$419E($A2) (White Room)
B $7BF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $7BF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7BF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $7BF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7BF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7BF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7BF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7BF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4206($B0) (Revision Library)
B $7BF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7BF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7BFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7BFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7BFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7BFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7BFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7BFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
b $7C00 Skool tile references (LSBs) for row 4
D $7C00 #ZX$9C00
D $7C00 Used by the routine at #A$3326.
B $7C00,96,8
b $7C60 Character buffer for little boy no. 5
D $7C60 #ZX$9C60
D $7C60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7C60,32,8
b $7C80 Skool colour information for row 4
D $7C80 #ZX$9C80
D $7C80 Used by the routine at #A$3326.
B $7C80,96,8
b $7CE0 Personal timetable for little boy no. 5
D $7CE0 #ZX$9CE0
D $7CE0 Used by the routine at #A$3AD5.
B $7CE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7CE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7CE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4118($92) (Reading Room)
B $7CE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$419E($A2) (White Room)
B $7CE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $7CE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $7CE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $7CE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $7CE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40DC($88) (Map Room)
B $7CE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4118($92) (Reading Room)
B $7CEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $7CEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40DC($88) (Map Room)
B $7CEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7CED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$4118($92) (Reading Room)
B $7CEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$419E($A2) (White Room)
B $7CEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $7CF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $7CF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7CF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $7CF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7CF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7CF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7CF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7CF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7CF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7CF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7CFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7CFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7CFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7CFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7CFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4206($B0) (Revision Library)
B $7CFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$429F($C8) (Walk around the gym)
b $7D00 Skool tile references (LSBs) for row 5
D $7D00 #ZX$9D00
D $7D00 Used by the routine at #A$3326.
B $7D00,96,8
b $7D60 Character buffer for little boy no. 6
D $7D60 #ZX$9D60
D $7D60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7D60,32,8
b $7D80 Skool colour information for row 5
D $7D80 #ZX$9D80
D $7D80 Used by the routine at #A$3326.
B $7D80,96,8
b $7DE0 Personal timetable for little boy no. 6
D $7DE0 #ZX$9DE0
D $7DE0 Used by the routine at #A$3AD5.
B $7DE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7DE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7DE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $7DE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$419E($A2) (White Room)
B $7DE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $7DE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7DE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $7DE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $7DE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$415B($9A) (Exam Room)
B $7DE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$419E($A2) (White Room)
B $7DEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$415B($9A) (Exam Room)
B $7DEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7DEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40DC($88) (Map Room)
B $7DED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$419E($A2) (White Room)
B $7DEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$4118($92) (Reading Room)
B $7DEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $7DF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $7DF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7DF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $7DF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7DF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7DF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7DF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7DF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7DF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7DF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7DFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7DFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7DFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7DFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7DFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7DFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
b $7E00 Skool tile references (LSBs) for row 6
D $7E00 #ZX$9E00
D $7E00 Used by the routine at #A$3326.
B $7E00,96,8
b $7E60 Character buffer for little boy no. 7
D $7E60 #ZX$9E60
D $7E60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7E60,32,8
b $7E80 Skool colour information for row 6
D $7E80 #ZX$9E80
D $7E80 Used by the routine at #A$3326.
B $7E80,96,8
b $7EE0 Personal timetable for little boy no. 7
D $7EE0 #ZX$9EE0
D $7EE0 Used by the routine at #A$3AD5.
B $7EE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7EE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7EE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $7EE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$419E($A2) (White Room)
B $7EE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $7EE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7EE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $7EE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$415B($9A) (Exam Room)
B $7EE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4118($92) (Reading Room)
B $7EE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$419E($A2) (White Room)
B $7EEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $7EEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4118($92) (Reading Room)
B $7EEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$419E($A2) (White Room)
B $7EED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7EEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40DC($88) (Map Room)
B $7EEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$4118($92) (Reading Room)
B $7EF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $7EF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7EF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $7EF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7EF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7EF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7EF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7EF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4206($B0) (Revision Library)
B $7EF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7EF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7EFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7EFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7EFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7EFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7EFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $7EFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4206($B0) (Revision Library)
b $7F00 Skool tile references (LSBs) for row 7
D $7F00 #ZX$9F00
D $7F00 Used by the routine at #A$3326.
B $7F00,96,8
b $7F60 Character buffer for little boy no. 8
D $7F60 #ZX$9F60
D $7F60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $7F60,32,8
b $7F80 Skool colour information for row 7
D $7F80 #ZX$9F80
D $7F80 Used by the routine at #A$3326.
B $7F80,96,8
b $7FE0 Personal timetable for little boy no. 8
D $7FE0 #ZX$9FE0
D $7FE0 Used by the routine at #A$3AD5.
B $7FE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $7FE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $7FE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $7FE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$419E($A2) (White Room)
B $7FE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $7FE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4118($92) (Reading Room)
B $7FE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $7FE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $7FE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$415B($9A) (Exam Room)
B $7FE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40DC($88) (Map Room)
B $7FEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$415B($9A) (Exam Room)
B $7FEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40DC($88) (Map Room)
B $7FEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$4118($92) (Reading Room)
B $7FED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40DC($88) (Map Room)
B $7FEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$4118($92) (Reading Room)
B $7FEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $7FF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $7FF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $7FF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $7FF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $7FF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $7FF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $7FF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7FF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7FF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7FF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4206($B0) (Revision Library)
B $7FFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $7FFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $7FFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7FFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $7FFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $7FFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
b $8000 Skool tile references (LSBs) for row 8
D $8000 #ZX$A000
D $8000 Used by the routine at #A$3326.
B $8000,96,8
b $8060 Character buffer for little boy no. 9
D $8060 #ZX$A060
D $8060 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8060,32,8
b $8080 Skool colour information for row 8
D $8080 #ZX$A080
D $8080 Used by the routine at #A$3326.
B $8080,96,8
b $80E0 Personal timetable for little boy no. 9
D $80E0 #ZX$A0E0
D $80E0 Used by the routine at #A$3AD5.
B $80E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $80E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $80E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $80E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $80E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $80E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40DC($88) (Map Room)
B $80E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$419E($A2) (White Room)
B $80E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$415B($9A) (Exam Room)
B $80E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40DC($88) (Map Room)
B $80E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40DC($88) (Map Room)
B $80EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $80EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$415B($9A) (Exam Room)
B $80EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$415B($9A) (Exam Room)
B $80ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$4118($92) (Reading Room)
B $80EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $80EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$4118($92) (Reading Room)
B $80F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4118($92) (Reading Room)
B $80F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $80F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $80F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $80F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $80F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $80F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $80F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $80F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4290($C4) (Walkabout)
B $80F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4206($B0) (Revision Library)
B $80FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4298($C6) (Walk around the fire escape)
B $80FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $80FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $80FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $80FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4206($B0) (Revision Library)
B $80FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$429F($C8) (Walk around the gym)
b $8100 Skool tile references (LSBs) for row 9
D $8100 #ZX$A100
D $8100 Used by the routine at #A$3326.
B $8100,96,8
b $8160 Character buffer for little boy no. 10
D $8160 #ZX$A160
D $8160 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8160,32,8
b $8180 Skool colour information for row 9
D $8180 #ZX$A180
D $8180 Used by the routine at #A$3326.
B $8180,96,8
b $81E0 Personal timetable for little boy no. 10
D $81E0 #ZX$A1E0
D $81E0 Used by the routine at #A$3AD5.
B $81E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $81E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $81E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $81E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $81E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $81E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40DC($88) (Map Room)
B $81E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $81E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$415B($9A) (Exam Room)
B $81E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$419E($A2) (White Room)
B $81E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40DC($88) (Map Room)
B $81EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40DC($88) (Map Room)
B $81EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4118($92) (Reading Room)
B $81EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$415B($9A) (Exam Room)
B $81ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $81EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$4118($92) (Reading Room)
B $81EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$415B($9A) (Exam Room)
B $81F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$419E($A2) (White Room)
B $81F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$415B($9A) (Exam Room)
B $81F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$419E($A2) (White Room)
B $81F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$42FB($D2) (Tell ERIC about ANGELFACE)
B $81F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$438A($E0) (Tell ERIC about EINSTEIN)
B $81F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$42E3($D0) (Tell ERIC about BOY WONDER)
B $81F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4206($B0) (Revision Library)
B $81F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$429F($C8) (Walk around the gym)
B $81F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4290($C4) (Walkabout)
B $81F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4290($C4) (Walkabout)
B $81FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4206($B0) (Revision Library)
B $81FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $81FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $81FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $81FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4206($B0) (Revision Library)
B $81FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
b $8200 Skool tile references (LSBs) for row 10
D $8200 #ZX$A200
D $8200 Used by the routine at #A$3326.
B $8200,96,8
b $8260 Character buffer for little boy no. 11
D $8260 #ZX$A260
D $8260 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8260,32,8
b $8280 Skool colour information for row 10
D $8280 #ZX$A280
D $8280 Used by the routine at #A$3326.
B $8280,96,8
b $82E0 Personal timetable for little boy no. 11
D $82E0 #ZX$A2E0
D $82E0 Used by the routine at #A$3AD5.
B $82E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $82E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $82E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$415B($9A) (Exam Room)
B $82E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$415B($9A) (Exam Room)
B $82E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $82E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $82E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $82E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40DC($88) (Map Room)
B $82E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4118($92) (Reading Room)
B $82E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4118($92) (Reading Room)
B $82EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4118($92) (Reading Room)
B $82EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$419E($A2) (White Room)
B $82EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$419E($A2) (White Room)
B $82ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$419E($A2) (White Room)
B $82EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$419E($A2) (White Room)
B $82EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40DC($88) (Map Room)
B $82F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40DC($88) (Map Room)
B $82F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$419E($A2) (White Room)
B $82F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4118($92) (Reading Room)
B $82F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $82F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $82F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $82F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4206($B0) (Revision Library)
B $82F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$42A6($CA) (Walk around the big window)
B $82F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4290($C4) (Walkabout)
B $82F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4290($C4) (Walkabout)
B $82FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4206($B0) (Revision Library)
B $82FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $82FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $82FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$42CF($CE) (Stampede)
B $82FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4206($B0) (Revision Library)
B $82FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4290($C4) (Walkabout)
b $8300 Skool tile references (LSBs) for row 11
D $8300 #ZX$A300
D $8300 Used by the routine at #A$3326.
B $8300,96,8
b $8360 Character buffer for MR WACKER
D $8360 #ZX$A360
D $8360 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8360,32,8
b $8380 Skool colour information for row 11
D $8380 #ZX$A380
D $8380 Used by the routine at #A$3326.
B $8380,96,8
b $83E0 Personal timetable for MR WACKER
D $83E0 #ZX$A3E0
D $83E0 Used by the routine at #A$3AD5.
B $83E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$4247($BA) (Head's study)
B $83E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$423B($B8) (Dinner duty)
B $83E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$40AE($84) (Exam Room)
B $83E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$4255($BE) (Walkabout)
B $83E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4095($82) (Reading Room)
B $83E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4255($BE) (Walkabout)
B $83E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$4255($BE) (Walkabout)
B $83E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40AE($84) (Exam Room)
B $83E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4095($82) (Reading Room)
B $83E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40AE($84) (Exam Room)
B $83EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40C3($86) (White Room)
B $83EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4095($82) (Reading Room)
B $83EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40C3($86) (White Room)
B $83ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$4080($80) (Map Room)
B $83EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40AE($84) (Exam Room)
B $83EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$4080($80) (Map Room)
B $83F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4255($BE) (Walkabout)
B $83F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$40AE($84) (Exam Room)
B $83F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4255($BE) (Walkabout)
B $83F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4255($BE) (Walkabout)
B $83F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$431F($D6) (Wait for EINSTEIN to grass on ERIC)
B $83F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4352($DA) (Look for the pea-shooter)
B $83F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4255($BE) (Walkabout)
B $83F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4247($BA) (Head's study)
B $83F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4255($BE) (Walkabout)
B $83F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4255($BE) (Walkabout)
B $83FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4255($BE) (Walkabout)
B $83FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4255($BE) (Walkabout)
B $83FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4255($BE) (Walkabout)
B $83FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $83FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$424E($BC) (Staff room)
B $83FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4255($BE) (Walkabout)
b $8400 Skool tile references (LSBs) for row 12
D $8400 #ZX$A400
D $8400 Used by the routine at #A$3326.
B $8400,96,8
b $8460 Character buffer for MR ROCKITT
D $8460 #ZX$A460
D $8460 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8460,32,8
b $8480 Skool colour information for row 12
D $8480 #ZX$A480
D $8480 Used by the routine at #A$3326.
B $8480,96,8
b $84E0 Personal timetable for MR ROCKITT
D $84E0 #ZX$A4E0
D $84E0 Used by the routine at #A$3AD5.
B $84E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$424E($BC) (Staff room)
B $84E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$424E($BC) (Staff room)
B $84E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4290($C4) (Walkabout)
B $84E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$40AE($84) (Exam Room)
B $84E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$40AE($84) (Exam Room)
B $84E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$415B($9A) (Exam Room)
B $84E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$40C3($86) (White Room)
B $84E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40C3($86) (White Room)
B $84E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40AE($84) (Exam Room)
B $84E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4095($82) (Reading Room)
B $84EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40AE($84) (Exam Room)
B $84EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40AE($84) (Exam Room)
B $84EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40AE($84) (Exam Room)
B $84ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40AE($84) (Exam Room)
B $84EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40C3($86) (White Room)
B $84EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$4095($82) (Reading Room)
B $84F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4095($82) (Reading Room)
B $84F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$40C3($86) (White Room)
B $84F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40C3($86) (White Room)
B $84F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4376($DE) (Mumps duty)
B $84F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4255($BE) (Walkabout)
B $84F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4255($BE) (Walkabout)
B $84F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4255($BE) (Walkabout)
B $84F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$424E($BC) (Staff room)
B $84F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4290($C4) (Walkabout)
B $84F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$424E($BC) (Staff room)
B $84FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4290($C4) (Walkabout)
B $84FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $84FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $84FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $84FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$424E($BC) (Staff room)
B $84FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4290($C4) (Walkabout)
b $8500 Skool tile references (LSBs) for row 13
D $8500 #ZX$A500
D $8500 Used by the routine at #A$3326.
B $8500,96,8
b $8560 Character buffer for MR WITHIT
D $8560 #ZX$A560
D $8560 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8560,32,8
b $8580 Skool colour information for row 13
D $8580 #ZX$A580
D $8580 Used by the routine at #A$3326.
B $8580,96,8
b $85E0 Personal timetable for MR WITHIT
D $85E0 #ZX$A5E0
D $85E0 Used by the routine at #A$3AD5.
B $85E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$423B($B8) (Dinner duty)
B $85E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$4298($C6) (Walk around the fire escape)
B $85E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4095($82) (Reading Room)
B $85E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$4255($BE) (Walkabout)
B $85E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$42A6($CA) (Walk around the big window)
B $85E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4080($80) (Map Room)
B $85E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$40AE($84) (Exam Room)
B $85E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4080($80) (Map Room)
B $85E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4080($80) (Map Room)
B $85E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4080($80) (Map Room)
B $85EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4080($80) (Map Room)
B $85EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$4080($80) (Map Room)
B $85EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$4080($80) (Map Room)
B $85ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40C3($86) (White Room)
B $85EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$4080($80) (Map Room)
B $85EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40AE($84) (Exam Room)
B $85F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$4080($80) (Map Room)
B $85F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$4290($C4) (Walkabout)
B $85F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4080($80) (Map Room)
B $85F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4255($BE) (Walkabout)
B $85F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4255($BE) (Walkabout)
B $85F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4255($BE) (Walkabout)
B $85F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4255($BE) (Walkabout)
B $85F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$424E($BC) (Staff room)
B $85F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$424E($BC) (Staff room)
B $85F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4290($C4) (Walkabout)
B $85FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$424E($BC) (Staff room)
B $85FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$424E($BC) (Staff room)
B $85FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $85FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $85FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$424E($BC) (Staff room)
B $85FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$424E($BC) (Staff room)
b $8600 Skool tile references (LSBs) for row 14
D $8600 #ZX$A600
D $8600 Used by the routine at #A$3326.
B $8600,96,8
b $8660 Character buffer for MR CREAK
D $8660 #ZX$A660
D $8660 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8660,32,8
b $8680 Skool colour information for row 14
D $8680 #ZX$A680
D $8680 Used by the routine at #A$3326.
B $8680,96,8
b $86E0 Personal timetable for MR CREAK
D $86E0 #ZX$A6E0
D $86E0 Used by the routine at #A$3AD5.
B $86E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$424E($BC) (Staff room)
B $86E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$424E($BC) (Staff room)
B $86E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$424E($BC) (Staff room)
B $86E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$424E($BC) (Staff room)
B $86E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$40C3($86) (White Room)
B $86E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4095($82) (Reading Room)
B $86E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$4095($82) (Reading Room)
B $86E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4095($82) (Reading Room)
B $86E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40C3($86) (White Room)
B $86E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40C3($86) (White Room)
B $86EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4095($82) (Reading Room)
B $86EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40C3($86) (White Room)
B $86EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$4095($82) (Reading Room)
B $86ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$4095($82) (Reading Room)
B $86EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$4095($82) (Reading Room)
B $86EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40C3($86) (White Room)
B $86F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40C3($86) (White Room)
B $86F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$424E($BC) (Staff room)
B $86F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4095($82) (Reading Room)
B $86F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4255($BE) (Walkabout)
B $86F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4255($BE) (Walkabout)
B $86F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4255($BE) (Walkabout)
B $86F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$424E($BC) (Staff room)
B $86F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$424E($BC) (Staff room)
B $86F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$424E($BC) (Staff room)
B $86F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$424E($BC) (Staff room)
B $86FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$424E($BC) (Staff room)
B $86FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$424E($BC) (Staff room)
B $86FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $86FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $86FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$424E($BC) (Staff room)
B $86FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$424E($BC) (Staff room)
b $8700 Skool tile references (LSBs) for row 15
D $8700 #ZX$A700
D $8700 Used by the routine at #A$3326.
B $8700,96,8
b $8760 Character buffer for ANGELFACE
D $8760 #ZX$A760
D $8760 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8760,32,8
b $8780 Skool colour information for row 15
D $8780 #ZX$A780
D $8780 Used by the routine at #A$3326.
B $8780,96,8
b $87E0 Personal timetable for ANGELFACE
D $87E0 #ZX$A8E0
D $87E0 Used by the routine at #A$3AD5.
B $87E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41F7($AE) (Dinner)
B $87E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41F7($AE) (Dinner)
B $87E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4180($9E) (Exam Room)
B $87E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$4180($9E) (Exam Room)
B $87E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$41C3($A6) (White Room)
B $87E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$421C($B4) (Revision Library)
B $87E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$421C($B4) (Revision Library)
B $87E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40FA($8E) (Map Room)
B $87E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$41C3($A6) (White Room)
B $87E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$413D($96) (Reading Room)
B $87EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$413D($96) (Reading Room)
B $87EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$41C3($A6) (White Room)
B $87EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$41C3($A6) (White Room)
B $87ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$421C($B4) (Revision Library)
B $87EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$421C($B4) (Revision Library)
B $87EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40FA($8E) (Map Room)
B $87F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40FA($8E) (Map Room)
B $87F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$41C3($A6) (White Room)
B $87F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$413D($96) (Reading Room)
B $87F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$436E($DC) (Mumps walkabout)
B $87F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $87F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $87F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$422B($B6) (Walkabout)
B $87FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$422B($B6) (Walkabout)
B $87FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$422B($B6) (Walkabout)
B $87FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$422B($B6) (Walkabout)
b $8800 Skool tile references (LSBs) for row 16
D $8800 #ZX$A800
D $8800 Used by the routine at #A$3326.
B $8800,96,8
b $8860 Character buffer for BOY WONDER
D $8860 #ZX$A860
D $8860 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8860,32,8
b $8880 Skool colour information for row 16
D $8880 #ZX$A880
D $8880 Used by the routine at #A$3326.
B $8880,96,8
b $88E0 Personal timetable for BOY WONDER
D $88E0 #ZX$A7E0
D $88E0 Used by the routine at #A$3AD5.
B $88E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E8($AC) (Dinner)
B $88E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E8($AC) (Dinner)
B $88E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4166($9C) (Exam Room)
B $88E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$4166($9C) (Exam Room)
B $88E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$420D($B2) (Revision Library)
B $88E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40E7($8C) (Map Room)
B $88E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$420D($B2) (Revision Library)
B $88E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$4166($9C) (Exam Room)
B $88E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4123($94) (Reading Room)
B $88E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4123($94) (Reading Room)
B $88EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4123($94) (Reading Room)
B $88EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$41A9($A4) (White Room)
B $88EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$420D($B2) (Revision Library)
B $88ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$420D($B2) (Revision Library)
B $88EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$41A9($A4) (White Room)
B $88EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$4166($9C) (Exam Room)
B $88F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40E7($8C) (Map Room)
B $88F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$41A9($A4) (White Room)
B $88F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4123($94) (Reading Room)
B $88F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $88F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4290($C4) (Walkabout)
B $88F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4334($D8) (Collect the pea-shooter)
B $88F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$425D($C0) (Write on the boards)
B $88F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4272($C2) (Walkabout)
B $88F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$425D($C0) (Write on the boards)
B $88F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$425D($C0) (Write on the boards)
B $88FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$425D($C0) (Write on the boards)
B $88FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4272($C2) (Walkabout)
B $88FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4272($C2) (Walkabout)
B $88FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4272($C2) (Walkabout)
B $88FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$425D($C0) (Write on the boards)
B $88FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4272($C2) (Walkabout)
b $8900 Skool tile references (LSBs) for row 17
D $8900 #ZX$A900
D $8900 Used by the routine at #A$3326.
B $8900,96,8
b $8960 Character buffer for EINSTEIN
D $8960 #ZX$A960
D $8960 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8960,32,8
b $8980 Skool colour information for row 17
D $8980 #ZX$A980
D $8980 Used by the routine at #A$3326.
B $8980,96,8
b $89E0 Personal timetable for EINSTEIN
D $89E0 #ZX$A9E0
D $89E0 Used by the routine at #A$3AD5.
B $89E0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$41E1($AA) (Dinner)
B $89E1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$41E1($AA) (Dinner)
B $89E2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$4193($A0) (Exam Room)
B $89E3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$4193($A0) (Exam Room)
B $89E4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $89E5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $89E6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$4206($B0) (Revision Library)
B $89E7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$410D($90) (Map Room)
B $89E8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$4150($98) (Reading Room)
B $89E9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$4150($98) (Reading Room)
B $89EA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$4150($98) (Reading Room)
B $89EB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$41D6($A8) (White Room)
B $89EC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$41D6($A8) (White Room)
B $89ED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$41D6($A8) (White Room)
B $89EE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$41D6($A8) (White Room)
B $89EF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$410D($90) (Map Room)
B $89F0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$410D($90) (Map Room)
B $89F1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$41D6($A8) (White Room)
B $89F2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$4150($98) (Reading Room)
B $89F3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$4290($C4) (Walkabout)
B $89F4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$4309($D4) (Grass on ERIC)
B $89F5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$4290($C4) (Walkabout)
B $89F6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89F7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89F8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89F9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89FA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89FB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89FC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $89FD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$4290($C4) (Walkabout)
B $89FE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$4290($C4) (Walkabout)
B $89FF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$4290($C4) (Walkabout)
b $8A00 Skool tile references (LSBs) for row 18
D $8A00 #ZX$AA00
D $8A00 Used by the routine at #A$3326.
B $8A00,96,8
b $8A60 Character buffer for BOY WONDER's pellet
D $8A60 #ZX$AA60
D $8A60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8A60,32,8
b $8A80 Skool colour information for row 18
D $8A80 #ZX$AA80
D $8A80 Used by the routine at #A$3326.
B $8A80,96,8
b $8AE0 Personal timetable for BOY WONDER's pellet
D $8AE0 #ZX$AAE0
D $8AE0 This timetable is not used, but every entry points at command list #R$40E5($8A).
B $8AE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$40E5($8A) (Do nothing)
B $8AE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$40E5($8A) (Do nothing)
B $8AE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$40E5($8A) (Do nothing)
B $8AE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$40E5($8A) (Do nothing)
B $8AE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8AE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8AE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8AE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8AE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40E5($8A) (Do nothing)
B $8AE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40E5($8A) (Do nothing)
B $8AEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40E5($8A) (Do nothing)
B $8AEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8AEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8AED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8AEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8AEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8AF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8AF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8AF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40E5($8A) (Do nothing)
B $8AF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$40E5($8A) (Do nothing)
B $8AF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$40E5($8A) (Do nothing)
B $8AF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$40E5($8A) (Do nothing)
B $8AF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$40E5($8A) (Do nothing)
B $8AFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$40E5($8A) (Do nothing)
B $8AFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8AFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$40E5($8A) (Do nothing)
b $8B00 Skool tile references (LSBs) for row 19
D $8B00 #ZX$AB00
D $8B00 Used by the routine at #A$3326.
B $8B00,96,8
b $8B60 Character buffer for ERIC's pellet
D $8B60 #ZX$AB60
D $8B60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8B60,32,8
b $8B80 Skool colour information for row 19
D $8B80 #ZX$AB80
D $8B80 Used by the routine at #A$3326.
B $8B80,96,8
b $8BE0 Personal timetable for ERIC's pellet
D $8BE0 #ZX$ABE0
D $8BE0 This timetable is not used, but every entry points at command list #R$40E5($8A).
B $8BE0,1,1 Lesson #LINK:LessonE0($E0) (DINNER (MR WITHIT)): #R$40E5($8A) (Do nothing)
B $8BE1,1,1 Lesson #LINK:LessonE1($E1) (DINNER (MR WACKER)): #R$40E5($8A) (Do nothing)
B $8BE2,1,1 Lesson #LINK:LessonE2($E2) (MR WACKER - EXAM ROOM): #R$40E5($8A) (Do nothing)
B $8BE3,1,1 Lesson #LINK:LessonE3($E3) (MR ROCKITT - EXAM ROOM): #R$40E5($8A) (Do nothing)
B $8BE4,1,1 Lesson #LINK:LessonE4($E4) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8BE5,1,1 Lesson #LINK:LessonE5($E5) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8BE6,1,1 Lesson #LINK:LessonE6($E6) (REVISION LIBRARY): #R$40E5($8A) (Do nothing)
B $8BE7,1,1 Lesson #LINK:LessonE7($E7) (MR WITHIT - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8BE8,1,1 Lesson #LINK:LessonE8($E8) (MR WACKER - READING ROOM): #R$40E5($8A) (Do nothing)
B $8BE9,1,1 Lesson #LINK:LessonE9($E9) (MR ROCKITT - READING ROOM): #R$40E5($8A) (Do nothing)
B $8BEA,1,1 Lesson #LINK:LessonEA($EA) (MR CREAK - READING ROOM): #R$40E5($8A) (Do nothing)
B $8BEB,1,1 Lesson #LINK:LessonEB($EB) (MR CREAK - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8BEC,1,1 Lesson #LINK:LessonEC($EC) (MR WACKER - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8BED,1,1 Lesson #LINK:LessonED($ED) (MR WITHIT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8BEE,1,1 Lesson #LINK:LessonEE($EE) (MR ROCKITT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8BEF,1,1 Lesson #LINK:LessonEF($EF) (MR WACKER - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8BF0,1,1 Lesson #LINK:LessonF0($F0) (MR WITHIT - MAP ROOM): #R$40E5($8A) (Do nothing)
B $8BF1,1,1 Lesson #LINK:LessonF1($F1) (MR ROCKITT - WHITE ROOM): #R$40E5($8A) (Do nothing)
B $8BF2,1,1 Lesson #LINK:LessonF2($F2) (MR CREAK - READING ROOM): #R$40E5($8A) (Do nothing)
B $8BF3,1,1 Lesson #LINK:LessonF3($F3) (PLAYTIME (ANGELFACE has mumps)): #R$40E5($8A) (Do nothing)
B $8BF4,1,1 Lesson #LINK:LessonF4($F4) (PLAYTIME (EINSTEIN is going to grass on ERIC)): #R$40E5($8A) (Do nothing)
B $8BF5,1,1 Lesson #LINK:LessonF5($F5) (PLAYTIME (BOY WONDER has hidden a pea-shooter)): #R$40E5($8A) (Do nothing)
B $8BF6,1,1 Lesson #LINK:LessonF6($F6) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BF7,1,1 Lesson #LINK:LessonF7($F7) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BF8,1,1 Lesson #LINK:LessonF8($F8) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BF9,1,1 Lesson #LINK:LessonF9($F9) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BFA,1,1 Lesson #LINK:LessonFA($FA) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BFB,1,1 Lesson #LINK:LessonFB($FB) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BFC,1,1 Lesson #LINK:LessonFC($FC) (PLAYTIME (little boys stampede)): #R$40E5($8A) (Do nothing)
B $8BFD,1,1 Lesson #LINK:LessonFD($FD) (PLAYTIME (little boys stampede)): #R$40E5($8A) (Do nothing)
B $8BFE,1,1 Lesson #LINK:LessonFE($FE) (PLAYTIME): #R$40E5($8A) (Do nothing)
B $8BFF,1,1 Lesson #LINK:LessonFF($FF) (PLAYTIME): #R$40E5($8A) (Do nothing)
b $8C00 Skool tile references (LSBs) for row 20
D $8C00 #ZX$AC00
D $8C00 Used by the routine at #A$3326.
B $8C00,96,8
b $8C60 Character buffer for ERIC
D $8C60 #ZX$AC60
D $8C60 See the #LINK:CharacterBuffer(character buffer documentation) for details of how the buffer is used.
B $8C60,32,8
b $8C80 Skool colour information for row 20
D $8C80 #ZX$AC80
D $8C80 Used by the routine at #A$3326.
B $8C80,96,8
b $8CE0 Lesson descriptors
D $8CE0 #ZX$ACE0
D $8CE0 Used by the routine at #A$3AD5.
D $8CE0 Each entry in this table defines the teacher for the corresponding period (if any), and the room. The teacher is identified by bits 4-7:
D $8CE0 #TABLE(default) { =h Bits | =h Teacher } { 0000    | MR WACKER } { 0001    | MR ROCKITT  } { 0010    | MR WITHIT } { 0011    | MR CREAK } { 0100    | None } TABLE#
D $8CE0 The room is identified by bits 0-3:
D $8CE0 #TABLE(default) { =h Bits | =h Room } { 0001    | READING ROOM } { 0010    | MAP ROOM } { 0011    | WHITE ROOM } { 0100    | EXAM ROOM } { 0101    | REVISION LIBRARY } { 0110    | DINNER } { 0111    | PLAYTIME } TABLE#
B $8CE0,1,1 Lesson #LINK:LessonE0($E0): DINNER (MR WITHIT)
B $8CE1,1,1 Lesson #LINK:LessonE1($E1): DINNER (MR WACKER)
B $8CE2,1,1 Lesson #LINK:LessonE2($E2): MR WACKER - EXAM ROOM
B $8CE3,1,1 Lesson #LINK:LessonE3($E3): MR ROCKITT - EXAM ROOM
B $8CE4,1,1 Lesson #LINK:LessonE4($E4): REVISION LIBRARY
B $8CE5,1,1 Lesson #LINK:LessonE5($E5): REVISION LIBRARY
B $8CE6,1,1 Lesson #LINK:LessonE6($E6): REVISION LIBRARY
B $8CE7,1,1 Lesson #LINK:LessonE7($E7): MR WITHIT - MAP ROOM
B $8CE8,1,1 Lesson #LINK:LessonE8($E8): MR WACKER - READING ROOM
B $8CE9,1,1 Lesson #LINK:LessonE9($E9): MR ROCKITT - READING ROOM
B $8CEA,1,1 Lesson #LINK:LessonEA($EA): MR CREAK - READING ROOM
B $8CEB,1,1 Lesson #LINK:LessonEB($EB): MR CREAK - WHITE ROOM
B $8CEC,1,1 Lesson #LINK:LessonEC($EC): MR WACKER - WHITE ROOM
B $8CED,1,1 Lesson #LINK:LessonED($ED): MR WITHIT - WHITE ROOM
B $8CEE,1,1 Lesson #LINK:LessonEE($EE): MR ROCKITT - WHITE ROOM
B $8CEF,1,1 Lesson #LINK:LessonEF($EF): MR WACKER - MAP ROOM
B $8CF0,1,1 Lesson #LINK:LessonF0($F0): MR WITHIT - MAP ROOM
B $8CF1,1,1 Lesson #LINK:LessonF1($F1): MR ROCKITT - WHITE ROOM
B $8CF2,1,1 Lesson #LINK:LessonF2($F2): MR CREAK - READING ROOM
B $8CF3,1,1 Lesson #LINK:LessonF3($F3): PLAYTIME (ANGELFACE has mumps)
B $8CF4,1,1 Lesson #LINK:LessonF4($F4): PLAYTIME (EINSTEIN is going to grass on ERIC)
B $8CF5,1,1 Lesson #LINK:LessonF5($F5): PLAYTIME (BOY WONDER has hidden a pea-shooter)
B $8CF6,1,1 Lesson #LINK:LessonF6($F6): PLAYTIME
B $8CF7,1,1 Lesson #LINK:LessonF7($F7): PLAYTIME
B $8CF8,1,1 Lesson #LINK:LessonF8($F8): PLAYTIME
B $8CF9,1,1 Lesson #LINK:LessonF9($F9): PLAYTIME
B $8CFA,1,1 Lesson #LINK:LessonFA($FA): PLAYTIME
B $8CFB,1,1 Lesson #LINK:LessonFB($FB): PLAYTIME
B $8CFC,1,1 Lesson #LINK:LessonFC($FC): PLAYTIME (little boys stampede)
B $8CFD,1,1 Lesson #LINK:LessonFD($FD): PLAYTIME (little boys stampede)
B $8CFE,1,1 Lesson #LINK:LessonFE($FE): PLAYTIME
B $8CFF,1,1 Lesson #LINK:LessonFF($FF): PLAYTIME
b $8D00 Tile references for animatory states $00-$67 at row 0, column 0
D $8D00 #ZX$AD00
D $8D00 Used by the routines at #A$322E and #A$3326.
B $8D00,104,8
t $8D68 CAST OF CHARACTERS
D $8D68 Used by the routine at #A$BE09.
B $8D68,19,c18,1
u $8D7B Unused
D $8D7B #ZX$AD7B
B $8D7B,4,4
b $8D7F Tile references for animatory states $7F-$E7 at row 0, column 0
D $8D7F #ZX$AD7F
D $8D7F Used by the routines at #A$322E and #A$3326.
B $8D7F,105,8*13,1
t $8DE8 your own names Y/N?
D $8DE8 Used by the routine at #A$BE09. See also #A$4468.
B $8DE8,23,c19,4
b $8DFF Tile reference for animatory state $FF at row 0, column 0
D $8DFF #ZX$ADFF
D $8DFF Used by the routines at #A$322E and #A$3326.
B $8DFF,1,1
b $8E00 Tile references for animatory states $00-$67 at row 1, column 0
D $8E00 #ZX$AE00
D $8E00 Used by the routines at #A$322E and #A$3326.
B $8E00,104,8
t $8E68 PRESS'C'TO CHANGE NAME
D $8E68 Used by the routine at #A$BE09.
B $8E68,23,c22,1
b $8E7F Tile references for animatory states $7F-$E7 at row 1, column 0
D $8E7F #ZX$AE7F
D $8E7F Used by the routines at #A$322E and #A$3326.
B $8E7F,105,8*13,1
u $8EE8 Z80 code remnants
D $8EE8 #ZX$AEE8
B $8EE8,1,1 LD A,(DE)
B $8EE9,1,1 INC DE
B $8EEA,1,1 AND A
B $8EEB,1,1 RET Z
B $8EEC,1,1 LD L,A
B $8EED,2,2 LD H,$D9
B $8EEF,1,1 LD B,(HL)
B $8EF0,1,1 INC H
B $8EF1,1,1 LD A,(HL)
B $8EF2,3,3 CALL $ADE8
B $8EF5,1,1 DEC C
B $8EF6,2,2 DJNZ $AEF0
B $8EF8,1,1 XOR A
B $8EF9,1,1 DEC C
B $8EFA,3,3 CALL $ADE8
B $8EFD,2,2 JR $AEE8
b $8EFF Tile reference for animatory state $FF at row 1, column 0
D $8EFF #ZX$AEFF
D $8EFF Used by the routines at #A$322E and #A$3326.
B $8EFF,1,1
b $8F00 Tile references for animatory states $00-$67 at row 2, column 0
D $8F00 #ZX$AF00
D $8F00 Used by the routines at #A$322E and #A$3326.
B $8F00,104,8
t $8F68 ENTER NEW NAME
D $8F68 Used by the routine at #A$BE09.
B $8F68,23,c14,9
b $8F7F Tile references for animatory states $7F-$E7 at row 2, column 0
D $8F7F #ZX$AF7F
D $8F7F Used by the routines at #A$322E and #A$3326.
B $8F7F,105,8*13,1
c $8FE8 Wipe a character's name
D $8FE8 Used by the routine at #A$BE09.
R $8FE8 /(#A$72)/ LSB of the address of the character's name
C $8FE8,4 Set the MSB of the message address at #A$D6 to that of #A$8F68 (ENTER NEW NAME).
C $8FEC,8 Store the address of the character's name at #A$4E.
C $8FF4,9 Replace the existing name with zeroes.
u $8FFE Unused
B $8FFE,1,1
b $8FFF Tile reference for animatory state $FF at row 2, column 0
D $8FFF #ZX$AFFF
D $8FFF Used by the routines at #A$322E and #A$3326.
B $8FFF,1,1
b $9000 Tile references for animatory states $00-$67 at row 3, column 0
D $9000 #ZX$B000
D $9000 Used by the routines at #A$322E and #A$3326.
B $9000,104,8
t $9068 OUR HERO
D $9068 Used by the routine at #A$BE09.
B $9068,23,c8,8,7
b $907F Tile references for animatory states $7F-$E7 at row 3, column 0
D $907F #ZX$B07F
D $907F Used by the routines at #A$322E and #A$3326.
B $907F,105,8*13,1
b $90E8 LSBs of the addresses of the main characters' names
D $90E8 Used by the routine at #A$BE09.
B $90E8,1,1 LSB of #A$47B8 (MR WACKER).
B $90E9,1,1 LSB of #A$47C6 (MR ROCKITT).
B $90EA,1,1 LSB of #A$47D4 (MR WITHIT).
B $90EB,1,1 LSB of #A$47E2 (MR CREAK).
B $90EC,1,1 LSB of #A$479C (ANGELFACE).
B $90ED,1,1 LSB of #A$478E (BOY WONDER).
B $90EE,1,1 LSB of #A$47AA (EINSTEIN).
B $90EF,1,1 LSB of #A$4780 (ERIC).
u $90F0 Z80 code remnants
D $90F0 #ZX$B0E8
B $90F0,1,1 Third byte of 'LD DE,$40E0'.
B $90F1,1,1 PUSH BC
B $90F2,3,3 CALL $AFE8
B $90F5,1,1 POP BC
B $90F6,3,3 CALL $B072
B $90F9,2,2 LD H,$D9
B $90FB,1,1 PUSH HL
B $90FC,3,3 JP $B1E8
b $90FF Tile reference for animatory state $FF at row 3, column 0
D $90FF #ZX$B0FF
D $90FF Used by the routines at #A$322E and #A$3326.
B $90FF,1,1
b $9100 Tile references for animatory states $00-$67 at row 0, column 1
D $9100 #ZX$B100
D $9100 Used by the routines at #A$322E and #A$3326.
B $9100,104,8
t $9168 THE SWOT
D $9168 Used by the routine at #A$BE09.
B $9168,23,c8,8,7
b $917F Tile references for animatory states $7F-$E7 at row 0, column 1
D $917F #ZX$B17F
D $917F Used by the routines at #A$322E and #A$3326.
B $917F,105,8*13,1
c $91E8 Move sprites #0-#6 left by 64 pixels (2)
D $91E8 Used by the routine at #A$98E8.
R $91E8 X Bit 8 of the sprites' x-coordinates
C $91E8,2 Bits 0-7 of the x-coordinate of sprite #7 is at $D00E.
C $91EA,1 Compensate for the TAX instruction coming next.
N $91EB This entry point is used by the routine at #A$92E8.
C $91EB,1 Transfer bit 8 of the sprites' x-coordinates to `X`.
C $91EC,2 Decrease `Y` by 2 to point at bits 0-7 of the x-coordinate of the next sprite.
C $91EE,2 Branch if `Y` is still non-negative.
C $91F0,3 Update bit 8 of the sprites' x-coordinates.
C $91F3,3 Enable sprites #0-#6.
C $91F6,3 Modify the LSB of the operand of the 'LDA nnnn' instruction at #A$92E8.
C $91F9,3 Modify the LSB of the operand of the 'STA nnnn' instruction at #A$92EE.
C $91FC,3 Continue at #A$92E8.
b $91FF Tile reference for animatory state $FF at row 0, column 1
D $91FF #ZX$B1FF
D $91FF Used by the routines at #A$322E and #A$3326.
B $91FF,1,1
b $9200 Tile references for animatory states $00-$67 at row 1, column 1
D $9200 #ZX$B200
D $9200 Used by the routines at #A$322E and #A$3326.
B $9200,104,8
t $9268 THE TEARAWAY
D $9268 Used by the routine at #A$BE09.
B $9268,23,c12,8,3
b $927F Tile references for animatory states $7F-$E7 at row 1, column 1
D $927F #ZX$B27F
D $927F Used by the routines at #A$322E and #A$3326.
B $927F,105,8*13,1
c $92E8 Move sprites #0-#6 left by 64 pixels (3)
D $92E8 Used by the routine at #A$91E8.
R $92E8 X Bit 8 of the sprites' x-coordinates
C $92E8,9 Subtract 64 from the x-coordinate (bits 0-7) of sprite #0, #1, #2, #3, #4, #5 or #6. The operands of the LDA and STA instructions here are modified by the routine at #A$91E8.
C $92F1,2 Branch if the result is less than 0.
C $92F3,4 Clear bit 7 of `X`. This clears the record of bit 8 of the same sprite's x-coordinate.
C $92F7,1 Transfer bit 8 of the sprites' x-coordinates to `A`.
C $92F8,4 Rotate `A` left, including bit 7 into bit 0.
C $92FC,3 Point at the next sprite before returning to this routine.
b $92FF Tile reference for animatory state $FF at row 1, column 1
D $92FF #ZX$B2FF
D $92FF Used by the routines at #A$322E and #A$3326.
B $92FF,1,1
b $9300 Tile references for animatory states $00-$67 at row 2, column 1
D $9300 #ZX$B300
D $9300 Used by the routines at #A$322E and #A$3326.
B $9300,104,8
t $9368 THE BULLY
D $9368 Used by the routine at #A$BE09.
B $9368,23,c9,8,6
b $937F Tile references for animatory states $7F-$E7 at row 2, column 1
D $937F #ZX$B37F
D $937F Used by the routines at #A$322E and #A$3326.
B $937F,105,8*13,1
c $93E8 Move sprites #0-#6 right by 64 pixels (2)
D $93E8 Used by the routine at #A$9868.
R $93E8 X Bit 8 of the sprites' x-coordinates
C $93E8,2 Bits 0-7 of the x-coordinate of sprite #7 is at $D00E.
C $93EA,1 Compensate for the TAX instruction coming next.
N $93EB This entry point is used by the routine at #A$94E8.
C $93EB,1 Transfer bit 8 of the sprites' x-coordinates to `X`.
C $93EC,2 Decrease `Y` by 2 to point at bits 0-7 of the x-coordinate of the next sprite.
C $93EE,2 Branch if `Y` is still non-negative.
C $93F0,3 Update bit 8 of the sprites' x-coordinates.
C $93F3,3 Enable sprites #0-#6.
C $93F6,3 Modify the LSB of the operand of the 'LDA nnnn' instruction at #A$94E8.
C $93F9,3 Modify the LSB of the operand of the 'STA nnnn' instruction at #A$94EE.
C $93FC,3 Continue at #A$94E8.
b $93FF Tile reference for animatory state $FF at row 2, column 1
D $93FF #ZX$B3FF
D $93FF Used by the routines at #A$322E and #A$3326.
B $93FF,1,1
b $9400 Tile references for animatory states $00-$67 at row 3, column 1
D $9400 #ZX$B400
D $9400 Used by the routines at #A$322E and #A$3326.
B $9400,104,8
t $9468 THE HISTORY MASTER
D $9468 Used by the routine at #A$BE09.
B $9468,23,c18,5
b $947F Tile references for animatory states $7F-$E7 at row 3, column 1
D $947F #ZX$B47F
D $947F Used by the routines at #A$322E and #A$3326.
B $947F,105,8*13,1
c $94E8 Move sprites #0-#6 right by 64 pixels (3)
D $94E8 Used by the routine at #A$93E8.
R $94E8 X Bit 8 of the sprites' x-coordinates
C $94E8,9 Add 64 to the x-coordinate (bits 0-7) of sprite #0, #1, #2, #3, #4, #5 or #6. The operands of the LDA and STA instructions here are modified by the routine at #A$93E8.
C $94F1,2 Branch unless there was overflow on addition.
C $94F3,4 Set bit 7 of `X`. This sets the record of bit 8 of the same sprite's x-coordinate.
C $94F7,1 Transfer bit 8 of the sprites' x-coordinates to `A`.
C $94F8,4 Rotate `A` left, including bit 7 into bit 0.
C $94FC,3 Point at the next sprite before returning to this routine.
b $94FF Tile reference for animatory state $FF at row 3, column 1
D $94FF #ZX$B4FF
D $94FF Used by the routines at #A$322E and #A$3326.
B $94FF,1,1
b $9500 Tile references for animatory states $00-$67 at row 0, column 2
D $9500 #ZX$B500
D $9500 Used by the routines at #A$322E and #A$3326.
B $9500,104,8
t $9568 THE GEOGRAPHY TEACHER
D $9568 Used by the routine at #A$BE09.
B $9568,23,c21,2
b $957F Tile references for animatory states $7F-$E7 at row 0, column 2
D $957F #ZX$B57F
D $957F Used by the routines at #A$322E and #A$3326.
B $957F,105,8*13,1
c $95E8 Check the x-coordinate of the leftmost section of the speech bubble (1)
D $95E8 Used by the routines at #A$9868 and #A$98E8.
C $95E8,3 Are any sprites currently enabled?
C $95EB,2 Branch if not.
C $95ED,3 Pick up the x-coordinate of sprite #2 (bits 0-7).
C $95F0,5 Disable all sprites.
C $95F5,4 Move bit 8 of sprite #2's x-coordinate into bit 3 of `A`.
C $95F9,3 Set the zero flag if bit 8 of the x-coordinate of sprite #2 is reset.
C $95FC,2 Drop the return address from the stack.
b $95FF Tile reference for animatory state $FF at row 0, column 2
D $95FF #ZX$B5FF
D $95FF Used by the routines at #A$322E and #A$3326.
B $95FF,1,1
b $9600 Tile references for animatory states $00-$67 at row 1, column 2
D $9600 #ZX$B600
D $9600 Used by the routines at #A$322E and #A$3326.
B $9600,104,8
t $9668 THE SCIENCE TEACHER
D $9668 Used by the routine at #A$BE09.
B $9668,23,c19,4
b $967F Tile references for animatory states $7F-$E7 at row 1, column 2
D $967F #ZX$B67F
D $967F Used by the routines at #A$322E and #A$3326.
B $967F,105,8*13,1
c $96E8 Make the character who is currently speaking stop speaking (1)
D $96E8 Used by the routines at #A$9868 and #A$98E8.
C $96E8,2 The character buffer for little boy no. 10 (the only little boy who ever speaks) is in page $81.
N $96EA This entry point is used by the routine at #A$97E8.
C $96EA,1 Point at the next character.
C $96EB,2 Have we reached character buffer for BOY WONDER's pellet yet?
C $96ED,2 Branch if not.
C $96F0,3 Modify the MSB of the 'LDA nnnn' instruction at #A$96F9 below.
C $96F3,3 Modify the MSB of the 'LDA nnnn' instruction at #A$97EC.
C $96F6,3 Modify the MSB of the 'STA nnnn' instruction at #A$97F5.
C $96F9,3 Pick up the LSB of a character's interruptible subcommand routine address. The operand of this instruction is modified above.
C $96FC,3 Continue at #A$97E8.
b $96FF Tile reference for animatory state $FF at row 1, column 2
D $96FF #ZX$B6FF
D $96FF Used by the routines at #A$322E and #A$3326.
B $96FF,1,1
b $9700 Tile references for animatory states $00-$67 at row 2, column 2
D $9700 #ZX$B700
D $9700 Used by the routines at #A$322E and #A$3326.
B $9700,104,8
t $9768 THE HEAD MASTER
D $9768 Used by the routine at #A$BE09.
B $9768,23,c15,8
b $977F Tile references for animatory states $7F-$E7 at row 2, column 2
D $977F #ZX$B77F
D $977F Used by the routines at #A$322E and #A$3326.
B $977F,105,8*13,1
c $97E8 Make the character who is currently speaking stop speaking (2)
D $97E8 Used by the routine at #A$96E8.
R $97E8 A LSB of the character's interruptible subcommand routine address
C $97E8,2 Does the LSB of the character's interruptible subcommand routine address match that of #A$2458?
C $97EA,2 Branch if not.
C $97EC,3 Pick up the MSB of a character's uninterruptible subcommand routine address. The operand of this instruction is modified by the routine at #A$96E8.
C $97EF,2 Does the MSB of the character's interruptible subcommand routine address match that of #A$2458?
C $97F1,2 Branch if not (this character is not speaking).
C $97F3,5 Replace the address of the interruptible subcommand routine in the character's buffer with that of #A$2462, effectively terminating the subcommand. The operand of the 'STA nnnn' instruction here is modified by the routine at #A$96E8.
C $97F9,3 Jump back to consider the next character.
u $97FC Unused
B $97FC,3,3
b $97FF Tile reference for animatory state $FF at row 2, column 2
D $97FF #ZX$B7FF
D $97FF Used by the routines at #A$322E and #A$3326.
B $97FF,1,1
b $9800 Tile references for animatory states $00-$67 at row 3, column 2
D $9800 #ZX$B800
D $9800 Used by the routines at #A$322E and #A$3326.
B $9800,104,8
c $9868 Move sprites #0-#6 right by 64 pixels (1)
D $9868 Used by the routine at #A$3072.
C $9868,4 Store the MSB of the base address of the colour information area at #A$5D for no apparent reason.
C $986C,3 Is bit 8 of the x-coordinate of sprite #2 (the leftmost section of the speech bubble) set?
C $986F,2 Branch if not.
C $9871,3 Otherwise make the character who is currently speaking stop speaking, because he's going to be shifted off screen.
C $9874,3 Move sprites #0-#6 right by 64 pixels.
c $9877 Enable sprites #0-#6
D $9877 Used by the routines at #A$91E8 and #A$93E8.
C $9877,5 Enable sprites #0-#6.
u $987D Unused
B $987D,2,2
b $987F Tile references for animatory states $7F-$E7 at row 3, column 2
D $987F #ZX$B87F
D $987F Used by the routines at #A$322E and #A$3326.
B $987F,105,8*13,1
c $98E8 Move sprites #0-#6 left by 64 pixels (1)
D $98E8 Used by the routine at #A$3113.
C $98E8,4 Store the MSB of the base address of the colour information area at #A$5D for no apparent reason.
C $98EC,3 Is bit 8 of the x-coordinate of sprite #2 (the leftmost section of the speech bubble) set?
C $98EF,2 Branch if so.
C $98F1,2 Is the x-coordinate of sprite #2 at least 64?
C $98F3,2 Branch if so.
C $98F5,3 Otherwise make the character who is currently speaking stop speaking, because he's going to be shifted off screen.
C $98F8,3 Move sprites #0-#6 left by 64 pixels.
c $98FB Check the x-coordinate of the leftmost section of the speech bubble (2)
D $98FB Used by the routine at #A$95E8. Returns with the zero flag set if bit 8 of the x-coordinate of sprite #2 (the leftmost section of the speech bubble) is reset.
R $98FB A Bit 8 of the sprites' x-coordinates (from $D010) rotated left
C $98FB,1 Transfer bit 8 of the sprites' x-coordinates to `X`.
C $98FC,2 Set the zero flag if bit 8 of the x-coordinate of sprite #2 is reset.
b $98FF Tile reference for animatory state $FF at row 3, column 2
D $98FF #ZX$B8FF
D $98FF Used by the routines at #A$322E and #A$3326.
B $98FF,1,1
b $9900 Sprite graphic data for the boys and the catapult pellet
D $9900 #ZX$B900
D $9900 Used by the routine at #A$3326.
D $9900 #UDGTABLE #FOR(0,15)(n,{ #FOR(0,15)(m,#UDG(#PC+m+16*n,$0F,2,512), | ) } ) TABLE#
B $9900,4096,16
b $A900 Sprite graphic data for the teachers
D $A900 #ZX$C900
D $A900 Used by the routine at #A$3326.
D $A900 #UDGTABLE #FOR(0,15)(n,{ #FOR(0,15)(m,#UDG(#PC+m+16*n,$0F,2,512), | ) } ) TABLE#
B $A900,4096,16
b $B900 Sprite information backup area
D $B900 Used by the routines at #A$38AC and #A$38EF.
B $B900,56,8
u $B938 Unused
B $B938,8,8
c $B940 Initialise voices #1, #2 and #3 for the theme tune
D $B940 Used by the routine at #A$BA00.
C $B940,5 Set voice #1 attack length to 8ms and decay length to 204ms.
C $B945,5 Set voice #2 attack length to 8ms and decay length to 3s.
C $B94A,5 Set voice #3 attack length to 8ms and decay length to 3s.
C $B94F,5 Set voice #1 sustain volume to 0 and release length to 6ms.
C $B954,5 Set voice #2 sustain volume to 0 and release length to 6ms.
C $B959,5 Set voice #3 sustain volume to 0 and release length to 6ms.
C $B95E,15 Initialise the voice control registers in the tune buffer at #A$BBB4: voice off; saw waveform enabled.
C $B96D,10 Set voice #1 pulse width to $8080.
C $B977,10 Set voice #2 pulse width to $8080.
C $B981,10 Set voice #3 pulse width to $8080.
C $B98B,10 Set filter cut off frequency to 0.
C $B995,5 Disable voice filters.
C $B99A,5 Set volume to maximum and disable filters.
c $B9A0 Initialise voices #1, #2 and #3 for the 'Got all shields' tune
D $B9A0 Used by the routine at #A$BA48.
C $B9A0,5 Set voice #1 attack length to 38ms and decay length to 204ms.
C $B9A5,5 Set voice #2 attack length to 16ms and decay length to 3s.
C $B9AA,5 Set voice #3 attack length to 16ms and decay length to 3s.
C $B9AF,5 Set voice #1 sustain volume to 0 and release length to 6ms.
C $B9B4,5 Set voice #2 sustain volume to 0 and release length to 6ms.
C $B9B9,5 Set voice #3 sustain volume to 0 and release length to 6ms.
C $B9BE,15 Initialise the voice control registers in the in the tune buffer at #A$BBB4: voice off; saw waveform enabled.
C $B9CD,10 Set voice #1 pulse width to $8080.
C $B9D7,10 Set voice #2 pulse width to 0.
C $B9E1,10 Set voice #3 pulse width to 0.
C $B9EB,10 Set filter cut off frequency to 0.
C $B9F5,5 Disable voice filters.
C $B9FA,5 Set volume to maximum and disable filters.
c $BA00 Play the theme tune
D $BA00 Used by the routines at #A$0800 and #A$2BB0.
C $BA00,1 Disable interrupts.
C $BA01,10 Set the interrupt routine address at $FFFE to #A$BAB4.
C $BA0B,3 Initialise the tune buffer.
C $BA0E,10 The theme tune data for voice #1 is at #A$BC00.
C $BA18,10 The theme tune data for voice #2 is at #A$BC41.
C $BA22,10 The theme tune data for voice #3 is at #A$BC5A.
C $BA2C,3 Initialise voices #1, #2 and #3.
C $BA2F,1 Re-enable interrupts to start playing the tune.
C $BA30,3 Has the tune finished playing yet?
C $BA33,2 Branch if so.
C $BA35,3 Otherwise check again.
C $BA38,1 Disable interrupts.
C $BA39,10 Set the interrupt routine address at $FFFE back to #A$39C7.
C $BA43,1 Re-enable interrupts.
C $BA44,3 Initialise voice #3.
c $BA48 Play the 'Got all shields' tune
D $BA48 Used by the routine at #A$2BB0.
C $BA48,1 Disable interrupts.
C $BA49,10 Set the interrupt routine address at $FFFE to #A$BAB4.
C $BA53,3 Initialise the tune buffer.
C $BA56,10 The 'Got all shields' tune data for voice #1 is at #A$BC73.
C $BA60,10 The 'Got all shields' tune data for voice #2 is at #A$BCA0.
C $BA6A,10 The 'Got all shields' tune data for voice #3 is at #A$BCC7.
C $BA74,3 Initialise voices #1, #2 and #3.
C $BA77,1 Re-enable interrupts to start playing the tune.
C $BA78,3 Has the tune finished playing yet?
C $BA7B,2 Branch if so.
C $BA7D,3 Otherwise check again.
C $BA80,1 Disable interrupts.
C $BA81,10 Set the interrupt routine address at $FFFE back to #A$39C7.
C $BA8B,1 Re-enable interrupts.
C $BA8C,3 Initialise voice #3.
c $BA90 Initialise the tune buffer
D $BA90 Used by the routines at #A$BA00 and #A$BA48.
C $BA90,8 Prepare to address the tune buffer at #A$BBB4.
C $BA98,10 Fill the buffer with zeroes.
c $BAA3 Collect a byte from a tune data table
D $BAA3 Used by the routine at #A$BAB4.
R $BAA3 X 0 (voice #1), 1 (voice #2) or 2 (voice #3)
R $BAA3 /(#R$4E($4E,$4F))/ Address of the tune data table
R $BAA3 O:A Tune data byte
C $BAA3,3 Pick up the index of the next tune data byte.
C $BAA6,2 Pick up the tune data byte.
C $BAA8,5 Increment the tune data byte index and the MSB of the tune data table address if necessary.
C $BAAD,1 Save the tune data byte on the stack.
C $BAAE,4 Update the tune data byte index stored at #R$BBC0($BBC0/1/2).
C $BAB2,1 Restore the tune data byte to `A`.
c $BAB4 Tune-playing interrupt routine
D $BAB4 The address of this routine is placed at $FFFE by the routines at #A$BA00 and #A$BA48.
C $BAB4,1 Push `A` onto the stack.
C $BAB5,2 Push `X` onto the stack.
C $BAB7,2 Push `Y` onto the stack.
C $BAB9,6 Increment the timing counter at #A$BBCA and pick up the new value.
C $BABF,2 Is it 4?
C $BAC1,2 Branch if so.
C $BAC3,3 Otherwise jump to the regular interrupt routine.
C $BAC6,2 `X` indicates the voice being dealt with.
C $BAC8,3 Reset the timing counter at #A$BBCA to 0.
C $BACB,2 Pointlessly store `X` at #A$4E.
C $BACD,3 Save the voice indicator at #A$BBBF.
C $BAD0,10 Copy the tune data address for the current voice to #A$4E.
C $BADA,3 Is it time to play the next note for the current voice?
C $BADD,2 Branch if so.
C $BADF,3 Decrement the note duration counter for the current voice.
C $BAE2,3 Jump forward to consider the next voice.
C $BAE5,3 Pick up the stored value of the control register for the current voice.
C $BAE8,2 Reset bit 0: voice off, release cycle.
C $BAEA,2 Are we dealing with voice #3?
C $BAEC,2 Branch if so.
C $BAEE,2 Are we dealing with voice #2?
C $BAF0,2 Branch if so.
C $BAF2,3 Set voice #1 control register: voice off, release cycle.
C $BAF5,3 Jump forward.
C $BAF8,3 Set voice #2 control register: voice off, release cycle.
C $BAFB,3 Jump forward.
C $BAFE,3 Set voice #3 control register: voice off, release cycle.
C $BB01,3 Collect a byte (the note frequency specifier) from the tune data table.
C $BB04,3 Store the note frequency specifier at #A$BBB4.
C $BB07,1 Have we reached the end of the tune data table for this voice?
C $BB08,2 Branch if so.
C $BB0A,3 Collect the next byte (the note duration specifier) from the tune data table.
C $BB0D,6 Store the note duration specifier at the appropriate location for the current voice and decrement it.
C $BB13,3 Pick up the note frequency specifier just collected from the tune data table; call it F.
C $BB16,2 Branch if F is zero (this never happens).
C $BB18,18 Store 7-F/16 at #A$BBB5.
C $BB2A,3 Pick up the note frequency specifier (F) again.
C $BB2D,3 Bits 0-3 of F indicate the base note frequency. Transfer them to `Y`.
C $BB30,12 Pick up the corresponding frequency value from the table at #A$BBD4 and copy it into the tune buffer at the appropriate location for the current voice.
C $BB3C,3 Pick up 7-F/16 from #A$BBB5.
C $BB3F,2 Branch if it's zero (this never happens).
C $BB41,9 Divide the frequency by 2**(7-F/16).
C $BB4A,8 Set bit 0 of the stored control register for the current voice: voice on, attack-decay-sustain cycle.
C $BB52,3 Jump forward.
C $BB55,8 Reset bit 0 of the stored control register for the current voice: voice off, release cycle.
C $BB5D,3 Jump forward.
C $BB60,5 Set the tune status indicator at #A$BBCE to $FF: the tune has finished playing.
C $BB65,3 Jump to the regular interrupt routine.
C $BB68,3 Pick up the voice indicator (0, 1, 2) from #A$BBBF. This instruction is never executed.
C $BB6B,5 Copy the tune data table address MSB from #R$4E($4F) into the tune buffer in case it was incremented.
C $BB70,1 Next voice.
C $BB71,2 Have we done voices #1, #2 and #3 now?
C $BB73,2 Branch if so.
C $BB75,3 Otherwise jump back to deal with the next voice.
C $BB78,1 `X`=2 (voice #3).
C $BB79,12 Set voice #3 frequency.
C $BB85,6 Set voice #3 control register.
C $BB8B,1 `X`=1 (voice #2).
C $BB8C,12 Set voice #2 frequency.
C $BB98,6 Set voice #2 control register.
C $BB9E,1 `X`=0 (voice #1).
C $BB9F,12 Set voice #1 frequency.
C $BBAB,6 Set voice #1 control register.
C $BBB1,3 Jump to the regular interrupt routine.
b $BBB4 Tune buffer
D $BBB4 Used by the routines at #A$B940, #A$B9A0, #A$BA00, #A$BA48, #A$BA90, #A$BAA3 and #A$BAB4.
B $BBB4,1,1 Temporary storage for the last note frequency specifier (F) collected from the tune data table.
B $BBB5,1,1 Temporary storage for 7-F/16.
B $BBB6,1,1 Voice #1 note duration counter.
B $BBB7,1,1 Voice #2 note duration counter.
B $BBB8,1,1 Voice #3 note duration counter.
B $BBB9,1,1 Voice #1 frequency LSB.
B $BBBA,1,1 Voice #2 frequency LSB.
B $BBBB,1,1 Voice #3 frequency LSB.
B $BBBC,1,1 Voice #1 frequency MSB.
B $BBBD,1,1 Voice #2 frequency MSB.
B $BBBE,1,1 Voice #3 frequency MSB.
B $BBBF,1,1 Voice indicator (0, 1, 2); written but never read.
B $BBC0,1,1 Voice #1 tune data byte index.
B $BBC1,1,1 Voice #2 tune data byte index.
B $BBC2,1,1 Voice #3 tune data byte index.
B $BBC3,1,1 Voice #1 tune data table address LSB.
B $BBC4,1,1 Voice #2 tune data table address LSB.
B $BBC5,1,1 Voice #3 tune data table address LSB.
B $BBC6,1,1 Voice #1 tune data table address MSB.
B $BBC7,1,1 Voice #2 tune data table address MSB.
B $BBC8,1,1 Voice #3 tune data table address MSB.
B $BBC9,1,1 Unused.
B $BBCA,1,1 Timing counter.
B $BBCB,1,1 Voice #1 control register.
B $BBCC,1,1 Voice #2 control register.
B $BBCD,1,1 Voice #3 control register.
B $BBCE,1,1 Tune status indicator ($FF if finished, 0 otherwise).
B $BBCF,5,1 Cleared by the routine at #A$BA90 but never used.
b $BBD4 Tune note frequencies
D $BBD4 Used by the routine at #A$BAB4.
D $BBD4 The first 12 bytes are note frequency LSBs.
B $BBD4,12,8,4
N $BBE0 The next 12 bytes are note frequency MSBs.
B $BBE0,12,8,4
u $BBEC Unused
B $BBEC,20,4,8
b $BC00 Theme tune data
D $BC00 Used by the routine at #A$BA00.
D $BC00 The first 32 pairs of bytes specify the frequency and duration of the notes for voice #1.
B $BC00,64,8
B $BC40,1,1 End marker.
N $BC41 The next 12 pairs of bytes specify the frequency and duration of the notes for voice #2.
B $BC41,24,8
B $BC59,1,1 End marker.
N $BC5A The next 12 pairs of bytes specify the frequency and duration of the notes for voice #3.
B $BC5A,24,8
B $BC72,1,1 End marker.
b $BC73 'Got all shields' tune data
D $BC73 Used by the routine at #A$BA48.
D $BC73 The first 22 pairs of bytes specify the frequency and duration of the notes for voice #1.
B $BC73,44,8*5,4
B $BC9F,1,1 End marker.
N $BCA0 The next 19 pairs of bytes specify the frequency and duration of the notes for voice #2.
B $BCA0,38,8*4,6
B $BCC6,1,1 End marker.
N $BCC7 The next 11 pairs of bytes specify the frequency and duration of the notes for voice #3.
B $BCC7,22,8*2,6
B $BCDD,1,1 End marker.
u $BCDE Unused
B $BCDE,34,2,8
c $BD00 Manage sound effects
D $BD00 Called from the main loop at #A$0800.
C $BD00,2 Pick up the sound effect identifier from #A$2C.
C $BD02,2 Is the shield-hitting sound effect currently playing?
C $BD04,2 Branch if not.
C $BD06,3 Otherwise jump forward.
C $BD09,2 Is the jumping sound effect currently playing?
C $BD0B,2 Branch if not.
C $BD0D,3 Otherwise jump forward.
C $BD10,2 Is the bell ringing?
C $BD12,2 Branch if not.
C $BD14,3 Otherwise jump forward.
C $BD17,3 Return.
N $BD1A The value at #A$2C is 1: shield-hitting sound effect.
C $BD1A,2 Decrement the sound effect timer at #A$2D.
C $BD1C,4 Is the sound effect timer equal to $10 now?
C $BD20,2 Branch if not.
C $BD22,10 Set voice #2 frequency to $4000.
C $BD2C,5 Set voice #2 attack length to 2ms and decay length to 6ms.
C $BD31,5 Set voice #2 sustain volume to maximum and release length to 6ms.
C $BD36,5 Set voice #2 control register: voice on, attack-decay-sustain cycle; triangle waveform enabled.
C $BD3B,3 Return.
C $BD3E,2 Is the sound effect timer equal to 0?
C $BD40,2 Branch if not.
C $BD42,5 Set voice #2 sustain volume to maximum and release length to 2.4s.
C $BD47,5 Set voice #2 control register: voice off, release cycle; triangle waveform enabled.
C $BD4C,6 Reset the sound effect identifier at #A$2C and the sound effect timer at #A$2D to 0.
C $BD52,3 Return.
C $BD55,11 Set `A` to 192-8*(#A$2D).
C $BD60,3 Make this the MSB of voice #2's frequency.
C $BD63,3 Return.
N $BD66 The value at #A$2C is 2: jumping sound effect.
C $BD66,2 Decrement the sound effect timer at #A$2D.
C $BD68,4 Is the sound effect timer equal to $20 now?
C $BD6C,2 Branch if not.
C $BD6E,10 Set voice #2 frequency to $A000.
C $BD78,5 Set voice #2 attack length to 2ms and decay length to 6ms.
C $BD7D,5 Set voice #2 sustain volume to maximum and release length to 6ms.
C $BD82,5 Set voice #2 control register: voice on, attack-sustain-decay cycle; saw waveform enabled.
C $BD87,3 Return.
C $BD8A,2 Is the sound effect timer equal to 0?
C $BD8C,2 Branch if not.
C $BD8E,5 Set voice #2 sustain volume to maximum and release length to 240ms.
C $BD93,5 Set voice #2 control register: voice off, release cycle; saw waveform enabled.
C $BD98,6 Reset the sound effect identifier at #A$2C and the sound effect timer at #A$2D to 0.
C $BD9E,3 Return.
C $BDA1,11 Set `A` to 224-2*(#A$2D).
C $BDAC,3 Make this the MSB of voice #2's frequency.
C $BDAF,3 Return.
N $BDB2 The value at #A$2C is 3: lesson bell sound effect.
C $BDB2,2 Decrement the sound effect timer at #A$2D($2D).
C $BDB4,4 Is the sound effect timer equal to $20?
C $BDB8,2 Branch if not.
C $BDBA,10 Set voice #2 frequency to $3800.
C $BDC4,5 Set voice #2 attack length to 2ms and decay length to 6ms.
C $BDC9,5 Set voice #2 sustain volume to maximum and release length to 6ms.
C $BDCE,10 Set voice #2 pulse width to $4350.
C $BDD8,5 Set voice #2 control register: voice on, attack-decay-sustain cycle; rectangle waveform enabled.
C $BDDD,3 Return.
C $BDE0,2 Is the sound effect timer equal to 0?
C $BDE2,2 Branch if not.
C $BDE4,5 Set voice #2 sustain volume to maximum and release length to 114ms.
C $BDE9,5 Set voice #2 control register: voice off, release cycle; rectangle waveform enabled.
C $BDEE,6 Reset the sound effect identifier at #A$2C and the sound effect timer at #A$2D to 0.
C $BDF4,3 Return.
C $BDF7,1 Is the sound effect timer value even?
C $BDF8,2 Branch if so.
C $BDFA,2 This will be the MSB of voice 2's frequency.
C $BDFC,3 Jump forward.
C $BDFF,2 This will be the MSB of voice 2's frequency.
C $BE01,3 Set the MSB of voice #2's frequency to $37 or $39.
C $BE04,3 Return.
u $BE08 Unused
B $BE08,1,1
c $BE09 Change the characters' names if required
D $BE09 #ZX$FA49
D $BE09 Called from the main loop at #A$0800.
C $BE09,3 Prepare for a new game.
C $BE0C,2 `X` will count the characters from little boy no. 1 to ERIC.
C $BE0E,2 The second byte of a character's buffer holds his x-coordinate.
C $BE10,8 Prepare to address the character buffers, starting with little boy no. 1's at #A$7860.
C $BE18,1 Set `A` to 0.
C $BE19,14 Set the x-coordinate of every character to 0. Given that the leftmost column of the skool on screen has been initialised to 32, this places the character off screen to the left.
C $BE27,18 Change the instructions at #A$333F and #A$334B to 'LDA #$06' and 'LDA #$00'. This makes the routine at #A$3326 draw blank blue tiles.
C $BE39,3 Bring  a blank screen into view.
C $BE3C,8 #A$4468 is the address of the message 'Do you want to put in'. Store it at #A$D6.
C $BE44,4 The message will be 16 character cells wide. Store this width at #A$9D.
C $BE48,4 Store the number of bytes to copy from the text graphic buffer at #A$31.
C $BE4C,3 Write this message into the text graphic buffer and centre it.
C $BE4F,4 These are the coordinates at which to print the message.
C $BE53,3 Copy the text graphic buffer to the screen.
C $BE56,8 #A$8DE8 is the address of the message 'your own names Y/N?'. Store it at #A$D6.
C $BE5E,3 Write this message into the text graphic buffer and centre it.
C $BE61,4 These are the coordinates at which to print the message.
C $BE65,3 Copy the text graphic buffer to the screen.
C $BE68,4 Initialise the keyboard reading at #A$4C to 0.
C $BE6C,2 Pick up the keyboard reading at #A$4C.
C $BE6E,1 Transfer the reading to `Y`.
C $BE6F,2 Was 'Y' pressed?
C $BE71,2 Branch if so.
C $BE73,2 Was 'N' pressed?
C $BE75,2 Branch back if not to get another keyboard reading.
C $BE77,3 Jump forward.
N $BE7A The player has pressed 'Y' to change the names.
C $BE7A,8 #A$8D68 is the address of the message 'CAST OF CHARACTERS'. Store it at #A$D6.
C $BE82,3 Write this message into the text graphic buffer and centre it.
C $BE85,4 These are the coordinates at which to print the message.
C $BE89,3 Copy the text graphic buffer to the screen.
C $BE8C,4 Set the current character number at #A$60 to $14 (ERIC).
C $BE90,3 Copy the current character's buffer into page 0.
C $BE93,2 Pick up the current character number from #A$60.
C $BE95,2 Is it $14 (ERIC)?
C $BE97,2 Branch if not.
C $BE99,1 Set the carry flag to prepare for subtraction.
C $BE9A,2 Now `A`=$12 for ERIC.
C $BE9C,2 Store the modified character number ($0B-$12) at #A$52.
C $BE9E,8 Subtract this modified character number from $12 and then add $90. Now `A` holds $90-$97, the MSB of the address of the message that describes the current character.
C $BEA6,6 Store this address (#A$9068, #A$9168, #A$9268, #A$9368, #A$9468, #A$9568, #A$9668 or #A$9768) at #A$D6.
C $BEAC,3 Write the message into the text graphic buffer and centre it.
C $BEAF,4 These are the coordinates at which to print the message.
C $BEB3,3 Copy the text graphic buffer to the screen.
C $BEB6,2 Pick up the modified character number ($0B-$12) from #A$52.
C $BEB8,1 Set the carry flag to prepare for subtraction.
C $BEB9,2 Now `A`=$00-$07.
C $BEBB,1 Transfer this character identifier to `X`.
C $BEBC,5 Pick up the corresponding character name message address LSB from the table at #A$90E8 and store it at #A$72.
C $BEC1,6 Now the vector at #A$D6 holds the address of the character's name.
C $BEC7,3 Write the character's name into the text graphic buffer and centre it.
C $BECA,4 These are the coordinates at which to print the character's name.
C $BECE,3 Copy the text graphic buffer to the screen.
C $BED1,4 Set the character's x-coordinate to 28.
C $BED5,4 Set the character's y-coordinate to 10.
C $BED9,4 Initialise the counter at #A$AD.
C $BEDD,4 Set the character's destination x-coordinate to 50 (approximately the centre of the screen).
C $BEE1,3 Restore the character's buffer from page 0.
C $BEE4,3 Copy the character's buffer into page 0.
C $BEE7,3 Send the character one step along the way to the centre of the screen.
C $BEEA,10 Pause briefly.
C $BEF4,3 Restore the character's buffer from page 0.
C $BEF7,3 Update the display.
C $BEFA,2 Decrement the counter at #A$AD.
C $BEFC,2 Branch back unless it's zero now.
C $BEFE,8 Store #A$8E68 (PRESS'C'TO CHANGE NAME) at #A$D6.
C $BF06,3 Write this message into the text graphic buffer and centre it.
C $BF09,4 These are the coordinates at which to print the message.
C $BF0D,3 Copy the text graphic buffer to the screen.
C $BF10,4 Reset the keyboard reading at #A$4C to zero.
C $BF14,5 Wait for a keypress.
C $BF19,2 Was it 'C'?
C $BF1B,2 Branch if so.
C $BF1D,3 Otherwise jump forward.
N $BF20 'C' was pressed to change the character's name.
C $BF20,3 Wipe the character's name.
C $BF24,4 Change the address at #A$D6 to #A$8F68 (ENTER NEW NAME).
C $BF28,3 Write this message into the text graphic buffer and centre it.
C $BF2B,4 These are the coordinates at which to print the message.
C $BF2F,3 Copy the text graphic buffer to the screen.
C $BF32,10 Clear the character name entry buffer at #A$4700.
C $BF3C,8 Store the address of the (empty) character name entry buffer at #A$D6.
C $BF44,3 Write this blank message into the text graphic buffer and centre it.
C $BF47,4 These are the coordinates at which to print the message.
C $BF4B,3 Copy the text graphic buffer to the screen.
C $BF4E,2 `Y` will counter the number of letters entered so far.
C $BF50,4 Initialise the keyboard reading at #A$4C to 0.
C $BF54,2 Pick up the keyboard reading at #A$4C.
C $BF56,2 Branch back until a key has been pressed.
C $BF58,1 Transfer the keypress code to `X`.
C $BF59,2 Was SPACE pressed?
C $BF5B,2 Branch if so.
C $BF5D,2 Was RETURN pressed?
C $BF5F,2 Branch if so.
C $BF61,2 Is the character code less than $41 ('A')?
C $BF63,2 Branch back if so to get the next keypress.
C $BF65,2 Is the character code greater than $5A ('Z')?
C $BF67,2 Branch back if so to get the next keypress.
C $BF69,2 Have 12 letters already been entered?
C $BF6B,2 Branch back if so to get the next keypress.
C $BF6D,4 Transfer the keypress code back to `A` and store it in the character name buffer at #A$4700.
C $BF71,1 Next letter.
C $BF72,2 Save the letter counter on the stack.
C $BF74,8 Store the address of the character name entry buffer (#A$4700) at #A$D6.
C $BF7C,3 Write the name entered so far into the text graphic buffer and centre it.
C $BF7F,4 These are the coordinates at which to print the name.
C $BF83,3 Copy the text graphic buffer to the screen.
C $BF86,2 Restore the letter counter to `Y`.
C $BF88,14 Store the address of the character name entry buffer (#A$4700) at #A$4E and the address of the character's existing name at #A$50.
C $BF96,5 Point at the last letter entered in the character name entry buffer and copy it over the corresponding letter in the character's existing name.
C $BF9B,1 Increment the letter counter.
C $BF9E,3 Jump back to get another keypress.
N $BFA1 The character's name change has finished or been skipped. Time to walk the character off screen.
C $BFA1,4 Set the character's destination x-coordinate to 74 (off screen to the right).
C $BFA5,4 Initialise the counter at #A$AD.
C $BFA9,3 Restore the character's buffer from page 0.
C $BFAC,3 Copy the character's buffer to page 0.
C $BFAF,3 Send the character one step along the way off the screen.
C $BFB2,10 Pause briefly.
C $BFBC,3 Restore the character's buffer from page 0.
C $BFBF,3 Update the display.
C $BFC2,2 Decrement the counter at #A$AD.
C $BFC4,2 Branch back unless it's zero now.
C $BFC6,2 Pick up the current character number from #A$60.
C $BFC8,2 Is it $14 (ERIC)?
C $BFCA,2 Branch if not.
C $BFCC,4 Decrease the current character number at #A$60 by two (to $12), thus skipping over ERIC's and BOY WONDER's catapult pellets.
C $BFD0,2 Decrement the current character number at #A$60.
C $BFD2,2 Pick up the current character number from #A$60.
C $BFD4,2 Is it $0A (little boy no. 11)?
C $BFD6,2 Branch if so.
C $BFD8,3 Otherwise jump back to deal with the next character.
N $BFDB The player either pressed 'N' to leave the names alone, or has finished naming every character.
C $BFDB,18 Change the instructions at #A$333F and #A$334B back to 'LDA ($52),Y' and 'LDA ($54),Y'.
C $BFED,3 Prepare for a new game.
C $BFF0,4 Set the game mode indicator at #A$46 to 1.
c $BFF5 Write a message into the text graphic buffer and centre it
D $BFF5 Used by the routine at #A$BE09.
R $BFF5 /(#R$D6($D6,$D7))/ Address of the message
C $BFF5,3 Write the message into the text graphic buffer.
C $BFF8,3 Centre the text in the text graphic buffer.
i $BFFC
