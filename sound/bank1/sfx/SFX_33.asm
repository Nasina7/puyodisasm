	include "sound/z80_macros.asm"

;	SFX 33
SFX33_Header:
	dc.b	$01

SFX33_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1D
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX33_PLR07
	dc.b	panCentre
	dc.b	$28

SFX33_PLR07:
	dc.b	$60, $E0
	CSP_Stop