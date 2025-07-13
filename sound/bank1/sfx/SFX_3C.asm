	include "sound/z80_macros.asm"

;	SFX 3C
SFX3C_Header:
	dc.b	$01

SFX3C_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX3C_PLR07
	dc.b	panCentre
	dc.b	$2D

SFX3C_PLR07:
	dc.b	$00, $DF
	CSP_Stop