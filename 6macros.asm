; %include "name_of_file"

;; defining constants
STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_EXIT equ 60

%macro exit 1 ; 1 -> takes one argument
    mov rax, SYS_EXIT
    mov rdi, %1
    syscall
%endmacro

section .text
    global _start

_start:
    exit 69

