	include "sound/z80_macros.asm"

;	SFX 29
SFX29_Header:
	dc.b	$02

SFX29_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX29_PLR06
	dc.b	panCentre
	dc.b	$2B

SFX29_PLR07_Init:
	dc.b	$07
	dc.b	$02
	dc.b	$1C
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX29_PLR07
	dc.b	panCentre
	dc.b	$00

SFX29_PLR06:
	dc.b	$99
	dc.b	$19, $DF
	dc.b	$04
	dc.b	$10
	dc.b	$19
	dc.b	$05
	dc.b	$99
	dc.b	$8B, $28
	dc.b	$99
	dc.b	$61, $DF

	dc.b	$93, $8F, $30
SFX29_Loop00:
	dc.b	$6A, $DF
	dc.b	$61
	dc.b	$95
	ptrZ80	SFX29_Loop00
	CSP_Stop

SFX29_PLR07:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$5D, $DF
	dc.b	$50
	dc.b	$57
	dc.b	$5A

	dc.b	$93, $8C, $60
SFX29_Loop01:
	dc.b	$5D, $EB
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX29_Loop01
	CSP_Stop