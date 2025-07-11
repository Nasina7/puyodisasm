	include "sound/z80_macros.asm"

;	BGM 03 - Baroque of Puyo Puyo
BGM03_Header:
	dc.b	$06

BGM03_PLR00_Init:
	dc.b	$00
	dc.b	$01
	dc.b	$1A
	dc.b	$00
	dc.b	$00
	dc.b	$0C
	dc.b	$66
	dc.b	$00
	ptrZ80	BGM03_PLR00
	dc.b	panRight
	dc.b	$0B

BGM03_PLR01_Init:
	dc.b	$01
	dc.b	$01
	dc.b	$18
	dc.b	$00
	dc.b	$00
	dc.b	$0C
	dc.b	$66
	dc.b	$01
	ptrZ80	BGM03_PLR01
	dc.b	panLeft
	dc.b	$0B

BGM03_PLR02_Init:
	dc.b	$02
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$00
	dc.b	$18
	dc.b	$66
	dc.b	$02
	ptrZ80	BGM03_PLR02
	dc.b	panLeft
	dc.b	$0B

BGM03_PLR03_Init:
	dc.b	$03
	dc.b	$01
	dc.b	$17
	dc.b	$00
	dc.b	$00
	dc.b	$0C
	dc.b	$66
	dc.b	$04
	ptrZ80	BGM03_PLR03
	dc.b	panRight
	dc.b	$0B

BGM03_PLR04_Init:
	dc.b	$04
	dc.b	$01
	dc.b	$17
	dc.b	$00
	dc.b	$00
	dc.b	$0C
	dc.b	$66
	dc.b	$03
	ptrZ80	BGM03_PLR04
	dc.b	panCentre
	dc.b	$0B

BGM03_PLR05_Init:
	dc.b	$05
	dc.b	$01
	dc.b	$15
	dc.b	$00
	dc.b	$01
	dc.b	$18
	dc.b	$66
	dc.b	$05
	ptrZ80	BGM03_PLR04
	dc.b	panCentre
	dc.b	$0B

BGM03_PLR01:
	dc.b	$00, $DF
	dc.b	$97, $02

BGM03_PLR00:
	dc.b	$35, $E3
	dc.b	$31
	dc.b	$00
	dc.b	$31
	dc.b	$30, $E1
	dc.b	$31
	dc.b	$33, $E3
	dc.b	$31
	dc.b	$2C
	dc.b	$2E, $E1
	dc.b	$30
	dc.b	$31, $E5
	dc.b	$2E, $E3
	dc.b	$30, $E1
	dc.b	$31
	dc.b	$31, $E3
	dc.b	$2E
	dc.b	$2C
	dc.b	$35
	dc.b	$31
	dc.b	$00
	dc.b	$31
	dc.b	$30, $E1
	dc.b	$31
	dc.b	$33, $E3
	dc.b	$31
	dc.b	$2C
	dc.b	$2A, $E1
	dc.b	$2C
	dc.b	$2A
	dc.b	$29
	dc.b	$27
	dc.b	$29
	dc.b	$25
	dc.b	$27
	dc.b	$29, $EB
	dc.b	$29, $E3
	dc.b	$27
	dc.b	$27
	dc.b	$29
	dc.b	$29
	dc.b	$2A
	dc.b	$29
	dc.b	$27, $E5
	dc.b	$25
	dc.b	$29, $E3
	dc.b	$27
	dc.b	$25
	dc.b	$27
	dc.b	$29, $E5
	dc.b	$27, $E3
	dc.b	$27
	dc.b	$29
	dc.b	$29
	dc.b	$2A
	dc.b	$2A
	dc.b	$29, $E5
	dc.b	$2B
	dc.b	$2C, $E3
	dc.b	$2B
	dc.b	$29
	dc.b	$2B
	dc.b	$2C
	dc.b	$2E
	dc.b	$30, $E5
	dc.b	$2C, $E3
	dc.b	$35
	dc.b	$36, $E1
	dc.b	$35
	dc.b	$33, $E3
	dc.b	$35
	dc.b	$31
	dc.b	$2E, $E1
	dc.b	$30
	dc.b	$31, $E3
	dc.b	$2C, $E1
	dc.b	$30
	dc.b	$31, $E3
	dc.b	$2A
	dc.b	$2C
	dc.b	$29
	dc.b	$2C
	dc.b	$31, $E5
	dc.b	$2C, $E3
	dc.b	$35
	dc.b	$36, $E1
	dc.b	$35
	dc.b	$33, $E3
	dc.b	$35
	dc.b	$31
	dc.b	$2E, $E1
	dc.b	$30
	dc.b	$31
	dc.b	$2E
	dc.b	$2C
	dc.b	$2E
	dc.b	$2C, $E3
	dc.b	$2A
	dc.b	$2C
	dc.b	$29
	dc.b	$2C
	CSP_Jump	BGM03_PLR00

BGM03_PLR03:
	dc.b	$00, $DF
	dc.b	$97, $02

BGM03_PLR02:
	dc.b	$2C, $E3
	dc.b	$29
	dc.b	$00
	dc.b	$29
	dc.b	$27, $E5
	dc.b	$2C, $E3
	dc.b	$25
	dc.b	$25, $E7
	dc.b	$27
	dc.b	$2C, $E3
	dc.b	$29
	dc.b	$00
	dc.b	$29
	dc.b	$27, $E5
	dc.b	$2C, $E3
	dc.b	$25
	dc.b	$22, $E5
	dc.b	$24
	dc.b	$25, $EB
	dc.b	$25, $E3
	dc.b	$24
	dc.b	$24
	dc.b	$25
	dc.b	$25
	dc.b	$27
	dc.b	$25
	dc.b	$24, $E5
	dc.b	$22
	dc.b	$25, $E3
	dc.b	$24
	dc.b	$22
	dc.b	$24
	dc.b	$25, $E5
	dc.b	$24, $E3
	dc.b	$24
	dc.b	$25
	dc.b	$25
	dc.b	$27
	dc.b	$27
	dc.b	$25, $E5
	dc.b	$27
	dc.b	$29, $E1
	dc.b	$27
	dc.b	$25
	dc.b	$27
	dc.b	$24, $E3
	dc.b	$25
	dc.b	$27, $E5
	dc.b	$29
	dc.b	$25, $E3
	dc.b	$2C
	dc.b	$2E, $E1
	dc.b	$2C
	dc.b	$2A, $E3
	dc.b	$2C
	dc.b	$29
	dc.b	$2A, $E1
	dc.b	$2C
	dc.b	$2E, $E3
	dc.b	$29
	dc.b	$2C, $E1
	dc.b	$2C
	dc.b	$25, $E3
	dc.b	$27
	dc.b	$20
	dc.b	$25
	dc.b	$29
	dc.b	$E5
	dc.b	$25
	dc.b	$E3
	dc.b	$2C
	dc.b	$2E
	dc.b	$E1
	dc.b	$2E
	dc.b	$2A
	dc.b	$E3
	dc.b	$2C
	dc.b	$29
	dc.b	$2A
	dc.b	$E1
	dc.b	$2C
	dc.b	$2E
	dc.b	$2A
	dc.b	$27
	dc.b	$E5
	dc.b	$25
	dc.b	$EB
	dc.b	$29
	dc.b	$E3
	CSP_Jump	BGM03_PLR02

BGM03_PLR04:
	dc.b	$19, $E5
	dc.b	$00, $E3
	dc.b	$19
	dc.b	$20
	dc.b	$E5
	dc.b	$1D
	dc.b	$1E
	dc.b	$1E
	dc.b	$20
	dc.b	$14
	dc.b	$19
	dc.b	$00
	dc.b	$E3
	dc.b	$19
	dc.b	$1E
	dc.b	$E5
	dc.b	$1D
	dc.b	$1B
	dc.b	$20
	dc.b	$25
	dc.b	$E3
	dc.b	$20
	dc.b	$19
	dc.b	$E5
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$12
	dc.b	$1E
	dc.b	$12
	dc.b	$20
	dc.b	$19
	dc.b	$19
	dc.b	$18
	dc.b	$19
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$1B
	dc.b	$27
	dc.b	$1B
	dc.b	$27
	dc.b	$20
	dc.b	$1B
	dc.b	$14
	dc.b	$E5
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$E3
	dc.b	$22
	dc.b	$25
	dc.b	$E5
	dc.b	$1E
	dc.b	$EA
	dc.b	$1E
	dc.b	$E1
	dc.b	$19
	dc.b	$EA
	dc.b	$19
	dc.b	$E1
	dc.b	$16
	dc.b	$E3
	dc.b	$18
	dc.b	$19
	dc.b	$E5
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$E3
	dc.b	$22
	dc.b	$25
	dc.b	$E5
	dc.b	$1E
	dc.b	$20
	dc.b	$19
	dc.b	$E3
	dc.b	$20
	dc.b	$25
	dc.b	$E5
	CSP_Jump	BGM03_PLR04