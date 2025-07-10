	include "sound/z80_macros.asm"

;	SFX 5D
SFX5D_Header:
	dc.b	$01

SFX5D_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX5D_PLR0A
	dc.b	panCentre
	dc.b	$0C

SFX5D_PLR0A:
	dc.b	$8B, $08

	CSP_LoopSet	$10, $0C
SFX5D_Loop00:
	dc.b	$94, $82
	dc.b	$3D, $E1
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX5D_Loop00
	CSP_Stop