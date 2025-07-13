	include "sound/z80_macros.asm"

;	SFX 43
SFX43_Header:
	dc.b	$01

SFX43_PLR08_Init:
	dc.b	$08
	dc.b	$41
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$F4
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX43_PLR08
	dc.b	panCentre
	dc.b	$29

SFX43_PLR08:
	dc.b	$99

	CSP_LoopSet	$10, $14
SFX43_Loop00:
	dc.b	$3D, $DF
	dc.b	$41
	dc.b	$89, $01
	CSP_LoopBack	$10, SFX43_Loop00
	CSP_Stop