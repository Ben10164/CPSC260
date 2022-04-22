# Code by Ben Puryear
LC0:
	.ascii " Enter the x and y numbers \0"
LC1:
	.ascii "%d %d \0"
LC2:
	.ascii "The output is %d \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl %ebp 				# \ Standard callee entrance
	movl %esp, %ebp 		# /
	
	subl	$32, %esp		# allocate memory to be used for the stack, stack size is 32 bytes

    movl    $LC0, (%esp)    # move the function LC0 to the stack
    call    _puts           # print the LC0 string and gets the inputs

    leal	16(%esp), %eax  # prep the stack 
	movl	%eax, 8(%esp)  # put eax into 8(%esp), this is the y value

	leal	20(%esp), %eax  # prep the stack pointer
	movl	%eax, 4(%esp)   # put eax into 4(%esp), this is the x value

    movl	$LC1, (%esp)
	call	_scanf             # scanf x=%d and y=%d

    movl    4(%esp), %edi   # moves x into %edi
    movl    8(%esp), %esi  # moves y into %esi

.test: # the following code is provided from the problem

    leal    12(%esi), %ebx # ebx = address of y + 12
    testl   %edi, %edi # test if x is zero 
    jge     .L2       # if x is zero, jump to .L2
    movl    %edi, %ebx # if x is not zero, move x into ebx
    imull   %esi, %ebx # multiply ebx by y
    movl    %edi, %edx # move x into edx
    orl     %esi, %edx # or edx with y
    cmpl    %esi, %edi # compare edx with y
    cmovge  %edx, %ebx # if edx >= y, move edx into ebx
    jmp     .END # jump to the .END function

.L2:
    # idivl   %esi, %edi
    cmpl    $10, %esi # if %esi is greater than 10: 
    cmovge  %edi, %ebx # if %esi >= 10, %ebx = %edi
    jmp     .END # jump to the .END function

    
.END:
    movl    %edx, 4(%esp)   # move %edx into 4(%esp)
    movl    $LC2, (%esp)    # puts LC2 into the top of the stack (the output)
    call    _printf         # calls printf to print the output
    ret
    
    andl	$32, %esp		# deallocate memory that has been used for the stack
	leave
	ret