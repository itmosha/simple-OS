[org 0x7c00] ; loaded boot sector starts at 0x7c00

mov bx, HELLO_MESSAGE
call print
call print_new_line

mov bx, GOODBYE_MESSAGE
call print
call print_new_line

mov dx, 0x12fe
call print_hex

jmp $

%include "bootsector_strings_output/bootsector_print.asm"
%include "bootsector_strings_output/bootsector_print_hex.asm"

HELLO_MESSAGE:
    db 'Hello, world!', 0
GOODBYE_MESSAGE:
    db 'Goodbye!', 0

times 510-($-$$) db 0
dw 0xaa55
