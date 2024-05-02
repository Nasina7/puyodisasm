animtbl_PortraitDraco:
	dc.l	anim_draco_Eyes
	dc.l	anim_draco_Eyes
	dc.l	loc_000059A4
	dc.l	loc_000059B4
	dc.l	anim_draco_Mouth
	dc.l	loc_000059C8
	dc.l	loc_000059DA
	dc.l	loc_000059EC
anim_draco_Eyes:
	dc.b	$00
	dc.b	$00 
anim_draco_EyesLoop:
	dc.b	$01
	dc.b	$02 
	dc.b	$01
	dc.b	$03 
	dc.b	$03
	dc.b	$04 
	dc.b	$02
	dc.b	$03 
	dc.b	$F0
	dc.b	$02 
	dc.b	$FF
	dc.b	$00 
	dc.l	anim_draco_EyesLoop
	
loc_000059A4:
	dc.w 	$010B
	dc.w 	$010C
	dc.w 	$030D
	dc.w 	$020C
	dc.w 	$F00B
	dc.w 	$FF00
	dc.l	loc_000059A4
loc_000059B4:
	dc.l	$0001FE00
	
anim_draco_Mouth: ; This animation handles Draco's mouth movement in the portrait
	dc.w 	$0205 ; Open
	dc.w 	$0207 ; Partially Closed
	dc.w 	$0206 ; Closed
	dc.w 	$0207 ; Partially Closed
	dc.w 	$F105 ; Open (for way longer)
	dc.w 	$FF00
	dc.l	anim_draco_Mouth

loc_000059C8:
	dc.l	$0002080A
	dc.l	$04090808
	dc.l	$0409F10A
	dc.w	$FF00
	dc.l	loc_000059C8
loc_000059DA:
	dc.w    $000B
	dc.l	$2010040F	
	dc.l	$200E040F	
	dc.l	$F110FF00	
	dc.l	loc_000059DA
loc_000059EC:
	dc.b	$FE
	dc.b	$00 