    cutscene_PlayOpponentAnim $81
    cutscene_PlayOpponentAnim $82
    cutscene_WaitTime $8
    cutscene_PlayOpponentAnim $1
    cutscene_WaitTime $4
    cutscene_PlayOpponentAnim $0
    cutscene_MakeTextbox $2, $2b, $a, $3, $0
    cutscene_PlayArleAnim $a
    dc.b    $7, $e, $e, $12
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    cutscene_PlayArleAnim $a
    dc.b    $2, $d, $6, $2, $5, $c, $3, $4, $0, $b, $14, $15, $f, $7
    cutscene_AddWhitespace
    dc.b    $6, $0, $e, $e, $13
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_PlayArleAnim $e
    cutscene_WaitTime $4
    cutscene_MakeTextbox $1, $31, $c, $1, $0
    cutscene_PlayArleAnim $10
    dc.b    $2, $2, $c, $16, $3, $4, $8, $a, $1, $9, $e, $13
    cutscene_PlayArleAnim $11
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_endCutscene
