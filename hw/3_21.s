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
	movzwl	-20(%ebp), %eax
	orw	-24(%ebp), %ax
	movw	%ax, -2(%ebp)
	jmp	L5
L2:
	cmpw	$10, -24(%ebp)
	jle	L5
	movswl	-20(%ebp), %eax
	movswl	-24(%ebp), %ecx
	cltd
	idivl	%ecx
	movw	%ax, -2(%ebp)
L5:
	movzwl	-2(%ebp), %eax
	leave
	ret
_test:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -20(%ebp)
	movw	%ax, -24(%ebp)
	movzwl	-24(%ebp), %eax
	addl	$12, %eax
	movw	%ax, -2(%ebp)
	cmpw	$0, -20(%ebp)
	jns	L2
	movzwl	-20(%ebp), %eax
	cmpw	-24(%ebp), %ax
	jge	L3
	movzwl	-20(%ebp), %edx
	movzwl	-24(%ebp), %eax
	imull	%edx, %eax
	movw	%ax, -2(%ebp)
	jmp	L5
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	24(%esp), %eax
	movl	%eax, 8(%esp)
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	24(%esp), %eax
	movswl	%ax, %edx
	movl	28(%esp), %eax
	cwtl
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_test
	cwtl
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	ret
