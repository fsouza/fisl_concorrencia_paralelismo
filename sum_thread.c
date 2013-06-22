// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include <stdio.h>
#include <threads.h>

#define N 5000000
#define NTHREADS 8

static long partial[NTHREADS];

int
sum(void *arg)
{
	long id = (long)arg;
	int i, start, end;
	start = id * (N / NTHREADS + 1);
	end = start + (N / NTHREADS + 1);
	partial[id] = 0;
	for(i = start; i < end; i++) {
		if(i < N) {
			partial[id] += i;
		}
	}
	return thrd_success;
}

int
main(void)
{
	thrd_t threads[NTHREADS];
	int i, status;
	for(i = 0; i < NTHREADS; i++) {
		thrd_create(&threads[i], sum, (void *)(long)i);
	}
	for(i = 0; i < NTHREADS; i++) {
		thrd_join(threads[i], &status);
	}
	long soma = 0;
	for(i = 0; i < NTHREADS; i++) {
		soma += partial[i];
	}
	printf("%ld\n", soma);
}
