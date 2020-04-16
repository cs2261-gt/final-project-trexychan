	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"enemyAI.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.global	animateBeemon
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBeemon, %function
animateBeemon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, [r0, #48]
	sub	r3, r5, #1
	cmp	r3, #1
	mov	r4, r0
	bls	.L11
	sub	r5, r5, #3
	cmp	r5, #1
	bls	.L12
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldrlt	r2, [r0, #52]
	sub	r3, r3, #1
	strlt	r2, [r0, #48]
	str	r3, [r0, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	ldr	r6, [r0, #56]
	add	r3, r6, r6, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L13
	add	r3, r3, r3, lsl #16
	ldr	r1, .L13+4
	add	r3, r6, r3, lsl #1
	add	r2, r3, r2
	cmp	r1, r2, ror #2
	bcc	.L3
	ldr	r0, [r0, #40]
	ldr	r3, .L13+8
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L3:
	ldr	r3, [r4]
	cmp	r3, #39
	addle	r5, r3, #1
	ble	.L5
	cmp	r5, #1
	movne	r3, #1
	moveq	r3, #2
	movne	r5, r3
	str	r3, [r4, #48]
.L5:
	add	r6, r6, #1
	str	r6, [r4, #56]
	str	r5, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	715827880
	.word	357913940
	.word	__aeabi_idivmod
	.size	animateBeemon, .-animateBeemon
	.align	2
	.global	animateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBoss, %function
animateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, [r0, #48]
	cmp	r5, #0
	mov	r4, r0
	bne	.L16
	ldr	r5, [r0, #56]
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L26
	add	r3, r3, r3, lsl #16
	ldr	r1, .L26+4
	add	r3, r5, r3, lsl #1
	add	r2, r3, r2
	cmp	r1, r2, ror #2
	bcs	.L25
.L17:
	ldr	r3, [r4]
	cmp	r3, #199
	movgt	r2, #1
	movgt	r1, #0
	movgt	r3, r2
	addle	r3, r3, #1
	add	r5, r5, #1
	strgt	r2, [r4, #48]
	strgt	r1, [r4, #40]
	str	r5, [r4, #56]
	str	r3, [r4]
.L15:
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	cmp	r5, #1
	bne	.L15
	ldr	r6, [r0, #56]
	add	r3, r6, r6, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L26
	add	r3, r3, r3, lsl #16
	ldr	r1, .L26+4
	add	r3, r6, r3, lsl #1
	add	r2, r3, r2
	cmp	r1, r2, ror #2
	bcc	.L21
	ldr	r0, [r0, #40]
	ldr	r3, .L26+8
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L21:
	ldr	r3, [r4]
	cmp	r3, #49
	movgt	r3, #0
	addle	r5, r3, #1
	add	r6, r6, #1
	strgt	r3, [r4, #48]
	str	r6, [r4, #56]
	str	r5, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r0, [r0, #40]
	ldr	r3, .L26+8
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
	b	.L17
.L27:
	.align	2
.L26:
	.word	715827880
	.word	357913940
	.word	__aeabi_idivmod
	.size	animateBoss, .-animateBoss
	.align	2
	.global	drawBeemon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBeemon, %function
drawBeemon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0, #40]
	ldr	r3, [r0, #48]
	ldr	r2, [r0, #12]
	str	lr, [sp, #-4]!
	add	ip, ip, #4
	ldr	lr, .L30
	add	r1, r1, #71
	add	r3, r3, ip, lsl #5
	ldr	ip, [r0, #8]
	lsl	r3, r3, #1
	lsl	r0, r1, #3
	orr	r2, r2, #16384
	add	r1, lr, r1, lsl #3
	strh	ip, [lr, r0]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	shadowOAM
	.size	drawBeemon, .-drawBeemon
	.align	2
	.global	drawBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoss, %function
drawBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #12]
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	r3, [r0, #48]
	str	lr, [sp, #-4]!
	ldr	lr, [r0, #40]
	ldr	ip, .L34
	add	r3, r3, #2
	add	r1, r1, #71
	add	r3, r3, lr, lsl #5
	ldr	lr, [r0, #8]
	lsl	r3, r3, #3
	lsl	r0, r1, #3
	add	r1, ip, r1, lsl #3
	strh	lr, [ip, r0]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	shadowOAM
	.size	drawBoss, .-drawBoss
	.align	2
	.global	updateBeemon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBeemon, %function
updateBeemon:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, [r0, #48]
	sub	sp, sp, #20
	add	r9, sp, #60
	cmp	ip, #1
	mov	r5, r0
	stm	r9, {r1, r2, r3}
	ldr	r0, [r0, #20]
	beq	.L64
	cmp	ip, #2
	ldreq	r3, [r5, #32]
	subeq	r0, r0, r3
	streq	r0, [r5, #20]
.L38:
	ldr	r4, .L68
	ldr	r3, [r4, #8]
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #12]
	asr	r3, r3, #8
	str	r2, [sp]
	str	r3, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #16]
	ldr	r7, .L68+4
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L39
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L65
.L39:
	ldr	r4, .L68+8
	add	r6, r4, #3072
	mov	r10, #20
	mov	r8, #0
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	fp, .L68+12
	add	r6, r6, #8
	b	.L47
.L40:
	add	r4, r4, #44
	cmp	r6, r4
	beq	.L66
.L47:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L40
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	str	r2, [sp]
	str	r1, [sp, #4]
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L41
	ldr	r3, [r5, #60]
	cmp	r3, #1
	ble	.L67
.L41:
	ldr	r3, [r4, #28]
	add	r1, r5, #16
	cmp	r3, #0
	ldm	r1, {r1, r2}
	beq	.L40
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	str	r2, [sp]
	str	r1, [sp, #4]
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L62
	ldr	r3, [r5, #60]
	add	r1, r5, #16
	cmp	r3, #0
	ldm	r1, {r1, r2}
	ble	.L40
	ldr	r0, [r5, #48]
	cmp	r0, #2
	moveq	ip, #4
	streq	r0, [r5, #52]
	streq	ip, [r5, #48]
	beq	.L46
	cmp	r0, #1
	moveq	ip, #3
	streq	r0, [r5, #52]
	streq	ip, [r5, #48]
.L46:
	str	r10, [r5, #4]
	str	r8, [r5, #40]
	ldr	r0, [r4, #16]
	sub	r3, r3, r0
	str	r3, [r5, #60]
	add	r4, r4, #44
	str	r8, [r4, #-16]
	cmp	r6, r4
	bne	.L47
.L66:
	ldr	r0, .L68+16
	ldr	r3, .L68+20
	ldrh	r0, [r0]
	ldr	r3, [r3]
	sub	r1, r1, r0
	sub	r2, r2, r3
	str	r1, [r5, #8]
	str	r2, [r5, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L67:
	ldr	r3, [fp]
	cmp	r3, #0
	str	r8, [r5, #64]
	str	r8, [r4, #28]
	beq	.L42
	cmp	r3, #1
	bne	.L62
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L68+24
.L63:
	stm	sp, {r0, r1, r2}
	str	r3, [sp, #12]
	mov	r0, r5
	ldm	r9, {r1, r2, r3}
	ldr	ip, .L68+28
	mov	lr, pc
	bx	ip
.L62:
	add	r1, r5, #16
	ldm	r1, {r1, r2}
	b	.L40
.L42:
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L68+32
	b	.L63
.L65:
	mov	r2, #50
	ldr	r1, [r5, #72]
	ldr	r3, [r4, #76]
	sub	r3, r3, r1
	str	r3, [r4, #76]
	str	r2, [r4, #80]
	b	.L39
.L64:
	ldr	r3, [r5, #32]
	add	r0, r0, r3
	str	r0, [r5, #20]
	b	.L38
.L69:
	.align	2
.L68:
	.word	player
	.word	collision
	.word	bullets
	.word	stage
	.word	vOff
	.word	playerHOff
	.word	bossLoot
	.word	dropLoot
	.word	s1Loot
	.size	updateBeemon, .-updateBeemon
	.align	2
	.global	updateBoss
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r4, .L86
	sub	sp, sp, #20
	add	r0, sp, #52
	stm	r0, {r1, r2, r3}
	add	r6, r4, #3072
	add	r1, r5, #16
	mov	r8, #0
	ldm	r1, {r1, r2}
	ldr	r7, .L86+4
	ldr	r9, .L86+8
	add	r6, r6, #8
	b	.L75
.L71:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L84
.L75:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L71
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	str	r1, [sp, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L72
	ldr	r3, [r5, #60]
	add	r1, r5, #16
	cmp	r3, #1
	ldm	r1, {r1, r2}
	ble	.L85
.L73:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L71
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	str	r1, [sp, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L74
	add	r4, r4, #44
	add	r1, r5, #16
	cmp	r4, r6
	ldm	r1, {r1, r2}
	bne	.L75
.L84:
	ldr	r0, .L86+12
	ldr	r3, .L86+16
	ldrh	r0, [r0]
	ldr	r3, [r3]
	sub	r1, r1, r0
	sub	r2, r2, r3
	str	r1, [r5, #8]
	str	r2, [r5, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	add	sp, sp, #16
	bx	lr
.L72:
	add	r1, r5, #16
	ldm	r1, {r1, r2}
	b	.L73
.L74:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	ldrgt	r0, [r4, #16]
	add	r1, r5, #16
	subgt	r3, r3, r0
	ldm	r1, {r1, r2}
	strgt	r3, [r5, #60]
	strgt	r8, [r4, #28]
	b	.L71
.L85:
	mov	r3, #1
	str	r8, [r5, #64]
	str	r3, [r9]
	str	r8, [r4, #28]
	b	.L71
.L87:
	.align	2
.L86:
	.word	bullets
	.word	collision
	.word	bossDefeated
	.word	vOff
	.word	playerHOff
	.size	updateBoss, .-updateBoss
	.ident	"GCC: (devkitARM release 53) 9.1.0"
