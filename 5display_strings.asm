section .data
    text db "Hello, World!", 10, 0

section .text
    global _start


; input: rax as pointer to string
; output: print the string at rax
_print:
    ; save the value inside rax for later use
    ; as we mutate rax in the _printLoop subroutine
    push rax

    mov rbx, 0

_printLoop:
    inc rax ; inc rax, so it keeps moving from character to character
    inc rbx ; this stores the length of the string

    ; cl -> 8 bit equivalent of rcx
    mov cl, [rax] ; move whatever character rax is pointing to. We only get the character as cl is 8 bit register

    cmp cl, 0 ; end of the string as our string ends with a null byte
    jne _printLoop

    mov rax, 1
    mov rdi, 1

    ; pop into rsi whatever's stored in the stack, which is whatever was passed into rax 
    ; as rax is what we push into the stack in _print
    pop rsi 
    mov rdx, rbx
    syscall 

    ret

_start:
    mov rax, text

    call _print


    mov rax, 60
    mov rdi, 0
    syscall
