	include "sound/z80_macros.asm"

;	SFX 28
SFX28_Header:
	dc.b	$01

SFX28_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	$C877
	dc.b	panCentre
	dc.b	$2E

SFX28_PLR08:
	dc.b	$99

	CSP_LoopSet	$10, $0C
SFX28_Loop00:
	dc.b	$94, $82
	dc.b	$31, $E0
	dc.b	$38
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX28_Loop00
	CSP_Stop