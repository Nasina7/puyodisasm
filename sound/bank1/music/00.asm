	include "sound/z80_macros.asm"
	include "sound/bank1/macros.asm"
; Song 00 - SFX Pause
song00start:
	dc.b $01 ; Channels to Initialize
@channel0Cinit:
	dc.b $0C
	dc.b $01
	dc.b $1F
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	dc.b $00
	ptrZ80 @channel0Cstart
	dc.b $C0
	dc.b $04

@channel0Cstart:
	MusCmd_Unk94 $83
	dc.w $38E3
	dc.b $30
	dc.b $38
	dc.w $30E4
	MusCmd_Unk82