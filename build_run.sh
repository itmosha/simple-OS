nasm -f bin simple_boot.asm -o simple_boot
qemu-system-x86_64 simple_boot
./simple_boot
