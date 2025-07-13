	include "sound/z80_macros.asm"

;	BGM 0C - Memories of Puyo Puyo
BGM0C_Header:
	dc.b	$07	; This uses PSG?!

BGM0C_PLR00_Init:
	dc.b	$00
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$6B
	dc.b	$00
	ptrZ80	BGM0C_PLR00
	dc.b	panCentre
	dc.b	$07

BGM0C_PLR01_Init:
	dc.b	$01
	dc.b	$01
	dc.b	$16
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$6B
	dc.b	$04
	ptrZ80	BGM0C_PLR01
	dc.b	panCentre
	dc.b	$07

BGM0C_PLR02_Init:
	dc.b	$02
	dc.b	$01
	dc.b	$19
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$6B
	dc.b	$03
	ptrZ80	BGM0C_PLR02
	dc.b	panLeft
	dc.b	$01

BGM0C_PLR03_Init:
	dc.b	$03
	dc.b	$01
	dc.b	$13
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$6B
	dc.b	$05
	ptrZ80	BGM0C_PLR03
	dc.b	panRight
	dc.b	$01

BGM0C_PLR04_Init:
	dc.b	$04
	dc.b	$01
	dc.b	$18
	dc.b	$00
	dc.b	$00
	dc.b	$0C
	dc.b	$6B
	dc.b	$02
	ptrZ80	BGM0C_PLR04
	dc.b	panCentre
	dc.b	$1A

BGM0C_PLR05_Init:
	dc.b	$05
	dc.b	$01
	dc.b	$1E
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$6B
	dc.b	$01
	ptrZ80	BGM0C_PLR05
	dc.b	panCentre
	dc.b	$01

BGM0C_PLR06_Init:
	dc.b	$06
	dc.b	$02
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$58
	dc.b	$6B
	dc.b	$02
	ptrZ80	BGM0C_PLR06
	dc.b	panCentre
	dc.b	$00

BGM0C_PLR06:
	dc.b	$8E, $07
	dc.b	$88, $1B
	dc.b	$25, $E1
	dc.b	$25
	dc.b	$88, $1A
	dc.b	$25, $E3
	CSP_Jump	BGM0C_PLR06

BGM0C_PLR01:
	dc.b	$00, $E3
	dc.b	$97, $04

BGM0C_PLR00:
	CSP_LoopSet	$11, $02
BGM0C_Loop00:
	CSP_LoopSet	$10, $02
BGM0C_Loop01:
	dc.b	$8B
	dc.b	$09
	dc.b	$31
	dc.b	$E9
	dc.b	$33
	dc.b	$35
	dc.b	$EE
	dc.b	$33
	dc.b	$E1
	dc.b	$35
	dc.b	$33
	dc.b	$E9
	CSP_LoopBack	$10, BGM0C_Loop01
	dc.b	$8B
	dc.b	$07
	dc.b	$31
	dc.b	$EA
	dc.b	$30
	dc.b	$29
	dc.b	$E9
	dc.b	$29
	dc.b	$E1
	dc.b	$29
	dc.b	$31
	dc.b	$E3
	dc.b	$31
	dc.b	$30
	dc.b	$2C
	dc.b	$2E
	dc.b	$EB
	dc.b	$27
	dc.b	$E1
	dc.b	$27
	dc.b	$DE
	dc.b	$15
	dc.b	$2C
	dc.b	$E1
	dc.b	$2E
	dc.b	$2C
	dc.b	$EA
	dc.b	$29
	dc.b	$27
	dc.b	$EC
	dc.b	$31
	dc.b	$EA
	dc.b	$30
	dc.b	$29
	dc.b	$E9
	dc.b	$29
	dc.b	$E1
	dc.b	$29
	dc.b	$31
	dc.b	$E3
	dc.b	$31
	dc.b	$30
	dc.b	$2C
	dc.b	$2E
	dc.b	$EE
	dc.b	$30
	dc.b	$E1
	dc.b	$31
	dc.b	$30
	dc.b	$EA
	dc.b	$2C
	dc.b	$33
	dc.b	$E5
	dc.b	$33
	dc.b	$E3
	dc.b	$31
	dc.b	$30
	dc.b	$2E
	dc.b	$EB
	dc.b	$31
	dc.b	$35
	dc.b	$E5
	dc.b	$33
	dc.b	$EA
	dc.b	$30
	dc.b	$2C
	dc.b	$EB
	dc.b	$33
	dc.b	$E5
	dc.b	$31
	dc.b	$EB
	dc.b	$2E
	dc.b	$E3
	dc.b	$35
	dc.b	$35
	dc.b	$33
	dc.b	$31
	dc.b	$33
	dc.b	$E7
	dc.b	$31
	dc.b	$E5
	dc.b	$30
	dc.b	$2E
	dc.b	$EB
	dc.b	$31
	dc.b	$35
	dc.b	$E5
	dc.b	$33
	dc.b	$EA
	dc.b	$30
	dc.b	$2C
	dc.b	$EB
	dc.b	$33
	dc.b	$E5
	dc.b	$31
	dc.b	$EB
	dc.b	$2E
	dc.b	$E3
	dc.b	$35
	dc.b	$35
	dc.b	$33
	dc.b	$31
	dc.b	$33
	dc.b	$E7
	dc.b	$38
	dc.b	$E5
	dc.b	$36
	CSP_LoopBack	$11, BGM0C_Loop00

	CSP_LoopSet	$10, $02
BGM0C_Loop02:
	CSP_LoopSet	$11, $03
BGM0C_Loop03:
	dc.b	$00
	dc.b	$E3
	dc.b	$30
	dc.b	$31
	dc.b	$38
	dc.b	$30
	dc.b	$31
	dc.b	$38
	dc.b	$33
	dc.b	$00
	dc.b	$31
	dc.b	$EE
	CSP_LoopBack	$11, BGM0C_Loop03
	dc.b	$33
	dc.b	$EC
	dc.b	$2C
	dc.b	$E3
	dc.b	$30
	dc.b	$33
	dc.b	$E5
	dc.b	$2A
	dc.b	$E1
	dc.b	$2F
	dc.b	$33
	dc.b	$36
	dc.b	$3B
	dc.b	$EC
	CSP_LoopBack	$10, BGM0C_Loop02
	CSP_Jump	BGM0C_PLR00

BGM0C_PLR03:
	dc.b	$00, $E3
	dc.b	$97, $04

BGM0C_PLR02:
	CSP_LoopSet	$10, $02
BGM0C_Loop04:
	CSP_LoopSet	$11, $04
BGM0C_Loop05:
	dc.b	$88
	dc.b	$00
	dc.b	$8B
	dc.b	$09
	dc.b	$2E
	dc.b	$E9
	dc.b	$30
	dc.b	$31
	dc.b	$EE
	dc.b	$30
	dc.b	$E1
	dc.b	$31
	dc.b	$30
	dc.b	$E9
	CSP_LoopBack	$11, BGM0C_Loop05
	dc.b	$8B
	dc.b	$0C
	dc.b	$88
	dc.b	$04
	dc.b	$2E
	dc.b	$E1
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$33
	dc.b	$3F
	dc.b	$33
	dc.b	$33
	dc.b	$33
	dc.b	$3F
	dc.b	$33
	dc.b	$33
	dc.b	$33
	dc.b	$3F
	dc.b	$33
	dc.b	$33
	dc.b	$33
	dc.b	$3F
	dc.b	$33
	dc.b	$33
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$2E
	dc.b	$3A
	dc.b	$2E
	dc.b	$2E
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$30
	dc.b	$3C
	dc.b	$30
	dc.b	$30
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$31
	dc.b	$3D
	dc.b	$31
	dc.b	$31
	dc.b	$88
	dc.b	$00
	dc.b	$33
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	dc.b	$31
	dc.b	$33
	dc.b	$35
	dc.b	$36
	dc.b	$38
	dc.b	$33
	dc.b	$35
	dc.b	$36
	dc.b	$38
	dc.b	$3A
	dc.b	$3C
	dc.b	$3D
	CSP_LoopBack	$10, BGM0C_Loop04
	dc.b	$89
	dc.b	$0C

	CSP_LoopSet	$10, $02
BGM0C_Loop06:
	CSP_LoopSet	$11, $02
BGM0C_Loop07:
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$24
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	CSP_LoopBack	$11, BGM0C_Loop07
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$29
	dc.b	$24
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$25
	dc.b	$E1
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$31
	dc.b	$25
	dc.b	$2A
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$33
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$33
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$33
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$33
	dc.b	$2A
	dc.b	$2F
	dc.b	$33
	dc.b	$36
	dc.b	$2A
	dc.b	$2F
	dc.b	$33
	dc.b	$36
	dc.b	$2F
	dc.b	$2A
	dc.b	$33
	dc.b	$2F
	dc.b	$36
	dc.b	$33
	dc.b	$36
	dc.b	$3B
	CSP_LoopBack	$10, BGM0C_Loop06
	dc.b	$89, $F4
	CSP_Jump	BGM0C_PLR02

BGM0C_PLR05:
	CSP_LoopSet	$10, $02
BGM0C_Loop08:
	CSP_LoopSet	$11, $07
BGM0C_Loop09:
	dc.b	$C0
	dc.b	$E5
	dc.b	$C1
	CSP_LoopBack	$11, BGM0C_Loop09
	dc.b	$C0
	dc.b	$E5
	dc.b	$C1
	dc.b	$E3
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1

	CSP_LoopSet	$11, $06
BGM0C_Loop0A:
	dc.b	$C0
	dc.b	$E5
	dc.b	$C1
	CSP_LoopBack	$11, BGM0C_Loop0A
	dc.b	$C1
	dc.b	$E1
	dc.b	$C8
	dc.b	$C1
	dc.b	$C8
	dc.b	$C1
	dc.b	$C1
	dc.b	$C8
	dc.b	$CA
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$CA
	dc.b	$E3
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C1

	CSP_LoopSet	$11, $1F
BGM0C_Loop0B:
	dc.b	$C0
	dc.b	$E5
	dc.b	$C1
	CSP_LoopBack	$11, BGM0C_Loop0B
	dc.b	$C0
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_LoopBack	$10, BGM0C_Loop08

	CSP_LoopSet	$10, $02
BGM0C_Loop0C:
	dc.b	$C0
	dc.b	$EE
	dc.b	$C0
	dc.b	$E5
	dc.b	$C0
	dc.b	$EC
	dc.b	$C1
	dc.b	$E3
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C0
	dc.b	$EE
	dc.b	$C0
	dc.b	$E5
	dc.b	$C0
	dc.b	$EC
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C0
	dc.b	$EE
	dc.b	$C0
	dc.b	$E5
	dc.b	$C0
	dc.b	$EC
	dc.b	$C1
	dc.b	$E3
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C0
	dc.b	$E5
	dc.b	$C1
	dc.b	$C0
	dc.b	$C1
	dc.b	$C0
	dc.b	$C1
	dc.b	$C0
	dc.b	$C1
	dc.b	$E1
	dc.b	$C1
	dc.b	$C1
	dc.b	$C1
	CSP_LoopBack	$10, BGM0C_Loop0C
	CSP_Jump	BGM0C_PLR05

BGM0C_PLR04:
	CSP_LoopSet	$11, $02
BGM0C_Loop0D:
	CSP_LoopSet	$10, $04
BGM0C_Loop0E:
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$16
	dc.b	$E3
	dc.b	$22
	dc.b	$E1
	dc.b	$22
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	CSP_LoopBack	$10, BGM0C_Loop0E

	CSP_LoopSet	$10, $04
BGM0C_Loop0F:
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$12
	dc.b	$E3
	dc.b	$1E
	dc.b	$E1
	dc.b	$1E
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$E1
	dc.b	$20
	CSP_LoopBack	$10, BGM0C_Loop0F
	CSP_LoopBack	$11, BGM0C_Loop0D

	CSP_LoopSet	$11, $02
BGM0C_Loop10:
	CSP_LoopSet	$10, $03
BGM0C_Loop11:
	dc.b	$16
	dc.b	$ED
	dc.b	$00
	dc.b	$E3
	dc.b	$14
	dc.b	$00
	dc.b	$12
	dc.b	$EE
	CSP_LoopBack	$10, BGM0C_Loop11

	dc.b	$14
	dc.b	$E3
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$14
	dc.b	$20
	dc.b	$17
	dc.b	$23
	dc.b	$17
	dc.b	$23
	dc.b	$17
	dc.b	$23
	dc.b	$17
	dc.b	$23
	CSP_LoopBack	$11, BGM0C_Loop10
	CSP_Jump	BGM0C_PLR04