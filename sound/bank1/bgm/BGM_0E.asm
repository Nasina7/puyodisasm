	include "sound/z80_macros.asm"
	include "sound/bank1/macros.asm"
; Song 0E - Warning of Puyo Puyo
song0Estart:
	dc.b $06 ; Channels to Initialize
@channel00init:
	dc.b $00 ; Channel Selection
	dc.b $01
	dc.b $1E
	dc.b $00
	dc.b $00
	dc.b $0C
	dc.b $82
	dc.b $04
	ptrZ80 @channel00start
	dc.b $C0
	dc.b $44 ; Instrument
@channel01init:
	dc.b $01 ; Channel Selection
	dc.b $01
	dc.b $1D
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $82
	dc.b $00
	ptrZ80 @channel01start
	dc.b $C0
	dc.b $01 ;Instrument
@channel02init:
	dc.b $02 ; Channel Selection
	dc.b $01
	dc.b $1A
	dc.b $00
	dc.b $07
	dc.b $0C
	dc.b $82
	dc.b $01
	ptrZ80 @channel02start
	dc.b $C0
	dc.b $1E ; Instrument
@channel03init:
	dc.b $03 ; Channel Selection
	dc.b $01
	dc.b $18
	dc.b $00
	dc.b $03
	dc.b $00
	dc.b $82
	dc.b $02
	ptrZ80 @channel03start
	dc.b $C0
	dc.b $07 ; Instrument
@channel04init:
	dc.b $04 ; Channel Selection
	dc.b $01
	dc.b $15
	dc.b $00
	dc.b $03
	dc.b $00
	dc.b $82
	dc.b $05
	ptrZ80 @channel04start
	dc.b $C0
	dc.b $07 ; Instrument
@channel05init:
	dc.b $05 ; Channel Selection
	dc.b $01
	dc.b $16
	dc.b $00
	dc.b $03
	dc.b $00
	dc.b $82
	dc.b $03
	ptrZ80 @channel05start
	dc.b $C0
	dc.b $07 ; Instrument

@channel04start:
	dc.w $0097
	dc.b $04
@channel03start:
	dc.w $38E5
	dc.w $35EA
	dc.w $35E1
	dc.b $00
	dc.b $38
	dc.b $00
	dc.b $38
	dc.w $35E3
	dc.b $35
	MusCmd_IncRootPitch $01
	MusCmd_Jump @channel03start

@channel05start:
	dc.w $35E5
	dc.w $31EA
	dc.w $35E1
	dc.b $00
	dc.b $35
	dc.b $00
	dc.b $35
	dc.w $31E3
	dc.b $31
	MusCmd_IncRootPitch $01
	MusCmd_Jump @channel05start
	
@channel02start:
	MusCmd_SetPitchEnvelope $07
	dc.w $19EA
	MusCmd_SetPitchEnvelope $00
	dc.w $20E1
	dc.w $20E3
	dc.w $25E1
	dc.b $20
	MusCmd_SetPitchEnvelope $07
	dc.w $19EA
	MusCmd_SetPitchEnvelope $00
	dc.w $20E1
	dc.w $20E3
	dc.w $25E1
	dc.b $20
	MusCmd_IncRootPitch $01
	MusCmd_Jump @channel02start

@channel00start:
	MusCmd_Unk9F $40
	dc.w $31E3
	dc.b $31
	MusCmd_Unk9F $80
	dc.w $2CE1
	dc.w $2CE3
	MusCmd_Unk9F $40
	dc.b $31
	dc.b $31
	dc.w $31E1
	MusCmd_Unk9F $80
	dc.w $2CE3
	dc.b $2C
	MusCmd_Jump @channel00start
	
@channel01start:
	dc.w $C0E1
	dc.b $C4
	dc.b $C4
	dc.b $C4
	dc.w $C3E1
	dc.b $C4
	dc.b $C4
	dc.b $C3
	dc.b $C0
	dc.b $C3
	dc.b $C4
	dc.b $C4
	dc.b $C3
	dc.b $C4
	dc.b $C4
	dc.b $C4
	dc.w $C6E1
	dc.b $C4
	dc.b $C4
	dc.b $C4
	dc.w $C3E1
	dc.b $C4
	dc.b $C4
	dc.b $C3
	dc.b $C4
	dc.b $C3
	dc.b $C4
	dc.b $C4
	dc.b $C3
	dc.b $C4
	dc.b $C3
	dc.b $C3
	MusCmd_Jump @channel01start