/*PROTOTYPE*/
void io_hlt(void);
void write_mem8(int addr,int data);

void HariMain(void){
	int i;
	char *p; //address to BYTE[...]
	for(i = 0xa0000 ; i <= 0xaffff ; i++){
		p = (char *)i;
		*p = i & 0x0f;
		//substitude by upper expr//write_mem8(i,i & 0x0f);//equals to i mod (0f+1)
	}
	while(1){
		io_hlt();
	}
}
