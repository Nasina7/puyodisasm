	include "sound/z80_macros.asm"

;	SFX 61
SFX61_Header:
	dc.b	$03

SFX61_PLR09_Init:
	dc.b	$09
	dc.b	$41
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$00
	ptrZ80	SFX61_PLR09
	dc.b	panCentre
	dc.b	$49

SFX61_PLR0A_Init:
	dc.b	$0A
	dc.b	$41
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$01
	ptrZ80	SFX61_PLR0A
	dc.b	panCentre
	dc.b	$49

SFX61_PLR0B_Init:
	dc.b	$0B
	dc.b	$41
	dc.b	$13
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX61_PLR0B
	dc.b	panCentre
	dc.b	$46

SFX61_PLR0A:
	dc.b	$00, $E2

SFX61_PLR09:
	dc.b	$83, $0E
	dc.b	$31, CNL, $48
	dc.b	$A1
	dc.b	$94, $84
	dc.b	$49, $DF
	dc.b	$20, CNL, $30
	CSP_Stop

SFX61_PLR0B:
	CSP_LoopSet	$10, $04
SFX61_Loop00:
	dc.b	$94, $01
	dc.b	$55, $E5
	dc.b	$94, $82
	dc.b	$31, $E5
	CSP_LoopBack	$10, SFX61_Loop00
	CSP_Stop