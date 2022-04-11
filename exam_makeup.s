# Code by Ben Puryear 

LC0:
    .ascii "Enter an integer :) : \0"
LC1: 
    .ascii "%d\0"

    .global _main
    .def    _main;  .scl    2;  .type   32; .endef
_main:
    pushl   %ebp
    movl    %esp, %ebp
    andl    $-16, %esp
    subl    $32, %esp

    movl    $LC0, (%esp)
    call    _printf
    leal    28(%esp), %eax
    movl    %eax, 4(%esp)
    movl    $LC1, (%esp)
    call    _scanf

    movl    28(%esp), %ebx # this is actually storing x
    movl    $0, %edx # storing 0 in edx

    cmpl    %edx, %ebx
    jns .L1 # jiump if x is greater than 0
    je  .L2 # jump if equal
    # this means that x is smaller if it has gotten here

    movl    $-1, %eax # moving -1 to result0
    addl    $3, %ebx # adding 3 to x
    movl    %ebx, %ecx # moving result1 to its own variable 
    jmp .L3

.L1:
    movl    $1, %eax # setting result0 to 1
    addl    $1, %ebx # adding 1 to x
    movl    %ebx, %ecx # moving result1 to its own variable
    jmp .L3

.L2:
    movl    $0, %eax # moving 1 to result0
    addl    $2, %ebx # adding 2 to x
    movl    %ebx, %ecx # moving resutl1 to its own variable

.L3:
    addl    %ecx, %eax # add result0 and result1 together, storing it in result1

    # now we can check our answer with a print statement
    movl    %eax, 4(%esp)
    movl    $LC1, (%esp)
    call    _printf

    leave
    ret
