	include "sound/z80_macros.asm"
	include "sound/bank1/macros.asm"
; Unreferenced SFX - PCM Debugger
SE_Unk_Header:
	dc.b	$01

SE_Unk_Ch06_Init:
	dc.b	$06
	dc.b	$01
	dc.b	$1F
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SE_Unk_Ch06
	dc.b	$C0
	dc.b	$00

SE_Unk_Ch06:
	dc.b	$A7
	dc.b	$00
	dc.b	$E6
	dc.b	$A7
	dc.b	$01
	dc.b	$E4
	dc.b	$A7
	dc.b	$02
	dc.b	$A7
	dc.b	$03
	dc.b	$A7
	dc.b	$04
	dc.b	$DE
	dc.b	$80	; ????? (This jumps to loc_0182, which in turn causes the game to
	dc.b	$82	; start reading garbage data, so the fixed version is listed below)
;	dc.b	$82
;	dc.b 	$FF	; Padding to prevent misaligned pointers (will remove later)