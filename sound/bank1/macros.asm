MusCmd_Jump: macro location
	dc.b	$80
	dc.w ((location&$00ff)<<8)|(location>>8)
	endm

; Likely a stop playing command
MusCmd_Unk82: macro
	dc.b 	$82
	endm

MusCmd_SetPitchEnvelope: macro amount
	dc.b	$83
	dc.b	amount
	endm
	
MusCmd_IncRootPitch: macro amount
	dc.b	$89
	dc.b	amount
	endm
	
MusCmd_Unk94: macro dat
	dc.b	$94
	dc.b	dat
	endm
	
MusCmd_SetMinorPitch: macro pitch
	dc.b	$97
	dc.b	pitch
	endm
	
MusCmd_Unk9F: macro dat
	dc.b	$9F
	dc.b	dat
	endm