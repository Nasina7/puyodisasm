	include "sound/z80_macros.asm"

;	SFX 2D
SFX2D_Header:
	dc.b	$01

SFX2D_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1F
	dc.b	$09
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX2D_PLR07
	dc.b	panCentre
	dc.b	$00

SFX2D_PLR07:
	dc.b	$8E, $07
	dc.b	$44, $E0
	dc.b	$5C, $E3
	CSP_Stop