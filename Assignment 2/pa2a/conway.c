#include <stdlib.h>
#include "conway.h"

int update(int **board, int width, int height) {
	int i, j;
	int ** newboard;
	
	/* makes a new board with the # of live neighbors of each (i,j)th tile */
	newboard = malloc(sizeof(int *) * height);
    for (i = 0; i < height; i++) {
        newboard[i] = malloc(sizeof(int) * width);    
	}

	for (i = 0; i < height; i++) {
		for (j = 0; j < width; j++) {
			newboard[i][j] = getLiveNeighbors(board, i, j, height, width);
		}
	}
	
	/* update conditions */
	for (i = 0; i < height; i++) {
		for (j = 0; j < width; j++) {
				if (board[i][j] == 1 && newboard[i][j] < 2) {
					board[i][j] = 0;
				}
				else if (board[i][j] == 1 && newboard[i][j] == 2) {
					board[i][j] = 1;
				}
				else if (board[i][j] == 1 && newboard[i][j] > 3) {
					board[i][j] = 0;
				}
				else if (newboard[i][j] == 3) {
					board[i][j] = 1;
				}
		}
	}
	
/*	printf("\nUpdate board\n");

	for(i = 0; i < height; i++){
		for(j = 0; j < width; j++){
			printf("%d ", newboard[i][j]);
		}
		printf("\n");
	} */

	return 0;
}

int getLiveNeighbors(int **board, int i, int j, int height, int width) {
	int k, l, count = 0;

	for (k = i-1; k <= i+1; k++) {
			if (k < 0 || k == height) {
				continue;
			}
			for (l = j-1; l <= j+1; l++) {
				if (l < 0 || l == width) {
						continue;
					}
					if (k == i && j == l) {
						continue;
					}
					if (board[k][l] == 1) {
						count++;
					}
			}
	}
	return count;
}
