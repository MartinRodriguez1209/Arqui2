

define debug =
# script goes here
qemu-system-aarch64 -s -S -machine virt -cpu cortex-a53 -machine type=virt -nographic -smp 1 -m 64 -kernel out/program &
gdb-multiarch -ex "set architecture aarch64" -ex "target remote localhost:1234"

killall qemu-system-aarch64
endef

all : out/program
	
out/program: out/program.o
	aarch64-linux-gnu-ld -static out/program.o -o out/program

out/program.o : program.s
	aarch64-linux-gnu-as -c program.s -o out/program.o

clean : 
	rm -rf out/* 

debug: ; $(value debug)

.ONESHELL:
