    include "cutscene/macros.asm"
    include "cutscene/constants.asm"

    PlayArleAnim $6
    WaitTime $6
    PlayArleAnim $5
    MakeTextbox $3, $31, $b, $1, $0
    
    dc.b    $0, $3, $12, $12, $12, $11
    
    PlayArleAnim $6
    WaitTime $1
    PlayArleAnim $5
    
    dc.b    $6, $1, $6, $1, $14
    
    PlayArleAnim $4
    WaitTime $4
    ClearTextbox
    WaitTime $6
    MakeTextbox $6, $31, $5, $1, $0
    PlayArleAnim $5
    
    dc.b    $6, $1, $6, $1, $14
    
    PlayArleAnim $6
    WaitTime $4
    ClearTextbox
    WaitTime $2
    MakeTextbox $8, $2d, $e, $2, $1
    PlayOpponentAnim $2
    
    dc.b    $e, $15, $15, $15, $b, $b, $b, $13, $e, $9, $e, $b
    
    WaitTime $2
    PlayArleAnim $9
    TextboxNewLine
    
    dc.b    $16, $7, $3, $d, $c, $5, $a, $2, $8, $17, $4, $b, $b, $13
    
    PlayOpponentAnim $3
    WaitTime $6
    ClearTextbox
    EndCutscene
