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

; Music / SFX Constants:
musID_Final = 1
musID_Theme = 2
musID_Baroque = 3
musID_Cooking = 4
musID_Morning = 5
musID_Toy = 6
musID_Sorrow = 7
musID_Sticker = 8
musID_Sunset = $A
musID_Rejection = $B
musID_Memories = $C
musID_HarpyTheme = $D
musID_Warning = $E
musID_SatanTheme = $F
musID_Brave = $10
musID_Ondo = $11
musID_Victory = $12

; Cutscene IDs:
cutID_SkeletonT 	= 0
cutID_Suketoudara 	= 1
cutID_Zombie		= 2
cutID_Draco			= 3
cutID_Nasu			= 4
cutID_Witch			= 5
cutID_Sasoriman		= 6
cutID_Harpy			= 7
cutID_ZohDaimaoh	= 8
cutID_Schezo		= 9
cutID_Minotauros	= $A
cutID_Rulue			= $B
cutID_Satan			= $C
cutID_Mummy			= $D
cutID_Sukiyapotes	= $E
cutID_Panotty		= $F
cutID_EasyEnding	= $10
cutID_Unk2			= $11

; Stage IDs:
stgID_SkeletonT		= 0
stgID_Nasu			= 1
stgID_Mummy			= 2
stgID_Draco 		= 3
stgID_Suketoudara 	= 4
stgID_Sukiyapotes   = 5
stgID_Harpy			= 6
stgID_Sasoriman		= 7
stgID_Panotty		= 8
stgID_Zombie		= 9
stgID_Witch			= $0A
stgID_ZohDaimaoh	= $0B
stgID_Schezo 		= $0C
stgID_Minotauros	= $0D
stgID_Rulue			= $0E
stgID_Satan			= $0F

; Ram

game_curStage = $FF0112		; Byte
game_curCutscene = $FF0113	; Byte

mus_curSong = $FF012F		; Byte

bc_programCounter = $FF0A36 ; Long
bc_returnState = $FF0A3A	; Byte
bc_stopRunning = $FF0A3B	; Byte
bc_stopLoop = $FF0A3C 		; Byte

debug_CpuPlayer = $FF1876	; Byte
debug_puyoDrop = $FF1877	; Byte
debug_skipStages = $FF1878	; Byte
debug_unknown = $FF1879		; Byte

SystemStack = $FFFC00