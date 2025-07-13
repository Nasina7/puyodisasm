	include "sound/z80_macros.asm"

;	SFX 32
SFX32_Header:
	dc.b	$03

SFX32_PLR09_Init:
	dc.b	$09
	dc.b	$41
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX32_PLR09
	dc.b	panCentre
	dc.b	$33

SFX32_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$17
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX32_PLR0A
	dc.b	panCentre
	dc.b	$29

SFX32_PLR0B_Init:
	dc.b	$0B
	dc.b	$42
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX32_PLR0B
	dc.b	panCentre
	dc.b	$00

SFX32_PLR09:
	dc.b	$00, $E1
	dc.b	$99
	dc.b	$05, $DE
	dc.b	$60
	dc.b	$05

	dc.b	$93, $8F, $40
SFX32_Loop00:
	dc.b	$02, $DF
	dc.b	$06
	dc.b	$04
	dc.b	$95
	ptrZ80	SFX32_Loop00
	CSP_Stop

SFX32_PLR0A:
	dc.b	$00, $E1

	dc.b	$93, $1D, $15
SFX32_Loop01:
	dc.b	$94, $81
	dc.b	$08, $E3
	dc.b	$89, $02
	dc.b	$95
	ptrZ80	SFX32_Loop01

	dc.b	$93, $8F, $20
SFX32_Loop02:
	dc.b	$94, $01
	dc.b	$19, $E1
	dc.b	$0D
	dc.b	$14
	dc.b	$0A
	dc.b	$16
	dc.b	$95
	ptrZ80	SFX32_Loop02
	CSP_Stop

SFX32_PLR0B:
	dc.b	$8E, $07

	dc.b	$93, $92, $0A
SFX32_Loop03:
	dc.b	$5C, $DF
	dc.b	$4D
	dc.b	$49
	dc.b	$4D
	dc.b	$52
	dc.b	$4B
	dc.b	$54
	dc.b	$4B
	dc.b	$54
	dc.b	$95
	ptrZ80	SFX32_Loop03
	CSP_Stop