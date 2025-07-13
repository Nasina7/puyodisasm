	include "sound/z80_macros.asm"

;	SFX 4A
SFX4A_Header:
	dc.b	$01

SFX4A_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX4A_PLR08
	dc.b	panCentre
	dc.b	$37

SFX4A_PLR08:
	dc.b	$02, $E5
	CSP_Stop