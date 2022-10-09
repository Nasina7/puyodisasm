lookupWriteRam: macro location, value
	dc.w    $0004
	dc.l    location
	dc.w    value
	endm

lookupJumpFunction: macro func
	dc.w    $0005
	dc.l    func
	endm
	
lookupJumpLocation: macro loc
	dc.w    $0006
	dc.l    loc
	endm
	
lookupJumpLocationEQ: macro loc
	dc.w    $0007
	dc.l    loc
	endm
	
lookupJumpLocationNE: macro loc
	dc.w    $0008
	dc.l    loc
	endm
	
lookupLocationLookup: macro lookupSize
	dc.w    $0009
	dc.w    lookupSize
	endm
	
; TODO: Make Constants for the mode part of this macro
lookupSetVDPMode: macro mode
	dc.w    $000A
	dc.w    mode
	endm
	
lookupLoadDataToVram: macro addr, data
	dc.w    $000B
	dc.w    addr
	dc.l    data
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
cutscene_PlayArleAnim: macro anim
	dc.b    $84
	dc.b	anim
	endm
cutscene_PlayOpponentAnim: macro anim
	dc.b	$85
	dc.b	anim
	endm
	

	
align macro alignment
	cnop $00,alignment
    endm
padding macro amount, typePadding
	i: set amount
	while (i>0)
		dc.b    typePadding
		i: set i-1
	endw
	endm
	
soundTestText: macro text
	i: set 0
	while (strlen(\1)>i)
		tempChar: substr i+1,i+1,\1
		if (strcmp("\tempChar", " "))
			dc.b    $00
		else
			dc.b    "\tempChar"-$36
		endc
		i: set i+1
	endw
	
	dc.b    $FF
	endm
	
creditsTextboxText: macro vramLocation, text
	dc.w    strlen(\2)
	dc.w    vramLocation
	i: set 0
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
		i: set i+1
	endw
	even
	endm
	
cutsceneTextEnglish: macro text
	i: set 0
	while (strlen(\1)>i)
		tempChar: substr i+1,i+1,\1
		if (strcmp("\tempChar", " "))
			dc.b    $00
		elseif (("\tempChar">=$41)&("\tempChar"<=$5A))
			dc.b    "\tempChar"-$36
		elseif (("\tempChar">=$61)&("\tempChar"<=$7A))
			dc.b    "\tempChar"-$56
		elseif (("\tempChar">=$30)&("\tempChar"<=$39))
			dc.b    "\tempChar"-$2F
		elseif (strcmp("\tempChar", ":"))
			dc.b    $50>>1
		elseif (strcmp("\tempChar", "/"))
			dc.b    $4E>>1
		elseif (strcmp("\tempChar", ","))
			dc.b    $4C>>1
		elseif (strcmp("\tempChar", "."))
			dc.b    $70>>1
		elseif (strcmp("\tempChar", ":"))
			dc.b    $50>>1
		elseif (strcmp("\tempChar", "#"))
			dc.b    $52>>1
		elseif (strcmp("\tempChar", "("))
			dc.b    $54>>1
		elseif (strcmp("\tempChar", ")"))
			dc.b    $56>>1
		elseif (strcmp("\tempChar", "-"))
			dc.b    $5C>>1
		elseif (strcmp("\tempChar", "~"))
			dc.b    $5E>>1
		elseif (strcmp("\tempChar", "?"))
			dc.b    $64>>1
		elseif (strcmp("\tempChar", "!"))
			dc.b    $74>>1
		elseif (strcmp("\tempChar", "'"))
			dc.b    $72>>1
		endc
		i: set i+1
	endw
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