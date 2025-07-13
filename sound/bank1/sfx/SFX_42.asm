	include "sound/z80_macros.asm"

;	SFX 42
SFX42_Header:
	dc.b	$01

SFX42_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX42_PLR06
	dc.b	panCentre
	dc.b	$2B

SFX42_PLR06:
	dc.b	$55, $DF
	CSP_Stop