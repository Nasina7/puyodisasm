	include "sound/z80_macros.asm"

;	SFX 79
SFX79_Header:
	dc.b	$01

SFX79_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$15
	dc.b	$00
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX79_PLR0B
	dc.b	panCentre
	dc.b	$1C

SFX79_PLR0B
	dc.b	$A1
	dc.b	$93, $1C, $FF
	dc.b	$84, $7F
	dc.b	$3C, $DF
	dc.b	$48, $E7
	dc.b	$93, $0D, $FF
	dc.b	$84, $00
	dc.b	$97, $FC
	dc.b	$8A, $F1
	dc.b	$48
	CSP_Stop