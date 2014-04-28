#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {
	FILE *read;
	char *tempstr;
	int i = 0;
	char buffer[1024];
	Node *tree;
	char ch;
	char *ptr;

	if (argc != 2) {
		intf("Invalid argument.\n");
		return 0;
	}
	if (strcmp(argv[1], "-h") == 0) {
		printf(help.txt);
		return 0;	
	}
	
	//reads in filename
	read = fopen(argv[1], "r");
	
	if (read == NULL) {
		printf("Filename specified does not exist.\n");
		return 0;
	}

	tempstr = malloc(sizeof(char) * 128);
	//if it doesn't hit EOF
	while (getline(ptr, 1024, read) != 1) {
		//insert parsing into characters here?
		buffer = getline(read);
		ch = getc(buffer[b0]);
		
		if (isalpha(ch)) {
			while (isalnum(ch)) {
						
			}
					
		}
		
	}
}
