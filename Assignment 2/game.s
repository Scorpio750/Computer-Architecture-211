	.section	__TEXT,__text,regular,pure_instructions
	.globl	_printusage
	.align	4, 0x90
_printusage:                            ## @printusage
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	calll	L0$pb
L0$pb:
	popl	%eax
	leal	L_.str-L0$pb(%eax), %eax
	movl	%eax, (%esp)
	calll	_printf
	movl	%eax, -4(%ebp)          ## 4-byte Spill
	addl	$8, %esp
	popl	%ebp
	ret

	.globl	_printboard
	.align	4, 0x90
_printboard:                            ## @printboard
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$48, %esp
	calll	L1$pb
L1$pb:
	popl	%eax
	movl	16(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	8(%ebp), %esi
	movl	%esi, -12(%ebp)
	movl	%edx, -16(%ebp)
	movl	%ecx, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	%eax, -32(%ebp)         ## 4-byte Spill
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB1_8
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -28(%ebp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB1_6
## BB#4:                                ##   in Loop: Header=BB1_3 Depth=2
	movl	-32(%ebp), %eax         ## 4-byte Reload
	leal	L_.str1-L1$pb(%eax), %ecx
	movl	-28(%ebp), %edx
	movl	-24(%ebp), %esi
	movl	-12(%ebp), %edi
	movl	(%edi,%esi,4), %esi
	movl	(%esi,%edx,4), %edx
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	calll	_printf
	movl	%eax, -36(%ebp)         ## 4-byte Spill
## BB#5:                                ##   in Loop: Header=BB1_3 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB1_3
LBB1_6:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-32(%ebp), %eax         ## 4-byte Reload
	leal	L_.str2-L1$pb(%eax), %ecx
	movl	%ecx, (%esp)
	calll	_printf
	movl	%eax, -40(%ebp)         ## 4-byte Spill
## BB#7:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB1_1
LBB1_8:
	addl	$48, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret

	.globl	_update
	.align	4, 0x90
_update:                                ## @update
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$48, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	%edx, -12(%ebp)
	movl	%ecx, -16(%ebp)
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	%eax, -32(%ebp)
	movl	$0, -24(%ebp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB2_4
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-16(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	%eax, (%edx,%ecx,4)
## BB#3:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB2_1
LBB2_4:
	movl	$0, -24(%ebp)
LBB2_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_7 Depth 2
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB2_12
## BB#6:                                ##   in Loop: Header=BB2_5 Depth=1
	movl	$0, -28(%ebp)
LBB2_7:                                 ##   Parent Loop BB2_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB2_10
## BB#8:                                ##   in Loop: Header=BB2_7 Depth=2
	movl	-12(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-28(%ebp), %edx
	movl	-20(%ebp), %esi
	movl	-16(%ebp), %edi
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%esi, 12(%esp)
	movl	%edi, 16(%esp)
	calll	_getLiveNeighbors
	movl	-28(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	-32(%ebp), %esi
	movl	(%esi,%edx,4), %edx
	movl	%eax, (%edx,%ecx,4)
## BB#9:                                ##   in Loop: Header=BB2_7 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB2_7
LBB2_10:                                ##   in Loop: Header=BB2_5 Depth=1
	jmp	LBB2_11
LBB2_11:                                ##   in Loop: Header=BB2_5 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB2_5
LBB2_12:
	movl	$0, -24(%ebp)
LBB2_13:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_15 Depth 2
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB2_34
## BB#14:                               ##   in Loop: Header=BB2_13 Depth=1
	movl	$0, -28(%ebp)
LBB2_15:                                ##   Parent Loop BB2_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB2_32
## BB#16:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB2_19
## BB#17:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jge	LBB2_19
## BB#18:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB2_30
LBB2_19:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB2_22
## BB#20:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jne	LBB2_22
## BB#21:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
	jmp	LBB2_29
LBB2_22:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB2_25
## BB#23:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jle	LBB2_25
## BB#24:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB2_28
LBB2_25:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jne	LBB2_27
## BB#26:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
LBB2_27:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_28
LBB2_28:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_29
LBB2_29:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_30
LBB2_30:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_31
LBB2_31:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB2_15
LBB2_32:                                ##   in Loop: Header=BB2_13 Depth=1
	jmp	LBB2_33
LBB2_33:                                ##   in Loop: Header=BB2_13 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB2_13
LBB2_34:
	movl	$0, %eax
	addl	$48, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret

	.globl	_getLiveNeighbors
	.align	4, 0x90
_getLiveNeighbors:                      ## @getLiveNeighbors
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movl	24(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	12(%ebp), %esi
	movl	8(%ebp), %edi
	movl	%edi, -12(%ebp)
	movl	%esi, -16(%ebp)
	movl	%edx, -20(%ebp)
	movl	%ecx, -24(%ebp)
	movl	%eax, -28(%ebp)
	movl	$0, -40(%ebp)
	movl	-16(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -32(%ebp)
LBB3_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_6 Depth 2
	movl	-32(%ebp), %eax
	movl	-16(%ebp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB3_19
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, -32(%ebp)
	jl	LBB3_4
## BB#3:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jne	LBB3_5
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_18
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
LBB3_6:                                 ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-36(%ebp), %eax
	movl	-20(%ebp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB3_17
## BB#7:                                ##   in Loop: Header=BB3_6 Depth=2
	cmpl	$0, -36(%ebp)
	jl	LBB3_9
## BB#8:                                ##   in Loop: Header=BB3_6 Depth=2
	movl	-36(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jne	LBB3_10
LBB3_9:                                 ##   in Loop: Header=BB3_6 Depth=2
	jmp	LBB3_16
LBB3_10:                                ##   in Loop: Header=BB3_6 Depth=2
	movl	-32(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	LBB3_13
## BB#11:                               ##   in Loop: Header=BB3_6 Depth=2
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	LBB3_13
## BB#12:                               ##   in Loop: Header=BB3_6 Depth=2
	jmp	LBB3_16
LBB3_13:                                ##   in Loop: Header=BB3_6 Depth=2
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB3_15
## BB#14:                               ##   in Loop: Header=BB3_6 Depth=2
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
LBB3_15:                                ##   in Loop: Header=BB3_6 Depth=2
	jmp	LBB3_16
LBB3_16:                                ##   in Loop: Header=BB3_6 Depth=2
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	LBB3_6
LBB3_17:                                ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_18
LBB3_18:                                ##   in Loop: Header=BB3_1 Depth=1
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	LBB3_1
LBB3_19:
	movl	-40(%ebp), %eax
	addl	$32, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
## BB#0:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	subl	$68, %esp
	calll	L4$pb
L4$pb:
	popl	%eax
	movl	12(%ebp), %ecx
	movl	8(%ebp), %edx
	movl	$0, -8(%ebp)
	movl	%edx, -12(%ebp)
	movl	%ecx, -16(%ebp)
	cmpl	$3, -12(%ebp)
	movl	%eax, -40(%ebp)         ## 4-byte Spill
	je	LBB4_2
## BB#1:
	calll	_printusage
	movl	$1, -8(%ebp)
	jmp	LBB4_23
LBB4_2:
	movl	-40(%ebp), %eax         ## 4-byte Reload
	leal	L_.str3-L4$pb(%eax), %ecx
	leal	-20(%ebp), %edx
	movl	-16(%ebp), %esi
	movl	4(%esi), %esi
	movl	%esi, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_sscanf
	cmpl	$1, %eax
	je	LBB4_4
## BB#3:
	calll	_printusage
	movl	$1, -8(%ebp)
	jmp	LBB4_23
LBB4_4:
	movl	-40(%ebp), %eax         ## 4-byte Reload
	leal	L_.str3-L4$pb(%eax), %ecx
	leal	-24(%ebp), %edx
	movl	-16(%ebp), %esi
	movl	8(%esi), %esi
	movl	%esi, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_sscanf
	cmpl	$1, %eax
	je	LBB4_6
## BB#5:
	calll	_printusage
	movl	$1, -8(%ebp)
	jmp	LBB4_23
LBB4_6:
	movl	-24(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	%eax, -28(%ebp)
	movl	$0, -32(%ebp)
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jge	LBB4_10
## BB#8:                                ##   in Loop: Header=BB4_7 Depth=1
	movl	-20(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	-32(%ebp), %ecx
	movl	-28(%ebp), %edx
	movl	%eax, (%edx,%ecx,4)
## BB#9:                                ##   in Loop: Header=BB4_7 Depth=1
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	LBB4_7
LBB4_10:
	movl	$0, %eax
	movl	$0, (%esp)
	movl	%eax, -44(%ebp)         ## 4-byte Spill
	calll	_time
	movl	%eax, (%esp)
	calll	_srand
	movl	$0, -32(%ebp)
LBB4_11:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_13 Depth 2
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jge	LBB4_18
## BB#12:                               ##   in Loop: Header=BB4_11 Depth=1
	movl	$0, -36(%ebp)
LBB4_13:                                ##   Parent Loop BB4_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-36(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB4_16
## BB#14:                               ##   in Loop: Header=BB4_13 Depth=2
	calll	_rand
	movl	$2, %ecx
	cltd
	idivl	%ecx
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	movl	-28(%ebp), %esi
	movl	(%esi,%ecx,4), %ecx
	movl	%edx, (%ecx,%eax,4)
## BB#15:                               ##   in Loop: Header=BB4_13 Depth=2
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	LBB4_13
LBB4_16:                                ##   in Loop: Header=BB4_11 Depth=1
	jmp	LBB4_17
LBB4_17:                                ##   in Loop: Header=BB4_11 Depth=1
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	LBB4_11
LBB4_18:
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_printboard
	movl	-28(%ebp), %eax
	movl	-20(%ebp), %ecx
	movl	-24(%ebp), %edx
	movl	%eax, (%esp)
	movl	%ecx, 4(%esp)
	movl	%edx, 8(%esp)
	calll	_update
	movl	-40(%ebp), %ecx         ## 4-byte Reload
	leal	L_.str2-L4$pb(%ecx), %edx
	movl	%edx, (%esp)
	movl	%eax, -48(%ebp)         ## 4-byte Spill
	calll	_printf
	movl	-28(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %esi
	movl	%ecx, (%esp)
	movl	%edx, 4(%esp)
	movl	%esi, 8(%esp)
	movl	%eax, -52(%ebp)         ## 4-byte Spill
	calll	_printboard
	movl	$0, -32(%ebp)
LBB4_19:                                ## =>This Inner Loop Header: Depth=1
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jge	LBB4_22
## BB#20:                               ##   in Loop: Header=BB4_19 Depth=1
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %ecx
	movl	(%ecx,%eax,4), %eax
	movl	%eax, (%esp)
	calll	_free
## BB#21:                               ##   in Loop: Header=BB4_19 Depth=1
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	LBB4_19
LBB4_22:
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	calll	_free
LBB4_23:
	movl	-8(%ebp), %eax
	addl	$68, %esp
	popl	%esi
	popl	%ebp
	ret

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Usage: game <width> <height>\n"

L_.str1:                                ## @.str1
	.asciz	"%d "

L_.str2:                                ## @.str2
	.asciz	"\n"

L_.str3:                                ## @.str3
	.asciz	"%d"


.subsections_via_symbols
