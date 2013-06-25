// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#define NOPLAN9DEFINES
#define NTHREADS 8

#include <stdio.h>
#include <u.h>
#include <libc.h>
#include <thread.h>

void
sequence(void *arg)
{
	Channel *ch = (Channel *)arg;
	long i;
	for(i = 0; i < 500; ++i) {
		send(ch, (void *)i);
	}
}

void
process(void *arg)
{
	Channel *ch = (Channel *)arg;
	long i;
	while(1) {
		recv(ch, &i);
		printf("%ld\n", i);
	}
}

void
threadmain(int argc, char *argv[])
{
	int i, threads[NTHREADS];
	Channel *c = chancreate(sizeof(long), 2);
	threads[0] = threadcreate(sequence, c, 2048);
	for(i = 1; i < NTHREADS; i++) {
		threads[i] = threadcreate(process, c, 2048);
	}
	chanfree(c);
}
