	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	$.L__unnamed_1, 24(%rsp)
	movl	$10, 32(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	movq	$.L__unnamed_2, 40(%rsp)
	movq	%rax, 48(%rsp)
	leaq	40(%rsp), %rax
	movq	%rax, 8(%rsp)
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdi
	callq	tig_print
	movq	16(%rsp), %rax
	movq	$.L__unnamed_3, (%rax)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdi
	callq	tig_print
	xorl	%eax, %eax
	addq	$56, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello"
	.size	.L__unnamed_1, 6

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"world"
	.size	.L__unnamed_2, 6

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"lol"
	.size	.L__unnamed_3, 4


	.section	".note.GNU-stack","",@progbits