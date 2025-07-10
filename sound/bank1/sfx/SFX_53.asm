	include "sound/z80_macros.asm"

;	SFX 53
SFX53_Header:
	dc.b	$01

SFX53_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX53_PLR07
	dc.b	panCentre
	dc.b	$00

SFX53_PLR07:
	dc.b	$8E, $07
	dc.b	$44, $E0
	dc.b	$68, $E1
	CSP_Stop