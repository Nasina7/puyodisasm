	include "sound/z80_macros.asm"
;	include "sound/bank1/CSP2ASM.asm"

;	BGM 12 - Victory of Puyo Puyo
BGM12_Header:
	dc.b	$06

@channel00init:
	dc.b	$00
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$66
	dc.b	$00
	ptrZ80	@channel00start
	dc.b	panCentre
	dc.b	$07

@channel01init:
	dc.b	$01
	dc.b	$01
	dc.b	$1B
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$66
	dc.b	$01
	ptrZ80	@channel01start
	dc.b	panCentre
	dc.b	$07

@channel02init:
	dc.b	$02
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$66
	dc.b	$02
	ptrZ80	@channel02start
	dc.b	panRight
	dc.b	$07

@channel03init:
	dc.b	$03
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$66
	dc.b	$03
	ptrZ80	@channel03start
	dc.b	panLeft
	dc.b	$07

@channel04init:
	dc.b	$04
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$66
	dc.b	$04
	ptrZ80	@channel04start
	dc.b	panCentre
	dc.b	$0E

@channel05init:
	dc.b	$05
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$66
	dc.b	$05
	ptrZ80	@channel05start
	dc.b	panCentre
	dc.b	$20

@channel01start:	; loc_0049
	dc.b	$00
	dc.b	$E3
	CSP_Detune	$04

@channel00start:	; loc_004D
	dc.b	$35
	dc.w	$E535
	dc.w	$E236
	dc.b	$35
	dc.b	$38
	dc.w	$E336
	dc.b	$35
	dc.w	$E235
	dc.b	$33
	dc.b	$33
	dc.w	$E533
	dc.w	$E235
	dc.b	$33
	dc.b	$36
	dc.w	$E335
	dc.b	$33
	dc.w	$E233
	dc.b	$31
	dc.b	$31
	dc.w	$EB31
	dc.w	$E031
	dc.b	$31
	dc.b	$31
	dc.w	$E331
	dc.b	$31
	dc.b	$31
	dc.w	$E031
	dc.b	$31
	dc.b	$33
	dc.w	$EB33
	dc.w	$E033
	dc.b	$33
	dc.b	$33
	dc.w	$E333
	dc.b	$33
	dc.w	$E235
	dc.b	$36
	dc.b	$35
	dc.w	$ED35
	dc.w	$E135
	dc.b	$35
	dc.b	$35
	dc.b	$35
	dc.b	$E5
	CSP_Stop

@channel02start:	; loc_008C
	dc.b	$31
	dc.w	$E531
	dc.w	$E233
	dc.b	$31
	dc.b	$35
	dc.w	$E333
	dc.b	$31
	dc.w	$E231
	dc.b	$30
	dc.b	$30
	dc.w	$E530
	dc.w	$E231
	dc.b	$30
	dc.b	$33
	dc.w	$E331
	dc.b	$30
	dc.w	$E230
	dc.b	$2E
	dc.b	$2E
	dc.w	$EB2E
	dc.w	$E02E
	dc.b	$2E
	dc.b	$2E
	dc.w	$E32E
	dc.b	$2E
	dc.b	$2E
	dc.w	$E02E
	dc.b	$2E
	dc.b	$30
	dc.w	$EB30
	dc.w	$E030
	dc.b	$30
	dc.b	$30
	dc.w	$E330
	dc.b	$30
	dc.w	$E231
	dc.b	$33
	dc.b	$31
	dc.w	$ED31
	dc.w	$E131
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$E5
	CSP_Stop

@channel03start:	; loc_00CB
	dc.b	$2C
	dc.w	$E52C
	dc.w	$E22E
	dc.b	$30
	dc.b	$31
	dc.w	$E330
	dc.b	$2E
	dc.w	$E22E
	dc.b	$2C
	dc.b	$2C
	dc.w	$E52C
	dc.w	$E22E
	dc.b	$2C
	dc.b	$2A
	dc.w	$E32C
	dc.b	$2C
	dc.w	$E22C
	dc.b	$2A
	dc.b	$2A
	dc.w	$EB2A
	dc.w	$E02A
	dc.b	$2A
	dc.b	$2A
	dc.w	$E32A
	dc.b	$2A
	dc.b	$2A
	dc.w	$E02A
	dc.b	$2A
	dc.b	$2C
	dc.w	$EB2C
	dc.w	$E02C
	dc.b	$2C
	dc.b	$2C
	dc.w	$E32C
	dc.b	$2C
	dc.w	$E22E
	dc.b	$30
	dc.b	$2C
	dc.w	$ED2C
	dc.w	$E12C
	dc.b	$2C
	dc.b	$2C
	dc.b	$2C
	dc.b	$E5
	CSP_Stop

@channel04start:	; loc_010A
	dc.b	$19
	dc.w	$E514
	dc.b	$19
	dc.b	$19
	dc.w	$E214
	dc.b	$19
	dc.b	$14
	dc.w	$E50F
	dc.b	$14
	dc.b	$14
	dc.w	$E20F
	dc.b	$14
	dc.b	$12
	dc.w	$E312
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$19
	dc.b	$14
	dc.b	$19
	dc.b	$14
	dc.b	$19
	dc.b	$14
	dc.b	$19
	dc.w	$E119
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$E5
	CSP_Stop

@channel05start:	; loc_0139
	CSP_LoopSet	$10, $04

@jump1:
	dc.b	$C2
	dc.b	$E3
	CSP_AlterVol	$FD
	dc.b	$C2
	dc.b	$E0
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$03
	dc.b	$C2
	dc.b	$E3
	CSP_AlterVol	$FD
	dc.b	$C2
	dc.b	$E0
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$03
	dc.b	$C2
	dc.b	$E3
	CSP_AlterVol	$FD
	dc.b	$C2
	dc.b	$E0
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$03
	dc.b	$C2
	dc.b	$E2
	dc.b	$C2
	dc.b	$C2
	CSP_LoopBack	$10, @jump1
	dc.b	$C2
	dc.b	$DF
	CSP_AlterVol	$FC
	CSP_LoopSet	$10, $17

@jump2:
	dc.b	$C2
	CSP_LoopBack	$10, @jump2
	CSP_AlterVol	$01
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$01
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$01
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	CSP_AlterVol	$01
	dc.b	$C2
	dc.b	$E1
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$E5
	CSP_Stop
