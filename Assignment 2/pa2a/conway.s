    .file   "conway.c"
    .text
.globl update
    .type   update, @function
# insert your code here
update:                                ## @update
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
	jge	LBB2_33
## BB#14:                               ##   in Loop: Header=BB2_13 Depth=1
	movl	$0, -28(%ebp)
LBB2_15:                                ##   Parent Loop BB2_13 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	LBB2_31
## BB#16:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jge	LBB2_18
## BB#17:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB2_29
LBB2_18:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	je	LBB2_20
## BB#19:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$2, (%ecx,%eax,4)
	jne	LBB2_21
LBB2_20:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
	jmp	LBB2_28
LBB2_21:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$1, (%ecx,%eax,4)
	jne	LBB2_24
## BB#22:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jle	LBB2_24
## BB#23:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$0, (%ecx,%eax,4)
	jmp	LBB2_27
LBB2_24:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-32(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	cmpl	$3, (%ecx,%eax,4)
	jne	LBB2_26
## BB#25:                               ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %edx
	movl	(%edx,%ecx,4), %ecx
	movl	$1, (%ecx,%eax,4)
LBB2_26:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_27
LBB2_27:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_28
LBB2_28:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_29
LBB2_29:                                ##   in Loop: Header=BB2_15 Depth=2
	jmp	LBB2_30
LBB2_30:                                ##   in Loop: Header=BB2_15 Depth=2
	movl	-28(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -28(%ebp)
	jmp	LBB2_15
LBB2_31:                                ##   in Loop: Header=BB2_13 Depth=1
	jmp	LBB2_32
LBB2_32:                                ##   in Loop: Header=BB2_13 Depth=1
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -24(%ebp)
	jmp	LBB2_13
LBB2_33:
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

