#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int num = atoi(argv[1]);
	int *i = NULL;
	
	i = malloc(num * (sizeof(int)));

	for (int j=0; j < num; j++) {
		printf("%d\n", i[j]);
	}
	free(i);
	return 0;
}
