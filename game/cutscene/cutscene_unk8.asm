    cutscene_WaitTime $2
    cutscene_MakeTextbox $10, $31, $a, $1, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $18, $11, $1c
    cutscene_WaitTime $2
    cutscene_PlayOpponentAnim $1
    dc.b    $12, $13, $6, $16, $2, $c, $1b
    cutscene_PlayOpponentAnim $3
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $4, $2e, $8, $2, $0
    cutscene_PlayArleAnim $2
    dc.b    $e, $1e
    cutscene_AddWhitespace
    cutscene_PlayArleAnim $15
    cutscene_WaitTime $1
    cutscene_PlayArleAnim $5
    dc.b    $e, $0, $1d, $1d, $1d
    cutscene_PlayArleAnim $6
    cutscene_WaitTime $1
    cutscene_PlayArleAnim $5
    dc.b    $12, $13, $6, $4, $1b
    cutscene_PlayArleAnim $6
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $e, $2b, $b, $3, $1
    cutscene_PlayOpponentAnim $1
    dc.b    $0, $14, $5, $14, $d, $25, $26, $5, $8, $a, $1, $9, $17, $3, $10, $7, $1b
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    dc.b    $20, $21, $23, $22, $24, $1c, $1, $1, $10, $7, $1b
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $e, $31, $b, $1, $1
    cutscene_PlayOpponentAnim $1
    dc.b    $f, $b, $1c
    cutscene_WaitTime $1
    dc.b    $1, $3, $10, $15, $8, $1f, $1f, $1b
    cutscene_PlayOpponentAnim $4
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_endCutscene
