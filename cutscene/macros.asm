EndCutscene: macro
    dc.b    $80
    endm
MakeTextbox: macro x, y, tWidth, tHeight, opponent
    dc.b    $81
    dc.b    ((opponent&1)<<7)|((tHeight&7)<<4)|(tWidth&$F)
    dc.b    $C0|((y>>1)&$1F)
    dc.b    ((y&1)<<7)|((x&$3F)<<1)
    endm
ClearTextbox: macro
    dc.b    $82
    endm
WaitTime: macro time
    dc.b    $83
    dc.b    time
    endm
PlayArleAnim: macro anim
    dc.b    $84
    dc.b    anim
    endm
PlayOpponentAnim: macro anim
    dc.b    $85
    dc.b    anim
    endm
TextboxNewLine: macro
    dc.b     $86
    endm
ResetTextbox: macro
    dc.b     $87
    endm
AddWhitespace: macro
    dc.b    $89
    endm
PlayVoice: macro voice
    dc.b     $8A
    dc.b     voice
    endm
