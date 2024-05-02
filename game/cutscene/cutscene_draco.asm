    include "game/cutscene/macros.asm"
    include "game/cutscene/constants.asm"

    WaitTime 2
    
    ; Creates a textbox at tile coordinates 26,49 in Plane A
    ; with a width of 4 characters, a height of one character
    ; and with the opponent speaking
    MakeTextbox 26, 49, 4, 1, 1
    PlayOpponentAnim draco_AnimPointUp
    
    ; お前っ！
    dc.b    $03, $29, $19, $26
    
    WaitTime 4
    ClearTextbox
    MakeTextbox 18, 43, 9, 3, 1
    PlayOpponentAnim draco_AnimIdleTalk
    
    ;Textbox Data
    dc.b    $07, $07, $17, $2A
    dc.b    $15, $0A, $06, $16
    dc.b    $1C
    
    WaitTime 3
    
    dc.b    $00
    dc.b    $0A, $09, $0C, $2B
    dc.b    $2C, $09, $0B, $01
    dc.b    $05, $0D, $08, $01
    dc.b    $26
    
    PlayOpponentAnim draco_AnimIdle
    WaitTime 6
    ClearTextbox
    MakeTextbox 2, 46, 10, 2, 0
    PlayArleAnim arle_AnimStanceTalk
    
    dc.b    $2B, $2C, $27
    
    AddWhitespace
    WaitTime 1
    
    dc.b    $12, $25, $12, $08, $04
    
    TextboxNewLine
    WaitTime 1
    
    dc.b    $2D, $2E, $2F, $1E, $22, $20, $1F, $21, $26, $27 
    
    PlayArleAnim arle_AnimStanceIdle
    WaitTime 4
    ClearTextbox
    MakeTextbox 12, 46, 12, 2, 1
    PlayOpponentAnim draco_AnimGloatTalk
    
    dc.b    $11, $11, $18, $25, $83, $02, $00, $0A, $09, $0F, $2D, $09, $08, $0E
    
    WaitTime 1
    
    dc.b    $04, $0D, $02, $0C, $03, $13, $19, $0B, $32, $32, $32 
    
    WaitTime 2
    ClearTextbox
    MakeTextbox 18, 43, 9, 3, 1
    PlayOpponentAnim draco_AnimAnger
    
    dc.b    $1B, $1A, $0D, $00, $28, $01, $19, $26, $26 
    
    WaitTime 4
    PlayOpponentAnim draco_AnimIdleTalk
    
    dc.b    $2B, $2C, $10
    
    AddWhitespace
    TextboxNewLine
    WaitTime 2
    
    dc.b    $1D, $14, $1D, $14, $30, $31, $14, $19, $26 
    
    PlayOpponentAnim draco_AnimIdle
    WaitTime 4
    ClearTextbox
    EndCutscene
    