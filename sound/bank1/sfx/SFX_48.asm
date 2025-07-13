	include "sound/z80_macros.asm"

;	SFX 48	- All Clear SFX (in Puyo Puyo Tsuu at least)
SFX48_Header:
	dc.b	$02

SFX48_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$0E
	dc.b	$B4
	dc.b	$05
	ptrZ80	SFX48_PLR0A
	dc.b	panCentre
	dc.b	$07

SFX48_PLR0B_Init:
	dc.b	$0B
	dc.b	$41
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$0E
	dc.b	$B4
	dc.b	$04
	ptrZ80	SFX48_PLR0B
	dc.b	panCentre
	dc.b	$07

SFX48_PLR0A:
	dc.b	$38, $E2
	dc.b	$33
	dc.b	$38
	dc.b	$3C
	dc.b	$3A
	dc.b	$36
	dc.b	$3A
	dc.b	$41
	dc.b	$3F
	CSP_Pan	panRight
	dc.b	$8A, $FE
	dc.b	$33
	dc.b	$38
	dc.b	$3C
	dc.b	$3F
	CSP_Pan	panLeft
	dc.b	$8A, $FE
	dc.b	$33
	dc.b	$38
	dc.b	$3C
	dc.b	$3F
	CSP_Stop

SFX48_PLR0B:
	dc.b	$99
	dc.b	$33, $E2
	dc.b	$30
	dc.b	$33
	dc.b	$38
	dc.b	$36
	dc.b	$31
	dc.b	$36
	dc.b	$3C
	dc.b	$38
	CSP_Pan	panRight
	dc.b	$8A, $FE
	dc.b	$30
	dc.b	$33
	dc.b	$38
	dc.b	$3C
	CSP_Pan	panLeft
	dc.b	$8A, $FE
	dc.b	$30
	dc.b	$33
	dc.b	$38
	dc.b	$3C
	dc.b	$99
	CSP_Stop