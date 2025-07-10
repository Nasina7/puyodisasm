	include "sound/z80_macros.asm"

;	SFX 30
SFX30_Header:
	dc.b	$02

SFX30_PLR09_Init:
	dc.b	$09
	dc.b	$02
	dc.b	$1F
	dc.b	$09
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX30_PLR09
	dc.b	panCentre
	dc.b	$00

SFX30_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$F4
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX30_PLR0A
	dc.b	panCentre
	dc.b	$29

SFX30_PLR09:
	dc.b	$8E, $07
	dc.b	$3D, $E1
	dc.b	$49, $E7
	CSP_Stop

SFX30_PLR0A:
	dc.b	$99
	dc.b	$25, $DF
	dc.b	$1D
	dc.b	$14
	CSP_Stop