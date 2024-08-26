; ---------- Bug Fixes ----------

; Fix a shiftability bug in the character roll part of the credits.
fFixCreditsShiftability = 0 

; Fix a bug where the controls of the second player can effect CPUs in one player.
fFixAiControlBug = 0

; Fix an off-by-one error in the best record screen's name entry code.
fFixBestRecordWrap = 0

; Fix some unintended(?) behavior with Arle's Title Screen Object.
fFixTitleArleUB = 0

; Fix a harmless incorrect value in Video_ClearScrollTables
fFixClearScrollFunc = 0

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
