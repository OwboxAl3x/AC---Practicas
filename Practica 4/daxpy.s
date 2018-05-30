	.text
	.cstring
lC0:
	.ascii "Falta el tama\303\261o del vector\0"
	.align 3
lC2:
	.ascii "El componente 0 del vector es: %d \12\0"
	.align 3
lC3:
	.ascii "El componente %d del vector es: %d \12\0"
lC4:
	.ascii "Tiempo(seg.):%11.9f \12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align 4
	.globl _main
_main:
LFB4:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
LCFI2:
	cmpl	$1, %edi
	jle	L14
	movq	8(%rsi), %rdi
	call	_atoi
	cltq
	movq	%rax, %r13
	leaq	18(,%rax,4), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	leaq	3(%rsp), %r14
	subq	%rax, %rsp
	shrq	$2, %r14
	testl	%r13d, %r13d
	movq	%rsp, %r15
	leaq	0(,%r14,4), %r12
	jle	L3
	leal	-1(%r13), %eax
	xorl	%ebx, %ebx
	movq	%rax, %r13
	leaq	4(,%rax,4), %rax
	.align 4
L4:
	movl	$5, (%r15,%rbx)
	movl	$2, (%r12,%rbx)
	addq	$4, %rbx
	cmpq	%rax, %rbx
	jne	L4
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	_clock_gettime
	xorl	%edx, %edx
	.align 4
L6:
	movl	(%r15,%rdx), %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, (%r12,%rdx)
	addq	$4, %rdx
	cmpq	%rbx, %rdx
	jne	L6
L7:
	leaq	-64(%rbp), %rsi
	xorl	%edi, %edi
	call	_clock_gettime
	movq	-56(%rbp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subq	-72(%rbp), %rax
	leaq	lC2(%rip), %rdi
	movl	0(,%r14,4), %esi
	cvtsi2sdq	%rax, %xmm0
	movq	-64(%rbp), %rax
	divsd	lC1(%rip), %xmm0
	subq	-80(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	call	_printf
	movslq	%r13d, %rax
	movl	%r13d, %esi
	movl	(%r12,%rax,4), %edx
	leaq	lC3(%rip), %rdi
	xorl	%eax, %eax
	call	_printf
	movsd	-88(%rbp), %xmm0
	movl	$1, %eax
	leaq	lC4(%rip), %rdi
	call	_printf
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
LCFI3:
	ret
L3:
LCFI4:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	subl	$1, %r13d
	call	_clock_gettime
	jmp	L7
L14:
	leaq	lC0(%rip), %rdi
	call	_puts
	orl	$-1, %edi
	call	_exit
LFE4:
	.literal8
	.align 3
lC1:
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
	.quad	LFB4-.
	.set L$set$2,LFE4-LFB4
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB4
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0x8f
	.byte	0x3
	.byte	0x8e
	.byte	0x4
	.byte	0x8d
	.byte	0x5
	.byte	0x8c
	.byte	0x6
	.byte	0x83
	.byte	0x7
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xa
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x4
	.set L$set$7,LCFI4-LCFI3
	.long L$set$7
	.byte	0xb
	.align 3
LEFDE1:
	.subsections_via_symbols
