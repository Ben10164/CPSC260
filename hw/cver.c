#include <stdio.h>

short test(short x, short y, short z)
{
    short val = z + y - x;
    if (x > 5)
    {
        if (y > 2)
        {
            val = x / z;
        }
        else
        {
            val = x / y;
        }
    }
    else if (x < 3)
    {
        val = z / y;
    }
    return val;
};

int main()
{
    int a, b, c;
    printf("Enter three numbers: ");
    scanf("%d %d %d", &a, &b, &c);

    a = test(a, b, c);
    printf("the result is %d\n", a);

    return 0;
}