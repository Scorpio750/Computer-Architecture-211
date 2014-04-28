#include "ll.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	int i;
	char buffer[100];
	LLNODE *head = NULL;
	LLNODE *ptr;

	for (i = 0; i < 5; i++) {
		LLNODE *newNode;
		scanf("%s", buffer);
		newNode = malloc(sizeof(LLNODE));
		newNode->data = malloc(sizeof(char) * (strlen(buffer) + 1)); /* +1 for null terminating character */
	strcpy(newNode->data, buffer);
	newNode->next = head;
	head = newNode;

	}
	ptr = head;
	while (ptr != NULL) {
		printf("%s", ptr->data);
		ptr = ptr->next;
	}
	return 0;
}
