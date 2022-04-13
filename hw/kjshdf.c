#include <stdio.h>

short test(short x, short y)
{
    short val = y + 12;
    if (x < 0)
    {
        if (x < y)
            val = x * y;
        else
            val = x | y;
    }
    else if (y > 10)
        val = x / y;
    return val;
};

int main()
{
    int a, b;
    printf("Enter two numbers: ");
    scanf("%d %d", &a, &b);

    a = test(a, b);
    printf("the result is %d\n", a);

    return 0;
}