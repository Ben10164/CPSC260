#include <stdio.h>
int main()
{
    int x;
    printf("Enter a number\n");
    scanf("%d", &x);
    if ((x & 1) == 1) // if the last bit of x is a 1
        printf("x if odd!\n");
    else
        printf("x is even!\n");
    printf("Your nmber is %d \n");
}