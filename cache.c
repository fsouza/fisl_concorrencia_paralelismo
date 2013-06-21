// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include <stdio.h>

#define N 500000

int
main(void)
{
	int i, numeros[N];
	long soma;
	for(i = 0; i < N; i++) {
		numeros[i] = i*2 + 40;
	}
	soma = 0;
	for(i = 0; i < N; i++) {
		soma += numeros[i];
	}
	printf("%ld\n", soma);
}
