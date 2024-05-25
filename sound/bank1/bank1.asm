; Note: This file is a work in progress, and is not currently shiftable!
	include "sound/z80_macros.asm"
	cpu z80
	obj $8000

bank1_start:
	ptrZ80	MusicPointerTable ; $8E74
	ptrZ80	loc_89BA
	ptrZ80	loc_8A6D
	ptrZ80	loc_8A39
	ptrZ80	loc_8AB5
	ptrZ80	$7FFB ; ???
	ptrZ80	loc_8010
	dc.b	$09, $00
	
loc_8010:
	incbin "sound/bank1/data/8010.bin"
loc_89BA:
	incbin "sound/bank1/data/89BA.bin"
loc_8A39:
	incbin "sound/bank1/data/8A39.bin"
loc_8A6D:
	incbin "sound/bank1/data/8A6D.bin"
loc_8AB5:
	incbin "sound/bank1/data/8AB5.bin"
MusicPointerTable:
	ptrZ80	song_00
	ptrZ80	song_01
	ptrZ80	song_02
	ptrZ80	song_03
	ptrZ80	song_04
	ptrZ80	song_05
	ptrZ80	song_06
	ptrZ80	song_07
	ptrZ80	song_08
	ptrZ80	song_09
	ptrZ80	song_0A
	ptrZ80	song_0B
	ptrZ80	song_0C
	ptrZ80	song_0D
	ptrZ80	song_0E
	ptrZ80	song_0F
	ptrZ80	song_10
	ptrZ80	song_11
	ptrZ80	song_12
	ptrZ80	song_13
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89
	ptrZ80	$CE89 ; 1F
	incbin "sound/bank1/data/musptrtable.bin"
	
song_00:
	include "sound/bank1/music/00.asm"
song_01:
	incbin "sound/bank1/music/01.bin"
song_02:
	incbin "sound/bank1/music/02.bin"
song_03:
	incbin "sound/bank1/music/03.bin"
song_04:
	incbin "sound/bank1/music/04.bin"
song_05:
	incbin "sound/bank1/music/05.bin"
song_06:
	incbin "sound/bank1/music/06.bin"
song_07:
	incbin "sound/bank1/music/07.bin"
song_08:
	incbin "sound/bank1/music/08.bin"
song_09: ; This song's data no longer exists.
song_0A:
	incbin "sound/bank1/music/0A.bin"
song_0B:
	incbin "sound/bank1/music/0B.bin"
song_0C:
	incbin "sound/bank1/music/0C.bin"
song_0D:
	include "sound/bank1/music/0D.asm"
song_0E:
	include "sound/bank1/music/0E.asm"
song_0F:
	incbin "sound/bank1/music/0F.bin"
song_10:
	incbin "sound/bank1/music/10.bin"
song_11:
	incbin "sound/bank1/music/11.bin"
song_12:
	incbin "sound/bank1/music/12.bin"
song_13:
	include "sound/bank1/music/13.asm"
	incbin "sound/bank1/data/unkdat.bin"
loc_C76C:
	incbin "sound/bank1/data/C76C.bin"
	
	cpu 68000
	objend