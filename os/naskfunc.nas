;naskfunc
;TAB = 4

[FORMAT "WCOFF"]		;mode of making object code
[BITS 32]				;32-bits machine code
[INSTRSET "i486p"]		;486 instruction set

;for object code info

[FILE "naskfunc.nas"]	;original file name

	GLOBAL _io_hlt,_write_mem8	;function name

;function entry

[SECTION .text]

_io_hlt:				;void io_hlt(void)
	HLT
	RET
	
_write_mem8:			;void write_mem8(int addr,int data)
	mov ecx,[esp+4]		;addr is in [esp+4]
	mov al,[esp+8]		;data is in [esp+8]
	mov [ecx],al
	ret
