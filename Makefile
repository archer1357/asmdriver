
.PHONY: all
all: first

libmy.so: libmy.c 
	gcc -g -masm=intel -m32 -fpic $< -o $@ -shared -Wl,-soname,$(@F).2
	objdump -M intel -S -D libmy.so > libmy_objdump.asm
	
driver.o: driver.c
	gcc -m32  -c $< -o $@

first.o: first.asm
	nasm -l first.lst -f elf32 $<
	
first: driver.o first.o | libmy.so
	gcc -g -m32 $^ -o $@ -ldl
	objdump -M intel -S -D first > first_objdump.asm

clean:
	@rm -f first first.o driver.o libmy.so
