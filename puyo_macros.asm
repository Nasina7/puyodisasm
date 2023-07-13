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
	dc.w	$000C
	dc.b	bgWidth
	dc.b	bgHeight
	dc.w	bgLoc
	dc.l 	bg
	dc.l	bgPal
	dc.w	bgIndex
	endm


bgmac_WordOffset: macro bg, bgWidth, bgHeight, bgLoc, bgOff
	dc.w	$0010
	dc.b	bgWidth
	dc.b	bgHeight
	dc.w	bgLoc
	dc.l	bg
	dc.w	bgOff
	endm

soundTestText: macro text
	i: = 0
	while (strlen(\1)>i)
		tempChar: substr i+1,i+1,\1
		if (strcmp("\tempChar", " "))
			dc.b    $00
		elseif (strcmp("\tempChar", ":"))
			dc.b	$28
		elseif ("\tempChar"<$3A)
			if ("\tempChar">$2F)
				dc.b 	"\tempChar"-$2F
			endc
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
	
align macro amount, typePadding
	dcb.b (amount-(*&(amount-1)))&(amount-1), typePadding
	endm
	
pad macro amount, typePadding
	dcb.b amount, typePadding
	endm
	
padToPowerOfTwo: macro 
	if (*<=$80000)
		align $80000, $00
	elseif (*<=$100000)
		align $100000, $00
	elseif (*<=$200000)
		align $200000, $00
	elseif (*<=$400000)
		align $400000, $00
	endc
	endm