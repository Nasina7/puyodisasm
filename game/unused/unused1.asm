; Note: Nothing in the disassembly references 00FF0138, so this will always return.
; Running this at what I believe is the correct location (the 8CC call in 880) causes VRAM corruption
	
	tst.b ($00FF0138).l
	bne.w loc_00000A2C
	rts
loc_00000A2C:
	clr.b ($00FF0138).l
	move.w #$100, (Z80BusReq)
loc_00000A3A:
	btst.b #0, (Z80BusReq)
loc_00000A42:
	bne.b loc_00000A3A
	lea (vdpControl1), a0
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	ori.b #$10, d0
	move.w d0, (a0)
	move.w #$9404, (a0)
	move.w #$9300, (a0)
	move.w #$96E8, (a0)
	move.w #$9500, (a0)
	move.w #$977F, (a0)
	move.w #$5000, (a0)
	move.w #$80, ($00FF1106)
	move.w ($00FF1106), (a0)
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	move.w d0, (a0)
	move.w #0, (Z80BusReq)
	lea ($00FFD000), a1
	lea ($00FF3000), a2
	move.w ($00FF0138), d0
	mulu.w #$800, d0
	adda.l d0, a2
	move.w #$3FF, d0
loc_00000AB0:
	move.w (a2)+, (a1)+
	dbf d0, loc_00000AB0
	move.w #$100, (Z80BusReq)
loc_00000ABE:
	btst.b #0, (Z80BusReq)
	bne.b loc_00000ABE
	lea (vdpControl1), a0
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	ori.b #$10, d0
	move.w d0, (a0)
	move.w #$9404, (a0)
	move.w #$9300, (a0)
	move.w #$96E8, (a0)
	move.w #$9500, (a0)
	move.w #$977F, (a0)
	move.w #$6000, (a0)
	move.w #$80, ($00FF1106)
	move.w ($00FF1106), (a0)
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	move.w d0, (a0)
	move.w #0, (Z80BusReq)
	lea ($00FFD000), a1
	lea ($00FF3000), a2
	move.w ($00FF0138), d0
	addq.b #8, d0
	andi.b #$F, d0
	mulu.w #$800, d0
	adda.l d0, a2
	move.w #$3FF, d0
loc_00000B3A:
	move.w (a2)+, (a1)+
	dbf d0, loc_00000B3A
	move.w #$100, (Z80BusReq)
loc_00000B48:
	btst.b #0, (Z80BusReq)
	bne.b loc_00000B48
	lea (vdpControl1), a0
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	ori.b #$10, d0
	move.w d0, (a0)
	move.w #$9404, (a0)
	move.w #$9300, (a0)
	move.w #$96E8, (a0)
	move.w #$9500, (a0)
	move.w #$977F, (a0)
	move.w #$6800, (a0)
	move.w #$80, ($00FF1106)
	move.w ($00FF1106), (a0)
	move.w #$8100, d0
	move.b ($00FF0A23), d0
	move.w d0, (a0)
	move.w #0, (Z80BusReq)
	rts