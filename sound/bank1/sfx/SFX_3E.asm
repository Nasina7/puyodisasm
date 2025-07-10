	include "sound/z80_macros.asm"

;	SFX 3E
SFX3E_Header:
	dc.b	$02

SFX3E_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX3E_PLR0A
	dc.b	panRight
	dc.b	$2E

SFX3E_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX3E_PLR0B
	dc.b	panLeft
	dc.b	$2E

SFX3E_PLR0B:
	dc.b	$00, $E2

SFX3E_PLR0A:
	dc.b	$99
	dc.b	$94, $03
	dc.b	$25, $E3
	dc.b	$2C
	dc.b	$93, $95, $30
	dc.b	$99
	dc.b	$99

SFX3E_Loop00:
	dc.b	$0F, $E1
	dc.b	$14
	dc.b	$18
	dc.b	$95
	ptrZ80	SFX3E_Loop00
	CSP_Stop