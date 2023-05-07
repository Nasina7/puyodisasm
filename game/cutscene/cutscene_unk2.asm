    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    PlayOpponentAnim $9
    WaitTime $2
    MakeTextbox $a, $2d, $a, $2, $1
    PlayOpponentAnim $6
    
    dc.b    $1d, $6, $0
    
    PlayOpponentAnim $9
    WaitTime $2
    PlayOpponentAnim $6
    
    dc.b    $21, $b, $d, $d, $1e, $16, $2a, $22, $d, $17, $9, $16, $a, $12, $18, $1
    
    PlayOpponentAnim $9
    WaitTime $8
    ClearTextbox
    WaitTime $2
    MakeTextbox $7, $2d, $d, $2, $1
    PlayOpponentAnim $6
    
    dc.b    $28, $3, $0, $1f, $b, $1c, $14, $15, $5, $12, $2, $2, $2
    
    PlayOpponentAnim $9
    WaitTime $4
    PlayOpponentAnim $6
    
    dc.b    $17, $5, $6, $17, $d, $23, $8, $1
    
    PlayOpponentAnim $9
    WaitTime $8
    ClearTextbox
    WaitTime $2
    MakeTextbox $f, $30, $5, $1, $1
    PlayOpponentAnim $2
    
    dc.b    $1e, $4, $5, $5, $1
    
    PlayOpponentAnim $3
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $c, $2d, $8, $2, $1
    PlayOpponentAnim $6
    
    dc.b    $d, $d, $19, $0, $1b, $17, $1e, $10, $1b, $a, $e, $9, $23, $6, $1
    
    PlayOpponentAnim $9
    WaitTime $6
    CutUnkCommand2
    PlayOpponentAnim $2
    
    dc.b    $13, $9, $0
    
    PlayOpponentAnim $3
    WaitTime $2
    PlayOpponentAnim $2
    
    dc.b    $27, $19, $25, $29, $20, $26, $5, $11, $1
    
    PlayOpponentAnim $3
    WaitTime $6
    ClearTextbox
    WaitTime $2
    MakeTextbox $9, $2d, $b, $2, $1
    PlayOpponentAnim $2
    
    dc.b    $27, $24, $12, $7, $f, $12, $b, $1a, $0
    
    PlayOpponentAnim $3
    WaitTime $4
    TextboxNewLine
    PlayOpponentAnim $2
    
    dc.b    $7, $5, $8, $c, $15, $b, $22, $9, $21, $5, $1
    
    PlayOpponentAnim $3
    WaitTime $6
    ClearTextbox
    PlayOpponentAnim $a
    WaitTime $1
    PlayOpponentAnim $8b
    WaitTime $18
    EndCutscene
