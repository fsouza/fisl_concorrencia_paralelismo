// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

#include <stdio.h>
#include <ck_pr.h>

int
main(void)
{
	int i = 0;
	ck_pr_inc_int(&i);
	printf("%d\n", i);
	return 0;
}
