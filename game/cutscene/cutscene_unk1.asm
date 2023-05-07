	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

    PlayOpponentAnim $89
    PlayArleAnim $6
    WaitTime $6
    MakeTextbox $8, $30, $3, $1, $0
    
	dc.b    $0, $2
	
    WaitTime $6
    ClearTextbox
    WaitTime $4
    PlayOpponentAnim $6
    WaitTime $8
    PlayOpponentAnim $1
    MakeTextbox $14, $2e, $8, $2, $1
    
	dc.b    $1b, $26, $18, $0, $c, $1a, $23, $1b, $9, $26, $14, $22, $b, $3
	
    PlayOpponentAnim $2
    WaitTime $4
    ClearTextbox
    WaitTime $1
    PlayArleAnim $a
    MakeTextbox $6, $2e, $6, $2, $0
    
	dc.b    $2b, $23, $1b, $9, $22, $1
	
    WaitTime $2
    
	dc.b    $13, $26, $1b, $f, $19, $6
	
    PlayArleAnim $b
    WaitTime $4
    ClearTextbox
    WaitTime $1
    MakeTextbox $12, $2b, $9, $3, $1
    PlayOpponentAnim $3
    
	dc.b    $10, $17, $1d, $1
	
    WaitTime $2
    TextboxNewLine
    
	dc.b    $27, $d, $10, $16, $17, $26, $14, $25, $3
	
    WaitTime $3
    
	dc.b    $27, $d, $10, $16, $17, $26, $1b, $4, $6
	
    PlayOpponentAnim $4
    WaitTime $3
    ClearTextbox
    MakeTextbox $4, $2e, $6, $2, $0
    PlayArleAnim $2
    
	dc.b    $28, $2e, $11, $15, $20, $a, $1b, $7, $0
	
    WaitTime $1
    
	dc.b    $1f, $a, $6
	
    PlayArleAnim $15
    WaitTime $3
    ClearTextbox
    WaitTime $1
    MakeTextbox $12, $2b, $9, $3, $1
    PlayOpponentAnim $3
    
	dc.b    $1e, $d, $1c, $2c, $18, $c, $1a, $23, $1b, $9, $1b, $26, $17
	
    WaitTime $2
    TextboxNewLine
    
	dc.b    $21, $24, $12, $1b
	
    PlayOpponentAnim $5
    
	dc.b    $9, $8, $8, $8, $3
	
    WaitTime $4
    ClearTextbox
    PlayArleAnim $e
    WaitTime $4
    PlayArleAnim $10
    MakeTextbox $8, $2e, $5, $2, $0
    
	dc.b    $2a, $2d, $1b, $23, $29, $e, $24, $22, $3
	
    PlayArleAnim $11
    WaitTime $3
    ClearTextbox
    EndCutscene
