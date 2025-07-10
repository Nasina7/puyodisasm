	include "sound/z80_macros.asm"

;	SFX 23
SFX23_Header:
	dc.b	$01

SFX23_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX23_PLR07
	dc.b	panCentre
	dc.b	$30

SFX23_PLR07:
	dc.b	$99

SFX23_Jump00:
	dc.b	$59, $E9
	CSP_Jump	SFX23_Jump00
