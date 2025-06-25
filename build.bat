@echo off

echo --- The files in art/compressed will be compressed and decompressed during 
echo --- the build process.  Do not modify any files in that folder until the 
echo --- build process is complete. 

echo Cleaning any previous builds...
if not exist out\ mkdir out

echo Compressing all puyo compressed data in art/art...
for /r "art\art" %%f in (*.puyo) do (
    tools\windows\puyomdtool.exe compress "%%f"
)

call tools\windows\build_rom.bat

if exist out\puyobuilt.bin tools\windows\puyomdtool.exe fix out\puyobuilt.bin

echo Decompressing all puyo compressed data in art/art...
for /r "art\art" %%f in (*.puyo) do (
    tools\windows\puyomdtool.exe decompress "%%f"
)
