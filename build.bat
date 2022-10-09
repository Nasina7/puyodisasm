@echo off
del puyobuilt_prev.bin
rename puyobuilt.bin puyobuilt_prev.bin
tools\asm68k.exe /p puyo.asm,puyobuilt.bin
tools\fixChecksum.exe puyobuilt.bin
