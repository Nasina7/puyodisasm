	include "sound/z80_macros.asm"

;	SFX 66
SFX66_Header:
	dc.b	$03

SFX66_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1E
	dc.b	$08
	dc.b	$14
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX66_PLR07
	dc.b	panCentre
	dc.b	$14

SFX66_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1E
	dc.b	$08
	dc.b	$14
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX66_PLR08
	dc.b	panCentre
	dc.b	$14

SFX66_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1E
	dc.b	$08
	dc.b	$14
	dc.b	$00
	dc.b	$00
	dc.b	$03
	ptrZ80	SFX66_PLR09
	dc.b	panCentre
	dc.b	$14

SFX66_PLR09:
	dc.b	$00, $E0
	dc.b	$97, $F9

SFX66_PLR08:
	dc.b	$97, $FC

SFX66_PLR07:
	dc.b	$3F, $E0
	dc.b	$88, $00
	dc.b	$46
	dc.b	$93, $9A, $D0
	dc.b	$4B, $E7
	CSP_Stop