	include "sound/z80_macros.asm"

;	SFX 5E
SFX5E_Header:
	dc.b	$01

SFX5E_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$14
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX5E_PLR07
	dc.b	panCentre
	dc.b	$27

SFX5E_PLR07:
	dc.b	$94, $02
	dc.b	$55, $E1
	dc.b	$94, $82
	dc.b	$8A, $FB
	dc.b	$31
	CSP_Stop