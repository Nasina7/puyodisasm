	include "sound/z80_macros.asm"

;	SFX 77
SFX77_Header:
	dc.b	$01

SFX77_PLR0B_Init:
	dc.b	$0B
	dc.b	$01
	dc.b	$1E
	dc.b	$24
	dc.b	$01
	dc.b	$00
	dc.b	$00
	dc.b	$04
	ptrZ80	SFX77_PLR0B
	dc.b	panCentre
	dc.b	$4C

SFX77_PLR0B:
	dc.b	$A1
	dc.b	$84, $20
	dc.b	$3A, $E1
	dc.b	$41, $ED
	dc.b	$8A, $FB
	dc.b	$93, $8D, $FF

SFX77_Loop00:
	dc.b	$41, $DF
	dc.b	$89, $FF
	dc.b	$95
	ptrZ80	SFX77_Loop00
	CSP_Stop

; Unused Stop Command (why Compile?
	CSP_Stop