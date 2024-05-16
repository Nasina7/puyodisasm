; ---------- Bug Fixes ----------

; In the code for the part of the credits displaying the character names, at the place this 
; flag affects, D0 contains the upper half of loc_0000D908, which is normally expected to be 0000.  Shifting 
; the rom beyond a certain point causes D0 to have a non-zero value, which breaks the code that draws the names
; to the screen.  Changing this to 1 will fix this.
fFixCreditsShiftability = 0 

; In the original arcade release of the game, the controls of the second player can have an effect 
; on the CPUs present in one player mode, resulting in them being incapable of dropping Puyos manually.  This bug
; was carried over to the Megadrive release.  Changing this to 1 will fix this.
fFixAiControlBug = 0

; On the best record board, wrapping the letter selection around by pressing up will result in the 
; cursor going one higher than intended.  Changing this to 1 will fix this.
fFixBestRecordWrap = 0

; Todo: This flag is not set up yet.
; Objects in this game are initialized with initalization routines.  They'll first call a function 
; to allocate the object into a table of objects, sometimes write some values to the allocated memory, and then 
; return.  Normally, the init function should check to see if the memory was successfully allocated, but some 
; inits don't check for this.  To my knowledge, this only ever causes harmless writes to ROM, but it's still
; good to have a fix for it.
fFixObjectInits = 0

; ---------- Optimization ----------

; Todo: This flag is not set up yet.
; This flag will remove all unused code and data, as well as any unnecessary padding.
fOptRemoveUnused = 0
