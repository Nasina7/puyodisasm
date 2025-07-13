	include "sound/z80_macros.asm"

;	SFX 78
SFX78_Header:
	dc.b	$02

SFX78_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$14
	dc.b	$01
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX78_PLR0A
	dc.b	panCentre
	dc.b	$4D

SFX78_PLR0B_Init:
	dc.b	$0B
	dc.b	$41
	dc.b	$14
	dc.b	$01
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX78_PLR0B
	dc.b	panCentre
	dc.b	$4D

SFX78_PLR0B:
	dc.b	$00, $E0
	dc.b	$97, $FF

SFX78_PLR0A:
	dc.b	$47, $E2
	dc.b	$8A, $05
	dc.b	$47
	dc.b	$8A, $05
	dc.b	$47, $ED
	CSP_Stop