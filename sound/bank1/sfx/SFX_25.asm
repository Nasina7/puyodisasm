	include "sound/z80_macros.asm"

;	SFX 25
SFX25_Header:
	dc.b	$01

SFX25_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$15
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX25_PLR08
	dc.b	panCentre
	dc.b	$27

SFX25_PLR08:
	dc.b	$94, $02
	dc.b	$31, $E1
	dc.b	$94, $02
	dc.b	$49, $E7
	CSP_Stop