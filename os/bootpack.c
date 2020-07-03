/*PROTOTYPE*/
void io_hlt(void);
void write_mem8(int addr,int data);
void io_cli(void);
void io_out8(int port, int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void init_palette(void);
void set_palette(int start,int end,unsigned char *rgb);

void HariMain(void){
	int i;
	char *p; //address to BYTE[...]
	
	init_palette();
	
	p = (char *) 0xa0000;
	for(i = 0 ; i <= 0xffff ; i++){
		//*(p+i) = i & 0x0f;
		//or in this way
		p[i] = i & 0x0f;
		//equals to i mod (0f+1)
	}
	while(1){
		io_hlt();
	}
}

void init_palette(){
	static unsigned char table_rgb[16*3] = {
		0x00, 0x00, 0x00,	/*  0:¶Â*/
		0xff, 0x00, 0x00,	/*  1:«G¬õ*/
		0x00, 0xff, 0x00,	/*  2:«Gºñ*/
		0xff, 0xff, 0x00,	/*  3:«G¶À*/
		0x00, 0x00, 0xff,	/*  4:«GÂÅ*/
		0xff, 0x00, 0xff,	/*  5:«Gµµ*/
		0x00, 0xff, 0xff,	/*  6:«G¤ô*/
		0xff, 0xff, 0xff,	/*  7:¥Õ*/
		0xc6, 0xc6, 0xc6,	/*  8:«G¦Ç*/
		0x84, 0x00, 0x00,	/*  9:·t¬õ*/
		0x00, 0x84, 0x00,	/* 10:·tºñ*/
		0x84, 0x84, 0x00,	/* 11:·t¶À*/
		0x00, 0x00, 0x84,	/* 12:·tÂÅ*/
		0x84, 0x00, 0x84,	/* 13:·tµµ*/
		0x00, 0x84, 0x84,	/* 14:·t¤ô*/
		0x84, 0x84, 0x84	/* 15:·t¦Ç*/
	};
	set_palette(0,15,table_rgb);
	return;
}

void set_palette(int start,int end,unsigned char *rgb){
	int i,eflags;
	eflags = io_load_eflags();
	io_cli();
	io_out8(0x03c8, start);
	for(i = start;i <= end;i++){
		io_out8(0x03c9,rgb[0]/4);
		io_out8(0x03c9,rgb[1]/4);
		io_out8(0x03c9,rgb[2]/4);
		rgb += 3;
	}
	io_store_eflags(eflags);
	return;
}
