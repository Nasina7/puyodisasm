@echo off
if exist baserom.md (
	fc /b baserom.md out\puyobuilt.bin
) else (
	echo This script needs a baserom.md in the root of the repo!
)