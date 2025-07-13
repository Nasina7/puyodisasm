	include "sound/z80_macros.asm"

;	SFX 71
SFX71_Header:
	dc.b	$01

SFX71_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$0F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX71_PLR07
	dc.b	panCentre
	dc.b	$46

SFX71_PLR07:
	dc.b	$93, $1E, $D0
SFX71_Loop00:
	dc.b	$29, $DF
	dc.b	$22
	dc.b	$2A
	dc.b	$27
	dc.b	$20
	dc.b	$24
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX71_Loop00
	CSP_Stop