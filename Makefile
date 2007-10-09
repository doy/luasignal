src/signal.so : src/signal.c src/signames.c src/queue.c
	gcc -O -shared -fpic -Wall -pedantic -Werror src/signal.c src/signames.c src/queue.c -o src/signal.so -llua
