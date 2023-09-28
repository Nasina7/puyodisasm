initBytecode:
	MOVE.l	#BC_Bootup, bc_programCounter
loc_000013E2:
	CLR.b	bc_returnState
	CLR.b	bc_stopRunning
	RTS
runBytecode:
	TST.b	bc_stopRunning
	BEQ.w	.bytecodeLoop
	RTS
.bytecodeLoop:
	CLR.b	bc_stopLoop
	MOVEA.l	bc_programCounter, A0
	MOVE.w	(A0)+, D1
	MOVE.w	(A0)+, D0
	MOVE.l	A0, bc_programCounter
	ASL.w	#2, D1
	MOVEA.l	bytecodeFunctionLookup(PC,D1.w), A0
	JSR	(A0)
	TST.b	bc_stopLoop
	BEQ.b	.bytecodeLoop
	RTS
bytecodeFunctionLookup:
	dc.l	.stopBytecode
	dc.l	.bytecodeNop
	dc.l	.delayForFrames
	dc.l	.waitForPal
	dc.l	.writeRam
	dc.l	.runFunction
	dc.l	.jumpLocation
	dc.l	.jumpLocationEQ
	dc.l	.jumpLocationNE
	dc.l	.jumpTable
	dc.l	.setVDPMode
	dc.l	.loadArt
	dc.l	.runVDPCommand
	dc.l	.loadPalette
	dc.l	.loadPaletteFade
	dc.l	.playSound
	dc.l	.playSoundCheckSample
	dc.l	.fadeMusic
	dc.l	.stopAllSound
	dc.l	.playSoundCheckSample2
	
.stopBytecode:
	SUBQ.l	#2, bc_programCounter
	MOVE.b	#$FF, bc_stopLoop
	MOVE.b	#$FF, bc_stopRunning
	RTS
	
.bytecodeNop:
	SUBQ.l	#2, bc_programCounter
	MOVE.b	#$FF, bc_stopLoop
	RTS
	
.delayForFrames:
	MOVE.b	#$FF, bc_stopLoop
	MOVE.b	#$FF, bc_stopRunning
	LEA	loc_000014C2, A1
	BSR.w	ObjSys_InitObjWithFunc
	BCC.w	loc_000014BC
	RTS
loc_000014BC:
	MOVE.w	D0, $24(A1)
	RTS
loc_000014C2:
	BSR.w	ObjSys_UpdateObjNextOpTimer
	CLR.b	bc_stopRunning
	BRA.w	loc_00002AF2
	
.waitForPal:
	SUBQ.l	#2, bc_programCounter
	MOVE.b	#$FF, bc_stopLoop
	MOVE.b	#$FF, bc_stopRunning
	LEA	loc_000014F0, A1
	BRA.w	ObjSys_InitObjWithFunc
loc_000014F0:
	BSR.w	loc_00001504
	BCC.w	loc_000014FA
	RTS
loc_000014FA:
	CLR.b	bc_stopRunning
	BRA.w	loc_00002AF2
loc_00001504:
	LEA	$00FF0AD6, A2
	MOVE.w	#3, D0
.loop:
	TST.w	(A2)
	BNE.w	loc_00001524
	ADDA.l	#$00000082, A2
	DBF	D0, .loop
	ANDI	#$FFFE, SR
	RTS
loc_00001524:
	ORI	#1, SR
	RTS
	
.writeRam:
	MOVEA.l	bc_programCounter, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.w	(A0)+, D1
	MOVE.l	A0, bc_programCounter
	MOVEA.l	D0, A0
	MOVE.w	D1, (A0)
	RTS
	
.runFunction:
	MOVEA.l	bc_programCounter, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.l	A0, bc_programCounter
	MOVEA.l	D0, A0
	JMP	(A0)
	
.jumpLocation:
	MOVEA.l	bc_programCounter, A0
	SWAP	D0
	MOVE.w	(A0), D0
	MOVE.l	D0, bc_programCounter
	RTS

.jumpLocationEQ:
	TST.b	bc_returnState
	BEQ.b	.jumpLocation
	ADDQ.l	#2, bc_programCounter
	RTS
	
.jumpLocationNE:
	TST.b	bc_returnState
	BNE.b	.jumpLocation
	ADDQ.l	#2, bc_programCounter
	RTS
	
.jumpTable:
	MOVEA.l	bc_programCounter, A0
	CLR.w	D1
	MOVE.b	bc_returnState, D1
	CMP.w	D0, D1
	BCS.w	loc_000015A0
	MOVE.w	D0, D1
	SUBQ.w	#1, D1
loc_000015A0:
	LSL.w	#2, D1
	MOVE.l	(A0,D1.w), D2
	MOVE.l	D2, bc_programCounter
	RTS
	
.setVDPMode:
	BRA.w	bc_setVDPMode
	
.loadArt:
	MOVEA.l	bc_programCounter, A1
	MOVEA.l	(A1)+, A0
	MOVE.l	A1, bc_programCounter
	BRA.w	graphicsDecompress
	
.runVDPCommand:
	BRA.w	loc_00000BF2
	
.loadPaletteFade:
	MOVE.b	D0, D1
	LSR.w	#3, D0
	ANDI.l	#$00001FFF, D0
	LEA	palLookupTable, A2
	ADDA.l	D0, A2
	MOVE.b	D1, D0
	MOVEA.l	bc_programCounter, A0
	MOVE.b	(A0)+, D1
	MOVE.b	(A0)+, D2
	MOVE.l	A0, bc_programCounter
	BRA.w	loc_00000E46
	
.loadPalette:
	MOVE.b	D0, D1
	LSR.w	#3, D0
	ANDI.l	#$00001FFF, D0
	LEA	palLookupTable, A2
	ADDA.l	D0, A2
	MOVE.b	D1, D0
	BRA.w	loc_00001020

.playSound:
	JMP	SndDrv_PlayMusicId
	
.playSoundCheckSample:
	JMP	SndDrv_QueueSoundEffect
	
.fadeMusic:
	SUBQ.l	#2, bc_programCounter
	JMP	snd_playFadeOut
	
.stopAllSound:
	SUBQ.l	#2, bc_programCounter
	JMP	SndDrv_PlayClearEffect
	
.playSoundCheckSample2:
	JMP	SndDrv_PlayVoice