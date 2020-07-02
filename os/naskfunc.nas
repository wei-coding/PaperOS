;naskfunc
;TAB = 4

[FORMAT "WCOFF"]		;mode of making object code
[BITS 32]				;32-bits machine code

;for object code info

[FILE "naskfunc.nas"]	;original file name

	GLOBAL _io_hlt		;function name
	
;function entry

[SECTION .text]

_io_hlt:				;void io_hlt(void)
	HLT
	RET
