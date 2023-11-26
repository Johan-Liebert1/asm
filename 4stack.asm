section .data
    digit db 0,10

section .text
    global _start

_printRAXDigit:
    add rax, 48

    ;; lower byte of rax is moved into the memory address "digit"
    ;; al -> 8bit representation of rax
    mov [digit], al

    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall

    ret

_start:
    push 1  ; push onto the stack
    push 2  ; push onto the stack
    push 3  ; push onto the stack

    
    ; pop from the stack and store it in a register
    pop rax
    call _printRAXDigit

    pop rax
    call _printRAXDigit

    pop rax
    call _printRAXDigit

    mov rax, 60
    mov rdi, 0
    syscall
