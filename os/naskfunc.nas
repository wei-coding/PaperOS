;naskfunc
;TAB = 4

[FORMAT "WCOFF"]		;mode of making object code
[BITS 32]				;32-bits machine code
[INSTRSET "i486p"]		;486 instruction set

;for object code info

[FILE "naskfunc.nas"]	;original file name

	GLOBAL _io_hlt,_io_cli,_io_sti,_io_stihlt
	GLOBAL _io_in8,_io_in16,_io_in32
	GLOBAL _io_out8,_io_out16,_io_out32
	GLOBAL _io_load_eflags,_io_store_eflags 

;function entry

[SECTION .text]

_io_hlt:				;void io_hlt(void)
	HLT
	RET
_io_cli:				;void io_cli(void)
	CLI
	RET
_io_sti:				;void io_sti(void)
	STI
	RET
_io_stihlt:				;void io_stihlt(void)
	STI
	HLT
	RET
_io_in8:				;int io_in8(int port)
	mov edx,[esp+4]		;port
	mov eax,0
	in al,dx
	RET
_io_in16:				;int io_in16(int port)
	mov edx,[esp+4]		;port
	mov eax,0
	in ax,dx
	RET
_io_in32:				;int io_in32(int port)
	mov edx,[esp+4]		;port
	mov eax,0
	in eax,dx
	RET
_io_out8:				;void io_out8(int port,int data)
	mov edx,[esp+4]
	mov al,[esp+8]
	out dx,al
_io_out16:				;void io_out(int port,int data)
	mov edx,[esp+4]
	mov ax,[esp+8]
	out dx,al
_io_out32:				;void io_out(int port,int data)
	mov edx,[esp+4]
	mov eax,[esp+8]
	out dx,al
_io_load_eflags:		;int io_load_eflags()
	PUSHFD
	POP eax
	RET
_io_store_eflags:		;void io_store_eflags(int eflags)
	mov eax,[esp+4]
	PUSH eax
	POPFD
	RET