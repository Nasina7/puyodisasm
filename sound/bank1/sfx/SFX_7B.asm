	include "sound/z80_macros.asm"

;	SFX 7B
SFX7B_Header:
	dc.b	$02

SFX7B_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$17
	dc.b	$03
	dc.b	$00
	dc.b	$FA
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX7B_PLR0A
	dc.b	panCentre
	dc.b	$4D

SFX7B_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$13
	dc.b	$03
	dc.b	$00
	dc.b	$FA
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX7B_PLR0B
	dc.b	panCentre
	dc.b	$4D

SFX7B_PLR0B:
	dc.b	$00, $E4
	dc.b	$97, $FC

SFX7B_PLR0A:
	dc.b	$93, $1E, $FF
	dc.b	$49, $E1
	dc.b	$3D
	dc.b	$41
	dc.b	$44
	dc.b	$4B
	dc.b	$88, $09
	dc.b	$50, $EB
	CSP_Stop