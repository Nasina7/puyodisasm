	include "sound/z80_macros.asm"

;	SFX 4E
SFX4E_Header:
	dc.b	$04

SFX4E_PLR06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$11
	dc.b	$00
	dc.b	$0B
	dc.b	$00
	dc.b	$8C
	dc.b	$00
	ptrZ80	SFX4E_PLR06
	dc.b	$C0
	dc.b	$3A

SFX4E_PLR07_Init:
	dc.b	$07
	dc.b	$01
	dc.b	$11
	dc.b	$00
	dc.b	$0B
	dc.b	$00
	dc.b	$8C
	dc.b	$01
	ptrZ80	SFX4E_PLR07
	dc.b	$80
	dc.b	$3A

SFX4E_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$11
	dc.b	$00
	dc.b	$0B
	dc.b	$00
	dc.b	$8C
	dc.b	$03
	ptrZ80	SFX4E_PLR08
	dc.b	$40
	dc.b	$3A

SFX4E_PLR09_Init:
	dc.b	$09
	dc.b	$02
	dc.b	$0A
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX4E_PLR09
	dc.b	$C0
	dc.b	$00

SFX4E_PLR07:
	dc.b	$00
	dc.b	$DF

SFX4E_PLR08:
	dc.b	$00
	dc.b	$DF

SFX4E_PLR06:
	dc.b	$93, $80, $70
	dc.b	$55, $E7
	CSP_Stop		; What about the $93 loop?

SFX4E_PLR09:
	dc.b	$8E, $07
	dc.b	$99
	dc.b	$89, $FE

	CSP_LoopSet	$10, $05
SFX4E_Loop00:
	dc.b	$55, $DF
	dc.b	$8A, $04
	dc.b	$89, $02
	CSP_LoopBack	$10, SFX4E_Loop00

	dc.b	$93, $8A, $C0
SFX4E_Loop01:
	dc.b	$55, $E3
	dc.b	$89, $FA
	dc.b	$95
	ptrZ80	SFX4E_Loop01
	CSP_Stop
