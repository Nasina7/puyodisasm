    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    PlayArleAnim $6
    WaitTime $4
    MakeTextbox $5, $2a, $8, $3, $0
    PlayArleAnim $5
    
    dc.b    $9, $1a, $19, $b
    
    AddWhitespace
    WaitTime $1
    
    dc.b    $5, $5, $17, $2c, $7, $a, $2d, $7, $0, $18, $1e, $4, $1d, $25, $25, $25, $23
    
    PlayArleAnim $6
    WaitTime $6
    ClearTextbox
    MakeTextbox $13, $2a, $8, $3, $1
    PlayOpponentAnim $2
    
    dc.b    $c, $d, $0, $19, $26
    
    WaitTime $2
    TextboxNewLine
    PlayOpponentAnim $80
    PlayArleAnim $80
    PlayOpponentAnim $1
    
    dc.b    $2e, $2f, $f, $30, $31, $10
    
    TextboxNewLine
    
    dc.b    $b, $2, $6, $c, $0, $1c, $1, $26
    
    WaitTime $c
    ClearTextbox
    MakeTextbox $4, $30, $9, $1, $0
    PlayArleAnim $8
    
    dc.b    $c, $d, $12, $24, $28, $29, $e, $19, $26
    
    PlayArleAnim $7
    WaitTime $8
    ClearTextbox
    MakeTextbox $9, $2d, $e, $2, $1
    PlayOpponentAnim $2
    
    dc.b    $2e, $2f, $17, $28, $29, $12, $20, $16, $13, $8, $14, $b, $10, $24
    
    WaitTime $4
    
    dc.b    $32, $6, $c, $0, $1c, $1, $26
    
    PlayOpponentAnim $0
    WaitTime $c
    ClearTextbox
    MakeTextbox $11, $2a, $a, $3, $1
    PlayOpponentAnim $2
    
    dc.b    $27, $2a, $2b, $33, $11, $2, $1d, $15, $3, $f
    
    WaitTime $2
    
    dc.b    $2e, $2f, $f, $34, $13, $17
    
    AddWhitespace
    
    dc.b    $1, $4, $14, $1b, $0, $0, $1c, $1, $26
    
    PlayOpponentAnim $80
    PlayArleAnim $80
    PlayOpponentAnim $1
    WaitTime $10
    ClearTextbox
    EndCutscene
