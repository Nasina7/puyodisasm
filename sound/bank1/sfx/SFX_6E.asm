	include "sound/z80_macros.asm"

;	SFX 6E
SFX6E_Header:
	dc.b	$01

SFX6E_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$13
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6D_PLR08
	dc.b	panLeft
	dc.b	$19