    cutscene_PlayOpponentAnim $1
    cutscene_PlayArleAnim $b
    cutscene_MakeTextbox $14, $30, $7, $1, $1
    dc.b    $d, $3, $3, $3, $3, $3, $1e
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_WaitTime $6
    cutscene_MakeTextbox $2, $2d, $8, $2, $0
    cutscene_PlayArleAnim $a
    dc.b    $25, $24, $23, $21, $27, $22, $1e
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $4
    dc.b    $87 ; Unknown Command
    cutscene_PlayArleAnim $a
    dc.b    $b, $c, $6, $13, $f, $10, $14, $1e
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $2
    cutscene_PlayArleAnim $a
    dc.b    $28, $b, $1, $17, $15, $b, $1, $1e
    cutscene_PlayArleAnim $b
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $12, $30, $8, $1, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $26, $26, $20, $29, $f, $2a, $2b, $18
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $4
    cutscene_PlayOpponentAnim $3
    cutscene_PlayOpponentAnim $88
    cutscene_ClearTextbox
    cutscene_MakeTextbox $1, $30, $c, $1, $0
    cutscene_PlayArleAnim $a
    dc.b    $9, $1d, $9, $16, $14, $a, $2c, $14, $8, $0, $0, $1e
    cutscene_PlayArleAnim $f
    cutscene_WaitTime $c
    cutscene_ClearTextbox
    cutscene_MakeTextbox $2, $2a, $9, $3, $0
    cutscene_PlayOpponentAnim $3
    cutscene_PlayArleAnim $12
    dc.b    $17, $15, $0, $1d
    cutscene_PlayArleAnim $13
    cutscene_WaitTime $4
    dc.b    $87 ; Unknown Command
    cutscene_PlayArleAnim $12
    dc.b    $4, $f, $1a, $10, $1a, $10, $2d, $2e, $19, $2f, $3, $2, $1e
    cutscene_PlayArleAnim $13
    cutscene_WaitTime $6
    dc.b    $86 ; Unknown Command
    cutscene_PlayArleAnim $12
    dc.b    $7, $30, $19, $1, $1, $12, $e, $1e, $1f
    cutscene_PlayArleAnim $13
    cutscene_WaitTime $8
    cutscene_ClearTextbox
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $4
    cutscene_MakeTextbox $e, $30, $3, $1, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $10, $5, $1e
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $3
    cutscene_ClearTextbox
    cutscene_endCutscene
