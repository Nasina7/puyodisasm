	include "sound/z80_macros.asm"
	include "sound/bank1/macros.asm"
	dc.b	$06
@channel00init:
	dc.b	$00
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$78
	dc.b	$00
	ptrZ80	@channel00start
	dc.b	$C0
	dc.b	$0B
@channel01init:
	dc.b	$01
	dc.b	$01
	dc.b	$17
	dc.b	$00
	dc.b	$08
	dc.b	$0C
	dc.b	$78
	dc.b	$01
	ptrZ80	@channel01start
	dc.b	$40
	dc.b	$0B
@channel02init:
	dc.b	$02
	dc.b	$01
	dc.b	$14
	dc.b	$08
	dc.b	$08
	dc.b	$18
	dc.b	$78
	dc.b	$02
	ptrZ80	@channel02start
	dc.b	$C0
	dc.b	$04
@channel03init:
	dc.b	$03
	dc.b	$01
	dc.b	$0F
	dc.b	$08
	dc.b	$08
	dc.b	$18
	dc.b	$78
	dc.b	$04
	ptrZ80	@channel03start
	dc.b	$80
	dc.b	$04
@channel04init:
	dc.b	$04
	dc.b	$01
	dc.b	$1B
	dc.b	$00
	dc.b	$00
	dc.b	$00
	dc.b	$78
	dc.b	$03
	ptrZ80	@channel04start
	dc.b	$C0
	dc.b	$09
@channel05init:
	dc.b	$05
	dc.b	$01
	dc.b	$18
	dc.b	$00
	dc.b	$08
	dc.b	$00
	dc.b	$78
	dc.b	$05
	ptrZ80	@channel05start
	dc.b	$C0
	dc.b	$09
@channel01start: ; Loc: 0049
	dc.b	$00
	dc.b	$E1
	MusCmd_SetMinorPitch $04
@channel00start: ; Loc: 004D
	dc.b	$2E
	dc.w	$E331
	dc.b	$36
	dc.w	$E135
	dc.b	$36
	dc.w	$E531
	dc.w	$E32E
	dc.b	$31
	dc.b	$2F
	dc.w	$E131
	dc.b	$33
	dc.w	$E333
	dc.b	$30
	dc.b	$31
	dc.w	$E033
	dc.b	$31
	dc.b	$31
	dc.w	$EB2E
	dc.w	$E331
	dc.b	$36
	dc.w	$E135
	dc.b	$36
	dc.w	$E531
	dc.w	$E32E
	dc.b	$31
	dc.b	$2F
	dc.w	$E12E
	dc.b	$2F
	dc.w	$E52A
	dc.w	$E32C
	dc.w	$E02E
	dc.b	$2C
	dc.b	$2C
	dc.w	$E52A
	dc.w	$E325
	dc.b	$2A
	dc.b	$29
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$29
	dc.b	$2A
	dc.b	$25
	dc.b	$2C
	dc.b	$2B
	dc.b	$2C
	dc.b	$2F
	dc.b	$2C
	dc.b	$2B
	dc.b	$2C
	dc.b	$2A
	dc.b	$27
	dc.b	$2F
	dc.w	$E12E
	dc.b	$2F
	dc.w	$E52E
	dc.w	$E32C
	dc.b	$2A
	dc.b	$29
	dc.b	$25
	dc.b	$2E
	dc.w	$E12C
	dc.b	$2E
	dc.w	$E531
	dc.w	$E333
	dc.b	$31
	dc.b	$2A
	dc.w	$E12F
	dc.b	$31
	dc.b	$2F
	dc.b	$33
	dc.b	$2F
	dc.b	$36
	dc.b	$2F
	dc.b	$2A
	dc.b	$2F
	dc.b	$31
	dc.b	$2F
	dc.b	$33
	dc.b	$2F
	dc.b	$36
	dc.b	$2F
	dc.b	$2A
	dc.b	$2E
	dc.b	$2F
	dc.b	$2E
	dc.b	$31
	dc.b	$2E
	dc.b	$36
	dc.b	$2E
	dc.b	$2A
	dc.b	$2E
	dc.b	$2F
	dc.b	$2E
	dc.b	$31
	dc.b	$2E
	dc.b	$36
	dc.b	$2E
	dc.b	$2C
	dc.b	$27
	dc.b	$2C
	dc.b	$2E
	dc.b	$30
	dc.b	$2C
	dc.b	$31
	dc.b	$2C
	dc.b	$33
	dc.b	$2C
	dc.b	$35
	dc.b	$2C
	dc.b	$36
	dc.b	$2C
	dc.b	$35
	dc.b	$2C
	dc.b	$31
	dc.b	$30
	dc.b	$31
	dc.b	$2C
	dc.b	$2A
	dc.b	$29
	dc.b	$27
	dc.b	$29
	dc.b	$25
	dc.w	$E329
	dc.b	$2C
	dc.b	$31
  MusCmd_Jump @channel00start
@channel03start: ; Loc: 00E8
	dc.b	$00
	dc.b	$E1
	MusCmd_SetMinorPitch $01
@channel02start: ; Loc: 00EC
	dc.b	$2A
	dc.w	$E927
	dc.w	$E729
	dc.b	$2A
	dc.w	$E927
	dc.w	$E729
	dc.w	$E02A
	dc.b	$29
	dc.b	$29
	dc.w	$E525
	dc.w	$E300
	dc.b	$22
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$31
	dc.b	$2E
	dc.b	$00
	dc.b	$20
	dc.b	$25
	dc.b	$29
	dc.b	$2C
	dc.b	$29
	dc.b	$31
	dc.b	$2C
	dc.b	$00
	dc.b	$1E
	dc.b	$23
	dc.b	$27
	dc.b	$2A
	dc.b	$27
	dc.b	$2F
	dc.b	$2A
	dc.b	$00
	dc.b	$1D
	dc.b	$22
	dc.b	$25
	dc.b	$29
	dc.b	$25
	dc.b	$2E
	dc.b	$29
	dc.b	$00
	dc.b	$1B
	dc.b	$1E
	dc.b	$23
	dc.b	$27
	dc.b	$23
	dc.b	$2A
	dc.b	$27
	dc.b	$00
	dc.b	$22
	dc.b	$25
	dc.b	$2A
	dc.b	$2E
	dc.b	$2A
	dc.b	$31
	dc.b	$2E
	dc.b	$00
	dc.b	$24
	dc.b	$27
	dc.b	$2C
	dc.b	$30
	dc.b	$2C
	dc.b	$33
	dc.b	$30
	dc.b	$00
	dc.b	$29
	dc.b	$2C
	dc.b	$31
	dc.b	$35
	dc.b	$31
	dc.b	$38
	dc.b	$35
  MusCmd_Jump @channel02start
@channel05start: ; Loc: 0140
	dc.b	$00
	dc.b	$E2
	MusCmd_SetMinorPitch $04
@channel04start: ; Loc: 0144
	dc.b	$1E
	dc.w	$E51E
	dc.b	$1E
	dc.b	$1E
	dc.b	$17
	dc.b	$17
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$17
	dc.b	$17
	dc.b	$19
	dc.b	$19
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1E
	dc.b	$1D
	dc.b	$1D
	dc.b	$1D
	dc.b	$1D
	dc.b	$1B
	dc.b	$1B
	dc.b	$1B
	dc.b	$1B
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$17
	dc.b	$17
	dc.b	$17
	dc.b	$17
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$12
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$14
	dc.b	$19
	dc.b	$19
	dc.b	$19
	dc.b	$19
  MusCmd_Jump @channel04start
