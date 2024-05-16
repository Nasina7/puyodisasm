; General note: When we exit the game over menu, the value of 
; rBytecode_Ret will determine what happens.
;   * 00 = Player will continue
;   * FF = Player gave up

GameOver_InitVDP:
	ORI	#$0700, SR
	MOVE.w	#$CC08, D5
	BSR.w	@LoadScrollText
	MOVE.w	#$CC48, D5
	BSR.w	@LoadScrollText
	MOVE.w	#$E000, D5
	MOVE.w	#7, D0
	MOVE.w	#$41F0, D1
@LoadSkyGradientLoop:
	JSR	loadBGSetupVDP
	ADDI.w	#$0080, D5
	MOVE.w	#$0027, D2
@WriteXLoop:
	MOVE.w	D1, vdpData1
	DBF	D2, @WriteXLoop
	ADDQ.w	#1, D1
	DBF	D0, @LoadSkyGradientLoop
	ANDI	#$F8FF, SR
	RTS
	
@LoadScrollText:
	JSR	loadBGSetupVDP
	ADDI.w	#$0080, D5
	MOVE.w	#$0017, D0
	MOVE.w	#$2160, D1
@WriteDataLoop:
	MOVE.w	D1, vdpData1
	ADDQ.w	#1, D1
	DBF	D0, @WriteDataLoop
	JSR	loadBGSetupVDP
	MOVE.w	#$0017, D0
@WriteDataLoop2:
	MOVE.w	D1, vdpData1
	ADDQ.w	#1, D1
	DBF	D0, @WriteDataLoop2
	RTS

GameOver_Init:
	BSR.w	@InitGameOverText
	LEA	@MainObject, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	@AllocSuccess
	RTS
@AllocSuccess:
	MOVE.w	#1, $12(A1)
	MOVE.w	#11, $28(A1)
	MOVE.b	#$FF, rBytecode_Ret
	BSR.w	loc_0000D1DA
	RTS

@MainObject:
	BSR.w	loc_00004BF2
	BTST.l	#7, D0
	BEQ.w	@ContinueRunning
	JSR	arcade_checkCoins
	BCS.w	@ContinueRunning
	BRA.w	@ExitContinue
@ContinueRunning:
	ANDI.b	#$70, D0
	BNE.w	@ABCPressed
	TST.w	$26(A0)
	BNE.w	@FrameTimerNonZero
@ABCPressed:
	SUBQ.w	#1, $28(A0)
	BCS.w	@ExitGiveUp
	MOVE.w	#$9200, D0
	MOVE.b	$29(A0), D0
	SWAP	D0
	JSR	Video_QueueBgMapSpecial
	MOVE.w	#$0050, $26(A0)
	MOVE.b	#sfxID_ChangeSelection, D0
	JSR	SndDrv_QueueSoundEffect
@FrameTimerNonZero:
	SUBQ.w	#1, $26(A0)
	BSR.w	@UpdateTextScroll
	MOVE.b	$27(A0), D0
	ANDI.b	#3, D0
	BEQ.w	@UpdateFlashingPalette
	RTS
	
@ExitContinue:
	MOVE.b	#sfxID_ConfirmSelection, D0
	BSR.w	SndDrv_QueueSoundEffect
	CLR.b	rBytecode_Ret
@ExitGiveUp:
	CLR.b	rBytecode_StopRun
	JSR	ObjSys_UpdateObjNextOpTimer
	RTS

@UpdateTextScroll:
	; Start at Scanline 192
	LEA	(rScrollXScanFront+192*2*2), A1
	SUBQ.w	#2, (A1)
	MOVE.w	(A1), D0
	MOVE.w	#$000F, D1
@LoopUpdateScroll:
	MOVE.w	D0, (A1)+
	MOVE.w	#0, (A1)+
	DBF	D1, @LoopUpdateScroll
	RTS

@UpdateFlashingPalette:
	MOVE.w	$A(A0), D0
	ADD.w	$12(A0), D0
	CMPI.w	#6, D0
	BCS.w	@UnkBranch
	NEG.w	$12(A0)
	MOVE.w	$A(A0), D0
@UnkBranch:
	MOVE.w	D0, $A(A0)
	ADDQ.w	#2, D0
	LSL.w	#1, D0
	MOVE.w	D0, D1
	LSL.w	#4, D0
	OR.w	D1, D0
	MOVE.w	D0, $00FF0A94
	MOVE.b	#1, D0
	LEA	$00FF0A76, A2
	JMP	Video_LoadPaletteIntoIndex

@InitGameOverText:
	MOVE.w	#7, D0
@LoadLettersLoop:
	LEA	@LetterMain, A1
	JSR	loc_00002AB0	; Same as InitObjWithFunc, but doesn't check $1(A0)?
	BCS.w	@AllocFail
	MOVE.b	#$83, $6(A1)
	MOVE.b	#$1F, $8(A1)
	MOVE.b	D0, $9(A1)
	MOVE.w	D0, D1
	LSL.w	#1, D1
	MOVE.w	@FinalXPositions(PC,D1.w), $1E(A1)
	LSL.b	#4, D1
	MOVE.b	D1, $36(A1)
	MOVE.w	#$00A0, $38(A1)
@AllocFail:
	DBF	D0, @LoadLettersLoop
	RTS
@FinalXPositions:
	dc.w	$00C8, $00E0, $00F8, $0110, $0130, $0148, $0160, $0178 

@LetterMain:
	MOVE.b	$36(A0), D0
	MOVE.w	$38(A0), D1
	JSR	SignedSinWithMul
	ASR.l	#8, D2
	ADDI.w	#$0120, D2
	MOVE.w	D2, $A(A0)
	ADDI.b	#$10, D0
	JSR	SignedCosWithMul
	ASR.l	#8, D2
	ADDI.w	#$00F0, D2
	MOVE.w	D2, $E(A0)
	ADDQ.b	#2, $36(A0)
	SUBQ.w	#1, $38(A0)
	BCS.w	@AnimPart2
	RTS
@AnimPart2:
	CLR.w	D0
	MOVE.b	$9(A0), D0
	LSL.w	#3, D0
	MOVE.w	D0, $26(A0)
	CLR.b	$36(A0)
	MOVE.w	$1E(A0), D0
	SUBI.w	#$0120, D0
	SWAP	D0
	ASR.l	#7, D0
	MOVE.l	D0, $12(A0)
	MOVE.l	#$FFFF9000, $16(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	TST.w	$26(A0)
	BEQ.w	@AnimPart3
	SUBQ.w	#1, $26(A0)
	RTS
@AnimPart3:
	MOVE.w	#$0080, $26(A0)
	MOVE.l	$E(A0), $32(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.l	$32(A0), $E(A0)
	JSR	SprSys_UpdatePosInterpolate
	MOVE.l	$E(A0), $32(A0)
	SUBQ.w	#1, $26(A0)
	BEQ.w	@AnimPart4
	MOVE.b	$27(A0), D0
	ORI.b	#$80, D0
	MOVE.w	#$7800, D1
	JSR	SignedSinWithMul
	SWAP	D2
	ADD.w	D2, $E(A0)
	RTS
@AnimPart4:
	JSR	ObjSys_UpdateObjNextOpTimer
	JSR	arcade_checkCoins ; This call does nothing
	MOVE.b	$36(A0), D0
	ORI.b	#$80, D0
	MOVE.w	#$1800, D1
	JSR	SignedSinWithMul
	SWAP	D2
	ADDI.w	#$00B8, D2
	MOVE.w	D2, $E(A0)
	ADDQ.b	#2, $36(A0)
	RTS

; Dead Code.
; In the arcade version of the game, once the game over text is about to land,
; the text disappears and text stating "PUSH 1P START BUTTON" appears.
; This doesn't happen in the Megadrive release, but the code for it, seen below
; still exists.  Remove the RTS in the above code to restore this behavior.
	TST.b	$9(A0)
	BEQ.w	@AnimPart5
	JMP	loc_00002AF2
@AnimPart5:
	MOVE.b	#0, $6(A0)	
	JSR	ObjSys_UpdateObjNextOpTimer	
	MOVE.l	#$800B0F00, D0	
	TST.b	$00FF1884	
	BEQ.w	@UnkBranch2	
	MOVE.l	#$80100F00, D0	
@UnkBranch2:
	JMP	Video_QueueBgMapSpecial	