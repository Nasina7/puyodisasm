dcwLE: macro data
	dc.w ((data&$00FF)<<8)|(data>>8)
	endm