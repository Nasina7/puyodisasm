    cutscene_PlayArleAnim $6
    cutscene_WaitTime $6
    cutscene_PlayArleAnim $5
    cutscene_MakeTextbox $3, $31, $b, $1, $0
    dc.b    $0, $3, $12, $12, $12, $11
    cutscene_PlayArleAnim $6
    cutscene_WaitTime $1
    cutscene_PlayArleAnim $5
    dc.b    $6, $1, $6, $1, $14
    cutscene_PlayArleAnim $4
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $6
    cutscene_MakeTextbox $6, $31, $5, $1, $0
    cutscene_PlayArleAnim $5
    dc.b    $6, $1, $6, $1, $14
    cutscene_PlayArleAnim $6
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $2
    cutscene_MakeTextbox $8, $2d, $e, $2, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $e, $15, $15, $15, $b, $b, $b, $13, $e, $9, $e, $b
    cutscene_WaitTime $2
    cutscene_PlayArleAnim $9
    dc.b    $86 ; Unknown Command
    dc.b    $16, $7, $3, $d, $c, $5, $a, $2, $8, $17, $4, $b, $b, $13
    cutscene_PlayOpponentAnim $3
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_endCutscene
