	include "sound/z80_macros.asm"

;	SFX 37
SFX37_Header:
	dc.b	$01

SFX37_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX37_PLR07
	dc.b	panCentre
	dc.b	$00

SFX37_PLR07:
	dc.b	$8E, $07
	dc.b	$44, $DF
	dc.b	$38

	CSP_LoopSet	$10, $0C
SFX37_Loop00:
	dc.b	$2E, $DF
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX37_Loop00

	dc.b	$93, $8E, $C0
SFX37_Loop01:
	dc.b	$2E
	dc.b	$95
	ptrZ80	SFX37_Loop01
	CSP_Stop