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
	dc.b	$04		; Don't know what this does but... it affects the samples
	ptrZ80	loc_D4DB	; Location of PCM Table in Bank 1
	ptrZ80	bank2_start	; Location of PCM Table in Bank 2

;	PCM Table of some kind (relative to the table for the Bank????)
	ptrZ80	$0000		; Points to "Fire" PCM
	ptrZ80	$0200		; Points to Bank 2 "Yattana" PCM
	ptrZ80	$0202		; Points to Bank 2 "Puyo Puyo" PCM
	ptrZ80	$0000		; Points to "Fire" PCM

FM_Instrument_Patches:		; TODO: Figure out the instrument format
	include "sound/bank1/data/Patches.asm"

NoteTimings:	; loc_89BA
	incbin "sound/bank1/data/NoteTimings.bin"

;	Drum Mappings (I think)	
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
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	$CE89	; SFX_50
	ptrZ80	SFX_21	; 21
	ptrZ80	$C77E
	ptrZ80	$C796
	ptrZ80	$C7A9
	ptrZ80	$C7DE
	ptrZ80	$C7F4
	ptrZ80	$C837
	ptrZ80	$C86A
	ptrZ80	$C887
	ptrZ80	$C8CA
	ptrZ80	$C8DA
	ptrZ80	$C8F2
	ptrZ80	$C938
	ptrZ80	$C94C
	ptrZ80	$C985
	ptrZ80	$C9EE	; 30
	ptrZ80	$CA14
	ptrZ80	$CA34
	ptrZ80	$CA9B
	ptrZ80	$CAAB
	ptrZ80	$CAD0
	ptrZ80	$CAEC
	ptrZ80	$CB04
	ptrZ80	$CB29
	ptrZ80	$CB4F
	ptrZ80	$CB5F
	ptrZ80	$CB77
	ptrZ80	$CBB4
	ptrZ80	$CBC4
	ptrZ80	$CC0A
	ptrZ80	$CC38
	ptrZ80	$CC3F	; 40
	ptrZ80	$CC4C
	ptrZ80	$CC5C
	ptrZ80	$CC6C
	ptrZ80	$CC87
	ptrZ80	$CC9F
	ptrZ80	$CCB7
	ptrZ80	$CCCF
	ptrZ80	$CCE8
	ptrZ80	$CD39
	ptrZ80	$CD51
	ptrZ80	$CD61
	ptrZ80	$CD7E
	ptrZ80	$CD92
	ptrZ80	$CDAD
	ptrZ80	$CDAD
	ptrZ80	$CE89	; 50
	ptrZ80	$CE9D
	ptrZ80	$CEAE
	ptrZ80	$CECB
	ptrZ80	$CEDF
	ptrZ80	$CF04
	ptrZ80	$CF1D
	ptrZ80	$CF3C
	ptrZ80	$CF49
	ptrZ80	$CF56
	ptrZ80	$CF63
	ptrZ80	$CF70
	ptrZ80	$CF7D
	ptrZ80	$CF8A
	ptrZ80	$CFA7
	ptrZ80	$CFBE
	ptrZ80	$CFF3	; 60
	ptrZ80	$D00B
	ptrZ80	$D050
	ptrZ80	$D064
	ptrZ80	$D076
	ptrZ80	$D0A0
	ptrZ80	$D100
	ptrZ80	$D136
	ptrZ80	$D146
	ptrZ80	$D17C
	ptrZ80	$D19A
	ptrZ80	$D1D2
	ptrZ80	$D201
	ptrZ80	$D215
	ptrZ80	$D228
	ptrZ80	$D235
	ptrZ80	$D255	; 70
	ptrZ80	$D262
	ptrZ80	$D27F
	ptrZ80	$D2A9
	ptrZ80	$D2D1
	ptrZ80	$D2FB
	ptrZ80	$D30E
	ptrZ80	$D3AF
	ptrZ80	$D3D1
	ptrZ80	$D3F8
	ptrZ80	$D41A
	ptrZ80	$D437
	ptrZ80	$D462
	ptrZ80	$D49D
	ptrZ80	$D4BA
	ptrZ80	loc_D4DB	; 7F	(??? = This points to the Arle "Fire" Pointer Data?!)

; -----------------------------------------------------------------------------
; Music Data (to Disassemble)
; -----------------------------------------------------------------------------

BGM_00:
	include "sound/bank1/music/00.asm"

BGM_01:
	incbin "sound/bank1/music/01.bin"

BGM_02:
	incbin "sound/bank1/music/02.bin"

BGM_03:
	incbin "sound/bank1/music/03.bin"

BGM_04:
	incbin "sound/bank1/music/04.bin"

BGM_05:
	include "sound/bank1/music/05.asm"

BGM_06:
	incbin "sound/bank1/music/06.bin"

BGM_07:
	include "sound/bank1/music/07.asm"

BGM_08:
	incbin "sound/bank1/music/08.bin"

BGM_09: ; This song's data no longer exists.
BGM_0A:
	incbin "sound/bank1/music/0A.bin"

BGM_0B:
	incbin "sound/bank1/music/0B.bin"

BGM_0C:
	incbin "sound/bank1/music/0C.bin"

BGM_0D:
	include "sound/bank1/music/0D.asm"

BGM_0E:
	include "sound/bank1/music/0E.asm"

BGM_0F:
	incbin "sound/bank1/music/0F.bin"

BGM_10:
	incbin "sound/bank1/music/10.bin"

BGM_11:
	incbin "sound/bank1/music/11.bin"

BGM_12:
	include "sound/bank1/music/12.asm"

BGM_13:
	include "sound/bank1/music/13.asm"

; -----------------------------------------------------------------------------
; An unreferenced SFX lies here - Likely used to debug PCM data before adding Voices
; -----------------------------------------------------------------------------

SFX_DEBUG:
	include "sound/bank1/sfx/SFX - PCM Debugger.asm"

; -----------------------------------------------------------------------------
; SFX Data (and Arle "Fire" PCM), to split and disassemble
; -----------------------------------------------------------------------------

SFX_21:
	incbin "sound/bank1/sfx/SFX.bin"
;SFX_C77E:
;SFX_C796:
;SFX_C7A9:
;SFX_C7DE:
;SFX_C7F4:
;SFX_C837:
;SFX_C86A:
;SFX_C887:
;SFX_C8CA:
;SFX_C8DA:
;SFX_C8F2:
;SFX_C938:
;SFX_C94C:
;SFX_C985:
;SFX_C9EE:
;SFX_CA14:
;SFX_CA34:
;SFX_CA9B:
;SFX_CAAB:
;SFX_CAD0:
;SFX_CAEC:
;SFX_CB04:
;SFX_CB29:
;SFX_CB4F:
;SFX_CB5F:
;SFX_CB77:
;SFX_CBB4:
;SFX_CBC4:
;SFX_CC0A:
;SFX_CC38:
;SFX_CC3F:
;SFX_CC4C:
;SFX_CC5C:
;SFX_CC6C:
;SFX_CC87:
;SFX_CC9F:
;SFX_CCB7:
;SFX_CCCF:
;SFX_CCE8:
;SFX_CD39:
;SFX_CD51:
;SFX_CD61:
;SFX_CD7E:
;SFX_CD92:
;SFX_CDAD:
;SFX_CDAD:
;SFX_CE89:
;SFX_CE9D:
;SFX_CEAE:
;SFX_CECB:
;SFX_CEDF:
;SFX_CF04:
;SFX_CF1D:
;SFX_CF3C:
;SFX_CF49:
;SFX_CF56:
;SFX_CF63:
;SFX_CF70:
;SFX_CF7D:
;SFX_CF8A:
;SFX_CFA7:
;SFX_CFBE:
;SFX_CFF3:
;SFX_D00B:
;SFX_D050:
;SFX_D064:
;SFX_D076:
;SFX_D0A0:
;SFX_D100:
;SFX_D136:
;SFX_D146:
;SFX_D17C:
;SFX_D19A:
;SFX_D1D2:
;SFX_D201:
;SFX_D215:
;SFX_D228:
;SFX_D235:
;SFX_D255:
;SFX_D262:
;SFX_D27F:
;SFX_D2A9:
;SFX_D2D1:
;SFX_D2FB:
;SFX_D30E:
;SFX_D3AF:
;SFX_D3D1:
;SFX_D3F8:
;SFX_D41A:
;SFX_D437:
;SFX_D462:
;SFX_D49D:
;SFX_D4BA:

loc_D4DB:
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
