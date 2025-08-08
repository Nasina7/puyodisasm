if ! [ -d "./build_cache" ]; then
   echo \"build_cache\" folder not found, it will be created.
fi

if ! [ -d "./out" ]; then
   echo \"out\" folder not found, It will be created.
   mkdir out
fi

echo Compressing all puyo compressed data in art/art...
find art/art -type f -name "*.puyo" -exec tools/linux/puyomdtool ifnewer compress {} build_cache/{} \;

wine tools/windows/build_rom.bat

if [ -f out/puyobuilt.bin ]; then
   tools/linux/puyomdtool fix out/puyobuilt.bin
fi
