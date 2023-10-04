	
	include "game/options/variables.asm"

SoundTest_Init:
	BSR.w	SoundTest_LoadArleSprite
	BSR.w	SoundTest_LoadSatanSprite
	MOVE.b	#$FF, $00FF1834
	MOVE.w	#$E000, D5
	MOVE.w	#$001B, D0
	MOVE.w	#$406C, D6
@OuterLoop:
	ORI	#$0700, SR
	JSR	loadBGSetupVDP
	ADDI.w	#$0080, D5
	MOVE.w	#$0027, D1
@InnerLoop:
	MOVE.w	D6, vdpData1
	EORI.b	#1, D6
	DBF	D1, @InnerLoop
	ANDI	#$F8FF, SR
	EORI.b	#2, D6
	DBF	D0, @OuterLoop
	BRA.w	Option_InitVramPlane

SoundTest_InitObj:
	LEA	SoundTest_Update, A1
	JMP	ObjSys_InitObjWithFunc

BadCheck_Init:
	move.b #-1, ($00FF1834).l
	move.w #$E000, D5
	move.w #$1B, D0
	move.w #$406C, D6
@OuterLoop:
	ori #$700, SR
	jsr	loadBGSetupVDP
	addi.w #$80, D5
	move.w #$27, D1
@InnerLoop:
	move.w D6, (vdpData1).l
	eori.b #1, D6
	dbf D1, @InnerLoop
	andi #$F8FF, SR
	eori.b #2, D6
	dbf D0, @OuterLoop
	bsr.w Option_InitVramPlane
	move.w #$5A0, D5
	move.w #$A500, D6
	lea (@Warning).l, A1
	bsr.w loc_0001D6C4
	move.w #$796, D5
	move.w #$8500, D6
	lea (@ChecksumIsWrong).l, A1
	bsr.w loc_0001D6C4
	lea (BadCheck_Update).l, A1
	jmp ObjSys_InitObjWithFunc
@Warning:
	soundTestText "WARNING."
	even
@ChecksumIsWrong:
	soundTestText "CHECKSUM IS WRONG."
	even

BadCheck_Update:
	move.w #$100, D0
	jsr loc_00002B1C
	jsr loc_00002b40
	clr.b ($00FF1834).l
	clr.b (bc_stopRunning).l
	jmp loc_00002AF2
	
SoundTest_LoadSatanSprite:
	LEA	@SatanInit, A1
	JMP	ObjSys_InitObjWithFunc
@SatanInit:
	MOVE.w	#$0180, $A(A0)
	MOVE.w	#$0140, $E(A0)
	MOVE.b	#$80, $6(A0)
	MOVE.b	#$15, $8(A0)
	MOVE.l	#@Anim_Satan, $32(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	JSR	Anim_UpdateCutsceneSprite
	JMP	SprSys_UpdatePosInterpolate
@Anim_Satan:
	dc.b	$F1
	dc.b	$00 
	dc.b	$08
	dc.b	$08 
	dc.b	$0C
	dc.b	$00 
	dc.b	$08
	dc.b	$08 
	dc.b	$FF
	dc.b	$00 
	dc.l	@Anim_Satan
	
SoundTest_LoadArleSprite:
	LEA	@ArleInit, A1
	JMP	ObjSys_InitObjWithFunc
@ArleInit:
	MOVE.w	#$00C0, $A(A0)
	MOVE.w	#$0140, $E(A0)
	MOVE.b	#$80, $6(A0)
	MOVE.b	#8, $8(A0)
	MOVE.l	#@Anim_Arle, $32(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	JSR	Anim_UpdateCutsceneSprite
	JMP	SprSys_UpdatePosInterpolate
@Anim_Arle:
	dc.b	$F1
	dc.b	$00 
	dc.b	$40
	dc.b	$14 
	dc.b	$F1
	dc.b	$00 
	dc.b	$20
	dc.b	$05 
	dc.b	$F1
	dc.b	$00 
	dc.b	$08
	dc.b	$13 
	dc.b	$FF
	dc.b	$00 
	dc.l	@Anim_Arle
	
SoundTest_Update:
	MOVE.w	#2, D0
	BSR.w	Option_DrawStaticText
	BSR.w	SoundTest_DrawIdNames
	JSR	ObjSys_UpdateObjNextOpTimer
	BSR.w	SoundTest_DrawIds
	
	MOVE.b	ram_pad1Press, D0
	OR.b	$00FF1111, D0
	BTST.l	#btn_Start, D0
	BNE.w	SoundTest_Exit
	BTST.l	#btn_B, D0
	BNE.w	SoundTest_ClearAudio
	ANDI.b	#(btnb_A|btnb_C), D0
	BNE.w	SoundTest_PlayId
	MOVE.b	$00FF110C, D0
	OR.b	$00FF1112, D0
	BTST.l	#btn_Up, D0
	BNE.w	SoundTest_MoveCursorUp
	BTST.l	#btn_Down, D0
	BNE.w	SoundTest_MoveCursorDown
	BTST.l	#btn_Right, D0
	BNE.w	SoundTest_MoveCursorRight
	BTST.l	#btn_Left, D0
	BNE.w	SoundTest_MoveCursorLeft
	RTS
	
SoundTest_MoveCursorUp:
	SUBQ.w	#1, $26(A0)
	BCC.w	@CursorNoWrap
	MOVE.w	#5, $26(A0)
@CursorNoWrap:
	RTS
	
SoundTest_MoveCursorDown:
	ADDQ.w	#1, $26(A0)
	CMPI.w	#6, $26(A0)
	BCS.w	@CursorNoWrap
	MOVE.w	#0, $26(A0)
@CursorNoWrap:
	RTS

SoundTest_ClearAudio:
	JMP	SndDrv_PlayClearEffect

SoundTest_Exit:
	CLR.b	$00FF1834
	CLR.b	bc_stopRunning
	JMP	loc_00002AF2

SoundTest_MoveCursorRight:
	MOVE.b	#1, D1
	BRA.w	SoundTest_MoveCursorLR
SoundTest_MoveCursorLeft:
	MOVE.b	#$FF, D1
	
SoundTest_MoveCursorLR:
	MOVE.w	$26(A0), D0
	LEA	@IdLimits, A1
	MOVE.b	(A1,D0.w), D2
	ADD.b	D1, $12(A0,D0.w)
	BPL.w	@NoNegativeWrap
	MOVE.b	D2, $12(A0,D0.w)
	SUBQ.b	#1, $12(A0,D0.w)
@NoNegativeWrap:
	MOVE.b	$12(A0,D0.w), D3
	CMP.b	D2, D3
	BCS.w	@NoPositiveWrap
	CLR.b	$12(A0,D0.w)
@NoPositiveWrap:
	SUBQ.w	#3, D0
	BCS.w	@IsSoundEffect
	BSR.w	SoundTest_UpdateSelNotEffect
@IsSoundEffect:
	RTS
@IdLimits:
	dc.b	$5F, $5F, $5F, $11, $03, $07 

SoundTest_PlayId:
	MOVE.w	$26(A0), D1
	CLR.w	D0
	MOVE.b	$12(A0,D1.w), D0
	SUBQ.w	#3, D1
	BCC.w	@NotSoundEffect
	ADDI.b	#$20, D0
	JMP	SndDrv_QueueSoundEffect
@NotSoundEffect:
	LSL.w	#2, D0
	LSL.w	#2, D1
	LEA	SoundTest_TextTbl, A1
	MOVEA.l	(A1,D1.w), A2
	MOVEA.l	(A2,D0.w), A1
	MOVE.b	(A1), D0
	MOVEA.l	@LookupCursorJmp(PC,D1.w), A1
	JMP	(A1)
@LookupCursorJmp:
	dc.l	@IsSelMusic
	dc.l	@IsSelVoice
	dc.l	@IsSelCmd
@IsSelMusic:
	JSR	SndDrv_PlayClearEffect
	JMP	SndDrv_PlayMusicId
@IsSelVoice:
	JMP	SndDrv_PlayVoiceAlways
@IsSelCmd:
	CLR.w	D0
	MOVE.b	$17(A0), D0
	MULU.w	#3, D0
	MOVE.b	@EffectTable(PC,D0.w), $00FF012C
	MOVE.b	@EffectTable+1(PC,D0.w), $00FF012D
	MOVE.b	@EffectTable+2(PC,D0.w), $00FF012E
	CMPI.b	#$F4, $00FF012C
	BNE.w	@IsNotF4
	CLR.w	D0
	MOVE.b	$15(A0), D0
	LSL.w	#2, D0
	LEA	SoundTest_MusicTxtTbl, A1
	MOVEA.l	(A1,D0.w), A2
	MOVE.b	(A2), $00FF012E
@IsNotF4:
	RTS
@EffectTable:
	dc.b	effID_AllClear, $00, $00
	dc.b	effID_Clear, $00, $00
	dc.b 	effID_FadeOut, $80, $00
	dc.b	effID_FadeIn, $80, $03
	dc.b	effID_Rebirth, $80, $00
	dc.b	effID_PauseOn, $00, $00
	dc.b	effID_PauseOff, $00, $00 
	even
	
SoundTest_DrawIdNames:
	MOVE.w	#2, D0
@Loop:
	MOVEM.l	D0, -(A7)
	BSR.w	SoundTest_UpdateSelNotEffect
	MOVEM.l	(A7)+, D0
	DBF	D0, @Loop
	RTS
	
SoundTest_UpdateSelNotEffect:
	MOVE.w	D0, D1
	LSL.w	#2, D1
	LEA	SoundTest_TextTbl, A1
	MOVEA.l	(A1,D1.w), A2
	MOVE.b	$15(A0,D0.w), D1
	LSL.w	#2, D1
	MOVEA.l	(A2,D1.w), A1
	ADDQ.l	#1, A1
	MOVE.w	D0, D5
	LSL.w	#8, D5
	ADDI.w	#$05A4, D5
	MOVE.w	#$A500, D6
	MOVEM.l	A1/D6/D5, -(A7)
	LEA	loc_0001D076, A1
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D5/D6/A1
	BRA.w	loc_0001D6C4
loc_0001D076:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00 
	
SoundTest_DrawIds:
	MOVE.w	#5, D0
	MOVE.w	#$079C, D5
	MOVE.w	#$A500, D6
@Loop:
	BSR.w	SoundTest_GetTextAndId
	BSR.w	SoundTest_DrawId
	MOVEM.l	D5/D4/D3/D2/D1/D0, -(A7)
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D0/D1/D2/D3/D4/D5
	SUBI.w	#$0100, D5
	DBF	D0, @Loop
	RTS
	
SoundTest_DrawId:
	LEA	$00FF1894, A1
	CLR.w	(A1)
	MOVE.b	#$FF, $2(A1)
	CMP.w	$26(A0), D0
	BNE.w	@NotCurrentSel
	BTST.b	#0, $00FF05C7  ; Some type of global animation timer?
	BEQ.w	@NotCurrentSel
	RTS
@NotCurrentSel:
	MOVE.b	D1, D2
	LSR.b	#4, D2
	ANDI.b	#$0F, D1
	ADDQ.b	#1, D2
	ADDQ.b	#1, D1
	MOVE.b	D2, $0(A1)
	MOVE.b	D1, $1(A1)
	MOVE.b	#$FF, $2(A1)
	RTS
	
SoundTest_GetTextAndId:
	CLR.w	D1
	MOVE.b	$12(A0,D0.w), D1
	MOVE.w	D0, D2
	SUBQ.w	#3, D2
	BCS.w	@IsSoundEffect
	LSL.w	#2, D2
	LEA	SoundTest_TextTbl, A1
	MOVEA.l	(A1,D2.w), A2
	LSL.w	#2, D1
	MOVEA.l	(A2,D1.w), A1
	MOVE.b	(A1)+, D1
	RTS
@IsSoundEffect:
	ADDI.b	#$20, D1
	RTS
	
SoundTest_TextTbl:
	dc.l	SoundTest_MusicTxtTbl
	dc.l	SoundTest_VoiceTxtTbl
	dc.l	SoundTest_CommandTxtTbl
SoundTest_MusicTxtTbl:
	dc.l	@final
	dc.l	@theme
	dc.l	@baroque
	dc.l	@cooking
	dc.l	@morning
	dc.l	@toy
	dc.l	@sorrow
	dc.l	@sticker
	dc.l	@sunset
	dc.l	@rejection
	dc.l	@memories
	dc.l	@harpy
	dc.l	@warning
	dc.l	@satan
	dc.l	@brave
	dc.l	@ondo
	dc.l	@victory

@final:
	dc.b	musID_Final 
	soundTestText "FINAL OF PUYOPUYO"
	even
@theme:
	dc.b	musID_Theme 
	soundTestText "THEME OF PUYOPUYO"
	even
@baroque:
	dc.b	musID_Baroque
	soundTestText "BAROQUE OF PUYOPUYO"
	even
@cooking:
	dc.b	musID_Cooking 
	soundTestText "COOKING OF PUYOPUYO"
	even
@morning:
	dc.b	musID_Morning 
	soundTestText "MORNING OF PUYOPUYO"
	even
@toy:
	dc.b	musID_Toy 
	soundTestText "TOY OF PUYOPUYO"
	even
@sorrow:
	dc.b	musID_Sorrow 
	soundTestText "SORROW OF PUYOPUYO"
	even
@sticker:
	dc.b	musID_Sticker 
	soundTestText "STICKER OF PUYOPUYO"
	even
@sunset:
	dc.b	musID_Sunset
	soundTestText "SUNSET OF PUYOPUYO"
	even
@rejection:
	dc.b	musID_Rejection
	soundTestText "REJECTION OF PUYOPUYO"
	even
@memories:
	dc.b	musID_Memories 
	soundTestText "MEMORIES OF PUYOPUYO"
	even
@harpy:
	dc.b	musID_HarpyTheme 
	soundTestText "THEME FOR HARPY"
	even
@warning:
	dc.b	musID_Warning 
	soundTestText "WARNING OF PUYOPUYO"
	even
@satan:
	dc.b	musID_SatanTheme 
	soundTestText "THEME FOR SATAN"
	even
@brave:
	dc.b	musID_Brave 
	soundTestText "BRAVE OF PUYOPUYO"
	even
@ondo:
	dc.b	musID_Ondo 
	soundTestText "ONDO OF PUYOPUYO"
	even
@victory:
	dc.b	musID_Victory 
	soundTestText "VICTORY OF PUYOPUYO"
	even
	
SoundTest_VoiceTxtTbl:
	dc.l	@fire
	dc.l	@yattana
	dc.l	@puyopuyo
@yattana:
	dc.b    pcmID_Yattana
	soundTestText "YATTANA"
	even
@fire:
	dc.b    pcmID_Fire
	soundTestText "FIRE"
	even
@puyopuyo:
	dc.b    pcmID_PuyoPuyo
	soundTestText "PUYO PUYO"
	even
	
SoundTest_CommandTxtTbl:
	dc.l	@all_clear
	dc.l	@clear
	dc.l	@fade_out
	dc.l	@fade_in
	dc.l	@rebirth
	dc.l	@pause_on
	dc.l	@pause_off
@all_clear:
	dc.b	effID_AllClear 
	soundTestText "ALL CLEAR"
	even
@clear:
	dc.b	effID_Clear 
	soundTestText "CLEAR"
	even
@fade_out:
	dc.b	effID_FadeOut
	soundTestText "FADE OUT"
	even
@fade_in:
	dc.b	effID_FadeIn
	soundTestText "FADE IN"
	even
@rebirth:
	dc.b	effID_Rebirth
	soundTestText "REBIRTH"
	even
@pause_on:
	dc.b	effID_PauseOn 
	soundTestText "PAUSE ON"
	even
@pause_off:
	dc.b	effID_PauseOff 
	soundTestText "PAUSE OFF"
	even
	
Option_Init:
	MOVE.b	#$FF, $00FF1834
	MOVE.w	#$E000, D5
	MOVE.w	#$001B, D0
	MOVE.w	#$006C, D6
@OuterLoop:
	ORI	#$0700, SR
	JSR	loadBGSetupVDP
	ADDI.w	#$0080, D5
	MOVE.w	#$0027, D1
@InnerLoop:
	MOVE.w	D6, vdpData1
	EORI.b	#1, D6
	DBF	D1, @InnerLoop
	ANDI	#$F8FF, SR
	EORI.b	#2, D6
	DBF	D0, @OuterLoop
	BRA.w	Option_InitVramPlane

Option_InitObj:
	LEA	Option_Update, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	@Ret	; lol
	RTS
@Ret:
	RTS

Option_InitVramPlane:
	LEA	$00FFC000, A1
	MOVE.w	#$06FF, D0
@Loop:
	MOVE.w	#$8500, (A1)+
	DBF	D0, @Loop
	RTS
	
Option_DrawStaticText:
	MOVEM.l	D0, -(A7)
	BSR.b	Option_InitVramPlane
	MOVEM.l	(A7)+, D0
	LSL.w	#2, D0
	MOVEA.l	Option_StaticTxtLookup(PC,D0.w), A2
	MOVE.w	(A2)+, D0
	SUBQ.w	#1, D0
@Loop:
	MOVEA.l	(A2)+, A1
	MOVEM.l	A2/D0, -(A7)
	MOVE.w	(A1)+, D5
	MOVE.w	(A1)+, D6
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D0/A2
	DBF	D0, @Loop
	RTS
Option_StaticTxtLookup:
	dc.l	Option_TxtTbl
	dc.l	InputTest_TxtTbl
	dc.l	SoundTest_TxtTbl
	
InputTest_TxtTbl:
	dc.w	$000C 
	dc.l	@input_test
	dc.l	@press_start
	dc.l	@pad1_pad2
	dc.l	@button_a
	dc.l	@button_b
	dc.l	@button_c
	dc.l	@button_up
	dc.l	@button_down
	dc.l	@button_right
	dc.l	@button_left
	dc.l	@to_exit
	dc.l	@button_start
@input_test:
	dc.l	$009EA500
	soundTestText "INPUT TEST"
	even
@press_start:
	dc.l	$0B86A500
	soundTestText "PRESS START BUTTON AND A BUTTON"
	even
@to_exit:
	dc.l	$0CBAA500
	soundTestText "TO EXIT"
	even
@pad1_pad2:
	dc.l	$0222E500
	soundTestText "PAD1  PAD2"
	even
@button_start:
	dc.l	$03168500
	soundTestText "START:"
	even
@button_a:
	dc.l	$04108500
	soundTestText "BUTTON A:"
	even
@button_b:
	dc.l 	$05108500
	soundTestText "BUTTON B:"
	even
@button_c:
	dc.l	$06108500
	soundTestText "BUTTON C:"
	even
@button_up:
	dc.l	$07908500
	soundTestText "      UP:"
	even
@button_down:
	dc.l	$08908500
	soundTestText "    DOWN:"
	even
@button_right:
	dc.l	$09908500
	soundTestText "   RIGHT:"
	even
@button_left:
	dc.l	$0A908500
	soundTestText "    LEFT:"
	even
	
Option_TxtTbl:
	dc.w 	$000A
	dc.l	@option_mode
	dc.l	@p1_p2
	dc.l	@press_start
	dc.l	@button_a
	dc.l	@button_b
	dc.l	@button_c
	dc.l	@vs_com
	dc.l	@1p_vs_2p
	dc.l	@sampling
	dc.l	@key_assignment
@option_mode:
	dc.l	$009CA500
	soundTestText "OPTION MODE"
	even
@p1_p2:
	dc.l	$0312E500
	soundTestText "PLAYER-1       PLAYER-2"
	even
@press_start:
	dc.l	$0C8EA500
	soundTestText "PRESS START BUTTON TO EXIT"
	even
@button_a:
	dc.l	$040CE500
	soundTestText "A:              A:"
	even
@button_b:
	dc.l	$050CE500
	soundTestText "B:              B:"
	even
@button_c:
	dc.l	$060CE500
	soundTestText "C:              C:"
	even
@vs_com:
	dc.l	$078CE500
	soundTestText "VS.COM LEVEL   :"
	even
@1p_vs_2p:
	dc.l 	$088CE500
	soundTestText "1P VS.2P MODE  :"
	even
@sampling:
	dc.l	$098CE500
	soundTestText "SAMPLING       :"
	even
@key_assignment:
	dc.l 	$021AE500
	soundTestText "KEY ASSIGNMENT"
	even
	
SoundTest_TxtTbl:
	dc.w 	$0008
	dc.l	@sound_track
	dc.l	@press_start
	dc.l	@se1
	dc.l	@se2
	dc.l	@se3
	dc.l	@bgm
	dc.l	@voice
	dc.l	@command
@sound_track:
	dc.b	$01, $1A, $85, $00
	soundTestText "SOUND  TRACK"
	even
@press_start:
	dc.b	$0C, $8E, $E5, $00
	soundTestText "PRESS START BUTTON TO EXIT"
	even
@se1:
	dc.b	$02, $92, $E5, $00
	soundTestText "SE1:"
	even
@se2:
	dc.b	$03, $92, $E5, $00
	soundTestText "SE2:"
	even
@se3:
	dc.b	$04, $92, $E5, $00
	soundTestText "SE3:"
	even
@bgm:
	dc.b	$05, $92, $E5, $00
	soundTestText "BGM:"
	even
@voice:
	dc.b	$06, $8E, $E5, $00
	soundTestText "VOICE:"
	even
@command:
	dc.b	$07, $8A, $E5, $00
	soundTestText "COMMAND:"
	even	
	
loc_0001D69A:
	MOVE.w	#$8500, D6
	BTST.b	#0, $26(A0)
	BEQ.w	loc_0001D6C4
	CMP.b	$2C(A0), D0
	BNE.w	loc_0001D6B8
	MOVE.w	#$C500, D6
	BRA.w	loc_0001D6C4
loc_0001D6B8:
	CMP.b	$2D(A0), D0
	BNE.w	loc_0001D6C4
	MOVE.w	#$A500, D6
loc_0001D6C4:
	LEA	$00FFC002, A2
loc_0001D6CA:
	MOVE.b	(A1)+, D0
	BMI.w	loc_0001D6E2
	LSL.b	#1, D0
	MOVE.b	D0, D6
	MOVE.w	D6, -$2(A2,D5.w)
	ADDQ.b	#1, D6
	MOVE.w	D6, $7E(A2,D5.w)
	ADDQ.w	#2, D5
	BRA.b	loc_0001D6CA
loc_0001D6E2:
	RTS
	
Option_Update:
	MOVE.w	#0, D0
	BSR.w	Option_DrawStaticText
	JSR	ObjSys_UpdateObjNextOpTimer
	ADDQ.b	#1, $26(A0)
	BSR.w	loc_0001D8E4
	MOVE.b	ram_pad1Press, D0
	OR.b	$00FF1111, D0
	BTST.l	#7, D0
	BNE.w	loc_0001D72C
	MOVE.w	#0, D0
	MOVE.b	ram_pad1Press, D1
	BSR.w	loc_0001D74A
	MOVE.w	#1, D0
	MOVE.b	$00FF1111, D1
	BSR.w	loc_0001D74A
	RTS
loc_0001D72C:
	BSR.w	loc_0001DC02
	CLR.b	$00FF1834
	MOVE.b	#0, bc_returnState
	CLR.b	bc_stopRunning
	JMP	loc_00002AF2
loc_0001D74A:
	MOVE.b	#2, D2
	CMP.b	$00FF1884, D0
	BNE.w	loc_0001D76A
	MOVE.b	#6, D2
	TST.w	rOption_SoundTestEnabled
	BEQ.w	loc_0001D76A
	MOVE.b	#7, D2
loc_0001D76A:
	BTST.l	#0, D1
	BNE.w	loc_0001D794
	BTST.l	#1, D1
	BNE.w	loc_0001D7AA
	BTST.l	#2, D1
	BNE.w	loc_0001D7C4
	BTST.l	#3, D1
	BNE.w	loc_0001D7CC
	ANDI.b	#$70, D1
	BNE.w	loc_0001D894
	RTS
loc_0001D794:
	SUBQ.b	#1, $2C(A0,D0.w)
	BCC.w	loc_0001D7A0
	MOVE.b	D2, $2C(A0,D0.w)
loc_0001D7A0:
	MOVE.b	#sfxID_ChangeSelection, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D7AA:
	ADDQ.b	#1, $2C(A0,D0.w)
	CMP.b	$2C(A0,D0.w), D2
	BCC.w	loc_0001D7BA
	CLR.b	$2C(A0,D0.w)
loc_0001D7BA:
	MOVE.b	#sfxID_ChangeSelection, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D7C4:
	MOVE.b	#$FF, D1
	BRA.w	loc_0001D7D0
loc_0001D7CC:
	MOVE.b	#1, D1
loc_0001D7D0:
	CLR.w	D2
	MOVE.b	$2C(A0,D0.w), D2
	LSL.w	#2, D2
	MOVEA.l	loc_0001D7DE(PC,D2.w), A1
	JMP	(A1)
loc_0001D7DE:
	dc.l	loc_0001D7FE
	dc.l	loc_0001D7FE
	dc.l	loc_0001D7FE
	dc.l	loc_0001D83C
	dc.l	loc_0001D860
	dc.l	loc_0001D880
	dc.l	loc_0001D892 
	dc.l	loc_0001D892 
loc_0001D7FE:
	LEA	rOption_Player1AButton, A1
	TST.w	D0
	BEQ.w	loc_0001D810
	LEA	rOption_Player2AButton, A1
loc_0001D810:
	CLR.w	D2
	MOVE.b	$2C(A0,D0.w), D2
	MOVE.b	(A1,D2.w), D3
	ADD.b	D1, D3
	BPL.w	loc_0001D824
	MOVE.b	#2, D3
loc_0001D824:
	CMPI.b	#3, D3
	BCS.w	loc_0001D82E
	CLR.b	D3
loc_0001D82E:
	MOVE.b	D3, (A1,D2.w)
	MOVE.b	#sfxID_2B, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D83C:
	ADDQ.b	#1, rOption_ComputerLevel
	TST.b	D1
	BMI.w	loc_0001D84E
	SUBQ.b	#2, rOption_ComputerLevel
loc_0001D84E:
	ANDI.b	#3, rOption_ComputerLevel
	MOVE.b	#sfxID_2B, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D860:
	MOVE.b	rOption_2PlayerMode, D2
	SUBQ.b	#1, D2
	ADD.b	D1, D2
	ANDI.b	#7, D2
	ADDQ.b	#1, D2
	MOVE.b	D2, rOption_2PlayerMode
	MOVE.b	#sfxID_2B, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D880:
	EORI.b	#$FF, rOption_VoicesEnabled
	MOVE.b	#sfxID_2B, D0
	JMP	SndDrv_QueueSoundEffect
loc_0001D892:
	RTS
loc_0001D894:
	CMPI.b	#6, $2C(A0,D0.w)
	BEQ.w	loc_0001D8AA
	CMPI.b	#7, $2C(A0,D0.w)
	BEQ.w	loc_0001D8BC
	RTS
loc_0001D8AA:
	MOVE.b	#sfxID_2B, D0
	JSR	SndDrv_QueueSoundEffect
	MOVEM.l	(A7)+, D0
	BRA.w	loc_0001DAFE
loc_0001D8BC:
	MOVE.b	#sfxID_2B, D0
	JSR	SndDrv_QueueSoundEffect
	MOVEM.l	(A7)+, D0
	CLR.b	$00FF1834
	MOVE.b	#1, bc_returnState
	CLR.b	bc_stopRunning
	JMP	loc_00002AF2
loc_0001D8E4:
	BSR.w	loc_0001D902
	BSR.w	loc_0001D918
	BSR.w	loc_0001D9A4
	BSR.w	loc_0001D9EE
	BSR.w	loc_0001DA8C
	BSR.w	loc_0001DAB6
	BSR.w	loc_0001DAD4
	RTS
loc_0001D902:
	LEA	rOption_Player1AButton, A2
	MOVE.w	#$002C, D4
	MOVE.w	#$0410, D5
	MOVE.w	#$C500, D6
	BRA.w	loc_0001D92A
loc_0001D918:
	LEA	rOption_Player2AButton, A2
	MOVE.w	#$002D, D4
	MOVE.w	#$0430, D5
	MOVE.w	#$A500, D6
loc_0001D92A:
	BTST.b	#0, $26(A0)
	BNE.w	loc_0001D938
	MOVE.w	#$8500, D6
loc_0001D938:
	SWAP	D6
	MOVE.w	#$8500, D6
	CLR.w	D3
loc_0001D940:
	CLR.w	D0
	MOVE.b	(A2)+, D0
	LSL.w	#2, D0
	MOVEA.l	Option_KeyTxtTbl(PC,D0.w), A1
	MOVEM.l	A2/D6/D5/D4/D3, -(A7)
	CMP.b	(A0,D4.w), D3
	BNE.w	loc_0001D958
	SWAP	D6
loc_0001D958:
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D3/D4/D5/D6/A2
	ADDI.w	#$0100, D5
	ADDQ.w	#1, D3
	CMPI.w	#3, D3
	BCS.b	loc_0001D940
	RTS

Option_KeyTxtTbl:
	dc.l	@NoUse
	dc.l	@TurnLeft
	dc.l	@TurnRight
@NoUse:
	soundTestText "NO USE      "
	even
@TurnLeft:
	soundTestText "TURN LEFT  <"
	even
@TurnRight:
	soundTestText "TURN RIGHT >"
	even
	
loc_0001D9A4:
	MOVE.w	#$07AE, D5
	CLR.w	D0
	MOVE.b	rOption_ComputerLevel, D0
	LSL.w	#2, D0
	MOVEA.l	@DiffTxtTbl(PC,D0.w), A1
	MOVE.b	#3, D0
	BRA.w	loc_0001D69A
@DiffTxtTbl:
	dc.l	@Hardest
	dc.l	@Hard
	dc.l	@Normal
	dc.l	@Easy
@Hardest:
	soundTestText "HARDEST"
	even
@Hard:
	soundTestText "HARD   "
	even
@Normal:
	soundTestText "NORMAL "
	even
@Easy:
	soundTestText "EASY   "
	even
	
loc_0001D9EE:
	MOVE.w	#$08AE, D5
	CLR.w	D0
	MOVE.b	rOption_2PlayerMode, D0
	BEQ.w	loc_0001DA00
	SUBQ.b	#1, D0
loc_0001DA00:
	LSL.w	#2, D0
	MOVEA.l	@NumberTxtTbl(PC,D0.w), A1
	MOVEM.l	D0, -(A7)
	MOVE.w	#$A500, D6
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D0
	LEA	@GameMatch, A1
	TST.w	D0
	BEQ.w	@loc_0001DA28
	LEA	@GamesMatch, A1
@loc_0001DA28:
	MOVE.w	#$08B2, D5
	MOVE.b	#4, D0
	BRA.w	loc_0001D69A
@GameMatch:
	soundTestText "GAME MATCH "
	even
@GamesMatch:
	soundTestText "GAMES MATCH"
	even
	
@NumberTxtTbl:
	dc.l	@One
	dc.l	@Three
	dc.l	@Five
	dc.l	@Seven
	dc.l	@Nine
	dc.l	@Eleven
	dc.l	@Thirteen
	dc.l	@Fifteen
@One:
	soundTestText "1 "
	even
@Three:
	soundTestText "3 "
	even
@Five:
	soundTestText "5 "
	even
@Seven:
	soundTestText "7 "
	even
@Nine:
	soundTestText "9 "
	even
@Eleven:
	soundTestText "11"
	even
@Thirteen:
	soundTestText "13"
	even
@Fifteen:
	soundTestText "15"
	even
	
loc_0001DA8C:
	MOVE.b	#5, D0
	MOVE.w	#$09AE, D5
	LEA	@On, A1
	TST.b	rOption_VoicesEnabled
	BEQ.w	@VoicesEnabled
	LEA	@Off, A1
@VoicesEnabled:
	BRA.w	loc_0001D69A
@On:
	soundTestText "ON "
	even
@Off:
	soundTestText "OFF"
	even
	
loc_0001DAB6:
	MOVE.b	#6, D0
	MOVE.w	#$0A9E, D5
	LEA	@InputTest, A1
	BRA.w	loc_0001D69A
@InputTest:
	soundTestText "INPUT TEST"
	even
	
loc_0001DAD4:
	TST.w	rOption_SoundTestEnabled
	BEQ.w	@SoundTestNotEnabled
	MOVE.b	#7, D0
	MOVE.w	#$0B9E, D5
	LEA	@SoundTest, A1
	BSR.w	loc_0001D69A
@SoundTestNotEnabled:
	RTS
@SoundTest:
	soundTestText "SOUND TEST"
	even
	
loc_0001DAFE:
	MOVE.w	#1, D0
	BSR.w	Option_DrawStaticText
	JSR	ObjSys_UpdateObjNextOpTimer
	BSR.w	@loc_0001DB44
	MOVE.b	ram_pad1Held, D0
	ANDI.b	#$C0, D0
	EORI.b	#$C0, D0
	BEQ.w	@loc_0001DB36
	MOVE.b	$00FF1110, D0
	ANDI.b	#$C0, D0
	EORI.b	#$C0, D0
	BEQ.w	@loc_0001DB36
	RTS
@loc_0001DB36:
	MOVE.b	#sfxID_2B, D0
	JSR	SndDrv_QueueSoundEffect
	BRA.w	Option_Update
@loc_0001DB44:
	MOVE.b	ram_pad1Held, D0
	LSL.w	#8, D0
	MOVE.b	$00FF1110, D0
	LEA	loc_0001DB92, A2
	MOVE.w	#$000F, D1
@loc_0001DB5C:
	MOVE.w	(A2)+, D5
	LEA	@On, A1
	MOVE.w	#$E500, D6
	ROR.l	#1, D0
	BCS.w	@loc_0001DB78
	LEA	@Off, A1
	MOVE.w	#$C500, D6
@loc_0001DB78:
	MOVEM.l	A2/D1/D0, -(A7)
	BSR.w	loc_0001D6C4
	MOVEM.l	(A7)+, D0/D1/A2
	DBF	D1, @loc_0001DB5C
	RTS
@On:
	soundTestText "ON"
	even
@Off: ; This specific string uses special characters to display the 2 char wide off text.
	dc.b	$2C, $2D, $FF, $00 
loc_0001DB92:
	dc.b	$07, $B0, $08, $B0, $0A, $B0, $09, $B0, $05, $30, $06, $30, $04, $30, $03, $30, $07, $A4, $08, $A4, $0A, $A4, $09, $A4, $05, $24, $06, $24, $04, $24, $03, $24 

Check_GetChecksum:
	move.l #endOfRom-1, D0
	addq.l #1, D0
	lea ($200).w, A0
	sub.l A0, D0
	asr.l #1, D0
	move.w D0, D2
	subq.w #1, D2
	swap D0
	moveq #0, D1
@Loop:
	add.w (A0)+, D1
	dbf D2, @Loop
	dbf D0, @Loop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	move.b #0, (bc_returnState).l
	cmp.w (checksum).w, D1
	beq.w @ChecksumPass
	move.b #$FF, (bc_returnState).l
@ChecksumPass:
	move.w D1, (ram_calcChecksum).l
	rts