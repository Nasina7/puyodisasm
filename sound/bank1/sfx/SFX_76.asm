	include "sound/z80_macros.asm"

;	SFX 76
SFX76_Header:
	dc.b	$03

SFX76_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$FE
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX76_PLR08
	dc.b	panCentre
	dc.b	$46

SFX76_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX76_PLR09
	dc.b	panCentre
	dc.b	$46

SFX76_PLR0A_Init:
	dc.b	$0A
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX76_PLR0A
	dc.b	panCentre
	dc.b	$46

SFX76_PLR09:
	dc.b	$94, $02
	dc.b	$1E, $E0
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$35, $E1
	dc.b	$9F, $40
	dc.b	$90, $01
	dc.b	$8B, $46
	dc.b	$22, $E1
	dc.b	$8A, $FE
	dc.b	$9F, $00
	dc.b	$90, $02
	dc.b	$8B, $00
	dc.b	$8E, $07
	dc.b	$89, $D3
	dc.b	$88, $23
	dc.b	$93, $8F, $80

SFX76_Loop00:
	dc.b	$60, $E0
	dc.b	$9F, $A0
	dc.b	$5F
	dc.b	$9F, $60
	dc.b	$5D
	dc.b	$9F, $C0
	dc.b	$59
	dc.b	$9F, $40
	dc.b	$5B
	dc.b	$9F, $00
	dc.b	$89, $FE
	dc.b	$95
	ptrZ80	SFX76_Loop00
	CSP_Stop

SFX76_PLR08:
	dc.b	$00, $E1
	dc.b	$97, $FD

SFX76_PLR0A:
	dc.b	$94, $02
	dc.b	$22, $DF
	dc.b	$1A
	dc.b	$1B
	dc.b	$00
	dc.b	$9F, $C0
	dc.b	$8A, $FE
	dc.b	$1B, $DF
	dc.b	$9F, $30
	dc.b	$19
	dc.b	$1B
	dc.b	$9F, $60
	dc.b	$19
	dc.b	$00, $E2
	dc.b	$83, $01
	dc.b	$94, $00
	dc.b	$9F, $00
	dc.b	$93, $8F, $40

SFX76_Loop01:
	dc.b	$1B, $E0
	dc.b	$9F, $60
	dc.b	$19
	dc.b	$9F, $A0
	dc.b	$14
	dc.b	$9F, $40
	dc.b	$16
	dc.b	$9F, $C0
	dc.b	$20
	dc.b	$9F, $00
	dc.b	$18
	dc.b	$A5, $04
	ptrZ80	SFX76_Jump00
	CSP_Jump	SFX76_Jump01

SFX76_Jump00:
	dc.b	$00, $E1

SFX76_Jump01:
	dc.b	$95
	ptrZ80	SFX76_Loop01
	CSP_Stop