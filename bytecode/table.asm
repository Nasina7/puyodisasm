	include "bytecode/macros.asm"
	
Bytecode_Bootup: ; Bootup Lookup Table

	BRUN ClearGP0ReloadNoInt
	
	BRUN Debug_InitDebugFlags
	
	BRUN Check_GetChecksum

	BJEQ Bytecode_SegaScreen

	BVMODE $0001
	
	BART $0000, art_puzzleBoard
	
	BART $A000, art_optionsCharset

	BRUN BadCheck_Init

	BNOP
	
	BPAL pal_optionsTextWhite, 0
	BPAL pal_optionTextRed, 1
	BPAL pal_optionsBackground, 2
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	
	BNOP
Bytecode_SegaScreen:
	BRUN ClearGP0ReloadNoInt
	
	BVMODE $0001
	
	BART $A000, art_battleCharset
	
	BRUN Sega_CreateLogoObj
	
	BRUN Sega_CreateMainObj
	
	
	BSTOP
	
	BPAL pal_blank, 0
	
	BRUN ObjMgr_InitObjSystem
	
	BNOP
	
	BRAM $00FF013A, $0000
	BRAM $00FF05D2, $0000
	
	BNOP
Bytecode_TitleScreen:
	BVMODE $0000
	
	BART $0000, art_titleScreen
	
	BART $A000, art_battleCharset
	
	BSNDC2 pcmID_PuyoPuyo
	BSND musID_Baroque
	BVDPC $0020
	BNOP
	
	BRUN TitleScreen_Init
	
	BPALF pal_00002230, 0, 0
	BPALF pal_titleScreenArle, 1, 0
	BPALF pal_titleScreenBackground, 2, 0
	BPALF pal_titleScreenLogo_cycle, 3, 0
	
	BSTOP
Bytecode_MainMenu:

	BRUN ObjMgr_InitObjSystem
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BRAM $00FF013A, $0000
	
	BRAM $00FF05D2, $0000
	
	BNOP
	
	BRUN loc_00000BA4
	
	BDELAY $0006
	
	BSSND
	
	BJTBL $0004
	dc.l	Bytecode_MainMenu2
	dc.l    Bytecode_TutorialDemo
	dc.l	Bytecode_Unknown6
	dc.l	Bytecode_NormalModeEnding
	
	
Bytecode_MainMenu2: ; Second half of above transition
	BVMODE $0000
	
	BART $A000, art_battleCharset
	
	BRUN loc_0000C548
	
	BART $0000, art_menuScreen
	
	BSND musID_Cooking
	BVDPC $001F
	BNOP
	
	BPAL pal_grassCutTop, 0
	BPAL pal_general, 1
	BPAL pal_mainMenuMenus, 3
	
	BNOP
	
	BRUN MenuScreen_Init
	
	BSTOP
	
	BMUSF
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3

	BNOP
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BJTBL $0004
	dc.l	Bytecode_PortraitScreen
	dc.l	Bytecode_TwoPlayer
	dc.l    Bytecode_Endless 
	dc.l	Bytecode_Options
Bytecode_Options:
	BVMODE $0001
	BSND musID_Cooking
	
	BART $0000, art_puzzleBoard
	BART $A000, art_optionsCharset
	
	
	BNOP
	
	BRUN Option_Init
	
	BNOP
	
	BPAL pal_optionsBackground, 0
	BPAL pal_optionTextBlue, 1
	BPAL pal_optionTextRed, 2
	BPAL pal_optionTextGreen, 3
	
	BNOP
	
	BRUN Option_InitObj
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	BNOP
	
	BJNE Bytecode_SoundTest
	
	BJMP Bytecode_TitleScreen
Bytecode_SoundTest:
	BVMODE $0001
	
	BART $6000, art_cutsceneArle
	BART $8000, art_cutsceneSatan
	BART $0000, art_puzzleBoard
	BART $A000, art_optionsCharset
	
	BRUN SoundTest_Init
	
	BNOP
	
	BPAL pal_general, 0
	BPAL pal_optionsTextWhite, 1
	BPAL pal_optionsBackground, 2
	BPAL pal_optionTextGreen, 3
	
	BRUN SoundTest_InitObj
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	BSSND
	
	BRUN ObjMgr_InitObjSystem
	
	BJMP Bytecode_Options
Bytecode_PortraitScreen:
	BVMODE $0000

	BART $8000, art_recordScreen

	BART $A000, art_battleCharset

	BVDPC $001E
	BNOP
	
	BRUN loc_0000C162
	
	BNOP
	
	BPAL pal_grassBattle, 0
	BPAL pal_general, 1
	BPAL pal_portraitDefeated, 2
	BPAL pal_portraitScreenBackground, 3

	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BRUN ObjMgr_InitObjSystem
	
	BVMODE $0001
	
	BRUN loc_00000BDC
	
	BART $6000, art_cutsceneArle
	
	BRAM $00FF05D2, $FF20
	BRAM $00FF05D4, $FF60
	
	BRUN Cutscene_InitObj
	
	BRUN loc_000093F4
	BRUN loc_0000A1A4
	BRUN loc_0000A2AC
	BRUN cutsceneLoadMusic
	
	
	BNOP
	
	BRUN loc_0000A2F4
	
	BPALF pal_general, 0, 0
	
	BRUN loadBattlePalette
	
	BSTOP
	
	BRUN debug_SkipStage
	
	BJEQ Bytecode_Unknown1
	
	BWPAL
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	BSSND
	
	BRUN ObjMgr_InitObjSystem
	
	BDELAY $0010
	
	BRUN OnePlayer_AdvanceNextStage
	
	BJEQ Bytecode_PortraitScreen
	
	BJMP Bytecode_SegaScreen
	
Bytecode_Unknown1:
	BWPAL
	BNOP
	
	BRUN loadBattleBackground
	
	BMUSF
	
	BRUN loc_000021D0
	
	BNOP
	
	BRAM $00FF1892, $0000
	
	BSTOP 
	
	BRUN loc_00000BC6
	
	BART $2000, art_ingameAssets
	
	BART $A000, art_battleCharset
	
	
	BSSND
	BWPAL
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_general, 3
	
	BRUN loadBattlePalette
	
	BRAM $00FF1108, $0802
	
	BRUN loc_00002EBA
	
	BNOP
	
	BRUN Battle_LoadObjects
	
	BNOP
	
	BRUN loc_000055A4
	
	BRUN loc_0000C14A
	
	BSTOP 
	
	BRAM $00FF1108, $1003
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BJNE Bytecode_GameOver
	
	BRUN OnePlayer_AdvanceNextStage
	
	BJTBL $0003
	dc.l	Bytecode_PortraitScreen 
	dc.l	Bytecode_NormalModeEnding 
	dc.l	Bytecode_EasyModeEnding 
Bytecode_GameOver:
	BVMODE $0001
	
	BRUN loc_00000BDC
	
	BRAM $00FF05D2, $0000
	BRAM $00FF05D4, $0000
	
	BART $A000, art_battleCharset
	
	BART $0000, art_gameOver
	
	BSND musID_Sorrow
	BVDPC $0006
	BNOP
	
	BRUN GameOver_InitVDP
	
	BPALF pal_general, 0, 0
	BPALF pal_general, 1, 0
	BPALF pal_gameOverSky, 2, 0
	BPALF pal_00002230, 3, 0
	
	BWPAL
	
	BRUN GameOver_Init
	
	BSTOP
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BSSND
	
	BRUN loc_00000BA4
	
	BRUN ObjMgr_InitObjSystem
	
	BJEQ Bytecode_PortraitScreen
	
	BRAM $00FF1890, $0000
	
	BJMP Bytecode_RecordScreen1PlayerOnly
	
Bytecode_EasyModeEnding:
	BRAM $00FF0112, $1010

	BVMODE $0001
	
	BRUN loc_00000BDC 
	
	BART $6000, art_cutsceneArle
	
	BRAM $00FF05D2, $FF20
	BRAM $00FF05D4, $FF60
	
	BRUN loc_000093F4
	BRUN loc_0000A2AC
	BRUN cutsceneLoadMusic
	
	BNOP
	
	BRUN loc_0000A2F4
	
	BPALF pal_general, 0, 0
	BPALF pal_grassBattle, 2, 0
	BPALF pal_general, 3, 0
	
	BSTOP
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BRAM $00FF1890, $0000
	
	BJMP Bytecode_RecordScreen1PlayerOnly
	
Bytecode_NormalModeEnding:
	BRAM rOption_SoundTestEnabled, $FFFF
	
	BRUN loc_0001DC02

	BVMODE $0000
	
	BSND musID_Victory
	
	BART $0000, art_arleVictory
	
	BVDPC $0009
	BNOP
	
	BRUN loc_0000BFDE
	
	BRUN loc_0000D908
	
	BPALF pal_staffBG, 0, 0
	BPALF pal_endingArle, 1, 0
	BPALF pal_00002230, 2, 0
	
	BSTOP
	
	BJEQ Bytecode_Credits
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	BNOP
	
	BJMP Bytecode_Credits2
Bytecode_Credits:
	
	BPALF pal_blank, 1, 4
	BPALF pal_blank, 2, 4

	BDELAY $0050
	BWPAL
	
	
	BRUN ObjMgr_InitObjSystem
	BSSND
	BDELAY $00C0
Bytecode_Credits2:
	BDELAY $0080
	
	BVMODE $0001
	BRUN loc_00000BDC
	BRAM $00FF05D2, $FF20
	BRAM $00FF05D4, $FF60
	
	BSND musID_Ondo
	BART $6000, art_cutsceneArle
	BART $A000, art_castCharset
	BRAM $00FF0112, $0000
Bytecode_Credits3:
	BRUN loc_0000DAF4
	BRUN loc_0000D908

	BSTOP
	BNOP
	
	BJTBL $0003
	dc.l	Bytecode_Staff2
	dc.l	Bytecode_Credits3
	dc.l	Bytecode_Staff
Bytecode_Staff:

	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	BNOP
	
	BJMP Bytecode_Staff3
	
Bytecode_Staff2:
	BMUSF
	
	BPALF pal_blank, 0, 6
	BPALF pal_blank, 1, 6
	BPALF pal_blank, 2, 6
	BPALF pal_blank, 3, 6
	
	BDELAY $0070
	BWPAL
	BRUN ObjMgr_InitObjSystem
	BDELAY $0080
	BSSND
Bytecode_Staff3:
	BVMODE $0001
	BSND musID_Sunset
	
	BART $0000, art_arleVictory
	BART $A000, art_optionsCharset
	
	BVDPC $000A
	BNOP
	
	BPALF pal_staffBG, 0, 0
	BPALF pal_staffText, 1, 0
	
	BWPAL
	
	BRUN loc_0000BE0E
	BRUN loc_0000D908
	
	BSTOP
	
	BJEQ Bytecode_RecordScreen
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	
	
	BRUN ObjMgr_InitObjSystem
	BNOP
	BSSND
	BRAM $00FF1890, $0000
	BJMP Bytecode_RecordScreen1PlayerOnly
Bytecode_RecordScreen:
	BMUSF
	BRUN ObjMgr_InitObjSystem
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	
	BDELAY $0010
	BWPAL
	BRUN ObjMgr_InitObjSystem
	BSSND
	BRAM $00FF1890, $0000
Bytecode_RecordScreen1PlayerOnly:

	BVMODE $0000
	
	BRUN loc_00000BC6
	
	BSND musID_Cooking
	
	BART $0000, art_modeNames
	
	BART $2000, art_ingameAssets
	
	BART $6000, art_recordScreen
	
	BART $A000, art_battleCharset
	
	BVDPC $0008
	BNOP
	
	BRUN loc_0000BB0E
	
	BPALF pal_recordScreenMain, 0, 0
	BPALF pal_00002250, 1, 0
	BPALF pal_grassBattle, 2, 0
	
	BSTOP
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	
	BDELAY $0010
	
	BWPAL
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BJMP Bytecode_SegaScreen
Bytecode_TwoPlayer:
	BRAM $00FF0128, $0000
	BRUN loc_00007F00

	BVMODE $0001
	
	BART $0000, art_woodBoard
	BART $A000, art_battleCharset
	
	BVDPC $0004
	BNOP
	BSND musID_Toy
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_000023D0, 3
	
	BRAM $00FF1108, $0802
Bytecode_Unknown3:
	BRAM $00FF0112, $0000
	
	BPAL pal_00002230, 0
	
	BART $2000, art_ingameAssets
	BRUN loc_00007F9C
	BRUN loc_00002EBA
	BRUN Battle_LoadObjects
	
	BSTOP
	
	BJNE Bytecode_RecordScreen3
	BRUN ObjMgr_InitObjSystem
	
	BVDPC $0004
	BNOP
	
	BJMP Bytecode_Unknown3
Bytecode_RecordScreen3:
	BRAM $00FF1108, $1003
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BRAM $00FF1890, $00FF
	BJMP Bytecode_RecordScreen1PlayerOnly
Bytecode_Endless:

	BVMODE $0001
	
	BART $0000, art_puzzleBoard
	BART $2000, art_ingameAssets
	BART $A000, art_battleCharset
	
	BVDPC $0016
	BNOP
	BSND musID_Morning
	
	BPALF pal_00002230, 0, 0
	BPALF pal_00002250, 1, 0
	BPALF pal_optionsBackground, 2, 0
	BPALF pal_00002510, 3, 0
	
	BRAM $00FF1108, $0802
	
	BRUN Battle_LoadObjects
	
	BSTOP
	
	BRAM $00FF1108, $1003
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BDELAY $0010
	
	BWPAL
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BRAM $00FF1890, $0100
	
	BJMP Bytecode_RecordScreen1PlayerOnly
Bytecode_Unknown6:
	BRAM $00FF1882, $0400

	BVMODE $0001
	
	BART $0000, art_grassBoard
	
	BVDPC $0003
	BNOP
	
	BART $2000, art_ingameAssets
	
	BART $A000, art_battleCharset
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_general, 3
	
	BRUN Demo_CreateInsertCoinObj
	BRUN loc_00002EBA
	BRUN Battle_LoadObjects
	
	BNOP
	
	BRUN loc_000055A4
	
	BNOP
	
	BRUN loc_0000C14A
	BRUN Sega_CreateMainObjAlt
	
	BSTOP
	
	BRUN ObjMgr_InitObjSystem
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BJNE Bytecode_TitleScreen
	BJMP Bytecode_RecordScreen4

Bytecode_TutorialDemo:
	BRAM $00FF1882, $0400
	BRAM $00FF0112, $0303

	BVMODE $0001
	
	BART $2000, art_ingameAssets
	BART $0000, art_grassBoard
	BART $6600, art_tutorial
	BART $A000, art_battleCharset
	
	BVDPC $0003
	BVDPC $002A
	BNOP
	BSND musID_Cooking
	
	BRUN Demo_CreateInsertCoinObj
	BRUN loc_00010560
	BRUN loc_000105CC
	
	BNOP
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_tutorialDemoBGJoystick, 3

	BRUN Sega_CreateMainObj
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BJNE Bytecode_TitleScreen
	BJMP Bytecode_RecordScreen4
Bytecode_RecordScreen4:
	BVMODE $0000
	
	BRUN loc_00000BC6
	
	BSND musID_Cooking
	
	BART $0000, art_modeNames
	BART $2000, art_ingameAssets
	BART $6000, art_recordScreen
	BART $A000, art_battleCharset
	
	BVDPC $0008
	BNOP
	
	BRUN Sega_CreateMainObj
	
	BRAM $00FF1890, $00FF
	
	BRUN Demo_CreateInsertCoinObj
	BRUN loc_0000BB0E

	BPAL pal_recordScreenMain, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	
	BSTOP
	
	BRUN ObjMgr_InitObjSystem
	
	BMUSF
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2 
	
	BNOP 
	
	BRUN ObjMgr_InitObjSystem
	
	BSSND
	
	BJNE Bytecode_TitleScreen
	
	BJMP Bytecode_SegaScreen
	