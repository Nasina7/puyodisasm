    include "cutscene/macros.asm"
    include "cutscene/constants.asm"

    WaitTime $4
    PlayOpponentAnim $1
    WaitTime $8
    MakeTextbox $16, $2e, $7, $2, $1
    
    dc.b    $14, $14, $14, $14, $14, $20
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $4, $22, $28, $2, $10, $1, $1f
    
    PlayOpponentAnim $0
    WaitTime $4
    ClearTextbox
    MakeTextbox $8, $31, $6, $1, $0
    
    dc.b    $29, $29, $29, $29, $29, $1f
    
    WaitTime $4
    ClearTextbox
    MakeTextbox $b, $2e, $d, $2, $1
    PlayOpponentAnim $0
    
    dc.b    $4, $4, $15
    
    AddWhitespace
    
    dc.b    $22, $23, $21
    
    WaitTime $4
    TextboxNewLine
    PlayOpponentAnim $3
    
    dc.b    $f, $29, $29, $29, $10, $1, $15, $9, $b, $29, $29, $29, $1f
    
    WaitTime $6
    ClearTextbox
    MakeTextbox $10, $2e, $a, $2, $1
    
    dc.b    $7, $d, $24, $25
    
    WaitTime $1
    TextboxNewLine
    
    dc.b    $17, $1b, $d, $1, $9, $16, $6, $16, $b, $1f
    
    WaitTime $4
    ClearTextbox
    MakeTextbox $12, $2e, $9, $2, $1
    
    dc.b    $4, $26, $c, $e
    
    WaitTime $1
    PlayOpponentAnim $2
    PlayArleAnim $3
    
    dc.b    $27, $3, $a, $11, $12, $4, $2, $5, $0, $0, $0, $0, $21
    
    WaitTime $4
    ClearTextbox
    MakeTextbox $2, $2e, $e, $2, $0
    
    dc.b    $13, $0, $21
    
    TextboxNewLine
    WaitTime $1
    
    dc.b    $8, $14, $b, $1a, $19, $1c, $18, $19, $1c, $b, $0, $0, $15, $21
    
    WaitTime $6
    ClearTextbox
    EndCutscene
