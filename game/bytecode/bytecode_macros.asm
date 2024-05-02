BSTOP: macro
	dc.w    $0000
	endm

BNOP: macro
	dc.w    $0001
	endm
	
BDELAY: macro frames
	dc.w    $0002
	dc.w    frames
	endm
	
BWPAL: macro
	dc.w    $0003
	endm

BRAM: macro location, value
	dc.w    $0004
	dc.l    location
	dc.w    value
	endm

BRUN: macro func
	dc.w    $0005
	dc.l    func
	endm
	
BJMP: macro loc
	dc.w    $0006
	dc.l    loc
	endm
	
BJEQ: macro loc
	dc.w    $0007
	dc.l    loc
	endm
	
BJNE: macro loc
	dc.w    $0008
	dc.l    loc
	endm
	
BJTBL: macro lookupSize
	dc.w    $0009
	dc.w    lookupSize
	endm
	
; TODO: Make Constants for the mode part of this macro
BVMODE: macro mode
	dc.w    $000A
	dc.w    mode
	endm
	
BART: macro addr, data
	dc.w    $000B
	dc.w    addr
	dc.l    data
	endm
	
BVDPC: macro command
	dc.w    $000C
	dc.w    command
	endm
	
BPAL: macro palette, line
	dc.w    $000D
	dc.w    (((palette-palLookupTable)&$1FFF)<<3)|(line&$7)
	endm
	
BPALF: macro palette, line, fade
	dc.w    $000E
	dc.w    (((palette-palLookupTable)&$1FFF)<<3)|(line&$7)
	dc.w    (fade<<8)|$00
	endm
	
BSND: macro sound
	dc.w    $000F
	dc.w    sound
	endm
	
BSNDC: macro sound
	dc.w    $0010
	dc.w    sound
	endm
	
BMUSF: macro
	dc.w    $0011
	endm
	
BSSND: macro
	dc.w    $0012
	endm

BSNDC2: macro sound
	dc.w    $0013
	dc.w    sound
	endm