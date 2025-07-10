; Note: This file is a work in progress, and is not currently shiftable!
	include "sound/z80_macros.asm"
	cpu z80
	obj $8000

bank1_start:
	ptrZ80	SoundPtrs	; $8E74
	ptrZ80	NoteTimings	; Note Timings and Drum Mappings
	ptrZ80	loc_8A6D	; Volume Envelopes?
	ptrZ80	loc_8A39	; Pitch Envelopes?
	ptrZ80	loc_8AB5	; PSG Envelopes?
	ptrZ80	$7FFB		; ???
	ptrZ80	loc_8010	; Byte 1 and 2 point to loc_D4B8 which is Arle's PCM Data
	dc.b	$09, $00	; ???

; -----------------------------------------------------------------------------
; Undocumented
; -----------------------------------------------------------------------------

loc_8010:	; PCM Stuff
	dc.b	$04		; Offset Value for Bank Data (What's the point?)
	ptrZ80	PCMData_Bank1	; Location of PCM Table in Bank 1
	ptrZ80	bank2_start	; Location of PCM Table in Bank 2

;	PCM Table of some kind (relative to the table for the Bank????)
	ptrZ80	$0000		; Points to "Fire" PCM
	ptrZ80	$0200		; Points to Bank 2 "Yattana" PCM
	ptrZ80	$0202		; Points to Bank 2 "Puyo Puyo" PCM
	ptrZ80	$0000		; Points to "Fire" PCM

FM_Instrument_Patches:
	include "sound/bank1/data/Patches.asm"

NoteTimings:	; loc_89BA
	incbin "sound/bank1/data/NoteTimings.bin"

DrumMappings:
	;	Patch ID, ???, ???, ???, Panning, Pitch, $0000
	dc.b	$3D, $00, $00, $20, $C0, $1B, $00, $00		; Kick 1
	dc.b	$3F, $00, $0C, $20, $C0, $25, $00, $00		; Snare 1 (General Snare)
	dc.b	$3E, $00, $00, $20, $C0, $19, $00, $00		; Snare 2 (Acoustic Snare)
	dc.b	$40, $00, $00, $20, $C0, $15, $00, $00		; Snare 3 (Danger Snare)
	dc.b	$41, $00, $00, $20, $C0, $30, $00, $00		; Kick 2
	dc.b	$42, $00, $00, $20, $C0, $30, $00, $00		; Unused?
	dc.b	$43, $00, $00, $20, $C0, $19, $00, $00		; Unused?
	dc.b	$44, $00, $00, $20, $C0, $30, $00, $00		; Hi-Hat
	dc.b	$45, $0C, $0D, $20, $40, $40, $00, $00		; High-Tom
	dc.b	$45, $0C, $0D, $20, $40, $3D, $00, $00		; Mid-High Tom
	dc.b	$45, $0B, $0D, $20, $C0, $3A, $00, $00		; Mid Tom
	dc.b	$45, $0B, $0D, $20, $C0, $37, $00, $00		; Mid-Low Tom
	dc.b	$45, $0C, $0D, $20, $80, $34, $00, $00		; Low Tom
	dc.b	$45, $0C, $0D, $20, $80, $31			; Floor Tom


; -----------------------------------------------------------------------------

loc_8A39:	; Pointer index (Pitch Envelopes?)
	dc.w	0
	ptrZ80	loc_8AE5
	ptrZ80	loc_8B50
	ptrZ80	loc_8AEE
	ptrZ80	loc_8AF3
	ptrZ80	loc_8B09
	ptrZ80	loc_8B17
	ptrZ80	loc_8B24
	ptrZ80	loc_8B31
	ptrZ80	loc_8B5C
	ptrZ80	loc_8B70
	ptrZ80	loc_8B72
	ptrZ80	loc_8B74
	ptrZ80	loc_8B79
	ptrZ80	loc_8B7E
	ptrZ80	loc_8B80
	ptrZ80	loc_8BAB
	ptrZ80	loc_8BB9
	ptrZ80	loc_8BC9
	ptrZ80	loc_8BCE
	ptrZ80	loc_8BD8
	ptrZ80	loc_8BDC
	ptrZ80	loc_8BDE
	ptrZ80	loc_8BF4
	ptrZ80	loc_8C01
	ptrZ80	loc_8C92

; -----------------------------------------------------------------------------

loc_8A6D:	; Pointers index (Volume Envelopes?)
	ptrZ80	loc_8C9F
	ptrZ80	loc_8CA2
	ptrZ80	loc_8CD0
	ptrZ80	loc_8CDB
	ptrZ80	loc_8CE4
	ptrZ80	loc_8D0C
	ptrZ80	loc_8D1B
	ptrZ80	loc_8D3F
	ptrZ80	loc_8D6A
	ptrZ80	loc_8D71
	ptrZ80	loc_8DB1
	ptrZ80	loc_8DBE
	ptrZ80	loc_8DC0
	ptrZ80	loc_8DC4
	ptrZ80	loc_8DC2
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD5
	ptrZ80	loc_8DD8
	ptrZ80	loc_8DDB
	ptrZ80	loc_8E09
	ptrZ80	loc_8E14
	ptrZ80	loc_8E1D
	ptrZ80	loc_8E45
	ptrZ80	loc_8E47
	ptrZ80	loc_8E49
	ptrZ80	loc_8E58

; -----------------------------------------------------------------------------

loc_8AB5:	; Pointers Index (PSG Envelopes?)
	ptrZ80	loc_8E63
	ptrZ80	loc_8ABF
	ptrZ80	loc_8AC7
	ptrZ80	loc_8AD6
	ptrZ80	loc_8ADE

; -----------------------------------------------------------------------------
; Table E Data (PSG Envelopes?)
; -----------------------------------------------------------------------------

loc_8ABF:
	incbin "sound/bank1/data/Table E/loc_8ABF.bin"

loc_8AC7:
	incbin "sound/bank1/data/Table E/loc_8AC7.bin"

loc_8AD6:
	incbin "sound/bank1/data/Table E/loc_8AD6.bin"

loc_8ADE:
	incbin "sound/bank1/data/Table E/loc_8ADE.bin"

; -----------------------------------------------------------------------------
; Table D Data (Pitch Envelopes?)
; -----------------------------------------------------------------------------
loc_8AE5:
	dc.b	$02, $01, $00, $FF, $FE, $FF, $00, $01, $82

loc_8AEE:
	dc.b	$D8, $0A, $0A, $0A, $0A

loc_8AF3:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00

loc_8B09:
	dc.b	$0F, $0F, $0F, $F1, $F1, $F1, $F1, $F1, $F1, $0F, $0F, $0F, $81
	dc.b	$0C

loc_8B17:
	dc.b	$00, $28, $00, $D8, $D8, $28, $32, $CE, $CE, $32, $32, $CE, $82

loc_8B24:
	dc.b	$9C, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $00, $80

loc_8B31:
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

loc_8B50:
	dc.b	$06, $03, $FD, $FA, $00, $FA, $FD, $03, $06, $00, $81
	dc.b	$0A

loc_8B5C:
	dc.b	$02, $00, $00, $00, $00, $00, $FE, $00, $00, $00, $00, $00, $02, $00, $00, $00
	dc.b	$00, $00, $FE, $82

loc_8B70:
	dc.b	$19, $82

loc_8B72:
	dc.b	$D8, $82

loc_8B74:
	dc.b	$E2, $E2, $E2, $E2, $82

loc_8B79:
	dc.b	$CE, $CE, $CE, $CE, $82

loc_8B7E:
	dc.b	$E9, $82

loc_8B80:
	dc.b	$B0, $00, $00, $00, $1E, $1E, $14, $03, $00, $00, $00, $FD, $00, $00, $00, $02
	dc.b	$00, $00, $FE, $00, $00, $00, $02, $00, $FE, $00, $00, $FE, $00, $00, $00, $02
	dc.b	$00, $02, $00, $00, $FE, $F6, $E2, $D8, $CE, $81
	dc.b	$01

loc_8BAB:
	dc.b	$C4, $28, $14, $14, $F6, $F6, $03, $FD, $00, $88, $BA, $00, $81
	dc.b	$01

loc_8BB9:
	dc.b	$00, $F6, $EC, $D8, $D8, $EC, $F6, $00, $1B, $1B, $1B, $1B, $1B, $00, $81
	dc.b	$0D

loc_8BC9:
	dc.b	$07, $00, $F9, $00, $82

loc_8BCE:
	dc.b	$50, $D8, $E2, $F6, $00, $1E, $00, $E2, $81
	dc.b	$04

loc_8BD8:
	dc.b	$05, $FB, $81
	dc.b	$02

loc_8BDC:
	dc.b	$0F, $82

loc_8BDE:
	dc.b	$05, $05, $05, $05, $05, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	dc.b	$FB, $FB, $FB, $FB, $81
	dc.b	$14

loc_8BF4:
	dc.b	$38, $28, $28, $28, $28, $28, $D8, $D8, $D8, $D8, $D8, $81
	dc.b	$0A

loc_8C01:
	dc.b	$1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC, $1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC
	dc.b	$1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC, $1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC
	dc.b	$1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC, $1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC
	dc.b	$1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC, $1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC
	dc.b	$1E, $1E, $1E, $1E, $EC, $EC, $EC, $EC, $E2, $E2, $E2, $E2, $14, $14, $14, $14
	dc.b	$E2, $E2, $E2, $E2, $14, $14, $14, $14, $E2, $E2, $E2, $E2, $14, $14, $14, $14
	dc.b	$E2, $E2, $E2, $E2, $14, $14, $14, $14, $E2, $E2, $E2, $E2, $14, $14, $14, $14
	dc.b	$E2, $E2, $E2, $E2, $14, $14, $14, $14, $E2, $E2, $E2, $E2, $14, $14, $14, $14
	dc.b	$E2, $E2, $E2, $E2, $14, $14, $14, $14, $E2, $E2, $E2, $E2, $14, $14, $14, $14
	dc.b	$82

loc_8C92:
	dc.b	$78, $88, $28, $28, $28, $28, $D8, $D8, $D8, $D8, $32, $81
	dc.b	$01

; -----------------------------------------------------------------------------
; Table C Data (Volume envelopes?)
; -----------------------------------------------------------------------------

loc_8C9F:
	incbin "sound/bank1/data/Table C/loc_8C9F.bin"

loc_8CA2:
	incbin "sound/bank1/data/Table C/loc_8CA2.bin"

loc_8CD0:
	incbin "sound/bank1/data/Table C/loc_8CD0.bin"

loc_8CDB:
	incbin "sound/bank1/data/Table C/loc_8CDB.bin"

loc_8CE4:
	incbin "sound/bank1/data/Table C/loc_8CE4.bin"

loc_8D0C:
	incbin "sound/bank1/data/Table C/loc_8D0C.bin"

loc_8D1B:
	incbin "sound/bank1/data/Table C/loc_8D1B.bin"

loc_8D3F:
	incbin "sound/bank1/data/Table C/loc_8D3F.bin"

loc_8D6A:
	incbin "sound/bank1/data/Table C/loc_8D6A.bin"

loc_8D71:
	incbin "sound/bank1/data/Table C/loc_8D71.bin"

loc_8DB1:
	incbin "sound/bank1/data/Table C/loc_8DB1.bin"

loc_8DBE:
	incbin "sound/bank1/data/Table C/loc_8DBE.bin"

loc_8DC0:
	incbin "sound/bank1/data/Table C/loc_8DC0.bin"

loc_8DC2:
	incbin "sound/bank1/data/Table C/loc_8DC2.bin"

loc_8DC4:
	incbin "sound/bank1/data/Table C/loc_8DC4.bin"

loc_8DD5:
	incbin "sound/bank1/data/Table C/loc_8DD5.bin"

loc_8DD8:
	incbin "sound/bank1/data/Table C/loc_8DD8.bin"

loc_8DDB:
	incbin "sound/bank1/data/Table C/loc_8DDB.bin"

loc_8E09:
	incbin "sound/bank1/data/Table C/loc_8E09.bin"

loc_8E14:
	incbin "sound/bank1/data/Table C/loc_8E14.bin"

loc_8E1D:
	incbin "sound/bank1/data/Table C/loc_8E1D.bin"

loc_8E45:
	incbin "sound/bank1/data/Table C/loc_8E45.bin"

loc_8E47:
	incbin "sound/bank1/data/Table C/loc_8E47.bin"

loc_8E49:
	incbin "sound/bank1/data/Table C/loc_8E49.bin"

loc_8E58:
	incbin "sound/bank1/data/Table C/loc_8E58.bin"

; -----------------------------------------------------------------------------
; A Table E envelope lies here for some reason
; -----------------------------------------------------------------------------

loc_8E63:
	incbin "sound/bank1/data/Table E/loc_8E63.bin"

; -----------------------------------------------------------------------------
; Main Sound ID Pointers (for music and SFX)
; -----------------------------------------------------------------------------

SoundPtrs:
	; BGM IDs
	ptrZ80	BGM_00
	ptrZ80	BGM_01
	ptrZ80	BGM_02
	ptrZ80	BGM_03
	ptrZ80	BGM_04
	ptrZ80	BGM_05
	ptrZ80	BGM_06
	ptrZ80	BGM_07
	ptrZ80	BGM_08
	ptrZ80	BGM_09
	ptrZ80	BGM_0A
	ptrZ80	BGM_0B
	ptrZ80	BGM_0C
	ptrZ80	BGM_0D
	ptrZ80	BGM_0E
	ptrZ80	BGM_0F
	ptrZ80	BGM_10
	ptrZ80	BGM_11
	ptrZ80	BGM_12
	; Unplayable in the Sound Test
	ptrZ80	BGM_13
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_50
	ptrZ80	SFX_21	; 21
	ptrZ80	SFX_22
	ptrZ80	SFX_23
	ptrZ80	SFX_24
	ptrZ80	SFX_25
	ptrZ80	SFX_26
	ptrZ80	SFX_27
	ptrZ80	SFX_28
	ptrZ80	SFX_29
	ptrZ80	SFX_2A
	ptrZ80	SFX_2B
	ptrZ80	SFX_2C
	ptrZ80	SFX_2D
	ptrZ80	SFX_2E
	ptrZ80	SFX_2F
	ptrZ80	SFX_30	; 30
	ptrZ80	SFX_31
	ptrZ80	SFX_32
	ptrZ80	SFX_33
	ptrZ80	SFX_34
	ptrZ80	SFX_35
	ptrZ80	SFX_36
	ptrZ80	SFX_37
	ptrZ80	SFX_38
	ptrZ80	SFX_39
	ptrZ80	SFX_3A
	ptrZ80	SFX_3B
	ptrZ80	SFX_3C
	ptrZ80	SFX_3D
	ptrZ80	SFX_3E
	ptrZ80	SFX_3F
	ptrZ80	SFX_40
	ptrZ80	SFX_41
	ptrZ80	SFX_42
	ptrZ80	SFX_43
	ptrZ80	SFX_44
	ptrZ80	SFX_45
	ptrZ80	SFX_46
	ptrZ80	SFX_47
	ptrZ80	SFX_48
	ptrZ80	SFX_49
	ptrZ80	SFX_4A
	ptrZ80	SFX_4B
	ptrZ80	SFX_4C
	ptrZ80	SFX_4D
	ptrZ80	SFX_4E
	ptrZ80	SFX_4F
	ptrZ80	SFX_50
	ptrZ80	SFX_51
	ptrZ80	SFX_52
	ptrZ80	SFX_53
	ptrZ80	SFX_54
	ptrZ80	SFX_55
	ptrZ80	SFX_56
	ptrZ80	SFX_57
	ptrZ80	SFX_58
	ptrZ80	SFX_59
	ptrZ80	SFX_5A
	ptrZ80	SFX_5B
	ptrZ80	SFX_5C
	ptrZ80	SFX_5D
	ptrZ80	SFX_5E
	ptrZ80	SFX_5F
	ptrZ80	SFX_60
	ptrZ80	SFX_61
	ptrZ80	SFX_62
	ptrZ80	SFX_63
	ptrZ80	SFX_64
	ptrZ80	SFX_65
	ptrZ80	SFX_66
	ptrZ80	SFX_67
	ptrZ80	SFX_68
	ptrZ80	SFX_69
	ptrZ80	SFX_6A
	ptrZ80	SFX_6B
	ptrZ80	SFX_6C
	ptrZ80	SFX_6D
	ptrZ80	SFX_6E
	ptrZ80	SFX_6F
	ptrZ80	SFX_70
	ptrZ80	SFX_71
	ptrZ80	SFX_72
	ptrZ80	SFX_73
	ptrZ80	SFX_74
	ptrZ80	SFX_75
	ptrZ80	SFX_76
	ptrZ80	SFX_77
	ptrZ80	SFX_78
	ptrZ80	SFX_79
	ptrZ80	SFX_7A
	ptrZ80	SFX_7B
	ptrZ80	SFX_7C
	ptrZ80	SFX_7D
	ptrZ80	SFX_7E
	ptrZ80	SoundIDs_End	; (??? = This points to the Arle "Fire" Pointer Data?!)

; -----------------------------------------------------------------------------
; Music Data (to Disassemble)
; -----------------------------------------------------------------------------

BGM_00:		; loc_8F74
	include	"sound/bank1/bgm/BGM_00.asm"

BGM_01:		; loc_8F8A
	include	"sound/bank1/bgm/BGM_01.asm"

BGM_02:		; loc_9504
	include	"sound/bank1/bgm/BGM_02.asm"

BGM_03:		; loc_992E
	include	"sound/bank1/bgm/BGM_03.asm"

BGM_04:		; loc_9ADD
	include	"sound/bank1/bgm/BGM_04.asm"

BGM_05:		; loc_9CFC
	include	"sound/bank1/bgm/BGM_05.asm"

BGM_06:		; loc_9E74
	include	"sound/bank1/bgm/BGM_06.asm"

BGM_07:		; loc_A154
	include	"sound/bank1/bgm/BGM_07.asm"

BGM_08:		; loc_A2AB
	include	"sound/bank1/bgm/BGM_08.asm"

BGM_09:		; This song's data no longer exists.
BGM_0A:		; loc_ABA7
	include	"sound/bank1/bgm/BGM_0A.asm"

BGM_0B:		; loc_B1E6
	include	"sound/bank1/bgm/BGM_0B.asm"

BGM_0C:		; loc_B3DC
	include	"sound/bank1/bgm/BGM_0C.asm"

BGM_0D:		; loc_B743
	include	"sound/bank1/bgm/BGM_0D.asm"

BGM_0E:		; loc_B77F
	include	"sound/bank1/bgm/BGM_0E.asm"

BGM_0F:		; loc_B84E
	include	"sound/bank1/bgm/BGM_0F.asm"

BGM_10:		; loc_BAE4
	include	"sound/bank1/bgm/BGM_10.asm"

BGM_11:		; loc_BD0B
	include	"sound/bank1/bgm/BGM_11.asm"

BGM_12:		; loc_C534
	include	"sound/bank1/bgm/BGM_12.asm"

BGM_13:		; loc_C6BF
	include	"sound/bank1/bgm/BGM_13.asm"

; -----------------------------------------------------------------------------
; SFX Data
; -----------------------------------------------------------------------------

;loc_C750	- An unreferenced SFX lies here
	include	"sound/bank1/sfx/SFX - Unknown 1.asm"

SFX_21:		; loc_C76C
	include	"sound/bank1/sfx/SFX_21.asm"

SFX_22:		; loc_C77E:
	include	"sound/bank1/sfx/SFX_22.asm"

SFX_23:		; loc_C796:
	include	"sound/bank1/sfx/SFX_23.asm"

SFX_24:		; loc_C7A9:
	include	"sound/bank1/sfx/SFX_24.asm"

SFX_25:		; loc_C7DE:
	include	"sound/bank1/sfx/SFX_25.asm"

SFX_26:		; loc_C7F4:
	include	"sound/bank1/sfx/SFX_26.asm"

SFX_27:		; loc_C837:
	include	"sound/bank1/sfx/SFX_27.asm"

SFX_28:		; loc_C86A:
	include	"sound/bank1/sfx/SFX_28.asm"

SFX_29:		; loc_C887:
	include	"sound/bank1/sfx/SFX_29.asm"

SFX_2A:		; loc_C8CA:
	include	"sound/bank1/sfx/SFX_2A.asm"

SFX_2B:		; loc_C8DA:
	include	"sound/bank1/sfx/SFX_2B.asm"

SFX_2C:		; loc_C8F2:
	include	"sound/bank1/sfx/SFX_2C.asm"

SFX_2D:		; loc_C938:
	include	"sound/bank1/sfx/SFX_2D.asm"

SFX_2E:		; loc_C94C:
	include	"sound/bank1/sfx/SFX_2E.asm"

SFX_2F:		; loc_C985:
	include	"sound/bank1/sfx/SFX_2F.asm"

SFX_30:		; loc_C9EE:
	include	"sound/bank1/sfx/SFX_30.asm"

SFX_31:		; loc_CA14:
	include	"sound/bank1/sfx/SFX_31.asm"

SFX_32:		; loc_CA34:
	include	"sound/bank1/sfx/SFX_32.asm"

SFX_33:		; loc_CA9B:
	include	"sound/bank1/sfx/SFX_33.asm"

SFX_34:		; loc_CAAB:
	include	"sound/bank1/sfx/SFX_34.asm"

SFX_35:		; loc_CAD0:
	include	"sound/bank1/sfx/SFX_35.asm"

SFX_36:		; loc_CAEC:
	include	"sound/bank1/sfx/SFX_36.asm"

SFX_37:		; loc_CB04:
	include	"sound/bank1/sfx/SFX_37.asm"

SFX_38:		; loc_CB29:
	include	"sound/bank1/sfx/SFX_38.asm"

SFX_39:		; loc_CB4F:
	include	"sound/bank1/sfx/SFX_39.asm"

SFX_3A:		; loc_CB5F:
	include	"sound/bank1/sfx/SFX_3A.asm"

SFX_3B:		; loc_CB77:
	include	"sound/bank1/sfx/SFX_3B.asm"

SFX_3C:		; loc_CBB4:
	include	"sound/bank1/sfx/SFX_3C.asm"

SFX_3D:		; loc_CBC4:
	include	"sound/bank1/sfx/SFX_3D.asm"

SFX_3E:		; loc_CC0A:
	include	"sound/bank1/sfx/SFX_3E.asm"

SFX_3F:		; loc_CC38:
	include	"sound/bank1/sfx/SFX_3F.asm"

SFX_40:		; loc_CC3F:
	include	"sound/bank1/sfx/SFX_40.asm"

SFX_41:		; loc_CC4C:
	include	"sound/bank1/sfx/SFX_41.asm"

SFX_42:		; loc_CC5C:
	include	"sound/bank1/sfx/SFX_42.asm"

SFX_43:		; loc_CC6C:
	include	"sound/bank1/sfx/SFX_43.asm"

SFX_44:		; loc_CC87:
	include	"sound/bank1/sfx/SFX_44.asm"

SFX_45:		; loc_CC9F:
	include	"sound/bank1/sfx/SFX_45.asm"

SFX_46:		; loc_CCB7:
	include	"sound/bank1/sfx/SFX_46.asm"

SFX_47:		; loc_CCCF:
	include	"sound/bank1/sfx/SFX_47.asm"

SFX_48:		; loc_CCE8:
	include	"sound/bank1/sfx/SFX_48.asm"

SFX_49:		; loc_CD39:
	include	"sound/bank1/sfx/SFX_49.asm"

SFX_4A:		; loc_CD51:
	include	"sound/bank1/sfx/SFX_4A.asm"

SFX_4B:		; loc_CD61:
	include	"sound/bank1/sfx/SFX_4B.asm"

SFX_4C:		; loc_CD7E:
	include	"sound/bank1/sfx/SFX_4C.asm"

SFX_4D:		; loc_CD92:
	include	"sound/bank1/sfx/SFX_4D.asm"

SFX_4E:		; loc_CDAD
SFX_4F:
	include	"sound/bank1/sfx/SFX_4E.asm"

;loc_CE05	- An unreferenced SFX lies here
	include	"sound/bank1/sfx/SFX - Unknown 2.asm"

;loc_CE4C	- An unreferenced SFX lies here
	include	"sound/bank1/sfx/SFX - Unknown 3.asm"

;loc_CE79	- An unreferenced SFX lies here
	include	"sound/bank1/sfx/SFX - Unknown 4.asm"

SFX_50:		; loc_CE89:
	include	"sound/bank1/sfx/SFX_50.asm"

SFX_51:		; loc_CE9D:
	include	"sound/bank1/sfx/SFX_51.asm"

SFX_52:		; loc_CEAE:
	include	"sound/bank1/sfx/SFX_52.asm"

SFX_53:		; loc_CECB:
	include	"sound/bank1/sfx/SFX_53.asm"

SFX_54:		; loc_CEDF:
	include	"sound/bank1/sfx/SFX_54.asm"

SFX_55:		; loc_CF04:
	include	"sound/bank1/sfx/SFX_55.asm"

SFX_56:		; loc_CF1D:
	include	"sound/bank1/sfx/SFX_56.asm"

SFX_57:		; loc_CF3C:
	include	"sound/bank1/sfx/SFX_57.asm"

SFX_58:		; loc_CF49:
	include	"sound/bank1/sfx/SFX_58.asm"

SFX_59:		; loc_CF56:
	include	"sound/bank1/sfx/SFX_59.asm"

SFX_5A:		; loc_CF63:
	include	"sound/bank1/sfx/SFX_5A.asm"

SFX_5B:		; loc_CF70:
	include	"sound/bank1/sfx/SFX_5B.asm"

SFX_5C:		; loc_CF7D:
	include	"sound/bank1/sfx/SFX_5C.asm"

SFX_5D:		; loc_CF8A:
	include	"sound/bank1/sfx/SFX_5D.asm"

SFX_5E:		; loc_CFA7:
	include	"sound/bank1/sfx/SFX_5E.asm"

SFX_5F:		; loc_CFBE:
	include	"sound/bank1/sfx/SFX_5F.asm"

SFX_60:		; loc_CFF3:
	include	"sound/bank1/sfx/SFX_60.asm"

SFX_61:		; loc_D00B:
	include	"sound/bank1/sfx/SFX_61.asm"

SFX_62:		; loc_D050:
	include	"sound/bank1/sfx/SFX_62.asm"

SFX_63:		; loc_D064:
	include	"sound/bank1/sfx/SFX_63.asm"

SFX_64:		; loc_D076:
	include	"sound/bank1/sfx/SFX_64.asm"

SFX_65:		; loc_D0A0:
	include	"sound/bank1/sfx/SFX_65.asm"

SFX_66:		; loc_D100:
	include	"sound/bank1/sfx/SFX_66.asm"

SFX_67:		; loc_D136:
	include	"sound/bank1/sfx/SFX_67.asm"

SFX_68:		; loc_D146:
	include	"sound/bank1/sfx/SFX_68.asm"

SFX_69:		; loc_D17C:
	include	"sound/bank1/sfx/SFX_69.asm"

SFX_6A:		; loc_D19A:
	include	"sound/bank1/sfx/SFX_6A.asm"

SFX_6B:		; loc_D1D2:
	include	"sound/bank1/sfx/SFX_6B.asm"

SFX_6C:		; loc_D201:
	include	"sound/bank1/sfx/SFX_6C.asm"

SFX_6D:		; loc_D215:
	include	"sound/bank1/sfx/SFX_6D.asm"

SFX_6E:		; loc_D228:
	include	"sound/bank1/sfx/SFX_6E.asm"

SFX_6F:		; loc_D235:
	include	"sound/bank1/sfx/SFX_6F.asm"

SFX_70:		; loc_D255:
	include	"sound/bank1/sfx/SFX_70.asm"

SFX_71:		; loc_D262:
	include	"sound/bank1/sfx/SFX_71.asm"

SFX_72:		; loc_D27F:
	include	"sound/bank1/sfx/SFX_72.asm"

SFX_73:		; loc_D2A9:
	include	"sound/bank1/sfx/SFX_73.asm"

SFX_74:		; loc_D2D1:
	include	"sound/bank1/sfx/SFX_74.asm"

SFX_75:		; loc_D2FB:
	include	"sound/bank1/sfx/SFX_75.asm"

SFX_76:		; loc_D30E:
	include	"sound/bank1/sfx/SFX_76.asm"

SFX_77:		; loc_D3AF:
	include	"sound/bank1/sfx/SFX_77.asm"

SFX_78:		; loc_D3D1:
	include	"sound/bank1/sfx/SFX_78.asm"

SFX_79:		; loc_D3F8:
	include	"sound/bank1/sfx/SFX_79.asm"

SFX_7A:		; loc_D41A:
	include	"sound/bank1/sfx/SFX_7A.asm"

SFX_7B:		; loc_D437:
	include	"sound/bank1/sfx/SFX_7B.asm"

SFX_7C:		; loc_D462:
	include	"sound/bank1/sfx/SFX_7C.asm"

SFX_7D:		; loc_D49D
	include	"sound/bank1/sfx/SFX_7D.asm"

SFX_7E:		; loc_D4BA
	include	"sound/bank1/sfx/SFX_7E.asm"
SoundIDs_End:

; -----------------------------------------------------------------------------
; Arle "Fire" PCM Data
; -----------------------------------------------------------------------------

PCMData_Bank1:
	ptrZ80	Header_Arle_Fire

Header_Arle_Fire:
	ptrZ80	PCM_Arle_Fire				; Sample Pointer
	ptrZ80	(PCM_Arle_Fire_End-PCM_Arle_Fire)	; Length of Sample
	ptrZ80	$000F
	ptrZ80	$0000

PCM_Arle_Fire:
	incbin	"sound/bank1/pcm/Arle_Fire.bin"
PCM_Arle_Fire_End:

	cpu 68000
	objend
