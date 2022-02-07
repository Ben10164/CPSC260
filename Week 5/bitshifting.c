/* c Program to demonstrate use of left and right shift operators*/
#include <stdio.h>
int main()
{
    unsigned char x = 0b11; /* 0x03 or 3 in decimal try to ox3f*/
    unsigned char y = 0b10; /* 0x02 or 2 in decimal */

    // a = 5 (00000101), b = 9(00001001)
    unsigned char a = 5, b = 9;

    unsigned short a1 = 0x55, b1 = 0x46;
    // unsigned char x = 0b01100011; /* 0x63 or 99 in decimal */
    // unsigned char y = 0b10010101; /*0x95 or 149 in decimal */

    // The result for x fill the left or right shift
    printf("x»>1 = %x \n", x >> 1);

    // The result for y fill the right in left shift
    printf("y = 0x%x \n", y);
    printf("y<<1 =0x%x \n", y << 1);

    // The result for a
    printf("a<<1 = %d in decimal\n", a << 1);

    // The result for b
    printf("b<<1 = %d in decimal\n", b << 1);

    printf("a1&b1=%x\n", a1 & b1);
    printf("a1&&b1=%x\n", a1 && b1);
    printf("a&b=%x\n", a & b);
    printf("a&b=%x\n", a & b);
    printf("a&b=%x\n", a & b);
    return 0;
}