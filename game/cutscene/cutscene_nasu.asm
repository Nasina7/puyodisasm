	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

	PlayOpponentAnim $84
	
	PlayArleAnim arle_AnimCuriousIdle
	
	WaitTime 3
	
	dc.b    $81, $16, $D8, $88
	
	PlayArleAnim arle_AnimCuriousTalk
	
	dc.b    $02, $03, $0B, $0B, $0B, $0D
	
	PlayArleAnim arle_AnimCuriousIdle
	WaitTime 4
	ClearTextbox
	WaitTime 4
	
	dc.b    $81, $28, $D7, $06
	
	PlayArleAnim arle_AnimCuriousIdle
	
	dc.b    $0F, $0D, $0B, $0B, $0B
	
	PlayArleAnim arle_AnimCuriousTalk
	WaitTime 4
	
	dc.b    $86
	
	PlayArleAnim arle_AnimCuriousAngerTalk
	
	dc.b    $02, $07, $02, $04, $05, $08, $0C, $0D
	
	PlayArleAnim arle_AnimCuriousAnger
	WaitTime 4
	ClearTextbox
	WaitTime 3
	
	dc.b    $85, $83
	
	PlayArleAnim arle_AnimSurprise
	WaitTime 8
	
	dc.b	$81, $97, $D8, $AC
	dc.b    $02, $0E, $0E, $0E, $01, $08, $0C
	
	WaitTime 4
	ClearTextbox
	WaitTime 2
	
	dc.b    $81, $15, $D8, $8A
	dc.b    $06, $00, $00, $08, $0C
	
	WaitTime 4
	ClearTextbox
	EndCutscene