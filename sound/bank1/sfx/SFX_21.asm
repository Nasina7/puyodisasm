	include "sound/z80_macros.asm"

;	SFX 21
SFX21_Header:
	dc.b	$01

SFX21_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX21_PLR06
	dc.b	panCentre
	dc.b	$29

SFX21_PLR06:
	dc.b	$94, $08
	dc.b	$49, $E5
	CSP_Stop