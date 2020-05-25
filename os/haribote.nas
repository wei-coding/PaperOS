;paper-os
;TAB = 4
	org 0xc200
	
	mov al,0x13		;VGA圖形、320*200*8bit彩色
	mov ah,0x00
	int 0x10
	
fin:
	hlt
	jmp fin