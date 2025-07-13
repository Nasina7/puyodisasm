	include "sound/z80_macros.asm"

;	SFX 2C
SFX2C_Header:
	dc.b	$03

SFX2C_PLR09_Init:
	dc.b	$09
	dc.b	$42
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX2C_PLR09
	dc.b	panCentre
	dc.b	$00

SFX2C_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX2C_PLR0A
	dc.b	panCentre
	dc.b	$2B

SFX2C_PLR0B_Init:
	dc.b	$0B
	dc.b	$41
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$F4
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX2E_PLR08
	dc.b	panCentre
	dc.b	$29

SFX2C_PLR0A:
	dc.b	$94, $85
	dc.b	$0D, $E3
	dc.b	$93
	dc.b	$8F, $50

SFX2C_Loop00:
	dc.b	$25, $E5
	dc.b	$95
	ptrZ80	SFX2C_Loop00
	CSP_Stop

SFX2C_PLR09:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$55, $DF
	dc.b	$49
	dc.b	$3D
	dc.b	$31
	CSP_LoopSet	$10, $14

SFX2C_Loop01:
	dc.b	$5C, $E0
	dc.b	$89, $FF
	CSP_LoopBack	$10, SFX2C_Loop01
	CSP_Stop