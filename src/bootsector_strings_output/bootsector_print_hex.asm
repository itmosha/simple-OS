; getting data from dx

print_hex:
    pusha
    mov cx, 0

; get the last char of dx -> convert to ASCII
; for numbers add 0x30
; for letters add 0x40
; move ASCII char to the corresponding position on the string
hex_loop:
    cmp cx, 4
    je end

    mov ax, dx
    and ax, 0x000f ; make first three digits zeros
    add al, 0x30

    ; if number is > 9 -> add 7 to get a letter
    cmp al, 0x39
    jle step2

    add al, 7

step2:
    ; get the string position to place current char
    mov bx, HEX_OUT + 5
    sub bx, cx
    mov [bx], al
    ror dx, 4

    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

    popa
    ret


HEX_OUT:
    db '0x0000', 0 ; reserved memory for the new string
