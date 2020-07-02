;paper-os
;TAB = 4

;BOOT_INFO
	CYLS EQU 0x0ff0		;setup boot section
	LEDS EQU 0x0ff1
	VMODE EQU 0x0ff2	;color related info, which represents bytes colors would use
	SCRNX EQU 0x0ff4	;X direction screen resolution
	SCRNY EQU 0x0ff6	;Y direction screen resolution
	VRAM EQU 0x0ff8		;Graphic buffer starting address
	
	org 0xc200
	
	mov al,0x13			;VGA圖形、320*200*8bit彩色
	mov ah,0x00
	int 0x10
	mov byte [VMODE],8	;record screens mode
	mov word [SCRNX],320
	mov word [SCRNY],200
	mov dword [VRAM],0x000a0000
	
; tell leds status by bios
	
	mov ah,0x12
	int 0x16			;keyboard bios
	mov [LEDS],al
fin:
	hlt
	jmp fin