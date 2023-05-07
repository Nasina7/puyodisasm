    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    PlayArleAnim $b
    WaitTime $4
    MakeTextbox $4, $2e, $8, $2, $0
    PlayArleAnim $a
    
    dc.b    $5, $11, $11, $11, $5, $7, $1, $12
    
    PlayArleAnim $b
    WaitTime $2
    PlayArleAnim $a
    
    dc.b    $6, $9, $13, $1, $a, $11, $11, $11
    
    PlayArleAnim $b
    WaitTime $4
    ClearTextbox
    WaitTime $6
    MakeTextbox $14, $31, $8, $1, $1
    
    dc.b    $2, $e, $3
    
    PlayOpponentAnim $86
    PlayOpponentAnim $87
    PlayOpponentAnim $1
    
    dc.b    $3, $3, $3, $3, $12
    
    PlayArleAnim $3
    WaitTime $6
    ClearTextbox
    WaitTime $2
    MakeTextbox $2, $31, $8, $1, $0
    
    dc.b    $c, $0, $0, $0, $0, $0, $d, $12
    
    WaitTime $4
    ClearTextbox
    WaitTime $3
    MakeTextbox $12, $2e, $9, $2, $1
    
    dc.b    $6, $6, $4, $b, $14, $a
    
    WaitTime $3
    TextboxNewLine
    
    dc.b    $15, $7, $8, $0, $1, $1, $1, $1, $12
    
    WaitTime $4
    ClearTextbox
    EndCutscene
