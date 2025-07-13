	include "sound/z80_macros.asm"

;	SFX 35
SFX35_Header:
	dc.b	$01

SFX35_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX35_PLR07
	dc.b	panCentre
	dc.b	$00

SFX35_PLR07:
	dc.b	$8E, $07
	dc.b	$31, $E0
	dc.b	$93, $90, $B0

SFX35_Loop00:
	dc.b	$55, $DF
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX35_Loop00
	CSP_Stop