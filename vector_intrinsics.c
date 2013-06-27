#include <stdio.h>
#include <string.h>
#include <smmintrin.h>

void
multiply(int *a, int *b, int *c, int n)
{
	int i;
	register __m128i *pa, *pb, pc;
	for(i = 0; i < n; i += 4) {
		pa = (__m128i *)&a[i];
		pb = (__m128i *)&b[i];
		pc = _mm_mullo_epi32(*pa, *pb);
		memcpy(&c[i], &pc, 4*sizeof(int));
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
