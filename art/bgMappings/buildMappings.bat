@echo off
robocopy SonPLN puyo /s /e > nul
for /r ./puyo %%f in (*.bin) do (
	..\..\tools\puyoMappingConverter.exe -p "%%f" "%%f" 
)
robocopy puyo16 puyo /s /e > nul
robocopy puyofix puyo /s /e > nul