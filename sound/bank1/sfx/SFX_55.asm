	include "sound/z80_macros.asm"

;	SFX 55
SFX55_Header:
	dc.b	$01

SFX55_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX55_PLR08
	dc.b	panCentre
	dc.b	$46

SFX55_PLR08:
	dc.b	$A1
	dc.b	$93, $90, $FF
	dc.b	$23, $DF
	dc.b	$20
	dc.b	$94, $84
	dc.b	$20, $E4
	CSP_Stop