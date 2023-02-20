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

nem_decompBuffer = $00FF3400

; Cutscene Constants (Todo: Move these into their own file)
arle_AnimIdle = 0
arle_AnimIdleTalk = 1
arle_AnimAngerTalk = 2
arle_AnimSurprise = 3
arle_AnimCurious = 4
arle_AnimCuriousTalk = 5
arle_AnimCuriousIdle = 6
arle_AnimCuriousAnger = 7
arle_AnimCuriousAngerTalk = 8
arle_AnimStance = 9
arle_AnimStanceTalk = $A
arle_AnimStanceIdle = $B
arle_AnimCuriousEmbarrassedBlush = $C
arle_AnimCuriousEmbarrassed = $D
arle_AnimStancePoint = $E
arle_AnimStanceHalt = $F
arle_AnimStancePointTalk = $10
arle_AnimStancePointNoIntro = $11
arle_AnimStanceHaltTalk = $12
arle_AnimStanceHaltNoIntro = $13
arle_AnimStancePointEmbarrass = $14
arle_AnimIdleAnger = $15

draco_AnimIdle = 0
draco_AnimIdleTalk = 1
draco_AnimGloatTalk = 2
draco_AnimPointUp = 3
draco_AnimAnger = 4

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

; RAM:
	org $0
	ds.b $112 					; Unknown

game_curStage = $FF0000+*		; $112
	ds.b $1
game_curCutscene = $FF0000+*	; $113
	ds.b $1
	ds.b $1B 					; Unknown
	
mus_curSong = $FF0000+*			; $12F
	ds.b $1
	ds.b $906					; Unknown
	
BC_programCounter = $FF0000+* 	; $A36
	ds.l $1
BC_returnState = $FF0000+*		; $A3A
	ds.b $1
BC_stopRunning = $FF0000+*		; $A3B
	ds.b $1
BC_stopBytecodeLoop = $FF0000+*	; $A3C
	ds.b $1
	ds.b $E39					; Unknown

debug_CpuPlayer = $FF0000+*		; $1876
	ds.b $1
debug_puyoDrop = $FF0000+*		; $1877
	ds.b $1
debug_skipStages = $FF0000+*	; $1878
	ds.b $1
debug_unknown = $FF0000+*		; $1879
	ds.b $1
	ds.b $E386
	
SystemStack = $FF0000+*			; $FC00
	ds.b $10000-*
	org $0