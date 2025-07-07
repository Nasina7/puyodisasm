	include "sound/z80_macros.asm"

;	BGM 00 - SFX Pause
BGM00_Header:
	CSPHeader_ChanCnt	$01
	CSPHeader_ChanFM	$0C, $1F, $00, $00, $00, $00, $00, BGM00_PLR_0C, panCentre,	$04

BGM00_PLR_0C:
	CSP_Cmd94	$83	; Some kind of pitch bending?
	dc.b	$38, NL6
	dc.b	$30
	dc.b	$38
	dc.b	$30, NL8
	CSP_Stop