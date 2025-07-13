	include "sound/z80_macros.asm"

;	SFX_CE4C - Unreferenced Sound Data
SFX_CE4C_Header:
	dc.b	$03

SFX_CE4C_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$00
	dc.b	$03
	ptrZ80	SFX_CE4C_PLR06
	dc.b	panCentre
	dc.b	$3C

SFX_CE4C_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX_CE4C_PLR07
	dc.b	panLeft
	dc.b	$3C

SFX_CE4C_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX_CE4C_PLR08
	dc.b	panRight
	dc.b	$3C

SFX_CE4C_PLR08:
	dc.b	$00, $DF

SFX_CE4C_PLR07:
	dc.b	$00, $DF

SFX_CE4C_PLR06:
	dc.b	$30, $DE
	dc.b	$60
	CSP_Stop
