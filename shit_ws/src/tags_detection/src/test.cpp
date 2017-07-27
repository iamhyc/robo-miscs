#include "pipe.h"
#include <stdio.h>
int main(){
	int id = mes_open(12345);
	while(1){
		const char *p = mes_read(id);
		if(p == 0){
			puts("Error");
		}else{
			puts(p);
		}
	}
}