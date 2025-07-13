	include	"sound/z80_macros.asm"

;	BGM 13 - Victory Jingle
BGM13_Header:
	dc.b	$06	; Channels to Initialize

@channel00init:
	dc.b	$00	; Channel Selection
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$00
	ptrZ80	@channel00start		; loc_C73C
	dc.b	panCentre
	dc.b	$07		; Instrument

@channel01init:
	dc.b	$01		; Channel Selection
	dc.b	$01
	dc.b	$1B
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$01
	ptrZ80	@channel01start		; loc_C738
	dc.b	panRight
	dc.b	$07		; Instrument

@channel02init:
	dc.b	$02		; Channel Selection
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$02
	ptrZ80	@channel02start		; loc_C724
	dc.b	panCentre
	dc.b	$07		; Instrument

@channel03init:
	dc.b	$03		; Channel Selection
	dc.b	$01
	dc.b	$1B
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$05
	ptrZ80	@channel03start		; loc_C720
	dc.b	panLeft
	dc.b	$07		; Instrument

@channel04init:
	dc.b	$04		; Channel Selection
	dc.b	$01
	dc.b	$1E
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$03
	ptrZ80	@channel04start		; loc_C70C
	dc.b	panCentre
	dc.b	$07		; Instrument

@channel05init:
	dc.b	$05		; Channel Selection
	dc.b	$01
	dc.b	$1B
	dc.b	$0D
	dc.b	$08
	dc.b	$0C
	dc.b	$99
	dc.b	$04
	ptrZ80	@channel05start		; loc_C708
	dc.b	panCentre
	dc.b	$07		; Instrument

@channel05start:
	dc.w	$00E2
	CSP_Detune	$03

@channel04start:
	dc.w	$18E1
	dc.b	$19
	dc.b	$1B
	dc.b	$1D
	dc.b	$1E
	dc.b	$20
	dc.b	$22
	dc.b	$24
	dc.b	$25
	dc.b	$27
	dc.b	$29
	dc.b	$2A
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	dc.b	$31
	dc.w	$33E7
	CSP_Stop

@channel03start:
	dc.w	$00E2
	CSP_Detune	$03

@channel02start:
	dc.w	$17E1
	dc.b	$19
	dc.b	$1B
	dc.b	$1C
	dc.b	$1E
	dc.b	$20
	dc.b	$22
	dc.b	$23
	dc.b	$25
	dc.b	$27
	dc.b	$28
	dc.b	$2A
	dc.b	$2C
	dc.b	$2E
	dc.b	$2F
	dc.b	$31
	dc.w	$2FE7
	CSP_Stop

@channel01start:
	dc.w	$00E2
	CSP_Detune	$03

@channel00start:
	dc.w	$1EE1
	dc.b	$20
	dc.b	$22
	dc.b	$23
	dc.b	$25
	dc.b	$27
	dc.b	$29
	dc.b	$2A
	dc.b	$2C
	dc.b	$2E
	dc.b	$2F
	dc.b	$31
	dc.b	$33
	dc.b	$35
	dc.b	$36
	dc.b	$38
	dc.w	$2AE7
	CSP_Stop
