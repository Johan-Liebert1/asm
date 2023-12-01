SYS_EXIT equ 60

%macro exit 1 ; 1 -> takes one argument
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro
