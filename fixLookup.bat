cd tools
cd lookupTableFixer
del lookup.bin
asm68k.exe /p lookup.asm,lookup.bin
lookupTableFixer lookup.bin %1
cd ..
cd ..
