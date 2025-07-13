	include "sound/z80_macros.asm"

;	SFX 7D
SFX7D_Header:
	dc.b	$01

SFX7D_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1D
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX7D_PLR0A
	dc.b	panCentre
	dc.b	$44

SFX7D_PLR0A:
	dc.b	$A1
	dc.b	$54, $DF
	dc.b	$8A, $01
	dc.b	$43
	dc.b	$8A, $FC
	dc.b	$43
	dc.b	$8A, $FC
	dc.b	$43
	dc.b	$8A, $FC
	dc.b	$43
	CSP_Stop