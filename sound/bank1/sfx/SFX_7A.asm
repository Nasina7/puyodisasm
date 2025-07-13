	include "sound/z80_macros.asm"

;	SFX 7A
SFX7A_Header:
	dc.b	$01

SFX7A_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX7A_PLR0B
	dc.b	panCentre
	dc.b	$46

SFX7A_PLR0B:
	dc.b	$A1
	dc.b	$27, $DF
	dc.b	$33
	dc.b	$A2
	dc.b	$94, $86

	dc.b	$93, $8F, $60
SFX7A_Loop00:
	dc.b	$2C, $E5
	dc.b	$95
	ptrZ80	SFX7A_Loop00
	CSP_Stop