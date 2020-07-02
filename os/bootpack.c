
void io_hlt(void); //prototype

void HariMain(void)
{

fin:
	io_hlt();//call _io_hlt in naskfunc.nas 
	goto fin;

}
