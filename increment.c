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
