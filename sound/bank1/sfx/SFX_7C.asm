	include "sound/z80_macros.asm"

;	SFX 7C
SFX7C_Header:
	dc.b	$02

SFX7C_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1D
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX7C_PLR0A
	dc.b	panCentre
	dc.b	$4C

SFX7C_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX7C_PLR0B
	dc.b	panCentre
	dc.b	$4C

SFX7C_PLR0B:
	dc.b	$00, $EA
	dc.b	$97, $FE

SFX7C_PLR0A:
	dc.b	$8A, $F7
	dc.b	$94, $04
	dc.b	$A1
	dc.b	$38, $E0
	dc.b	$8A, $05
	dc.b	$38, $DF
	dc.b	$8A, $04
	dc.b	$A2
	dc.b	$93, $87, $30
	dc.b	$94, $83
	dc.b	$8A, $FC
	dc.b	$30, $E4
	dc.b	$8A, $04
	dc.b	$36
	dc.b	$3D
	dc.b	$44
	dc.b	$49
	CSP_Stop