	include "sound/z80_macros.asm"

;	SFX 2E
SFX2E_Header:
	dc.b	$02

SFX2E_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$F6
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX2E_PLR08
	dc.b	panCentre
	dc.b	$29

SFX2E_PLR09_Init:
	dc.b	$09
	dc.b	$02
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX2E_PLR09
	dc.b	panCentre
	dc.b	$00

SFX2E_PLR08:
	dc.b	$99		; What in the hell?
	dc.b	$93, $92, $70

SFX2E_Loop00:
	dc.b	$41, $DF
	dc.b	$38
	dc.b	$31
	dc.b	$2C
	dc.b	$29
	dc.b	$25
	dc.b	$1D
	dc.b	$14
	dc.b	$0D
	dc.b	$95
	ptrZ80	SFX2E_Loop00
	CSP_Stop

SFX2E_PLR09:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$93, $8E, $50

SFX2E_Loop01:
	dc.b	$5C, $E1
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX2E_Loop01
	CSP_Stop