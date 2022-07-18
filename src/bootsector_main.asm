[org 0x7c00] ; loaded boot sector starts at 0x7c00
    mov bp, 0x8000 ; move the base pointer to the safe memory spot
    mov sp, bp

    mov bx, 0x9000 ; 0x0000:0x9000
    mov dh, 2 ; amount of sectors to read
    call disk_load

    mov dx, [0x9000] ; show the first word of the first sector
    call print_hex
    call print_new_line

    mov dx, [0x9000 + 512] ; show the first word of the second sector
    call print_hex

    jmp $

%include "src/bootsector_strings_output/bootsector_string_print.asm"
%include "src/bootsector_strings_output/bootsector_print_hex.asm"
%include "src/bootsector_disk_loader.asm"

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xabcd
times 256 dw 0xbeda
