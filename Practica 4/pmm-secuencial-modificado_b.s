	.text
	.cstring
lC0:
	.ascii "Fin\0"
	.text
	.align 4,0x90
	.globl _multi
_multi:
LFB4:
	testl	%edi, %edi
	jle	L9
	leal	-1(%rdi), %eax
	movq	_m3@GOTPCREL(%rip), %r9
	pushq	%r12
LCFI0:
	imulq	$120000, %rax, %rax
	pushq	%rbp
LCFI1:
	movq	_m2@GOTPCREL(%rip), %rbp
	pushq	%rbx
LCFI2:
	movq	_m1@GOTPCREL(%rip), %rbx
	leaq	120000(%r9), %r11
	leaq	(%r11,%rax), %r12
	leaq	120000(%rbp,%rax), %r10
	.align 4,0x90
L3:
	movq	%rbp, %rsi
	movq	%rbx, %r8
	.align 4,0x90
L6:
	movsd	(%r8), %xmm0
	movq	%rsi, %rdx
	movq	%r9, %rax
	xorl	%ecx, %ecx
	.align 4,0x90
L4:
	movsd	(%rdx), %xmm1
	addl	$5, %ecx
	addq	$40, %rax
	addq	$40, %rdx
	mulsd	%xmm0, %xmm1
	addsd	-40(%rax), %xmm1
	movsd	%xmm1, -40(%rax)
	movsd	-32(%rdx), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	-32(%rax), %xmm1
	movsd	%xmm1, -32(%rax)
	movsd	-24(%rdx), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	-24(%rax), %xmm1
	movsd	%xmm1, -24(%rax)
	movsd	-16(%rdx), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	-16(%rax), %xmm1
	movsd	%xmm1, -16(%rax)
	movsd	-8(%rdx), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	-8(%rax), %xmm1
	movsd	%xmm1, -8(%rax)
	cmpl	%ecx, %edi
	jg	L4
	addq	$120000, %rsi
	addq	$8, %r8
	cmpq	%r10, %rsi
	jne	L6
	addq	$120000, %rbx
	cmpq	%r12, %r11
	movq	%r11, %r9
	je	L2
	addq	$120000, %r11
	jmp	L3
L2:
	popq	%rbx
LCFI3:
	leaq	lC0(%rip), %rdi
	popq	%rbp
LCFI4:
	popq	%r12
LCFI5:
	jmp	_puts
L9:
	leaq	lC0(%rip), %rdi
	jmp	_puts
LFE4:
	.cstring
	.align 3
lC1:
	.ascii "Falta el n\303\272mero de filas/columnas. \0"
	.align 3
lC6:
	.ascii "El componente [0][0] de la matriz resultante es: %.0f \12\0"
	.align 3
lC7:
	.ascii "El componente [%d][%d] de la matriz resultante es: %.0f \12\0"
lC8:
	.ascii "Tiempo(seg.):%11.9f \12\0"
	.section __TEXT,__text_startup,regular,pure_instructions
	.align 4
	.globl _main
_main:
LFB5:
	pushq	%rbp
LCFI6:
	pushq	%rbx
LCFI7:
	subq	$56, %rsp
LCFI8:
	cmpl	$1, %edi
	jle	L23
	movq	8(%rsi), %rdi
	movl	$15000, %ebx
	call	_atoi
	cmpl	$15000, %eax
	cmovle	%eax, %ebx
	testl	%eax, %eax
	jle	L24
	movq	_m3@GOTPCREL(%rip), %rbp
	xorl	%edi, %edi
	movq	_m1@GOTPCREL(%rip), %rsi
	movq	_m2@GOTPCREL(%rip), %rcx
	movsd	lC2(%rip), %xmm1
	movsd	lC3(%rip), %xmm0
	movq	%rbp, %rdx
	.align 4
L17:
	xorl	%eax, %eax
	.align 4
L16:
	movsd	%xmm1, (%rsi,%rax,8)
	movsd	%xmm0, (%rcx,%rax,8)
	movq	$0x000000000, (%rdx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	L16
	addl	$1, %edi
	addq	$120000, %rsi
	addq	$120000, %rcx
	addq	$120000, %rdx
	cmpl	%ebx, %edi
	jl	L17
L15:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	_clock_gettime
	movl	%ebx, %edi
	call	_multi
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	_clock_gettime
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	subq	24(%rsp), %rax
	leaq	lC6(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	divsd	lC5(%rip), %xmm0
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	addsd	%xmm0, %xmm1
	movsd	0(%rbp), %xmm0
	movsd	%xmm1, 8(%rsp)
	call	_printf
	leal	-1(%rbx), %esi
	leaq	lC7(%rip), %rdi
	movslq	%esi, %rax
	movl	%esi, %edx
	imulq	$120008, %rax, %rax
	movsd	0(%rbp,%rax), %xmm0
	movl	$1, %eax
	call	_printf
	movsd	8(%rsp), %xmm1
	movl	$1, %eax
	leaq	lC8(%rip), %rdi
	movapd	%xmm1, %xmm0
	call	_printf
	addq	$56, %rsp
LCFI9:
	xorl	%eax, %eax
	popq	%rbx
LCFI10:
	popq	%rbp
LCFI11:
	ret
L24:
LCFI12:
	movq	_m3@GOTPCREL(%rip), %rbp
	jmp	L15
L23:
	leaq	lC1(%rip), %rdi
	call	_puts
	orl	$-1, %edi
	call	_exit
LFE5:
	.comm	_m3,1800000000,5
	.comm	_m2,1800000000,5
	.comm	_m1,1800000000,5
	.literal8
	.align 3
lC2:
	.long	0
	.long	1075052544
	.align 3
lC3:
	.long	0
	.long	1073741824
	.align 3
lC5:
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
	.byte	0x8c
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xe
	.byte	0x18
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xe
	.byte	0x20
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.set L$set$6,LCFI3-LCFI2
	.long L$set$6
	.byte	0xc3
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$7,LCFI4-LCFI3
	.long L$set$7
	.byte	0xc6
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$8,LCFI5-LCFI4
	.long L$set$8
	.byte	0xcc
	.byte	0xe
	.byte	0x8
	.align 3
LEFDE1:
LSFDE3:
	.set L$set$9,LEFDE3-LASFDE3
	.long L$set$9
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB5-.
	.set L$set$10,LFE5-LFB5
	.quad L$set$10
	.byte	0
	.byte	0x4
	.set L$set$11,LCFI6-LFB5
	.long L$set$11
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$12,LCFI7-LCFI6
	.long L$set$12
	.byte	0xe
	.byte	0x18
	.byte	0x83
	.byte	0x3
	.byte	0x4
	.set L$set$13,LCFI8-LCFI7
	.long L$set$13
	.byte	0xe
	.byte	0x50
	.byte	0x4
	.set L$set$14,LCFI9-LCFI8
	.long L$set$14
	.byte	0xa
	.byte	0xe
	.byte	0x18
	.byte	0x4
	.set L$set$15,LCFI10-LCFI9
	.long L$set$15
	.byte	0xe
	.byte	0x10
	.byte	0x4
	.set L$set$16,LCFI11-LCFI10
	.long L$set$16
	.byte	0xe
	.byte	0x8
	.byte	0x4
	.set L$set$17,LCFI12-LCFI11
	.long L$set$17
	.byte	0xb
	.align 3
LEFDE3:
	.subsections_via_symbols
