echo --- The files in art/compressed will be compressed and decompressed during 
echo --- the build process.  Do not modify any files in that folder until the 
echo --- build process is complete. 

echo Cleaning any previous builds...
if ! [ -d "./out" ]; then
   echo \"out\" folder not found.  It will be created.
   mkdir out
fi

echo Compressing all data in art/compressed...
find art/compressed -type f -exec tools/linux/puyocomp -c {} \;

wine tools/windows/build_rom.bat

echo Decompressing all data in art/compressed...
find art/compressed -type f -exec tools/linux/puyocomp -d {} \;