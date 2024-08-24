NULL = 0

Z80Ram =     $A00000
Z80BusReq =  $A11100
Z80Reset =   $A11200
padData1 = 	$A10003
padData2 = 	$A10005
padData3 = 	$A10007
padControl1 = $A10009
padControl2 = $A1000B
padControl3 = $A1000D

vdpData1 = $C00000
vdpData2 = $C00002
vdpControl1 = $C00004
vdpControl2 = $C00006

; Joypad (bit numbers)
btn_Start = 7
btn_A = 6
btn_C = 5
btn_B = 4
btn_Right = 3
btn_Left = 2
btn_Down = 1
btn_Up = 0

; Joypad (byte values)
btnb_Start = $80
btnb_A = $40
btnb_C = $20
btnb_B = $10
btnb_Right = $8
btnb_Left = $4
btnb_Down = $2
btnb_Up = $1

; Cutscene IDs:
cutID_SkeletonT 	= $00
cutID_Suketoudara 	= $01
cutID_Zombie		= $02
cutID_Draco			= $03
cutID_Nasu			= $04
cutID_Witch			= $05
cutID_Sasoriman		= $06
cutID_Harpy			= $07
cutID_ZohDaimaoh	= $08
cutID_Schezo		= $09
cutID_Minotauros	= $0A
cutID_Rulue			= $0B
cutID_Satan			= $0C
cutID_Mummy			= $0D
cutID_Sukiyapotes	= $0E
cutID_Panotty		= $0F
cutID_EasyEnding	= $10

; Stage IDs:
stgID_SkeletonT		= $00
stgID_Nasu			= $01
stgID_Mummy			= $02
stgID_Draco 		= $03
stgID_Suketoudara 	= $04
stgID_Sukiyapotes   = $05
stgID_Harpy			= $06
stgID_Sasoriman		= $07
stgID_Panotty		= $08
stgID_Zombie		= $09
stgID_Witch			= $0A
stgID_ZohDaimaoh	= $0B
stgID_Schezo 		= $0C
stgID_Minotauros	= $0D
stgID_Rulue			= $0E
stgID_Satan			= $0F

; Z80 Ram
zrIDQueueCnt = $22

; Ram
; $00FF0000 = Decomp Buffer ; 0x100 Bytes
; $00FF0100 = Decomp Buffer2; 0x4 Bytes


ram_calcChecksum = $FF0106 	; Word

rOnePlayer_CurStage = $FF0112
rOnePlayer_CurCutscene = $FF0113
rOnePlayer_DefeatedEnemyTbl = $FF0116

rZ80CurCmdMain = $FF012C
rZ80CurCmdP1 = $FF012D
rZ80CurCmdP2 = $FF012E
rZ80CurSong = $FF012F		; Byte
rZ80CurSFXQueue = $FF0130 ; 4 Bytes
rZ80IsBeingUpdated = $FF0134 ; Word

rFrameCount = $FF05C6		; Word
;rFF05C8-FF05C9 (Unused)
rFrameTimer = $FF05CA   ; Word
rSecondTimer = $FF05CC  ; Word
rMinuteTimer = $FF05CE  ; Long (Upper half contains rSecondTimer%60, lower half is minutes)

; Goes until FF09A1
rScrollXScanFront = $FF0622
rScrollXScanBack = $FF0624

rVDPRegBTbl = $FF0A22 ; Goes to 0A34.  All of the table is used, but only some of it needs labels.
rvtMode1 = $00
rvtMode2 = $01
rvtMode3 = $0B
rvtMode4 = $0C
;rFF0A35 (Unused, probably an even macro)
rBytecode_PC = $FF0A36 				; Long
rBytecode_Ret = $FF0A3A				; Byte
rBytecode_StopRun = $FF0A3B			; Byte
rBytecode_StopLoop = $FF0A3C 		; Byte
;rFF0A3D (Unused, probably an even macro)
rPalQueueTable = $FF0A3E ; Goes until $FF0A55
rPalQueueMainEnt1  = $FF0A56 ; Goes until $FF0A75
rPalQueueMainEnt2  = $FF0A76 ; Goes until $FF0A95
rPalQueueMainEnt3  = $FF0A96 ; Goes until $FF0AB5
rPalQueueMainEnt4  = $FF0AB6 ; Goes until $FF0AD5

rTmpVDPDmaDest = $FF1106   ; Word

rPad1Held = $FF110A		; Byte
rPad1Press = $FF110B	; Byte

rPad2Held = $FF1110     ; Byte
rPad2Press = $FF1111    ; Byte

randomNumber = $FF1116		; Long

rRunningOptionsMenuCode = $FF1834 ; Word

debug_CpuPlayer = $FF1876	; Byte
debug_puyoDrop = $FF1877	; Byte
debug_skipStages = $FF1878	; Byte
debug_unknown = $FF1879		; Byte

rCurGameMode = $FF1882		; Byte [0 = Story, 1 = VS, 2 = Endless, 3 = Option, 4 = Tutorial]
rCurMainPlayer = $FF1884    ; Byte (Set to the controller number that should be in control in 1 player mode)

rMissionMode_CurBoard = $FF1889 ; Byte

rPlaneBuffer = $FFC000 ; Goes to FFCDFF, used as a temporary plane buffer for menus (and other things?)
ObjectBuffer = $FFE000

SystemStack = $FFFC00

rOption_SoundTestEnabled = $00FFFC02
rOption_2PlayerMode = $00FFFCA4
rOption_ComputerLevel = $00FFFCA5
rOption_Player1AButton = $00FFFCA6
rOption_Player1BButton = $00FFFCA7
rOption_Player1CButton = $00FFFCA8
rOption_Player2AButton = $00FFFCA9
rOption_Player2BButton = $00FFFCAA
rOption_Player2CButton = $00FFFCAB
rOption_VoicesEnabled = $00FFFCAC
;rOption_FFFCAD


; 0 = Priority System
; Bits 3 and 2 
; Struct constants for objects
; 0 - Something to do with animation / updating?
; 1 - ???
; 2-5 - Pointer to update function
; 6 - Render Flags (Bit 7 to enable animation)
; 7 - ???
Obj_SprMap = $8 ; 8 (Sprite Mapping ID)
Obj_AnmFrm = $9 ; 9 (Animation Frame)
Obj_XPos = $A ; A-B (X Pos)
; C-D?
Obj_YPos = $E ; E-F (Y Pos)
; 10-21?
Obj_AnmTmr = $22 ; 22 (Time until next frame of anim)
; 23-31?
Obj_Anim = $32 ; 32-35 (Pointer to current anim)
; 36-3F?

; Sprite Mapping IDs
SprMapID_Arle = $08
SprMapID_Zombie = $0B
SprMapID_Satan = $15
SprMapID_Carbuncle = $19
SprMapID_BigPuyo = $1A
SprMapID_Birds = $1B
SprMapID_Credits = $1C
SprMapID_Lightning = $1D
SprMapID_GameOverTxt = $29

; Game modes
GameModeID_Story = $0
GameModeID_VS = $1
GameModeID_Endless = $2
GameModeID_Options = $3
GameModeID_Tutorial = $4
