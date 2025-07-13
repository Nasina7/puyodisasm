	include "sound/z80_macros.asm"

;	SFX 2F
SFX2F_Header:
	dc.b	$03

SFX2F_PLR09_Init:
	dc.b	$09
	dc.b	$42
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX2F_PLR09
	dc.b	panCentre
	dc.b	$00

SFX2F_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX2F_PLR0A
	dc.b	panCentre
	dc.b	$2F

SFX2F_PLR0B_Init:
	dc.b	$0B
	dc.b	$41
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX2F_PLR0B
	dc.b	panCentre
	dc.b	$2D

SFX2F_PLR0B:
	dc.b	$99
	dc.b	$93, $8F, $0A

SFX2F_Loop00:
	dc.b	$02
	dc.b	$E9
	dc.b	$95
	ptrZ80	SFX2F_Loop00
	CSP_Stop

SFX2F_PLR0A:
	dc.b	$99
	dc.b	$31
	dc.b	$DF
	dc.b	$25
	dc.b	$19
	dc.b	$0D
	dc.b	$93, $8F, $0B

SFX2F_Loop01:
	dc.b	$94
	dc.b	$06
	dc.b	$25
	dc.b	$E1
	dc.b	$2C
	dc.b	$20
	dc.b	$95
	ptrZ80	SFX2F_Loop01
	CSP_Stop

SFX2F_PLR09:
	dc.b	$8E
	dc.b	$07
	dc.b	$99

	CSP_LoopSet	$11, $08
SFX2F_Loop02:
	dc.b	$5E
	dc.b	$DF
	dc.b	$52
	dc.b	$46

	CSP_LoopSet	$10, $06
SFX2F_Loop03:
	dc.b	$2E
	dc.b	$DF
	dc.b	$89
	dc.b	$08
	CSP_LoopBack	$10, SFX2F_Loop03
	dc.b	$89
	dc.b	$D0
	CSP_LoopBack	$11, SFX2F_Loop02

	CSP_LoopSet	$10, $30
SFX2F_Loop04:
	dc.b	$5E
	dc.b	$E1
	dc.b	$89
	dc.b	$FF
	CSP_LoopBack	$10, SFX2F_Loop04
	CSP_Stop