	include "sound/z80_macros.asm"

;	SFX 65
SFX65_Header:
	dc.b	$02

SFX65_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX65_PLR09
	dc.b	panCentre
	dc.b	$3C

SFX65_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX65_PLR0A
	dc.b	panCentre
	dc.b	$46

SFX65_PLR09:
	dc.b	$5F, $DF
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$60, $E0
	dc.b	$3A, $DF
	dc.b	$90, $01
	dc.b	$8B, $3C
	dc.b	$54, $E0
	dc.b	$65, $DF
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$89, $F4

	dc.b	$93, $8F, $40
SFX65_Loop00:
	dc.b	$60, $E0
	dc.b	$5F
	dc.b	$5D
	dc.b	$59
	dc.b	$89, $FC
	dc.b	$95
	ptrZ80	SFX65_Loop00
	CSP_Stop

SFX65_PLR0A:
	dc.b	$A1
	dc.b	$29, $DF
	dc.b	$27
	dc.b	$22
	dc.b	$1D
	dc.b	$16
	dc.b	$8A, $FA
	dc.b	$88, $22
	dc.b	$89, $06

	CSP_LoopSet	$10, $04
SFX65_Loop01:
	dc.b	$1D
	dc.b	$00
	dc.b	$16
	dc.b	$27
	dc.b	$1E
	dc.b	$12
	dc.b	$89, $FE
	CSP_LoopBack	$10, SFX65_Loop01
	CSP_Stop