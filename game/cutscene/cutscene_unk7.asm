    cutscene_MakeTextbox $10, $28, $9, $4, $1
    dc.b    $11, $27, $27, $27, $11, $11, $11
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $5, $1a, $c, $b, $5, $18, $10, $13, $1b, $a, $4, $16, $c, $1a, $a, $25
    cutscene_WaitTime $3
    dc.b    $86 ; Unknown Command
    cutscene_PlayArleAnim $15
    dc.b    $c, $1a, $a, $2, $20, $3, $6, $1a, $24
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $2, $2e, $9, $2, $0
    cutscene_PlayArleAnim $2
    dc.b    $8, $1a, $c, $e, $25
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $21, $4, $e, $28, $29, $1e, $14, $1b, $26
    cutscene_PlayArleAnim $15
    cutscene_WaitTime $2
    cutscene_PlayOpponentAnim $1
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $e, $2b, $b, $3, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $1f, $f, $25, $8, $17, $c, $15, $d
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $19, $9, $4, $7, $1d
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $2, $2a, $29, $0, $9, $7, $12, $7, $1c, $1, $24
    cutscene_PlayOpponentAnim $3
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $14, $31, $8, $1, $1
    cutscene_PlayOpponentAnim $0
    dc.b    $11, $27, $27, $11, $11, $11, $11, $24
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_endCutscene
