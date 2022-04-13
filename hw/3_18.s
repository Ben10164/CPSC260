LC0:
	.ascii " Enter the x and n and y numbers \0"
LC1:
	.ascii "%d %d %d\0"
	
LC2:
  .ascii "The result is %d \12\0"

  .globl  _main
  .def  _main;  .scl  2;  .type 32; .endef


# short test(short x, short y, short z)
#   x in %eax, y in %ebx, z in %ecx
_test:

  leal    (%ecx,%ebx), %eax # result = z + y
  subl    %eax, %eax # result = result - x
  cmpl    $5, %ecx # z - 5 
  jle     .L2 # if z <= 5 go to .L2
  cmpl    $2, %ebx # y - 2
  jle     .L3 # if y <= 2 go to .L3
  movl    %eax, %eax # result = x
  idivl   %ecx # result = result / z (automatically uses %eax as the destination and numerator)
  ret # return
.L3:
  movl    %eax, %eax # result = x
  idivl   %ebx # result = result / y (automatically uses %eax as the destination and numerator)
  ret # return 
.L2:
  cmpl    $3, %ecx # z - 3
  jge     .L4 # if z >= 3 jump to .L4
  movl    %ecx, %eax # result = z
  idivl   %ebx # result = result / y (automatically uses %eax as the destination and numerator)
.L4:
  rep; ret # 




_main:
	pushl %ebp 			
	movl %esp, %ebp 		
	


	subl	$32, %esp	# setting up the stack pointer to be able to handle the numbers	
	
	movl	$LC0, (%esp)	
	call	_puts	

	leal	12(%esp), %eax  # this is X
	movl	%eax, 12(%esp)	 # this is moving X onto the stack at position 12(%esp)
	
	leal	16(%esp), %eax	# this is Y
	movl	%eax, 8(%esp)	# this is moving Y onto the stack at position 8(%esp)
    
  leal	20(%esp), %eax	# this is Z
	movl	%eax, 4(%esp)	# this is moving Z onto the stack at position 4(%esp)
	
	movl	$LC1, (%esp)	
	call	_scanf # scans

	movl	20(%esp), %eax  # this is setting X to the value of %eax
	movl	16(%esp), %ebx # this is setting Y to the value of %ecx
  movl  12(%esp), %ecx # this is setting Z to the value of %ecx	

  call  _test
  movl  %eax, 4(%esp)
  movl  $LC2, (%esp)
  call  _printf
