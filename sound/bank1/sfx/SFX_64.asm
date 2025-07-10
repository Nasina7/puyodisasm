	include "sound/z80_macros.asm"

;	SFX 64
SFX64_Header:
	dc.b	$02

SFX64_PLR08_Init:
	dc.b	$08
	dc.b	$01
	dc.b	$13
	dc.b	$00
	dc.b	$0F
	dc.b	$00
	dc.b	$00
	dc.b	$05
	ptrZ80	SFX64_PLR08
	dc.b	panCentre
	dc.b	$4A

SFX64_PLR09_Init:
	dc.b	$09
	dc.b	$01
	dc.b	$0D
	dc.b	$00
	dc.b	$0F
	dc.b	$00
	dc.b	$00
	dc.b	$02
	ptrZ80	SFX64_PLR09
	dc.b	panCentre
	dc.b	$4A

SFX64_PLR09:
	dc.b	$00, $E6
	dc.b	$97, $FD

SFX64_PLR08:
	dc.b	$A1
	dc.b	$93, $1E, $FF
	dc.b	$42, $DE
	dc.b	$1E
	dc.b	$93, $90, $FF
	dc.b	$42, $EB
	CSP_Stop