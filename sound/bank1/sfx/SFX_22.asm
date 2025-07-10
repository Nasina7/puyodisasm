	include "sound/z80_macros.asm"

;	SFX 22
SFX22_Header:
	dc.b	$01

SFX22_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX22_PLR07
	dc.b	panCentre
	dc.b	$34

SFX22_PLR07:
	dc.b	$99
	dc.b	$09, $DF
	dc.b	$19
	dc.b	$29
	dc.b	$39

SFX22_Jump00:
	dc.b	$59, $E9
	CSP_Jump	SFX22_Jump00