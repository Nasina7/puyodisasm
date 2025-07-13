	include "sound/z80_macros.asm"

;	SFX 50
SFX50_Header:
	dc.b	$01

SFX50_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$17
	dc.b	$00
	dc.b	$00
	dc.b	$F8
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX50_PLR07
	dc.b	panCentre
	dc.b	$46

SFX50_PLR07:
	dc.b	$A1
	dc.b	$50, $DF
	dc.b	$8A, $FB
	dc.b	$44
	CSP_Stop