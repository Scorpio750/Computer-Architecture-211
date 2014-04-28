all: game game.s game.o

game.o: game.c
	gcc -ansi -pedantic -Wall -c -g game.c

game.s: game.c
	gcc -O1 -S -m32 game.c

game: game.o
	gcc -o game game.o

clean:
	rm -f game
	rm -f game.s
	rm -f *.o
