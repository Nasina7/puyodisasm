; Sprite animation data is layed out as follows:
;	Byte 0 = Number of frames(?) next sprite mapping lasts
;	Byte 1 = Next sprite mapping ID
;	(Bytes 0 and 1 can be repeated many times to chain mappings together)
;	Byte 2 = Ending (FF = Loop animation to label, FE = End Animation)
;			 It's worth noting that animations can loop into eachother (In this file, anim_draco_Anger transitions into anim_draco_Idle)
;	Byte 3 = Padding to even number of bytes
;	Long 4 = If the animation loops, this is the label to loop to.

; Its worth noting here that animations on a sprite are also controlled by what mapping a sprite is in.
; For example with Draco,
;	Mapping 0 = Idle, no blinking
;	Mapping 1 = Point Upwards
;	Mapping 2 = Talk
;	Mapping 3 = Blink
;	etc...


animtbl_CutsceneDraco:
	dc.l	anim_draco_Idle, anim_draco_idletalk, anim_draco_GloatTalk, anim_draco_PointUp, anim_draco_Anger 
anim_draco_Idle:
	dc.b	$F0
	dc.b	$00
	dc.b	$06
	dc.b	$03
	dc.b	$FF
	dc.b	$00
	dc.l	anim_draco_Idle
anim_draco_IdleTalk:
	dc.b	$04
	dc.b	$00
	dc.b	$03
	dc.b	$02 
	dc.b	$FF
	dc.b	$00 
	dc.l	anim_draco_IdleTalk
anim_draco_GloatTalk:
	dc.b	$04
	dc.b	$04 
	dc.b	$04
	dc.b	$05 
	dc.b	$FF
	dc.b	$00 
	dc.l	anim_draco_GloatTalk
anim_draco_PointUp:
	dc.b	$02
	dc.b	$00 
	dc.b	$00
	dc.b	$01 
	dc.b	$FE
	dc.b	$00 
anim_draco_Anger:
	dc.b	$0C
	dc.b	$06
	dc.b	$1E
	dc.b	$07
	dc.b	$08
	dc.b	$06
	dc.b	$FF
	dc.b	$00
	dc.l	anim_draco_Idle