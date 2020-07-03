/*PROTOTYPE*/
void io_hlt(void);
void write_mem8(int addr,int data);

void HariMain(void){
	int i;
	char *p; //address to BYTE[...]
	p = (char *) 0xa0000;
	for(i = 0 ; i <= 0xaffff ; i++){
		//*(p+i) = i & 0x0f;
		//or in this way
		p[i] = i & 0x0f;
		//equals to i mod (0f+1)
	}
	while(1){
		io_hlt();
	}
}
