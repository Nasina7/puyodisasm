	include "sound/z80_macros.asm"

;	SFX 60
SFX60_Header:
	dc.b	$01

SFX60_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$03
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX60_PLR07
	dc.b	panCentre
	dc.b	$0C

SFX60_PLR07:
	dc.b	$97, $F9
	dc.b	$93
	dc.b	$97, $FF
	dc.b	$3F, $DF
	dc.b	$4B
	dc.b	$5C, $E2
	CSP_Stop