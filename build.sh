if ! [ -d "./build_cache" ]; then
   echo \"build_cache\" folder not found, it will be created.
   # puyomdtool creates output directories if they don't exist, so we don't need to do anything.
fi

if ! [ -d "./out" ]; then
   echo \"out\" folder not found, It will be created.
   mkdir out
fi

echo Compressing all puyo compressed data in art/art...
find art/art -type f -name "*.puyo" -exec tools/linux/puyomdtool ifnewer compress {} build_cache/{} \;

echo Converting all background mappings to their correct formats...
find art/bg_mappings -type f -name "*.bgbyte" -exec tools/linux/puyomdtool ifnewer convertwordin 0 {} build_cache/{} \;
find art/bg_mappings -type f -name "*.bgpalm" -exec tools/linux/puyomdtool ifnewer convertwordin 0 {} build_cache/{} \;
find art/bg_mappings -type f -name "*.bgword" -exec tools/linux/puyomdtool ifnewer convertwordin 0 {} build_cache/{} \;

echo Building puyo.asm...
tools/linux/clownassembler_asm68k /p puyo.asm,out/puyobuilt_temp.bin >out/puyo.log

if ! [ -f out/puyobuilt_temp.bin ]; then
   echo Failed to build puyo.asm! See out/puyo.log for more details.
else
   if [ -f out/puyobuilt_prev.bin ]; then rm out/puyobuilt_prev.bin; fi
   if [ -f out/puyobuilt.bin ]; then mv out/puyobuilt.bin out/puyobuilt_prev.bin; fi
   mv out/puyobuilt_temp.bin out/puyobuilt.bin
   tools/linux/puyomdtool fix out/puyobuilt.bin
   echo Successfully built puyo.asm! The ROM is stored at out/puyobuilt.bin
fi
