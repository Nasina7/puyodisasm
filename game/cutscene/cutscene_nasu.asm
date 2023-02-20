	; ??????
	; Wouldn't $85, $84 be invalid???
	dc.b	$85
	dc.b    $84
	
	cutscene_PlayArleAnim arle_AnimCuriousIdle
	
	cutscene_WaitTime 3
	
	dc.b    $81, $16, $D8, $88
	
	cutscene_PlayArleAnim arle_AnimCuriousTalk
	
	dc.b    $02, $03, $0B, $0B, $0B, $0D
	
	cutscene_PlayArleAnim arle_AnimCuriousIdle
	cutscene_WaitTime 4
	cutscene_ClearTextbox
	cutscene_WaitTime 4
	
	dc.b    $81, $28, $D7, $06
	
	cutscene_PlayArleAnim arle_AnimCuriousIdle
	
	dc.b    $0F, $0D, $0B, $0B, $0B
	
	cutscene_PlayArleAnim arle_AnimCuriousTalk
	cutscene_WaitTime 4
	
	dc.b    $86
	
	cutscene_PlayArleAnim arle_AnimCuriousAngerTalk
	
	dc.b    $02, $07, $02, $04, $05, $08, $0C, $0D
	
	cutscene_PlayArleAnim arle_AnimCuriousAnger
	cutscene_WaitTime 4
	cutscene_ClearTextbox
	cutscene_WaitTime 3
	
	dc.b    $85, $83
	
	cutscene_PlayArleAnim arle_AnimSurprise
	cutscene_WaitTime 8
	
	dc.b	$81, $97, $D8, $AC
	dc.b    $02, $0E, $0E, $0E, $01, $08, $0C
	
	cutscene_WaitTime 4
	cutscene_ClearTextbox
	cutscene_WaitTime 2
	
	dc.b    $81, $15, $D8, $8A
	dc.b    $06, $00, $00, $08, $0C
	
	cutscene_WaitTime 4
	cutscene_ClearTextbox
	cutscene_endCutscene