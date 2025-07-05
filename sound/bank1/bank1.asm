; Note: This file is a work in progress, and is not currently shiftable!
	include "sound/z80_macros.asm"
	cpu z80
	obj $8000

bank1_start:
	ptrZ80	SoundPtrs	; $8E74
	ptrZ80	loc_89BA
	ptrZ80	loc_8A6D
	ptrZ80	loc_8A39
	ptrZ80	loc_8AB5
	ptrZ80	$7FFB		; ???
	ptrZ80	loc_8010
	dc.b	$09, $00

loc_8010:
	incbin "sound/bank1/data/8010.bin"
loc_89BA:	; No idea
	incbin "sound/bank1/data/89BA.bin"
loc_8A39:	; Pointer index
	incbin "sound/bank1/data/8A39.bin"

loc_8A6D:	; Pointers index
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

loc_8AB5:
	incbin "sound/bank1/data/8AB5.bin"

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

; Unreferenced Data?
	incbin "sound/bank1/data/Table C/loc_8E63.bin"

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
	ptrZ80	$D4DB	; 7F

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

; Unreference SFX - Likely used to debug PCM data before adding Voices
	include "sound/bank1/sfx/SFX - PCM Debugger.asm"

SFX_21:
	incbin "sound/bank1/sfx/C76C.bin"
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
;SFX_D4DB:

	cpu 68000
	objend
