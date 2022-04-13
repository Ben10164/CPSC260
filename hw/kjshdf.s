
#  short test(short x, short y)
#  x in %rdi, y in %rsi
test:
    leaq    12(%rsi), %rbx
    testq   %rdi, %rdi
    jge     .L2
    movq    %rdi, %rbx
    imulq   %rsi, %rbx
    movq    %rdi, %rdx
    orq     %rsi, %rdx
    cmpq    %rsi, %rdi
    cmovge  %rdx, %rbx
    ret

.L2:
    idivq   %rsi, %rdi
    cmpq    $10, %rsi
    cmovge  %rdi, %rbx
    ret
