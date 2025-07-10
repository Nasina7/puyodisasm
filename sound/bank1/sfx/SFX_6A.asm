	include "sound/z80_macros.asm"

;	SFX 6A
SFX6A_Header:
	dc.b	$02

SFX6A_PLR08_Init:
	dc.b	$08
	dc.b	$02
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX6A_PLR08
	dc.b	panCentre
	dc.b	$00

SFX6A_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6A_PLR09
	dc.b	panCentre
	dc.b	$3D

SFX6A_PLR08
	dc.b	$8E, $07
	dc.b	$25, $DF
	dc.b	$49
	dc.b	$25
	dc.b	$49
	dc.b	$25
	dc.b	$90, $01

SFX6A_Jump00:
	dc.b	$8B, $49
	dc.b	$83, $12
	dc.b	$93, $8F, $A0
	dc.b	$4D, $EB
	CSP_Stop

SFX6A_PLR09:
	dc.b	$3A, $DF
	dc.b	$00
	dc.b	$2E
	dc.b	$00
	dc.b	$22
	dc.b	$97, $FB
	CSP_Jump	SFX6A_Jump00