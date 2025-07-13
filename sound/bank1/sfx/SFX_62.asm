	include "sound/z80_macros.asm"

;	SFX 62
SFX62_Header:
	dc.b	$01

SFX62_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX62_PLR07
	dc.b	panCentre
	dc.b	$00

SFX62_PLR07:
	dc.b	$8E, $07
	dc.b	$33, $DF
	dc.b	$6A
	dc.b	$62
	CSP_Stop