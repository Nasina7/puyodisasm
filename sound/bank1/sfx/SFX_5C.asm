	include "sound/z80_macros.asm"

;	SFX 5C - Puyo Popping 7
SFX5C_Header:
	dc.b	$01

SFX5C_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$0B
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX56_PLR0A
	dc.b	panCentre
	dc.b	$05