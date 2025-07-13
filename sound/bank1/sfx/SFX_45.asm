	include "sound/z80_macros.asm"

;	SFX 45
SFX45_Header:
	dc.b	$01

SFX45_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$05
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX45_PLR09
	dc.b	panCentre
	dc.b	$29

SFX45_PLR09:
	dc.b	$99

	dc.b	$93, $95, $20
SFX45_Loop00:
	dc.b	$55, $DF
	dc.b	$56
	dc.b	$95
	ptrZ80	SFX45_Loop00
	CSP_Stop