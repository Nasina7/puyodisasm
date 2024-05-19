	include "sound/z80_macros.asm"
	include "sound/bank1/macros.asm"
; Song 0D - Theme For Harpy

	dc.b $02 ; Channels to Initialize
channel06init:
	dc.b $06 ; Channel Selection
	dc.b $01 ; 0 = Nothing, 1 = FM, 2 = PSG, 3 = FM & PSG?
	dc.b $19 ; 0-1F = Volume
	dc.b $08 ; Release???
	dc.b $03
	dc.b $0C ; Root Pitch?
	dc.b $50 ; Byte Size
	dc.b $00
	ptrZ80 channel06start
	dc.b $C0
	dc.b $04 ; Instrument?
channel07init:
	dc.b $07 ; Channel Selection
	dc.b $01 ; Set it to enable
	dc.b $14
	dc.b $08
	dc.b $03
	dc.b $0C
	dc.b $50
	dc.b $01
	ptrZ80 channel07start
	dc.b $C0
	dc.b $04
	
channel07start:
	dc.w $00E3
	MusCmd_SetMinorPitch $04
	
channel06start:
	dc.w $25E3
	dc.b $27
	dc.b $29
	dc.b $2A
	dc.b $2C
	dc.b $2E
	dc.b $30
	MusCmd_SetMinorPitch $D8
	dc.w $31EE
	MusCmd_SetMinorPitch $00
	
	dc.w $25E3
	dc.b $27
	dc.b $29
	dc.b $2A
	dc.b $2C
	dc.b $2E
	dc.b $30
	MusCmd_SetMinorPitch $28
	dc.w $31EE
	MusCmd_SetMinorPitch $00
	
	MusCmd_Jump channel06start
	
	
	
