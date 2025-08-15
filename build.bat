@echo off
setlocal enabledelayedexpansion

if not exist build_cache\ (
    echo "build_cache" folder not found, it will be created.
)

if not exist out\ (
    echo "out" folder not found, it will be created.
    mkdir out
)

echo Compressing all puyo compressed data in art/art...
for /r "art\art" %%f in (*.puyo) do (
    set "p=%%f"
    tools\windows\puyomdtool.exe ifnewer compress "%%f" "build_cache\!p:%~dp0=!"
)

echo Converting all background mappings to their correct formats...
for /r "art\bg_mappings" %%f in (*.bgbyte) do (
    set "p=%%f"
    tools\windows\puyomdtool.exe ifnewer convertwordin 0 "%%f" "build_cache\!p:%~dp0=!"
)
for /r "art\bg_mappings" %%f in (*.bgpalm) do (
    set "p=%%f"
    tools\windows\puyomdtool.exe ifnewer convertwordin 0 "%%f" "build_cache\!p:%~dp0=!"
)
for /r "art\bg_mappings" %%f in (*.bgword) do (
    set "p=%%f"
    tools\windows\puyomdtool.exe ifnewer convertwordin 0 "%%f" "build_cache\!p:%~dp0=!"
)

echo Building puyo.asm...
tools\windows\clownassembler_asm68k.exe /p puyo.asm,out\puyobuilt_temp.bin > out\puyo.log

if not exist out\puyobuilt_temp.bin (
    echo Failed to build puyo.asm! See out\puyo.log for more details.
) else (
    if exist out\puyobuilt_prev.bin del out\puyobuilt_prev.bin
    if exist out\puyobuilt.bin rename out\puyobuilt.bin puyobuilt_prev.bin
    rename out\puyobuilt_temp.bin puyobuilt.bin
    tools\windows\puyomdtool.exe fix out\puyobuilt.bin
    echo Successfully built puyo.asm! The ROM is stored at out\puyobuilt.bin
)
