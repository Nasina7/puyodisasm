	include "game/bytecode/variables.asm"

Bytecode_Init:
	MOVE.l	#Bytecode_Bootup, rBytecode_PC
	CLR.b	rBytecode_Ret
	CLR.b	rBytecode_StopRun
	RTS
	
Bytecode_Run:
	TST.b	rBytecode_StopRun
	BEQ.w	@StepBytecode
	RTS
@StepBytecode:
	CLR.b	rBytecode_StopLoop
	MOVEA.l	rBytecode_PC, A0
	MOVE.w	(A0)+, D1
	MOVE.w	(A0)+, D0
	MOVE.l	A0, rBytecode_PC
	ASL.w	#2, D1
	MOVEA.l	@OpcodeTbl(PC,D1.w), A0
	JSR	(A0)
	TST.b	rBytecode_StopLoop
	BEQ.b	@StepBytecode
	RTS
@OpcodeTbl:
	dc.l	BytecodeOP_Stop
	dc.l	BytecodeOP_Nop
	dc.l	BytecodeOP_Delay
	dc.l	BytecodeOP_WaitPal
	dc.l	BytecodeOP_WriteRAM
	dc.l	BytecodeOP_RunFunc
	dc.l	BytecodeOP_Jump
	dc.l	BytecodeOP_JumpEQ
	dc.l	BytecodeOP_JumpNE
	dc.l	BytecodeOP_JumpTbl
	dc.l	BytecodeOP_SetVDP
	dc.l	BytecodeOP_LoadArt
	dc.l	BytecodeOP_RunVDPCommand
	dc.l	BytecodeOP_LoadPal
	dc.l	BytecodeOP_LoadPalFade
	dc.l	BytecodeOP_PlaySnd
	dc.l	BytecodeOP_PlaySndCheckSample
	dc.l	BytecodeOP_FadeMusic
	dc.l	BytecodeOP_StopAllSound
	dc.l	BytecodeOP_PlaySndCheckSample2
	
BytecodeOP_Stop:
	SUBQ.l	#2, rBytecode_PC
	MOVE.b	#$FF, rBytecode_StopLoop
	MOVE.b	#$FF, rBytecode_StopRun
	RTS
	
BytecodeOP_Nop:
	SUBQ.l	#2, rBytecode_PC
	MOVE.b	#$FF, rBytecode_StopLoop
	RTS
	
BytecodeOP_Delay:
	MOVE.b	#$FF, rBytecode_StopLoop
	MOVE.b	#$FF, rBytecode_StopRun
	LEA	@DelayObjInit, A1
	BSR.w	ObjSys_InitObjWithFunc
	BCC.w	@ObjCreateSuccess
	RTS
@ObjCreateSuccess:
	MOVE.w	D0, $24(A1)
	RTS
@DelayObjInit:
	BSR.w	ObjSys_UpdateObjNextOpTimer
	CLR.b	rBytecode_StopRun
	BRA.w	loc_00002AF2
	
BytecodeOP_WaitPal:
	SUBQ.l	#2, rBytecode_PC
	MOVE.b	#$FF, rBytecode_StopLoop
	MOVE.b	#$FF, rBytecode_StopRun
	LEA	@WaitPalObjInit, A1
	BRA.w	ObjSys_InitObjWithFunc
@WaitPalObjInit:
	BSR.w	@loc_00001504
	BCC.w	@loc_000014FA
	RTS
@loc_000014FA:
	CLR.b	rBytecode_StopRun
	BRA.w	loc_00002AF2
@loc_00001504:
	LEA	$00FF0AD6, A2
	MOVE.w	#3, D0
@Loop:
	TST.w	(A2)
	BNE.w	@loc_00001524
	ADDA.l	#$00000082, A2
	DBF	D0, @Loop
	ANDI	#$FFFE, SR
	RTS
@loc_00001524:
	ORI	#1, SR
	RTS
	
BytecodeOP_WriteRAM:
	MOVEA.l	rBytecode_PC, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.w	(A0)+, D1
	MOVE.l	A0, rBytecode_PC
	MOVEA.l	D0, A0
	MOVE.w	D1, (A0)
	RTS
	
BytecodeOP_RunFunc:
	MOVEA.l	rBytecode_PC, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.l	A0, rBytecode_PC
	MOVEA.l	D0, A0
	JMP	(A0)
	
BytecodeOP_Jump:
	MOVEA.l	rBytecode_PC, A0
	SWAP	D0
	MOVE.w	(A0), D0
	MOVE.l	D0, rBytecode_PC
	RTS

BytecodeOP_JumpEQ:
	TST.b	rBytecode_Ret
	BEQ.b	BytecodeOP_Jump
	ADDQ.l	#2, rBytecode_PC
	RTS
	
BytecodeOP_JumpNE:
	TST.b	rBytecode_Ret
	BNE.b	BytecodeOP_Jump
	ADDQ.l	#2, rBytecode_PC
	RTS
	
BytecodeOP_JumpTbl:
	MOVEA.l	rBytecode_PC, A0
	CLR.w	D1
	MOVE.b	rBytecode_Ret, D1
	CMP.w	D0, D1
	BCS.w	@NotOOB
	MOVE.w	D0, D1
	SUBQ.w	#1, D1
@NotOOB:
	LSL.w	#2, D1
	MOVE.l	(A0,D1.w), D2
	MOVE.l	D2, rBytecode_PC
	RTS
	
BytecodeOP_SetVDP:
	BRA.w	bc_setVDPMode
	
BytecodeOP_LoadArt:
	MOVEA.l	rBytecode_PC, A1
	MOVEA.l	(A1)+, A0
	MOVE.l	A1, rBytecode_PC
	BRA.w	System_DecompressComp
	
BytecodeOP_RunVDPCommand:
	BRA.w	Video_LoadBgMapFromId
	
BytecodeOP_LoadPalFade:
	MOVE.b	D0, D1
	LSR.w	#3, D0
	ANDI.l	#$00001FFF, D0
	LEA	palLookupTable, A2
	ADDA.l	D0, A2
	MOVE.b	D1, D0
	MOVEA.l	rBytecode_PC, A0
	MOVE.b	(A0)+, D1
	MOVE.b	(A0)+, D2
	MOVE.l	A0, rBytecode_PC
	BRA.w	loc_00000E46
	
BytecodeOP_LoadPal:
	MOVE.b	D0, D1
	LSR.w	#3, D0
	ANDI.l	#$00001FFF, D0
	LEA	palLookupTable, A2
	ADDA.l	D0, A2
	MOVE.b	D1, D0
	BRA.w	Video_LoadPaletteIntoIndex

BytecodeOP_PlaySnd:
	JMP	SndDrv_PlayMusicId
	
BytecodeOP_PlaySndCheckSample:
	JMP	SndDrv_QueueSoundEffect
	
BytecodeOP_FadeMusic:
	SUBQ.l	#2, rBytecode_PC
	JMP	SndDrv_PlayFadeOut
	
BytecodeOP_StopAllSound:
	SUBQ.l	#2, rBytecode_PC
	JMP	SndDrv_PlayClearEffect
	
BytecodeOP_PlaySndCheckSample2:
	JMP	SndDrv_PlayVoice