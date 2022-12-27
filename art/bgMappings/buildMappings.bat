@echo off
if not exist puyo\ mkdir puyo
for %%f in (SonPLN\*) do (
	..\..\tools\puyoMappingConverter.exe -p SonPLN\%%~nxf puyo\%%~nxf 
)
for %%f in (SonPLN16\*) do (
	copy SonPLN16\%%~nxf puyo\%%~nxf >nul
)