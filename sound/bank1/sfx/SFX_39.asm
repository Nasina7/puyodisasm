	include "sound/z80_macros.asm"

;	SFX 39
SFX39_Header:
	dc.b	$01

SFX39_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$06
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX39_PLR07
	dc.b	panRight
	dc.b	$2A

SFX39_PLR07:
	dc.b	$0D, $E3
	CSP_Stop