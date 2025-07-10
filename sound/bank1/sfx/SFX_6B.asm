	include "sound/z80_macros.asm"

;	SFX 6B
SFX6B_Header:
	dc.b	$02

SFX6B_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX6B_PLR09
	dc.b	panCentre
	dc.b	$46

SFX6B_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX6B_PLR0A
	dc.b	panCentre
	dc.b	$46

SFX6B_PLR09:
	CSP_LoopSet	$10, $0C
SFX6B_Loop00:
	dc.b	$29, $DF
	dc.b	$24, $E0
	dc.b	$8A, $FE
	CSP_LoopBack	$10, SFX6B_Loop00
	CSP_Stop

SFX6B_PLR0A:
	dc.b	$93, $8F, $FF
	dc.b	$22, $DF
	dc.b	$20
	dc.b	$1D
	CSP_Stop