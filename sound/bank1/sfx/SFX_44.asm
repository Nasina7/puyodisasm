	include "sound/z80_macros.asm"

;	SFX 44
SFX44_Header:
	dc.b	$01

SFX44_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$F4
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX44_PLR07
	dc.b	panCentre
	dc.b	$29

SFX44_PLR07:
	dc.b	$94, $86

	dc.b	$93, $90, $20
SFX44_Loop00:
	dc.b	$25, $E5
	dc.b	$95
	ptrZ80	SFX44_Loop00
	CSP_Stop