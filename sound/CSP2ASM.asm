; =============================================================================
; CSP2ASM - Compile Sound Player to ASM	- by DaxKatter (based on original
; macro set by Nasina7)
; =============================================================================
; -----------------------------------------------------------------------------
; Note Equates
; -----------------------------------------------------------------------------
; TODO - Figure out how notes are mapped out

; -----------------------------------------------------------------------------
; Note Duration Equates
; -----------------------------------------------------------------------------

NL0		EQU	$DE
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
; TODO - Figure out how the game calls drums

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
CSP_Jump: macro location
	dc.b	$80
	dc.w	((location&$00ff)<<8)|(location>>8)
	endm

;	MusCmd_DecTimerJPIfZero
CSP_LoopBack: macro index, location
	dc.b	$81, index
	dc.w	((location&$00ff)<<8)|(location>>8)
	endm

;	MusCmd_StopChannel
CSP_Stop: macro
	dc.b 	$82
	endm

;	MusCmd_SetPitchEnvelope
CSP_PitchEnv: macro envelope
	dc.b	$83
	dc.b	envelope
	endm

;	MusCmd_SetVolume
CSP_SetVol: macro vol
	dc.b	$87
	dc.b	vol
	endm

CSP_VolEnv: macro envelope
	dc.b	$88
	dc.b	envelope
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

CSP_InsFM: macro instrument
	dc.b	$8B
	dc.b	instrument
	endm

;	MusCmd_SetChRegToVal
CSP_LoopSet: macro index, count
	dc.b	$8D, index, count
	endm

;	MusCmd_Unk94
CSP_Cmd94: macro dat
	dc.b	$94
	dc.b	dat
	endm

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

;	MusCmd_Unk9F
CSP_Pan: macro pan
	dc.b	$9F
	dc.b	pan
	endm

; -----------------------------------------------------------------------------
; Header
; -----------------------------------------------------------------------------
; TODO - Write a macro list for header information
; -----------------------------------------------------------------------------
