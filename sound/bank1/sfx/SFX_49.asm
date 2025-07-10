	include "sound/z80_macros.asm"

;	SFX 49
SFX49_Header:
	dc.b	$01

SFX49_PLR08_Init:
	dc.b	$08
	dc.b	$41
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$14
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX49_PLR08
	dc.b	panCentre
	dc.b	$2D

SFX49_PLR08:
	CSP_LoopSet	$10, $12
SFX49_Loop00:
	dc.b	$19, $DF
	dc.b	$25
	CSP_LoopBack	$10, SFX49_Loop00
	CSP_Stop