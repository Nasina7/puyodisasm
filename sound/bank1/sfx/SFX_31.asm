	include "sound/z80_macros.asm"

;	SFX 31
SFX31_Header:
	dc.b	$01

SFX31_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX31_PLR08
	dc.b	panCentre
	dc.b	$2B

SFX31_PLR08:
	dc.b	$99
	dc.b	$31, $DF
	dc.b	$25
	dc.b	$19
	dc.b	$0D
	dc.b	$93, $90, $60

SFX31_Loop00:
	dc.b	$94, $06
	dc.b	$25, $E1
	dc.b	$2C
	dc.b	$20
	dc.b	$95
	ptrZ80	SFX31_Loop00
	CSP_Stop