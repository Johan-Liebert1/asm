section .data
    ; db -> define bytes we are defining some byes that we are going to use later on
    ; text -> location of the defined bytes in memory
    ; ,10 is the value for '\n'
    text db "Hello, World!",10

section .text
    global _start

_start:
    mov rax, 1               ; write sycall code
    mov rdi, 1               ; first argument to write syscall, the file descriptor
    mov rsi, text            ; the location of what to write, second argument to write sycall
    mov rdx, 14              ; the length of string to write, third arg to write syscall
    syscall

    mov rax, 60               ; exit syscall code
    mov rdi, 0                ; the exit code
    syscall
