	include "sound/z80_macros.asm"

;	SFX 4D
SFX4D_Header:
	dc.b	$01

SFX4D_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX4D_PLR08
	dc.b	panCentre
	dc.b	$38

SFX4D_PLR08:
	dc.b	$56, $DF
	dc.b	$99
	CSP_LoopSet	$10, $04

SFX4D_Loop00:
	dc.b	$1B, $DF
	dc.b	$1A
	CSP_LoopBack	$10, SFX4D_Loop00
	CSP_Stop