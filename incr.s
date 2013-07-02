	.section	__TEXT,__text,regular,pure_instructions
	.globl	_inc
	.align	4, 0x90
_inc:                                   ## @inc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	movl	$0, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	popq	%rbp
	ret
	.cfi_endproc


.subsections_via_symbols
