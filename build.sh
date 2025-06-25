echo --- The files in art/compressed will be compressed and decompressed during 
echo --- the build process.  Do not modify any files in that folder until the 
echo --- build process is complete. 

echo Cleaning any previous builds...
if ! [ -d "./out" ]; then
   echo \"out\" folder not found.  It will be created.
   mkdir out
fi

echo Compressing all puyo compressed data in art/art...
find art/art -type f -name "*.puyo" -exec tools/linux/puyomdtool compress {} \;

wine tools/windows/build_rom.bat

if [ -f out/puyobuilt.bin ]; then
   tools/linux/puyomdtool fix out/puyobuilt.bin
fi

echo Decompressing all puyo compressed data in art/art...
find art/art -type f -name "*.puyo" -exec tools/linux/puyomdtool decompress {} \;
