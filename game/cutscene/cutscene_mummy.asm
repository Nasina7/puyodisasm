    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    PlayArleAnim $6
    WaitTime $4
    MakeTextbox $6, $31, $6, $1, $0
    
    dc.b    $2, $2, $2, $2, $2, $3
    
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $12, $2e, $9, $2, $1
    
    dc.b    $8, $8, $8, $0, $1b, $5, $12, $9, $d
    
    WaitTime $1
    
    dc.b    $1c, $e, $17, $9, $2, $2, $2, $2, $7
    
    WaitTime $6
    ClearTextbox
    PlayOpponentAnim $1
    WaitTime $4
    PlayOpponentAnim $3
    MakeTextbox $12, $2b, $8, $3, $1
    
    dc.b    $c, $1c, $b, $19, $11, $9, $16
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $1b, $5, $12, $9, $d
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $1c, $e, $17, $9, $19, $1f, $f, $4
    
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $2, $2e, $8, $2, $0
    PlayArleAnim $2
    PlayOpponentAnim $2
    
    dc.b    $17, $21, $16
    
    WaitTime $2
    
    dc.b    $1, $8, $12, $10, $19, $11, $9, $17, $19, $1f, $4
    
    PlayArleAnim $15
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $12, $2b, $9, $3, $1
    PlayOpponentAnim $5
    
    dc.b    $c, $1c, $b, $17, $21, $15, $1
    
    WaitTime $2
    TextboxNewLine
    
    dc.b    $1a, $1f, $1a, $1f, $19, $22, $18, $a, $1d, $14, $1e, $a, $21, $13, $20, $f, $4
    
    PlayOpponentAnim $4
    WaitTime $6
    ClearTextbox
    EndCutscene
