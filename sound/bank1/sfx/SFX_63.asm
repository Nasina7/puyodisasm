	include "sound/z80_macros.asm"

;	SFX 63
SFX63_Header:
	dc.b	$01

SFX63_PLR08_Init:
	dc.b	$08
	dc.b	$02
	dc.b	$12
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX63_PLR08
	dc.b	panCentre
	dc.b	$00

SFX63_PLR08:
	dc.b	$8E, $07
	dc.b	$3D, $E9
	CSP_Stop