ipl.bin : ipl.nas Makefile
	../tolset_h/z_tools/nask.exe ipl.nas ipl.bin ipl.lst
	
helloos.img : ipl.bin Makefile
	../tolset_h/z_tools/edimg.exe imgin:../tolset_h/z_tools/fdimg0at.tek \
	wbinimg src:ipl.bin len:512 from:0 to:0 imgout:helloos.img
	
img:
	../tolset_h/z_tools/make.exe -r helloos.img
	
asm:
	../tolset_h/z_tools/make.exe -r ipl.bin
	
run:
	../tolset_h/z_tools/make.exe img
	copy helloos.img ..\tolset_h\z_tools\qemu\fdimage0.bin
	../tolset_h/z_tools/make.exe -C ../tolset_h/z_tools/qemu
	
install:
	../tolset_h/z_tools/make.exe img
	../tolset_h/z_tools/imgtol.exe a:helloos.img