[bits 32]

VIDEO_MEMORY_START equ 0xb8000
COLOR_WHITE_ON_BLACK equ 0x0f

print_string_p_mode:
    pusha
    mov edx, VIDEO_MEMORY_START

print_string_p_mode_loop:
    mov al, [ebx]
    mov ah, COLOR_WHITE_ON_BLACK

    cmp al, 0 ; check for the end of string
    je print_string_p_mode_done

    mov [edx], ax
    add ebx, 1 ; next char
    add edx, 2 ; next position in video memory

    jmp print_string_p_mode_loop

print_string_p_mode_done:
    popa
    ret

