	include "sound/z80_macros.asm"
;	include "sound/bank1/CSP2ASM.asm"

;	BGM 00 - SFX Pause
BGM00_Header:
	dc.b	$01 ; Channels to Initialize

@channel0Cinit:
	dc.b	$0C
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	ptrZ80	@channel0Cstart
	dc.b	panCentre
	dc.b	$04

@channel0Cstart:
	CSP_Cmd94	$83
	dc.b	$38, $E3
	dc.b	$30
	dc.b	$38
	dc.b	$30, $E4
	CSP_Stop
