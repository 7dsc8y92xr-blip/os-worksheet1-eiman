CC = gcc
NASM = nasm
CFLAGS = -m32
NASMFLAGS = -f elf -I src/


all: task1 task1_2 task2_1 task2_2 task2_3

task1: src/task1.asm src/asm_io.asm src/driver.c
	$(NASM) $(NASMFLAGS) src/task1.asm -o src/task1.o
	$(NASM) $(NASMFLAGS) src/asm_io.asm -o src/asm_io.o
	$(CC) $(CFLAGS) -c src/driver.c -o src/driver.o
	$(CC) $(CFLAGS) src/driver.o src/task1.o src/asm_io.o -o task1

task1_2: src/task1_2.asm src/asm_io.asm src/driver.c
	$(NASM) $(NASMFLAGS) src/task1_2.asm -o src/task1_2.o
	$(NASM) $(NASMFLAGS) src/asm_io.asm -o src/asm_io.o
	$(CC) $(CFLAGS) -c src/driver.c -o src/driver.o
	$(CC) $(CFLAGS) src/driver.o src/task1_2.o src/asm_io.o -o task1_2

task2_1: src/task2_1.asm src/asm_io.asm src/driver.c
	$(NASM) $(NASMFLAGS) src/task2_1.asm -o src/task2_1.o
	$(NASM) $(NASMFLAGS) src/asm_io.asm -o src/asm_io.o
	$(CC) $(CFLAGS) -c src/driver.c -o src/driver.o
	$(CC) $(CFLAGS) src/driver.o src/task2_1.o src/asm_io.o -o task2_1

task2_2: src/task2_2.asm src/asm_io.asm src/driver.c
	$(NASM) $(NASMFLAGS) src/task2_2.asm -o src/task2_2.o
	$(NASM) $(NASMFLAGS) src/asm_io.asm -o src/asm_io.o
	$(CC) $(CFLAGS) -c src/driver.c -o src/driver.o
	$(CC) $(CFLAGS) src/driver.o src/task2_2.o src/asm_io.o -o task2_2

task2_3: src/task2_3.asm src/asm_io.asm src/driver.c
	$(NASM) $(NASMFLAGS) src/task2_3.asm -o src/task2_3.o
	$(NASM) $(NASMFLAGS) src/asm_io.asm -o src/asm_io.o
	$(CC) $(CFLAGS) -c src/driver.c -o src/driver.o
	$(CC) $(CFLAGS) src/driver.o src/task2_3.o src/asm_io.o -o task2_3

clean:
	rm -f src/*.o task1 task1_2 task2_1 task2_2 task2_3

