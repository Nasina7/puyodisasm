	include "sound/z80_macros.asm"

;	SFX 41
SFX41_Header:
	dc.b	$01

SFX41_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1C
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	ptrZ80	SFX41_PLR06
	dc.b	panCentre
	dc.b	$00

SFX41_PLR06:
	dc.b	$31, $E1
	CSP_Stop