	include "sound/z80_macros.asm"

;	SFX 72
SFX72_Header:
	dc.b	$02

SFX72_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$0F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$14
	dc.b	$04
	ptrZ80	SFX72_PLR08
	dc.b	panCentre
	dc.b	$46

SFX72_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$0F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$14
	dc.b	$03
	ptrZ80	SFX72_PLR09
	dc.b	panCentre
	dc.b	$46

SFX72_PLR09:
	dc.b	$00, $DF
	dc.b	$97, $FD

SFX72_PLR08:
	dc.b	$9E
	ptrZ80	SFX72_Jump00
	dc.b	$93, $1A, $10
	dc.b	$83, $16
	dc.b	$A1
	dc.b	$4D, CNL, $FF

SFX72_Jump00:
	CSP_Stop