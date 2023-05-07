	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

    WaitTime $2
    MakeTextbox $2, $30, $9, $1, $0
    PlayArleAnim $2
	
    dc.b    $e, $19, $10, $16, $2, $e, $10, $1a, $25
	
    PlayArleAnim $15
    WaitTime $4
    ClearTextbox
    MakeTextbox $16, $30, $7, $1, $1
    PlayOpponentAnim $1
	
    dc.b    $4, $2d, $1b, $2e, $9, $1, $22
	
    PlayOpponentAnim $0
    WaitTime $4
    ClearTextbox
    MakeTextbox $4, $30, $6, $1, $0
    PlayArleAnim $c
	
    dc.b    $3, $3, $1a, $1a, $25, $26
	
    WaitTime $4
    ClearTextbox
    PlayOpponentAnim $2
    WaitTime $6
    PlayOpponentAnim $1
    MakeTextbox $a, $2d, $d, $2, $1
	
    dc.b    $13, $d, $1, $23
	
    PlayOpponentAnim $0
    TextboxNewLine
    WaitTime $2
    PlayOpponentAnim $1
	
    dc.b    $4, $2d, $10, $2f, $1b
	
    AddWhitespace
	
    dc.b    $2e, $9, $1, $1e, $7, $1e, $22
	
    PlayOpponentAnim $0
    WaitTime $6
    ClearTextbox
    MakeTextbox $1, $2a, $e, $3, $0
    PlayArleAnim $2
	
    dc.b    $24, $24, $24, $1, $1, $5, $1c, $19, $f, $9, $c, $16, $1a, $25
	
    PlayArleAnim $15
    WaitTime $2
    PlayArleAnim $e
	
    dc.b    $0, $19, $b, $23
	
    WaitTime $4
    TextboxNewLine
    PlayArleAnim $10
	
    dc.b    $12, $1e, $a, $19, $e, $8, $d, $14, $1a, $c, $19, $10, $25, $26
	
    PlayArleAnim $11
    WaitTime $6
    ClearTextbox
    MakeTextbox $e, $2a, $b, $3, $1
    PlayOpponentAnim $1
	
    dc.b    $4, $2d, $10, $30, $2f, $18, $31, $32, $9, $23
	
    PlayOpponentAnim $0
    TextboxNewLine
    WaitTime $1
    PlayOpponentAnim $1
	
    dc.b    $8, $10, $33, $10, $30, $34, $35
	
    PlayOpponentAnim $0
    WaitTime $1
    TextboxNewLine
    PlayOpponentAnim $1
	
    dc.b    $28, $2a, $2c, $24, $27, $29, $2b, $29, $29, $36, $1b
	
    PlayOpponentAnim $0
    WaitTime $6
    CutUnkCommand2
    PlayOpponentAnim $1
	
    dc.b    $1f, $16, $1f, $16, $37, $38, $10
	
    PlayOpponentAnim $0
    TextboxNewLine
    WaitTime $1
    PlayOpponentAnim $1
	
    dc.b    $39, $3a, $d, $e, $17, $10, $1e, $1a, $1a, $25
	
    PlayOpponentAnim $0
    WaitTime $6
    ClearTextbox
    MakeTextbox $4, $30, $4, $1, $0
    PlayArleAnim $14
	
    dc.b    $11, $0, $25, $26
	
    WaitTime $2
    ClearTextbox
    MakeTextbox $1a, $30, $5, $1, $1
    PlayOpponentAnim $3
	
    dc.b    $15, $6, $1d, $1a, $25
	
    WaitTime $2
    ClearTextbox
    EndCutscene
