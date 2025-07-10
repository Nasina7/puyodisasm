	include "sound/z80_macros.asm"

;	SFX 3A
SFX3A_Header:
	dc.b	$01

SFX3A_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$06
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX3A_PLR08
	dc.b	panCentre
	dc.b	$2A

SFX3A_PLR08:
	dc.b	$0D, $E3
	dc.b	$93, $8F, $60

SFX3A_Loop00:
	dc.b	$19, $E7
	dc.b	$95
	ptrZ80	SFX3A_Loop00
	CSP_Stop