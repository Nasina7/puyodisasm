# Puyo Puyo 1 Sega Megadrive Disassembly
This is a work-in-progress disassembly of Puyo Puyo 1 for the Megadrive/Genesis    
Suggestions, pull requests, and the like are all welcome!    
## Disclaimer
Any and all content presented in this repository is presented for informational and educational purposes only.
Commercial usage is expressly prohibited.  I do not claim ownership of any code in this repository.
You assume any and all responsibility for using this content responsibility.  I do not claim any responsibility or warranty.
## Building (Windows)
Download the repo and run build.bat.  This will build the rom and place it in the repo at out/puyobuilt.bin
## Building (Linux)
Download the repo and run build.sh.  This will build the rom and place it in the repo at out/puyobuilt.bin
The build script currently requires wine.  You could run build.bat directly from wine instead, but using
build.sh will use a linux-native version of the art compression utility, which speeds up build times greatly
compared to using build.bat through wine.
