; commzand line: z80dasm.exe --zorigin=0 -l -o sound.bin soundDriver.bin
	include "tools/LANG.ASM"
	z80prog 0
	org 0
l0000h:
	di	
	jp l114ah
	znop	
	znop	
l0006h:
	znop	
	znop	
l0008h:
	znop	
	znop	
	znop	
l000bh:
	znop	
	znop	
	znop	
	znop	
	znop	
l0010h:
	znop	
l0011h:
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
l0018h:
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
	znop	
l0020h:
	znop	
l0021h:
	znop	
l0022h:
	znop	
l0023h:
	znop	
l0024h:
	ld bc,00101h
l0027h:
	ld bc,l0000h
l002ah:
	znop	
	znop	
l002ch:
	znop	
l002dh:
	znop	
l002eh:
	znop	
l002fh:
	znop	
l0030h:
	znop	
l0031h:
	znop	
	znop	
	znop	
	di	
	jp l114ah
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
	call zsub_0f96h
	call zsub_0eadh
	call zsub_09bbh
	ld hl,l0021h
	ld a,(hl)	
	zand 001h
	jp z,l006ch
	ld a,(01f59h)
	cp 0fah
	ld a,002h
	jp nz,00068h
	ld a,003h
	ld (01f25h),a
l006ch:
	bit 1,(hl)
	jp nz,l0078h
	ld a,(01e40h)
	zand a	
	jp z,l0080h
l0078h:
	ld b,08ch
	ld ix,01e40h
	jr l0086h
l0080h:
	ld b,00bh
	ld ix,01e10h
l0086h:
	zsub a	
	ld (01f68h),a
	ld d,(ix+000h)
	cp d	
	jp z,l0149h
	ld e,(ix+00bh)
	ld c,(ix+00ch)
	exx	
	ld a,(ix+005h)
	zand a	
	jr z,l00a7h
	zadd a,(ix+00fh)
	ld (ix+00fh),a
	jp nc,l00e0h
l00a7h:
	ld b,(ix+00dh)
	exx	
	bit 4,d
	jr nz,l00d4h
	bit 2,e
	jr z,l00d4h
	exx	
	ld a,(ix+015h)
	zand a	
	jr z,l00d5h
	cp b	
	jr z,l00c0h
	jp nc,l00d5h
l00c0h:
	exx	
	zand 014h
	jr nz,l00d2h
	ld a,(01f68h)
	zor 004h
	ld (01f68h),a
	zset 4,c
	ld (ix+00ch),c
l00d2h:
	res 2,e
l00d4h:
	exx	
l00d5h:
	inc b	
	ld (ix+00dh),b
	ld a,b	
	cp (ix+00eh)
	jp z,l028bh
l00e0h:
	ld b,(ix+001h)
	ld a,(ix+002h)
	zadd a,a	
	jp nz,l00eeh
	ld a,b	
	jp l00f1h
l00eeh:
	call zsub_06f4h
l00f1h:
	ld (01f69h),a
	exx	
	bit 7,e
	exx	
	call nz,zsub_0757h
	exx	
	bit 3,c
	exx	
	call nz,zsub_08b1h
	ld a,(ix+003h)
	zand 03fh
	zadd a,a	
	call nz,zsub_07cfh
	ld a,(ix+022h)
	zadd a,a	
l010fh:
	call nz,zsub_098ah
	call zsub_09e9h
	exx	
	bit 5,e
	jp z,l0142h
	ld a,(ix+018h)
	zadd a,(ix+019h)
	ld (ix+019h),a
	jr nc,l0142h
	ld a,(ix+001h)
	cp (ix+01ah)
	jp nz,l0134h
	zset 1,e
	jp l0142h
l0134h:
	res 1,e
	bit 4,e
	jr nz,l013eh
	inc a	
	jp l013fh
l013eh:
	dec a	
l013fh:
	ld (ix+001h),a
l0142h:
	ld (ix+00bh),e
	bit 5,d
	jr nz,l015bh
l0149h:
	ld de,0ffd0h
	zadd ix,de
	dec b	
	jp p,l0086h
	inc b	
	jp z,l016fh
	res 7,b
	jp l0167h
l015bh:
	res 7,b
	dec b	
	jp m,l016fh
	ld de,0ffd0h
	inc b	
	zadd ix,de
l0167h:
	zset 6,(ix+00ch)
	zadd ix,de
	djnz l0167h
l016fh:
	ld hl,l0021h
	bit 5,(hl)
	jr z,l01a5h
	ld de,(l002dh)
	ld a,(l002ch)
	zadd a,e	
	ld (l002dh),a
	jr nc,l01a5h
	bit 4,(hl)
	jr nz,l019ah
	ld a,(l002fh)
	cp d	
	jr z,l0195h
	inc a	
	ld (l002fh),a
	cp d	
	jp nz,l01a5h
l0195h:
	call zsub_0f80h
	jr l01a5h
l019ah:
	ld a,(l002fh)
	cp d	
	jp z,l01a5h
	dec a	
	ld (l002fh),a
l01a5h:
	ld a,(l0021h)
	zand 001h
	jp z,l01c3h
	ld a,(01f25h)
	cp 002h
	jp c,l01c3h
	cp 003h
	jp z,l01bfh
	ld a,003h
	ld (l0027h),a
l01bfh:
	zsub a	
	ld (01f25h),a
l01c3h:
	call zsub_01d8h
	pop hl	
	call zsub_0f96h
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
zsub_01d8h:
	ld hl,01f70h
	ld b,080h
l01ddh:
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
	jp nz,l01ddh
	inc l	
	ld a,(l0031h)
	cp (hl)	
	res 3,a
	ld (hl),a	
	ld (l0031h),a
	jp z,l0218h
	zand 007h
	zor 0e0h
	ld (07f11h),a
l0218h:
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
l022dh:
	ld a,(ix+000h)
	zand a	
	jp z,l023bh
	ld (ix+012h),001h
	jp l0275h
l023bh:
	cp (ix+012h)
	jp z,l0275h
	ld (ix+012h),000h
	exx	
	ld e,(ix+006h)
	ld d,000h
	ld hl,l0fd4h
	zadd hl,de	
	ld a,(hl)	
	exx	
	ld b,a	
	ld a,c	
	zadd a,040h
l0255h:
	sla b
	jp nc,l0262h
	ld (hl),a	
	inc l	
	ld (hl),d	
	dec l	
	call zsub_0fceh
	znop	
l0262h:
	zadd a,004h
	cp 050h
	jp c,l0255h
	zsub 050h
	ld c,a	
	ld a,028h
	ld (04000h),a
	ld a,e	
	ld (04001h),a
l0275h:
	inc c	
	inc e	
	inc ix
	ld a,c	
	cp 003h
	jp nz,l022dh
	bit 2,e
	ret nz	
	ld c,000h
	ld e,004h
	ld l,002h
	jp l022dh
l028bh:
	exx	
	bit 0,c
	jp z,l02b7h
	res 0,c
	ld (ix+00ch),c
	ld a,(l0021h)
	zand 001h
	jr z,l02b7h
	ld a,(01f59h)
	cp (ix+014h)
	jp nz,l0008h
	ld a,02bh
	ld (04000h),a
	zsub a	
	ld (04000h),a
	ld (01f25h),a
l02b2h:
	ld a,003h
	ld (l0027h),a
l02b7h:
	exx	
	ld e,(ix+007h)
	ld d,(ix+008h)
	jp l02c2h
l02c1h:
	inc de	
l02c2h:
	ld a,(de)	
	zand a	
	jp p,l05f8h
	cp 0c0h
	jp nc,l058fh
	inc de	
	ld hl,l02c1h
	push hl	
	ld hl,l02dfh
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
l02dfh:
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
l0331h:
	ld l,a	
	inc de	
	ld a,(de)	
	ld h,a	
	ex de,hl	
	dec de	
	ret	
	inc de	
	cp 011h
	jr z,l0346h
	dec (ix+010h)
	ld a,(de)	
	jp nz,l0331h
	inc de	
	ret	
l0346h:
	dec (ix+011h)
	ld a,(de)	
	jp nz,l0331h
	inc de	
	ret	
	inc de	
	cp 011h
	jr z,l035dh
	dec (ix+010h)
	ld a,(de)	
	jp z,l0331h
	inc de	
	ret	
l035dh:
	dec (ix+011h)
	ld a,(de)	
	jp z,l0331h
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
	ld (l0024h),a
	ld a,(ix+014h)
	ld (l0020h),a
	zsub a	
	ld (l0024h),a
	ld (ix+000h),000h
	pop hl	
	exx	
	jp l0149h
	ld (ix+003h),a
	ret	
	ld (ix+002h),a
	ret	
	cp 080h
	jr z,l039ah
	zadd a,(ix+004h)
	ld (ix+004h),a
	ret	
l039ah:
	ld (ix+004h),000h
	ret	
	ld (ix+000h),a
	exx	
	ld d,a	
	exx	
	ret	
	ld c,(ix+001h)
	zand a	
	jp p,l03b5h
	zadd a,c	
	jr c,l03bch
	ld (ix+001h),000h
	ret	
l03b5h:
	zadd a,c	
	cp 020h
	jr c,l03bch
	ld a,01fh
l03bch:
	ld (ix+001h),a
	ret	
	exx	
	zand a	
	jr z,l03d2h
	ld (ix+020h),a
	zset 3,c
	ld (ix+00ch),c
	ld (ix+013h),000h
	exx	
	ret	
l03d2h:
	res 3,c
	ld (ix+00ch),c
	exx	
	ret	
	inc de	
	ld b,a	
	ld a,001h
	ld (l0024h+2),a
	ld a,(l0022h)
	cp 008h
	jr nc,l0400h
	ld l,a	
	ld h,000h
	ld (hl),b	
	inc a	
	ld (l0022h),a
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
	ld (l0024h+2),a
	ret	
l0400h:
	inc de	
	ret	
	ld b,a	
	ld a,001h
	ld (l0024h),a
	ld hl,l0020h
	zor (hl)	
	ld (hl),b	
	zsub a	
	ld (l0024h),a
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
	jp p,l0430h
	zset 4,e
l0430h:
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
	jr nz,l0446h
	res 5,e
l0446h:
	exx	
	ret	
zsub_0448h:
	exx	
	res 6,e
	zand a	
	jp p,l0451h
	zset 6,e
l0451h:
	zset 7,e
	zand 07fh
	jr z,l045ch
	ld (ix+021h),a
	exx	
	ret	
l045ch:
	res 7,e
	exx	
	ret	
	exx	
	bit 1,e
	exx	
	jp z,l0331h
	inc de	
	ret	
	exx	
	bit 5,c
	exx	
	jp nz,l0331h
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
	jr z,l048fh
l0487h:
	ld a,(01f68h)
	zor 008h
	ld (01f68h),a
l048fh:
	dec de	
	ret	
	exx	
	zset 4,d
	ld (ix+000h),d
	exx	
	jp l0487h
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
	jr z,l04b2h
	zadd a,(ix+012h)
l04b2h:
	ld (ix+012h),a
	ret	
	cp (ix+006h)
	jr z,l04bdh
	inc de	
	inc de	
l04bdh:
	ret	
	inc de	
	cp (ix+006h)
	ld a,(de)	
	jp z,l0331h
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
	jp m,l0545h
	ld b,001h
l04ffh:
	ld c,a	
	ld a,(l0021h)
	zand 001h
	jp z,l0514h
	ld a,(01f58h)
	exx	
	cp b	
	exx	
	jp c,l0514h
	jp nz,l053bh
l0514h:
	ld a,(ix+009h)
	ld (01f57h),a
	exx	
	ld a,b	
	exx	
	ld (01f58h),a
	ld a,c	
	ld (01f55h),a
	ld a,b	
	ld (l0027h),a
	ld a,(ix+014h)
	ld (01f59h),a
	ld a,(l0021h)
	zor 001h
	ld (l0021h),a
	ld a,002h
	ld (01f25h),a
l053bh:
	exx	
	zset 0,c
	ld (ix+00ch),c
	exx	
	jp l0578h
l0545h:
	zand 07fh
	ld b,002h
	jp l04ffh
	ld b,a	
	ld a,001h
	ld (l0024h+2),a
	ld a,(l0022h)
	cp 008h
	jr nc,l0578h
	ld l,a	
	ld h,000h
	ld (hl),0fch
	inc a	
	ld (l0022h),a
	zadd a,007h
	ld l,a	
	ld (hl),b	
l0566h:
	zadd a,008h
	ld l,a	
	ld b,(ix+001h)
	ld (hl),b	
	zadd a,008h
	ld l,a	
	ld b,(ix+004h)
	ld (hl),b	
	zsub a	
	ld (l0024h+2),a
l0578h:
	ld hl,01f68h
	zset 6,(hl)
	ld a,(ix+013h)
	zand a	
	ex af,af	
	ld (ix+017h),001h
	ld (ix+013h),001h
	inc de	
	pop hl	
	jp l0628h
l058fh:
	cp 0deh
	jp nc,l05eeh
	zsub 0c0h
	zadd a,a	
	zadd a,a	
	zadd a,a	
	ld c,a	
	ld b,000h
	ld hl,(l002ah)
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
	jr nz,l05dah
	exx	
	res 7,e
	exx	
	jp l05e0h
l05dah:
	ld a,c	
	call zsub_0448h
	ld c,000h
l05e0h:
	ld (ix+003h),c
	inc hl	
	ld a,(hl)	
	ld (ix+009h),a
	inc hl	
	ld a,(hl)	
	zand a	
	jp l05f8h
l05eeh:
	ld a,(ix+013h)
	ld c,a	
	zand a	
	ex af,af	
	ld a,c	
	jp l0602h
l05f8h:
	inc de	
	ex af,af	
	ld a,(ix+013h)
	zand a	
	ex af,af	
	ld (ix+013h),a
l0602h:
	call zsub_06bbh
	exx	
	bit 3,c
	exx	
	jp z,l0622h
	ld a,(ix+013h)
	zand a	
	jp z,l0622h
	ld (ix+01dh),b
	ld (ix+01ch),c
	ex af,af	
	jp z,l0621h
	ex af,af	
	jp l0628h
l0621h:
	ex af,af	
l0622h:
	ld (ix+016h),c
	ld (ix+017h),b
l0628h:
	ld a,(de)	
	zsub 0efh
	jp c,l064ah
	jp nz,l0636h
	inc de	
	ld a,(de)	
	jp l063eh
l0636h:
	ld hl,(08002h)
	ld c,a	
	ld b,000h
	zadd hl,bc	
	ld a,(hl)	
l063eh:
	inc de	
	ld (ix+00eh),a
	ld a,(de)	
	ld (ix+015h),a
	inc de	
	jp l0665h
l064ah:
	zsub 0efh
	jr z,l0654h
	jp nc,l0659h
	jp l0665h
l0654h:
	inc de	
	ld a,(de)	
	jp l0661h
l0659h:
	ld hl,(08002h)
	ld c,a	
	ld b,000h
	zadd hl,bc	
	ld a,(hl)	
l0661h:
	inc de	
	ld (ix+00eh),a
l0665h:
	zsub a	
	ld (ix+00dh),a
	exx	
	ld hl,01f68h
	ex af,af	
	jr z,l0691h
	bit 4,d
	jr z,l0682h
	bit 3,(hl)
	jp nz,l0682h
	bit 6,c
	jr z,l06a0h
	zset 5,(hl)
	jp l06a0h
l0682h:
	bit 2,d
	jp z,l0691h
	bit 4,(hl)
	jp nz,l0691h
	bit 6,c
	jp z,l0693h
l0691h:
	zset 5,(hl)
l0693h:
	zsub a	
	ld (ix+01eh),a
	ld (ix+01fh),a
	ld (ix+023h),000h
	zset 2,e
l06a0h:
	bit 6,(hl)
	jp z,l06aah
	zset 6,c
	jp l06ach
l06aah:
	res 6,c
l06ach:
	ld (ix+00ch),c
	zset 7,(hl)
	exx	
	ld (ix+008h),d
	ld (ix+007h),e
	jp l00e0h
zsub_06bbh:
	ld bc,l0000h
	zand a	
	ret z	
	exx	
	bit 3,d
	exx	
	jr nz,l06ech
	zadd a,(ix+004h)
	zadd a,a	
	ld c,a	
	ld a,(ix+00ah)
	zand a	
	ld hl,00d21h
	jp nz,l06d8h
	ld hl,l0db9h
l06d8h:
	zadd hl,bc	
	ld c,(hl)	
	inc hl	
	ld b,(hl)	
	ld a,(ix+012h)
	zand a	
	ret z	
	ld h,000h
	jp p,l06e7h
	dec h	
l06e7h:
	ld l,a	
	zadd hl,bc	
	ld c,l	
	ld b,h	
	ret	
l06ech:
	ld c,a	
	zadd a,(ix+004h)
	ld (ix+024h),a
	ret	
zsub_06f4h:
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
	jp p,l0714h
	cp 080h
	jr nz,l0711h
	dec hl	
	ld a,(hl)	
	jp l0718h
l0711h:
	call zsub_071eh
l0714h:
	inc e	
	ld (ix+01eh),e
l0718h:
	zadd a,b	
	zsub 01fh
	ret nc	
	zsub a	
	ret	
zsub_071eh:
	cp 081h
	jp nz,l072dh
l0723h:
	inc hl	
	ld a,e	
	ld e,(hl)	
	sbc hl,de
	zsub e	
	ld e,a	
	dec hl	
	ld a,(hl)	
	ret	
l072dh:
	cp 082h
	jp nz,l0738h
	sbc hl,de
	ld a,(hl)	
	ld e,000h
	ret	
l0738h:
	cp 083h
	jp nz,l074bh
	exx	
	bit 2,e
	exx	
	jr z,l0747h
	dec hl	
	ld a,(hl)	
	dec e	
	ret	
l0747h:
	inc e	
	inc hl	
	ld a,(hl)	
	ret	
l074bh:
	exx	
	bit 2,e
	exx	
	jr nz,l0723h
	inc e	
	inc e	
	inc hl	
	inc hl	
	ld a,(hl)	
	ret	
zsub_0757h:
	ld c,(ix+021h)
	ld a,(01f68h)
	bit 7,a
	jr z,l076eh
	ld a,(ix+013h)
	zand a	
	jr z,l076ah
	zadd a,(ix+004h)
l076ah:
	ld (ix+01bh),a
	ret	
l076eh:
	ld a,(ix+01bh)
	zand a	
	ret z	
	exx	
	bit 6,e
	exx	
	jr nz,l077ch
	zsub c	
	jr l077dh
l077ch:
	zadd a,c	
l077dh:
	jr z,l07c5h
	ld c,(ix+00ah)
	rlc c
	jp nz,l0795h
	cp 016h
	jr c,l07c4h
	cp 07ah
	jr nc,l07c4h
	ld hl,l0db9h
	jp l079ch
l0795h:
	cp 062h
	jr nc,l07c4h
	ld hl,00d21h
l079ch:
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
	jp z,l07bdh
	ld h,000h
	jp p,l07b4h
	dec h	
l07b4h:
	ld l,a	
	zadd hl,bc	
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
l07bdh:
	ld (ix+016h),c
	ld (ix+017h),b
	ret	
l07c4h:
	zsub a	
l07c5h:
	ld (ix+01bh),a
	ld (ix+016h),a
	ld (ix+017h),a
	ret	
zsub_07cfh:
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
	jp p,l07ebh
	cp 085h
	jp nc,l07ebh
	call zsub_071eh
l07ebh:
	inc e	
	ld (ix+01fh),e
	ld c,(ix+003h)
	bit 7,c
	jp z,l07f9h
	cpl	
	inc a	
l07f9h:
	zand a	
	ret z	
	ld e,a	
	jp p,l0800h
	dec d	
l0800h:
	ld l,(ix+016h)
	ld h,(ix+017h)
	ld a,h	
	zor l	
	ret z	
	ld a,(ix+00ah)
	zand a	
	jp nz,l0835h
	sbc hl,de
	bit 7,d
	jp z,l082ch
	ld a,h	
	cp 004h
	jr nc,l0823h
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
l0823h:
	ld (ix+016h),000h
	ld (ix+017h),000h
	ret	
l082ch:
	jr c,l0823h
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
l0835h:
	bit 6,c
	jp nz,l0897h
	ld a,h	
	zand 038h
	ld b,a	
	ld a,h	
	zand 007h
	ld h,a	
	zadd hl,de	
	push hl	
	bit 7,d
	jp nz,l0870h
	ld de,l0566h
	sbc hl,de
	jp nc,l085bh
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor b	
	ld (ix+017h),a
	ret	
l085bh:
	pop de	
	ld de,l02b2h
	zadd hl,de	
	ld (ix+016h),l
	ld a,b	
	zadd a,008h
	cp 040h
	jp nc,l0823h
	zor h	
	ld (ix+017h),a
	ret	
l0870h:
	ld de,l02b2h
	zand a	
	sbc hl,de
	jp c,l0883h
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor b	
	ld (ix+017h),a
	ret	
l0883h:
	pop de	
	ld de,l0566h
	zadd hl,de	
	ld (ix+016h),l
	ld a,b	
	zand a	
	jp z,l0823h
	zsub 008h
	zor h	
	ld (ix+017h),a
	ret	
l0897h:
	ld a,h	
	zadd hl,de	
	cp h	
	jr z,l08aah
	bit 7,d
	jr nz,l08a5h
	ld (ix+016h),0ffh
	ret	
l08a5h:
	ld (ix+016h),000h
	ret	
l08aah:
	ld (ix+016h),l
	ld (ix+017h),h
	ret	
zsub_08b1h:
	ld l,(ix+016h)
	ld h,(ix+017h)
	ld a,l	
	zor h	
	ret z	
	ld b,(ix+01dh)
	ld c,(ix+01ch)
	ld a,(ix+00ah)
	zand a	
	jp nz,l08ffh
l08c7h:
	push hl	
	sbc hl,bc
	pop hl	
	ret z	
	jr c,l08d9h
	ld a,l	
	zsub (ix+020h)
	ld l,a	
	jr nc,l08f1h
	dec h	
	jp l08f1h
l08d9h:
	ld a,l	
	zadd a,(ix+020h)
	ld l,a	
	jr nc,l08e1h
	inc h	
l08e1h:
	push hl	
	zand a	
	sbc hl,bc
	pop hl	
	jr z,l08f8h
	jr c,l08f8h
l08eah:
	ld (ix+016h),c
	ld (ix+017h),b
	ret	
l08f1h:
	push hl	
	zand a	
	sbc hl,bc
	pop hl	
	jr c,l08eah
l08f8h:
	ld (ix+016h),l
	ld (ix+017h),h
l08feh:
	ret	
l08ffh:
	ld a,h	
	cp b	
	jr nz,l0921h
	ld a,l	
	cp c	
	jr z,l08feh
	jr c,l0915h
	zsub (ix+020h)
	jr c,l0911h
	cp c	
	jr nc,l091dh
l0911h:
	ld (ix+016h),c
	ret	
l0915h:
	zadd a,(ix+020h)
	jr c,l0911h
	cp c	
	jr nc,l0911h
l091dh:
	ld (ix+016h),a
	ret	
l0921h:
	zand 038h
	ld e,a	
	ld a,b	
	zand 038h
	cp e	
	jp z,l08c7h
	jp nc,l095dh
	ld a,h	
	zand 007h
	ld h,a	
	ld c,(ix+020h)
	ld b,000h
	zand a	
	sbc hl,bc
	ld bc,l02b2h
	push hl	
	sbc hl,bc
	jp c,l094dh
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor e	
	ld (ix+017h),a
	ret	
l094dh:
	ld bc,l0566h
	zadd hl,bc	
	ld (ix+016h),l
	ld a,e	
	zsub 008h
	zor h	
	ld (ix+017h),a
	pop hl	
	ret	
l095dh:
	ld a,h	
	zand 007h
	ld h,a	
	ld c,(ix+020h)
	ld b,000h
	zadd hl,bc	
	ld bc,l0566h
	push hl	
	sbc hl,bc
	jp nc,l097ah
	pop hl	
	ld (ix+016h),l
	ld a,h	
	zor e	
	ld (ix+017h),a
	ret	
l097ah:
	ld bc,l02b2h
	zadd hl,bc	
	ld (ix+016h),l
	ld a,e	
	zadd a,008h
	zor h	
	ld (ix+017h),a
	pop hl	
	ret	
zsub_098ah:
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
	jp p,l09aah
	cp 080h
	jr nz,l09a7h
	dec hl	
	ld a,(hl)	
	jp l09aeh
l09a7h:
	call zsub_071eh
l09aah:
	inc e	
	ld (ix+023h),e
l09aeh:
	zand 03fh
	ld c,a	
	ld a,(ix+009h)
	zand 0c0h
	zor c	
	ld (ix+009h),a
	ret	
zsub_09bbh:
	ld a,080h
	ld (01f73h),a
	ld (01f77h),a
	ld (01f7bh),a
	ld (01f7eh),a
	ld a,0ffh
	ld (l0030h),a
	ld a,0ffh
	ld (01f70h),a
	ld (01f74h),a
	ld (01f78h),a
	ld (01f7ch),a
	ld hl,l0000h
	ld (01f20h),hl
	ld (01f22h),hl
	ld (01f24h),hl
	ret	
zsub_09e9h:
	exx	
	ld a,e	
	ex af,af	
	ld a,d	
	bit 6,c
	jp z,l0a15h
	bit 0,c
	exx	
	ret z	
	ld a,(01f25h)
	cp 002h
	jp nz,l0a0dh
	ld a,(01f59h)
	cp (ix+014h)
	jp nz,l0a0dh
	ld a,003h
	ld (01f25h),a
	ret	
l0a0dh:
	exx	
	res 0,c
	ld (ix+00ch),c
	exx	
	ret	
l0a15h:
	exx	
	ld b,a	
	ex af,af	
	bit 3,a
	jr z,l0a3ch
	ld a,(l0021h)
	bit 5,a
	jp nz,l0a2dh
	exx	
	res 3,e
	ld (ix+00bh),e
	exx	
	jr l0a3ch
l0a2dh:
	ld hl,(l002fh)
	ld a,(01f69h)
	zadd a,l	
	zsub 01fh
	jr nc,l0a39h
	zsub a	
l0a39h:
	ld (01f69h),a
l0a3ch:
	ld e,(ix+016h)
	ld d,(ix+017h)
	ld c,(ix+006h)
	ld a,(ix+00ah)
	zand a	
	jp nz,l0acdh
	ld a,e	
	zor d	
	ret z	
	bit 1,b
	jp z,l0a8ch
	ld a,(01f7ch)
	zand a	
	jp z,l0a7ah
	zsub a	
	ld (01f7ch),a
	ld a,(01f68h)
	zand 080h
	ld a,(ix+024h)
	jr nz,l0a6bh
	res 3,a
l0a6bh:
	ld (l0031h),a
	ld a,(01f69h)
	srl a
	ld (01f7eh),a
	ld a,c	
	ld (l0030h),a
l0a7ah:
	bit 0,b
	jp nz,l0a9eh
	ld a,c	
	cp 002h
	ret nz	
	zsub a	
	ld (01f69h),a
	ld c,008h
	jp l0aa5h
l0a8ch:
	ld a,(l0030h)
	cp c	
	jr nz,l0a9eh
	cp 002h
	jr nz,l0a9eh
	ld a,(l0031h)
	zand 003h
	cp 003h
	ret z	
l0a9eh:
	ld a,c	
	cp 003h
	ret z	
	zadd a,a	
	zadd a,a	
	ld c,a	
l0aa5h:
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
l0acdh:
	ld a,e	
	zor d	
	jp nz,l0adah
	exx	
	zset 6,c
	ld (ix+00ch),c
	exx	
	ret	
l0adah:
	bit 1,b
	jp z,l0b06h
	ld a,(01f7ch)
	zand a	
	jp z,l0b06h
	zsub a	
	ld (01f7ch),a
	ld a,(01f68h)
	zand 080h
	ld a,(ix+024h)
	jr nz,l0af6h
	res 3,a
l0af6h:
	ld (l0031h),a
	ld a,(01f69h)
	srl a
	ld (01f7eh),a
	ld a,004h
	ld (l0030h),a
l0b06h:
	bit 0,b
	ret z	
	ld b,000h
	ld hl,01f20h
	zadd hl,bc	
	ld a,(hl)	
	zand a	
	jp z,l0b1ch
	exx	
	zset 6,c
	ld (ix+00ch),c
	exx	
	ret	
l0b1ch:
	ld (hl),001h
	ld a,(01f68h)
	bit 7,a
	jp z,l0be5h
	ld hl,01f2ch
	zadd hl,bc	
	ld a,(ix+00ah)
	cp (hl)	
	jp nz,l0b3ch
	ld hl,01f26h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f66h),a
	jp l0bbch
l0b3ch:
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
	jr c,l0b5bh
	zsub 003h
	ld c,a	
	ld l,002h
l0b5bh:
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
l0b71h:
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
	jp nc,l0b8fh
	cp 0a0h
	jp nc,l0b8ah
	cp 000h
	jp l0b71h
l0b8ah:
	zsub 06ch
	jp l0b71h
l0b8fh:
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
l0bbch:
	call zsub_0c03h
	ld hl,01f68h
	ld c,(ix+006h)
	ld a,028h
	ld (04000h),a
	ld a,c	
	cp 003h
	jr c,l0bd0h
	inc a	
l0bd0h:
	bit 5,(hl)
	jp z,l0bdch
	ld (04001h),a
	call zsub_0fd1h
	znop	
l0bdch:
	ld c,(ix+006h)
	zor 0f0h
	ld (04001h),a
	ret	
l0be5h:
	ld hl,01f26h
	zadd hl,bc	
	bit 2,a
	jp z,l0bffh
	ld a,028h
	ld (04000h),a
	ld a,c	
	cp 003h
	jr c,l0bf9h
	inc a	
l0bf9h:
	ld (04001h),a
	ld c,(ix+006h)
l0bffh:
	ld a,(hl)	
	ld (01f66h),a
zsub_0c03h:
	ld b,000h
	ld iy,01f38h
	zadd iy,bc
	ld hl,04000h
	ld a,c	
	cp 003h
	jp c,l0c19h
	ld l,002h
	zsub 003h
	ld c,a	
l0c19h:
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
	ld hl,l0fdch
	zadd hl,de	
	ld b,(hl)	
	ld hl,l0fd4h
	ld a,(01f66h)
	ld e,a	
	zadd hl,de	
	ld d,(hl)	
	pop hl	
	ld a,c	
	zadd a,040h
l0c40h:
	sla d
	jp nc,l0c54h
	ld (hl),a	
	inc l	
	ld c,a	
	ld a,(iy+000h)
	zadd a,b	
	jp p,l0c51h
	ld a,07fh
l0c51h:
	ld (hl),a	
	dec l	
	ld a,c	
l0c54h:
	push bc	
	ld bc,l0006h
	zadd iy,bc
	pop bc	
	zadd a,004h
	cp 050h
	jp c,l0c40h
	zand 003h
	zadd a,0b4h
	ld (hl),a	
	inc l	
	ld a,(ix+009h)
	ld (hl),a	
	ret	
zsub_0c6dh:
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
l0c7ch:
	ld a,(hl)	
	inc hl	
	push hl	
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,l0d05h
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	pop hl	
	ld a,(hl)	
	zand a	
	jr z,l0cfeh
	ld a,(de)	
	bit 6,a
	ret nz	
	push de	
	pop ix
	ld (ix+00ch),000h
	zand a	
	jr z,l0caah
	ld a,c	
	cp (ix+014h)
	jr nz,l0caah
	zset 5,(ix+00ch)
	jp l0cadh
l0caah:
	ld (ix+014h),c
l0cadh:
	push bc	
	ld bc,l000bh
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
	jp z,l0cf3h
	ld a,(01f66h)
	zadd a,(ix+001h)
	zsub 01fh
	jp nc,l0cedh
	zsub a	
l0cedh:
	ld (ix+001h),a
	ld a,(01f67h)
l0cf3h:
	zadd a,(ix+004h)
	ld (ix+004h),a
	dec b	
	jp nz,l0c7ch
	ret	
l0cfeh:
	ld (de),a	
	inc hl	
	dec b	
	jp nz,l0c7ch
	ret	
l0d05h:
	znop	
	inc e	
	jr nc,l0d25h
	ld h,b	
	inc e	
	zsub b	
	inc e	
	ret nz	
	inc e	
	ret p	
	inc e	
	jr nz,l0d30h
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
l0d25h:
	zor d	
	ld (bc),a	
	in a,(002h)
	ld b,003h
	inc (hl)	
	inc bc	
	ld h,l	
	inc bc	
	sbc a,c	
l0d30h:
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
l0db9h:
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
	ld bc,l0195h+1
	zadd a,b	
	ld bc,l0167h+3
	ld d,(hl)	
	ld bc,l0142h+1
	jr nc,l0e12h
	rra	
l0e12h:
	ld bc,l010fh
	znop	
	ld bc,l00f1h+1
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
	jr nc,l0e51h
l0e51h:
	dec l	
	znop	
	dec hl	
	znop	
	jr z,l0e57h
l0e57h:
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
	jr l0e69h
l0e69h:
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
zsub_0eadh:
	ld a,(l0022h)
	zand a	
	jr z,l0ef1h
	zsub a	
	ld (01f68h),a
	ld bc,l0000h
l0ebah:
	ld a,(bc)	
	cp 0f0h
	jp c,l0ed1h
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,00f1ch
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	call zsub_0ef2h
	jr l0ed6h
l0ed1h:
	push bc	
	call zsub_0c6dh
	pop bc	
l0ed6h:
	inc c	
	ld a,001h
	ld (l0024h+2),a
	ld a,(l0022h)
	cp c	
	jp z,l0eeah
	zsub a	
	ld (l0024h+2),a
	jp l0ebah
l0eeah:
	zsub a	
	ld (l0022h),a
	ld (l0024h+2),a
l0ef1h:
	ret	
zsub_0ef2h:
	jp (hl)	
zsub_0ef3h:
	zsub a	
	ld (l0021h),a
	ld (l0031h),a
	dec a	
	ld (01f7dh),a
	ld a,027h
	ld (04000h),a
	ld a,030h
	ld (04001h),a
zsub_0f08h:
	ld hl,01c00h
	ld de,l0030h
	ld b,00dh
	zsub a	
l0f11h:
	ld (hl),a	
	zadd hl,de	
	djnz l0f11h
	ld a,(l0021h)
	res 5,a
	ld (l0021h),a
	ld a,01fh
	ld (l002fh),a
	ld a,022h
	ld (04000h),a
	ld a,(0800eh)
	ld (04001h),a
	ld hl,(08002h)
	ld bc,l0011h
	zadd hl,bc	
	ld (l002ah),hl
	ld a,(l0021h)
	zand 0feh
	ld (l0021h),a
	ld a,003h
	ld (l0027h),a
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
	call zsub_09bbh
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
	call zsub_01d8h
	ret	
zsub_0f80h:
	res 5,(hl)
	ld a,01fh
	ld (l002fh),a
	ld bc,l0030h
	ld hl,01c0bh
	ld a,00ch
l0f8fh:
	res 3,(hl)
	zadd hl,bc	
	dec a	
	jr nz,l0f8fh
	ret	
zsub_0f96h:
	ld a,(01f51h)
	cp h	
	jr nz,l0fa1h
	ld a,(01f50h)
	cp l	
	ret z	
l0fa1h:
	ld a,l	
	rlca	
	ld (06000h),a
	ld a,h	
	ld (06000h),a
	rrca	
l0fabh:
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
l0fbfh:
	ld (06000h),a
	rrca	
	ld (06000h),a
	ld (01f50h),hl
	ret	
	push ix
	pop ix
zsub_0fceh:
	ret	
	push hl	
	pop hl	
zsub_0fd1h:
	push hl	
	pop hl	
	ret	
l0fd4h:
	djnz *+18
	djnz *+18
	jr nc,l104ah
	ld (hl),b	
	ret p	
l0fdch:
	ld a,a	
	ld e,b	
	ld d,h	
	ld d,b	
	ld c,h	
	ld c,b	
	ld b,h	
	ld b,b	
	inc a	
	jr c,l101bh
	jr nc,l1015h
	jr z,l100fh
	jr nz,l100bh
	inc e	
	ld a,(de)	
	jr l1007h
	inc d	
	ld (de),a	
	djnz l1003h
	inc c	
	ld a,(bc)	
	ex af,af	
	ld b,004h
	ld (bc),a	
	znop	
	inc e	
	djnz *+31
	djnz l1024h
	djnz l102ch
l1003h:
	djnz l1047h
	djnz *+92
l1007h:
	djnz l0fabh
	djnz l0fbfh
l100bh:
	djnz l1029h
	djnz *+30
l100fh:
	djnz *-56
	djnz *-56
	djnz l1036h
l1015h:
	ld de,l101bh+1
	inc e	
	djnz *+30
l101bh:
	djnz *-53
	push bc	
	call zsub_0ef3h
	pop bc	
	ret	
	push bc	
l1024h:
	call zsub_0f08h
	pop bc	
	ret	
l1029h:
	call zsub_1070h
l102ch:
	ld a,01fh
	ld (l002fh),a
	ld hl,l0010h
	zadd hl,bc	
	ld a,(hl)	
l1036h:
	ld (l002eh),a
	ld a,(l0021h)
	zor 030h
	ld (l0021h),a
	ret	
	zsub a	
	ld (01f68h),a
	push bc	
l1047h:
	ld hl,l0010h
l104ah:
	zadd hl,bc	
	ld a,(hl)	
	call zsub_0c6dh
	pop bc	
	zsub a	
	ld (l002fh),a
	ld a,(l0021h)
	jp l1060h
	ld a,(l0021h)
	bit 5,a
	ret z	
l1060h:
	zand 0efh
	zor 020h
	ld (l0021h),a
	call zsub_1070h
	ld a,01fh
	ld (l002eh),a
	ret	
zsub_1070h:
	ld hl,l0008h
	zadd hl,bc	
	ld a,(hl)	
	ld (l002ch),a
	ld a,0ffh
	ld (l002dh),a
	push ix
	ld de,l0030h
	ld h,00bh
	ld ix,01c00h
l1088h:
	ld a,(ix+000h)
	zand a	
	jr z,l1099h
	jp m,l1099h
	ld a,(ix+00bh)
	zor 008h
	ld (ix+00bh),a
l1099h:
	zadd ix,de
	dec h	
	jp p,l1088h
	pop ix
	ret	
	ld a,(l0021h)
	zor 002h
	ld (l0021h),a
	push bc	
	zsub a	
	ld (01f68h),a
	call zsub_0c6dh
	pop bc	
	ret	
	ld a,(l0021h)
	zand 0fdh
	ld (l0021h),a
	push bc	
	zsub a	
	ld (01f68h),a
	call zsub_0c6dh
	pop bc	
	ret	
	ld hl,l0008h
	zadd hl,bc	
	ld a,(hl)	
	zand a	
	jp m,l1110h
	ld d,001h
l10d1h:
	ld e,a	
	ld hl,l0010h
	zadd hl,bc	
	ld a,(l0021h)
	zand 001h
	ld a,(hl)	
	jp z,l10e4h
	ld hl,01f58h
	cp (hl)	
	ret c	
l10e4h:
	ld (01f58h),a
	ld a,(bc)	
	cp 0fah
	ld a,0c0h
	jp z,l10f4h
	ld hl,l0018h
	zadd hl,bc	
	ld a,(hl)	
l10f4h:
	ld (01f57h),a
	ld a,e	
	ld (01f55h),a
	ld a,d	
	ld (l0027h),a
	cp 003h
	ret z	
	ld a,(l0021h)
	zor 001h
	ld (l0021h),a
	ld a,0fah
	ld (01f59h),a
	ret	
l1110h:
	cp 0ffh
	jp z,l111ch
	zand 07fh
	ld d,002h
	jp l10d1h
l111ch:
	ld d,003h
	jp l10d1h
	ld a,001h
	ld (01f68h),a
	ld hl,l0010h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f66h),a
	ld hl,l0018h
	zadd hl,bc	
	ld a,(hl)	
	ld (01f67h),a
	ld a,001h
	ld (01f68h),a
	ld hl,l0008h
	zadd hl,bc	
	ld a,(hl)	
	push bc	
	call zsub_0c6dh
	pop bc	
	zsub a	
	ld (01f68h),a
	ret	
l114ah:
	di	
	im 1
	ld sp,02000h
	ld hl,0ffffh
	ld (01f50h),hl
	ld hl,(01f00h)
	call zsub_0f96h
	zsub a	
	ld (l0022h),a
	ld (l0023h),a
	ld (l0020h),a
	ld (l0024h+2),a
	ld (l0024h),a
	call zsub_0ef3h
l116fh:
	ei	
	znop	
	di	
	ld a,(l0027h)
	zand a	
	jr z,l116fh
l1178h:
	zor 080h
	ld (l0027h),a
	ei	
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,l118fh
	zadd hl,de	
	ld a,d	
	ld (01f6dh),a
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	jp (hl)	
l118fh:
	ld h,012h
	zsub a	
	ld de,l1197h
	ld h,012h
l1197h:
	di	
	ld a,02bh
	ld (04000h),a
	ld a,080h
	ld (04001h),a
	ld a,(l0021h)
	zor 001h
	ld (l0021h),a
	call zsub_09bbh
	ld hl,0ffffh
	ld (01f32h),hl
	ld (01f34h),hl
	ld (01f36h),hl
	call zsub_01d8h
	ld hl,01c0ch
	ld de,l0030h
	ld b,00dh
l11c4h:
	zset 6,(hl)
	zadd hl,de	
	djnz l11c4h
	ld a,0b6h
	ld (04002h),a
	ld a,(01f57h)
	ld (04003h),a
	ld hl,(01f00h)
	call zsub_0f96h
	call zsub_12a8h
	call zsub_0f96h
	call zsub_12cdh
l11e3h:
	ld a,02ah
	ld (04000h),a
	ld a,h	
	zand a	
	ld a,080h
	jr z,l11f1h
	ld a,(hl)	
	zand 0f0h
l11f1h:
	ld (04001h),a
	call zsub_1247h
	ld a,02ah
	ld (04000h),a
	ld a,h	
	zand a	
	ld a,080h
	jr z,l1207h
	ld a,(hl)	
	zadd a,a	
	zadd a,a	
	zadd a,a	
	zadd a,a	
l1207h:
	ld (04001h),a
	call zsub_1247h
	ld a,(l0027h)
	zand a	
	jp p,l1178h
	ld a,h	
	zand a	
	jp z,l121ah
	inc hl	
l121ah:
	dec bc	
	ld a,c	
	zor b	
	jp nz,l11e3h
	call zsub_12f3h
	jp nz,l11e3h
	di	
	ld a,(l0027h)
	zand a	
	jp p,l1178h
	zsub a	
	ld (l0027h),a
	ld a,02bh
	ld (04000h),a
	zsub a	
	ld (04001h),a
	ld a,(l0021h)
	zand 0feh
	ld (l0021h),a
	ei	
	jp l116fh
zsub_1247h:
	ld a,(l0022h)
	zand a	
	jp z,l12a0h
	zsub a	
	ld (01f68h),a
	push bc	
	push hl	
	ld hl,(01f50h)
	push hl	
	ld hl,(01f00h)
	call zsub_0f96h
	ld bc,l0000h
l1261h:
	ld a,(bc)	
	cp 0f0h
	jp c,l1278h
	zadd a,a	
	ld e,a	
	ld d,000h
	ld hl,00f1ch
	zadd hl,de	
	ld e,(hl)	
	inc hl	
	ld d,(hl)	
	ex de,hl	
	call zsub_129fh
	jr l127dh
l1278h:
	push bc	
	call zsub_0c6dh
	pop bc	
l127dh:
	inc c	
	ld a,001h
	ld (l0024h+2),a
	ld a,(l0022h)
	cp c	
	jp z,l1291h
	zsub a	
	ld (l0024h+2),a
	jp l1261h
l1291h:
	zsub a	
	ld (l0022h),a
	ld (l0024h+2),a
	pop hl	
	call zsub_0f96h
	pop hl	
	pop bc	
	ret	
zsub_129fh:
	jp (hl)	
l12a0h:
	ld a,(01f54h)
l12a3h:
	dec a	
	jp nz,l12a3h
	ret	
zsub_12a8h:
	ld a,(01f55h)
zsub_12abh:
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
zsub_12cdh:
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
	jr nz,l12e4h
	ld a,e	
	zand a	
	jp p,l1312h
l12e4h:
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
zsub_12f3h:
	ld hl,(01f52h)
	ld e,(hl)	
	inc hl	
	ld a,(hl)	
	inc hl	
	zand a	
	ld d,a	
	jr nz,l1303h
	ld a,e	
	zand a	
	jp p,l1312h
l1303h:
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
l1312h:
	jr z,l132dh
	ld (01f6ch),hl
	ld hl,(01f50h)
	ld (01f6eh),hl
	ld hl,(01f00h)
	call zsub_0f96h
	ld a,e	
	call zsub_12abh
	call zsub_0f96h
	jp zsub_12cdh
l132dh:
	ld hl,(01f6ch)
	ld a,h	
	zand a	
	ret z	
	zsub a	
	ld (01f6dh),a
	ld (01f52h),hl
	ld hl,(01f6eh)
	call zsub_0f96h
	jp zsub_12f3h
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