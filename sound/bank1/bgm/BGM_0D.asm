	include "sound/z80_macros.asm"
;	include "sound/bank1/CSP2ASM.asm"

;	BGM 0D - Theme For Harpy
BGM0D_Header:
	dc.b	$02	; Channels to Initialize

BGM0D_PLR_06_Init:
	dc.b	$06		; Playback Channel
	dc.b	$01		; Channel Type
	dc.b	$19		; Volume
	dc.b	$08		; Volume Envelope
	dc.b	$03		; Modulation Envelope
	dc.b	$0C		; Transposition
	dc.b	$50		; Tempo
	dc.b	$00		; Output Channel
	ptrZ80	BGM0D_PLR_06
	dc.b	panCentre
	dc.b	$04		; Instrument

BGM0D_PLR_07_Init:
	dc.b	$07		; Playback Channel
	dc.b	$01		; Channel Type
	dc.b	$14		; Volume
	dc.b	$08		; Volume Envelope
	dc.b	$03		; Modulation Envelope
	dc.b	$0C		; Transposition
	dc.b	$50		; Tempo
	dc.b	$01		; Output Channel
	ptrZ80	BGM0D_PLR_07
	dc.b	panCentre
	dc.b	$04

BGM0D_PLR_07:
	dc.b	$00, NL6
	CSP_Detune	$04

BGM0D_PLR_06:
	dc.b	$25, NL6
	dc.b	$27
	dc.b	$29
	dc.b	$2A
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	CSP_Detune	$D8
	dc.b	$31, NL42
	CSP_Detune	$00
	dc.b	$25, NL6
	dc.b	$27
	dc.b	$29
	dc.b	$2A
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	CSP_Detune	$28
	dc.b	$31, NL42
	CSP_Detune	$00
	CSP_Jump	BGM0D_PLR_06
