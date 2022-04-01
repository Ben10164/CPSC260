#include <stdio.h>

void uremdiv(unsigned long x, unsigned long y, unsigned long *qp, unsigned long *rp);

int main()
{
    unsigned long q;
    unsigned long p;
    unsigned long *qp = &q;
    unsigned long *rp = &p;
    unsigned long x;
    unsigned long y;

    x = 15;
    y = 3;
    uremdiv(x, y, qp, rp);
    printf("x = %lu, y = %lu, q = %lu, r = %lu\n", x, y, q, p);
}

void uremdiv(unsigned long x, unsigned long y, unsigned long *qp, unsigned long *rp)
{
    unsigned long q = x / y;
    unsigned long r = x % y;
    *qp = q;
    *rp = r;
}