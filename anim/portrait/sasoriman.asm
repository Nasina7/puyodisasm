animtbl_PortraitSasoriman:
	dc.l    loc_00005AC4
	dc.l    loc_00005AC8
	dc.l    loc_00005AC8
	dc.l    loc_00005ACA
	dc.l    loc_00005ACE
	dc.l    loc_00005ADE
	dc.l    loc_00005AEC
	dc.l    loc_00005AF8
	
loc_00005AC4:
	dc.b	$00, $00, $FE, $00
loc_00005AC8:
	dc.b    $FE, $00
loc_00005ACA:
	dc.b    $00, $01
	
	dc.b    $FE, $00
loc_00005ACE:
	dc.b    $00, $00
loc_00005AD0:
	dc.b    $F1, $02, $02, $03, $02, $04, $02, $03, $FF, $00
	dc.l    loc_00005AD0
loc_00005ADE:
	dc.b    $F1, $05, $02, $03, $02, $04 ;0x20
	dc.b	$02, $03, $FF, $00
	dc.l    loc_00005ADE
loc_00005AEC:
	dc.b    $00, $00
loc_00005AEE:
	dc.b    $F1, $06, $04, $07, $FF, $00
	dc.l    loc_00005AEE
loc_00005AF8:
	dc.b    $FE, $00 ;0x40