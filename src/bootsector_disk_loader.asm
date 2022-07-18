
disk_load:
    pusha
    push dx ; save input parameters

    mov ah, 0x02 ; read
    mov al, dh ; number of sectors to read
    mov cl, 0x02 ; sector to read from. 0x01 is the boot sector
    mov ch, 0x00 ; track to read from
    mov dh, 0x00 ; head number

    ; data will be saved in [es:bx]

    int 0x13 ; BIOS interrupt
    jc disk_error ; check if any errors occurred

    pop dx
    cmp al, dh ; al is set to the number of sectors read, compare it to check for sectors error
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MESSAGE
    call print
    call print_new_line
    mov dh, ah ; disk error code is stored in ah
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR_MESSAGE
    call print

disk_loop:
    jmp $

DISK_ERROR_MESSAGE: db "Disk reading error", 0
SECTORS_ERROR_MESSAGE: db "Incorrect number of sectors while reading", 0