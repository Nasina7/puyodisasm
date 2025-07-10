	include "sound/z80_macros.asm"

;	SFX 3D
SFX3D_Header:
	dc.b	$03

SFX3D_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX3D_PLR08
	dc.b	panRight
	dc.b	$2C

SFX3D_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$01
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX3D_PLR09
	dc.b	panLeft
	dc.b	$2C

SFX3D_PLR0A_Init:
	dc.b	$0A
	dc.b	$02
	dc.b	$14
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX3D_PLR0A
	dc.b	panCentre
	dc.b	$00

SFX3D_PLR08:
	dc.b	$00, $E2

SFX3D_PLR09:
	dc.b	$99
	dc.b	$93, $93, $20

SFX3D_Loop00:
	dc.b	$03, $DF
	dc.b	$08
	dc.b	$0C
	dc.b	$95
	ptrZ80	SFX3D_Loop00
	dc.b	$99
	CSP_Stop

SFX3D_PLR0A:
	dc.b	$8E, $04
	dc.b	$93, $16, $60

SFX3D_Loop01:
	dc.b	$25, $DF
	dc.b	$95
	ptrZ80	SFX3D_Loop01
	dc.b	$93, $8C, $20

SFX3D_Loop02:
	dc.b	$25
	dc.b	$95
	ptrZ80	SFX3D_Loop02
	CSP_Stop