TitleScreen_CreateArleObj:

	LEA	TitleScreen_ArleObjUpdate1, A1
	JSR	ObjSys_InitObjWithFunc
	BCS.w	@ObjDidntLoad
	MOVEA.l	A1, A2
	MOVE.b	#$80, $6(A1)
	MOVE.b	#$24, $8(A1)
	MOVE.b	#6, $9(A1)
	MOVE.w	#$0160, $A(A1)
	MOVE.l	#loc_0000CB4C, $32(A1)
	
	LEA	loc_0000CDB2, A1
	JSR	ObjSys_InitObjWithFunc
	BCS.w	@ObjDidntLoad
	MOVE.l	A2, $2E(A1)
	MOVE.b	#$24, $8(A1)
	
	LEA	loc_0000CDEE, A1
	JSR	ObjSys_InitObjWithFunc
	BCS.w	@ObjDidntLoad
	MOVE.l	A2, $2E(A1)
	MOVE.b	#$24, $8(A1)
@ObjDidntLoad:
	RTS

TitleScreen_ArleObjUpdate1:
	MOVE.w	$00FF05D2, D0
	ADDI.w	#$0160, D0
	MOVE.w	D0, $E(A0)
	JSR	Anim_UpdateCutsceneSprite
	TST.b	$9(A0)
	BMI.w	loc_0000CAA4
	RTS
loc_0000CAA4:
	CLR.w	D0
	MOVE.b	$9(A0), D0
	LSR.b	#2, D0
	ANDI.b	#$0F, $9(A0)
	ANDI.b	#$1C, D0
	MOVEA.l	loc_0000CABC(PC,D0.w), A1
	JMP	(A1)
loc_0000CABC:
	dc.l	TitleScreen_ArleObj_PlayFire
	dc.l	loc_0000CAD0
	dc.l	TitleScreen_ArleObj_PlayBounce
	dc.l	loc_0000CD24
	dc.l	loc_0000CB80
loc_0000CAD0:
	MOVE.b	#0, $6(A0)
	BSR.w	loc_0000CB8E
	BSR.w	loc_0000CCAE
	MOVE.w	#$0140, D0
	JSR	loc_00002B1C
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.b	#$80, $6(A0)
	MOVE.b	#$0D, $9(A0)
	MOVE.b	#0, $36(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.b	$36(A0), D0
	MOVE.w	#$4800, D1
	JSR	SignedSinWithMul
	SWAP	D2
	NEG.w	D2
	ADD.w	$00FF05D2, D2
	ADDI.w	#$01A8, D2
	MOVE.w	D2, $E(A0)
	ADDQ.b	#2, $36(A0)
	CMPI.b	#$40, $36(A0)
	BCC.w	loc_0000CB36
	RTS
loc_0000CB36:
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$00FF05D2, D0
	ADDI.w	#$0160, D0
	MOVE.w	D0, $E(A0)
	RTS
loc_0000CB4C:
	dc.b	$40
	dc.b	$06 
	dc.b	$F0
	dc.b	$06 
	dc.b	$01
	dc.b	$0B 
	dc.b	$03
	dc.b	$0C 
	dc.b	$02
	dc.b	$0B 
	dc.b	$F0
	dc.b	$06 
	dc.b	$01
	dc.b	$0B 
	dc.b	$03
	dc.b	$0C 
	dc.b	$02
	dc.b	$0B 
	dc.b	$20
	dc.b	$06 
	dc.b	$02
	dc.b	$89 
	dc.b	$03
	dc.b	$0A 
	dc.b	$02
	dc.b	$09 
	dc.b	$18
	dc.b	$06 
	dc.b	$02
	dc.b	$09 
	dc.b	$10
	dc.b	$0A 
	dc.b	$04
	dc.b	$08 
	dc.b	$60
	dc.b	$07 
	dc.b	$40
	dc.b	$B7 
	dc.b	$01
	dc.b	$AE 
	dc.b	$01
	dc.b	$CE 
	dc.b	$01
	dc.b	$CE 
	dc.b	$01
	dc.b	$CE 
	dc.b	$01
	dc.b	$CE 
	dc.b	$01
	dc.b	$CE 
	dc.b	$00
	dc.b	$90 
	
loc_0000CB80:
	ADDQ.w	#2, $26(A0)
	MOVE.w	$26(A0), D0
	ADDQ.w	#2, $E(A0)
	RTS
loc_0000CB8E:
	MOVE.w	#7, D0
loc_0000CB92:
	LEA	loc_0000CBD8, A1
	JSR	ObjSys_InitObjWithFunc
	BCS.w	loc_0000CBD2
	MOVE.l	A0, $2E(A1)
	MOVE.b	#$24, $8(A1)
	MOVE.b	#$15, $9(A1)
	MOVE.b	#$80, $6(A1)
	MOVE.w	$A(A0), $1E(A1)
	SUBI.w	#$0038, $1E(A1)
	MOVE.b	D0, D1
	ROR.b	#3, D1
	MOVE.b	D1, $36(A1)
	MOVE.w	#$0080, $26(A1)
loc_0000CBD2:
	DBF	D0, loc_0000CB92
	RTS
loc_0000CBD8:
	MOVE.b	$36(A0), D0
	MOVE.w	#$4000, D1
	JSR	SignedSinWithMul
	SWAP	D2
	ADD.w	$1E(A0), D2
	MOVE.w	D2, $A(A0)
	MOVE.w	#$1000, D1
	JSR	SignedCosWithMul
	SWAP	D2
	ADDI.w	#$0130, D2
	MOVE.w	$26(A0), D1
	SUBI.w	#$0040, D1
	BCC.w	loc_0000CC0E
	CLR.w	D1
loc_0000CC0E:
	ADD.w	D1, D2
	MOVE.w	D2, $20(A0)
	ADD.w	$00FF05D2, D2
	MOVE.w	D2, $E(A0)
	SUBQ.b	#3, $36(A0)
	SUBQ.w	#1, $26(A0)
	BEQ.w	loc_0000CC2C
	RTS
loc_0000CC2C:
	MOVE.w	#$0010, $26(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$20(A0), D0
	ADD.w	$00FF05D2, D0
	MOVE.w	D0, $E(A0)
	SUBQ.w	#1, $26(A0)
	BEQ.w	loc_0000CC50
	RTS
loc_0000CC50:
	MOVE.b	#$87, $6(A0)
	MOVE.w	$20(A0), $1E(A0)
	MOVE.w	#$3000, $1C(A0)
	MOVE.w	#$FFFC, $16(A0)
	MOVE.w	#$FFFF, $20(A0)
	MOVE.b	$36(A0), D0
	MOVE.w	#$0100, D1
	JSR	SignedSinWithMul
	MOVE.l	D2, $12(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$1E(A0), $E(A0)
	JSR	SprSys_UpdatePosInterpolate
	BCS.w	loc_0000CCA8
	MOVE.w	$E(A0), $1E(A0)
	MOVE.w	$00FF05D2, D0
	ADD.w	D0, $E(A0)
	RTS
loc_0000CCA8:
	JMP	loc_00002AF2
loc_0000CCAE:
	LEA	loc_0000CCFC, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	loc_0000CCC0
	RTS
loc_0000CCC0:
	MOVE.b	#$87, $6(A1)
	MOVE.b	#$24, $8(A1)
	MOVE.b	#$0F, $9(A1)
	MOVE.w	$A(A0), $A(A1)
	ADDI.w	#$FFC8, $A(A1)
	MOVE.w	#$0120, $1E(A1)
	MOVE.w	#$FFFA, $16(A1)
	MOVE.w	#$FFFF, $20(A1)
	MOVE.w	#$3200, $1C(A1)
	MOVE.w	#$FFFE, $12(A1)
loc_0000CCFC:
	MOVE.w	$1E(A0), $E(A0)
	JSR	SprSys_UpdatePosInterpolate
	BCS.w	loc_0000CD1E
	MOVE.w	$E(A0), $1E(A0)
	MOVE.w	$00FF05D2, D0
	ADD.w	D0, $E(A0)
	RTS
loc_0000CD1E:
	JMP	loc_00002AF2
	
loc_0000CD24:
	LEA	loc_0000CD54, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	loc_0000CD36
	RTS
loc_0000CD36:
	MOVE.l	A0, $2E(A1)
	MOVE.b	#$80, $6(A1)
	MOVE.b	#$24, $8(A1)
	MOVE.b	#$0F, $9(A1)
	MOVE.b	#$3E, $36(A1)
	RTS
	
loc_0000CD54:
	MOVEA.l	$2E(A0), A1
	MOVE.b	$36(A0), D0
	MOVE.w	#$A000, D1
	JSR	SignedSinWithMul
	SWAP	D2
	NEG.w	D2
	ADD.w	$E(A1), D2
	ADDI.w	#$FFB0, D2
	MOVE.w	D2, $E(A0)
	MOVE.w	$A(A1), D0
	CLR.w	D1
	MOVE.b	$36(A0), D1
	MULU.w	#3, D1
	ADD.w	D1, D0
	ADDI.w	#$FFDC, D0
	MOVE.w	D0, $A(A0)
	SUBQ.b	#1, $36(A0)
	BCS.w	loc_0000CD98
	RTS
loc_0000CD98:
	JMP	loc_00002AF2
	
TitleScreen_ArleObj_PlayFire:
	MOVE.b	#pcmID_Fire, D0
	JMP	SndDrv_PlayVoice
	
TitleScreen_ArleObj_PlayBounce:
	MOVE.b	#sfxID_PuyoBounceOnArle, D0
	JMP	SndDrv_QueueSoundEffect
	
loc_0000CDB2:
	MOVE.b	#0, $6(A0)
	MOVEA.l	$2E(A0), A1
	CMPI.b	#$0B, $9(A1)
	BCS.w	loc_0000CDEC
	CMPI.b	#$0D, $9(A1)
	BCC.w	loc_0000CDEC
	MOVE.w	$A(A1), $A(A0)
	MOVE.w	$E(A1), $E(A0)
	MOVE.b	$9(A1), $9(A0)
	ADDQ.b	#7, $9(A0)
	MOVE.b	#$80, $6(A0)
loc_0000CDEC:
	RTS
loc_0000CDEE:
	MOVE.b	#0, $6(A0)
	MOVEA.l	$2E(A0), A1
	CMPI.b	#9, $9(A1)
	BCS.w	loc_0000CE28
	CMPI.b	#$0B, $9(A1)
	BCC.w	loc_0000CE28
	MOVE.w	$A(A1), $A(A0)
	MOVE.w	$E(A1), $E(A0)
	MOVE.b	$9(A1), $9(A0)
	ADDQ.b	#7, $9(A0)
	MOVE.b	#$80, $6(A0)
loc_0000CE28:
	RTS
	
TitleScreen_CopyrightObjInit:
	MOVE.b	#$80, $6(A0)
	MOVE.b	#$24, $8(A0)
	MOVE.b	#5, $9(A0)
	MOVE.w	#$0120, $A(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	MOVE.w	$00FF05D2, D0
	ADDI.w	#$014C, D0
	MOVE.w	D0, $E(A0)
	RTS
	
	
TitleScreen_Init:
	BSR.w	TitleScreen_CreateTitlePuyos
	BSR.w	TitleScreen_InitValues
	BSR.w	TitleScreen_CreateTitleObj
	
	LEA	TitleScreen_CopyrightObjInit, A1
	JSR	ObjSys_InitObjWithFunc
	BSR.w	TitleScreen_CreateArleObj
	
	LEA	TitleScreen_MainObjInit, A1
	JSR	ObjSys_InitObjWithFunc

	BCS.w	@TitleScreenDidntLoad
	MOVE.b	#$24, $8(A1)
	MOVE.w	#$0120, $A(A1)
	MOVE.b	#7, $29(A1)
	MOVE.b	#$1F, $28(A1)
@TitleScreenDidntLoad:
	RTS
	
loc_0000CE9E:
	MOVEM.l	D0, -(A7)
	CLR.w	D0
	MOVE.b	rOption_ComputerLevel, D0
	MOVE.b	@loc_0000CEB8(PC,D0.w), $00FF0104
	MOVEM.l	(A7)+, D0
	RTS
@loc_0000CEB8:
	dc.b	$00, $02, $04, $06 

TitleScreen_InitValues:
	BSR.b	loc_0000CE9E
	CLR.l	$00FF187A
	CLR.l	$00FF187E
	CLR.w	$00FF010E
	CLR.w	$00FF0110
	CLR.w	$00FF0144
	CLR.w	rOnePlayer_CurStage
	CLR.b	$00FF0115
	CLR.b	$00FF0105
	CLR.b	$00FF1884
	MOVE.w	#$0011, D0
	LEA	rOnePlayer_DefeatedEnemyTbl, A1
@Loop:
	CLR.b	(A1)+
	DBF	D0, @Loop
	RTS
	
TitleScreen_ScrollBG:
	MOVE.w	$00FF05D4, D0
	ANDI.b	#7, D0
	BNE.w	loc_0000CF40
	MOVE.w	#$9600, D0
	SWAP	D0
	MOVE.w	$28(A0), D0
	JSR	loc_00000C4C
	BSR.w	loc_0000CF48
	SUBQ.b	#1, $29(A0)
	BCC.w	loc_0000CF36
	MOVE.b	#$0B, $29(A0)
loc_0000CF36:
	SUBQ.b	#1, $28(A0)
	ANDI.b	#$1F, $28(A0)
loc_0000CF40:
	SUBQ.w	#1, $00FF05D4
	RTS
loc_0000CF48:
	CMPI.b	#8, $29(A0)
	BNE.w	loc_0000CF98
	JSR	updateRNG
	ANDI.w	#$000F, D0
	CMPI.w	#7, D0
	BCC.w	loc_0000CF98
	LEA	loc_0000CF9A, A1
	JSR	loc_00002AB0
	BCS.w	loc_0000CF98
	MULU.w	#$000C, D0
	MOVE.w	$28(A0), D1
	ANDI.w	#$FF00, D1
	ADDI.w	#$E002, D1
	ADD.w	D1, D0
	MOVE.w	D0, $26(A1)
	MOVE.w	#$00E0, $28(A1)
	MOVE.l	#loc_0000CFD2, $32(A1)
loc_0000CF98:
	RTS
	
loc_0000CF9A:
	JSR	Anim_UpdateCutsceneSprite
	CLR.w	D0
	MOVE.b	$9(A0), D0
	CMP.b	$8(A0), D0
	BEQ.w	loc_0000CFC2
	MOVE.b	D0, $8(A0)
	ORI.w	#$9C00, D0
	SWAP	D0
	MOVE.w	$26(A0), D0
	JSR	loc_00000C4C
loc_0000CFC2:
	SUBQ.w	#1, $28(A0)
	BEQ.w	loc_0000CFCC
	RTS
loc_0000CFCC:
	JMP	loc_00002AF2
loc_0000CFD2:
	dc.b	$08, $02 
	dc.b	$0A
	dc.b	$01 
	dc.b	$08
	dc.b	$02 
	dc.b	$0A
	dc.b	$03 
	dc.b	$FF
	dc.b	$00 
	dc.l	loc_0000CFD2
	
	
TitleScreen_MainObjInit:
	BSR.w	TitleScreen_UpdateSndTstCode
	BSR.w	TitleScreen_ScrollBG
	
	MOVE.w	$00FF05D2, D0
	ADDI.w	#$00F0, D0
	MOVE.w	D0, $E(A0)
	
	MOVE.b	ram_pad1Press, D0
	OR.b	$00FF1111, D0
	BTST.l	#7, D0
	BEQ.w	@StartNotPressed
	; Start was pressed, check if there are coins inserted
	JSR	arcade_checkCoins
	BCC.w	TitleScreen_MainObjEnd
@StartNotPressed:
	BRA.w	@UselessBranch

@UselessBranch:
	MOVE.b	#4, D0
	JSR	arcade_checkCoins
	BCC.w	@CoinsAreInserted
	MOVE.b	#3, D0
@CoinsAreInserted:
	; Display the "Press Start" text, only if coins are inserted.
	MOVE.b	D0, $9(A0)
	MOVE.w	$00FF05C6, D0
	LSL.b	#3, D0
	ANDI.b	#$80, D0
	MOVE.b	D0, $6(A0)
	RTS
	
TitleScreen_UpdateSndTstCode:
	MOVE.b	ram_pad1Press, D0
	OR.b	$00FF1111, D0
	ANDI.b	#$74, D0
	BNE.w	@PressABCLeft
	RTS
@PressABCLeft:
	MOVE.w	$2A(A0), D1
	MOVE.b	Title_SndTstCode(PC,D1.w), D2
	CMP.b	D2, D0
	BEQ.w	@IsCurButton
	CLR.w	$2A(A0)
	RTS
@IsCurButton:
	ADDQ.w	#1, D1
	MOVE.b	Title_SndTstCode(PC,D1.w), D0
	BMI.w	@EndOfCode
	MOVE.w	D1, $2A(A0)
	RTS
@EndOfCode:
	CLR.w	$2A(A0)
	MOVE.b	#sfxID_UnlockSndTst, D0
	JSR	SndDrv_QueueSoundEffect
	MOVE.w	rOption_SoundTestEnabled, D0
	NOT.w	D0
	MOVE.w	D0, rOption_SoundTestEnabled
	JMP	loc_0001DC02
Title_SndTstCode:
	dc.b	btnb_A, btnb_A, btnb_Left, btnb_B, btnb_B, btnb_Left, btnb_C, btnb_C, $FF
	even

TitleScreen_MainObjEnd:
	MOVE.b	#1, $00FF1884
	MOVE.b	#1, $00FF1888
	MOVE.b	$00FF1111, D0
	BTST.l	#7, D0
	BNE.w	@StartPressed
	EORI.b	#1, $00FF1884
	EORI.b	#1, $00FF1888
@StartPressed:
	MOVE.b	#sfxID_ConfirmSelection, D0
	JSR	SndDrv_QueueSoundEffect
	CLR.b	rBytecode_StopRun
	CLR.b	rBytecode_Ret
	JMP	loc_00002AF2
	
TitleScreen_CreateTitlePuyos:
	LEA	TitleScreen_PuyoInit, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	@Success
	RTS
@Success:
	MOVE.b	#$80, $6(A1)   ; Interpolate Flags
	MOVE.b	#$24, $8(A1)   ; mapping
	MOVE.w	#$0154, $A(A1) ; xpos
	MOVE.w	#$0070, $E(A1) ; ypos
	MOVE.l	#@TitlePuyoAnim, $32(A1)
	MOVE.w	#$0040, $26(A1); timer
	LEA	TitleScreen_PuyoInit, A1
	JSR	ObjSys_InitObjWithFunc
	BCC.w	@Success2
	RTS
@Success2:
	MOVE.b	#$80, $6(A1)
	MOVE.b	#$24, $8(A1)
	MOVE.w	#$00D4, $A(A1)
	MOVE.w	#$0070, $E(A1)
	MOVE.l	#@TitlePuyoAnim, $32(A1)
	MOVE.w	#$0050, $26(A1)
	RTS
@TitlePuyoAnim:
	dc.b	$00
	dc.b	$00 
	dc.b	$01
	dc.b	$01 
	dc.b	$00
	dc.b	$00 
	dc.b	$02
	dc.b	$02 
	dc.b	$00
	dc.b	$00 
	dc.b	$01
	dc.b	$01 
	dc.b	$00
	dc.b	$00 
	dc.b	$02
	dc.b	$02 
@TitlePuyoAnimLoop:
	dc.b	$F0, $00 
	dc.b	$01
	dc.b	$01 
	dc.b	$00
	dc.b	$00 
	dc.b	$02
	dc.b	$02 
	dc.b	$00
	dc.b	$00 
	dc.b	$01
	dc.b	$01 
	dc.b	$00
	dc.b	$00 
	dc.b	$02
	dc.b	$02 
	dc.b	$FF
	dc.b	$00 
	dc.l	@TitlePuyoAnimLoop
	
TitleScreen_PuyoInit:
	TST.w	$26(A0)
	BEQ.w	@TimerIsZero
	SUBQ.w	#1, $26(A0)
	RTS
@TimerIsZero:
	MOVE.b	#$95, $6(A0)
	MOVE.w	#$FFFF, $20(A0)
	MOVE.w	#$0800, $1C(A0)
	JSR	ObjSys_UpdateObjNextOpTimer
	JSR	SprSys_UpdatePosInterpolate
	CMPI.w	#$00B8, $E(A0)
	BCC.w	@YPosGreaterB8
	RTS
@YPosGreaterB8:
	MOVE.w	#$00B8, $E(A0)
	MOVE.b	#sfxID_PlacePuyo, D0
	BSR.w	SndDrv_QueueSoundEffect
	JSR	ObjSys_UpdateObjNextOpTimer
	JMP	Anim_UpdateCutsceneSprite