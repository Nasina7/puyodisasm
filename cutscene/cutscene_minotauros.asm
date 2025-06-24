    include "cutscene/macros.asm"
    include "cutscene/constants.asm"

    PlayOpponentAnim $1
    PlayArleAnim $b
    MakeTextbox $14, $30, $7, $1, $1
    
    dc.b    $d, $3, $3, $3, $3, $3, $1e
    
    WaitTime $4
    ClearTextbox
    WaitTime $6
    MakeTextbox $2, $2d, $8, $2, $0
    PlayArleAnim $a
    
    dc.b    $25, $24, $23, $21, $27, $22, $1e
    
    PlayArleAnim $b
    WaitTime $4
    ResetTextbox
    PlayArleAnim $a
    
    dc.b    $b, $c, $6, $13, $f, $10, $14, $1e
    
    PlayArleAnim $b
    WaitTime $2
    PlayArleAnim $a
    
    dc.b    $28, $b, $1, $17, $15, $b, $1, $1e
    
    PlayArleAnim $b
    WaitTime $4
    ClearTextbox
    MakeTextbox $12, $30, $8, $1, $1
    PlayOpponentAnim $2
    
    dc.b    $26, $26, $20, $29, $f, $2a, $2b, $18
    
    PlayOpponentAnim $0
    WaitTime $4
    PlayOpponentAnim $3
    PlayOpponentAnim $88
    ClearTextbox
    MakeTextbox $1, $30, $c, $1, $0
    PlayArleAnim $a
    
    dc.b    $9, $1d, $9, $16, $14, $a, $2c, $14, $8, $0, $0, $1e
    
    PlayArleAnim $f
    WaitTime $c
    ClearTextbox
    MakeTextbox $2, $2a, $9, $3, $0
    PlayOpponentAnim $3
    PlayArleAnim $12
    
    dc.b    $17, $15, $0, $1d
    
    PlayArleAnim $13
    WaitTime $4
    ResetTextbox
    PlayArleAnim $12
    
    dc.b    $4, $f, $1a, $10, $1a, $10, $2d, $2e, $19, $2f, $3, $2, $1e
    
    PlayArleAnim $13
    WaitTime $6
    TextboxNewLine
    PlayArleAnim $12
    
    dc.b    $7, $30, $19, $1, $1, $12, $e, $1e, $1f
    
    PlayArleAnim $13
    WaitTime $8
    ClearTextbox
    PlayOpponentAnim $0
    WaitTime $4
    MakeTextbox $e, $30, $3, $1, $1
    PlayOpponentAnim $2
    
    dc.b    $10, $5, $1e
    
    PlayOpponentAnim $0
    WaitTime $3
    ClearTextbox
    EndCutscene
