MenuScreen_Init:
	MOVE.b	#2, D0
	MOVE.b	#0, D1
	MOVE.b	#2, D2
	LEA	palLookupTable, A2
	ADDA.l	#(pal_general-palLookupTable), A2
	JSR	loc_00000E28
	LEA	MenuScreen_MainObjInit, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	@ObjectCreateSuccess
	RTS
@ObjectCreateSuccess:
	MOVE.b	#$80, $6(A1)
	MOVE.b	#6, $8(A1)
	MOVE.b	#$0C, $9(A1)
	MOVE.w	#$00D6, $A(A1)
	MOVE.b	$00FF0105, $27(A1)
	MOVE.l	#MenuScreen_MenuPuyoAnim, $32(A1)
	BRA.w	MenuScreen_InitCloudScroll
	
MenuScreen_UpdateBGMapMenuSel:
	MOVE.w	$26(A0), D0
	ADDI.w	#$000C, D0
	JMP	Video_LoadBgMapFromId
	
MenuScreen_MainObjInit:
	MOVE.w	#$0100, D4
	MOVE.w	#$D922, D5
	MOVE.w	#$8500, D6
	MOVE.w	#$0280, $28(A0)
	BSR.b	MenuScreen_UpdateBGMapMenuSel
	JSR	ObjSys_UpdateObjNextOpTimer
	BSR.w	loc_0000B1CC
	JSR	Anim_UpdateCutsceneSprite
	BSR.w	loc_00004BF2
	MOVE.b	D0, D1
	ANDI.b	#$F0, D0
	BNE.w	MenuScreen_PressedABCStart
	BTST.l	#btn_Up, D1
	BNE.w	@PressedUp
	BTST.l	#btn_Down, D1
	BNE.w	@PressedDown
	RTS
@PressedUp:
	TST.w	$26(A0)
	BEQ.w	@BoundsCheckAtEnd
	SUBQ.w	#1, $26(A0)
	BRA.w	@PlayChangeSelection
@PressedDown:
	CMPI.w	#3, $26(A0)
	BCC.w	@BoundsCheckAtEnd
	ADDQ.w	#1, $26(A0)
@PlayChangeSelection:
	MOVE.b	#sfxID_ChangeSelection, D0
	BSR.w	SndDrv_QueueSoundEffect
@BoundsCheckAtEnd:
	BRA.b	MenuScreen_UpdateBGMapMenuSel
	
loc_0000B1CC:
	MOVE.w	$26(A0), D0
	MULU.w	#$0018, D0
	ADDI.w	#$00D8, D0
	MOVE.w	D0, $E(A0)
	RTS
	
MenuScreen_PressedABCStart:
	BSR.w	MenuScreen_Check2PController
	BCC.w	@2PlayerNotDisabled
	MOVE.b	#sfxID_MinorGarbagePuyoFall2, D0
	JMP	SndDrv_QueueSoundEffect
@2PlayerNotDisabled:
	MOVE.b	$27(A0), $00FF0105
	MOVE.b	#sfxID_ConfirmSelection, D0
	BSR.w	SndDrv_QueueSoundEffect
	CLR.w	$28(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	#$0010, $28(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$28(A0), D0
	ROR.b	#2, D0
	ANDI.b	#$80, D0
	MOVE.b	D0, $6(A0)
	SUBQ.w	#1, $28(A0)
	BEQ.w	@DelayTimerDone
	RTS
@DelayTimerDone:
	MOVE.w	$26(A0), D0
	MOVE.b	@BcReturnTbl(PC,D0.w), D1
	MOVE.b	D1, $00FF1882
	MOVE.b	D1, rBytecode_Ret
	BEQ.w	MenuScreen_InitDifficultySel
	CMPI.b	#3, D1
	BEQ.w	@IsOptions
	CLR.b	$00FF1884
@IsOptions:
	CLR.b	rBytecode_StopRun
	JMP	loc_00002AF2
@BcReturnTbl:
	dc.b 	$00, $01, $02, $03, $04
	even
MenuScreen_MenuPuyoAnim:
	dc.b	$08
	dc.b	$0C 
	dc.b	$08
	dc.b	$0D 
	dc.b	$FF
	dc.b	$00 
	dc.l	MenuScreen_MenuPuyoAnim
	
MenuScreen_Check2PController:
	CMPI.w	#1, $26(A0)
	BNE.w	@CheckPass
	BSR.w	@CheckControllers
	TST.b	D0
	BEQ.w	@CheckPass
	ORI	#1, SR
	RTS
@CheckPass:
	ANDI	#$FFFE, SR
	RTS
	
@CheckControllers:
	ORI	#$0700, SR
	MOVE.w	#$0100, Z80BusReq
@WaitForZ80Halt:
	BTST.b	#0, Z80BusReq
	BNE.b	@WaitForZ80Halt
	BSR.w	@StartControllerCheck
	MOVE.w	#0, Z80BusReq
	ANDI	#$F8FF, SR
	RTS
	
@StartControllerCheck:
	LEA	padData1, A1
	BSR.w	@CheckController
	LEA	padData2, A1
	MOVEM.l	D0, -(A7)
	BSR.w	@CheckController
	MOVEM.l	(A7)+, D1
	OR.b	D1, D0
	RTS
@CheckController:
	MOVE.b	#0, (A1)
	NOP
	NOP
	MOVE.b	(A1), D0
	ANDI.b	#$0F, D0
	MOVE.b	#$40, (A1)
	NOP
	NOP
	MOVE.b	(A1), D1
	LSL.b	#4, D1
	ANDI.b	#$F0, D1
	OR.b	D1, D0
	; D0 now contains RLDU00DU
	MOVEQ	#0, D1
	MOVE.w	#3, D2
@CheckLoop:
	LSL.b	#1, D1
	MOVEM.l	D0, -(A7)
	ANDI.b	#$C0, D0
	BEQ.w	@BothBitsZero
	ORI.b	#1, D1
@BothBitsZero:
	MOVEM.l	(A7)+, D0
	LSL.b	#2, D0
	DBF	D2, @CheckLoop
	MOVE.b	#0, D0
	; By the time we get here, D1 should contain 0D if the controller is plugged in.
	CMPI.b	#$0D, D1
	BEQ.w	@ControllerPluggedIn
	; Controller not plugged in.
	MOVE.b	#$FF, D0
@ControllerPluggedIn:
	RTS
	
MenuScreen_InitCloudScroll:
	LEA	@CloudScrollUpdate, A1
	JMP	ObjSys_InitObjWithFunc
@CloudScrollUpdate:
	ADDQ.w	#1, $26(A0)
	MOVE.w	$26(A0), D1
	MOVE.w	#$006F, D0
	LEA	rScrollXScanBack, A1
@Loop:
	MOVE.w	D1, (A1)+
	ADDQ.w	#2, A1
	DBF	D0, @Loop
	RTS
	
MenuScreen_InitDifficultySel:
	MOVE.w	#$9501, D0
	SWAP	D0
	JSR	loc_00000C4C
	MOVE.w	#$0028, $26(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	#$00B7, D0
	LEA	$00FF0662, A1
@UpdateScroll:
	SUBQ.w	#8, (A1)+
	ADDQ.w	#2, A1
	DBF	D0, @UpdateScroll
	SUBQ.w	#1, $26(A0)
	BEQ.w	@ScrollDone
	RTS
	
@ScrollDone:
	MOVE.w	#$0100, D4
	MOVE.w	#$D922, D5
	MOVE.w	#$8500, D6
	MOVE.w	#$0280, $28(A0)
	BSR.w	Menu_LoadEasyMessage
	MOVE.b	#1, $27(A0)
	CLR.b	$2A(A0)
loc_0000B3A8:
	JSR	ObjSys_UpdateObjNextOpTimer
	BSR.w	loc_0000B460
	ADDQ.b	#1, $2A(A0)
	BSR.w	loc_00004BF2
	ANDI.b	#$F0, D0
	BNE.w	@ABCStartPressed
	BSR.w	loc_00004BF2
	BTST.l	#btn_Left, D0
	BNE.w	@LeftPressed
	BTST.l	#btn_Right, D0
	BNE.w	@RightPressed
	RTS
; This chunk of code handles the main menu selection for 1 Player
; Specifically, it sets the bounds for where it can go
@LeftPressed:
	TST.w	$26(A0)
	BEQ.w	@BoundsCheckAtEdge
	SUBQ.w	#1, $26(A0)	
	BRA.w	@Part2
@RightPressed:
	CMPI.w	#2, $26(A0)
	BCC.w	@BoundsCheckAtEdge
	ADDQ.w	#1, $26(A0)
@Part2:
	MOVE.b	#sfxID_ChangeSelection, D0
	BSR.w	SndDrv_QueueSoundEffect
	CLR.b	$2A(A0)
	BRA.b	loc_0000B3A8
@BoundsCheckAtEdge:
	RTS
	
@ABCStartPressed:
	MOVE.b	#sfxID_ConfirmSelection, D0
	BSR.w	SndDrv_QueueSoundEffect
	CLR.w	$28(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	#$0010, $28(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$26(A0), D1 ; Reads the value of the selection for 1 Player
	MOVE.w	$28(A0), D0
	ANDI.b	#1, D0
	BEQ.w	@loc_0000B438
	MOVE.w	#3, D1
@loc_0000B438:
	BSR.w	loc_0000B4A0
	SUBQ.w	#1, $28(A0)
	BEQ.w	@TimerDone
	RTS
@TimerDone:
	MOVE.b	$27(A0), $00FF0114
	BSR.w	Menu_LoadDefeatedEnemies
	CLR.b	rBytecode_StopRun
	JSR	ObjSys_UpdateObjNextOpTimer
	RTS

loc_0000B460:
	MOVE.b	$2A(A0), D0
	ANDI.b	#$0F, D0
	BEQ.w	loc_0000B46E
	RTS
loc_0000B46E:
	MOVE.w	#3, D1
	BTST.b	#4, $2A(A0)
	MOVE.w	$26(A0), D0
	CLR.w	D1
	LEA	Menu_StageSelectTbl, A1
	MOVE.b	(A1,D0.w), D1
	MOVE.b	D1, rOnePlayer_CurStage
	LEA	tbl_cutsceneOrder, A1
	MOVE.b	(A1,D1.w), rOnePlayer_CurCutscene
	MOVE.w	$26(A0), D1
loc_0000B4A0:
	MOVE.w	#$9500, D0
	MOVE.b	loc_0000B4B0(PC,D1.w), D0
	SWAP	D0
	JMP	loc_00000C4C
loc_0000B4B0:
	dc.b	$02
	dc.b	$01
	dc.b	$00
	dc.b	$03
	
Menu_LoadDefeatedEnemies:
	MOVE.w	$26(A0), D0
	LSL.w	#4, D0
	LEA	@DefeatedEnemyPresetTbl, A1
	ADDA.w	D0, A1
	LEA	rOnePlayer_DefeatedEnemyTbl, A2
	MOVE.w	#$000F, D0
@Loop:
	MOVE.b	(A1)+, (A2)+
	DBF	D0, @Loop
	RTS
@DefeatedEnemyPresetTbl:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 
	dc.b	$FF, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00 
	dc.b	$FF, $FF, $00, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $FF, $00 
	
Menu_LoadEasyMessage:
	LEA	@EasyMessageUpdate, A1
	JSR	ObjSys_InitObjWithFunc
	BCS.w	@ObjectLoadFailed
	MOVE.l	A0, $2E(A1)
	MOVE.b	#6, $8(A1)
	MOVE.b	#4, $9(A1)
	MOVE.w	#$00A0, $A(A1)
@ObjectLoadFailed:
	RTS
@EasyMessageUpdate:
	MOVEA.l	$2E(A0), A1
	TST.w	$26(A1)
	BEQ.w	@MenuHoverEasy
	MOVE.b	#0, $6(A0)
	RTS
@MenuHoverEasy:
	MOVE.b	#$80, $6(A0)
	MOVE.b	$36(A0), D0
	ORI.b	#$80, D0
	MOVE.w	#$0400, D1
	JSR	SignedSinWithMul
	SWAP	D2
	ADDI.w	#$0118, D2
	MOVE.w	D2, $E(A0)
	ADDQ.b	#6, $36(A0)
	RTS