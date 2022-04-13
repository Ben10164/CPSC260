# short test(short x, short y, short z)
#   x in %rdi, y in %rsi, z in %rdx
test:
  leaq    (%rdx,%rsi), %rax # result = z + y
  subq    %rdi, %rax # result = result - x
  cmpq    $5, %rdx # z - 5 
  jle     .L2 # if z <= 5 go to .L2
  cmpq    $2, %rsi # y - 2
  jle     .L3 # if y <= 2 go to .L3
  movq    %rdi, %rax # result = x
  idivq   %rdx, %rax # result = result / z
  ret # return
.L3:
  movq    %rdi, %rax # result = x
  idivq   %rsi, %rax # result = result / y
  ret # return 
.L2:
  cmpq    $3, %rdx # z - 3
  jge     .L4 # if z >= 3 jump to .L4
  movq    %rdx, %rax # result = z
  idivq   %rsi, %rax # result = result / y
.L4:
    rep; ret # 