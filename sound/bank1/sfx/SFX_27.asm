	include "sound/z80_macros.asm"

;	SFX 27
SFX27_Header:
	dc.b	$01

SFX27_PLR07_Init:
	dc.b	$07
	dc.b	$42
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX27_PLR07
	dc.b	panCentre
	dc.b	$00

SFX27_PLR07:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$5E, $DF
	dc.b	$52
	dc.b	$46

	CSP_LoopSet	$10, $24
SFX27_Loop00:
	dc.b	$2E, $E0
	dc.b	$89, $01
	CSP_LoopBack	$10, SFX27_Loop00

	CSP_LoopSet	$10, $0A
SFX27_Loop01:
	dc.b	$2E, $E2
	dc.b	$89, $01
	CSP_LoopBack	$10, SFX27_Loop01

	dc.b	$93, $8E, $40
SFX27_Loop02:
	dc.b	$2E, $E4
	dc.b	$95
	ptrZ80	SFX27_Loop02
	CSP_Stop