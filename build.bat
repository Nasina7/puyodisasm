@echo off
setlocal enabledelayedexpansion

if not exist build_cache\ (
    echo \"build_cache\" folder not found, it will be created.
)

if not exist out\ (
    echo \"out\" folder not found, it will be created.
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


call tools\windows\build_rom.bat

if exist out\puyobuilt.bin tools\windows\puyomdtool.exe fix out\puyobuilt.bin
