	include "sound/z80_macros.asm"

;	SFX 46
SFX46_Header:
	dc.b	$01

SFX46_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$05
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX46_PLR08
	dc.b	panCentre
	dc.b	$29

SFX46_PLR08:
	dc.b	$99

	dc.b	$93, $95, $20
SFX46_Loop00:
	dc.b	$55, $DF
	dc.b	$56
	dc.b	$95
	ptrZ80	SFX46_Loop00
	CSP_Stop