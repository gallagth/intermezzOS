default: os.iso

clean:
	rm -f *.o
	rm -f *.bin
	rm -f *.iso
	rm -rf isofiles

multiboot_header.o: multiboot_header.asm
	nasm -f elf64 multiboot_header.asm

boot.o: boot.asm
	nasm -f elf64 boot.asm

kernel.bin: multiboot_header.o boot.o linker.ld
	ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o

os.iso: kernel.bin grub.cfg
	mkdir -p isofiles/boot/grub
	cp grub.cfg isofiles/boot/grub
	cp kernel.bin isofiles/boot
	grub-mkrescue -o os.iso isofiles