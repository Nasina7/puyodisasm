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

; Ram
; $00FF0000 = Decomp Buffer ; 0x100 Bytes
; $00FF0100 = Decomp Buffer2; 0x4 Bytes

ram_calcChecksum = $FF0106 	; Word

mus_curSong = $FF012F		; Byte

; Goes until FF09A1
rScrollXScanFront = $FF0622
rScrollXScanBack = $FF0624

ram_pad1Held = $FF110A		; Byte
ram_pad1Press = $FF110B		; Byte

randomNumber = $FF1116		; Long

debug_CpuPlayer = $FF1876	; Byte
debug_puyoDrop = $FF1877	; Byte
debug_skipStages = $FF1878	; Byte
debug_unknown = $FF1879		; Byte

rMissionMode_CurBoard = $FF1889 ; Byte

ObjectBuffer = $FFE000

SystemStack = $FFFC00

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
