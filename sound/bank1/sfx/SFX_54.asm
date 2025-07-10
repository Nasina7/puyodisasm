	include "sound/z80_macros.asm"

;	SFX 54
SFX54_Header:
	dc.b	$01

SFX54_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX54_PLR09
	dc.b	panCentre
	dc.b	$46

SFX54_PLR09:
	dc.b	$1E, $DF
	dc.b	$1B
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$8A, $02
	dc.b	$59, $E0

	dc.b	$93, $90, $40
SFX54_Loop00:
	dc.b	$55, $E3
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX54_Loop00
	CSP_Stop