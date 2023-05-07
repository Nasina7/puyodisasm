    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    MakeTextbox $10, $28, $9, $4, $1
    
    dc.b    $11, $27, $27, $27, $11, $11, $11
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $5, $1a, $c, $b, $5, $18, $10, $13, $1b, $a, $4, $16, $c, $1a, $a, $25
    
    WaitTime $3
    TextboxNewLine
    PlayArleAnim $15
    
    dc.b    $c, $1a, $a, $2, $20, $3, $6, $1a, $24
    
    WaitTime $4
    ClearTextbox
    MakeTextbox $2, $2e, $9, $2, $0
    PlayArleAnim $2
    
    dc.b    $8, $1a, $c, $e, $25
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $21, $4, $e, $28, $29, $1e, $14, $1b, $26
    
    PlayArleAnim $15
    WaitTime $2
    PlayOpponentAnim $1
    WaitTime $4
    ClearTextbox
    MakeTextbox $e, $2b, $b, $3, $1
    PlayOpponentAnim $2
    
    dc.b    $1f, $f, $25, $8, $17, $c, $15, $d
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $19, $9, $4, $7, $1d
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $2, $2a, $29, $0, $9, $7, $12, $7, $1c, $1, $24
    
    PlayOpponentAnim $3
    WaitTime $4
    ClearTextbox
    MakeTextbox $14, $31, $8, $1, $1
    PlayOpponentAnim $0
    
    dc.b    $11, $27, $27, $11, $11, $11, $11, $24
    
    WaitTime $4
    ClearTextbox
    EndCutscene
