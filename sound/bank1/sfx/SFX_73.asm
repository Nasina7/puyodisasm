	include "sound/z80_macros.asm"

;	SFX 73
SFX73_Header:
	dc.b	$02

SFX73_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX73_PLR07
	dc.b	panCentre
	dc.b	$06

SFX73_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX73_PLR08
	dc.b	panCentre
	dc.b	$06

SFX73_PLR08:
	dc.b	$97, $FF

SFX73_PLR07:
	dc.b	$20, $E1
	dc.b	$23, $DF
	dc.b	$83, $17
	dc.b	$93, $87, $40
	dc.b	$26, $DE, $4B
	CSP_Stop