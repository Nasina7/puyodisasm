	include "sound/z80_macros.asm"

;	SFX 47
SFX47_Header:
	dc.b	$01

SFX47_PLR08_Init:
	dc.b	$08
	dc.b	$41
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX47_PLR08
	dc.b	panCentre
	dc.b	$28

SFX47_PLR08:
	dc.b	$99

	dc.b	$93, $90, $30
SFX47_Loop00:
	dc.b	$49, $E0
	dc.b	$55, $E3
	dc.b	$95
	ptrZ80	SFX47_Loop00
	CSP_Stop