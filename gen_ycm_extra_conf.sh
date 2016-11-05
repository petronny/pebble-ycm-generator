#!/bin/sh
MAKEFILE="makefile.ycm"
rm -f .ycm_extra_conf.py
pebble clean 1>/dev/null 2>&1
echo 'all:' > $MAKEFILE
pebble build -v 2>&1 | grep runner >> $MAKEFILE
sed \
	-e 's/\[//g' \
	-e 's/\]//g' \
	-e "s/[']//g" \
	-e "s/, / /g" \
	-e 's/^.*runner/\tcd build;/g' \
	-e 's/-D__FILE_NAME__="\([^"]*\)"/-D__FILE_NAME__=\\"\1\\"/g' \
	-e 's/arm-none-eabi-gcc/$(CC)/g' \
	-i $MAKEFILE
CC=arm-none-eabi-gcc make -f $MAKEFILE
CC=arm-none-eabi-gcc ycm_generator -b make -M="-f $MAKEFILE" .
sed \
	-e '/-D__FILE_NAME__/d' \
	-e '/-DPBL_DISPLAY_WIDTH/d' \
	-e '/-DPBL_DISPLAY_HEIGHT/d' \
	-i .ycm_extra_conf.py
rm $MAKEFILE
