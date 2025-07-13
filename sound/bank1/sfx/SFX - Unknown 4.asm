	include "sound/z80_macros.asm"

;	SFX_CE79 - Unreferenced Sound Data
SFX_CE79_Header:
	dc.b	$01

SFX_CE79_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$F6
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX_CE79_PLR06
	dc.b	panCentre
	dc.b	$2B

SFX_CE79_PLR06:
	dc.b	$55, $DF
	CSP_Stop