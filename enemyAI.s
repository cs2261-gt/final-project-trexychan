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
	.global	animateHeadMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateHeadMan, %function
animateHeadMan:
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
	cmp	r3, #59
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
	.size	animateHeadMan, .-animateHeadMan
	.align	2
	.global	animateBeellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBeellet, %function
animateBeellet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, [r0, #56]
	add	r3, r4, r4, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L31
	add	r3, r3, r3, lsl #16
	ldr	r1, .L31+4
	add	r3, r4, r3, lsl #1
	add	r2, r3, r2
	cmp	r1, r2, ror #2
	mov	r5, r0
	bcc	.L29
	ldr	r0, [r0, #40]
	ldr	r3, .L31+8
	ldr	r1, [r5, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #40]
.L29:
	add	r4, r4, #1
	str	r4, [r5, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	715827880
	.word	357913940
	.word	__aeabi_idivmod
	.size	animateBeellet, .-animateBeellet
	.align	2
	.global	animateRatTank
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateRatTank, %function
animateRatTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	animateBeellet
	.size	animateRatTank, .-animateRatTank
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
	ldr	r3, .L36
	ldr	r2, .L36+4
	ldr	r3, [r3, #76]
	ldr	ip, [r2]
	add	r3, r1, r3
	ldr	r1, [r0, #40]
	push	{r4, lr}
	ldr	r2, [r0, #12]
	add	r3, r3, ip
	add	ip, r1, #4
	ldr	r1, [r0, #48]
	ldr	lr, .L36+8
	lsl	r2, r2, #23
	ldrb	r4, [r0, #8]	@ zero_extendqisi2
	add	r3, r3, #1
	lsr	r2, r2, #23
	add	r1, r1, ip, lsl #5
	lsl	r0, r3, #3
	orr	r2, r2, #16384
	add	r3, lr, r3, lsl #3
	lsl	r1, r1, #1
	strh	r4, [lr, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	player
	.word	activeBullets
	.word	shadowOAM
	.size	drawBeemon, .-drawBeemon
	.align	2
	.global	drawHeadMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHeadMan, %function
drawHeadMan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldr	r3, .L40
	ldr	ip, .L40+4
	ldr	r3, [r3, #76]
	ldr	ip, [ip]
	add	r3, r1, r3
	ldr	r1, [r0, #48]
	str	lr, [sp, #-4]!
	ldrb	lr, [r0, #8]	@ zero_extendqisi2
	ldr	r0, [r0, #40]
	add	r3, r3, ip
	add	r1, r1, #2
	ldr	ip, .L40+8
	add	r3, r3, #1
	add	r1, r1, r0, lsl #5
	lsl	r1, r1, #3
	lsl	r0, r3, #3
	add	r3, ip, r3, lsl #3
	strh	lr, [ip, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	activeBullets
	.word	shadowOAM
	.size	drawHeadMan, .-drawHeadMan
	.align	2
	.global	drawBeellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBeellet, %function
drawBeellet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	drawBeemon
	.size	drawBeellet, .-drawBeellet
	.align	2
	.global	drawRatTank
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRatTank, %function
drawRatTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, .L45
	ldr	ip, .L45+4
	ldr	r3, [r3, #76]
	push	{r4, lr}
	ldr	ip, [ip]
	ldr	lr, [r0, #40]
	add	r3, r1, r3
	ldr	r1, [r0, #48]
	ldr	r4, .L45+8
	add	r3, r3, ip
	ldrb	ip, [r0, #8]	@ zero_extendqisi2
	add	r0, lr, #8
	add	r3, r3, #1
	add	r1, r1, r0, lsl #4
	lsl	lr, r3, #3
	orr	r0, ip, #16384
	add	r3, r4, r3, lsl #3
	lsl	r1, r1, #2
	strh	r0, [r4, lr]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	player
	.word	activeBullets
	.word	shadowOAM
	.size	drawRatTank, .-drawRatTank
	.align	2
	.global	drawCrate
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCrate, %function
drawCrate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #48]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L51
	cmp	r3, #2
	beq	.L52
	ldr	lr, [sp], #4
	bx	lr
.L52:
	mov	ip, #288
	ldr	r2, .L53
	ldr	r3, .L53+4
	ldr	r2, [r2, #76]
	ldr	r3, [r3]
	add	r1, r1, r2
	ldr	r2, [r0, #12]
	add	r3, r1, r3
	lsl	r2, r2, #23
	ldr	r1, .L53+8
	ldrb	lr, [r0, #8]	@ zero_extendqisi2
	add	r3, r3, #1
	lsr	r2, r2, #23
	lsl	r0, r3, #3
	orr	r2, r2, #16384
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, r0]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L51:
	mov	ip, #224
	ldr	r3, .L53
	ldr	r2, .L53+4
	ldr	r3, [r3, #76]
	ldr	r2, [r2]
	add	r1, r1, r3
	ldr	r3, [r0, #12]
	add	r1, r1, r2
	lsl	r3, r3, #23
	ldr	r2, .L53+8
	ldrb	lr, [r0, #8]	@ zero_extendqisi2
	add	r1, r1, #1
	lsr	r3, r3, #23
	lsl	r0, r1, #3
	orr	r3, r3, #16384
	add	r1, r2, r1, lsl #3
	strh	lr, [r2, r0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
	.word	player
	.word	activeBullets
	.word	shadowOAM
	.size	drawCrate, .-drawCrate
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
	beq	.L87
	cmp	ip, #2
	ldreq	r3, [r5, #32]
	subeq	r0, r0, r3
	streq	r0, [r5, #20]
.L57:
	ldr	r10, .L93
	ldr	r3, [r10, #8]
	add	r1, r10, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r10, #12]
	asr	r3, r3, #8
	str	r2, [sp]
	str	r3, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #16]
	ldr	r7, .L93+4
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L58
	ldr	r3, [r10, #92]
	cmp	r3, #0
	beq	.L88
.L58:
	ldr	r4, .L93+8
	mov	fp, #20
	mov	r8, #0
	add	r6, r4, #1440
	b	.L71
.L63:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L89
.L71:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L63
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L64
	ldr	r2, [r4, #16]
	ldr	r3, [r5, #60]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L90
.L64:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L63
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L63
	ldr	r3, [r5, #60]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L63
	ldr	r2, [r5, #48]
	cmp	r2, #2
	moveq	r1, #4
	streq	r2, [r5, #52]
	streq	r1, [r5, #48]
	beq	.L70
	cmp	r2, #1
	moveq	r1, #3
	streq	r2, [r5, #52]
	streq	r1, [r5, #48]
.L70:
	str	fp, [r5, #4]
	str	r8, [r5, #40]
	str	r3, [r5, #60]
	add	r4, r4, #48
	str	r8, [r4, #-20]
	cmp	r4, r6
	bne	.L71
.L89:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L90:
	cmp	r2, #4
	moveq	r3, #2
	str	r8, [r5, #64]
	streq	r3, [r10, #80]
	ldr	r3, .L93+12
	ldr	r3, [r3]
	cmp	r3, #0
	str	r8, [r4, #28]
	beq	.L66
	cmp	r3, #1
	bne	.L63
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L93+16
.L86:
	stm	sp, {r0, r1, r2}
	str	r3, [sp, #12]
	mov	r0, r5
	ldm	r9, {r1, r2, r3}
	ldr	ip, .L93+20
	mov	lr, pc
	bx	ip
	b	.L63
.L66:
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L93+24
	b	.L86
.L88:
	ldr	r3, [r10, #96]
	cmp	r3, #2
	beq	.L91
	cmp	r3, #4
	beq	.L92
	cmp	r3, #5
	ldreq	r3, [r10, #84]
	ldreq	r2, [r5, #72]
	subeq	r3, r3, r2
	streq	r3, [r10, #84]
.L60:
	mov	r3, #50
	str	r3, [r10, #92]
	b	.L58
.L87:
	ldr	r3, [r5, #32]
	add	r0, r0, r3
	str	r0, [r5, #20]
	b	.L57
.L91:
	ldr	r3, [r10, #76]
	ldr	r2, [r5, #72]
	sub	r3, r3, r2
	str	r3, [r10, #76]
	b	.L60
.L92:
	ldr	r3, [r10, #80]
	sub	r3, r3, #1
	str	r3, [r10, #80]
	b	.L60
.L94:
	.align	2
.L93:
	.word	player
	.word	collision
	.word	bullets
	.word	stage
	.word	bossLoot
	.word	dropLoot
	.word	s1Loot
	.size	updateBeemon, .-updateBeemon
	.align	2
	.global	updateHeadMan
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeadMan, %function
updateHeadMan:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L120
	sub	sp, sp, #20
	mov	r5, r0
	add	r0, sp, #52
	mov	r8, #0
	stm	r0, {r1, r2, r3}
	ldr	r7, .L120+4
	ldr	r9, .L120+8
	add	r6, r4, #1440
	b	.L100
.L97:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L118
.L100:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L97
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L98
	ldr	r3, [r5, #60]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L119
.L98:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L97
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L97
	ldr	r2, [r4, #16]
	ldr	r3, [r5, #60]
	sub	r3, r3, r2
	cmp	r3, #0
	strgt	r3, [r5, #60]
	add	r4, r4, #48
	strgt	r8, [r4, #-20]
	cmp	r4, r6
	bne	.L100
.L118:
	ldr	r3, [r5, #4]
	cmp	r3, #56
	movgt	r2, #0
	ldrgt	r3, [r5, #36]
	ldr	r4, [r5, #48]
	rsbgt	r3, r3, #0
	strgt	r3, [r5, #36]
	strgt	r2, [r5, #4]
	cmp	r4, #0
	bne	.L102
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	ldr	r1, [r5, #36]
	add	r2, r2, #1
	add	r3, r3, r1
	str	r2, [r5, #4]
	str	r3, [r5, #16]
.L95:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	add	sp, sp, #16
	bx	lr
.L119:
	mov	r3, #1
	str	r8, [r5, #64]
	str	r3, [r9]
	str	r8, [r4, #28]
	b	.L97
.L102:
	cmp	r4, #1
	bne	.L95
	ldr	r3, .L120+12
	ldr	r0, [r5]
	ldr	r1, [r3]
	ldr	r3, .L120+16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L95
	ldr	r1, [sp, #52]
	cmp	r1, #1
	ble	.L95
	ldr	r3, .L120+20
	b	.L105
.L104:
	cmp	r1, r4
	add	r3, r3, #80
	beq	.L95
.L105:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	add	r4, r4, #1
	bne	.L104
	mov	ip, #1
	mov	r0, #2
	mvn	lr, #1
	ldr	r1, .L120+24
	ldr	r2, [r1, #20]
	str	r2, [r3, #20]
	ldr	r2, [r1, #28]
	ldr	r1, [r1, #16]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr ip
	str	r2, [r3, #16]
	str	r0, [r3, #72]
	str	r0, [r3, #48]
	str	lr, [r3, #32]
	str	ip, [r3, #64]
	b	.L95
.L121:
	.align	2
.L120:
	.word	bullets
	.word	collision
	.word	bossDefeated
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	bossEnemies+80
	.word	bossEnemies
	.size	updateHeadMan, .-updateHeadMan
	.align	2
	.global	updateBeellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBeellet, %function
updateBeellet:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r0, [r0, #20]
	sub	sp, sp, #20
	cmp	r0, #0
	add	r8, sp, #60
	stm	r8, {r1, r2, r3}
	movlt	r3, #0
	ldr	r9, .L150
	strlt	r3, [r5, #64]
	add	r1, r9, #16
	ldr	r3, [r9, #8]
	ldm	r1, {r1, ip}
	ldr	r2, [r9, #12]
	asr	r3, r3, #8
	str	r2, [sp]
	str	r3, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #16]
	ldr	r7, .L150+4
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L124
	ldr	r3, [r9, #92]
	cmp	r3, #0
	beq	.L145
.L124:
	ldr	r4, .L150+8
	mov	r10, #0
	ldr	r2, [r5, #20]
	ldr	fp, .L150+12
	add	r6, r4, #1440
	b	.L134
.L128:
	add	r4, r4, #48
	cmp	r6, r4
	beq	.L146
.L134:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L128
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	ldr	r3, [r5, #16]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L143
	ldr	r2, [r4, #16]
	ldr	r3, [r5, #60]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L147
.L143:
	add	r4, r4, #48
	cmp	r6, r4
	ldr	r2, [r5, #20]
	bne	.L134
.L146:
	ldr	r3, [r5, #32]
	add	r2, r3, r2
	str	r2, [r5, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L147:
	cmp	r2, #4
	moveq	r3, #2
	str	r10, [r5, #64]
	streq	r3, [r9, #80]
	ldr	r3, [fp]
	cmp	r3, #0
	str	r10, [r4, #28]
	beq	.L132
	cmp	r3, #1
	bne	.L143
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L150+16
.L144:
	stm	sp, {r0, r1, r2}
	str	r3, [sp, #12]
	mov	r0, r5
	ldm	r8, {r1, r2, r3}
	ldr	ip, .L150+20
	mov	lr, pc
	bx	ip
	b	.L143
.L132:
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L150+24
	b	.L144
.L145:
	ldr	r3, [r9, #96]
	cmp	r3, #2
	beq	.L148
	cmp	r3, #4
	beq	.L149
	cmp	r3, #5
	ldreq	r3, [r9, #84]
	ldreq	r2, [r5, #72]
	subeq	r3, r3, r2
	streq	r3, [r9, #84]
.L126:
	mov	r3, #50
	str	r3, [r9, #92]
	b	.L124
.L148:
	ldr	r3, [r9, #76]
	ldr	r2, [r5, #72]
	sub	r3, r3, r2
	str	r3, [r9, #76]
	b	.L126
.L149:
	ldr	r3, [r9, #80]
	sub	r3, r3, #1
	str	r3, [r9, #80]
	b	.L126
.L151:
	.align	2
.L150:
	.word	player
	.word	collision
	.word	bullets
	.word	stage
	.word	bossLoot
	.word	dropLoot
	.word	s1Loot
	.size	updateBeellet, .-updateBeellet
	.align	2
	.global	updateRatTank
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRatTank, %function
updateRatTank:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L184
	sub	sp, sp, #20
	add	r8, sp, #60
	stm	r8, {r1, r2, r3}
	mov	r5, r0
	mov	r9, #0
	ldr	r1, [r0, #20]
	ldr	r2, [r0, #16]
	ldr	r10, .L184+4
	ldr	r7, .L184+8
	ldr	fp, .L184+12
	add	r6, r4, #1440
	b	.L159
.L158:
	ldr	r3, [r5, #60]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	cmp	r3, #0
	ldr	r1, [r5, #20]
	ldr	r2, [r5, #16]
	strgt	r3, [r5, #60]
	strgt	r9, [r4, #28]
.L153:
	add	r4, r4, #48
	cmp	r6, r4
	beq	.L180
.L159:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L153
	ldr	r3, [r4, #16]
	cmp	r3, #5
	beq	.L153
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L154
	ldr	r2, [r4, #16]
	ldr	r3, [r5, #60]
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L181
.L154:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ldr	r1, [r5, #20]
	ldr	r2, [r5, #16]
	beq	.L153
	ldr	r3, [r4, #16]
	cmp	r3, #5
	beq	.L153
	ldr	r0, [r5, #28]
	ldr	r3, [r5, #24]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L158
.L178:
	ldr	r1, [r5, #20]
	ldr	r2, [r5, #16]
.L183:
	add	r4, r4, #48
	cmp	r6, r4
	bne	.L159
.L180:
	ldr	r3, [r10, #12]
	cmp	r3, r1
	movle	r1, #0
	movgt	r1, #1
	ldr	r3, [r10, #8]
	cmp	r2, r3, asr #8
	str	r1, [r5, #48]
	ldr	r3, [r5]
	beq	.L182
.L160:
	add	r3, r3, #1
	str	r3, [r5]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L181:
	cmp	r2, #4
	moveq	r3, #2
	str	r9, [r5, #64]
	streq	r3, [r10, #80]
	ldr	r3, [fp]
	cmp	r3, #0
	str	r9, [r4, #28]
	beq	.L156
	cmp	r3, #1
	bne	.L178
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L184+16
.L179:
	stm	sp, {r0, r1, r2}
	str	r3, [sp, #12]
	mov	r0, r5
	ldm	r8, {r1, r2, r3}
	ldr	ip, .L184+20
	mov	lr, pc
	bx	ip
	ldr	r1, [r5, #20]
	ldr	r2, [r5, #16]
	b	.L183
.L156:
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L184+24
	b	.L179
.L182:
	cmp	r3, #99
	ble	.L160
	mov	r3, #0
	mov	r1, r5
	str	r3, [r5]
	mov	r0, #3
	ldr	r3, .L184+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	b	.L160
.L185:
	.align	2
.L184:
	.word	bullets
	.word	player
	.word	collision
	.word	stage
	.word	bossLoot
	.word	dropLoot
	.word	s1Loot
	.word	fire
	.size	updateRatTank, .-updateRatTank
	.align	2
	.global	updateCrate
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCrate, %function
updateCrate:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L208
	sub	sp, sp, #20
	add	r8, sp, #60
	mov	r5, r0
	stm	r8, {r1, r2, r3}
	ldr	r7, .L208+4
	ldr	r9, .L208+8
	ldr	fp, .L208+12
	ldr	r10, .L208+16
	add	r6, r4, #1440
	b	.L194
.L188:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L206
.L194:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bne	.L188
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L190
	ldr	r3, [r5, #48]
	cmp	r3, #2
	beq	.L207
.L190:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bne	.L188
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #12
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L188
	ldr	r3, [r5, #48]
	cmp	r3, #1
	moveq	r2, #2
	moveq	r3, #0
	streq	r2, [r5, #48]
	add	r4, r4, #48
	streq	r3, [r4, #-28]
	cmp	r4, r6
	bne	.L194
.L206:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L207:
	mov	r2, #0
	str	r2, [r5, #64]
	ldr	r1, [r4, #8]
	cmp	r1, #4
	str	r2, [r4, #20]
	ldreq	r2, .L208+20
	streq	r3, [r2, #80]
	ldr	r3, [r9]
	cmp	r3, #0
	beq	.L192
	cmp	r3, #1
	bne	.L188
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	ldr	r3, .L208+24
	stm	sp, {r0, r1, r2}
	str	r3, [sp, #12]
	mov	r0, r5
	ldm	r8, {r1, r2, r3}
	mov	lr, pc
	bx	r10
	b	.L188
.L192:
	add	r3, sp, #72
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	str	fp, [sp, #12]
	mov	r0, r5
	ldm	r8, {r1, r2, r3}
	mov	lr, pc
	bx	r10
	b	.L188
.L209:
	.align	2
.L208:
	.word	bullets+8
	.word	collision
	.word	stage
	.word	s1Loot
	.word	dropLoot
	.word	player
	.word	bossLoot
	.size	updateCrate, .-updateCrate
	.align	2
	.global	spawnBeellet
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnBeellet, %function
spawnBeellet:
	@ Function supports interworking.
	@ args = 32, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, lr}
	cmp	r1, #1
	add	ip, sp, #12
	stm	ip, {r1, r2, r3}
	ldr	ip, [sp, #36]
	ble	.L210
	mov	r3, #1
	add	r0, r0, #80
	b	.L213
.L212:
	cmp	r1, r3
	add	r0, r0, #80
	beq	.L210
.L213:
	ldr	r2, [r0, #64]
	cmp	r2, #0
	add	r3, r3, #1
	bne	.L212
	mov	lr, #1
	mov	r1, #2
	mvn	r4, #1
	ldr	r3, [ip, #28]
	ldr	r2, [ip, #16]
	add	r3, r3, r3, lsr #31
	ldr	ip, [ip, #20]
	add	r3, r2, r3, asr lr
	str	r3, [r0, #16]
	str	ip, [r0, #20]
	str	r1, [r0, #72]
	str	r1, [r0, #48]
	str	r4, [r0, #32]
	str	lr, [r0, #64]
.L210:
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
	.size	spawnBeellet, .-spawnBeellet
	.global	headManFireRate
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	headManFireRate, %object
	.size	headManFireRate, 4
headManFireRate:
	.word	19
	.ident	"GCC: (devkitARM release 53) 9.1.0"
