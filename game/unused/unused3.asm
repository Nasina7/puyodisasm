; Todo: What is this code?
	
	tst.b ($00FF1889)
	bne.w loc_00004B44
	rts
loc_00004B44:
	MOVEM.l	A2, -(A7)
	suba.l #$48, a2
	clr.w d0
	move.b ($00FF1889), d0
	subq.b #1, d0
	mulu.w #$26, d0
	lea (loc_00004B80), a1
	adda.w d0, a1
	move.w #$23, d0
loc_00004B68:
	move.b (a1)+, (a2)+
	move.b #$FF, (a2)+
	dbf d0, loc_00004B68
	movea.l $32(a0), a2
	move.w (a1)+, $26(a2)
	MOVEM.l	(A7)+, A2
	rts
loc_00004B80:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $90, $00, $00, $00, $00, $80, $90, $00, $00, $00 ;0x40
	dc.b	$00, $D0, $80, $90, $00, $00, $D0, $D0, $80, $90, $00, $00, $05, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $B0, $C0, $00, $00, $00 ;0x60
	dc.b	$00, $D0, $B0, $C0, $00, $00, $00, $D0, $B0, $C0, $00, $00, $00, $D0, $B0, $C0, $00, $00, $05, $04, $00, $00, $00, $C0, $00, $00, $00, $00, $00, $90, $00, $00 ;0x80
	dc.b	$00, $00, $80, $90, $00, $B0, $00, $00, $D0, $80, $00, $B0, $00, $D0, $80, $90, $00, $C0, $C0, $D0, $80, $90, $B0, $B0, $05, $00 ;0xA0