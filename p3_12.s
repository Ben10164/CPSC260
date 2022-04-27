# Code by Ben Puryear
LC0:
	.ascii " Enter the x and y numbers \0"
LC1:
	.ascii "%d %d \0"
LC2:
    .ascii "x = %lu, y = %lu, q = %lu, r = %lu\12\0"
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

# x in 8(%ebp), y  in 12(%ebp), *qp in 16(%ebp), *rp in 20(%ebp)
_uremdiv:
	pushl	%ebp # push the base pointer
	movl	%esp, %ebp # move the stack pointer to the base pointer
	subl	$16, %esp # allocate 16 bytes on the stack
	
    # unsigned long q = x / y
    movl	8(%ebp), %eax # get the first argument
	movl	$0, %edx # set the remainder (edx) to zero
	divl	12(%ebp) # divide the first argument by the second
	movl	%eax, -4(%ebp) # store the quotient in the base pointer

    # unsigned long r = x % y
	movl	8(%ebp), %eax # get the first argument
	movl	$0, %edx # set the remainder (edx) to zero
	divl	12(%ebp) # divide the first argument by the second
	movl	%edx, -8(%ebp) # store the remainder in the base pointer

    # *qp = q
    movl	16(%ebp), %eax # get the third argument
	movl	-4(%ebp), %edx # get the quotient
	movl	%edx, (%eax) # store the quotient in the third argument
	
    # *rp = r
    movl	20(%ebp), %eax # get the fourth argument
	movl	-8(%ebp), %edx # get the remainder
	movl	%edx, (%eax) # store the remainder in the fourth argument
	leave
	ret