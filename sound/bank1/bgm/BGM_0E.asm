	include "sound/z80_macros.asm"

;	BGM 0E - Warning of Puyo Puyo
BGM0E_Header:
	CSPHeader_ChanCnt	$06
	CSPHeader_ChanFM	$00, $1E, $00, $00, $0C, $82, $04, BGM0E_PLR_00, panCentre,	$44
	CSPHeader_ChanFM	$01, $1D, $00, $00, $00, $82, $00, BGM0E_PLR_01, panCentre,	$01
	CSPHeader_ChanFM	$02, $1A, $00, $07, $0C, $82, $01, BGM0E_PLR_02, panCentre,	$1E
	CSPHeader_ChanFM	$03, $18, $00, $03, $00, $82, $02, BGM0E_PLR_03, panCentre,	$07
	CSPHeader_ChanFM	$04, $15, $00, $03, $00, $82, $05, BGM0E_PLR_04, panCentre,	$07
	CSPHeader_ChanFM	$05, $16, $00, $03, $00, $82, $03, BGM0E_PLR_05, panCentre,	$07

BGM0E_PLR_04:
	dc.b	nRST
	CSP_Detune	$04

BGM0E_PLR_03:
	dc.b	$38, NL12
	dc.b	$35, NL9
	dc.b	$35, NL3
	dc.b	nRST
	dc.b	$38
	dc.b	nRST
	dc.b	$38
	dc.b	$35, NL6
	dc.b	$35
	CSP_Transpose	$01
	CSP_Jump	BGM0E_PLR_03

BGM0E_PLR_05:
	dc.b	$35, NL12
	dc.b	$31, NL9
	dc.b	$35, NL3
	dc.b	nRST
	dc.b	$35
	dc.b	nRST
	dc.b	$35
	dc.b	$31, NL6
	dc.b	$31
	CSP_Transpose	$01
	CSP_Jump	BGM0E_PLR_05

BGM0E_PLR_02:
	CSP_PitchEnv	$07
	dc.b	$19, NL9
	CSP_PitchEnv	$00
	dc.b	$20, NL3
	dc.b	$20, NL6
	dc.b	$25, NL3
	dc.b	$20
	CSP_PitchEnv	$07
	dc.b	$19, NL9
	CSP_PitchEnv	$00
	dc.b	$20, NL3
	dc.b	$20, NL6
	dc.b	$25, NL3
	dc.b	$20
	CSP_Transpose	$01
	CSP_Jump	BGM0E_PLR_02

BGM0E_PLR_00:
	CSP_Pan		panRight
	dc.b	$31, NL6
	dc.b	$31
	CSP_Pan		panLeft
	dc.b	$2C, NL3
	dc.b	$2C, NL6
	CSP_Pan		panRight
	dc.b	$31
	dc.b	$31
	dc.b	$31, NL3
	CSP_Pan		panLeft
	dc.b	$2C, NL6
	dc.b	$2C
	CSP_Jump	BGM0E_PLR_00

BGM0E_PLR_01:
	dc.b	dKick01, NL3
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03, NL3
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dKick01
	dc.b	dSnare03
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dKick02, NL3
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03, NL3
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dHiHat
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dHiHat
	dc.b	dSnare03
	dc.b	dSnare03
	CSP_Jump	BGM0E_PLR_01