// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>

void
checkError(cudaError_t err, int line)
{
	if(err != cudaSuccess) {
		printf("%s in %s at line %d\n", cudaGetErrorString(err), __FILE__, line);
		exit(EXIT_FAILURE);
	}
}

__global__ void
vecAddKernel(float *a, float *b, float *c, int n)
{
	int i = threadIdx.x + blockDim.x * blockIdx.x;
	if(i < n) {
		c[i] = a[i] + b[i];
	}
}

__host__ void
vecAdd(float *ha, float *hb, float *hc, int n)
{
	cudaError_t err;
	int size = n * sizeof(data);
	float *da, *db, *dc;
	err = cudaMalloc((void **) &da, size);
	checkError(err, __LINE__);
	err = cudaMemcpy(da, ha, size, cudaMemcpyHostToDevice);
	checkError(err, __LINE__);
	err = cudaMalloc((void **) &db, size);
	checkError(err, __LINE__);
	err = cudaMemcpy(db, hb, size, cudaMemcpyHostToDevice);
	checkError(err, __LINE__);
	err = cudaMalloc((void **) &dc, size);
	checkError(err, __LINE__);
	vecAddKernel<<<ceil(n/256.0),256>>>(da, db, dc, n);
	err = cudaMemcpy(hc,dc, size, cudaMemcpyDeviceToHost);
	checkError(err, __LINE__);
	err = cudaFree(da);
	checkError(err, __LINE__);
	err = cudaFree(db);
	checkError(err, __LINE__);
	err = cudaFree(dc);
	checkError(err, __LINE__);
}
