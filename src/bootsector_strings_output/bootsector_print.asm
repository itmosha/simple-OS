; bx is the base address for the string

print:
    pusha ; push all registers onto the stack

start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0e ; tty
    int 0x10

    add bx, 1
    jmp start

done:
    popa
    ret

print_new_line:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; new line char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

    popa
    ret