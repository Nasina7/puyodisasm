; ---------- Bug Fixes ----------

; Fix a bug in the character roll part of the credits that can cause character names to display incorrectly.
fFixCreditsShiftability = 0 

; Fix a bug where the controls of the second player can effect CPUs in one player.
fFixAiControlBug = 0

; Fix a bug where the letter selection on the "best record" screen goes one higher than intended when wrapping
; from top to bottom.  
fFixBestRecordWrap = 0

; Todo: This flag is not set up yet.
; Implement initialization checks for objects that don't have them.
; This bug will only cause writes to ROM, but it's still good to have a fix for it.
fFixObjectInits = 0

; Todo: This flag is not set up yet.  (Need to disassemble sound bank 1 first)
; Fix a bug(?) where "Warning of Puyo Puyo" will continually increase instrument pitch forever, rather than looping normally.
fFixWarningOfPuyo = 0

; ---------- Optimization ----------

; Todo: This flag is not set up yet.
; This flag will remove all unused code and data, as well as any unnecessary padding.
fOptRemoveUnused = 0
