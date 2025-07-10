	include "sound/z80_macros.asm"

;	SFX 69
SFX69_Header:
	dc.b	$01

SFX69_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX69_PLR08
	dc.b	panCentre
	dc.b	$46

SFX69_PLR08:
	dc.b	$1D, $DF
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$55, $E0
	dc.b	$8A, $FB
	dc.b	$3D
	dc.b	$8A, $FB
	dc.b	$31
	CSP_Stop