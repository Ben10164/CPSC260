/* C Program to demonstrate conversion between short to unsigned short int */
#include <stdio.h>
int main()
{
    short int v = -12345;                  /* in decimal*/
    unsigned short uv = (unsigned short)v; /* 0x02 or 2 in decimal */
    printf("v = %d , uv =%u\n", v, uv);
    printf("v = %x , uv =%x\n", v, uv);

    unsigned u = 4294967295u; // UMAxw w=32 is 0xFFFFFFFF or 4,294,967,295 in decimal in 32 bit word size in unsigned form
    int tu = (int)u;          // 0xffffffff = 0b1111...1111 so 1's complement 0b0000...0000 then +1 =0b0000....0001 then -1
    printf("u =%u, tu = %d\n", u, tu);
    printf("u =%x, tu = %x\n", u, tu);

    /**
     * first u=4294967295, which is also 0xffffffff,
     * also known as the max of an unsigned int,
     * however when you convert it to an unsigned int,
     * 0xFFFFFFFF is -1.
     * This is because if the leftmost byte in an
     * unsigned number is above 7, that means that the leftmost bit in the byte
     * is a 1. This means the number is negative, and in this case with ffffffff, it is -1
     *
     * This also explains the next 3 output lines, where the hex is the same, yet the values are different
     * This all relates to if the datatype will register the leftmost bit as being a 1 affecting the rest of the
     * calculation relating to the value of the number
     */

    /* Conversions can happen due to explicit casting*/
    int tx, ty;
    unsigned ux, uy;

    tx = (int)ux;
    uy = (unsigned)ty;

    /* alternatively, Conversions can happen due to
    implicity when an experssion of one type is assigned to a variable of another*/
    tx = ux; /* Cast to signed */
    uy = ty; /* cast to unsigned */

    int x = -1;
    unsigned u1 = 2147483648; // 2^31

    /**
     * The last 2 lines of the program (also explained above) also show how the
     * specific tags of %u and %d will output the number as an unsigned value and a signed values
     * respectivley
     */

    printf("x=%u=%d\n", x, x);
    printf("u1=%u=%d\n", u1, u1); /* the directives %d, %u, and %x are used to print
    a numebr as signed decimal, an unsigned decimal and in hex format*/
    return 0;
}