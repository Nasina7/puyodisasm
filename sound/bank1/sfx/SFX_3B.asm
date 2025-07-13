	include "sound/z80_macros.asm"

;	SFX 3B
SFX3B_Header:
	dc.b	$03

SFX3B_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$06
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX3B_PLR08
	dc.b	panCentre
	dc.b	$2D

SFX3B_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX3B_PLR09
	dc.b	panCentre
	dc.b	$2D

SFX3B_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$10
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	ptrZ80	SFX3B_PLR07
	dc.b	panCentre
	dc.b	$00

SFX3B_PLR07:
	dc.b	$8E, $06
	dc.b	$93, $18, $20

SFX3B_Loop00:
	dc.b	$25, $DF
	dc.b	$95
	ptrZ80	SFX3B_Loop00

SFX3B_Jump00:
	dc.b	$25
	CSP_Jump	SFX3B_Jump00

SFX3B_PLR08:
	dc.b	$00, $E2

SFX3B_PLR09:
	dc.b	$02, $DF
	dc.b	$99

SFX3B_Jump01:
	dc.b	$02, $E9
	CSP_Jump	SFX3B_Jump01