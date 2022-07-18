nasm -f bin src/boot_section_main.asm -o src/boot_section_main
nasm -f bin src/bootsector_strings_output/bootsector_print.asm -o src/bootsector_strings_output/bootsector_print
nasm -f bin src/bootsector_strings_output/bootsector_print_hex.asm -o src/bootsector_strings_output/bootsector_print_hex
qemu-system-x86_64 src/boot_section_main
