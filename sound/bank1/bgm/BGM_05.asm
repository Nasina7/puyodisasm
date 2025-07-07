	include "sound/z80_macros.asm"

;	BGM 05 - Morning of Puyo Puyo
BGM05_Header:
	CSPHeader_ChanCnt	$06
	CSPHeader_ChanFM	$00, $1B, $00, $08, $0C, $78, $00, BGM05_PLR_00, panCentre,	$0B
	CSPHeader_ChanFM	$01, $17, $00, $08, $0C, $78, $01, BGM05_PLR_01, panRight,	$0B
	CSPHeader_ChanFM	$02, $14, $08, $08, $18, $78, $02, BGM05_PLR_02, panCentre,	$04
	CSPHeader_ChanFM	$03, $0F, $08, $08, $18, $78, $04, BGM05_PLR_03, panLeft,	$04
	CSPHeader_ChanFM	$04, $1B, $00, $00, $00, $78, $03, BGM05_PLR_04, panCentre,	$09
	CSPHeader_ChanFM	$05, $18, $00, $08, $00, $78, $05, BGM05_PLR_05, panCentre,	$09

BGM05_PLR_01:
	dc.b	$00, NL3
	CSP_Detune	$04

BGM05_PLR_00:
	dc.b	$2E, NL6
	dc.b	$31
	dc.b	$36, NL3
	dc.b	$35
	dc.b	$36, NL12
	dc.b	$31, NL6
	dc.b	$2E
	dc.b	$31
	dc.b	$2F, NL3
	dc.b	$31
	dc.b	$33, NL6
	dc.b	$33
	dc.b	$30
	dc.b	$31, NL2
	dc.b	$33
	dc.b	$31
	dc.b	$31, NL18
	dc.b	$2E, NL6
	dc.b	$31
	dc.b	$36, NL3
	dc.b	$35
	dc.b	$36, NL12
	dc.b	$31, NL6
	dc.b	$2E
	dc.b	$31
	dc.b	$2F, NL3
	dc.b	$2E
	dc.b	$2F, NL12
	dc.b	$2A, NL6
	dc.b	$2C, NL2
	dc.b	$2E
	dc.b	$2C
	dc.b	$2C, NL12
	dc.b	$2A, NL6
	dc.b	$25
	dc.b	$2A
	dc.b	$29
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$29
	dc.b	$2A
	dc.b	$25
	dc.b	$2C
	dc.b	$2B
	dc.b	$2C
	dc.b	$2F
	dc.b	$2C
	dc.b	$2B
	dc.b	$2C
	dc.b	$2A
	dc.b	$27
	dc.b	$2F, NL3
	dc.b	$2E
	dc.b	$2F, NL12
	dc.b	$2E, NL6
	dc.b	$2C
	dc.b	$2A
	dc.b	$29
	dc.b	$25
	dc.b	$2E, NL3
	dc.b	$2C
	dc.b	$2E, NL12
	dc.b	$31, NL6
	dc.b	$33
	dc.b	$31
	dc.b	$2A, NL3
	dc.b	$2F
	dc.b	$31
	dc.b	$2F
	dc.b	$33
	dc.b	$2F
	dc.b	$36
	dc.b	$2F
	dc.b	$2A
	dc.b	$2F
	dc.b	$31
	dc.b	$2F
	dc.b	$33
	dc.b	$2F
	dc.b	$36
	dc.b	$2F
	dc.b	$2A
	dc.b	$2E
	dc.b	$2F
	dc.b	$2E
	dc.b	$31
	dc.b	$2E
	dc.b	$36
	dc.b	$2E
	dc.b	$2A
	dc.b	$2E
	dc.b	$2F
	dc.b	$2E
	dc.b	$31
	dc.b	$2E
	dc.b	$36
	dc.b	$2E
	dc.b	$2C
	dc.b	$27
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	dc.b	$2C
	dc.b	$31
	dc.b	$2C
	dc.b	$33
	dc.b	$2C
	dc.b	$35
	dc.b	$2C
	dc.b	$36
	dc.b	$2C
	dc.b	$35
	dc.b	$2C
	dc.b	$31
	dc.b	$30
	dc.b	$31
	dc.b	$2C
	dc.b	$2A
	dc.b	$29
	dc.b	$27
	dc.b	$29
	dc.b	$25, NL6
	dc.b	$29
	dc.b	$2C
	dc.b	$31
	CSP_Jump	BGM05_PLR_00

BGM05_PLR_03:
	dc.b	$00, NL3
	CSP_Detune	$01

BGM05_PLR_02:
	dc.b	$2A, NL48
	dc.b	$27, NL24
	dc.b	$29
	dc.b	$2A, NL48
	dc.b	$27, NL24
	dc.b	$29, NL2
	dc.b	$2A
	dc.b	$29
	dc.b	$29, NL12
	dc.b	$25, NL6
	dc.b	$00
	dc.b	$22
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$31
	dc.b	$2E
	dc.b	$00
	dc.b	$20
	dc.b	$25
	dc.b	$29
	dc.b	$2C
	dc.b	$29
	dc.b	$31
	dc.b	$2C
	dc.b	$00
	dc.b	$1E
	dc.b	$23
	dc.b	$27
	dc.b	$2A
	dc.b	$27
	dc.b	$2F
	dc.b	$2A
	dc.b	$00
	dc.b	$1D
	dc.b	$22
	dc.b	$25
	dc.b	$29
	dc.b	$25
	dc.b	$2E
	dc.b	$29
	dc.b	$00
	dc.b	$1B
	dc.b	$1E
	dc.b	$23
	dc.b	$27
	dc.b	$23
	dc.b	$2A
	dc.b	$27
	dc.b	$00
	dc.b	$22
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$31
	dc.b	$2E
	dc.b	$00
	dc.b	$24
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$2C
	dc.b	$33
	dc.b	$30
	dc.b	$00
	dc.b	$29
	dc.b	$2C
	dc.b	$31
	dc.b	$35
	dc.b	$31
	dc.b	$38
	dc.b	$35
	CSP_Jump	BGM05_PLR_02

BGM05_PLR_05:
	dc.b	$00, NL4
	CSP_Detune	$04

BGM05_PLR_04:
	dc.b	$1E, NL12
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$17
	dc.b	$17
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$17
	dc.b	$17
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1D
	dc.b	$1D
	dc.b	$1D
	dc.b	$1D
	dc.b	$1B
	dc.b	$1B
	dc.b	$1B
	dc.b	$1B
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$17
	dc.b	$17
	dc.b	$17
	dc.b	$17
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$19
	CSP_Jump	BGM05_PLR_04
