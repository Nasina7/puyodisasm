	include "sound/z80_macros.asm"

;	SFX 36
SFX36_Header:
	dc.b	$01

SFX36_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$10
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX36_PLR07
	dc.b	panCentre
	dc.b	$29

SFX36_PLR07:
	dc.b	$99

	dc.b	$93, $8F, $70
SFX36_Loop00:
	dc.b	$49, $DF
	dc.b	$4A
	dc.b	$95
	ptrZ80	SFX36_Loop00
	CSP_Stop