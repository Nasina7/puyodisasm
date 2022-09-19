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
	

	
lookupLoadDataToVram: macro addr, data
	dc.w    $000B
	dc.w    addr
	dc.l    data
	endm
	
align macro alignment
	cnop 0,alignment
    endm