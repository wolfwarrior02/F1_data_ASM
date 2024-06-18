DEBUG= -g  

all: bin/telemetry

obj/atoi.o: src/atoi.s
	gcc -m32 -g -c src/atoi.s -o obj/atoi.o

obj/itoa.o: src/itoa.s
	gcc -m32 -g -c src/itoa.s -o obj/itoa.o

obj/main.o: src/main.c
	gcc -m32 -g -c src/main.c -o obj/main.o

obj/massimo.o: src/massimo.s
	gcc -m32 -g -c src/massimo.s -o obj/massimo.o

obj/media.o: src/media.s
	gcc -m32 -g -c src/media.s -o obj/media.o

obj/stampa.o: src/stampa.s
	gcc -m32 -g -c src/stampa.s -o obj/stampa.o

obj/telemetry.o: src/telemetry.s
	gcc -m32 -g -c src/telemetry.s -o obj/telemetry.o

obj/trovaPilota.o: src/trovaPilota.s
	gcc -m32 -g -c src/trovaPilota.s -o obj/trovaPilota.o

bin/telemetry: obj/telemetry.o obj/main.o obj/massimo.o obj/atoi.o obj/itoa.o obj/stampa.o obj/trovaPilota.o obj/media.o
	gcc -m32 -g obj/*.o -o bin/telemetry

clean:
	rm -rf obj/*
	rm -rf bin/telemetry
	echo Done!

