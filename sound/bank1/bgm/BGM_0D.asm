	include "sound/z80_macros.asm"

;	BGM 0D - Theme For Harpy
BGM0D_Header:
	CSPHeader_ChanCnt	$02
	CSPHeader_ChanFM	$06, $19, $08, $03, $0C, $50, $00, BGM0D_PLR_06, panCentre,	$04
	CSPHeader_ChanFM	$07, $14, $08, $03, $0C, $50, $01, BGM0D_PLR_07, panCentre,	$04

BGM0D_PLR_07:
	dc.b	nRST, NL6
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
