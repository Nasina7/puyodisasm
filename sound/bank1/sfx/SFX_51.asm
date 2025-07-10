	include "sound/z80_macros.asm"

;	SFX 51
SFX51_Header:
	dc.b	$01

SFX51_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX51_PLR07
	dc.b	panCentre
	dc.b	$0B

SFX51_PLR07:
	dc.b	$4D, $DF
	dc.b	$40
	CSP_Stop