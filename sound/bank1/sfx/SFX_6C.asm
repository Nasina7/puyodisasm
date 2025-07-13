	include "sound/z80_macros.asm"

;	SFX 6C
SFX6C_Header:
	dc.b	$01

SFX6C_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6C_PLR09
	dc.b	panCentre
	dc.b	$46

SFX6C_PLR09:
	dc.b	$94, $83
	dc.b	$2E, $E0
	dc.b	$31, $E3
	CSP_Stop