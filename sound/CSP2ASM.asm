; =============================================================================
; CSP2ASM - Compile Sound Player to ASM	- by DaxKatter (based on original
; macro set by Nasina7)
; =============================================================================
; -----------------------------------------------------------------------------
; Note Equates
; -----------------------------------------------------------------------------
; TODO - Figure out how notes are mapped out
nRST		EQU	$00

; -----------------------------------------------------------------------------
; Note Duration Equates
; -----------------------------------------------------------------------------

CNL		EQU	$DE
NL1		EQU	$DF
NL2		EQU	$E0
NL3		EQU	$E1
NL4		EQU	$E2
NL6		EQU	$E3
NL8		EQU	$E4
NL12		EQU	$E5
NL16		EQU	$E6
NL24		EQU	$E7
NL32		EQU	$E8
NL48		EQU	$E9
NL9		EQU	$EA
NL18		EQU	$EB
NL30		EQU	$EC
NL36		EQU	$ED
NL42		EQU	$EE

; -----------------------------------------------------------------------------
; Drum Mapping Equates
; -----------------------------------------------------------------------------
; TODO - Figure out what Drum $05 & $06 are

dKick01		EQU	$C0
dSnare01	EQU	$C1
dSnare02	EQU	$C2
dSnare03	EQU	$C3
dHiHat		EQU	$C4
dUnkDrum05	EQU	$C5
dKick02		EQU	$C6
dBell		EQU	$C7
dHiTom		EQU	$C8
dMidHiTom	EQU	$C9
dMidTom		EQU	$CA
dMidLowTom	EQU	$CB
dLowTom		EQU	$CC
dFloorTom	EQU	$CD

; -----------------------------------------------------------------------------
; Panning Equates
; -----------------------------------------------------------------------------

panNone		EQU	$00
panRight	EQU	$40
panLeft		EQU	$80
panCentre	EQU	$C0
panCenter	EQU	$C0		; For American spelling

; -----------------------------------------------------------------------------
; Commands
; -----------------------------------------------------------------------------
;	MusCmd_Jump
CSP_Jump: macro loc
	dc.b	$80
	dc.w	((loc&$00ff)<<8)|(loc>>8)
	endm

;	MusCmd_DecTimerJPIfZero
CSP_LoopBack: macro index, loc
	dc.b	$81, index
	dc.w	((loc&$00ff)<<8)|(loc>>8)
	endm

;	MusCmd_StopChannel
CSP_Stop: macro
	dc.b 	$82
	endm

;	MusCmd_SetPitchEnvelope
CSP_PitchEnv: macro env
	dc.b	$83
	dc.b	env
	endm

;CSP_Cmd84:

;CSP_Cmd85:

;CSP_Cmd86:

;	MusCmd_SetVolume
CSP_SetVol: macro vol
	dc.b	$87
	dc.b	vol
	endm

CSP_VolEnv: macro env
	dc.b	$88
	dc.b	env
	endm

;	MusCmd_IncRootPitch
CSP_Transpose: macro amount
	dc.b	$89
	dc.b	amount
	endm

;	MusCmd_OffsetVolume
CSP_AlterVol: macro amount
	dc.b	$8A
	dc.b	amount
	endm

CSP_InsFM: macro inst
	dc.b	$8B
	dc.b	inst
	endm

;CSP_Cmd8C:

;	MusCmd_SetChRegToVal
CSP_LoopSet: macro index, cnt
	dc.b	$8D, index, cnt
	endm

;CSP_Cmd8E:

;CSP_Cmd8F:

;CSP_Cmd90:

;CSP_Cmd91:

;CSP_Cmd92:

;CSP_Cmd93:

;	MusCmd_Unk94
CSP_Cmd94: macro dat
	dc.b	$94
	dc.b	dat
	endm

;CSP_Cmd95:

;	MusCmd_SetChPlaybackSpeed
CSP_SetTempo: macro speed
	dc.b	$96
	dc.b	speed
	endm

;	MusCmd_SetMinorPitch
CSP_Detune: macro pitch
	dc.b	$97
	dc.b	pitch
	endm

;CSP_Cmd98:

;CSP_Cmd99:

;CSP_Cmd9A:

;CSP_Cmd9B:

;CSP_Cmd9C:

;CSP_Cmd9D:

;CSP_Cmd9E:

;	MusCmd_Unk9F
CSP_Pan: macro pan
	dc.b	$9F
	dc.b	pan
	endm

;CSP_CmdA0:

;CSP_CmdA1:

;CSP_CmdA2:

;CSP_CmdA3:

;CSP_CmdA4:

;CSP_CmdA5:

;CSP_CmdA6:

;CSP_CmdA7:

;CSP_CmdA8:

; -----------------------------------------------------------------------------
; Header
; -----------------------------------------------------------------------------
; TODO - Write a macro list for header information
; Header - Channel Count in the song
CSPHeader_ChanCnt: macro count
	dc.b	count
	endm

CSPHeader_StopPLR: macro plr
	dc.b	plr, $00
	endm

; Update these macros as it seems value two is a bit more complex
CSPHeader_ChanFM: macro plr, vol, volenv, modenv, trans, tempo, chan, loc, pan, inst
	dc.b	plr, $01
	dc.b	vol
	dc.b	volenv
	dc.b	modenv
	dc.b	trans
	dc.b	tempo
	dc.b	chan
	dc.w	((loc&$00ff)<<8)|(loc>>8)
	dc.b	pan
	dc.b	inst
	endm

CSPHeader_ChanDrum: macro plr, vol, tempo, chan, loc, pan, inst
	dc.b	plr, $02
	dc.b	vol
	dc.b	$00, $00, $00			; These aren't used for Drum Channels
	dc.b	tempo
	dc.b	chan
	dc.w	((loc&$00ff)<<8)|(loc>>8)
	dc.b	pan
	dc.b	inst
	endm

CSPHeader_Player: macro plr, chtype, vol, volenv, modenv, trans, tempo, chan, loc, pan, inst
	dc.b	plr
	dc.b	chtype
	dc.b	vol
	dc.b	volenv
	dc.b	modenv
	dc.b	trans
	dc.b	tempo
	dc.b	chan
	dc.w	((loc&$00ff)<<8)|(loc>>8)
	dc.b	pan
	dc.b	inst
	endm
; -----------------------------------------------------------------------------
