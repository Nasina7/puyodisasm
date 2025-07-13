	include "sound/z80_macros.asm"

;	SFX 34
SFX34_Header:
	dc.b	$02

SFX34_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1F
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX34_PLR07
	dc.b	panCentre
	dc.b	$00

SFX34_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$E0
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX34_PLR08
	dc.b	panCentre
	dc.b	$2B

SFX34_PLR07:
	dc.b	$8E, $07

SFX34_PLR08:
	dc.b	$55, $DF
	dc.b	$3D
	dc.b	$31
	dc.b	$25
	dc.b	$31
	dc.b	$3D
	dc.b	$49
	dc.b	$55
	CSP_Stop