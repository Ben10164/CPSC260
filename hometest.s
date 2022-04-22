LC0:
	.ascii " Enter the x and n and y numbers \0"
LC1:
	.ascii "%d %d %d\0"
	
LC2:
	.ascii "The shift of the x number with n shift %d \12\0"

LC3:
	.ascii "Y + 1 is %d \12\0"
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef

_main:
