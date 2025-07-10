	include "sound/z80_macros.asm"

;	SFX 68 - Unused
SFX68_Header:
	dc.b	$03

SFX68_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$01
	dc.b	$06
	dc.b	$6E
	dc.b	$05
	ptrZ80	SFX68_PLR09
	dc.b	panCentre
	dc.b	$07

SFX68_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$01
	dc.b	$FA
	dc.b	$6E
	dc.b	$04
	ptrZ80	SFX68_PLR09
	dc.b	panCentre
	dc.b	$07

SFX68_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$01
	dc.b	$FA
	dc.b	$6E
	dc.b	$03
	ptrZ80	SFX68_PLR09
	dc.b	panCentre
	dc.b	$07

; Unused detune information?
	dc.b	$97, $FD

SFX68_PLR09:
	dc.b	$38, $E1
	dc.b	$00
	dc.b	$31
	dc.b	$31
	dc.b	$00, $E2
	dc.b	$38, $E0
	dc.b	$00
	dc.b	$3D
	dc.b	$00
	dc.b	$46, $E7
	CSP_Stop