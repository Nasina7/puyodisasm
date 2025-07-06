	include "sound/z80_macros.asm"
;	include "sound/bank1/CSP2ASM.asm"

;	BGM 07 - Sorrow of Puyo Puyo
BGM07_Header:
	dc.b	$06

@channel00init:
	dc.b	$00
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$08
	dc.b	$12
	dc.b	$4B
	dc.b	$00
	ptrZ80	@channel00start
	dc.b	panRight
	dc.b	$1F

@channel01init:
	dc.b	$01
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$08
	dc.b	$12
	dc.b	$4B
	dc.b	$01
	ptrZ80	@channel01start
	dc.b	panLeft
	dc.b	$1F

@channel02init:
	dc.b	$02
	dc.b	$01
	dc.b	$1C
	dc.b	$00
	dc.b	$08
	dc.b	$12
	dc.b	$4B
	dc.b	$02
	ptrZ80	@channel02start
	dc.b	panLeft
	dc.b	$1F

@channel03init:
	dc.b	$03
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$08
	dc.b	$12
	dc.b	$4B
	dc.b	$05
	ptrZ80	@channel03start
	dc.b	panRight
	dc.b	$1F

@channel04init:
	dc.b	$04
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$12
	dc.b	$4B
	dc.b	$03
	ptrZ80	@channel04start
	dc.b	panCentre
	dc.b	$1F

@channel05init:
	dc.b	$05
	dc.b	$02
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$4B
	dc.b	$04
	ptrZ80	@channel05start
	dc.b	panCentre
	dc.b	$01

@channel01start:	; loc_A19D
	dc.b	$00, NL6
	CSP_Detune	$02

@channel00start:	; loc_A1A1
	dc.b	$2C
	dc.w	$E22C
	dc.b	$2C
	dc.b	$2C
	dc.w	$E520
	dc.w	$E220
	dc.b	$20
	dc.b	$20
	dc.w	$E52D
	dc.w	$E22D
	dc.b	$2D
	dc.b	$2D
	dc.w	$E521
	dc.w	$E221
	dc.b	$21
	dc.b	$21
	dc.w	$E52A
	dc.w	$E22A
	dc.b	$2A
	dc.b	$2A
	dc.w	$E51E
	dc.w	$E21E
	dc.b	$1E
	dc.b	$1E
	dc.w	$E527
	dc.w	$E227
	dc.b	$27
	CSP_SetTempo	$88
	dc.b	$27
	dc.w	$DE54
	CSP_Stop

@channel03start:	; loc_A1CF
	dc.b	$00, NL6
	CSP_Detune	$02

@channel02start:	; loc_A1D3
	dc.b	$28
	dc.w	$E228
	dc.b	$28
	dc.b	$28
	dc.w	$E51C
	dc.w	$E21C
	dc.b	$1C
	dc.b	$1C
	dc.w	$E528
	dc.w	$E228
	dc.b	$28
	dc.b	$28
	dc.w	$E51C
	dc.w	$E21C
	dc.b	$1C
	dc.b	$1C
	dc.w	$E527
	dc.w	$E227
	dc.b	$27
	dc.b	$27
	dc.w	$E51B
	dc.w	$E21B
	dc.b	$1B
	dc.b	$1B
	dc.w	$E524
	dc.w	$E224
	dc.b	$24
	CSP_SetTempo	$88
	dc.b	$24
	dc.w	$DE54
	CSP_Stop

@channel04start:	; loc_A201
	dc.b	$25
	dc.w	$E225
	dc.b	$25
	dc.b	$25
	dc.w	$E519
	dc.w	$E219
	dc.b	$19
	dc.b	$19
	dc.w	$E525
	dc.w	$E225
	dc.b	$25
	dc.b	$25
	dc.w	$E519
	dc.w	$E219
	dc.b	$19
	dc.b	$19
	dc.w	$E524
	dc.w	$E224
	dc.b	$24
	dc.b	$24
	dc.w	$E518
	dc.w	$E218
	dc.b	$18
	dc.b	$18
	dc.w	$E520
	dc.w	$E220
	dc.b	$20
	CSP_SetTempo	$88
	dc.b	$20
	dc.w	$DE54
	CSP_Stop

@channel05start:	; loc_A22F
	dc.b	$C2
	dc.b	$E2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.w	$E500
	dc.b	$E7
	dc.b	$C2
	dc.b	$E2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.w	$E500
	dc.b	$E7
	dc.b	$C2
	dc.b	$E2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.w	$E500
	dc.b	$E7
	dc.b	$C2
	dc.b	$E2
	dc.b	$C2
	dc.b	$C2
	dc.b	$C2
	dc.b	$E5
	CSP_SetTempo	$88
	CSP_AlterVol	$F8
	dc.b	$C1
	dc.b	$DF
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_AlterVol	$01
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_Stop
