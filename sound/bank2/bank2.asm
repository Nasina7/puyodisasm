	include "sound/z80_macros.asm"
	
	cpu z80
	obj $8000
	
bank2_start:
	ptrZ80 header_arle_yattana
	ptrZ80 header_arle_puyopuyo
	
header_arle_yattana: ; 8004
	ptrZ80 arle_yattana_ya ; Pointer to sample
	ptrZ80 (arle_yattana_ya_end-arle_yattana_ya) ; Length of sample
	ptrZ80 $000B ; Speed / Pitch
	ptrZ80 $00FF ; Continuation (a value of FF indicates that the sample continues with more segments after this, while 00 indicates the sample is done playing)
	ptrZ80 $0370 ; Delay to next sample?
	ptrZ80 $000B ; Delay to next sample?
	
	ptrZ80 arle_yattana_ta
	ptrZ80 (arle_yattana_ta_end-arle_yattana_ta)
	ptrZ80 $000B
	ptrZ80 $00FF
	ptrZ80 $0140
	ptrZ80 $000B
	
	ptrZ80 arle_yattana_na
	ptrZ80 (arle_yattana_na_end-arle_yattana_na)
	ptrZ80 $000B
	ptrZ80 $0000

header_arle_puyopuyo:
	ptrZ80 arle_puyopuyo_pu
	ptrZ80 (arle_puyopuyo_pu_end-arle_puyopuyo_pu)
	ptrZ80 $000D
	ptrZ80 $00FF
	ptrZ80 $0058
	ptrZ80 $000D
	
	ptrZ80 arle_puyopuyo_yo
	ptrZ80 (arle_puyopuyo_yo_end-arle_puyopuyo_yo)
	ptrZ80 $000D
	ptrZ80 $00FF
	ptrZ80 $0130
	ptrZ80 $000D
	
	ptrZ80 arle_puyopuyo_puyo
	ptrZ80 (arle_puyopuyo_puyo_end-arle_puyopuyo_puyo)
	ptrZ80 $000D
	ptrZ80 $0000

arle_yattana_ya:
	incbin "sound/bank2/yattana/ya.bin"
arle_yattana_ya_end:
	
arle_yattana_ta:
	incbin "sound/bank2/yattana/ta.bin"
arle_yattana_ta_end:
	
arle_yattana_na:
	incbin "sound/bank2/yattana/na.bin"
arle_yattana_na_end:
	
arle_puyopuyo_pu:
	incbin "sound/bank2/puyopuyo/pu.bin"
arle_puyopuyo_pu_end:
	
arle_puyopuyo_yo:
	incbin "sound/bank2/puyopuyo/yo.bin"
arle_puyopuyo_yo_end:
	
arle_puyopuyo_puyo:
	incbin "sound/bank2/puyopuyo/puyo.bin"
arle_puyopuyo_puyo_end:
	
bank2_end:

	cpu 68000
	objend
