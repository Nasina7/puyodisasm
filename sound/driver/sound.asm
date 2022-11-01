; commzand line: z80dasm.exe --zorigin=0 -l -o sound.bin soundDriver.bin
	include "tools/LANG.ASM"
	z80prog 0
	org 0
loc_0000h:
	di	
	jp loc_114ah
	znop	
	znop	
loc_0006h:
	znop	
	znop	
loc_0008h:
	znop	
	znop	
	znop	
loc_000bh:
	znop	
	znop	
	znop	
	znop	
	znop	
loc_0010h:
	znop	
loc_0011h:
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
loc_0018h:
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
loc_0020h:
	znop	
loc_0021h:
	znop	
loc_0022h:
	znop	
loc_0023h:
	znop	
loc_0024h:
	ld bc,00101h
loc_0027h:
	ld bc,loc_0000h
loc_002ah:
	znop	
	znop	
loc_002ch:
	znop	
loc_002dh:
	znop	
loc_002eh:
	znop	
loc_002fh:
	znop	
loc_0030h:
	znop	
loc_0031h:
	znop	
	znop	
	znop	
	di	
	jp loc_114ah
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
	ld hl,(01f50h)
	push hl	
	ld hl,(01f00h)
	call sub_0f96h
	call sub_0eadh
	call sub_09bbh
	ld hl,loc_0021h
	ld a,(hl)	
	zand 001h
	jp z,loc_006ch
	ld a,(01f59h)
	cp 0fah
	ld a,002h
	jp nz,00068h
	ld a,003h
	ld (01f25h),a
loc_006ch:
	bit 1,(hl)
	jp nz,loc_0078h
	ld a,(01e40h)
	zand a	
	jp z,loc_0080h
loc_0078h:
	ld b,08ch
	ld ix,01e40h
	jr loc_0086h
loc_0080h:
	ld b,00bh
	ld ix,01e10h
loc_0086h:
	zsub a	
	ld (01f68h),a
	ld d,(ix+000h)
	cp d	
	jp z,loc_0149h
	ld e,(ix+00bh)
	ld c,(ix+00ch)
	exx	
	ld a,(ix+005h)
	zand a	
	jr z,loc_00a7h
	zadd a,(ix+00fh)
	ld (ix+00fh),a
	jp nc,loc_00e0h
loc_00a7h:
	ld b,(ix+00dh)
	exx	
	bit 4,d
	jr nz,loc_00d4h
	bit 2,e
	jr z,loc_00d4h
	exx	
	ld a,(ix+015h)
	zand a	
	jr z,loc_00d5h
	cp b	
	jr z,loc_00c0h
	jp nc,loc_00d5h
loc_00c0h:
	exx	
	zand 014h
	jr nz,loc_00d2h
	ld a,(01f68h)
	zor 004h
	ld (01f68h),a
	zset 4,c
	ld (ix+00ch),c
loc_00d2h:
	res 2,e
loc_00d4h:
	exx	
loc_00d5h:
	inc b	
	ld (ix+00dh),b
	ld a,b	
	cp (ix+00eh)
	jp z,loc_028bh
loc_00e0h:
	ld b,(ix+001h)
	ld a,(ix+002h)
	zadd a,a	
	jp nz,loc_00eeh
	ld a,b	
	jp loc_00f1h
loc_00eeh:
	call sub_06f4h
loc_00f1h:
	ld (01f69h),a
	exx	
	bit 7,e
	exx	
	call nz,sub_0757h
	exx	
	bit 3,c
	exx	
	call nz,sub_08b1h
	ld a,(ix+003h)
	zand 03fh
	zadd a,a	
	call nz,sub_07cfh
	ld a,(ix+022h)
	zadd a,a	
loc_010fh:
	call nz,sub_098ah
	call sub_09e9h
	exx	
	bit 5,e
	jp z,loc_0142h
	ld a,(ix+018h)
	zadd a,(ix+019h)
	ld (ix+019h),a
	jr nc,loc_0142h
	ld a,(ix+001h)
	cp (ix+01ah)
	jp nz,loc_0134h
	zset 1,e
	jp loc_0142h
loc_0134h:
	res 1,e
	bit 4,e
	jr nz,loc_013eh
	inc a	
	jp loc_013fh
loc_013eh:
	dec a	
loc_013fh:
	ld (ix+001h),a
loc_0142h:
	ld (ix+00bh),e
	bit 5,d
	jr nz,loc_015bh
loc_0149h:
	ld de,0ffd0h
	zadd ix,de
	dec b	
	jp p,loc_0086h
	inc b	
	jp z,loc_016fh
	res 7,b
	jp loc_0167h
loc_015bh:
	res 7,b
	dec b	
	jp m,loc_016fh
	ld de,0ffd0h
	inc b	
	zadd ix,de
loc_0167h:
	zset 6,(ix+00ch)
	zadd ix,de
	djnz loc_0167h
loc_016fh:
	ld hl,loc_0021h
	bit 5,(hl)
	jr z,loc_01a5h
	ld de,(loc_002dh)
	ld a,(loc_002ch)
	zadd a,e	
	ld (loc_002dh),a
	jr nc,loc_01a5h
	bit 4,(hl)
	jr nz,loc_019ah
	ld a,(loc_002fh)
	cp d	
	jr z,loc_0195h
	inc a	
	ld (loc_002fh),a
	cp d	
	jp nz,loc_01a5h
loc_0195h:
	call sub_0f80h
	jr loc_01a5h
loc_019ah:
	ld a,(loc_002fh)
	cp d	
	jp z,loc_01a5h
	dec a	
	ld (loc_002fh),a
loc_01a5h:
	ld a,(loc_0021h)
	zand 001h
	jp z,loc_01c3h
	ld a,(01f25h)
	cp 002h
	jp c,loc_01c3h
	cp 003h
	jp z,loc_01bfh
	ld a,003h
	ld (loc_0027h),a
loc_01bfh:
	zsub a	
	ld (01f25h),a
loc_01c3h:
	call sub_01d8h
	pop hl	
	call sub_0f96h
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
sub_01d8h:
	ld hl,01f70h
	ld b,080h
loc_01ddh:
	inc l	
	ld a,(hl)	
	zand 00fh
	zor b	
	ld (07f11h),a
	inc l	
	ld a,(hl)	
	zand 03fh
	ld (07f11h),a
	inc l	
	ld a,b	
	zadd a,010h
	ld b,a	
	ld a,(hl)	
	cpl	
	zand 00fh
	zor b	
	ld (07f11h),a
	inc l	
	ld a,b	
	zadd a,010h
	ld b,a	
	cp 0e0h
	jp nz,loc_01ddh
	inc l	
	ld a,(loc_0031h)
	cp (hl)	
	res 3,a
	ld (hl),a	
	ld (loc_0031h),a
	jp z,loc_0218h
	zand 007h
	zor 0e0h
	ld (07f11h),a
loc_0218h:
	inc l	
	ld a,(hl)	
	cpl	
	zor 0f0h
	ld (07f11h),a
	ld ix,01f20h
	ld c,000h
	ld e,000h
	ld d,07fh
	ld hl,04000h
loc_022dh:
	ld a,(ix+000h)
	zand a	
	jp z,loc_023bh
	ld (ix+012h),001h
	jp loc_0275h
loc_023bh:
	cp (ix+012h)
	jp z,loc_0275h
	ld (ix+012h),000h
	exx	
	ld e,(ix+006h)
	ld d,000h
	ld hl,loc_0fd4h
	zadd hl,de	
	ld a,(hl)	
	exx	
	ld b,a	
	ld a,c	
	zadd a,040h
loc_0255h:
	sla b
	jp nc,loc_0262h
	ld (hl),a	
	inc l	
	ld (hl),d	
	dec l	
	call sub_0fceh
	znop	
loc_0262h:
	zadd a,004h
	cp 050h
	jp c,loc_0255h
	zsub 050h
	ld c,a	
	ld a,028h
	ld (04000h),a
	ld a,e	
	ld (04001h),a
loc_0275h:
	inc c	
	inc e	
	inc ix
	ld a,c	
	cp 003h
	jp nz,loc_022dh
	bit 2,e
	ret nz	
	ld c,000h
	ld e,004h
	ld l,002h
	jp loc_022dh
loc_028bh:
	exx	
	bit 0,c
	jp z,loc_02b7h
	res 0,c
	ld (ix+00ch),c
	ld a,(loc_0021h)
	zand 001h
	jr z,loc_02b7h
	ld a,(01f59h)
	cp (ix+014h)
	jp nz,loc_0008h
	ld a,02bh
	ld (04000h),a
	zsub a	
	ld (04000h),a
	ld (01f25h),a
loc_02b2h:
	ld a,003h
	ld (loc_0027h),a
loc_02b7h:
	exx	
	ld e,(ix+007h)
	ld d,(ix+008h)
	jp loc_02c2h
loc_02c1h:
	inc de	
loc_02c2h:
	ld a,(de)	
	zand a	
	jp p,loc_05f8h
	cp 0c0h
	jp nc,loc_058fh
	inc de	
	ld hl,loc_02c1h
	push hl	
	ld hl,loc_02dfh
	ld b,000h
	zadd a,a	
	ld c,a	
	zadd hl,bc	
	ld a,(hl)	
	inc hl	
	ld h,(hl)	
	ld l,a	
	ld a,(de)	
	jp (hl)	
loc_02dfh:
	ld sp,03803h
	inc bc	
	ld a,(hl)	
	inc bc	
	zadd a,a	
	inc bc	
	ret nz	
	inc bc	
	exx	
	inc bc	
	ld l,a	
	inc bc	
	cp h	
	inc bc	
	adc a,e	
	inc bc	
	adc a,a	
	inc bc	
	zand (hl)	
	inc bc	
	call z,03604h
	inc bc	
	ld h,(hl)	
	inc bc	
	halt	
	inc b	
	halt	
	inc b	
	sbc a,a	
	inc bc	
	ld (bc),a	
	inc b	
	ret z	
	inc b	
	dec h	
	inc b	
	ld c,b	
	inc b	
	ld h,b	
	inc b	
	ld (hl),d	
	inc b	
	xor h	
	inc b	
	zand h	
	inc b	
	ld a,d	
	inc b	
	ret c	
	inc b	
	ret c	
	inc b	
	ld (de),a	
	inc b	
	xor b	
	inc b	
	ld l,c	
	inc b	
	ex (sp),hl	
	inc b	
	ld c,a	
	inc bc	
	zsub c	
	inc b	
	sbc a,e	
	inc b	
	ret c	
	inc b	
	zor (hl)	
	inc b	
	cp (hl)	
	inc b	
	xor 004h
	ld sp,hl	
	inc b	
	ld c,h	
	dec b	
loc_0331h:
	ld l,a	
	inc de	
	ld a,(de)	
	ld h,a	
	ex de,hl	
	dec de	
	ret	
	inc de	
	cp 011h
	jr z,loc_0346h
	dec (ix+010h)
	ld a,(de)	
	jp nz,loc_0331h
	inc de	
	ret	
loc_0346h:
	dec (ix+011h)
	ld a,(de)	
	jp nz,loc_0331h
	inc de	
	ret	
	inc de	
	cp 011h
	jr z,loc_035dh
	dec (ix+010h)
	ld a,(de)	
	jp z,loc_0331h
	inc de	
	ret	
loc_035dh:
	dec (ix+011h)
	ld a,(de)	
	jp z,loc_0331h
	inc de	
	ret	
	ld c,a	
	push ix
	pop hl	
	zadd hl,bc	
	inc de	
	ld a,(de)	
	ld (hl),a	
	ret	
	ld a,001h
	ld (loc_0024h),a
	ld a,(ix+014h)
	ld (loc_0020h),a
	zsub a	
	ld (loc_0024h),a
	ld (ix+000h),000h
	pop hl	
	exx	
	jp loc_0149h
	ld (ix+003h),a
	ret	
	ld (ix+002h),a
	ret	
	cp 080h
	jr z,loc_039ah
	zadd a,(ix+004h)
	ld (ix+004h),a
	ret	
loc_039ah:
	ld (ix+004h),000h
	ret	
	ld (ix+000h),a
	exx	
	ld d,a	
	exx	
	ret	
	ld c,(ix+001h)
	zand a	
	jp p,loc_03b5h
	zadd a,c	
	jr c,loc_03bch
	ld (ix+001h),000h
	ret	
loc_03b5h:
	zadd a,c	
	cp 020h
	jr c,loc_03bch
	ld a,01fh
loc_03bch:
	ld (ix+001h),a
	ret	
	exx	
	zand a	
	jr z,loc_03d2h
	ld (ix+020h),a
	zset 3,c
	ld (ix+00ch),c
	ld (ix+013h),000h
	exx	
	ret	
loc_03d2h:
	res 3,c
	ld (ix+00ch),c
	exx	
	ret	
	inc de	
	ld b,a	
	ld a,001h
	ld (loc_0024h+2),a
	ld a,(loc_0022h)
	cp 008h
	jr nc,loc_0400h
	ld l,a	
	ld h,000h
	ld (hl),b	
	inc a	
	ld (loc_0022h),a
	zadd a,007h
	ld l,a	
	zadd a,008h
	ld c,a	
	ld a,(de)	
	ld (hl),a	
	ld l,c	
	inc de	
	ld a,(de)	
	ld (hl),a	
	zsub a	
	ld (loc_0024h+2),a
	ret	
loc_0400h:
	inc de	
	ret	
	ld b,a	
	ld a,001h
	ld (loc_0024h),a
	ld hl,loc_0020h
	zor (hl)	
	ld (hl),b	
	zsub a	
	ld (loc_0024h),a
	ret	
	zsub (ix+010h)
	ld c,a	
	inc de	
	ld a,(de)	
	ld l,a	
	inc de	
	ld a,(de)	
	ld h,a	
	zadd hl,bc	
	ld a,(hl)	
	zadd a,(ix+004h)
	ld (ix+004h),a
	ret	
	exx	
	res 1,e
	res 4,e
	zand a	
	jp p,loc_0430h
	zset 4,e
loc_0430h:
	zand 01fh
	ld (ix+01ah),a
	exx	
	inc de	
	ld a,(de)	
	ld (ix+018h),a
	ld (ix+019h),b
	exx	
	zset 5,e
	zand a	
	jr nz,loc_0446h
	res 5,e
loc_0446h:
	exx	
	ret	
sub_0448h:
	exx	
	res 6,e
	zand a	
	jp p,loc_0451h
	zset 6,e
loc_0451h:
	zset 7,e
	zand 07fh
	jr z,loc_045ch
	ld (ix+021h),a
	exx	
	ret	
loc_045ch:
	res 7,e
	exx	
	ret	
	exx	
	bit 1,e
	exx	
	jp z,loc_0331h
	inc de	
	ret	
	exx	
	bit 5,c
	exx	
	jp nz,loc_0331h
	inc de	
	ret	
	ld (ix+005h),a
	ret	
	ld (ix+024h),a
	ret	
	exx	
	ld a,d	
	xor 010h
	ld d,a	
	ld (ix+000h),a
	exx	
	zand 010h
	jr z,loc_048fh
loc_0487h:
	ld a,(01f68h)
	zor 008h
	ld (01f68h),a
loc_048fh:
	dec de	
	ret	
	exx	
	zset 4,d
	ld (ix+000h),d
	exx	
	jp loc_0487h
	exx	
	res 4,d
	ld (ix+000h),d
	exx	
	dec de	
	ret	
	ld (ix+006h),a
	ret	
	ld (ix+015h),a
	ret	
	zand a	
	jr z,loc_04b2h
	zadd a,(ix+012h)
loc_04b2h:
	ld (ix+012h),a
	ret	
	cp (ix+006h)
	jr z,loc_04bdh
	inc de	
	inc de	
loc_04bdh:
	ret	
	inc de	
	cp (ix+006h)
	ld a,(de)	
	jp z,loc_0331h
	inc de	
	ret	
	ld (ix+022h),a
	ret	
	ld (ix+00ah),a
	ld a,(01f68h)
	zor 010h
	ld (01f68h),a
	ret	
	ld b,a	
	ld a,(ix+009h)
	zand 0c0h
	zor b	
	ld (ix+009h),a
	ret	
	ld b,a	
	ld a,(ix+009h)
	zand 03fh
	zor b	
	ld (ix+009h),a
	ret	
	ld b,a	
	ld a,022h
	ld (04000h),a
	ld a,b	
	ld (04001h),a
	ret	
	zand a	
	jp m,loc_0545h
	ld b,001h
loc_04ffh:
	ld c,a	
	ld a,(loc_0021h)
	zand 001h
	jp z,loc_0514h
	ld a,(01f58h)
	exx	
	cp b	
	exx	
	jp c,loc_0514h
	jp nz,loc_053bh
loc_0514h:
	ld a,(ix+009h)
	ld (01f57h),a
	exx	
	ld a,b	
	exx	
	ld (01f58h),a
	ld a,c	
	ld (01f55h),a
	ld a,b	
	ld (loc_0027h),a
	ld a,(ix+014h)
	ld (01f59h),a
	ld a,(loc_0021h)
	zor 001h
	ld (loc_0021h),a
	ld a,002h
	ld (01f25h),a
loc_053bh:
	exx	
	zset 0,c
	ld (ix+00ch),c
	exx	
	jp loc_0578h
loc_0545h:
	zand 07fh
	ld b,002h
	jp loc_04ffh
	ld b,a	
	ld a,001h
	ld (loc_0024h+2),a
	ld a,(loc_0022h)
	cp 008h
	jr nc,loc_0578h
	ld l,a	
	ld h,000h
	ld (hl),0fch
	inc a	
	ld (loc_0022h),a
	zadd a,007h
	ld l,a	
	ld (hl),b	
loc_0566h:
	zadd a,008h
	ld l,a	
	ld b,(ix+001h)
	ld (hl),b	
	zadd a,008h
	ld l,a	
	ld b,(ix+004h)
	ld (hl),b	
	zsub a	
	ld (loc_0024h+2),a
loc_0578h:
	ld hl,01f68h
	zset 6,(hl)
	ld a,(ix+013h)
	zand a	
	ex af,af	
	ld (ix+017h),001h
	ld (ix+013h),001h
	inc de	
	pop hl	
	jp loc_0628h
loc_058fh:
	cp 0deh
	jp nc,loc_05eeh
	zsub 0c0h
	zadd a,a	
	zadd a,a	
	zadd a,a	
	ld c,a	
	ld b,000h
	ld hl,(loc_002ah)
	zadd hl,bc	
	ld a,(hl)	
	ld (ix+00ah),a
	ld a,(01f68h)
	zor 010h
	ld (01f68h),a
	inc hl	
	ld a,(hl)	
	ld (ix+002h),a
	inc hl	
	ld a,(hl)	
	ld c,a	
	inc hl	
	ld a,(hl)	
	ld b,a	
	zand 00fh
	ld (ix+024h),a
	ld a,b	
	zand 060h
	rlca	
	rlca	
	rlca	
	ld b,a	
	exx	
	ld a,d	
	zand 0fch
	exx	
	zor b	
	exx	
	ld d,a	
	ld (ix+000h),a
	exx	
	bit 7,(hl)
	jr nz,loc_05dah
	exx	
	res 7,e
	exx	
	jp loc_05e0h
loc_05dah:
	ld a,c	
	call sub_0448h
	ld c,000h
loc_05e0h:
	ld (ix+003h),c
	inc hl	
	ld a,(hl)	
	ld (ix+009h),a
	inc hl	
	ld a,(hl)	
	zand a	
	jp loc_05f8h
loc_05eeh:
	ld a,(ix+013h)
	ld c,a	
	zand a	
	ex af,af	
	ld a,c	
	jp loc_0602h
loc_05f8h:
	inc de	
	ex af,af	
	ld a,(ix+013h)
	zand a	
	ex af,af	
	ld (ix+013h),a
loc_0602h:
	call sub_06bbh
	exx	
	bit 3,c
	exx	
	jp z,loc_0622h
	ld a,(ix+013h)
	zand a	
	jp z,loc_0622h
	ld (ix+01dh),b
	ld (ix+01ch),c
	ex af,af	
	jp z,loc_0621h
	ex af,af	
	jp loc_0628h
loc_0621h:
	ex af,af	
loc_0622h:
	ld (ix+016h),c
	ld (ix+017h),b
loc_0628h:
	ld a,(de)	
	zsub 0efh
	jp c,loc_064ah
	jp nz,loc_0636h
	inc de	
	ld a,(de)	
	jp loc_063eh
loc_0636h:
	ld hl,(08002h)
	ld c,a	
	ld b,000h
	zadd hl,bc	
	ld a,(hl)	
loc_063eh:
	inc de	
	ld (ix+00eh),a
	ld a,(de)	
	ld (ix+015h),a
	inc de	
	jp loc_0665h
loc_064ah:
	zsub 0efh
	jr z,loc_0654h
	jp nc,loc_0659h
	jp loc_0665h
loc_0654h:
	inc de	
	ld a,(de)	
	jp loc_0661h
loc_0659h:
	ld hl,(08002h)
	ld c,a	
	ld b,000h
	zadd hl,bc	
	ld a,(hl)	
loc_0661h:
	inc de	
	ld (ix+00eh),a
loc_0665h:
	zsub a	
	ld (ix+00dh),a
	exx	
	ld hl,01f68h
	ex af,af	
	jr z,loc_0691h
	bit 4,d
	jr z,loc_0682h
	bit 3,(hl)
	jp nz,loc_0682h
	bit 6,c
	jr z,loc_06a0h
	zset 5,(hl)
	jp loc_06a0h
loc_0682h:
	bit 2,d
	jp z,loc_0691h
	bit 4,(hl)
	jp nz,loc_0691h
	bit 6,c
	jp z,loc_0693h
loc_0691h:
	zset 5,(hl)
loc_0693h:
	zsub a	
	ld (ix+01eh),a
	ld (ix+01fh),a
	ld (ix+023h),000h
	zset 2,e
loc_06a0h:
	bit 6,(hl)
	jp z,loc_06aah
	zset 6,c
	jp loc_06ach
loc_06aah:
	res 6,c
loc_06ach:
	ld (ix+00ch),c
	zset 7,(hl)
	exx	
	ld (ix+008h),d
	ld (ix+007h),e
	jp loc_00e0h
sub_06bbh:
	ld bc,loc_0000h
	zand a	
	ret z	
	exx	
	bit 3,d
	exx	
	jr nz,loc_06ech
	zadd a,(ix+004h)
	zadd a,a	
	ld c,a	
	ld a,(ix+00ah)
	zand a	
	ld hl,00d21h
	jp nz,loc_06d8h
	ld hl,loc_0db9h
loc_06d8h:
	zadd hl,bc	
	ld c,(hl)	
	inc hl	
	ld b,(hl)	
	ld a,(ix+012h)
	zand a	
	ret z	
	ld h,000h
	jp p,loc_06e7h
	dec h	
loc_06e7h:
	ld l,a	
	zadd hl,bc	
	ld c,l	
	ld b,h	
	ret	
loc_06ech:
	ld c,a	
	zadd a,(ix+004h)
	ld (ix+024h),a
	ret	
sub_06f4h:
	ld hl,(08004h)
	ld e,a	
	ld d,000h
	zadd hl,de	
	ld a,(hl)	
	inc hl	
	ld h,(hl)	
	ld l,a	
	ld e,(ix+01eh)
	zadd hl,de	
	ld a,(hl)	
	zand a	
	jp p,loc_0714h
	cp 080h
	jr nz,loc_0711h
	dec hl	
	ld a,(hl)	
	jp loc_0718h
loc_0711h:
	call sub_071eh
loc_0714h:
	inc e	
	ld (ix+01eh),e
loc_0718h:
	zadd a,b	
	zsub 01fh
	ret nc	
	zsub a	
	ret	
sub_071eh:
	cp 081h
	jp nz,loc_072dh
loc_0723h:
	inc hl	
	ld a,e	
	ld e,(hl)	
	sbc hl,de
	zsub e	
	ld e,a	
	dec hl	
	ld a,(hl)	
	ret	
loc_072dh:
	cp 082h
	jp nz,loc_0738h
	sbc hl,de
	ld a,(hl)	
	ld e,000h
	ret	
loc_0738h:
	cp 083h
	jp nz,loc_074bh
	exx	
	bit 2,e
	exx	
	jr z,loc_0747h
	dec hl	
	ld a,(hl)	
	dec e	
	ret	
loc_0747h:
	inc e	
	inc hl	
	ld a,(hl)	
	ret	
loc_074bh:
	exx	
	bit 2,e
	exx	
	jr nz,loc_0723h
	inc e	
	inc e	
	inc hl	
	inc hl	
	ld a,(hl)	
	ret	
sub_0757h:
	ld c,(ix+021h)
	ld a,(01f68h)
	bit 7,a
	jr z,loc_076eh
	ld a,(ix+013h)
	zand a	
	jr z,loc_076ah
	zadd a,(ix+004h)
loc_076ah:
	ld (ix+01bh),a
	ret	
loc_076eh:
	ld a,(ix+01bh)
	zand a	
	ret z	
	exx	
	bit 6,e
	exx	
	jr nz,loc_077ch
	zsub c	
	jr loc_077dh
loc_077ch:
	zadd a,c	
loc_077dh:
	jr z,loc_07c5h
	ld c,(ix+00ah)
	rlc c
	jp nz,loc_0795h
	cp 016h
	jr c,loc_07c4h
	cp 07ah
	jr nc,loc_07c4h
	ld hl,loc_0db9h
	jp loc_079ch
loc_0795h:
	cp 062h
	jr nc,loc_07c4h
	ld hl,00d21h
loc_079ch:
	ld (ix+01bh),a
	zadd a,a	
	ld c,a	
	ld b,000h
	zadd hl,bc	
	ld c,(hl)	
	inc hl	
	ld b,(hl)	
	ld a,(ix+012h)
	zand a	
	jp z,loc_07bdh
	ld h,000h
	jp p,loc_07b4h
	dec h	
loc_07b4h:
	ld l,a	
	zadd hl,bc	
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
loc_07bdh:
	ld (ix+016h),c
	ld (ix+017h),b
	ret	
loc_07c4h:
	zsub a	
loc_07c5h:
	ld (ix+01bh),a
	ld (ix+016h),a
	ld (ix+017h),a
	ret	
sub_07cfh:
	ld hl,(08006h)
	ld e,a	
	ld d,000h
	zadd hl,de	
	ld a,(hl)	
	inc hl	
	ld h,(hl)	
	ld l,a	
	ld e,(ix+01fh)
	zadd hl,de	
	ld a,(hl)	
	zand a	
	jp p,loc_07ebh
	cp 085h
	jp nc,loc_07ebh
	call sub_071eh
loc_07ebh:
	inc e	
	ld (ix+01fh),e
	ld c,(ix+003h)
	bit 7,c
	jp z,loc_07f9h
	cpl	
	inc a	
loc_07f9h:
	zand a	
	ret z	
	ld e,a	
	jp p,loc_0800h
	dec d	
loc_0800h:
	ld l,(ix+016h)
	ld h,(ix+017h)
	ld a,h	
	zor l	
	ret z	
	ld a,(ix+00ah)
	zand a	
	jp nz,loc_0835h
	sbc hl,de
	bit 7,d
	jp z,loc_082ch
	ld a,h	
	cp 004h
	jr nc,loc_0823h
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
loc_0823h:
	ld (ix+016h),000h
	ld (ix+017h),000h
	ret	
loc_082ch:
	jr c,loc_0823h
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
loc_0835h:
	bit 6,c
	jp nz,loc_0897h
	ld a,h	
	zand 038h
	ld b,a	
	ld a,h	
	zand 007h
	ld h,a	
	zadd hl,de	
	push hl	
	bit 7,d
	jp nz,loc_0870h
	ld de,loc_0566h
	sbc hl,de
	jp nc,loc_085bh
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor b	
	ld (ix+017h),a
	ret	
loc_085bh:
	pop de	
	ld de,loc_02b2h
	zadd hl,de	
	ld (ix+016h),l
	ld a,b	
	zadd a,008h
	cp 040h
	jp nc,loc_0823h
	zor h	
	ld (ix+017h),a
	ret	
loc_0870h:
	ld de,loc_02b2h
	zand a	
	sbc hl,de
	jp c,loc_0883h
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor b	
	ld (ix+017h),a
	ret	
loc_0883h:
	pop de	
	ld de,loc_0566h
	zadd hl,de	
	ld (ix+016h),l
	ld a,b	
	zand a	
	jp z,loc_0823h
	zsub 008h
	zor h	
	ld (ix+017h),a
	ret	
loc_0897h:
	ld a,h	
	zadd hl,de	
	cp h	
	jr z,loc_08aah
	bit 7,d
	jr nz,loc_08a5h
	ld (ix+016h),0ffh
	ret	
loc_08a5h:
	ld (ix+016h),000h
	ret	
loc_08aah:
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
sub_08b1h:
	ld l,(ix+016h)
	ld h,(ix+017h)
	ld a,l	
	zor h	
	ret z	
	ld b,(ix+01dh)
	ld c,(ix+01ch)
	ld a,(ix+00ah)
	zand a	
	jp nz,loc_08ffh
loc_08c7h:
	push hl	
	sbc hl,bc
	pop hl	
	ret z	
	jr c,loc_08d9h
	ld a,l	
	zsub (ix+020h)
	ld l,a	
	jr nc,loc_08f1h
	dec h	
	jp loc_08f1h
loc_08d9h:
	ld a,l	
	zadd a,(ix+020h)
	ld l,a	
	jr nc,loc_08e1h
	inc h	
loc_08e1h:
	push hl	
	zand a	
	sbc hl,bc
	pop hl	
	jr z,loc_08f8h
	jr c,loc_08f8h
loc_08eah:
	ld (ix+016h),c
	ld (ix+017h),b
	ret	
loc_08f1h:
	push hl	
	zand a	
	sbc hl,bc
	pop hl	
	jr c,loc_08eah
loc_08f8h:
	ld (ix+016h),l
	ld (ix+017h),h
loc_08feh:
	ret	
loc_08ffh:
	ld a,h	
	cp b	
	jr nz,loc_0921h
	ld a,l	
	cp c	
	jr z,loc_08feh
	jr c,loc_0915h
	zsub (ix+020h)
	jr c,loc_0911h
	cp c	
	jr nc,loc_091dh
loc_0911h:
	ld (ix+016h),c
	ret	
loc_0915h:
	zadd a,(ix+020h)
	jr c,loc_0911h
	cp c	
	jr nc,loc_0911h
loc_091dh:
	ld (ix+016h),a
	ret	
loc_0921h:
	zand 038h
	ld e,a	
	ld a,b	
	zand 038h
	cp e	
	jp z,loc_08c7h
	jp nc,loc_095dh
	ld a,h	
	zand 007h
	ld h,a	
	ld c,(ix+020h)
	ld b,000h
	zand a	
	sbc hl,bc
	ld bc,loc_02b2h
	push hl	
	sbc hl,bc
	jp c,loc_094dh
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor e	
	ld (ix+017h),a
	ret	
loc_094dh:
	ld bc,loc_0566h
	zadd hl,bc	
	ld (ix+016h),l
	ld a,e	
	zsub 008h
	zor h	
	ld (ix+017h),a
	pop hl	
	ret	
loc_095dh:
	ld a,h	
	zand 007h
	ld h,a	
	ld c,(ix+020h)
	ld b,000h
	zadd hl,bc	
	ld bc,loc_0566h
	push hl	
	sbc hl,bc
	jp nc,loc_097ah
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor e	
	ld (ix+017h),a
	ret	
loc_097ah:
	ld bc,loc_02b2h
	zadd hl,bc	
	ld (ix+016h),l
	ld a,e	
	zadd a,008h
	zor h	
	ld (ix+017h),a
	pop hl	
	ret	
sub_098ah:
	ld e,a	
	ld d,000h
	ld hl,(08008h)
	zadd hl,de	
	ld a,(hl)	
	inc hl	
	ld h,(hl)	
	ld l,a	
	ld e,(ix+023h)
	zadd hl,de	
	ld a,(hl)	
	zand a	
	jp p,loc_09aah
	cp 080h
	jr nz,loc_09a7h
	dec hl	
	ld a,(hl)	
	jp loc_09aeh
loc_09a7h:
	call sub_071eh
loc_09aah:
	inc e	
	ld (ix+023h),e
loc_09aeh:
	zand 03fh
	ld c,a	
	ld a,(ix+009h)
	zand 0c0h
	zor c	
	ld (ix+009h),a
	ret	
sub_09bbh:
	ld a,080h
	ld (01f73h),a
	ld (01f77h),a
	ld (01f7bh),a
	ld (01f7eh),a
	ld a,0ffh
	ld (loc_0030h),a
	ld a,0ffh
	ld (01f70h),a
	ld (01f74h),a
	ld (01f78h),a
	ld (01f7ch),a
	ld hl,loc_0000h
	ld (01f20h),hl
	ld (01f22h),hl
	ld (01f24h),hl
	ret	
sub_09e9h:
	exx	
	ld a,e	
	ex af,af	
	ld a,d	
	bit 6,c
	jp z,loc_0a15h
	bit 0,c
	exx	
	ret z	
	ld a,(01f25h)
	cp 002h
	jp nz,loc_0a0dh
	ld a,(01f59h)
	cp (ix+014h)
	jp nz,loc_0a0dh
	ld a,003h
	ld (01f25h),a
	ret	
loc_0a0dh:
	exx	
	res 0,c
	ld (ix+00ch),c
	exx	
	ret	
loc_0a15h:
	exx	
	ld b,a	
	ex af,af	
	bit 3,a
	jr z,loc_0a3ch
	ld a,(loc_0021h)
	bit 5,a
	jp nz,loc_0a2dh
	exx	
	res 3,e
	ld (ix+00bh),e
	exx	
	jr loc_0a3ch
loc_0a2dh:
	ld hl,(loc_002fh)
	ld a,(01f69h)
	zadd a,l	
	zsub 01fh
	jr nc,loc_0a39h
	zsub a	
loc_0a39h:
	ld (01f69h),a
loc_0a3ch:
	ld e,(ix+016h)
	ld d,(ix+017h)
	ld c,(ix+006h)
	ld a,(ix+00ah)
	zand a	
	jp nz,loc_0acdh
	ld a,e	
	zor d	
	ret z	
	bit 1,b
	jp z,loc_0a8ch
	ld a,(01f7ch)
	zand a	
	jp z,loc_0a7ah
	zsub a	
	ld (01f7ch),a
	ld a,(01f68h)
	zand 080h
	ld a,(ix+024h)
	jr nz,loc_0a6bh
	res 3,a
loc_0a6bh:
	ld (loc_0031h),a
	ld a,(01f69h)
	srl a
	ld (01f7eh),a
	ld a,c	
	ld (loc_0030h),a
loc_0a7ah:
	bit 0,b
	jp nz,loc_0a9eh
	ld a,c	
	cp 002h
	ret nz	
	zsub a	
	ld (01f69h),a
	ld c,008h
	jp loc_0aa5h
loc_0a8ch:
	ld a,(loc_0030h)
	cp c	
	jr nz,loc_0a9eh
	cp 002h
	jr nz,loc_0a9eh
	ld a,(loc_0031h)
	zand 003h
	cp 003h
	ret z	
loc_0a9eh:
	ld a,c	
	cp 003h
	ret z	
	zadd a,a	
	zadd a,a	
	ld c,a	
loc_0aa5h:
	ld b,000h
	ld hl,01f70h
	zadd hl,bc	
	ld a,(hl)	
	zand a	
	ret z	
	ld (hl),000h
	inc hl	
	ld (hl),e	
	inc hl	
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld (hl),d	
	inc hl	
	ld e,a	
	ld a,(01f69h)
	srl a
	ld (hl),a	
	ret	
loc_0acdh:
	ld a,e	
	zor d	
	jp nz,loc_0adah
	exx	
	zset 6,c
	ld (ix+00ch),c
	exx	
	ret	
loc_0adah:
	bit 1,b
	jp z,loc_0b06h
	ld a,(01f7ch)
	zand a	
	jp z,loc_0b06h
	zsub a	
	ld (01f7ch),a
	ld a,(01f68h)
	zand 080h
	ld a,(ix+024h)
	jr nz,loc_0af6h
	res 3,a
loc_0af6h:
	ld (loc_0031h),a
	ld a,(01f69h)
	srl a
	ld (01f7eh),a
	ld a,004h
	ld (loc_0030h),a
loc_0b06h:
	bit 0,b
	ret z	
	ld b,000h
	ld hl,01f20h
	zadd hl,bc	
	ld a,(hl)	
	zand a	
	jp z,loc_0b1ch
	exx	
	zset 6,c
	ld (ix+00ch),c
	exx	
	ret	
loc_0b1ch:
	ld (hl),001h
	ld a,(01f68h)
	bit 7,a
	jp z,loc_0be5h
	ld hl,01f2ch
	zadd hl,bc	
	ld a,(ix+00ah)
	cp (hl)	
	jp nz,loc_0b3ch
	ld hl,01f26h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f66h),a
	jp loc_0bbch
loc_0b3ch:
	ld (hl),a	
	ld l,a	
	ld h,000h
	zadd hl,hl	
	zadd hl,hl	
	zadd hl,hl	
	zadd hl,hl	
	zadd hl,hl	
	ld bc,(0800ah)
	zadd hl,bc	
	ex de,hl	
	ld c,(ix+006h)
	ld a,c	
	ld hl,04000h
	cp 003h
	jr c,loc_0b5bh
	zsub 003h
	ld c,a	
	ld l,002h
loc_0b5bh:
	inc de	
	inc de	
	zadd a,0b0h
	ld (hl),a	
	inc l	
	ld a,(de)	
	ld (hl),a	
	zand 007h
	ld (01f66h),a
	dec l	
	inc de	
	inc de	
	push de	
	pop iy
	ld a,c	
	zadd a,030h
loc_0b71h:
	ld c,a	
	ld (hl),a	
	ld a,(de)	
	inc l	
	ld (hl),a	
	dec l	
	inc de	
	ld a,c	
	zadd a,010h
	cp 0ach
	jp nc,loc_0b8fh
	cp 0a0h
	jp nc,loc_0b8ah
	cp 000h
	jp loc_0b71h
loc_0b8ah:
	zsub 06ch
	jp loc_0b71h
loc_0b8fh:
	ld c,(ix+006h)
	ld b,000h
	ld hl,01f26h
	zadd hl,bc	
	ld e,012h
	ld d,000h
	ld a,(01f66h)
	ld (hl),a	
	zadd hl,de	
	ld a,(iy+001h)
	ld (hl),a	
	ld e,006h
	zadd hl,de	
	ld a,(iy+008h)
	ld (hl),a	
	zadd hl,de	
	ld a,(iy+00fh)
	ld (hl),a	
	zadd hl,de	
	ld a,(iy+016h)
	ld (hl),a	
	ld e,(ix+016h)
	ld d,(ix+017h)
loc_0bbch:
	call sub_0c03h
	ld hl,01f68h
	ld c,(ix+006h)
	ld a,028h
	ld (04000h),a
	ld a,c	
	cp 003h
	jr c,loc_0bd0h
	inc a	
loc_0bd0h:
	bit 5,(hl)
	jp z,loc_0bdch
	ld (04001h),a
	call sub_0fd1h
	znop	
loc_0bdch:
	ld c,(ix+006h)
	zor 0f0h
	ld (04001h),a
	ret	
loc_0be5h:
	ld hl,01f26h
	zadd hl,bc	
	bit 2,a
	jp z,loc_0bffh
	ld a,028h
	ld (04000h),a
	ld a,c	
	cp 003h
	jr c,loc_0bf9h
	inc a	
loc_0bf9h:
	ld (04001h),a
	ld c,(ix+006h)
loc_0bffh:
	ld a,(hl)	
	ld (01f66h),a
sub_0c03h:
	ld b,000h
	ld iy,01f38h
	zadd iy,bc
	ld hl,04000h
	ld a,c	
	cp 003h
	jp c,loc_0c19h
	ld l,002h
	zsub 003h
	ld c,a	
loc_0c19h:
	ld a,c	
	zadd a,0a4h
	ld (hl),a	
	zsub 004h
	inc l	
	ld (hl),d	
	dec hl	
	ld b,e	
	ld de,(01f69h)
	push hl	
	ld (hl),a	
	inc l	
	ld (hl),b	
	dec l	
	ld d,000h
	ld hl,loc_0fdch
	zadd hl,de	
	ld b,(hl)	
	ld hl,loc_0fd4h
	ld a,(01f66h)
	ld e,a	
	zadd hl,de	
	ld d,(hl)	
	pop hl	
	ld a,c	
	zadd a,040h
loc_0c40h:
	sla d
	jp nc,loc_0c54h
	ld (hl),a	
	inc l	
	ld c,a	
	ld a,(iy+000h)
	zadd a,b	
	jp p,loc_0c51h
	ld a,07fh
loc_0c51h:
	ld (hl),a	
	dec l	
	ld a,c	
loc_0c54h:
	push bc	
	ld bc,loc_0006h
	zadd iy,bc
	pop bc	
	zadd a,004h
	cp 050h
	jp c,loc_0c40h
	zand 003h
	zadd a,0b4h
	ld (hl),a	
	inc l	
	ld a,(ix+009h)
	ld (hl),a	
	ret	
sub_0c6dh:
	ld c,a	
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,(08000h)
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	ld b,(hl)	
	inc hl	
loc_0c7ch:
	ld a,(hl)	
	inc hl	
	push hl	
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,loc_0d05h
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	pop hl	
	ld a,(hl)	
	zand a	
	jr z,loc_0cfeh
	ld a,(de)	
	bit 6,a
	ret nz	
	push de	
	pop ix
	ld (ix+00ch),000h
	zand a	
	jr z,loc_0caah
	ld a,c	
	cp (ix+014h)
	jr nz,loc_0caah
	zset 5,(ix+00ch)
	jp loc_0cadh
loc_0caah:
	ld (ix+014h),c
loc_0cadh:
	push bc	
	ld bc,loc_000bh
	ldir
	pop bc	
	ld a,(ix+005h)
	cpl	
	inc a	
	ld (ix+00fh),a
	zsub a	
	ld (ix+00bh),a
	ld (ix+00dh),a
	ld (ix+015h),a
	ld (ix+012h),a
	ld (ix+013h),a
	ld (ix+022h),a
	ld (ix+024h),004h
	inc a	
	ld (ix+00eh),a
	ld a,(01f68h)
	zand a	
	ld a,(0800fh)
	jp z,loc_0cf3h
	ld a,(01f66h)
	zadd a,(ix+001h)
	zsub 01fh
	jp nc,loc_0cedh
	zsub a	
loc_0cedh:
	ld (ix+001h),a
	ld a,(01f67h)
loc_0cf3h:
	zadd a,(ix+004h)
	ld (ix+004h),a
	dec b	
	jp nz,loc_0c7ch
	ret	
loc_0cfeh:
	ld (de),a	
	inc hl	
	dec b	
	jp nz,loc_0c7ch
	ret	
loc_0d05h:
	znop	
	inc e	
	jr nc,loc_0d25h
	ld h,b	
	inc e	
	zsub b	
	inc e	
	ret nz	
	inc e	
	ret p	
	inc e	
	jr nz,loc_0d30h
	ld d,b	
	dec e	
	zadd a,b	
	dec e	
	zor b	
	dec e	
	ret po	
	dec e	
	djnz *+32
	ld b,b	
	ld e,070h
	ld e,0a0h
	ld e,08bh
	ld (bc),a	
loc_0d25h:
	zor d	
	ld (bc),a	
	in a,(002h)
	ld b,003h
	inc (hl)	
	inc bc	
	ld h,l	
	inc bc	
	sbc a,c	
loc_0d30h:
	inc bc	
	rst 8	
	inc bc	
	zadd hl,bc	
	inc b	
	ld b,a	
	inc b	
	adc a,b	
	inc b	
	call 01604h
	dec b	
	zor d	
	ld a,(bc)	
	in a,(00ah)
	ld b,00bh
	inc (hl)	
	dec bc	
	ld h,l	
	dec bc	
	sbc a,c	
	dec bc	
	rst 8	
	dec bc	
	zadd hl,bc	
	inc c	
	ld b,a	
	inc c	
	adc a,b	
	inc c	
	call 0160ch
	dec c	
	zor d	
	ld (de),a	
	in a,(012h)
	ld b,013h
	inc (hl)	
	inc de	
	ld h,l	
	inc de	
	sbc a,c	
	inc de	
	rst 8	
	inc de	
	zadd hl,bc	
	inc d	
	ld b,a	
	inc d	
	adc a,b	
	inc d	
	call 01614h
	dec d	
	zor d	
	ld a,(de)	
	in a,(01ah)
	ld b,01bh
	inc (hl)	
	dec de	
	ld h,l	
	dec de	
	sbc a,c	
	dec de	
	rst 8	
	dec de	
	zadd hl,bc	
	inc e	
	ld b,a	
	inc e	
	adc a,b	
	inc e	
	call 0161ch
	dec e	
	zor d	
	ld (022dbh),hl
	ld b,023h
	inc (hl)	
	inc hl	
	ld h,l	
	inc hl	
	sbc a,c	
	inc hl	
	rst 8	
	inc hl	
	zadd hl,bc	
	inc h	
	ld b,a	
	inc h	
	adc a,b	
	inc h	
	call 01624h
	dec h	
	zor d	
	ld hl,(02adbh)
	ld b,02bh
	inc (hl)	
	dec hl	
	ld h,l	
	dec hl	
	sbc a,c	
	dec hl	
	rst 8	
	dec hl	
	zadd hl,bc	
	inc l	
	ld b,a	
	inc l	
	adc a,b	
	inc l	
	call 0162ch
	dec l	
	zor d	
	ld (032dbh),a
loc_0db9h:
	ld b,033h
	inc (hl)	
	inc sp	
	ld h,l	
	inc sp	
	sbc a,c	
	inc sp	
	rst 8	
	inc sp	
	zadd hl,bc	
	inc (hl)	
	ld b,a	
	inc (hl)	
	adc a,b	
	inc (hl)	
	call 01634h
	dec (hl)	
	zor d	
	ld a,(03adbh)
	ld b,03bh
	inc (hl)	
	dec sp	
	ld h,l	
	dec sp	
	sbc a,c	
	dec sp	
	rst 8	
	dec sp	
	zadd hl,bc	
	inc a	
	ld b,a	
	inc a	
	adc a,b	
	inc a	
	call 0163ch
	dec a	
	rst 38h	
	inc bc	
	rst 0	
	inc bc	
	zsub b	
	inc bc	
	ld e,l	
	inc bc	
	dec l	
	inc bc	
	rst 38h	
	ld (bc),a	
	call nc,0ab02h
	ld (bc),a	
	zadd a,l	
	ld (bc),a	
	ld h,c	
	ld (bc),a	
	ccf	
	ld (bc),a	
	ld e,002h
	znop	
	ld (bc),a	
	ex (sp),hl	
	ld bc,001c8h
	xor a	
	ld bc,loc_0195h+1
	zadd a,b	
	ld bc,loc_0167h+3
	ld d,(hl)	
	ld bc,loc_0142h+1
	jr nc,loc_0e12h
	rra	
loc_0e12h:
	ld bc,loc_010fh
	znop	
	ld bc,loc_00f1h+1
	call po,0d700h
	znop	
	rlc b
	ret nz	
	znop	
	zor l	
	znop	
	xor e	
	znop	
	zand c	
	znop	
	sbc a,b	
	znop	
	zsub b	
	znop	
	adc a,b	
	znop	
	zadd a,b	
	znop	
	ld a,c	
	znop	
	ld (hl),d	
	znop	
	ld l,h	
	znop	
	ld h,(hl)	
	znop	
	ld h,b	
	znop	
	ld e,e	
	znop	
	ld d,l	
	znop	
	ld d,c	
	znop	
	ld c,h	
	znop	
	ld c,b	
	znop	
	ld b,h	
	znop	
	ld b,b	
	znop	
	inc a	
	znop	
	zadd hl,sp	
	znop	
	ld (hl),000h
	inc sp	
	znop	
	jr nc,loc_0e51h
loc_0e51h:
	dec l	
	znop	
	dec hl	
	znop	
	jr z,loc_0e57h
loc_0e57h:
	ld h,000h
	inc h	
	znop	
	ld (02000h),hl
	znop	
	ld e,000h
	inc e	
	znop	
	dec de	
	znop	
	zadd hl,de	
	znop	
	jr loc_0e69h
loc_0e69h:
	ld d,000h
	dec d	
	znop	
	inc d	
	znop	
	inc de	
	znop	
	ld (de),a	
	znop	
	ld de,01000h
	znop	
	rrca	
	znop	
	ld c,000h
	ld c,000h
	dec c	
	znop	
	inc c	
	znop	
	dec bc	
	znop	
	ld a,(bc)	
	znop	
	ld a,(bc)	
	znop	
	zadd hl,bc	
	znop	
	zadd hl,bc	
	znop	
	ex af,af	
	znop	
	ex af,af	
	znop	
	rlca	
	znop	
	rlca	
	znop	
	rlca	
	znop	
	rlca	
	znop	
	ld b,000h
	ld b,000h
	dec b	
	znop	
	dec b	
	znop	
	dec b	
	znop	
	inc b	
	znop	
	inc b	
	znop	
	inc b	
	znop	
	inc bc	
	znop	
	inc bc	
	znop	
	inc bc	
	znop	
sub_0eadh:
	ld a,(loc_0022h)
	zand a	
	jr z,loc_0ef1h
	zsub a	
	ld (01f68h),a
	ld bc,loc_0000h
loc_0ebah:
	ld a,(bc)	
	cp 0f0h
	jp c,loc_0ed1h
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,00f1ch
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	call sub_0ef2h
	jr loc_0ed6h
loc_0ed1h:
	push bc	
	call sub_0c6dh
	pop bc	
loc_0ed6h:
	inc c	
	ld a,001h
	ld (loc_0024h+2),a
	ld a,(loc_0022h)
	cp c	
	jp z,loc_0eeah
	zsub a	
	ld (loc_0024h+2),a
	jp loc_0ebah
loc_0eeah:
	zsub a	
	ld (loc_0022h),a
	ld (loc_0024h+2),a
loc_0ef1h:
	ret	
sub_0ef2h:
	jp (hl)	
sub_0ef3h:
	zsub a	
	ld (loc_0021h),a
	ld (loc_0031h),a
	dec a	
	ld (01f7dh),a
	ld a,027h
	ld (04000h),a
	ld a,030h
	ld (04001h),a
sub_0f08h:
	ld hl,01c00h
	ld de,loc_0030h
	ld b,00dh
	zsub a	
loc_0f11h:
	ld (hl),a	
	zadd hl,de	
	djnz loc_0f11h
	ld a,(loc_0021h)
	res 5,a
	ld (loc_0021h),a
	ld a,01fh
	ld (loc_002fh),a
	ld a,022h
	ld (04000h),a
	ld a,(0800eh)
	ld (04001h),a
	ld hl,(08002h)
	ld bc,loc_0011h
	zadd hl,bc	
	ld (loc_002ah),hl
	ld a,(loc_0021h)
	zand 0feh
	ld (loc_0021h),a
	ld a,003h
	ld (loc_0027h),a
	ld hl,(0800ch)
	ld c,(hl)	
	ld b,000h
	inc hl	
	zadd hl,bc	
	ld (01f5ch),hl
	ld a,02bh
	ld (04000h),a
	zsub a	
	ld (04001h),a
	call sub_09bbh
	ld hl,00707h
	ld (01f26h),hl
	ld (01f28h),hl
	ld (01f2ah),hl
	ld hl,0ffffh
	ld (01f2ch),hl
	ld (01f2eh),hl
	ld (01f30h),hl
	ld (01f32h),hl
	ld (01f34h),hl
	ld (01f36h),hl
	call sub_01d8h
	ret	
sub_0f80h:
	res 5,(hl)
	ld a,01fh
	ld (loc_002fh),a
	ld bc,loc_0030h
	ld hl,01c0bh
	ld a,00ch
loc_0f8fh:
	res 3,(hl)
	zadd hl,bc	
	dec a	
	jr nz,loc_0f8fh
	ret	
sub_0f96h:
	ld a,(01f51h)
	cp h	
	jr nz,loc_0fa1h
	ld a,(01f50h)
	cp l	
	ret z	
loc_0fa1h:
	ld a,l	
	rlca	
	ld (06000h),a
	ld a,h	
	ld (06000h),a
	rrca	
loc_0fabh:
	ld (06000h),a
	rrca	
	ld (06000h),a
	rrca	
	ld (06000h),a
	rrca	
	ld (06000h),a
	rrca	
	ld (06000h),a
	rrca	
loc_0fbfh:
	ld (06000h),a
	rrca	
	ld (06000h),a
	ld (01f50h),hl
	ret	
	push ix
	pop ix
sub_0fceh:
	ret	
	push hl	
	pop hl	
sub_0fd1h:
	push hl	
	pop hl	
	ret	
loc_0fd4h:
	djnz *+18
	djnz *+18
	jr nc,loc_104ah
	ld (hl),b	
	ret p	
loc_0fdch:
	ld a,a	
	ld e,b	
	ld d,h	
	ld d,b	
	ld c,h	
	ld c,b	
	ld b,h	
	ld b,b	
	inc a	
	jr c,loc_101bh
	jr nc,loc_1015h
	jr z,loc_100fh
	jr nz,loc_100bh
	inc e	
	ld a,(de)	
	jr loc_1007h
	inc d	
	ld (de),a	
	djnz loc_1003h
	inc c	
	ld a,(bc)	
	ex af,af	
	ld b,004h
	ld (bc),a	
	znop	
	inc e	
	djnz *+31
	djnz loc_1024h
	djnz loc_102ch
loc_1003h:
	djnz loc_1047h
	djnz *+92
loc_1007h:
	djnz loc_0fabh
	djnz loc_0fbfh
loc_100bh:
	djnz loc_1029h
	djnz *+30
loc_100fh:
	djnz *-56
	djnz *-56
	djnz loc_1036h
loc_1015h:
	ld de,loc_101bh+1
	inc e	
	djnz *+30
loc_101bh:
	djnz *-53
	push bc	
	call sub_0ef3h
	pop bc	
	ret	
	push bc	
loc_1024h:
	call sub_0f08h
	pop bc	
	ret	
loc_1029h:
	call sub_1070h
loc_102ch:
	ld a,01fh
	ld (loc_002fh),a
	ld hl,loc_0010h
	zadd hl,bc	
	ld a,(hl)	
loc_1036h:
	ld (loc_002eh),a
	ld a,(loc_0021h)
	zor 030h
	ld (loc_0021h),a
	ret	
	zsub a	
	ld (01f68h),a
	push bc	
loc_1047h:
	ld hl,loc_0010h
loc_104ah:
	zadd hl,bc	
	ld a,(hl)	
	call sub_0c6dh
	pop bc	
	zsub a	
	ld (loc_002fh),a
	ld a,(loc_0021h)
	jp loc_1060h
	ld a,(loc_0021h)
	bit 5,a
	ret z	
loc_1060h:
	zand 0efh
	zor 020h
	ld (loc_0021h),a
	call sub_1070h
	ld a,01fh
	ld (loc_002eh),a
	ret	
sub_1070h:
	ld hl,loc_0008h
	zadd hl,bc	
	ld a,(hl)	
	ld (loc_002ch),a
	ld a,0ffh
	ld (loc_002dh),a
	push ix
	ld de,loc_0030h
	ld h,00bh
	ld ix,01c00h
loc_1088h:
	ld a,(ix+000h)
	zand a	
	jr z,loc_1099h
	jp m,loc_1099h
	ld a,(ix+00bh)
	zor 008h
	ld (ix+00bh),a
loc_1099h:
	zadd ix,de
	dec h	
	jp p,loc_1088h
	pop ix
	ret	
	ld a,(loc_0021h)
	zor 002h
	ld (loc_0021h),a
	push bc	
	zsub a	
	ld (01f68h),a
	call sub_0c6dh
	pop bc	
	ret	
	ld a,(loc_0021h)
	zand 0fdh
	ld (loc_0021h),a
	push bc	
	zsub a	
	ld (01f68h),a
	call sub_0c6dh
	pop bc	
	ret	
	ld hl,loc_0008h
	zadd hl,bc	
	ld a,(hl)	
	zand a	
	jp m,loc_1110h
	ld d,001h
loc_10d1h:
	ld e,a	
	ld hl,loc_0010h
	zadd hl,bc	
	ld a,(loc_0021h)
	zand 001h
	ld a,(hl)	
	jp z,loc_10e4h
	ld hl,01f58h
	cp (hl)	
	ret c	
loc_10e4h:
	ld (01f58h),a
	ld a,(bc)	
	cp 0fah
	ld a,0c0h
	jp z,loc_10f4h
	ld hl,loc_0018h
	zadd hl,bc	
	ld a,(hl)	
loc_10f4h:
	ld (01f57h),a
	ld a,e	
	ld (01f55h),a
	ld a,d	
	ld (loc_0027h),a
	cp 003h
	ret z	
	ld a,(loc_0021h)
	zor 001h
	ld (loc_0021h),a
	ld a,0fah
	ld (01f59h),a
	ret	
loc_1110h:
	cp 0ffh
	jp z,loc_111ch
	zand 07fh
	ld d,002h
	jp loc_10d1h
loc_111ch:
	ld d,003h
	jp loc_10d1h
	ld a,001h
	ld (01f68h),a
	ld hl,loc_0010h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f66h),a
	ld hl,loc_0018h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f67h),a
	ld a,001h
	ld (01f68h),a
	ld hl,loc_0008h
	zadd hl,bc	
	ld a,(hl)	
	push bc	
	call sub_0c6dh
	pop bc	
	zsub a	
	ld (01f68h),a
	ret	
loc_114ah:
	di	
	im 1
	ld sp,02000h
	ld hl,0ffffh
	ld (01f50h),hl
	ld hl,(01f00h)
	call sub_0f96h
	zsub a	
	ld (loc_0022h),a
	ld (loc_0023h),a
	ld (loc_0020h),a
	ld (loc_0024h+2),a
	ld (loc_0024h),a
	call sub_0ef3h
loc_116fh:
	ei	
	znop	
	di	
	ld a,(loc_0027h)
	zand a	
	jr z,loc_116fh
loc_1178h:
	zor 080h
	ld (loc_0027h),a
	ei	
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,loc_118fh
	zadd hl,de	
	ld a,d	
	ld (01f6dh),a
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	jp (hl)	
loc_118fh:
	ld h,012h
	zsub a	
	ld de,loc_1197h
	ld h,012h
loc_1197h:
	di	
	ld a,02bh
	ld (04000h),a
	ld a,080h
	ld (04001h),a
	ld a,(loc_0021h)
	zor 001h
	ld (loc_0021h),a
	call sub_09bbh
	ld hl,0ffffh
	ld (01f32h),hl
	ld (01f34h),hl
	ld (01f36h),hl
	call sub_01d8h
	ld hl,01c0ch
	ld de,loc_0030h
	ld b,00dh
loc_11c4h:
	zset 6,(hl)
	zadd hl,de	
	djnz loc_11c4h
	ld a,0b6h
	ld (04002h),a
	ld a,(01f57h)
	ld (04003h),a
	ld hl,(01f00h)
	call sub_0f96h
	call sub_12a8h
	call sub_0f96h
	call sub_12cdh
loc_11e3h:
	ld a,02ah
	ld (04000h),a
	ld a,h	
	zand a	
	ld a,080h
	jr z,loc_11f1h
	ld a,(hl)	
	zand 0f0h
loc_11f1h:
	ld (04001h),a
	call sub_1247h
	ld a,02ah
	ld (04000h),a
	ld a,h	
	zand a	
	ld a,080h
	jr z,loc_1207h
	ld a,(hl)	
	zadd a,a	
	zadd a,a	
	zadd a,a	
	zadd a,a	
loc_1207h:
	ld (04001h),a
	call sub_1247h
	ld a,(loc_0027h)
	zand a	
	jp p,loc_1178h
	ld a,h	
	zand a	
	jp z,loc_121ah
	inc hl	
loc_121ah:

	dec bc	
	ld a,c	
	zor b	
	jp nz,loc_11e3h
	call sub_12f3h
	jp nz,loc_11e3h
	di		
	ld a,(loc_0027h)
	zand a	
	jp p,loc_1178h
	zsub a	
	ld (loc_0027h),a
	ld a,02bh
	ld (04000h),a
	zsub a	
	ld (04001h),a
	ld a,(loc_0021h)
	zand 0feh
	ld (loc_0021h),a
	ei	
	jp loc_116fh
	
sub_1247h:
	ld a,(loc_0022h)
	zand a	
	jp z,loc_12a0h
	zsub a	
	ld (01f68h),a
	push bc	
	push hl	
	ld hl,(01f50h)
	push hl	
	ld hl,(01f00h)
	call sub_0f96h
	ld bc,loc_0000h
loc_1261h:
	ld a,(bc)	
	cp 0f0h
	jp c,loc_1278h
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,00f1ch
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	call sub_129fh
	jr loc_127dh
loc_1278h:
	push bc	
	call sub_0c6dh
	pop bc	
loc_127dh:
	inc c	
	ld a,001h
	ld (loc_0024h+2),a
	ld a,(loc_0022h)
	cp c	
	jp z,loc_1291h
	zsub a	
	ld (loc_0024h+2),a
	jp loc_1261h
loc_1291h:
	zsub a	
	ld (loc_0022h),a
	ld (loc_0024h+2),a
	pop hl	
	call sub_0f96h
	pop hl	
	pop bc	
	ret	
sub_129fh:
	jp (hl)	
loc_12a0h:
	ld a,(01f54h)
loc_12a3h:
	dec a	
	jp nz,loc_12a3h
	ret	
sub_12a8h:
	ld a,(01f55h)
sub_12abh:
	zadd a,a	
	ld c,a	
	ld b,000h
	ld hl,(01f5ch)
	zadd hl,bc	
	ld e,(hl)	
	inc hl	
	ld c,(hl)	
	ld hl,(0800ch)
	inc hl	
	zadd hl,bc	
	ld a,(hl)	
	ld (01f5ah),a
	inc hl	
	ld a,(hl)	
	ld (01f5bh),a
	ld hl,01f00h
	zadd hl,bc	
	ld a,(hl)	
	inc hl	
	ld h,(hl)	
	ld l,a	
	ret	
sub_12cdh:
	ld d,000h
	ld hl,(01f5ah)
	zadd hl,de	
	ld a,(hl)	
	inc l	
	ld h,(hl)	
	ld l,a	
	ld e,(hl)	
	inc hl	
	ld a,(hl)	
	inc hl	
	zand a	
	ld d,a	
	jr nz,loc_12e4h
	ld a,e	
	zand a	
	jp p,loc_1312h
loc_12e4h:
	ld c,(hl)	
	inc hl	
	ld b,(hl)	
	inc hl	
	ld a,(hl)	
	ld (01f54h),a
	inc hl	
	inc hl	
	ld (01f52h),hl
	ex de,hl	
	ret	
sub_12f3h:
	ld hl,(01f52h)
	ld e,(hl)	
	inc hl	
	ld a,(hl)	
	inc hl	
	zand a	
	ld d,a	
	jr nz,loc_1303h
	ld a,e	
	zand a	
	jp p,loc_1312h
loc_1303h:
	ld c,(hl)	
	inc hl	
	ld b,(hl)	
	inc hl	
	ld a,(hl)	
	ld (01f54h),a
	inc hl	
	inc hl	
	ld (01f52h),hl
	ex de,hl	
	ret	
loc_1312h:
	jr z,loc_132dh
	ld (01f6ch),hl
	ld hl,(01f50h)
	ld (01f6eh),hl
	ld hl,(01f00h)
	call sub_0f96h
	ld a,e	
	call sub_12abh
	call sub_0f96h
	jp sub_12cdh
loc_132dh:
	ld hl,(01f6ch)
	ld a,h	
	zand a	
	ret z	
	zsub a	
	ld (01f6dh),a
	ld (01f52h),hl
	ld hl,(01f6eh)
	call sub_0f96h
	jp sub_12f3h
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	rst 38h	
	
	z80prog