    cutscene_PlayArleAnim $6
    cutscene_WaitTime $4
    cutscene_MakeTextbox $5, $2a, $8, $3, $0
    cutscene_PlayArleAnim $5
    dc.b    $9, $1a, $19, $b
    cutscene_AddWhitespace
    cutscene_WaitTime $1
    dc.b    $5, $5, $17, $2c, $7, $a, $2d, $7, $0, $18, $1e, $4, $1d, $25, $25, $25, $23
    cutscene_PlayArleAnim $6
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_MakeTextbox $13, $2a, $8, $3, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $c, $d, $0, $19, $26
    cutscene_WaitTime $2
    dc.b    $86 ; Unknown Command
    cutscene_PlayOpponentAnim $80
    cutscene_PlayArleAnim $80
    cutscene_PlayOpponentAnim $1
    dc.b    $2e, $2f, $f, $30, $31, $10
    dc.b    $86 ; Unknown Command
    dc.b    $b, $2, $6, $c, $0, $1c, $1, $26
    cutscene_WaitTime $c
    cutscene_ClearTextbox
    cutscene_MakeTextbox $4, $30, $9, $1, $0
    cutscene_PlayArleAnim $8
    dc.b    $c, $d, $12, $24, $28, $29, $e, $19, $26
    cutscene_PlayArleAnim $7
    cutscene_WaitTime $8
    cutscene_ClearTextbox
    cutscene_MakeTextbox $9, $2d, $e, $2, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $2e, $2f, $17, $28, $29, $12, $20, $16, $13, $8, $14, $b, $10, $24
    cutscene_WaitTime $4
    dc.b    $32, $6, $c, $0, $1c, $1, $26
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $c
    cutscene_ClearTextbox
    cutscene_MakeTextbox $11, $2a, $a, $3, $1
    cutscene_PlayOpponentAnim $2
    dc.b    $27, $2a, $2b, $33, $11, $2, $1d, $15, $3, $f
    cutscene_WaitTime $2
    dc.b    $2e, $2f, $f, $34, $13, $17
    cutscene_AddWhitespace
    dc.b    $1, $4, $14, $1b, $0, $0, $1c, $1, $26
    cutscene_PlayOpponentAnim $80
    cutscene_PlayArleAnim $80
    cutscene_PlayOpponentAnim $1
    cutscene_WaitTime $10
    cutscene_ClearTextbox
    cutscene_endCutscene
