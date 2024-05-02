    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    MakeTextbox $c, $28, $8, $4, $1
    
    dc.b    $15, $4, $27
    
    WaitTime $3
    TextboxNewLine
    
    dc.b    $31, $13, $32, $33, $6, $d, $1, $b, $34, $10, $35, $3, $11, $1, $d
    
    WaitTime $3
    TextboxNewLine
    
    dc.b    $7, $7, $16, $21, $36, $b, $5, $26
    
    WaitTime $6
    ClearTextbox
    MakeTextbox $2, $2d, $8, $2, $0
    PlayArleAnim $a
    
    dc.b    $a, $24, $24, $24
    
    PlayArleAnim $b
    WaitTime $2
    TextboxNewLine
    PlayArleAnim $a
    
    dc.b    $a, $13, $2c, $2f, $2e, $14, $1e, $28
    
    PlayArleAnim $b
    WaitTime $6
    ClearTextbox
    PlayOpponentAnim $85
    WaitTime $24
    MakeTextbox $e, $2a, $b, $3, $1
    PlayOpponentAnim $2
    
    dc.b    $2, $2, $2, $17, $26
    
    PlayOpponentAnim $3
    WaitTime $2
    TextboxNewLine
    PlayOpponentAnim $2
    
    dc.b    $23, $19, $23, $19, $37, $38, $1c, $11, $6, $d, $36, $1b, $e, $14
    
    AddWhitespace
    PlayOpponentAnim $3
    WaitTime $2
    PlayOpponentAnim $2
    
    dc.b    $8, $9, $1f, $20, $f, $28
    
    PlayOpponentAnim $3
    WaitTime $8
    ClearTextbox
    PlayArleAnim $e
    WaitTime $2
    MakeTextbox $6, $30, $4, $1, $0
    
    PlayArleAnim $10
    PlayOpponentAnim $4
    
    dc.b    $2b, $30, $2d, $28
    
    PlayArleAnim $11
    WaitTime $2
    ClearTextbox
    WaitTime $2
    MakeTextbox $10, $30, $9, $1, $1
    PlayOpponentAnim $5
    
    dc.b    $c, $1e, $1f, $2a, $2a, $2, $28, $28, $28
    
    PlayOpponentAnim $8
    WaitTime $3
    ClearTextbox
    MakeTextbox $1, $2a, $b, $3, $0
    PlayArleAnim $10
    
    dc.b    $2b, $2d, $30, $28
    
    PlayArleAnim $11
    WaitTime $4
    TextboxNewLine
    PlayArleAnim $10
    
    dc.b    $18, $1e, $22, $1a, $0, $1d, $b, $1f
    
    TextboxNewLine
    
    dc.b    $32, $33, $6, $b, $34, $20, $1e, $b, $13, $12, $28
    
    PlayArleAnim $11
    WaitTime $6
    ClearTextbox
    MakeTextbox $16, $30, $7, $1, $1
    PlayOpponentAnim $6
    
    dc.b    $a, $13, $e, $4, $1a, $1e, $28
    
    PlayOpponentAnim $9
    WaitTime $2
    ClearTextbox
    MakeTextbox $1, $2d, $c, $2, $0
    PlayArleAnim $10
    
    dc.b    $f, $27, $f, $1d, $21
    
    PlayArleAnim $11
    WaitTime $1
    TextboxNewLine
    PlayArleAnim $10
    
    dc.b    $7, $1d, $f, $7, $e, $9, $1b, $13, $19, $1e, $28, $29
    
    PlayArleAnim $11
    WaitTime $4
    ClearTextbox
    MakeTextbox $14, $30, $8, $1, $1
    PlayOpponentAnim $6
    
    dc.b    $b, $1d, $f, $1b, $39, $3a, $20, $26
    
    PlayOpponentAnim $9
    WaitTime $2
    ClearTextbox
    MakeTextbox $4, $30, $5, $1, $0
    PlayArleAnim $3
    
    dc.b    $20, $0, $0, $0, $28
    
    PlayArleAnim $81
    WaitTime $4
    ClearTextbox
    MakeTextbox $c, $2a, $c, $3, $1
    PlayOpponentAnim $6
    
    dc.b    $21, $14, $27
    
    PlayOpponentAnim $9
    TextboxNewLine
    WaitTime $1
    PlayOpponentAnim $6
    
    dc.b    $3b, $3d, $3b, $3c, $13, $23, $19, $23, $19, $37, $38, $10, $3e, $16, $1e, $d
    
    PlayOpponentAnim $7
    
    dc.b    $3f, $c, $14, $d, $19, $1e, $28
    
    WaitTime $6
    ClearTextbox
    EndCutscene
