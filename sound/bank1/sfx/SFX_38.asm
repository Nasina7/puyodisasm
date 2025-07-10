	include "sound/z80_macros.asm"

;	SFX 38
SFX38_Header:
	dc.b	$01

SFX38_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$06
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX38_PLR07
	dc.b	panCentre
	dc.b	$32

SFX38_PLR07:
	dc.b	$32, $DF
	dc.b	$99

	CSP_LoopSet	$10, $06
SFX38_Loop00:
	dc.b	$34, $DF
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX38_Loop00

	CSP_LoopSet	$10, $18
SFX38_Loop01:
	dc.b	$34
	dc.b	$89, $FE
	CSP_LoopBack	$10, SFX38_Loop01
	CSP_Stop