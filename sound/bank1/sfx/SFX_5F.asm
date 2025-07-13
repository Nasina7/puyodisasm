	include "sound/z80_macros.asm"

;	SFX 5F
SFX5F_Header:
	dc.b	$02

SFX5F_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$FE
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX5F_PLR0A
	dc.b	panCentre
	dc.b	$46

SFX5F_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$FE
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX5F_PLR0B
	dc.b	panCentre
	dc.b	$46

SFX5F_PLR0B
	dc.b	$00, $E5
	dc.b	$97, $FE

SFX5F_PLR0A:
	dc.b	$A1, $93
	dc.b	$8F, $40
	dc.b	$94, $02
	dc.b	$2E, $E2
	dc.b	$94, $00
	dc.b	$83, $11

	CSP_LoopSet	$10, $04
SFX5F_Loop00:
	dc.b	$2C, $E5
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX5F_Loop00
	CSP_Stop