initBytecode:
	MOVE.l	#BC_Bootup, BC_programCounter
loc_000013E2:
	CLR.b	BC_returnState
	CLR.b	BC_stopRunning
	RTS
runBytecode:
	TST.b	BC_stopRunning
	BEQ.w	.bytecodeLoop
	RTS
.bytecodeLoop:
	CLR.b	BC_stopBytecodeLoop
	MOVEA.l	BC_programCounter, A0
	MOVE.w	(A0)+, D1
	MOVE.w	(A0)+, D0
	MOVE.l	A0, BC_programCounter
	ASL.w	#2, D1
	MOVEA.l	bytecodeFunctionLookup(PC,D1.w), A0
	JSR	(A0)
	TST.b	BC_stopBytecodeLoop
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
	SUBQ.l	#2, BC_programCounter
	MOVE.b	#$FF, BC_stopBytecodeLoop
	MOVE.b	#$FF, BC_stopRunning
	RTS
	
.bytecodeNop:
	SUBQ.l	#2, BC_programCounter
	MOVE.b	#$FF, BC_stopBytecodeLoop
	RTS
	
.delayForFrames:
	MOVE.b	#$FF, BC_stopBytecodeLoop
	MOVE.b	#$FF, BC_stopRunning
	LEA	loc_000014C2, A1
	BSR.w	loc_00002A54
	BCC.w	loc_000014BC
	RTS
loc_000014BC:
	MOVE.w	D0, $24(A1)
	RTS
loc_000014C2:
	BSR.w	loc_00002B26
	CLR.b	BC_stopRunning
	BRA.w	loc_00002AF2
	
.waitForPal:
	SUBQ.l	#2, BC_programCounter
	MOVE.b	#$FF, BC_stopBytecodeLoop
	MOVE.b	#$FF, BC_stopRunning
	LEA	loc_000014F0, A1
	BRA.w	loc_00002A54
loc_000014F0:
	BSR.w	loc_00001504
	BCC.w	loc_000014FA
	RTS
loc_000014FA:
	CLR.b	BC_stopRunning
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
	MOVEA.l	BC_programCounter, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.w	(A0)+, D1
	MOVE.l	A0, BC_programCounter
	MOVEA.l	D0, A0
	MOVE.w	D1, (A0)
	RTS
	
.runFunction: ; Case 0005
	MOVEA.l	BC_programCounter, A0
	SWAP	D0
	MOVE.w	(A0)+, D0
	MOVE.l	A0, BC_programCounter
	MOVEA.l	D0, A0
	JMP	(A0)
	
.jumpLocation: ; Case 0006
	MOVEA.l	BC_programCounter, A0
	SWAP	D0
	MOVE.w	(A0), D0
	MOVE.l	D0, BC_programCounter
	RTS

.jumpLocationEQ: ; Case 0007
	TST.b	BC_returnState
	BEQ.b	.jumpLocation
	ADDQ.l	#2, BC_programCounter
	RTS
	
.jumpLocationNE: ; Case 0008
	TST.b	BC_returnState
	BNE.b	.jumpLocation
	ADDQ.l	#2, BC_programCounter
	RTS
	
.jumpTable:
	MOVEA.l	BC_programCounter, A0
	CLR.w	D1
	MOVE.b	BC_returnState, D1
	CMP.w	D0, D1
	BCS.w	loc_000015A0
	MOVE.w	D0, D1
	SUBQ.w	#1, D1
loc_000015A0:
	LSL.w	#2, D1
	MOVE.l	(A0,D1.w), D2
	MOVE.l	D2, BC_programCounter
	RTS
	
.setVDPMode:
	BRA.w	loc_00000D30
	
.loadArt:
	MOVEA.l	BC_programCounter, A1
	MOVEA.l	(A1)+, A0
	MOVE.l	A1, BC_programCounter
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
	MOVEA.l	BC_programCounter, A0
	MOVE.b	(A0)+, D1
	MOVE.b	(A0)+, D2
	MOVE.l	A0, BC_programCounter
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
	JMP	loc_000072E6
	
.playSoundCheckSample:
	JMP	loc_000072BE
	
.fadeMusic:
	SUBQ.l	#2, BC_programCounter
	JMP	loc_000072EE
	
.stopAllSound:
	SUBQ.l	#2, BC_programCounter
	JMP	loc_00007308
	
.playSoundCheckSample2:
	JMP	loc_00007356