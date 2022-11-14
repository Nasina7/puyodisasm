    cutscene_PlayArleAnim $b
    cutscene_WaitTime $4
    cutscene_MakeTextbox $4, $2e, $8, $2, $0
    cutscene_PlayArleAnim $a
    dc.b    $5, $11, $11, $11, $5, $7, $1, $12
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $2
    cutscene_PlayArleAnim $a
    dc.b    $6, $9, $13, $1, $a, $11, $11, $11
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $6
    cutscene_MakeTextbox $14, $31, $8, $1, $1
    dc.b    $2, $e, $3
    cutscene_PlayOpponentAnim $86
    cutscene_PlayOpponentAnim $87
    cutscene_PlayOpponentAnim $1
    dc.b    $3, $3, $3, $3, $12
    cutscene_PlayArleAnim $3
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $2, $31, $8, $1, $0
    dc.b    $c, $0, $0, $0, $0, $0, $d, $12
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $3
    cutscene_MakeTextbox $12, $2e, $9, $2, $1
    dc.b    $6, $6, $4, $b, $14, $a
    cutscene_WaitTime $3
    dc.b    $86 ; Unknown Command
    dc.b    $15, $7, $8, $0, $1, $1, $1, $1, $12
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_endCutscene
