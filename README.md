# Puyo Puyo 1 Megadrive/Genesis Disassembly
This is a WIP Disassembly of Puyo Puyo 1 for the Megadrive/Genesis    
I'm still quite new to game disassembly so suggestions, pull requests, and the like are all welcome!    
## Disclaimer
Any and all content presented in this repository is presented for informational and educational purposes only.
Commercial usage is expressly prohibited.  I do not claim ownership of any code in this repository.
You assume any and all responsibility for using this content responsibility.  I do not claim any responsibility or warranty.
## Building
Download the Repo and run build.bat.  This will build the rom and place it in the repo as puyobuilt.bin
## Todo (In order of priority):
- [x] Make the Game Shiftable
	- Note: All *known* shiftability issues are fixed.  If you encounter any, please open an issue and let me know.
- [ ] Fix all instances of "BAD CODE" segments (segments of code that weren't disassembled, and are potentially unused?)
- [ ] Fix all instances of "MISSING POINTER"
- [x] Split art data into binary files (it will stay compressed for now)
- [ ] Document split art data
- [ ] Find where Palettes, Mappings, etc... are located, and split them into files
- [ ] Reverse Engineer the art compression format and make tools for it
- [ ] Convert compressed art to uncompressed in the repo for use with existing tools, and compress it on build time.
- [ ] Document a lot of Game Code.
- [ ] Decompile and Document the Sound Driver.
## Stretch Goals:
- Allow building the Arcade (Japan) Release
- Allow building the Arcade (World) Release
- Allow building the Sharp X68000 Release