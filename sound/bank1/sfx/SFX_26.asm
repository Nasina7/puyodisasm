	include "sound/z80_macros.asm"

;	SFX 26
SFX26_Header:
	dc.b	$03

SFX26_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX26_PLR06
	dc.b	panCentre
	dc.b	$2F

SFX26_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$19
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$01
	ptrZ80	SFX26_PLR07
	dc.b	panCentre
	dc.b	$00

SFX26_PLR08_Init:
	dc.b	$08
	dc.b	$02
	dc.b	$1E
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX26_PLR08
	dc.b	panCentre
	dc.b	$00

SFX26_PLR06:
	dc.b	$93, $8F, $FF
	dc.b	$5E, $EA
	CSP_Stop

SFX26_PLR07:
	dc.b	$93, $88, $80

SFX26_Loop00:
	dc.b	$50, $E1
	dc.b	$89, $01
	dc.b	$95
	ptrZ80	SFX26_Loop00
	CSP_Stop

SFX26_PLR08:
	dc.b	$8E, $07
	dc.b	$93, $88, $80

SFX26_Loop01:
	dc.b	$5C, $DF
	dc.b	$89, $01
	dc.b	$95
	ptrZ80	SFX26_Loop01
	CSP_Stop