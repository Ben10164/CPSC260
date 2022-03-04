default: asm exe mac 

asm:
	i686-w64-mingw32-gcc -Og -S helloworld.c

exe:
	i686-w64-mingw32-gcc -Og -o helloworld  helloworld.s

mac:
	gcc -o helloworld helloworld.c