
#include "stdio.h"
#include "string.h"

int doCommand1(int cmd,char * optionalMsg,char * logPath) {
	//int counter =1;
	FILE *f = fopen(logPath,"w");
	if (cmd == 1) {
		printf("CMD1");
	} else if (cmd == 2) {
		printf(optionalMsg);
	}
	fprintf(f,"Cmd DONE");
	return 1;
	//return counter;
}


int main(int argc,char ** argv)
{
	return doCommand1(argc,argv[1],argv[2]);
}


