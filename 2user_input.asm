section .data
    prompt db "What is your name? "
    output db "Hello, "

section .bss
    ; resb -> reserve bytes
    ; reserve 16 bytes
    name resb 16

section .text
    global _start

_getName:
    mov rax, 0 ; read sycall
    mov rdi, 0 ; read from stdin
    mov rsi, name
    mov rdx, 16 ; stdin len is only 16, we will stop reading after 16 bytes
    syscall

    ret

_printPrompt:
    ;; Write syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, 19
    syscall

    ret


_printOutput:
    ;; Write syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, output
    mov rdx, 7
    syscall

    ret

_printName:
    ;; Write syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall

    ret

_start:
    call _printPrompt
    call _getName
    call _printOutput
    call _printName

    mov rax, 60               ; exit syscall code
    mov rdi, 0                ; the exit code
    syscall

