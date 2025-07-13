	include "sound/z80_macros.asm"

;	SFX 2A
SFX2A_Header:
	dc.b	$01

SFX2A_PLR07_Init:
	dc.b	$07
	dc.b	$41
	dc.b	$19
	dc.b	$00
	dc.b	$0A
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX2A_PLR07
	dc.b	panCentre
	dc.b	$35

SFX2A_PLR07:
	dc.b	$0D, $ED
	CSP_Stop