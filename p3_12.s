_printf:
LFB8:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	leal	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %ebx
	movl	$1, (%esp)
	movl	__imp____acrt_iob_func, %eax
	call	*%eax
	movl	%ebx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	___mingw_vfprintf
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	-4(%ebp), %ebx
	leave
	ret
LFE8:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "x = %lu, y = %lu, q = %lu, r = %lu\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB29:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$64, %esp
	call	___main
	leal	44(%esp), %eax
	movl	%eax, 60(%esp)
	leal	40(%esp), %eax
	movl	%eax, 56(%esp)
	movl	$5, 52(%esp)
	movl	$2, 48(%esp)
	movl	56(%esp), %eax
	movl	%eax, 12(%esp)
	movl	60(%esp), %eax
	movl	%eax, 8(%esp)
	movl	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	_uremdiv
	movl	40(%esp), %edx
	movl	44(%esp), %eax
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	48(%esp), %eax
	movl	%eax, 8(%esp)
	movl	52(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	ret
LFE29:
	.globl	_uremdiv
	.def	_uremdiv;	.scl	2;	.type	32;	.endef
_uremdiv:
LFB30:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	$0, %edx
	divl	12(%ebp)
	movl	%eax, -4(%ebp)
	movl	8(%ebp), %eax
	movl	$0, %edx
	divl	12(%ebp)
	movl	%edx, -8(%ebp)
	movl	16(%ebp), %eax
	movl	-4(%ebp), %edx
	movl	%edx, (%eax)
	movl	20(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%edx, (%eax)
	nop
	leave
	ret
LFE30:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef