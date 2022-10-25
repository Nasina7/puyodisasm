// Flex 2 Mapping Definition - Sonic 1

const {
    mappings,
    dplcs,
    offsetTable,
    write,
    read,
    dc,
    nybble,
    endFrame,
    skipFrame,
    signed,
} = Flex2;

mappings([
    offsetTable(dc.l),
    [
        () => {
            const quantity = read(dc.w);
            return quantity > 0 && (({ mapping }, i) => {
				
                mapping.top = read(dc.w, signed);
				read(nybble);
                mapping.width = read(2) + 1;
                mapping.height = read(2) + 1;
				mapping.link = read(dc.b);
				
                mapping.priority = read(1);
				mapping.palette = read(2);
				mapping.vflip = read(1);
				mapping.hflip = read(1);
				mapping.art = read(11) - 0x400;
                mapping.left = read(dc.w, signed);
				
                if (i === quantity - 1) return endFrame;
            });
        },
        ({ sprite }) => {
            write(dc.b, sprite.length);
            return ({ mapping }) => {
                write(dc.b, mapping.top);
                write(nybble, 0);
                write(2, mapping.width - 1);
                write(2, mapping.height - 1);
                write(1, mapping.priority);
                write(2, mapping.palette);
                write(1, mapping.vflip);
                write(1, mapping.hflip);
                write(11, mapping.art);
                write(dc.b, mapping.left);
            };
        },
    ],
]);


