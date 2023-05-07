	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

    WaitTime $2
    MakeTextbox $10, $31, $a, $1, $1
    PlayOpponentAnim $2
    
	dc.b    $18, $11, $1c
	
    WaitTime $2
    PlayOpponentAnim $1
    
	dc.b    $12, $13, $6, $16, $2, $c, $1b
	
    PlayOpponentAnim $3
    WaitTime $4
    ClearTextbox
    MakeTextbox $4, $2e, $8, $2, $0
    PlayArleAnim $2
    
	dc.b    $e, $1e
	
    AddWhitespace
    PlayArleAnim $15
    WaitTime $1
    PlayArleAnim $5
    
	dc.b    $e, $0, $1d, $1d, $1d
	
    PlayArleAnim $6
    WaitTime $1
    PlayArleAnim $5
    
	dc.b    $12, $13, $6, $4, $1b
	
    PlayArleAnim $6
    WaitTime $4
    ClearTextbox
    MakeTextbox $e, $2b, $b, $3, $1
    PlayOpponentAnim $1
    
	dc.b    $0, $14, $5, $14, $d, $25, $26, $5, $8, $a, $1, $9, $17, $3, $10, $7, $1b
	
    WaitTime $2
    TextboxNewLine
    
	dc.b    $20, $21, $23, $22, $24, $1c, $1, $1, $10, $7, $1b
	
    PlayOpponentAnim $0
    WaitTime $4
    ClearTextbox
    MakeTextbox $e, $31, $b, $1, $1
    PlayOpponentAnim $1
    
	dc.b    $f, $b, $1c
	
    WaitTime $1
    
	dc.b    $1, $3, $10, $15, $8, $1f, $1f, $1b
	
    PlayOpponentAnim $4
    WaitTime $4
    ClearTextbox
    EndCutscene
