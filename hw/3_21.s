# Code By: Ben Puryear
LC0:
	.ascii "Enter two numbers: \0"
LC1:
	.ascii "%d %d\0"
LC2:
	.ascii "the result is %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
L3:
	movzwl	-20(%ebp), %eax # mov the zero length byte to a long, destination is %ebp
	orw	-24(%ebp), %ax # a logical inclusive or comparing -24+(%ebp) and %ax
	movw	%ax, -2(%ebp) # moving the word stored in %ax to -2(%ebp)
	jmp	L5 # jumpt to L5, which is the end
L2:
	cmpw	$10, -24(%ebp)
	jle	L5
	movswl	-20(%ebp), %eax # moved the signed word -20(%ebp) to a long at %eax
	movswl	-24(%ebp), %ecx # moved the signed word -24(%ebp) to a long at %ebp
	cltd # this converts the signed long to a signed double long
	idivl	%ecx # now that it is a signed double long we can divide it
	movw	%ax, -2(%ebp) # moving the word stored in %ax to -2(%ebp)
L5:
	movzwl	-2(%ebp), %eax # mov the zero length byte to a long, destination is %eax
	leave
	ret
_test:
	pushl	%ebp # push the base pointer
	movl	%esp, %ebp # move the stack pointer to the base pointer
	subl	$24, %esp # subtract 24 from the stack pointer
	movl	8(%ebp), %edx # move the value at 8(%ebp) to %edx
	movl	12(%ebp), %eax # move the value at 12(%ebp) to %eax
	movw	%dx, -20(%ebp) # move the word stored in %dx to -20(%ebp)
	movw	%ax, -24(%ebp) # move the word stored in %ax to -24(%ebp)
	movzwl	-24(%ebp), %eax # mov the zero length byte to a long, destination is %eax
	addl	$12, %eax # add 12 to %eax
	movw	%ax, -2(%ebp) # move the word stored in %ax to -2(%ebp)
	cmpw	$0, -20(%ebp) # compare the word stored in -20(%ebp) to 0
	jns	L2 # jump if the word stored in -20(%ebp) is greater than or equal to 0
	movzwl	-20(%ebp), %eax # mov the zero length byte to a long, destination is %eax
	cmpw	-24(%ebp), %ax # compare the word stored in -24(%ebp) to %ax
	jge	L3 # jump if the word stored in -24(%ebp) is greater than or equal to %ax
	movzwl	-20(%ebp), %edx # mov the zero length byte to a long, destination is %edx
	movzwl	-24(%ebp), %eax # mov the zero length byte to a long, destination is %eax
	imull	%edx, %eax # multiply %edx by %eax
	movw	%ax, -2(%ebp) # move the word stored in %ax to -2(%ebp)
	jmp	L5 # jump to L5
_main: # the main function
	pushl	%ebp # push the base pointer
	movl	%esp, %ebp # move the stack pointer to the base pointer
	andl	$-16, %esp # and the stack pointer with -16
	subl	$32, %esp # subtract 32 from the stack pointer
	call	___main # call the main function
	movl	$LC0, (%esp) # move the string at LC0 to the stack pointer
	call	_printf # call the printf function
	leal	24(%esp), %eax # move the address of 24(%esp) to %eax
	movl	%eax, 8(%esp) # move the value of %eax to 8(%esp)
	leal	28(%esp), %eax # move the address of 28(%esp) to %eax
	movl	%eax, 4(%esp) # move the value of %eax to 4(%esp)
	movl	$LC1, (%esp) # move the string at LC1 to the stack pointer
	call	_scanf # call the scanf function
	movl	24(%esp), %eax # move the value at 24(%esp) to %eax
	movswl	%ax, %edx # move the word stored in %ax to %edx
	movl	28(%esp), %eax # move the value at 28(%esp) to %eax
	cwtl # convert the word stored in %eax to a long
	movl	%edx, 4(%esp) # move the value of %edx to 4(%esp)
	movl	%eax, (%esp) # move the value of %eax to (%esp)
	call	_test # call the test function
	cwtl # convert the word stored in %eax to a long
	movl	%eax, 28(%esp) # move the value of %eax to 28(%esp)
	movl	28(%esp), %eax # move the value at 28(%esp) to %eax
	movl	%eax, 4(%esp) # move the value of %eax to 4(%esp)
	movl	$LC2, (%esp) # move the string at LC2 to the stack pointer
	call	_printf # call the printf function
	movl	$0, %eax # move the value of 0 to %eax
	leave
	ret # return from the main function
