MusCmd_Jump: macro location
	dc.b	$80
	dc.w ((location&$00ff)<<8)|(location>>8)
    endm

MusCmd_DecTimerJPIfZero: macro timer, location
    dc.b    $81, timer
    dc.w ((location&$00ff)<<8)|(location>>8)
    endm

; Likely a stop playing command
MusCmd_StopChannel: macro
	dc.b 	$82
	endm

MusCmd_SetPitchEnvelope: macro amount
	dc.b	$83
	dc.b	amount
	endm

MusCmd_SetVolume: macro vol
    dc.b    $87
    dc.b    vol
    endm
	
MusCmd_IncRootPitch: macro amount
	dc.b	$89
	dc.b	amount
	endm
	
MusCmd_OffsetVolume: macro amount
    dc.b    $8A
    dc.b    amount
    endm

MusCmd_SetChRegToVal: macro reg, value
    dc.b    $8D, reg, value
    endm

MusCmd_Unk94: macro dat
	dc.b	$94
	dc.b	dat
	endm

MusCmd_SetChPlaybackSpeed: macro speed
    dc.b    $96
    dc.b    speed
    endm
	
MusCmd_SetMinorPitch: macro pitch
	dc.b	$97
	dc.b	pitch
	endm
	
MusCmd_Unk9F: macro dat
	dc.b	$9F
	dc.b	dat
	endm
