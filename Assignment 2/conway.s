	.section	__TEXT,__text,regular,pure_instructions
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
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB0_4
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-16(%ebp), %eax
	shll	$2, %eax
	movl	%eax, (%esp)
	calll	_malloc
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	%eax, (%edx,%ecx,4)
## BB#3:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB0_1
LBB0_4:
	movl	$0, -24(%ebp)
LBB0_5:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_7 Depth 2
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB0_12
## BB#6:                                ##   in Loop: Header=BB0_5 Depth=1
	movl	$0, -28(%ebp)
LBB0_7:                                 ##   Parent Loop BB0_5 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB0_10
## BB#8:                                ##   in Loop: Header=BB0_7 Depth=2
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
## BB#9:                                ##   in Loop: Header=BB0_7 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB0_7
LBB0_10:                                ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_5 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB0_5
LBB0_12:
	movl	$0, -24(%ebp)
LBB0_13:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_15 Depth 2
	movl	-24(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jge	LBB0_34
## BB#14:                               ##   in Loop: Header=BB0_13 Depth=1
	movl	$0, -28(%ebp)
LBB0_15:                                ##   Parent Loop BB0_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB0_32
## BB#16:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB0_19
## BB#17:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jge	LBB0_19
## BB#18:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB0_30
LBB0_19:                                ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB0_22
## BB#20:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jne	LBB0_22
## BB#21:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
	jmp	LBB0_29
LBB0_22:                                ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB0_25
## BB#23:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jle	LBB0_25
## BB#24:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB0_28
LBB0_25:                                ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jne	LBB0_27
## BB#26:                               ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
LBB0_27:                                ##   in Loop: Header=BB0_15 Depth=2
	jmp	LBB0_28
LBB0_28:                                ##   in Loop: Header=BB0_15 Depth=2
	jmp	LBB0_29
LBB0_29:                                ##   in Loop: Header=BB0_15 Depth=2
	jmp	LBB0_30
LBB0_30:                                ##   in Loop: Header=BB0_15 Depth=2
	jmp	LBB0_31
LBB0_31:                                ##   in Loop: Header=BB0_15 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB0_15
LBB0_32:                                ##   in Loop: Header=BB0_13 Depth=1
	jmp	LBB0_33
LBB0_33:                                ##   in Loop: Header=BB0_13 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB0_13
LBB0_34:
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
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_6 Depth 2
	movl	-32(%ebp), %eax
	movl	-16(%ebp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB1_19
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	cmpl	$0, -32(%ebp)
	jl	LBB1_4
## BB#3:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-32(%ebp), %eax
	cmpl	-24(%ebp), %eax
	jne	LBB1_5
LBB1_4:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_18
LBB1_5:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-20(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -36(%ebp)
LBB1_6:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-36(%ebp), %eax
	movl	-20(%ebp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB1_17
## BB#7:                                ##   in Loop: Header=BB1_6 Depth=2
	cmpl	$0, -36(%ebp)
	jl	LBB1_9
## BB#8:                                ##   in Loop: Header=BB1_6 Depth=2
	movl	-36(%ebp), %eax
	cmpl	-28(%ebp), %eax
	jne	LBB1_10
LBB1_9:                                 ##   in Loop: Header=BB1_6 Depth=2
	jmp	LBB1_16
LBB1_10:                                ##   in Loop: Header=BB1_6 Depth=2
	movl	-32(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	LBB1_13
## BB#11:                               ##   in Loop: Header=BB1_6 Depth=2
	movl	-20(%ebp), %eax
	cmpl	-36(%ebp), %eax
	jne	LBB1_13
## BB#12:                               ##   in Loop: Header=BB1_6 Depth=2
	jmp	LBB1_16
LBB1_13:                                ##   in Loop: Header=BB1_6 Depth=2
	movl	-36(%ebp), %eax
	movl	-32(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB1_15
## BB#14:                               ##   in Loop: Header=BB1_6 Depth=2
	movl	-40(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -40(%ebp)
LBB1_15:                                ##   in Loop: Header=BB1_6 Depth=2
	jmp	LBB1_16
LBB1_16:                                ##   in Loop: Header=BB1_6 Depth=2
	movl	-36(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -36(%ebp)
	jmp	LBB1_6
LBB1_17:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_18
LBB1_18:                                ##   in Loop: Header=BB1_1 Depth=1
	movl	-32(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -32(%ebp)
	jmp	LBB1_1
LBB1_19:
	movl	-40(%ebp), %eax
	addl	$32, %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret


.subsections_via_symbols
