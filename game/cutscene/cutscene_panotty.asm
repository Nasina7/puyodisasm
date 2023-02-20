    cutscene_WaitTime $3
    cutscene_MakeTextbox $18, $2e, $6, $2, $1
    cutscene_PlayOpponentAnim $1
    dc.b    $17, $17, $17
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $26, $11, $12, $10, $f, $1
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $6, $2e, $6, $2, $0
    cutscene_PlayArleAnim $3
    dc.b    $7, $1b, $4, $0
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $9, $11, $c, $15, $25, $1
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $14, $2b, $7, $3, $1
    cutscene_PlayOpponentAnim $3
    dc.b    $b, $4, $1d, $3
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $21, $11, $12, $16, $15, $1a, $1d, $e, $14, $1c, $2, $2, $2, $1
    cutscene_PlayOpponentAnim $2
    cutscene_WaitTime $8
    cutscene_ClearTextbox
    cutscene_MakeTextbox $14, $2e, $8, $2, $1
    cutscene_PlayArleAnim $b
    cutscene_PlayOpponentAnim $4
    dc.b    $d, $1a, $8, $11, $3
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $22, $23, $28, $1e, $4, $20, $1f, $3
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_PlayOpponentAnim $8a
    cutscene_PlayArleAnim $f
    cutscene_WaitTime $4
    cutscene_PlayArleAnim $12
    cutscene_MakeTextbox $4, $2b, $8, $3, $0
    dc.b    $26, $11, $12, $3
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $10, $10, $a, $7, $15, $1a, $18, $19, $18, $19, $13, $24, $27, $11, $3
    cutscene_PlayArleAnim $13
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_endCutscene
