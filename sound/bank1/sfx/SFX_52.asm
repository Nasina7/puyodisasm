	include "sound/z80_macros.asm"

;	SFX 52
SFX52_Header:
	dc.b	$01

SFX52_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$01
	dc.b	$03
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX52_PLR08
	dc.b	panCentre
	dc.b	$0C

SFX52_PLR08
	CSP_LoopSet	$10, $03
SFX52_Loop00:
	dc.b	$A1
	dc.b	$4E, $DF
	dc.b	$42, $E3
	dc.b	$A2
	dc.b	$8A, $F9
	CSP_LoopBack	$10, SFX52_Loop00
	CSP_Stop