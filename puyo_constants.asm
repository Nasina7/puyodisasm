
Z80Ram =     $A00000
Z80BusReq =  $A11100
Z80Reset =   $A11200
padData1 = $A10003
padData2 = $A10005
padData3 = $A10007
padControl1 = $A10009
padControl2 = $A1000B
padControl3 = $A1000D

vdpData1 = $C00000
vdpData2 = $C00002
vdpControl1 = $C00004
vdpControl2 = $C00006


BC_programCounter = $00FF0A36 ; Long
BC_returnState = $00FF0A3A ; Byte
BC_stopRunning = $00FF0A3B ; Byte
BC_stopBytecodeLoop = $00FF0A3C ; Byte

debug_CpuPlayer = $00FF1876 ; Byte
debug_puyoDrop = $00FF1877 ; Byte
debug_skipStages = $00FF1878 ; Byte
debug_unknown = $00FF1879 ; Byte

SystemStack = $00FFFC00



; Non-Ram Related Constants
arle_AnimIdle = 0
arle_AnimIdleTalk = 1
arle_AnimAngerTalk = 2
arle_AnimSurprise = 3
arle_AnimCurious = 4
arle_AnimCuriousTalk = 5
arle_AnimCuriousIdle = 6
arle_AnimCuriousAnger = 7
arle_AnimCuriousAngerTalk = 8
arle_AnimStance = 9
arle_AnimStanceTalk = $A
arle_AnimStanceIdle = $B
arle_AnimCuriousEmbarrassedBlush = $C
arle_AnimCuriousEmbarrassed = $D
arle_AnimStancePoint = $E
arle_AnimStanceHalt = $F
arle_AnimStancePointTalk = $10
arle_AnimStancePointNoIntro = $11
arle_AnimStanceHaltTalk = $12
arle_AnimStanceHaltNoIntro = $13
arle_AnimStancePointEmbarrass = $14
arle_AnimIdleAnger = $15


draco_AnimIdle = 0
draco_AnimIdleTalk = 1
draco_AnimGloatTalk = 2
draco_AnimPointUp = 3
draco_AnimAnger = 4
