LC0:
	.ascii " Enter the x and n and y numbers \0"
LC1:
	.ascii "%d %d %d\0"
	
LC2:
	.ascii "The shift of the x number with n shift %d \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
LC3:
	.ascii "Y + 1 is %d \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:

	pushl %ebp 			
	movl %esp, %ebp 		
	
	


	subl	$32, %esp	# setting up the stack pointer to be able to handle the numbers	
	
	movl	$LC0, (%esp)	
	call	_puts	

	leal	12(%esp), %eax  # this is X
	movl	%eax, 12(%esp)	 # this is moving X onto the stack at position 12(%esp)
	
	leal	16(%esp), %eax	# this is N
	movl	%eax, 8(%esp)	# this is moving N onto the stack at position 8(%esp)
    
    leal	20(%esp), %eax	# this is Y
	movl	%eax, 4(%esp)	# this is moving Y onto the stack at position 4(%esp)
	
	movl	$LC1, (%esp)	
	call	_scanf # scans

	movl	20(%esp), %eax  # this is setting X to the value of %eax
	movl	16(%esp), %ecx # this is setting N to the value of %ecx
    movl    12(%esp), %ebx # this is setting Y to the value of %ebx	

	sall	$4, %eax	# shifting to the left 4
    incl    %ebx # y = y + 1

	shrl	%cl, %eax		# this is shifting eax to the right the value of %ecx
    
    movl %eax, 4(%esp) # moving X to the top of the stack pointer
    movl $LC2, (%esp) # then we call the LC2 function on the stack poiner
    call _printf # print
	

    movl %ebx, 4(%esp) # moving y to the top of the stack pointer
    movl	$LC3, (%esp)	 # calling lc3 on the stack poinet
	call	_printf # print
	andl	$32, %esp	# this dealocates the stack ($32 because of line 24)

    leave
	ret