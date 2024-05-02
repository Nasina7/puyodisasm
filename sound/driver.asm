; ==================================================
;
;   Compile Z80 Sound Driver disassembly by Nasina
;
; ==================================================
	cpu z80
	obj 0

	include "sound/z80_macros.asm"
	
	
; Layout of each channel in Z80 memory
; 00 - 
; 		Bits 7-1:	Unk
; 		Bit 0:		Channel Enabled
; 01 - 
; 		Bits 7-5: 	Unk
; 		Bits 4-0:	Volume
; 02 - Volume Sweep?
; 03 - Pitch Sweep?
; 04 - Unk
; 05 - Channel Playback Speed
; 06 - Unk
; 07-08 - Track Current Location (Little Endian 16-bit)
; 09 - 
; 		Bits 7-6: 	Panning (Bit 7 for Left, Bit 6 for Right)
;		Bits 5-4:	Unk
; 		Bits 3-0: 	Vibrato
; 0A - Instrument (Up to 4E makes noise)
; 0B - Unk
; 0C - 
; 		Bits 7-4: 	???
; 		Bit 3: 		Play next notes at constant pitch
; 		Bits 2-0: 	???
; 0D - Time that current note has played
; 0E - Length at which to start over currently playing note
; 0F - Unk Timer
; 10 - Unk
; 11 - Loop Timer for conditional loops
; 12 - Minor Pitch Adjustment
; 13 - Current Note
; 14 - Unk
; 15 - Unk
; 16-17 - Note Pitch 16 Bit version (Little Endian)
; 18-19 - Unk
; 1A-1B - Unk
; 1C-1D - Unk
; 1E-1F - Unk
; 20-21 - Unk
; 22-23 - Something related to vibrato?
; 24 - Unk
; 25-2F - Unused?


; Some memory locations
zPlaySoundId  = 	$0000 ; The latest sound for the sound driver to play
zPlayMusicId =		$0001 ; Same as above.  Only sometimes used compared to zPlaySoundId 
zUnkBitfield1 = 	$0021 ; Unknown bitfield, see below
	; Bit 7-6: Unk
	; Bit 5-4: Something to do with effects
	; Bit 3-2: Unk
	; Bit 1: Set if the game is paused, zero otherwise
	; Bit 0: Set if PCM data is playing, zero otherwise
	
zChannelArray = $1C00
	
; Define some I/O Ports
zPsgPort = 			$7F11

zReset:
	di
	jp 	Entry
; Some mem stuff goes here.
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
memloc_0008:
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00 ; $0F
mem_0010:
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00 
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
mem_0018:
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00 ; $1F
mem_0020:
	dc.b $00 
; mem_0021
	dc.b $00
mem_0022:
	dc.b $00
mem_0023:
	dc.b $00
mem_0024:
	dc.b $01
	dc.b $01
mem_0026:
	dc.b $01
mem_0027:
	dc.b $01
	dc.b $00
	dc.b $00
mem_002A:
	dc.b $00
	dc.b $00
mem_002C:
	dc.b $00
mem_002D:
	dc.b $00
mem_002E:
	dc.b $00
mem_002F:
	dc.b $00 ; $2F
mem_0030:
	dc.b $00
mem_0031:
	dc.b $00
	dc.b $00
	dc.b $00
	
; End of mem stuff
	di
	jp	Entry
Rst7:
	push af
	push bc
	push de
	push hl
	exx
	push bc
	push de
	push hl
	push ix
	push iy
	ld hl, (1F50h)
	push hl
	ld hl, (1F00h)
	call SwapBank
	call sub_0EAD
	call sub_09BB
	ld hl, zUnkBitfield1
	ld a, (hl)
	and a, 1h
	jp z, loc_006C
	ld a, (1F59h)
	cp $FA, a
	ld a, 2h
	jp nz, loc_0067+1 	; ?
loc_0067:
	ld a, 3h
	ld (1F25h), a
loc_006C:
	bit 1, (hl)
	jp nz, loc_0078
	ld a, (1E40h)
	and a, a
	jp z, loc_0080
loc_0078:
	ld b, 8Ch
	ld ix, 1E40h
	jr loc_0086
loc_0080:
	ld b, 0Bh
	ld ix, 1E10h
loc_0086:
	sub a, a
	ld (1F68h), a
	ld d, (ix+00h)
	cp d
	jp z, loc_0149
	ld e, (ix+0Bh)
	ld c, (ix+0Ch)
	exx
	ld a,(ix+05h)
	and a, a
	jr z, loc_00A7
	add (ix+0Fh)
	ld (ix+0Fh), a
	jp nc, loc_00E0
loc_00A7:
	ld b, (ix+0Dh)
	exx
	bit 4, d
	jr nz, loc_00D4
	bit 2, e
	jr z, loc_00D4
	exx
	ld a, (ix+15h)
	and a, a
	jr z, loc_00D5
	cp b
	jr z, loc_00C0
	jp nc, loc_00D5
loc_00C0:
	exx
	and a, 14h
	jr nz, loc_00D2
	ld a, (1F68h)
	or a, 4h
	ld (1F68h), a
	set 4, c
	ld (ix+0Ch), c
loc_00D2:	
	res 2, e
loc_00D4:
	exx
loc_00D5:
	inc b
	ld (ix+0Dh), b
	ld a, b
	cp (ix+0Eh)
	jp z, loc_028B
loc_00E0:
	ld b, (ix+01h)
	ld a, (ix+02h)
	add a
	jp nz, loc_00EE
	ld a, b
	jp loc_00F1
loc_00EE:
	call sub_06F4
loc_00F1:
	ld (1F69h), a
	exx
	bit 7, e
	exx
	call nz, sub_0757
	exx
	bit 3, c
	exx
	call nz, sub_08B1
	ld a, (ix+03h)
	and a, 3Fh
	add a
	call nz, sub_07CF
	ld a, (ix+22h)
	add a
	call nz, sub_098A
	call sub_09E9
	exx
	bit 5, e
	jp z, loc_0142
	ld a, (ix+18h)
	add (ix+19h)
	ld (ix+19h), a
	jr nc, loc_0142
	ld a, (ix+01h)
	cp (ix+1Ah)
	jp nz, loc_0134
	set 1, e
	jp loc_0142
loc_0134:
	res 1, e
	bit 4, e
	jr nz, loc_013E
	inc a
	jp loc_013F
loc_013E:
	dec a
loc_013F:
	ld (ix+01h), a
loc_0142:
	ld (ix+0Bh), e
	bit 5, d
	jr nz, loc_015B
loc_0149:
	ld de, $FFD0
	add ix, de
	dec b
	jp p, loc_0086
	inc b
	jp z, loc_016F
	res 7, b
	jp loc_0167
loc_015B:
	res 7, b
	dec b
	jp m, loc_016F
	ld de, $FFD0
	inc b
	add ix, de
loc_0167:
	set 6, (ix+0Ch)
	add ix, de
	djnz loc_0167
loc_016F:
	ld hl, zUnkBitfield1
	bit 5, (hl)
	jr z, loc_01A5
	ld de, (mem_002D)
	ld a, (mem_002C)
	add e
	ld (mem_002D), a
	jr nc, loc_01A5
	bit 4, (hl)
	jr nz, loc_019A
	ld a, (mem_002F)
	cp d
	jr z, loc_0195
	inc a
	ld (mem_002F), a
	cp d
	jp nz, loc_01A5
loc_0195:
	call sub_0F80
	jr loc_01A5
loc_019A:
	ld a, (mem_002F)
	cp d
	jp z, loc_01A5
	dec a
	ld (mem_002F), a
loc_01A5:
	ld a, (zUnkBitfield1)
	and a, 1h
	jp z, loc_01C3
	ld a, (1F25h)
	cp 2h
	jp c, loc_01C3
	cp 3h
	jp z, loc_01BF
	ld a, 3h
	ld (mem_0027), a
loc_01BF:
	sub a
	ld (1F25h), a
loc_01C3:
	call sub_01D8
	pop hl
	call SwapBank
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	exx
	pop hl
	pop de
	pop bc
	pop af
	ei
	ret
sub_01D8:
	ld hl, 1F70h
	ld b, 80h
loc_01DD:
	inc l
	ld a, (hl)
	and a, 0Fh
	or a, b
	ld (zPsgPort), a
	inc l
	ld a, (hl)
	and a, 3Fh
	ld (zPsgPort), a
	inc l
	ld a, b
	add 10h
	ld b, a
	ld a, (hl)
	cpl
	and a, 0Fh
	or a, b
	ld (zPsgPort), a
	inc l
	ld a, b
	add 10h
	ld b, a
	cp $E0
	jp nz, loc_01DD
	inc l
	ld a, (mem_0031)
	cp (hl)
	res 3, a
	ld (hl), a
	ld (mem_0031), a
	jp z, loc_0218
	and a, 7h
	or a, $E0
	ld (zPsgPort), a
loc_0218:
	inc l
	ld a, (hl)
	cpl
	or a, $F0
	ld (zPsgPort), a
	ld ix, 1F20h
	ld c, 0
	ld e, 0
	ld d, 7Fh
	ld hl, 4000h
loc_022D:
	ld a, (ix+00h)
	and a
	jp z, loc_023B
	ld (ix+12h), 1
	jp loc_0275
loc_023B:
	cp (ix+12h)
	jp z, loc_0275
	ld (ix+12h), 0
	exx
	ld e, (ix+06h)
	ld d, 0
	ld hl, ptr_0FD4
	add hl, de
	ld a, (hl)
	exx
	ld b, a
	ld a, c
	add 40h
loc_0255:
	sla b
	jp nc, loc_0262
	ld (hl), a
	inc l
	ld (hl), d
	dec l
	call sub_0FCE
	nop
loc_0262:
	add 4h
	cp 50h
	jp c, loc_0255
	sub 50h
	ld c, a
	ld a, 28h
	ld (4000h), a
	ld a, e
	ld (4001h), a
loc_0275:
	inc c
	inc e
	inc ix
	ld a, c
	cp 3h
	jp nz, loc_022D
	bit 2, e
	ret nz
	ld c, 0
	ld e, 4
	ld l, 2
	jp loc_022D
loc_028B:
	exx
	bit 0, c
	jp z, loc_02B7
	res 0, c
	ld (ix+0Ch), c
	ld a, (zUnkBitfield1)
	and a, 1h
	jr z, loc_02B7
	ld a, (1F59h)
	cp (ix+14h)
	jp nz, memloc_0008
	ld a, 2Bh
	ld (4000h), a
	sub a
	ld (4000h), a
	ld (1F25h), a
	ld a, 3
	ld (mem_0027), a
loc_02B7:
	exx
	ld e, (ix+07h)
	ld d, (ix+08h)
	jp loc_02C2

loc_02C1:
	inc de
loc_02C2:
	ld a, (de)
	and a
	jp p, PlayNote
	cp $C0
	jp nc, SetNoteLength
	inc de
	ld hl, loc_02C1

	push hl
	ld hl, tbl_commands
	ld b, 0
	add a
	ld c, a
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld a, (de)
	jp (hl)
	
tbl_commands:
	ptrZ80 CmdJump ; 3 Byte Command
	ptrZ80 sub_0338
	ptrZ80 sub_037E
	ptrZ80 sub_0387
	ptrZ80 sub_03C0
	ptrZ80 sub_03D9
	ptrZ80 sub_036F
	ptrZ80 sub_03BC
	ptrZ80 sub_038B
	ptrZ80 sub_038F
	ptrZ80 sub_03A6
	ptrZ80 sub_04CC
	ptrZ80 sub_0336
	ptrZ80 sub_0366
	ptrZ80 sub_0476
	ptrZ80 sub_0476
	ptrZ80 sub_039F ; Command 90h
	ptrZ80 sub_0402
	ptrZ80 sub_04C8
	ptrZ80 sub_0425
	ptrZ80 sub_0448
	ptrZ80 sub_0460
	ptrZ80 sub_0472
	ptrZ80 CmdSetMinorPitch ; 2 Byte Command
	ptrZ80 sub_04A4
	ptrZ80 sub_047A
	ptrZ80 sub_04D8
	ptrZ80 sub_04D8
	ptrZ80 sub_0412
	ptrZ80 sub_04A8
	ptrZ80 sub_0469
	ptrZ80 sub_04E3
	ptrZ80 sub_034F
	ptrZ80 sub_0491
	ptrZ80 sub_049B
	ptrZ80 sub_04D8
	ptrZ80 sub_04B6
	ptrZ80 sub_04BE
	ptrZ80 sub_04EE
	ptrZ80 sub_04F9
	ptrZ80 sub_054C
	
CmdJump:
	ld l, a
	inc de
	ld a, (de)
	ld h, a
	ex de,hl
sub_0336:
	dec de
	ret

sub_0338:
	inc de
	cp 11h
	jr z, loc_0346
	dec (ix+10h)
	ld a, (de)
	jp nz, CmdJump
	inc de
	ret
loc_0346:
	dec (ix+11h)
	ld a, (de)
	jp nz, CmdJump
	inc de
	ret

sub_034F:
	inc de
	cp 11h
	jr z, loc_035D
	dec (ix+10h)
	ld a, (de)
	jp z, CmdJump
	inc de
	ret

loc_035D:
	dec (ix+11h)
	ld a, (de)
	jp z, CmdJump
	inc de
	ret
	
sub_0366:
	ld c, a
	push ix
	pop hl
	add hl, bc
	inc de
	ld a, (de)
	ld (hl), a
	ret

sub_036F:
	ld a, 1
	ld (mem_0024), a
loc_0374:
	ld a, (ix+14h)
	ld (mem_0020), a
	sub a
	ld (mem_0024), a
sub_037E:
	ld (ix+00h), 0
	pop hl
	exx
	jp loc_0149

sub_0387:
	ld (ix+03h), a
	ret

sub_038B:
	ld (ix+02h), a
	ret

sub_038F:
	cp 80h
loc_0391:
	jr z, loc_039A
	add (ix+04h)
	ld (ix+04h), a
	ret
loc_039A:
	ld (ix+04h), 0
	ret

sub_039F:
	ld (ix+00h), a
	exx
	ld d, a
	exx
	ret

sub_03A6:
	ld c, (ix+01h)
	and a
	jp p, loc_03B5
	add c
	jr c, sub_03BC
	ld (ix+01h), 0
	ret
loc_03B5:
	add c
	cp 20h
	jr c, sub_03BC
	ld a, 1Fh
sub_03BC:
	ld (ix+01h), a
	ret

sub_03C0:
	exx
	and a
	jr z, loc_03D2
	ld (ix+20h), a
	set 3, c
	ld (ix+0Ch), c
loc_03CC:
	ld (ix+13h), 0
	exx
	ret
loc_03D2:
	res 3, c
	ld (ix+0Ch), c
	exx
	ret

sub_03D9:
	inc de
	ld b, a
	ld a, 1
	ld (mem_0026), a
	ld a, (mem_0022)
	cp 8h
	jr nc, loc_0400
	ld l, a
	ld h, 0
	ld (hl), b
	inc a
	ld (mem_0022), a
	add 7h
	ld l, a
	add 8h
	ld c, a
	ld a, (de)
	ld (hl), a
	ld l, c
	inc de
	ld a, (de)
	ld (hl), a
	sub a
	ld (mem_0026), a
	ret
loc_0400:
	inc de
	ret

sub_0402:
	ld b, a
	ld a, 1
	ld (mem_0024), a
	ld hl, mem_0020
	or (hl)
	ld (hl), b
	sub a
	ld (mem_0024), a
	ret

sub_0412:
	sub a, (ix+10h)
	ld c, a
	inc de
	ld a, (de)
	ld l, a
	inc de
	ld a, (de)
	ld h, a
	add hl, bc
	ld a, (hl)
	add (ix+04h)
	ld (ix+04h), a
	ret

sub_0425:
	exx
	res 1, e
	res 4, e
	and a, a
	jp p, loc_0430
	set 4, e
loc_0430:
	and a, 1Fh
	ld (ix+1Ah), a
	exx
loc_0436:
	inc de
	ld a, (de)
	ld (ix+18h), a
	ld (ix+19h), b
	exx
	set 5, e
	and a, a
	jr nz, loc_0446
	res 5, e
loc_0446:
	exx
	ret

sub_0448:
	exx
	res 6, e
	and a, a
loc_044C:
	jp p, loc_0451
loc_044F:
	set 6, e
loc_0451:
	set 7, e
	and a, 7Fh
	jr z, loc_045C
	ld (ix+21h), a
	exx
	ret
loc_045C:
	res 7, e
	exx
	ret

sub_0460:
	exx
	bit 1, e
	exx
	jp z, CmdJump
	inc de
	ret

sub_0469:
	exx
	bit 5, c
	exx
	jp nz, CmdJump
	inc de
	ret

sub_0472:
	ld (ix+05h), a
	ret

sub_0476:
	ld (ix+24h), a
	ret

sub_047A:
	exx
	ld a, d
	xor 10h
	ld d, a
	ld (ix+00h), a
	exx
	and a, 10h
	jr z, loc_048F
loc_0487:
	ld a, (1F68h)
	or a, 8h
	ld (1F68h), a
loc_048F:
	dec de
	ret

sub_0491:
	exx
	set 4, d
	ld (ix+00h), d
	exx
	jp loc_0487

sub_049B:
	exx
	res 4, d
loc_049E:
	ld (ix+00h), d
	exx
	dec de
	ret

sub_04A4:
	ld (ix+06h), a
	ret

sub_04A8:
	ld (ix+15h), a
	ret
	
CmdSetMinorPitch:
	and a, a
	jr z, loc_04B2
	add (ix+12h)
loc_04B2:
	ld (ix+12h), a
	ret

sub_04B6:
	cp (ix+06h)
	jr z, loc_04BD
	inc de
	inc de
loc_04BD:
	ret

sub_04BE:
	inc de
	cp (ix+06h)
	ld a, (de)
	jp z, CmdJump
	inc de
	ret

sub_04C8:
	ld (ix+22h), a
	ret

sub_04CC:
	ld (ix+0Ah), a
	ld a, (1F68h)
	or 10h
	ld (1F68h), a
	ret

sub_04D8:
	ld b, a
	ld a, (ix+09h)
	and a, $C0
	or b
	ld (ix+09h), a
	ret

sub_04E3:
	ld b, a
	ld a, (ix+09h)
	and a, 3Fh
	or b
	ld (ix+09h), a
	ret

sub_04EE:
	ld b, a
	ld a, 22h
	ld (4000h), a
	ld a, b
	ld (4001h), a
	ret

sub_04F9:
	and a, a
	jp m, loc_0545
	ld b, 1
loc_04FF:
	ld c, a
	ld a, (zUnkBitfield1)
	and a, 1
	jp z, loc_0514
	ld a, (1F58h)
	exx
	cp b
	exx
	jp c, loc_0514
	jp nz, loc_053B
loc_0514:
	ld a, (ix+09h)
	ld (1F57h), a
	exx
	ld a, b
	exx
	ld (1F58h), a
	ld a, c
	ld (1F55h), a
	ld a, b
	ld (mem_0027), a
	ld a, (ix+14h)
	ld (1F59h), a
	ld a, (zUnkBitfield1)
	or 1h
	ld (zUnkBitfield1), a
	ld a, 2
	ld (1F25h), a
loc_053B:
	exx
	set 0, c
	ld (ix+0Ch), c
	exx
	jp loc_0578
loc_0545:
	and a, 7Fh
	ld b, 2
	jp loc_04FF
sub_054C:
	ld b, a
	ld a, 1
	ld (mem_0026), a
	ld a, (mem_0022)
	cp 8h
	jr nc, loc_0578
	ld l, a
	ld h, 0
	ld (hl), $FC
	inc a
	ld (mem_0022), a
	add 7h
	ld l, a
	ld (hl), b
	add 8h
	ld l, a
	ld b, (ix+01h)
	ld (hl), b
	add 8h
	ld l, a
	ld b, (ix+04h)
	ld (hl), b
	sub a, a
	ld (mem_0026), a
loc_0578:
	ld hl, 1F68h
	set 6, (hl)
	ld a, (ix+13h)
	and a, a
	ex af,af
	ld (ix+17h), 1
	ld (ix+13h), 1
	inc de
	pop hl
	jp loc_0628

SetNoteLength:
	cp $DE
	jp nc, loc_05EE
	sub $C0
	add a
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, (mem_002A)
	add hl, bc
	ld a, (hl)
	ld (ix+0Ah), a
	ld a, (1F68h)
	or 10h
	ld (1F68h), a
	inc hl
	ld a, (hl)
	ld (ix+02h), a
	inc hl
	ld a, (hl)
	ld c, a
	inc hl
	ld a, (hl)
	ld b, a
	and a, 0Fh
	ld (ix+24h), a
	ld a, b
	and a, 60h
	rlca
	rlca
	rlca
	ld b, a
	exx
	ld a, d
	and a, $FC
	exx
	or b
	exx
	ld d, a
	ld (ix+00h), a
	exx
	bit 7, (hl)
	jr nz, loc_05DA
	exx
	res 7, e
	exx
	jp loc_05E0
loc_05DA:
	ld a, c
	call sub_0448
	ld c, 0
loc_05E0:
	ld (ix+03h), c
	inc hl
	ld a, (hl)
	ld (ix+09h), a
	inc hl
	ld a, (hl)
	and a
	jp PlayNote
loc_05EE:
	ld a, (ix+13h)
	ld c, a
	and a
	ex af,af
	ld a, c
	jp loc_0602
PlayNote:
	inc de
	ex af,af
	ld a, (ix+13h)
	and a
	ex af,af
	ld (ix+13h), a
loc_0602:
	call sub_06BB
	exx
	bit 3, c
	exx
	jp z, loc_0622
	ld a, (ix+13h)
	and a
	jp z, loc_0622
	ld (ix+1Dh), b
	ld (ix+1Ch), c
	ex af,af
	jp z, loc_0621
	ex af,af
	jp loc_0628
loc_0621:
	ex af,af
loc_0622:
	ld (ix+16h), c
	ld (ix+17h), b
loc_0628:
	ld a, (de)
	sub $EF
	jp c, loc_064A
	jp nz, loc_0636
	inc de
	ld a, (de)
	jp loc_063E
loc_0636:
	ld hl, (8002h)
	ld c, a
	ld b, 0
	add hl, bc
	ld a, (hl)
loc_063E:
	inc de
	ld (ix+0Eh), a
	ld a, (de)
	ld (ix+15h), a
	inc de
	jp loc_0665
loc_064A:
	sub $EF
	jr z, loc_0654
	jp nc, loc_0659
	jp loc_0665
loc_0654:
	inc de
	ld a, (de)
	jp loc_0661
loc_0659:
	ld hl, (8002h)
	ld c, a
	ld b, 0
	add hl, bc
	ld a, (hl)
loc_0661:
	inc de
	ld (ix+0Eh), a
loc_0665:
	sub a
	ld (ix+0Dh), a
	exx
	ld hl, 1F68h
	ex af,af
	jr z, loc_0691
	bit 4, d
	jr z, loc_0682
	bit 3, (hl)
	jp nz, loc_0682
	bit 6, c
	jr z, loc_06A0
	set 5, (hl)
	jp loc_06A0
loc_0682:
	bit 2, d
	jp z, loc_0691
	bit 4, (hl)
	jp nz, loc_0691
	bit 6, c
	jp z, loc_0693
loc_0691:
	set 5, (hl)
loc_0693:
	sub a
	ld (ix+1Eh), a
	ld (ix+1Fh), a
	ld (ix+23h), 0
	set 2, e
loc_06A0:
	bit 6, (hl)
	jp z, loc_06AA
	set 6, c
	jp loc_06AC
loc_06AA:
	res 6, c
loc_06AC:
	ld (ix+0Ch), c
	set 7, (hl)
	exx
	ld (ix+08h), d
	ld (ix+07h), e
	jp loc_00E0
sub_06BB:
	ld bc, 0
	and a
	ret z
	exx
	bit 3, d
	exx
	jr nz, loc_06EC
	add (ix+04h)
	add a
	ld c, a
	ld a, (ix+0Ah)
	and a
	ld hl, ptr_0D21
	jp nz, loc_06D8
	ld hl, ptr_0DB9
loc_06D8:
	add hl, bc
	ld c, (hl)
	inc hl
	ld b, (hl)
	ld a, (ix+12h)
	and a
	ret z
	ld h, 0
	jp p, loc_06E7
	dec h
loc_06E7:
	ld l, a
	add hl, bc
	ld c, l
	ld b, h
	ret
loc_06EC:
	ld c, a
	add (ix+04h)
	ld (ix+24h), a
	ret

sub_06F4:
	ld hl, (8004h)
	ld e, a
	ld d, 0
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld e, (ix+1Eh)
	add hl, de
	ld a, (hl)
	and a
	jp p, loc_0714
	cp 80h
	jr nz, loc_0711
	dec hl
	ld a, (hl)
	jp loc_0718
loc_0711:
	call sub_071E
loc_0714:
	inc e
	ld (ix+1Eh), e
loc_0718:
	add b
	sub a, 1Fh
	ret nc
	sub a
	ret

sub_071E:
	cp 81h
	jp nz, loc_072D
loc_0723:
	inc hl
	ld a, e
	ld e, (hl)
	sbc hl, de
	sub a, e
	ld e, a
	dec hl
	ld a, (hl)
	ret
loc_072D:
	cp 82h
	jp nz, loc_0738
	sbc hl, de
	ld a, (hl)
	ld e, 0
	ret
loc_0738:
	cp 83h
	jp nz, loc_074B
	exx
	bit 2, e
	exx
	jr z, loc_0747
	dec hl
	ld a, (hl)
	dec e
	ret
loc_0747:
	inc e
	inc hl
	ld a, (hl)
	ret
loc_074B:
	exx
	bit 2, e
	exx
	jr nz, loc_0723
	inc e
	inc e
	inc hl
	inc hl
	ld a, (hl)
	ret

sub_0757:
	ld c, (ix+21h)
	ld a, (1F68h)
	bit 7, a
	jr z, loc_076E
	ld a, (ix+13h)
	and a
	jr z, loc_076A
	add (ix+04h)
loc_076A:
	ld (ix+1Bh), a
	ret
loc_076E:
	ld a, (ix+1Bh)
	and a
	ret z
	exx
	bit 6, e
	exx
	jr nz, loc_077C
	sub a, c
	jr loc_077D
loc_077C:
	add c
loc_077D:
	jr z, loc_07C5
	ld c, (ix+0Ah)
	rlc c
	jp nz, loc_0795
	cp 16h
	jr c, loc_07C4
	cp 7Ah
	jr nc, loc_07C4
	ld hl, ptr_0DB9
	jp loc_079C
loc_0795:
	cp 62h
	jr nc, loc_07C4
	ld hl, ptr_0D21
loc_079C:
	ld (ix+1Bh), a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld c, (hl)
	inc hl
	ld b, (hl)
	ld a, (ix+12h)
	and a
	jp z, loc_07BD
	ld h, 0
	jp p, loc_07B4
	dec h
loc_07B4:
	ld l, a
	add hl, bc
	ld (ix+16h), l
	ld (ix+17h), h
	ret
loc_07BD:
	ld (ix+16h), c
	ld (ix+17h), b
	ret
loc_07C4:
	sub a
loc_07C5:
	ld (ix+1Bh), a
	ld (ix+16h), a
	ld (ix+17h), a
	ret

sub_07CF:
	ld hl, (8006h)
	ld e, a
	ld d, 0
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld e, (ix+1Fh)
	add hl, de
	ld a, (hl)
	and a
	jp p, loc_07EB
	cp 85h
	jp nc, loc_07EB
	call sub_071E
loc_07EB:
	inc e
	ld (ix+1Fh), e
	ld c, (ix+03h)
	bit 7, c
	jp z, loc_07F9
	cpl
	inc a
loc_07F9:
	and a
	ret z
	ld e, a
	jp p, loc_0800
	dec d
loc_0800:
	ld l, (ix+16h)
	ld h, (ix+17h)
	ld a, h
	or l
	ret z
	ld a, (ix+0Ah)
	and a
	jp nz, loc_0835
	sbc hl, de
	bit 7, d
	jp z, loc_082C
	ld a, h
	cp 4h
	jr nc, loc_0823
	ld (ix+16h), l
	ld (ix+17h), h
	ret
loc_0823:
	ld (ix+16h), 0
	ld (ix+17h), 0
	ret
loc_082C:
	jr c, loc_0823
	ld (ix+16h), l
	ld (ix+17h), h
	ret
loc_0835:
	bit 6, c
	jp nz, loc_0897
	ld a, h
	and a, 38h
	ld b, a
	ld a, h
	and a, 7h
	ld h, a
	add hl, de
	push hl
	bit 7, d
	jp nz, loc_0870
	ld de, 0566h
	sbc hl, de
	jp nc, loc_085B
	pop hl
	ld (ix+16h), l
	ld a, h
	or b
	ld (ix+17h), a
	ret
loc_085B:
	pop de
	ld de, 02B2h
	add hl, de
	ld (ix+16h), l
	ld a, b
	add 8h
	cp 40h
	jp nc, loc_0823
	or h
	ld (ix+17h), a
	ret
loc_0870:
	ld de, 02B2h
	and a
	sbc hl, de
	jp c, loc_0883
	pop hl
	ld (ix+16h), l
	ld a, h
	or b
	ld (ix+17h), a
	ret
loc_0883:
	pop de
	ld de, 0566h
	add hl, de
	ld (ix+16h), l
	ld a, b
	and a
	jp z, loc_0823
	sub 8h
	or h
	ld (ix+17h), a
	ret
loc_0897:
	ld a, h
	add hl, de
	cp h
	jr z, loc_08AA
	bit 7, d
	jr nz, loc_08A5
	ld (ix+16h), $FF
	ret
loc_08A5:
	ld (ix+16h), 0
	ret
loc_08AA:
	ld (ix+16h), l
	ld (ix+17h), h
	ret

sub_08B1:
	ld l, (ix+16h)
	ld h, (ix+17h)
	ld a, l
	or h
	ret z
	ld b, (ix+1Dh)
	ld c, (ix+1Ch)
	ld a, (ix+0Ah)
	and a
	jp nz, loc_08FF
loc_08C7:
	push hl
	sbc hl, bc
	pop hl
	ret z
	jr c, loc_08D9
	ld a, l
	sub (ix+20h)
	ld l, a
	jr nc, loc_08F1
	dec h
	jp loc_08F1
loc_08D9:
	ld a, l
	add (ix+20h)
	ld l, a
	jr nc, loc_08E1
	inc h
loc_08E1:
	push hl
	and a
	sbc hl, bc
	pop hl
	jr z, loc_08F8
	jr c, loc_08F8
loc_08EA:
	ld (ix+16h), c
	ld (ix+17h), b
	ret
loc_08F1:
	push hl
	and a
	sbc hl, bc
	pop hl
	jr c, loc_08EA
loc_08F8:
	ld (ix+16h), l
	ld (ix+17h), h
loc_08FE:
	ret
loc_08FF:
	ld a, h
	cp b
	jr nz, loc_0921
	ld a, l
	cp c
	jr z, loc_08FE
	jr c, loc_0915
	sub (ix+20h)
	jr c, loc_0911
	cp c
	jr nc, loc_091D
loc_0911:
	ld (ix+16h), c
	ret
loc_0915:
	add (ix+20h)
	jr c, loc_0911
	cp c
	jr nc, loc_0911
loc_091D:
	ld (ix+16h), a
	ret
loc_0921:
	and a, 38h
	ld e, a
	ld a, b
	and a, 38h
	cp e
	jp z, loc_08C7
	jp nc, loc_095D
	ld a, h
	and a, 7h
	ld h, a
	ld c, (ix+20h)
	ld b, 0
	and a
	sbc hl, bc
	ld bc, 02B2h 
	push hl
	sbc hl, bc
	jp c, loc_094D
	pop hl
	ld (ix+16h), l
	ld a, h
	or e
	ld (ix+17h), a
	ret
loc_094D:
	ld bc, 0566h
	add hl, bc
	ld (ix+16h), l
	ld a, e
	sub 8h
	or h
	ld (ix+17h), a
	pop hl
	ret
loc_095D:
	ld a, h
	and a, 7h
	ld h, a
	ld c, (ix+20h)
	ld b, 0
	add hl, bc
	ld bc, 0566h
	push hl
	sbc hl, bc
	jp nc, loc_097A
	pop hl
	ld (ix+16h), l
	ld a, h
	or e
	ld (ix+17h), a
	ret
loc_097A:
	ld bc, 02B2h
	add hl, bc
	ld (ix+16h), l
	ld a, e
	add 8h
	or h
	ld (ix+17h), a
	pop hl
	ret

sub_098A:
	ld e, a
	ld d, 0
	ld hl, (8008h)
	add hl, de
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ld e, (ix+23h)
	add hl, de
	ld a, (hl)
	and a
	jp p, loc_09AA
	cp 80h
	jr nz, loc_09A7
	dec hl
	ld a, (hl)
	jp loc_09AE
loc_09A7:
	call sub_071E
loc_09AA:
	inc e
	ld (ix+23h), e
loc_09AE:
	and a, 3Fh
	ld c, a
	ld a, (ix+09h)
	and a, $C0
	or c
	ld (ix+09h), a
	ret

sub_09BB:
	ld a, 80h
	ld (1F73h), a
	ld (1F77h), a
	ld (1F7Bh), a
	ld (1F7Eh), a
	ld a, $FF
	ld (mem_0030), a
	ld a, $FF ; ??
	ld (1F70h), a
	ld (1F74h), a
	ld (1F78h), a
	ld (1F7Ch), a
	ld hl, 0
	ld (1F20h), hl
	ld (1F22h), hl
	ld (1F24h), hl
	ret
	
sub_09E9:
	exx
	ld a, e
	ex af,af
	ld a, d
	bit 6, c
	jp z, loc_0A15
	bit 0, c
	exx
	ret z
	ld a, (1F25h)
	cp 2h
	jp nz, loc_0A0D
	ld a, (1F59h)
	cp (ix+14h)
	jp nz, loc_0A0D
	ld a, 3h
	ld (1F25h), a
	ret
loc_0A0D:
	exx
	res 0, c
	ld (ix+0Ch), c
	exx
	ret
loc_0A15:
	exx
	ld b, a
	ex af,af
	bit 3, a
	jr z, loc_0A3C
	ld a, (zUnkBitfield1)
	bit 5, a
	jp nz, loc_0A2D
	exx
	res 3, e
	ld (ix+0Bh), e
	exx
	jr loc_0A3C
loc_0A2D:
	ld hl, (mem_002F)
	ld a, (1F69h)
	add l
	sub 1Fh
	jr nc, loc_0A39
	sub a
loc_0A39:
	ld (1F69h), a
loc_0A3C:
	ld e, (ix+16h)
	ld d, (ix+17h)
	ld c, (ix+06h)
	ld a, (ix+0Ah)
	and a
	jp nz, loc_0ACD
	ld a, e
	or d
	ret z
	bit 1, b
	jp z, loc_0A8C
	ld a, (1F7Ch)
	and a
	jp z, loc_0A7A
	sub a
	ld (1F7Ch), a
	ld a, (1F68h)
	and a, 80h
	ld a, (ix+24h)
	jr nz, loc_0A6B
	res 3, a
loc_0A6B:
	ld (mem_0031), a
	ld a, (1F69h)
	srl a
	ld (1F7Eh), a
	ld a, c
	ld (mem_0030), a
loc_0A7A:
	bit 0, b
	jp nz, loc_0A9E
	ld a, c
	cp 2h
	ret nz
	sub a
	ld (1F69h), a
	ld c, 8h
	jp loc_0AA5
loc_0A8C:
	ld a, (mem_0030)
	cp c
	jr nz, loc_0A9E
	cp 2h
	jr nz, loc_0A9E
	ld a, (mem_0031)
	and a, 3h
	cp 3h
	ret z
loc_0A9E:
	ld a, c
	cp 3h
	ret z
	add a
	add a
	ld c, a
loc_0AA5:
	ld b, 0
	ld hl, 1F70h
	add hl, bc
	ld a, (hl)
	and a
	ret z
	ld (hl), 0
	inc hl
	ld (hl), e
	inc hl
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld (hl), d
	inc hl
	ld e, a
	ld a, (1F69h)
	srl a
	ld (hl), a
	ret
loc_0ACD:
	ld a, e
	or d
	jp nz, loc_0ADA
	exx
	set 6, c
	ld (ix+0Ch), c
	exx
	ret
loc_0ADA:
	bit 1, b
	jp z, loc_0B06
	ld a, (1F7Ch)
	and a
	jp z, loc_0B06
	sub a
	ld (1F7Ch), a
	ld a, (1F68h)
	and a, 80h
	ld a, (ix+24h)
	jr nz, loc_0AF6
	res 3, a
loc_0AF6:
	ld (mem_0031), a
	ld a, (1F69h)
	srl a
	ld (1F7Eh), a
	ld a, 4h
	ld (mem_0030), a
loc_0B06:
	bit 0, b
	ret z
	ld b, 0
	ld hl, 1F20h
	add hl, bc
	ld a, (hl)
	and a
	jp z, loc_0B1C
	exx
	set 6, c
	ld (ix+0Ch), c
	exx
	ret
loc_0B1C:
	ld (hl), 1
	ld a, (1F68h)
	bit 7, a
	jp z, loc_0BE5
	ld hl, 1F2Ch
	add hl, bc
	ld a, (ix+0Ah)
	cp (hl)
	jp nz, loc_0B3C
	ld hl, 1F26h
	add hl, bc
	ld a, (hl)
	ld (1F66h), a
	jp loc_0BBC
loc_0B3C:
	ld (hl), a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, (800Ah)
	add hl, bc
	ex de,hl
	ld c, (ix+06h)
	ld a, c
	ld hl, 4000h
	cp 3h
	jr c, loc_0B5B
	sub 3h
	ld c, a
	ld l, 2
loc_0B5B:
	inc de
	inc de
	add $B0
	ld (hl), a
	inc l
	ld a, (de)
	ld (hl), a
	and a, 7h
	ld (1F66h), a
	dec l
	inc de
	inc de
	push de
	pop iy
	ld a, c
	add 30h
loc_0B71:
	ld c, a
	ld (hl), a
	ld a, (de)
	inc l
	ld (hl), a
	dec l
	inc de
	ld a, c
	add 10h
	cp $AC
	jp nc, loc_0B8F
	cp $A0
	jp nc, loc_0B8A
	cp 0h
	jp loc_0B71
loc_0B8A:
	sub 6Ch
	jp loc_0B71
loc_0B8F:
	ld c, (ix+06h)
	ld b, 0
	ld hl, 1F26h
	add hl, bc
	ld e, 12h
	ld d, 0h
	ld a, (1F66h)
	ld (hl), a
	add hl, de
	ld a, (iy+01h)
	ld (hl), a
	ld e, 6h
	add hl, de
	ld a, (iy+08h)
	ld (hl), a
	add hl, de
	ld a, (iy+0Fh)
	ld (hl), a
	add hl, de
	ld a, (iy+16h)
	ld (hl), a
	ld e, (ix+16h)
	ld d, (ix+17h)
loc_0BBC:
	call sub_0C03
	ld hl, 1F68h
	ld c, (ix+06h)
	ld a, 28h
	ld (4000h), a
	ld a, c
	cp 3h
	jr c, loc_0BD0
	inc a
loc_0BD0:
	bit 5, (hl)
	jp z, loc_0BDC
	ld (4001h), a
	call sub_0FD1
	nop
loc_0BDC:
	ld c, (ix+06h)
	or $F0
	ld (4001h), a
	ret
loc_0BE5:
	ld hl, 1F26h
	add hl, bc
	bit 2, a
	jp z, loc_0BFF
	ld a, 28h
	ld (4000h), a
	ld a, c
	cp 3h
	jr c, loc_0BF9
	inc a
loc_0BF9:
	ld (4001h), a
	ld c, (ix+06h)
loc_0BFF:
	ld a, (hl)
	ld (1F66h), a
sub_0C03:
	ld b, 0
	ld iy, 1F38h
	add iy, bc
	ld hl, 4000h
	ld a, c
	cp 3h
	jp c, loc_0C19
	ld l, 2h
	sub 3h
	ld c, a
loc_0C19:
	ld a, c
	add $A4
	ld (hl), a
	sub 4h
	inc l
	ld (hl), d
	dec hl
	ld b, e
	ld de, (1F69h)
	push hl
	ld (hl), a
	inc l
	ld (hl), b
	dec l
	ld d, 0h
	ld hl, ptr_0FDC
	add hl, de
	ld b, (hl)
	ld hl, ptr_0FD4
	ld a, (1F66h)
	ld e, a
	add hl, de
	ld d, (hl)
	pop hl
	ld a, c
	add 40h
loc_0C40:
	sla d
	jp nc, loc_0C54
	ld (hl), a
	inc l
	ld c, a
	ld a, (iy+00h)
	add b
	jp p, loc_0C51
	ld a, 7Fh
loc_0C51:
	ld (hl), a
	dec l
	ld a, c
loc_0C54:
	push bc
	ld bc, 6h
	add iy, bc
	pop bc
	add 4h
	cp 50h
	jp c, loc_0C40
	and a, 3h
	add $B4
	ld (hl), a
	inc l
	ld a, (ix+09h)
	ld (hl), a
	ret

InitSoundId:
	ld c, a ; Backup song id into c
	
	add a ; Multiply it by 2 so we can get the song pointer into HL
	ld e, a
	ld d, 0h
	ld hl, (8000h)
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de,hl
	
	ld b, (hl) ; B contains the number of channels to initialize
	inc hl
loc_0C7C:
	ld a, (hl) ; A contains a channel to select?
	inc hl
	push hl ; Save current song pointer
	add a ; Multiply channel num by 2
	ld e, a
	ld d, 0h
	ld hl, tbl_channels ; Index into channel table and load pointer for the selected channel into DE
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	
	pop hl ; Get the original current song pointer
	ld a, (hl) ; Get third byte
	and a ; Check if it's zero
	jr z, loc_0CFE
	ld a, (de) ; Wasn't zero, so load channel+00h
	
	bit 6, a ; If bit 6 is set, return.
	ret nz
	
	push de ; Load channel pointer into ix
	pop ix
	
	ld (ix+0Ch), 0 ; ??
	
	and a
	jr z, loc_0CAA ; If current channel is disabled, load song id into channel+14h
	
	ld a, c ; Load song id from earlier, and compare it to channel+14h
	cp (ix+14h)
	jr nz, loc_0CAA ; If the current song id in 14h isn't the current song, then load it into it
	
	set 5, (ix+0Ch) ; ??
	jp loc_0CAD ; Skip loading the song id (why do we need to avoid loading it at times?)
loc_0CAA:
	ld (ix+14h), c
loc_0CAD:
	push bc
	ld bc, 000Bh ; Load 000B bytes from the song
	ldir ; and store them into the current channel
	pop bc ; Restore bc from earlier (song type?|song id)
	ld a, (ix+05h) ; Load channel+05h
	cpl ; Invert all the bits
	inc a ; Increment by 1
	ld (ix+0Fh), a ; Load it into channel+0Fh
	sub a
	ld (ix+0Bh), a ; ??
	ld (ix+0Dh), a ; ??
	ld (ix+15h), a ; ??
	ld (ix+12h), a ; ??
	ld (ix+13h), a ; ??
	ld (ix+22h), a ; ??
	ld (ix+24h), 4 ; ??
	inc a
	ld (ix+0Eh), a ; Load it into length of note?
	
	ld a, (1F68h)
	and a
	ld a, (800Fh)
	jp z, loc_0CF3 ; If 1F68h is zero
	
	ld a, (1F66h)
	add (ix+01h)
	sub 1Fh
	jp nc, loc_0CED
	sub a
loc_0CED:
	ld (ix+01h), a
	ld a, (1F67h)
loc_0CF3:
	add (ix+04h)
	ld (ix+04h), a
	
	dec b
	jp nz, loc_0C7C ; If there are more channels to load, loop
	ret
loc_0CFE: ; Channel will not be initialized
	ld (de), a ; Set channel+00h to zero
	inc hl ; Increment current song pointer
	
	dec b
	jp nz, loc_0C7C ; If there are more channels to load, loop
	ret

tbl_channels:
	ptrZ80 $1C00
	ptrZ80 $1C30
	ptrZ80 $1C60
	ptrZ80 $1C90
	ptrZ80 $1CC0
	ptrZ80 $1CF0
	ptrZ80 $1D20
	ptrZ80 $1D50
	ptrZ80 $1D80
	ptrZ80 $1DB0
	ptrZ80 $1DE0
	ptrZ80 $1E10
	ptrZ80 $1E40
	ptrZ80 $1E70
ptr_0D21:
	ptrZ80 $1EA0
	ptrZ80 $028B
	ptrZ80 $02B2
	ptrZ80 $02DB
	ptrZ80 $0306
	ptrZ80 $0334
	ptrZ80 $0365
	ptrZ80 $0399
	ptrZ80 $03CF
	ptrZ80 $0409
	ptrZ80 $0447
	ptrZ80 $0488
	ptrZ80 $04CD
	ptrZ80 $0516
	ptrZ80 $0AB2
	ptrZ80 $0ADB
	ptrZ80 $0B06
	ptrZ80 $0B34
	ptrZ80 $0B65
	ptrZ80 $0B99
	ptrZ80 $0BCF
	ptrZ80 $0C09
	ptrZ80 $0C47
	ptrZ80 $0C88
	ptrZ80 $0CCD
	ptrZ80 $0D16
	ptrZ80 $12B2
	ptrZ80 $12DB
	ptrZ80 $1306
	ptrZ80 $1334
	ptrZ80 $1365
	ptrZ80 $1399
	ptrZ80 $13CF
	ptrZ80 $1409
	ptrZ80 $1447
	ptrZ80 $1488
	ptrZ80 $14CD
	ptrZ80 $1516
	ptrZ80 $1AB2
	ptrZ80 $1ADB
	ptrZ80 $1B06
	ptrZ80 $1B34
	ptrZ80 $1B65
	ptrZ80 $1B99
	ptrZ80 $1BCF
	ptrZ80 $1C09
	ptrZ80 $1C47
	ptrZ80 $1C88
	ptrZ80 $1CCD
	ptrZ80 $1D16
	ptrZ80 $22B2
	ptrZ80 $22DB
	ptrZ80 $2306
	ptrZ80 $2334
	ptrZ80 $2365
	ptrZ80 $2399
	ptrZ80 $23CF
	ptrZ80 $2409
	ptrZ80 $2447
	ptrZ80 $2488
	ptrZ80 $24CD
	ptrZ80 $2516
	ptrZ80 $2AB2
	ptrZ80 $2ADB
	ptrZ80 $2B06
	ptrZ80 $2B34
	ptrZ80 $2B65
	ptrZ80 $2B99
	ptrZ80 $2BCF
	ptrZ80 $2C09
	ptrZ80 $2C47
	ptrZ80 $2C88
	ptrZ80 $2CCD
	ptrZ80 $2D16
	ptrZ80 $32B2
	ptrZ80 $32DB
ptr_0DB9:
	ptrZ80 $3306
	ptrZ80 $3334
	ptrZ80 $3365
	ptrZ80 $3399
	ptrZ80 $33CF
	ptrZ80 $3409
	ptrZ80 $3447
	ptrZ80 $3488
	ptrZ80 $34CD
	ptrZ80 $3516
	ptrZ80 $3AB2
	ptrZ80 $3ADB
	ptrZ80 $3B06
	ptrZ80 $3B34
	ptrZ80 $3B65
	ptrZ80 $3B99
	ptrZ80 $3BCF
	ptrZ80 $3C09
	ptrZ80 $3C47
	ptrZ80 $3C88
	ptrZ80 $3CCD
	ptrZ80 $3D16
	ptrZ80 $03FF
	ptrZ80 $03C7
	ptrZ80 $0390
	ptrZ80 $035D
	ptrZ80 $032D
	ptrZ80 $02FF
	ptrZ80 $02D4
	ptrZ80 $02AB
	ptrZ80 $0285
	ptrZ80 $0261
	ptrZ80 $023F
	ptrZ80 $021E
	ptrZ80 $0200
	ptrZ80 $01E3
	ptrZ80 $01C8
	ptrZ80 $01AF
	ptrZ80 $0196
	ptrZ80 $0180
	ptrZ80 $016A
	ptrZ80 $0156
	ptrZ80 $0143
	ptrZ80 $0130
	ptrZ80 $011F
	ptrZ80 $010F
	ptrZ80 $0100
	ptrZ80 $00F2
	ptrZ80 $00E4
	ptrZ80 $00D7
	ptrZ80 $00CB
	ptrZ80 $00C0
	ptrZ80 $00B5
	ptrZ80 $00AB
	ptrZ80 $00A1
	ptrZ80 $0098
	ptrZ80 $0090
	ptrZ80 $0088
	ptrZ80 $0080
	ptrZ80 $0079
	ptrZ80 $0072
	ptrZ80 $006C
	ptrZ80 $0066
	ptrZ80 $0060
	ptrZ80 $005B
	ptrZ80 $0055
	ptrZ80 $0051
	ptrZ80 $004C
	ptrZ80 $0048
	ptrZ80 $0044
	ptrZ80 $0040
	ptrZ80 $003C
	ptrZ80 $0039
	ptrZ80 $0036
	ptrZ80 $0033
	ptrZ80 $0030
	ptrZ80 $002D
	ptrZ80 $002B
	ptrZ80 $0028
	ptrZ80 $0026
	ptrZ80 $0024
	ptrZ80 $0022
	ptrZ80 $0020
	ptrZ80 $001E
	ptrZ80 $001C
	ptrZ80 $001B
	ptrZ80 $0019
	ptrZ80 $0018
	ptrZ80 $0016
	ptrZ80 $0015
	ptrZ80 $0014
	ptrZ80 $0013
	ptrZ80 $0012
	ptrZ80 $0011
	ptrZ80 $0010
	ptrZ80 $000F
	ptrZ80 $000E
	ptrZ80 $000E
	ptrZ80 $000D
	ptrZ80 $000C
	ptrZ80 $000B
	ptrZ80 $000A
	ptrZ80 $000A
	ptrZ80 $0009
	ptrZ80 $0009
	ptrZ80 $0008
	ptrZ80 $0008
	ptrZ80 $0007
	ptrZ80 $0007
	ptrZ80 $0007
	ptrZ80 $0007
	ptrZ80 $0006
	ptrZ80 $0006
	ptrZ80 $0005
	ptrZ80 $0005
	ptrZ80 $0005
	ptrZ80 $0004
	ptrZ80 $0004
	ptrZ80 $0004
	ptrZ80 $0003
	ptrZ80 $0003
	ptrZ80 $0003
	
sub_0EAD:
	ld a, (mem_0022)
	and a
	jr z, loc_0EF1
	sub a
	ld (1F68h), a
	ld bc, zPlaySoundId 
loc_0EBA:
	ld a, (bc)
	cp $F0
	jp c, loc_0ED1
	add a
	ld e, a
	ld d, 0
	ld hl, ptr_0F1A+2 ; ??
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de,hl
	call sub_0EF2
	jr loc_0ED6
loc_0ED1:
	push bc
	call InitSoundId
	pop bc
loc_0ED6:
	inc c
	ld a, 1h
	ld (mem_0026), a
	ld a, (mem_0022)
	cp c
	jp z, loc_0EEA
	sub a
	ld (mem_0026), a
	jp loc_0EBA
loc_0EEA:
	sub a
	ld (mem_0022), a
	ld (mem_0026), a
loc_0EF1:
	ret

sub_0EF2:
	jp (hl)

sub_0EF3:
	sub a
	ld (zUnkBitfield1), a
	ld (mem_0031), a
	dec a
	ld (1F7Dh), a
	ld a, 27h
	ld (4000h), a
	ld a, 30h
	ld (4001h), a
sub_0F08:
	ld hl, zChannelArray
	ld de, 0030h
	ld b, 0Dh
	sub a
loc_0F11:
	ld (hl), a
	add hl, de
	djnz loc_0F11
	ld a, (zUnkBitfield1)
	res 5, a
ptr_0F1A:
	ld (zUnkBitfield1), a
	ld a, 1Fh
	ld (mem_002F), a
	ld a, 22h
	ld (4000h), a
	ld a, (800Eh)
	ld (4001h), a
	ld hl, (8002h)
	ld bc, 0011h
	add hl, bc
	ld (mem_002A), hl
	ld a, (zUnkBitfield1)
	and a, $FE
	ld (zUnkBitfield1), a
	ld a, 3h
	ld (mem_0027), a
	ld hl, (800Ch)
	ld c, (hl)
	ld b, 0
	inc hl
	add hl, bc
	ld (1F5Ch), hl
	ld a, 2Bh
	ld (4000h), a
	sub a
	ld (4001h), a
	call sub_09BB
	ld hl, 0707h
	ld (1F26h), hl
	ld (1F28h), hl
	ld (1F2Ah), hl
	ld hl, $FFFF
	ld (1F2Ch), hl
	ld (1F2Eh), hl
	ld (1F30h), hl
	ld (1F32h), hl
	ld (1F34h), hl
	ld (1F36h), hl
	call sub_01D8
	ret

sub_0F80:
	res 5, (hl)
	ld a, 1Fh
	ld (mem_002F), a
	ld bc, 0030h
	ld hl, 1C0Bh
	ld a, 0Ch
loc_0F8F:
	res 3, (hl)
	add hl, bc
	dec a
	jr nz, loc_0F8F
	ret

; Bank Switch subroutine
SwapBank:
	ld a, (1F51h)
	cp h
	jr nz, loc_0FA1
	ld a, (1F50h)
	cp l
	ret z
loc_0FA1:
	ld a, l
	rlca
	ld (6000h), a
	ld a, h
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	rrca
	ld (6000h), a
	ld (1F50h), hl
	ret

sub_0FCA: ; Todo: Is this used?
	push ix
	pop ix
sub_0FCE:
	ret

sub_0FCF: ; Todo: Is this used?
	push hl
	pop hl
sub_0FD1:
	push hl
	pop hl
	ret

ptr_0FD4:
	dc.b $10
	dc.b $10
	dc.b $10
	dc.b $10
	dc.b $30
	dc.b $70
	dc.b $70
	dc.b $F0

ptr_0FDC:
	dc.b $7F
	dc.b $58
	dc.b $54
	dc.b $50
	dc.b $4C
	dc.b $48
	dc.b $44
	dc.b $40
	dc.b $3C
	dc.b $38
	dc.b $34
	dc.b $30
	dc.b $2C
	dc.b $28
	dc.b $24
	dc.b $20
	dc.b $1E
	dc.b $1C
	dc.b $1A
	dc.b $18
	dc.b $16
	dc.b $14
	dc.b $12
	dc.b $10
	dc.b $0E
	dc.b $0C
	dc.b $0A
	dc.b $08
	dc.b $06
	dc.b $04
	dc.b $02
	dc.b $00
ptr_0FFC: ; Todo: Is this a seperate table?
	ptrZ80 sub_101C
	ptrZ80 sub_101D
	ptrZ80 sub_1023
	ptrZ80 sub_1029
	ptrZ80 sub_1042
	ptrZ80 loc_105A
	ptrZ80 sub_10A2
	ptrZ80 sub_10B4
	ptrZ80 sub_101C
	ptrZ80 sub_101C
	ptrZ80 sub_10C6
	ptrZ80 sub_10C6
	ptrZ80 loc_1121
	ptrZ80 sub_101C
	ptrZ80 sub_101C
	ptrZ80 sub_101C

sub_101C:
	ret
sub_101D:
	push bc
	call sub_0EF3
	pop bc
	ret
	
sub_1023:
	push bc
	call sub_0F08
	pop bc
	ret

sub_1029:
	call sub_1070
	ld a, 1Fh
	ld (mem_002F), a
	ld hl, mem_0010
	add hl, bc
	ld a, (hl)
	ld (mem_002E), a
	ld a, (zUnkBitfield1)
	or 30h
	ld (zUnkBitfield1), a
	ret

sub_1042:
	sub a
	ld (1F68h), a
	push bc
	ld hl, mem_0010
	add hl, bc
	ld a, (hl)
	call InitSoundId
	pop bc
	sub a
	ld (mem_002F), a
	ld a, (zUnkBitfield1)
	jp loc_1060
loc_105A:
	ld a, (zUnkBitfield1)
	bit 5, a
	ret z
loc_1060:
	and a, $EF
	or 20h
	ld (zUnkBitfield1), a
	call sub_1070
	ld a, 1Fh
	ld (mem_002E), a
	ret

sub_1070:
	ld hl, memloc_0008
	add hl, bc
	ld a, (hl)
	ld (mem_002C), a
	ld a, $FF
	ld (mem_002D), a
	push ix
	ld de, 0030h
	ld h, 0Bh
	ld ix, zChannelArray
loc_1088:
	ld a, (ix+00h)
	and a
	jr z, loc_1099
	jp m, loc_1099
	ld a, (ix+0Bh)
	or 8h
	ld (ix+0Bh), a
loc_1099:
	add ix, de
	dec h
	jp p, loc_1088
	pop ix
	ret

sub_10A2:
	ld a, (zUnkBitfield1)
	or 2h
	ld (zUnkBitfield1), a
	push bc
	sub a
	ld (1F68h), a
	call InitSoundId
	pop bc
	ret

sub_10B4:
	ld a, (zUnkBitfield1)
	and a, $FD
	ld (zUnkBitfield1), a
	push bc
	sub a
	ld (1F68h), a
	call InitSoundId
	pop bc
	ret

sub_10C6:
	ld hl, memloc_0008
	add hl, bc
	ld a, (hl)
	and a
	jp m, loc_1110
	ld d, 1
loc_10D1:
	ld e, a
	ld hl, mem_0010
	add hl, bc
	ld a, (zUnkBitfield1)
	and a, 1h
	ld a, (hl)
	jp z, loc_10E4
	ld hl, 1F58h
	cp (hl)
	ret c
loc_10E4:
	ld (1F58h), a
	ld a, (bc)
	cp $FA
	ld a, $C0
	jp z, loc_10F4
	ld hl, mem_0018
	add hl, bc
	ld a, (hl)
loc_10F4:
	ld (1F57h), a
	ld a, e
	ld (1F55h), a
	ld a, d
	ld (mem_0027), a
	cp 3h
	ret z
	ld a, (zUnkBitfield1)
	or 1h
	ld (zUnkBitfield1), a
	ld a, $FA
	ld (1F59h), a
	ret
loc_1110:
	cp $FF
	jp z, loc_111C
	and a, 7Fh
	ld d, 2
	jp loc_10D1
loc_111C:
	ld d, 3
	jp loc_10D1
loc_1121:
	ld a, 1h
	ld (1F68h), a
	ld hl, mem_0010
	add hl, bc
	ld a, (hl)
	ld (1F66h), a
	ld hl, mem_0018
	add hl, bc
	ld a, (hl)
	ld (1F67h), a
	ld a, 1h
	ld (1F68h), a
	ld hl, memloc_0008
	add hl, bc
	ld a, (hl)
	push bc
	call InitSoundId
	pop bc
	sub a
	ld (1F68h), a
	ret

Entry:
	di
	im 1
	ld sp, 2000h
	ld hl, $FFFF
	ld (1F50h), hl
	ld hl, (1F00h)
	call SwapBank ; Swap to Bank 1
	sub a
	ld (mem_0022), a
	ld (mem_0023), a
	ld (mem_0020), a
	ld (mem_0026), a
	ld (mem_0024), a
	call sub_0EF3
loc_116F: ; Waiting for command?
	ei
	nop
	di
	ld a, (mem_0027)
	and a
	jr z, loc_116F
loc_1178:
	or 80h
	ld (mem_0027), a
	ei
	add a
	ld e, a
	ld d, 0
	ld hl, ptr_118F
	add hl, de
	ld a, d
	ld (1F6Dh), a
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de,hl
	jp (hl)

ptr_118F:
	ptrZ80 loc_1226
	ptrZ80 sub_1197
	ptrZ80 sub_1197
	ptrZ80 loc_1226

sub_1197:
	di
	ld a, 2Bh
	ld (4000h), a
	ld a, 80h
	ld (4001h), a
	ld a, (zUnkBitfield1)
	or 1h
	ld (zUnkBitfield1), a
	call sub_09BB
	ld hl, $FFFF
	ld (1F32h), hl
	ld (1F34h), hl
	ld (1F36h), hl
	call sub_01D8
	ld hl, 1C0Ch
	ld de, 0030h
	ld b, 0Dh
loc_11C4:
	set 6, (hl)
	add hl, de
	djnz loc_11C4
	ld a, $B6
	ld (4002h), a
	ld a, (1F57h)
	ld (4003h), a
	ld hl, (1F00h)
	call SwapBank
	call sub_12A8
	call SwapBank
	call sub_12CD
loc_11E3:
	ld a, 2Ah
	ld (4000h), a
	ld a, h
	and a
	ld a, 80h
	jr z, loc_11F1
	ld a, (hl)
	and a, $F0
loc_11F1:
	ld (4001h), a
	call sub_1247
	ld a, 2Ah
	ld (4000h), a
	ld a, h
	and a
	ld a, 80h
	jr z, loc_1207
	ld a, (hl)
	add a
	add a
	add a
	add a
loc_1207:
	ld (4001h), a
	call sub_1247
	ld a, (mem_0027)
	and a
	jp p, loc_1178
	ld a, h
	and a
	jp z, loc_121A
	inc hl
loc_121A:
	dec bc
	ld a, c
	or b
	jp nz, loc_11E3
	call sub_12F3
	jp nz, loc_11E3
loc_1226:
	di
	ld a, (mem_0027)
	and a
	jp p, loc_1178
	sub a
	ld (mem_0027), a
	ld a, 2Bh
	ld (4000h), a
	sub a
	ld (4001h), a
	ld a, (zUnkBitfield1)
	and a, $FE
	ld (zUnkBitfield1), a
	ei
	jp loc_116F

sub_1247:
	ld a, (mem_0022)
	and a
	jp z, loc_12A0
	sub a
	ld (1F68h), a
	push bc
	push hl
	ld hl, (1F50h)
	push hl
	ld hl, (1F00h)
	call SwapBank
	ld bc, zPlaySoundId 
loc_1261:
	ld a, (bc)
	cp $F0
	jp c, loc_1278
	add a
	ld e, a
	ld d, 0
	ld hl, ptr_0F1A+2 ; ??
	add hl, de
	ld e, (hl)
	inc hl
	ld d, (hl)
	ex de,hl
	call sub_129F
	jr loc_127D
loc_1278:
	push bc
	call InitSoundId
loc_127C:
	pop bc
loc_127D:
	inc c
	ld a, 1h
	ld (mem_0026), a
	ld a, (mem_0022)
	cp c
	jp z, loc_1291
	sub a
	ld (mem_0026), a
	jp loc_1261
loc_1291:
	sub a
	ld (mem_0022), a
	ld (mem_0026), a
	pop hl
	call SwapBank
	pop hl
	pop bc
	ret

sub_129F:
	jp (hl)

loc_12A0:
	ld a, (1F54h)
loc_12A3:
	dec a
	jp nz, loc_12A3
	ret

sub_12A8:
	ld a, (1F55h)
sub_12AB:
	add a
	ld c, a
	ld b, 0
	ld hl, (1F5Ch)
	add hl, bc
	ld e, (hl)
	inc hl
	ld c, (hl)
	ld hl, (800Ch)
	inc hl
	add hl, bc
	ld a, (hl)
	ld (1F5Ah), a
	inc hl
	ld a, (hl)
	ld (1F5Bh), a
	ld hl, 1F00h
	add hl, bc
	ld a, (hl)
	inc hl
	ld h, (hl)
	ld l, a
	ret

sub_12CD:
	ld d, 0
	ld hl, (1F5Ah)
	add hl, de
	ld a, (hl)
	inc l
	ld h, (hl)
	ld l, a
	ld e, (hl)
	inc hl
	ld a, (hl)
	inc hl
	and a
	ld d, a
	jr nz, loc_12E4
	ld a, e
	and a
	jp p, loc_1312
loc_12E4:
	ld c, (hl)
	inc hl
	ld b, (hl)
	inc hl
	ld a, (hl)
	ld (1F54h), a
	inc hl
	inc hl
	ld (1F52h), hl
	ex de,hl
	ret

sub_12F3:
	ld hl, (1F52h)
	ld e, (hl)
	inc hl
	ld a, (hl)
	inc hl
	and a
	ld d, a
	jr nz, loc_1303
	ld a, e
	and a
	jp p, loc_1312
loc_1303:
	ld c, (hl)
	inc hl
	ld b, (hl)
	inc hl
	ld a, (hl)
	ld (1F54h), a
	inc hl
	inc hl
	ld (1F52h), hl
	ex de,hl
	ret
loc_1312:
	jr z, loc_132D
	ld (1F6Ch), hl
	ld hl, (1F50h)
	ld (1F6Eh), hl
	ld hl, (1F00h)
	call SwapBank
	ld a, e
	call sub_12AB
	call SwapBank
	jp sub_12CD
loc_132D:
	ld hl, (1F6Ch)
	ld a, h
	and a
	ret z
	sub a
	ld (1F6Dh), a
	ld (1F52h), hl
	ld hl, (1F6Eh)
	call SwapBank
	jp sub_12F3


	i: = $100-(*&$FF)
	while (i>0)
		dc.b $FF
		i: = i-1
	endw
	
	cpu 68000
	objend