	.text
	.cstring
lC1:
	.ascii "El componente 0 de R es: %d \12\0"
	.align 3
lC2:
	.ascii "El componente %d de R es: %d \12\0"
lC3:
	.ascii "Tiempo(seg.):%11.9f \12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align 4
	.globl _main
_main:
LFB1:
	pushq	%rbx
LCFI0:
	xorl	%edi, %edi
	subq	$160048, %rsp
LCFI1:
	leaq	16(%rsp), %rsi
	call	_clock_gettime
	movq	_s@GOTPCREL(%rip), %r9
	xorl	%r8d, %r8d
	leaq	48(%rsp), %r10
	leaq	40000(%r9), %rdi
	.align 4
L2:
	movl	%r8d, %edx
	movq	%r9, %rax
	xorl	%ecx, %ecx
	xorl	%r11d, %r11d
	.align 4
L3:
	movl	(%rax), %esi
	addq	$40, %rax
	leal	(%rdx,%rsi,2), %ebx
	movl	-36(%rax), %esi
	addl	%ebx, %r11d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%esi, %ecx
	movl	-32(%rax), %esi
	leal	(%rdx,%rsi,2), %ebx
	movl	-28(%rax), %esi
	addl	%r11d, %ebx
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%esi, %ecx
	movl	-24(%rax), %esi
	leal	(%rdx,%rsi,2), %r11d
	movl	-20(%rax), %esi
	addl	%r11d, %ebx
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	addl	%ecx, %esi
	movl	-16(%rax), %ecx
	leal	(%rdx,%rcx,2), %r11d
	movl	-12(%rax), %ecx
	addl	%ebx, %r11d
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %esi
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %r11d
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	%rax, %rdi
	jne	L3
	cmpl	%ecx, %r11d
	cmovl	%r11d, %ecx
	movl	%ecx, (%r10,%r8,4)
	addq	$1, %r8
	cmpq	$40000, %r8
	jne	L2
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	_clock_gettime
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subq	24(%rsp), %rax
	leaq	lC1(%rip), %rdi
	movl	48(%rsp), %esi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	divsd	lC0(%rip), %xmm0
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	_printf
	movl	160044(%rsp), %edx
	movl	$39999, %esi
	xorl	%eax, %eax
	leaq	lC2(%rip), %rdi
	call	_printf
	movsd	8(%rsp), %xmm0
	movl	$1, %eax
	leaq	lC3(%rip), %rdi
	call	_printf
	addq	$160048, %rsp
LCFI2:
	xorl	%eax, %eax
	popq	%rbx
LCFI3:
	ret
LFE1:
	.comm	_s,40000,5
	.literal8
	.align 3
lC0:
	.long	0
	.long	1104006501
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB1-.
	.set L$set$2,LFE1-LFB1
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB1
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x83
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.byte	0xc0,0xe2,0x9
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE1:
	.subsections_via_symbols
