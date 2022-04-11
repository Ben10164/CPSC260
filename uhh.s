LC0:
	.ascii " Enter the number to preform C_Code onto \0"
LC1:
	.ascii "%d\0"
	
LC2:
	.ascii "The result of C_Code on your number is %d \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp

	cmpl	$0, 8(%ebp)
	jns	L2
	movl	$1, 12(%esp)
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 8(%esp)
	jmp	L3
L2:
	cmpl	$0, 8(%ebp)
	jne	L4
	movl	$0, 12(%esp)
	movl	8(%ebp), %eax
	addl	$2, %eax
	movl	%eax, 8(%esp)
	jmp	L3
L4:
	movl	$-1, 12(%esp)
	movl	8(%ebp), %eax
	addl	$3, %eax
	movl	%eax, 8(%esp)
L3:
	movl	8(%esp), %eax
	addl	%eax, 12(%esp)
	movl	12(%esp), %eax
	leave

	ret
