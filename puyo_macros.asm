; BG Mapping Macros
bgmac_Clear: macro bgWidth, bgHeight, bgLoc, bgValue
	dc.w 	$0000
	dc.b 	bgWidth
	dc.b 	bgHeight
	dc.w 	bgLoc
	dc.w 	bgValue
	endm

bgmac_ByteIndex: macro bg, bgWidth, bgHeight, bgLoc, bgIndex
	dc.w	$0004
	dc.b	bgWidth
	dc.b	bgHeight
	dc.w	bgLoc
	dc.l	bg
	dc.b	bgIndex
	dc.b	$00
	endm
	
bgmac_WordIndex: macro bg, bgWidth, bgHeight, bgLoc
	dc.w 	$0008
	dc.b 	bgWidth
	dc.b 	bgHeight
	dc.w 	bgLoc
	dc.l	bg
	endm
	
bgmac_ByteIndexPal: macro bg, bgPal, bgWidth, bgHeight, bgLoc, bgIndex
	dc.w	$0010
	dc.b	bgWidth
	dc.b	bgHeight
	dc.w	bgLoc
	dc.l 	bg
	dc.l	bgPal
	dc.w	bgIndex
	endm
	
; Cutscene Macros
cutscene_endCutscene: macro
	dc.b    $80
	endm
cutscene_MakeTextbox: macro x, y, tWidth, tHeight, opponent
	dc.b    $81
	dc.b    ((opponent&1)<<7)|((tHeight&7)<<4)|(tWidth&$F)
	dc.b    $C0|((y>>1)&$1F)
	dc.b    ((y&1)<<7)|((x&$3F)<<1)
	endm
cutscene_ClearTextbox: macro
	dc.b	$82
	endm
cutscene_WaitTime: macro time
	dc.b	$83
	dc.b    time
	endm
cutscene_PlayArleAnim: macro anim
	dc.b    $84
	dc.b	anim
	endm
cutscene_PlayOpponentAnim: macro anim
	dc.b	$85
	dc.b	anim
	endm
cutscene_AddWhitespace: macro
	dc.b    $89
	endm
	
align macro alignment
	cnop $00,alignment
    endm
padding macro amount, typePadding
	i: = amount
	while (i>0)
		dc.b    typePadding
		i: = i-1
	endw
	endm
	
soundTestText: macro text
	i: = 0
	while (strlen(\1)>i)
		tempChar: substr i+1,i+1,\1
		if (strcmp("\tempChar", " "))
			dc.b    $00
		else
			dc.b    "\tempChar"-$36
		endc
		i: = i+1
	endw
	
	dc.b    $FF
	endm
	
creditsTextboxText: macro vramLocation, text
	dc.w    strlen(\2)
	dc.w    vramLocation
	i: = 0
	while (strlen(\2)>i)
		tempChar2: substr i+1,i+1,\2
		if (strcmp("\tempChar2", " "))
			dc.b    $00
		elseif (strcmp("\tempChar2", "-"))
			dc.b    $4C
		elseif (strcmp("\tempChar2", "*"))
			dc.b    $4E
		else
			dc.b    ("\tempChar2"-$36)<<1
		endc
		i: = i+1
	endw
	even
	endm
	
padToPowerOfTwo: macro 
	if (*<=$80000)
		align $80000
	elseif (*<=$100000)
		align $100000
	elseif (*<=$200000)
		align $200000
	elseif (*<=$400000)
		align $400000
	endc
	endm