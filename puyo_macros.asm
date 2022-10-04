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