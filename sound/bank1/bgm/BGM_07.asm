	include "sound/z80_macros.asm"

;	BGM 07 - Sorrow of Puyo Puyo
BGM07_Header:
	CSPHeader_ChanCnt	$06
	CSPHeader_ChanFM	$00, $1C, $00, $08, $12, $4B, $00, BGM07_PLR_00, panRight,	$1F
	CSPHeader_ChanFM	$01, $16, $00, $08, $12, $4B, $01, BGM07_PLR_01, panLeft,	$1F
	CSPHeader_ChanFM	$02, $1C, $00, $08, $12, $4B, $02, BGM07_PLR_02, panLeft,	$1F
	CSPHeader_ChanFM	$03, $16, $00, $08, $12, $4B, $05, BGM07_PLR_03, panRight,	$1F
	CSPHeader_ChanFM	$04, $1A, $00, $00, $12, $4B, $03, BGM07_PLR_04, panCentre,	$1F
	CSPHeader_ChanDrum	$05, $1E, $4B, $04, BGM07_PLR_05, panCentre,	$01

BGM07_PLR_01:		; loc_A19D
	dc.b	nRST, NL6
	CSP_Detune	$02

BGM07_PLR_00:		; loc_A1A1
	dc.b	$2C, NL4
	dc.b	$2C
	dc.b	$2C
	dc.b	$2C, NL12
	dc.b	$20, NL4
	dc.b	$20
	dc.b	$20
	dc.b	$20, NL12
	dc.b	$2D, NL4
	dc.b	$2D
	dc.b	$2D
	dc.b	$2D, NL12
	dc.b	$21, NL4
	dc.b	$21
	dc.b	$21
	dc.b	$21, NL12
	dc.b	$2A, NL4
	dc.b	$2A
	dc.b	$2A
	dc.b	$2A, NL12
	dc.b	$1E, NL4
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E, NL12
	dc.b	$27, NL4
	dc.b	$27
	dc.b	$27
	CSP_SetTempo	$88
	dc.b	$27, CNL, $54
	CSP_Stop

BGM07_PLR_03:		; loc_A1CF
	dc.b	NRST, NL6
	CSP_Detune	$02

BGM07_PLR_02:		; loc_A1D3
	dc.b	$28, NL4
	dc.b	$28
	dc.b	$28
	dc.b	$28, NL12
	dc.b	$1C, NL4
	dc.b	$1C
	dc.b	$1C
	dc.b	$1C, NL12
	dc.b	$28, NL4
	dc.b	$28
	dc.b	$28
	dc.b	$28, NL12
	dc.b	$1C, NL4
	dc.b	$1C
	dc.b	$1C
	dc.b	$1C, NL12
	dc.b	$27, NL4
	dc.b	$27
	dc.b	$27
	dc.b	$27, NL12
	dc.b	$1B, NL4
	dc.b	$1B
	dc.b	$1B
	dc.b	$1B, NL12
	dc.b	$24, NL4
	dc.b	$24
	dc.b	$24
	CSP_SetTempo	$88
	dc.b	$24, CNL, $54
	CSP_Stop

BGM07_PLR_04:		; loc_A201
	dc.b	$25, NL4
	dc.b	$25
	dc.b	$25
	dc.b	$25, NL12
	dc.b	$19, NL4
	dc.b	$19
	dc.b	$19
	dc.b	$19, NL12
	dc.b	$25, NL4
	dc.b	$25
	dc.b	$25
	dc.b	$25, NL12
	dc.b	$19, NL4
	dc.b	$19
	dc.b	$19
	dc.b	$19, NL12
	dc.b	$24, NL4
	dc.b	$24
	dc.b	$24
	dc.b	$24, NL12
	dc.b	$18, NL4
	dc.b	$18
	dc.b	$18
	dc.b	$18, NL12
	dc.b	$20, NL4
	dc.b	$20
	dc.b	$20
	CSP_SetTempo	$88
	dc.b	$20, CNL, $54
	CSP_Stop

BGM07_PLR_05:		; loc_A22F
	dc.b	dSnare02, NL4
	dc.b	dSnare02
	dc.b	dSnare02
	dc.b	dSnare02, NL12
	dc.b	nRST, NL24
	dc.b	dSnare02, NL4
	dc.b	dSnare02
	dc.b	dSnare02
	dc.b	dSnare02, NL12
	dc.b	nRST, NL24
	dc.b	dSnare02, NL4
	dc.b	dSnare02
	dc.b	dSnare02
	dc.b	dSnare02, NL12
	dc.b	nRST, NL24
	dc.b	dSnare02, NL4
	dc.b	dSnare02
	dc.b	dSnare02
	dc.b	dSnare02, NL12
	CSP_SetTempo	$88
	CSP_AlterVol	$F8
	dc.b	dSnare01, NL1
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_AlterVol	$01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	dc.b	dSnare01
	CSP_Stop
