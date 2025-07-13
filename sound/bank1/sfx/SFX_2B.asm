	include "sound/z80_macros.asm"

;	SFX 2B
SFX2B_Header:
	dc.b	$01

SFX2B_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1F
	dc.b	$02
	dc.b	$00
	dc.b	$20
	dc.b	$00
	dc.b	$00
	ptrZ80	SFX2B_PLR06
	dc.b	panCentre
	dc.b	$00

SFX2B_PLR06:
	dc.b	$93, $8A, $FF

SFX2B_Loop00:
	dc.b	$2C, $DF
	dc.b	$33, $E1
	dc.b	$95			; Some conditional looping command
	ptrZ80	SFX2B_Loop00
	CSP_Stop