	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

    WaitTime $2
    MakeTextbox $16, $2d, $7, $2, $1
    PlayOpponentAnim $1
    
	dc.b    $2b, $2c, $2f, $32, $13
	
    AddWhitespace
    
	dc.b    $0, $c, $9, $12, $16, $12, $18, $28
	
    PlayOpponentAnim $2
    WaitTime $4
    CutUnkCommand2
    PlayOpponentAnim $1
    
	dc.b    $0, $4, $19, $15, $d, $33, $1a, $f, $8, $1, $25
	
    PlayOpponentAnim $2
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $7, $30, $4, $1, $0
    PlayArleAnim $1
    
	dc.b    $2e, $2e, $2a, $29
	
    PlayArleAnim $0
    WaitTime $3
    ClearTextbox
    MakeTextbox $16, $2d, $7, $2, $1
    PlayOpponentAnim $3
    
	dc.b    $7, $7, $3, $19, $34, $14, $13, $35, $3, $b, $f, $1, $1d, $25
	
    PlayOpponentAnim $4
    WaitTime $4
    ClearTextbox
    MakeTextbox $c, $2d, $c, $2, $1
    PlayOpponentAnim $3
    
	dc.b    $2b, $2c, $2f, $32, $e, $13
	
    PlayOpponentAnim $2
    WaitTime $1
    TextboxNewLine
    PlayOpponentAnim $3
    
	dc.b    $0, $c, $9, $20, $36, $37, $a, $1b, $12, $18, $30, $28
	
    PlayOpponentAnim $4
    WaitTime $6
    ClearTextbox
    WaitTime $2
    MakeTextbox $7, $30, $4, $1, $0
    PlayArleAnim $1
    
	dc.b    $2b, $2c, $2f, $29
	
    PlayArleAnim $0
    WaitTime $3
    ClearTextbox
    MakeTextbox $c, $2d, $c, $2, $1
    PlayOpponentAnim $3
    
	dc.b    $e, $22, $6, $c, $1f, $d, $2d, $31, $18, $28
	
    PlayOpponentAnim $4
    WaitTime $3
    TextboxNewLine
    PlayOpponentAnim $7
    
	dc.b    $17, $1b, $b, $f, $1, $1d, $0, $0, $0, $28, $28, $28
	
    WaitTime $6
    ClearTextbox
    WaitTime $2
    MakeTextbox $3, $30, $8, $1, $0
    
	dc.b    $0, $26
	
    WaitTime $1
    PlayArleAnim $8
    
	dc.b    $0, $12, $2, $27, $27, $27
	
    PlayArleAnim $7
    WaitTime $4
    ClearTextbox
    MakeTextbox $16, $30, $6, $1, $1
    PlayOpponentAnim $5
    PlayArleAnim $d
    
	dc.b    $38, $39, $3a, $3b, $30, $28
	
    PlayOpponentAnim $6
    WaitTime $3
    ClearTextbox
    MakeTextbox $c, $2a, $c, $3, $1
    PlayOpponentAnim $5
    
	dc.b    $2b, $2c, $2f, $32, $10, $3c, $1, $c, $6, $1c, $21, $26
	
    PlayOpponentAnim $6
    WaitTime $1
    PlayOpponentAnim $5
    
	dc.b    $0, $c, $9, $1e, $3d, $9, $d, $35, $5, $7, $e, $11, $1f, $28
	
    PlayOpponentAnim $6
    WaitTime $6
    ClearTextbox
    EndCutscene
