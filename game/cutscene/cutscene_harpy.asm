	include "game/cutscene/macros.asm"
	include "game/cutscene/constants.asm"

    PlayOpponentAnim $81
    PlayOpponentAnim $82
    WaitTime $8
    PlayOpponentAnim $1
    WaitTime $4
    PlayOpponentAnim $0
    MakeTextbox $2, $2b, $a, $3, $0
    PlayArleAnim $a
	
    dc.b    $7, $e, $e, $12
	
    PlayArleAnim $b
    WaitTime $2
    TextboxNewLine
    PlayArleAnim $a
	
    dc.b    $2, $d, $6, $2, $5, $c, $3, $4, $0, $b, $14, $15, $f, $7
	
    AddWhitespace
	
    dc.b    $6, $0, $e, $e, $13
	
    PlayArleAnim $b
    WaitTime $6
    ClearTextbox
    PlayArleAnim $e
    WaitTime $4
    MakeTextbox $1, $31, $c, $1, $0
    PlayArleAnim $10
	
    dc.b    $2, $2, $c, $16, $3, $4, $8, $a, $1, $9, $e, $13
	
    PlayArleAnim $11
    WaitTime $6
    ClearTextbox
    EndCutscene
