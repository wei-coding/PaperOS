;hello-os
;TAB = 4

org 0x7c00

jmp entry
DB 0x90
DB "HELLOIPL"		;開機磁區名稱
DW 512				;磁區大小
DB 1				;叢集大小
DW 1				;FAT開始磁區
DB 2				;FAT個數
DW 224				;根目錄範圍大小
DW 2880				;磁碟機大小
DB 0xf0				;媒體格式
DW 9				;FAT區域範圍長度
DW 18				;一磁軌的磁區數
DW 2				;詞頭個數
DD 0				;不使用磁碟分割
DD 2880				;磁碟機大小
DB 0,0,0x29
DD 0xffffffff		;磁碟區序號
DB "HELLO-OS   "	;磁碟片名稱
DB "FAT12   "		;格式名稱
RESB 18				;空出18個bytes

;程式碼本身

entry:
		mov ax,0
		mov ss,ax
		mov sp,0x7c00
		mov ds,ax
		
		mov ax,0x0820
		mov es,ax
		mov ch,0		;磁柱0
		mov dh,0		;磁頭0
		mov cl,2		;磁區2
		
		mov si,0		;計數器
		
;重複嘗試讀入磁碟片5次
retry:
		mov ah,0x02		;讀入磁碟片
		mov al,1		;磁區1
		mov bx,0
		mov dl,0x00		;A磁碟機
		int 0x13		;call BIOS
		jnc fin			;出現錯誤跳fin
		inc si
		cmp si,5
		jae error		;超過5次就跳error
		mov ah,0x00
		mov dl,0x00		;磁碟機重設
		int 0x13		;call BIOS 
		jmp retry
fin:
		hlt
		jmp fin		
		
error:
		mov si,msg
		
putloop:
		mov al,[si]
		inc si
		cmp al,0
		je fin
		mov ah,0x0e
		mov bx,15
		int 0x10			;呼叫視訊BIOS
		jmp putloop
		
msg:
		DB 0x0a,0x0a		;兩個換行
		DB "load error"
		DB 0x0a
		DB 0
		
RESB 0x7dfe-$

DB 0x55,0xaa