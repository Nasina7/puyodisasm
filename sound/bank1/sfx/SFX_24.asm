	include "sound/z80_macros.asm"

;	SFX 24
SFX24_Header:
	dc.b	$02

SFX24_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX24_PLR07
	dc.b	panCentre
	dc.b	$31

SFX24_PLR06_Init:
	dc.b	$06
	dc.b	$02
	dc.b	$1B
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX24_PLR06
	dc.b	panCentre
	dc.b	$00

SFX24_PLR07:
	dc.b	$99
	dc.b	$4E, $DF
	dc.b	$19
	dc.b	$3E
	dc.b	$10
	dc.b	$99
	CSP_Stop

SFX24_PLR06:
	dc.b	$8E, $07
	dc.b	$3A, $DF
	dc.b	$2E
	dc.b	$22
	dc.b	$3A
	dc.b	$2E
	dc.b	$22
	dc.b	$93, $8C, $92

SFX24_Loop00:
	dc.b	$5D, $DF
	dc.b	$89, $FB
	dc.b	$95
	ptrZ80	SFX24_Loop00
	CSP_Stop