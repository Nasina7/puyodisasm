	include "sound/z80_macros.asm"

;	SFX_CE05 - Unreferenced Sound Data
SFX_CE05_Header:
	dc.b	$03

SFX_CE05_PLR06_Init:
	dc.b	$06
	dc.b	$02
	dc.b	$0A
	dc.b	$1A
	dc.b	$00
	dc.b	$F4
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX_CE05_PLR06
	dc.b	panCentre
	dc.b	$00

SFX_CE05_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$05
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX_CE05_PLR07
	dc.b	panLeft
	dc.b	$3A

SFX_CE05_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$05
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX_CE05_PLR08
	dc.b	panRight
	dc.b	$3A

SFX_CE05_PLR08:
	dc.b	$00, $E1

SFX_CE05_PLR07:
	dc.b	$99
	dc.b	$93, $1A, $40

SFX_CE05_Loop00:
	dc.b	$02, $E1
	dc.b	$95
	ptrZ80	SFX_CE05_Loop00
	CSP_Stop

SFX_CE05_PLR06:
	dc.b	$8E, $07
	dc.b	$93, $1F, $40

SFX_CE05_Loop01:
	dc.b	$3D, $E2
	dc.b	$89, $02
	dc.b	$95
	ptrZ80	SFX_CE05_Loop01
	dc.b	$93, $8A, $FF

SFX_CE05_Loop02:
	dc.b	$3D, $E2
	dc.b	$95
	ptrZ80	SFX_CE05_Loop02
	CSP_Stop

; There's a second Stop command here for some reason?
	CSP_Stop