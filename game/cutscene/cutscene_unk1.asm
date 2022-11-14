    cutscene_PlayArleAnim $6
    cutscene_WaitTime $4
    cutscene_MakeTextbox $6, $31, $6, $1, $0
    dc.b    $2, $2, $2, $2, $2, $3
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $12, $2e, $9, $2, $1
    dc.b    $8, $8, $8, $0, $1b, $5, $12, $9, $d
    cutscene_WaitTime $1
    dc.b    $1c, $e, $17, $9, $2, $2, $2, $2, $7
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_PlayOpponentAnim $1
    cutscene_WaitTime $4
    cutscene_PlayOpponentAnim $3
    cutscene_MakeTextbox $12, $2b, $8, $3, $1
    dc.b    $c, $1c, $b, $19, $11, $9, $16
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $1b, $5, $12, $9, $d
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $1c, $e, $17, $9, $19, $1f, $f, $4
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $2, $2e, $8, $2, $0
    cutscene_PlayArleAnim $2
    cutscene_PlayOpponentAnim $2
    dc.b    $17, $21, $16
    cutscene_WaitTime $2
    dc.b    $1, $8, $12, $10, $19, $11, $9, $17, $19, $1f, $4
    cutscene_PlayArleAnim $15
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $12, $2b, $9, $3, $1
    cutscene_PlayOpponentAnim $5
    dc.b    $c, $1c, $b, $17, $21, $15, $1
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $1a, $1f, $1a, $1f, $19, $22, $18, $a, $1d, $14, $1e, $a, $21, $13, $20, $f, $4
    cutscene_PlayOpponentAnim $4
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_endCutscene
