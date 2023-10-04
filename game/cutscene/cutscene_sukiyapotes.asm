    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    WaitTime $3
    MakeTextbox $18, $2e, $6, $2, $1
    PlayOpponentAnim $1
    
    dc.b    $17, $17, $17
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $26, $11, $12, $10, $f, $1
    
    PlayOpponentAnim $0
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $6, $2e, $6, $2, $0
    PlayArleAnim $3
    
    dc.b    $7, $1b, $4, $0
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $9, $11, $c, $15, $25, $1
    
    WaitTime $4
    ClearTextbox
    MakeTextbox $14, $2b, $7, $3, $1
    PlayOpponentAnim $3
    
    dc.b    $b, $4, $1d, $3
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $21, $11, $12, $16, $15, $1a, $1d, $e, $14, $1c, $2, $2, $2, $1
    
    PlayOpponentAnim $2
    WaitTime $8
    ClearTextbox
    MakeTextbox $14, $2e, $8, $2, $1
    PlayArleAnim $b
    PlayOpponentAnim $4
    
    dc.b    $d, $1a, $8, $11, $3
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $22, $23, $28, $1e, $4, $20, $1f, $3
    
    WaitTime $4
    ClearTextbox
    PlayOpponentAnim $8a
    PlayArleAnim $f
    WaitTime $4
    PlayArleAnim $12
    MakeTextbox $4, $2b, $8, $3, $0
    
    dc.b    $26, $11, $12, $3
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $10, $10, $a, $7, $15, $1a, $18, $19, $18, $19, $13, $24, $27, $11, $3
    
    PlayArleAnim $13
    WaitTime $4
    ClearTextbox
    EndCutscene
