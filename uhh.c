#include <stdio.h>
int C_Code(signed long x);

int main()
{
    printf("Please enter in the number you would like to use: ");
    signed long x;
    scanf("%ld", &x);
    printf("%d\n", C_Code(x));
}

int C_Code(signed long x)
{
    int result0, result1;
    if (x < 0)
    {
        result0 = 1;
        result1 = x + 1;
    }
    else if (x == 0)
    {
        result0 = 0;
        result1 = x + 2;
    }
    else
    {
        result0 = -1;
        result1 = x + 3;
    }
    result0 = result0 + result1;
    return result0;
}