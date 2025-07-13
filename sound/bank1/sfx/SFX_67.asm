	include "sound/z80_macros.asm"

;	SFX 67
SFX67_Header:
	dc.b	$01

SFX67_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$12
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX67_PLR08
	dc.b	panCentre
	dc.b	$46

SFX67_PLR08:
	dc.b	$42, $E0
	CSP_Stop