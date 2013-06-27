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
	int a[5] = {1, 2, 3, 4, 5};
	int b[5] = {5, 4, 3, 2, 1};
	int i, c[5];
	multiply(a, b, c, 5);
	for(i = 0; i < 5; i++) {
		printf("%d ", c[i]);
	}
	printf("\n");
	return 0;
}