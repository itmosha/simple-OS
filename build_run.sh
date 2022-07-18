nasm -f bin src/bootsector_main.asm -o src/bootsector_main
qemu-system-x86_64 -fda src/bootsector_main -boot c
