@echo off

echo Cleaning any previous builds...
if not exist out\ mkdir out


echo Building BG Mappings...
cd art/bgMappings/
CALL buildMappings.bat
cd ..
cd ..

echo Building puyo.asm...
tools\axm68k.exe /p puyo.asm,out\puyobuilt_temp.bin > out\puyo.log
if not exist out\puyobuilt_temp.bin (
	echo Failed to build puyo.asm!  See out\puyo.log for more details.
	exit /B 2
)
if exist out\puyobuilt_prev.bin del out\puyobuilt_prev.bin
if exist out\puyobuilt.bin rename out\puyobuilt.bin puyobuilt_prev.bin
if exist out\puyobuilt_temp.bin rename out\puyobuilt_temp.bin puyobuilt.bin
tools\fixheader.exe out\puyobuilt.bin

echo Success!  The ROM is stored at out\puyobuilt.bin