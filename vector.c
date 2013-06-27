#include <stdio.h>

void
multiply(int *a, int *b, int *c, int n)
{
	int i;
	for(i = 0; i < n; i++) {
		c[i] = a[i] * b[i];
	}
}

int
main(void)
{
	int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	int b[8] = {8, 7, 6, 5, 4, 3, 2, 1};
	int i, c[8];
	multiply(a, b, c, 8);
	for(i = 0; i < 8; i++) {
		printf("%d ", c[i]);
	}
	printf("\n");
	return 0;
}
