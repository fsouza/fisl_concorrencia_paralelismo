# Copyright 2013 Francisco Souza. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

PLAN9FLAGS = -I$(PLAN9)/include/ -L$(PLAN9)/lib/ -lthread -l9 -Wno-unused-parameter

sequence: sequence.c
	$(CC) $(CFLAGS) $(PLAN9FLAGS) $(LDFLAGS) -o sequence sequence.c

fsequence: sequence.f90
	mpif90 -o fsequence sequence.f90

vectors.o:
	ifort -c vectors.f90

vecadd: vecadd.f90 vectors.o
	ifort -c vecadd.f90
	ifort -openmp -o vecadd vecadd.o vectors.o

vector_intrinsics: vector_intrinsics.c
	icc -o vector_intrinsics vector_intrinsics.c

vector_auto: vector_auto.c
	icc -o vector_auto vector_auto.c
