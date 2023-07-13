; Type 0000 = Stop Executing Bytecode

; Type 0001 = NOP?

; Type 0002.XXXX = Delay for number of frames

; Type 0003 = Wait for Palette Fade to finish

; Type 0004.XXXXXXXX.YYYY = Write YYYY to XXXXXXXX

; Type 0005.XXXXXXXX = Branch to XXXXXXXX

; Type 0006.XXXXXXXX = Jump Lookup Table Execution to XXXXXXXX
; Type 0007.XXXXXXXX = Above, but only if functionReturnState = 0
; Type 0008.XXXXXXXX = Above, but only if functionReturnState != 0

; Type 0009.XXXX = Defines a lookup table of size XXXX?

; Type 000A.XXXX = Something that sets up the VDP Registers???
;				   If XXXX is greater than 3, then this operation is invalid

; Type 000B.XXXX.YYYYYYYY = Load Art Data at YYYYYYYY into VRAM address XXXX

; Type 000C.XXXX = Call VDP Plane Commands

; Type 000D.XXXX = Load Palette

; Type 000E.XXXX.YYYY = Load Palette with Fade In

; Type 000F.XXXX = Play Sound

; Type 0010.XXXX = Play Sound (Check if samples are allowed)

; Type 0011 = Fade out music

; Type 0012 = Stop all Sounds

; Type 0013.XXXX = Identical to 0010??

; Type 0014 - FFFF = INVALID

	include "game/bytecode/bytecode_macros.asm"
	
BC_Bootup: ; Bootup Lookup Table
	BRUN clearVram

	BRUN loc_00000FB8
	
	BRUN initializeDebugFlags
	
	BRUN getChecksum

	BJEQ BC_segaScreen

	BVMODE $0001
	
	BART $0000, art_optionsBackground
	
	BART $A000, art_optionsCharset

	BRUN loc_0001CD34

	BNOP
	
	BPAL pal_optionsTextWhite, 0
	BPAL pal_optionTextRed, 1
	BPAL pal_optionsBackground, 2
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	
	BNOP
BC_segaScreen:
	BRUN clearVram

	BRUN loc_00000FB8
	
	BVMODE $0001
	
	BART $A000, art_creditsText
	
	BRUN loadSegaScreen
	
	BRUN loc_0000C960
	
	
	BSTOP
	
	BPAL pal_blank, 0
	
	BRUN loc_000029D6
	
	BNOP
	
	BRAM $00FF013A, $0000
	BRAM $00FF05D2, $0000
	
	BNOP
BC_titleScreen:
	BVMODE $0000
	
	BART $0000, art_titleScreen
	
	BART $A000, art_creditsText
	
	BSNDC2 $0082
	BSND $0003
	BVDPC $0020
	BNOP
	
	BRUN loc_0000CE58
	
	BPALF pal_00002230, 0, 0
	BPALF pal_titleScreenArle, 1, 0
	BPALF pal_titleScreenBackground, 2, 0
	BPALF pal_titleScreenLogo_cycle, 3, 0
	
	BSTOP
BC_mainMenu:

	BRUN loc_000029D6
	
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
	dc.l	BC_mainMenu2
	dc.l    BC_tutorialDemo
	dc.l	BC_unknown6
	dc.l	BC_normalModeEnding
	
	
BC_mainMenu2: ; Second half of above transition
	BVMODE $0000
	
	BART $A000, art_creditsText
	
	BRUN loc_0000C548
	
	BART $0000, art_menuScreen
	
	BSND $0004
	BVDPC $001F
	BNOP
	
	BPAL pal_grassCutTop, 0
	BPAL pal_general, 1
	BPAL pal_mainMenuMenus, 3
	
	BNOP
	
	BRUN loc_0000B0F6
	
	BSTOP
	
	BMUSF
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3

	BNOP
	
	BRUN loc_000029D6
	
	BSSND
	
	BJTBL $0004
	dc.l	BC_portraitScreen
	dc.l	BC_twoPlayer
	dc.l    BC_endless 
	dc.l	BC_options
BC_options:
	BVMODE $0001
	BSND $0004
	
	BART $0000, art_optionsBackground
	BART $A000, art_optionsCharset
	
	
	BNOP
	
	BRUN loc_0001D35C
	
	BNOP
	
	BPAL pal_optionsBackground, 0
	BPAL pal_optionTextBlue, 1
	BPAL pal_optionTextRed, 2
	BPAL pal_optionTextGreen, 3
	
	BNOP
	
	BRUN loc_0001D3A0
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BRUN loc_000029D6
	
	BSSND
	BNOP
	
	BJNE BC_soundTest
	
	BJMP BC_titleScreen
BC_soundTest:
	BVMODE $0001
	
	BART $6000, art_cutsceneArle
	BART $8000, art_cutsceneSatan
	BART $0000, art_optionsBackground
	BART $A000, art_optionsCharset
	
	BRUN loc_0001CCDC
	
	BNOP
	
	BPAL pal_general, 0
	BPAL pal_optionsTextWhite, 1
	BPAL pal_optionsBackground, 2
	BPAL pal_optionTextGreen, 3
	
	BRUN loc_0001CD28
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	BSSND
	
	BRUN loc_000029D6
	
	BJMP BC_options
BC_portraitScreen:
	BVMODE $0000

	BART $8000, art_recordScreen

	BART $A000, art_creditsText

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
	
	BRUN loc_000029D6
	
	BVMODE $0001
	
	BRUN loc_00000BDC
	
	BART $6000, art_cutsceneArle
	
	BRAM $00FF05D2, $FF20
	BRAM $00FF05D4, $FF60
	
	BRUN loc_00009B7A
	
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
	
	BJEQ BC_unknown1
	
	BWPAL
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	BSSND
	
	BRUN loc_000029D6
	
	BDELAY $0010
	
	BRUN loc_00002FB8
	
	BJEQ BC_portraitScreen
	
	BJMP BC_segaScreen
	
BC_unknown1:
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
	
	BART $A000, art_creditsText
	
	
	BSSND
	BWPAL
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_general, 3
	
	BRUN loadBattlePalette
	
	BRAM $00FF1108, $0802
	
	BRUN loc_00002EBA
	
	BNOP
	
	BRUN loc_00003056
	
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
	
	BRUN loc_000029D6
	
	BSSND
	
	BJNE BC_gameOver
	
	BRUN loc_00002FB8
	
	BJTBL $0003
	dc.l	BC_portraitScreen 
	dc.l	BC_normalModeEnding 
	dc.l	BC_easyModeEnding 
BC_gameOver:
	BVMODE $0001
	
	BRUN loc_00000BDC
	
	BRAM $00FF05D2, $0000
	BRAM $00FF05D4, $0000 
	
	BRUN clearVram
	
	BART $A000, art_creditsText
	
	BART $0000, art_gameOverBackground
	BART $2C00, art_gameOverContinue
	BART $3200, art_gameOverText
	BART $3E00, art_gameOverBGFade
	BART $4000, art_gameOverNumbers
	
	BSND $0007
	BVDPC $0006
	BNOP
	
	BRUN loc_0000C652
	
	BPALF pal_general, 0, 0
	BPALF pal_general, 1, 0
	BPALF pal_gameOverSky, 2, 0
	BPALF pal_00002230, 3, 0
	
	BWPAL
	
	BRUN loc_0000C6CC
	
	BSTOP
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BSSND
	
	BRUN loc_00000BA4
	
	BRUN loc_000029D6
	
	BJEQ BC_portraitScreen
	
	BRAM $00FF1890, $0000
	
	BJMP BC_recordScreen1PlayerOnly
	
; Loads Easy Mode Ending
BC_easyModeEnding:
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
	
	BRUN loc_000029D6
	
	BSSND
	
	BRAM $00FF1890, $0000
	
	BJMP BC_recordScreen1PlayerOnly
BC_normalModeEnding:
	BRAM $00FFFC02, $FFFF
	
	BRUN loc_0001DC02

	BVMODE $0000
	
	BSND $0012
	
	BART $0000, art_arleVictory
	
	BVDPC $0009
	BNOP
	
	BRUN loc_0000BFDE
	
	BRUN loc_0000D908
	
	BPALF pal_staffBG, 0, 0
	BPALF pal_endingArle, 1, 0
	BPALF pal_00002230, 2, 0
	
	BSTOP
	
	BJEQ BC_credits
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	
	BRUN loc_000029D6
	
	BSSND
	BNOP
	
	BJMP BC_credits2
BC_credits:
	
	BPALF pal_blank, 1, 4
	BPALF pal_blank, 2, 4

	BDELAY $0050
	BWPAL
	
	
	BRUN loc_000029D6
	BSSND
	BDELAY $00C0
BC_credits2:
	BDELAY $0080
	
	BVMODE $0001
	BRUN loc_00000BDC
	BRAM $00FF05D2, $FF20
	BRAM $00FF05D4, $FF60
	
	BSND $0011
	BART $6000, art_cutsceneArle
	BART $A000, art_tryAgain
	BRAM $00FF0112, $0000
BC_credits3:
	BRUN loc_0000DAF4
	BRUN loc_0000D908

	BSTOP
	BNOP
	
	BJTBL $0003
	dc.l	BC_staff2
	dc.l	BC_credits3
	dc.l	BC_staff
BC_staff:

	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BRUN loc_000029D6
	
	BSSND
	BNOP
	
	BJMP BC_staff3
	
BC_staff2:
	BMUSF
	
	BPALF pal_blank, 0, 6
	BPALF pal_blank, 1, 6
	BPALF pal_blank, 2, 6
	BPALF pal_blank, 3, 6
	
	BDELAY $0070
	BWPAL
	BRUN loc_000029D6
	BDELAY $0080
	BSSND
BC_staff3:
	BVMODE $0001
	BSND $000A
	
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
	
	BJEQ BC_recordScreen
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	
	
	BRUN loc_000029D6
	BNOP
	BSSND
	BRAM $00FF1890, $0000
	BJMP BC_recordScreen1PlayerOnly
BC_recordScreen:
	BMUSF
	BRUN loc_000029D6
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	
	BDELAY $0010
	BWPAL
	BRUN loc_000029D6
	BSSND
	BRAM $00FF1890, $0000
BC_recordScreen1PlayerOnly:

	BVMODE $0000
	
	BRUN loc_00000BC6
	
	BSND $0004
	
	BART $0000, art_modeNames
	
	BART $2000, art_ingameAssets
	
	BART $6000, art_recordScreen
	
	BART $A000, art_creditsText
	
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
	
	BRUN loc_000029D6
	
	BSSND
	
	BJMP BC_segaScreen
BC_twoPlayer:
	BRAM $00FF0128, $0000
	BRUN loc_00007F00

	BVMODE $0001
	
	BART $0000, art_twoPlayerBackground
	BART $1000, art_twoPlayerStars
	BART $A000, art_creditsText
	
	BVDPC $0004
	BNOP
	BSND $0006
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_000023D0, 3
	
	BRAM $00FF1108, $0802
BC_unknown3:
	BRAM $00FF0112, $0000
	
	BPAL pal_00002230, 0
	
	BART $2000, art_ingameAssets
	BRUN loc_00007F9C
	BRUN loc_00002EBA
	BRUN loc_00003056
	
	BSTOP
	
	BJNE BC_recordScreen3
	BRUN loc_000029D6
	
	BVDPC $0004
	BNOP
	
	BJMP BC_unknown3
BC_recordScreen3:
	BRAM $00FF1108, $1003
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BWPAL
	
	BRUN loc_000029D6
	
	BSSND
	
	BRAM $00FF1890, $00FF
	BJMP BC_recordScreen1PlayerOnly
BC_endless:

	BVMODE $0001
	
	BART $0000, art_optionsBackground
	BART $2000, art_ingameAssets
	BART $A000, art_creditsText
	
	BVDPC $0016
	BNOP
	BSND $0005
	
	BPALF pal_00002230, 0, 0
	BPALF pal_00002250, 1, 0
	BPALF pal_optionsBackground, 2, 0
	BPALF pal_00002510, 3, 0
	
	BRAM $00FF1108, $0802
	
	BRUN loc_00003056
	
	BSTOP
	
	BRAM $00FF1108, $1003
	
	BMUSF
	
	BPALF pal_blank, 0, 0
	BPALF pal_blank, 1, 0
	BPALF pal_blank, 2, 0
	BPALF pal_blank, 3, 0
	
	BDELAY $0010
	
	BWPAL
	
	BRUN loc_000029D6
	
	BSSND
	
	BRAM $00FF1890, $0100
	
	BJMP BC_recordScreen1PlayerOnly
BC_unknown6:
	BRAM $00FF1882, $0400

	BVMODE $0001
	
	BART $0000, art_grassBattle
	
	BVDPC $0003
	BNOP
	
	BART $2000, art_ingameAssets
	
	BART $A000, art_creditsText
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_general, 3
	
	BRUN loc_0000C9BA
	BRUN loc_00002EBA
	BRUN loc_00003056
	
	BNOP
	
	BRUN loc_000055A4
	
	BNOP
	
	BRUN loc_0000C14A
	BRUN loc_0000C946
	
	BSTOP
	
	BRUN loc_000029D6
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BJNE BC_titleScreen
	BJMP BC_recordScreen4
; Loads Tutorial Demo
BC_tutorialDemo:
	BRAM $00FF1882, $0400
	BRAM $00FF0112, $0303

	BVMODE $0001
	
	BART $2000, art_ingameAssets
	BART $0000, art_grassBattle
	BART $6600, art_tutorial
	BART $A000, art_creditsText
	
	BVDPC $0003
	BVDPC $002A
	BNOP
	BSND $0004
	
	BRUN loc_0000C9BA
	BRUN loc_00010560
	BRUN loc_000105CC
	
	BNOP
	
	BPAL pal_00002230, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	BPAL pal_tutorialDemoBGJoystick, 3

	BRUN loc_0000C960
	
	BSTOP
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2
	BPAL pal_blank, 3
	
	BNOP
	
	BRUN loc_000029D6
	
	BSSND
	
	BJNE BC_titleScreen
	BJMP BC_recordScreen4
BC_recordScreen4:
	BVMODE $0000
	
	BRUN loc_00000BC6
	
	BSND $0004
	
	BART $0000, art_modeNames
	BART $2000, art_ingameAssets
	BART $6000, art_recordScreen
	BART $A000, art_creditsText
	
	BVDPC $0008
	BNOP
	
	BRUN loc_0000C960
	
	BRAM $00FF1890, $00FF
	
	BRUN loc_0000C9BA
	BRUN loc_0000BB0E

	BPAL pal_recordScreenMain, 0
	BPAL pal_00002250, 1
	BPAL pal_grassBattle, 2
	
	BSTOP
	
	BRUN loc_000029D6
	
	BMUSF
	
	BPAL pal_blank, 0
	BPAL pal_blank, 1
	BPAL pal_blank, 2 
	
	BNOP 
	
	BRUN loc_000029D6
	
	BSSND
	
	BJNE BC_titleScreen
	
	BJMP BC_segaScreen
	