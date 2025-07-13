	include "sound/z80_macros.asm"

;	SFX 56 - Puyo Popping 1
SFX56_Header:
	dc.b	$01

SFX56_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX56_PLR0A
	dc.b	panCentre
	dc.b	$05

SFX56_PLR0A:
	dc.b	$8A, $FB
	dc.b	$93
	dc.b	$87, $50
	dc.b	$8B, $19
	dc.b	$89, $F8

SFX56_Loop00:
	dc.b	$94, $83
	dc.b	$44, $E1
	dc.b	$4D
	dc.b	$95
	ptrZ80	SFX56_Loop00
	CSP_Stop