@echo off

echo Building puyo.asm...
tools\windows\axm68k.exe /p puyo.asm,out\puyobuilt_temp.bin > out\puyo.log
if not exist out\puyobuilt_temp.bin (
	echo Failed to build puyo.asm!  See out\puyo.log for more details.
	exit /B 2
) else (
	echo Successfully built puyo.asm!  The ROM is stored at out\puyobuilt.bin
)
if exist out\puyobuilt_prev.bin del out\puyobuilt_prev.bin
if exist out\puyobuilt.bin rename out\puyobuilt.bin puyobuilt_prev.bin
if exist out\puyobuilt_temp.bin rename out\puyobuilt_temp.bin puyobuilt.bin
