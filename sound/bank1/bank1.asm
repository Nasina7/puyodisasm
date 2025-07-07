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

loc_8010:	; Also no idea (has a 4 then points to the Arle PCM Pointers?)
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
; An unreferenced SFX lies here - Likely used to debug PCM data before adding Voices
; -----------------------------------------------------------------------------

SFX_DEBUG:	; loc_C750
	include	"sound/bank1/sfx/SFX - PCM Debugger.asm"

; -----------------------------------------------------------------------------
; SFX Data (and Arle "Fire" PCM), to split and disassemble
; -----------------------------------------------------------------------------

SFX_21:		; loc_C76C
	incbin	"sound/bank1/sfx/SFX_21.bin"

SFX_22:		; loc_C77E:
	incbin	"sound/bank1/sfx/SFX_22.bin"

SFX_23:		; loc_C796:
	incbin	"sound/bank1/sfx/SFX_23.bin"

SFX_24:		; loc_C7A9:
	incbin	"sound/bank1/sfx/SFX_24.bin"

SFX_25:		; loc_C7DE:
	incbin	"sound/bank1/sfx/SFX_25.bin"

SFX_26:		; loc_C7F4:
	incbin	"sound/bank1/sfx/SFX_26.bin"

SFX_27:		; loc_C837:
	incbin	"sound/bank1/sfx/SFX_27.bin"

SFX_28:		; loc_C86A:
	incbin	"sound/bank1/sfx/SFX_28.bin"

SFX_29:		; loc_C887:
	incbin	"sound/bank1/sfx/SFX_29.bin"

SFX_2A:		; loc_C8CA:
	incbin	"sound/bank1/sfx/SFX_2A.bin"

SFX_2B:		; loc_C8DA:
	incbin	"sound/bank1/sfx/SFX_2B.bin"

SFX_2C:		; loc_C8F2:
	incbin	"sound/bank1/sfx/SFX_2C.bin"

SFX_2D:		; loc_C938:
	incbin	"sound/bank1/sfx/SFX_2D.bin"

SFX_2E:		; loc_C94C:
	incbin	"sound/bank1/sfx/SFX_2E.bin"

SFX_2F:		; loc_C985:
	incbin	"sound/bank1/sfx/SFX_2F.bin"

SFX_30:		; loc_C9EE:
	incbin	"sound/bank1/sfx/SFX_30.bin"

SFX_31:		; loc_CA14:
	incbin	"sound/bank1/sfx/SFX_31.bin"

SFX_32:		; loc_CA34:
	incbin	"sound/bank1/sfx/SFX_32.bin"

SFX_33:		; loc_CA9B:
	incbin	"sound/bank1/sfx/SFX_33.bin"

SFX_34:		; loc_CAAB:
	incbin	"sound/bank1/sfx/SFX_34.bin"

SFX_35:		; loc_CAD0:
	incbin	"sound/bank1/sfx/SFX_35.bin"

SFX_36:		; loc_CAEC:
	incbin	"sound/bank1/sfx/SFX_36.bin"

SFX_37:		; loc_CB04:
	incbin	"sound/bank1/sfx/SFX_37.bin"

SFX_38:		; loc_CB29:
	incbin	"sound/bank1/sfx/SFX_38.bin"

SFX_39:		; loc_CB4F:
	incbin	"sound/bank1/sfx/SFX_39.bin"

SFX_3A:		; loc_CB5F:
	incbin	"sound/bank1/sfx/SFX_3A.bin"

SFX_3B:		; loc_CB77:
	incbin	"sound/bank1/sfx/SFX_3B.bin"

SFX_3C:		; loc_CBB4:
	incbin	"sound/bank1/sfx/SFX_3C.bin"

SFX_3D:		; loc_CBC4:
	incbin	"sound/bank1/sfx/SFX_3D.bin"

SFX_3E:		; loc_CC0A:
	incbin	"sound/bank1/sfx/SFX_3E.bin"

SFX_3F:		; loc_CC38:
	incbin	"sound/bank1/sfx/SFX_3F.bin"

SFX_40:		; loc_CC3F:
	incbin	"sound/bank1/sfx/SFX_40.bin"

SFX_41:		; loc_CC4C:
	incbin	"sound/bank1/sfx/SFX_41.bin"

SFX_42:		; loc_CC5C:
	incbin	"sound/bank1/sfx/SFX_42.bin"

SFX_43:		; loc_CC6C:
	incbin	"sound/bank1/sfx/SFX_43.bin"

SFX_44:		; loc_CC87:
	incbin	"sound/bank1/sfx/SFX_44.bin"

SFX_45:		; loc_CC9F:
	incbin	"sound/bank1/sfx/SFX_45.bin"

SFX_46:		; loc_CCB7:
	incbin	"sound/bank1/sfx/SFX_46.bin"

SFX_47:		; loc_CCCF:
	incbin	"sound/bank1/sfx/SFX_47.bin"

SFX_48:		; loc_CCE8:
	incbin	"sound/bank1/sfx/SFX_48.bin"

SFX_49:		; loc_CD39:
	incbin	"sound/bank1/sfx/SFX_49.bin"

SFX_4A:		; loc_CD51:
	incbin	"sound/bank1/sfx/SFX_4A.bin"

SFX_4B:		; loc_CD61:
	incbin	"sound/bank1/sfx/SFX_4B.bin"

SFX_4C:		; loc_CD7E:
	incbin	"sound/bank1/sfx/SFX_4C.bin"

SFX_4D:		; loc_CD92:
	incbin	"sound/bank1/sfx/SFX_4D.bin"

SFX_4E:		; loc_CDAD
SFX_4F:
	incbin	"sound/bank1/sfx/SFX_4E.bin"

; loc_CE4C - This SFX's data has been dummied out
	incbin	"sound/bank1/sfx/SFX_4F.bin"

SFX_50:		; loc_CE89:
	incbin	"sound/bank1/sfx/SFX_50.bin"

SFX_51:		; loc_CE9D:
	incbin	"sound/bank1/sfx/SFX_51.bin"

SFX_52:		; loc_CEAE:
	incbin	"sound/bank1/sfx/SFX_52.bin"

SFX_53:		; loc_CECB:
	incbin	"sound/bank1/sfx/SFX_53.bin"

SFX_54:		; loc_CEDF:
	incbin	"sound/bank1/sfx/SFX_54.bin"

SFX_55:		; loc_CF04:
	incbin	"sound/bank1/sfx/SFX_55.bin"

SFX_56:		; loc_CF1D:
	incbin	"sound/bank1/sfx/SFX_56.bin"

SFX_57:		; loc_CF3C:
	incbin	"sound/bank1/sfx/SFX_57.bin"

SFX_58:		; loc_CF49:
	incbin	"sound/bank1/sfx/SFX_58.bin"

SFX_59:		; loc_CF56:
	incbin	"sound/bank1/sfx/SFX_59.bin"

SFX_5A:		; loc_CF63:
	incbin	"sound/bank1/sfx/SFX_5A.bin"

SFX_5B:		; loc_CF70:
	incbin	"sound/bank1/sfx/SFX_5B.bin"

SFX_5C:		; loc_CF7D:
	incbin	"sound/bank1/sfx/SFX_5C.bin"

SFX_5D:		; loc_CF8A:
	incbin	"sound/bank1/sfx/SFX_5D.bin"

SFX_5E:		; loc_CFA7:
	incbin	"sound/bank1/sfx/SFX_5E.bin"

SFX_5F:		; loc_CFBE:
	incbin	"sound/bank1/sfx/SFX_5F.bin"

SFX_60:		; loc_CFF3:
	incbin	"sound/bank1/sfx/SFX_60.bin"

SFX_61:		; loc_D00B:
	incbin	"sound/bank1/sfx/SFX_61.bin"

SFX_62:		; loc_D050:
	incbin	"sound/bank1/sfx/SFX_62.bin"

SFX_63:		; loc_D064:
	incbin	"sound/bank1/sfx/SFX_63.bin"

SFX_64:		; loc_D076:
	incbin	"sound/bank1/sfx/SFX_64.bin"

SFX_65:		; loc_D0A0:
	incbin	"sound/bank1/sfx/SFX_65.bin"

SFX_66:		; loc_D100:
	incbin	"sound/bank1/sfx/SFX_66.bin"

SFX_67:		; loc_D136:
	incbin	"sound/bank1/sfx/SFX_67.bin"

SFX_68:		; loc_D146:
	incbin	"sound/bank1/sfx/SFX_68.bin"

SFX_69:		; loc_D17C:
	incbin	"sound/bank1/sfx/SFX_69.bin"

SFX_6A:		; loc_D19A:
	incbin	"sound/bank1/sfx/SFX_6A.bin"

SFX_6B:		; loc_D1D2:
	incbin	"sound/bank1/sfx/SFX_6B.bin"

SFX_6C:		; loc_D201:
	incbin	"sound/bank1/sfx/SFX_6C.bin"

SFX_6D:		; loc_D215:
	incbin	"sound/bank1/sfx/SFX_6D.bin"

SFX_6E:		; loc_D228:
	incbin	"sound/bank1/sfx/SFX_6E.bin"

SFX_6F:		; loc_D235:
	incbin	"sound/bank1/sfx/SFX_6F.bin"

SFX_70:		; loc_D255:
	incbin	"sound/bank1/sfx/SFX_70.bin"

SFX_71:		; loc_D262:
	incbin	"sound/bank1/sfx/SFX_71.bin"

SFX_72:		; loc_D27F:
	incbin	"sound/bank1/sfx/SFX_72.bin"

SFX_73:		; loc_D2A9:
	incbin	"sound/bank1/sfx/SFX_73.bin"

SFX_74:		; loc_D2D1:
	incbin	"sound/bank1/sfx/SFX_74.bin"

SFX_75:		; loc_D2FB:
	incbin	"sound/bank1/sfx/SFX_75.bin"

SFX_76:		; loc_D30E:
	incbin	"sound/bank1/sfx/SFX_76.bin"

SFX_77:		; loc_D3AF:
	incbin	"sound/bank1/sfx/SFX_77.bin"

SFX_78:		; loc_D3D1:
	incbin	"sound/bank1/sfx/SFX_78.bin"

SFX_79:		; loc_D3F8:
	incbin	"sound/bank1/sfx/SFX_79.bin"

SFX_7A:		; loc_D41A:
	incbin	"sound/bank1/sfx/SFX_7A.bin"

SFX_7B:		; loc_D437:
	incbin	"sound/bank1/sfx/SFX_7B.bin"

SFX_7C:		;loc_D462:
	incbin	"sound/bank1/sfx/SFX_7C.bin"

SFX_7D:		; loc_D49D
	incbin	"sound/bank1/sfx/SFX_7D.bin"

SFX_7E:		; loc_D4BA
	incbin	"sound/bank1/sfx/SFX_7E.bin"

SoundIDs_End:

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
