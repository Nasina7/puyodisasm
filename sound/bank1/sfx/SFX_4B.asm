	include "sound/z80_macros.asm"

;	SFX 4B
SFX4B_Header:
	dc.b	$01

SFX4B_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX4B_PLR07
	dc.b	panCentre
	dc.b	$00

SFX4B_PLR07:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$31, $E0
	dc.b	$93, $8E, $40

SFX4B_Loop00:
	dc.b	$55, $E0
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX4B_Loop00
	CSP_Stop