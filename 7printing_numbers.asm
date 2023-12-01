%include "std.asm"

section .bss
    ; reserve 100 bytes
    digitSpace resb 100 ;; this is where we store the number string
    digitSpacePos resb 8 ; 8 bytes

section .text
    global _start

_printRAX:
    ; This instruction moves the address of the digitSpace buffer into the rcx register. rcx is now pointing to the start of the digitSpace buffer.
    mov rcx, digitSpace

    ;; we'll be moving through the number backwards that's why we put a new line at the beginning
    mov rbx, 10 ; new line

    ; This instruction moves the value in the rbx register (which is 10) into the memory location pointed to by rcx (which is the start of digitSpace). 
    ; Essentially, this sets the first byte of digitSpace to 10.
    mov [rcx], rbx

    ; This increments the rcx register by 1. rcx was pointing to the start of digitSpace, and now it points to the second byte of digitSpace.
    inc rcx

    ; This line moves the current value of rcx into the memory location of digitSpacePos. 
    ; This stores the updated position (now pointing to the second byte of digitSpace) in digitSpacePos.
    mov [digitSpacePos], rcx

    call _printRAXLoop

_printRAXLoop:
    ; Clears the RDX register, setting it to zero. 
    ; This is important because div rbx (which comes later) will use the combined value of RDX and RAX as the dividend.
    mov rdx, 0
    mov rbx, 10

    ; Divides the 128-bit value formed by RDX:RAX by the value in RBX (which is 10). 
    ; The quotient is stored in RAX, and the remainder (which represents a digit of the original number) is stored in RDX
    div rbx
    push rax


    ; Converts the remainder in RDX to its ASCII character equivalent. The ASCII value of '0' is 48, 
    ; so adding 48 to the remainder converts the numerical digit to its ASCII character.
    add rdx, 48

    ; Loads the value from the memory location digitSpacePos into RCX. This value is used to determine where in digitSpace to store the next digit.
    mov rcx, [digitSpacePos]

    ; Stores the lower byte of RDX (which now contains the ASCII character of the digit) into the memory location pointed to by RCX (in digitSpace).
    mov [rcx], dl
    inc rcx

    mov [digitSpacePos], rcx

    pop rax
    cmp rax, 0

    jne _printRAXLoop

_printRAXLoop2:
    mov rcx, [digitSpacePos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx

    cmp rcx, digitSpace
    jge _printRAXLoop2

    ret

_start:
    mov rax, 123
    call _printRAX

    exit 0

