CC=/home/ubuntu/Desktop/llvm/bin/clang
LINKER=/home/ubuntu/Desktop/llvm/bin/llvm-link
OUTPUT=detection.ll
CFLAGS=-w -emit-llvm -fno-use-cxa-atexit -S
LINKER_FLAGS=-o $(OUTPUT) -S
SRCDIR_OBJS=lodepng.ll edge_detection.ll array_utility.ll process.ll 

build:$(SRCDIR_OBJS)
	$(LINKER) $(LINKER_FLAGS) $(SRCDIR_OBJS)

lodepng.ll: lodepng.c
	$(CC) $(CFLAGS) lodepng.c

edge_detection.ll: edge_detection.c
	$(CC) $(CFLAGS) edge_detection.c

array_utility.ll: array_utility.c
	$(CC) $(CFLAGS) array_utility.c

process.ll: process.c
	$(CC) $(CFLAGS) process.c

clean:
	rm -rf *.ll *.bc llfi* detection.ll

