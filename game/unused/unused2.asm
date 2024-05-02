; This code is similar to 4724, which gets called when placing a puyo
; Replacing the 4724 call doesn't seem to have any noticable effect...

	clr.w d0
	move.b $2B(a1), d0
	subq.b #8, d0
	lsr.b #2, d0
	cmpi.b #8, d0
	bcs.w loc_00004760
	move.b #7, d0
loc_00004760:
	neg.w d0
	addi.w #$11, d0
	move.w d0, $28(a0)
	rts