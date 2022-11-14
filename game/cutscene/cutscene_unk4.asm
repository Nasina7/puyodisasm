    cutscene_WaitTime $4
    cutscene_PlayOpponentAnim $1
    cutscene_WaitTime $8
    cutscene_MakeTextbox $16, $2e, $7, $2, $1
    dc.b    $14, $14, $14, $14, $14, $20
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $4, $22, $28, $2, $10, $1, $1f
    cutscene_PlayOpponentAnim $0
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $8, $31, $6, $1, $0
    dc.b    $29, $29, $29, $29, $29, $1f
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $b, $2e, $d, $2, $1
    cutscene_PlayOpponentAnim $0
    dc.b    $4, $4, $15
    cutscene_AddWhitespace
    dc.b    $22, $23, $21
    cutscene_WaitTime $4
    dc.b    $86 ; Unknown Command
    cutscene_PlayOpponentAnim $3
    dc.b    $f, $29, $29, $29, $10, $1, $15, $9, $b, $29, $29, $29, $1f
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_MakeTextbox $10, $2e, $a, $2, $1
    dc.b    $7, $d, $24, $25
    cutscene_WaitTime $1
    dc.b    $86 ; Unknown Command
    dc.b    $17, $1b, $d, $1, $9, $16, $6, $16, $b, $1f
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $12, $2e, $9, $2, $1
    dc.b    $4, $26, $c, $e
    cutscene_WaitTime $1
    cutscene_PlayOpponentAnim $2
    cutscene_PlayArleAnim $3
    dc.b    $27, $3, $a, $11, $12, $4, $2, $5, $0, $0, $0, $0, $21
    cutscene_WaitTime $4
    cutscene_ClearTextbox
    cutscene_MakeTextbox $2, $2e, $e, $2, $0
    dc.b    $13, $0, $21
    dc.b    $86 ; Unknown Command
    cutscene_WaitTime $1
    dc.b    $8, $14, $b, $1a, $19, $1c, $18, $19, $1c, $b, $0, $0, $15, $21
    cutscene_WaitTime $6
    cutscene_ClearTextbox
    cutscene_endCutscene
