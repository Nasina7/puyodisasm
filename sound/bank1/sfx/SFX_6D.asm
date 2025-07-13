	include "sound/z80_macros.asm"

;	SFX 6D
SFX6D_Header:
	dc.b	$01

SFX6D_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$13
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6D_PLR08
	dc.b	panRight
	dc.b	$19

SFX6D_PLR08:
	dc.b	$33, $E1
	dc.b	$3A
	dc.b	$3F, $EA
	CSP_Stop