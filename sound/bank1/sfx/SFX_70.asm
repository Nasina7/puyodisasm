	include "sound/z80_macros.asm"

;	SFX 70
SFX70_Header:
	dc.b	$01

SFX70_PLR08_Init:
	dc.b	$08
	dc.b	$41
	dc.b	$1D
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6F_PLR08
	dc.b	panLeft
	dc.b	$2B