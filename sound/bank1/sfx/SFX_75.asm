	include "sound/z80_macros.asm"

;	SFX 75
SFX75_Header:
	dc.b	$01

SFX75_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1D
	dc.b	$00
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX75_PLR07
	dc.b	panCentre
	dc.b	$19

SFX75_PLR07:
	dc.b	$93, $8F, $70
	dc.b	$33, $ED
	CSP_Stop