	include "sound/z80_macros.asm"

;	SFX 4C
SFX4C_Header:
	dc.b	$01

SFX4C_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$19
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX4C_PLR07
	dc.b	panRight
	dc.b	$28

SFX4C_PLR07:
	dc.b	$55, $DF
	dc.b	$9F, $80
	dc.b	$5E, $E0
	CSP_Stop