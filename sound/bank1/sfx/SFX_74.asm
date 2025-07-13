	include "sound/z80_macros.asm"

;	SFX 74
SFX74_Header:
	dc.b	$02

SFX74_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$18
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX74_PLR07
	dc.b	panCentre
	dc.b	$46

SFX74_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$18
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX74_PLR08
	dc.b	panCentre
	dc.b	$46

SFX74_PLR08:
	dc.b	$00, $E2
	dc.b	$97, $F8

SFX74_PLR07:
	dc.b	$93, $87, $60
	dc.b	$94, $83
	dc.b	$2E, $E2
	dc.b	$94, $00
	dc.b	$33, $DE, $3C
	CSP_Stop