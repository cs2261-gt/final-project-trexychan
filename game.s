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
	.file	"game.c"
	.text
	.align	2
	.global	initLevels
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLevels, %function
initLevels:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #5
	mov	lr, #20
	mov	r10, #1024
	mov	r0, #80
	mov	ip, #256
	mov	r9, #512
	mov	r8, #16
	mov	r7, #40
	mov	r6, #712
	mov	r5, #24
	mov	r4, #1
	mov	r1, #13
	ldr	r2, .L4
	str	r10, [r2, #20]
	str	lr, [r2, #8]
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r0, [r2, #12]
	ldr	r3, .L4+4
	str	ip, [r2, #16]
	ldr	r2, .L4+8
	str	lr, [r3, #8]
	str	r9, [r3, #20]
	str	r8, [r3, #12]
	str	r7, [r2, #16]
	str	r6, [r2, #12]
	str	r5, [r2, #8]
	str	r4, [r2, #24]
	str	ip, [r3, #16]
	str	r1, [r3, #4]
	str	r0, [r2, #20]
	str	r1, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	stage1
	.word	boss
	.word	stage1Exit
	.size	initLevels, .-initLevels
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 24, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	mov	lr, #2
	mov	r6, #16
	mov	r5, #9
	mov	r4, #1
	mov	r10, #20
	mov	r9, #50
	mov	r8, #4
	mov	r7, #12
	add	fp, sp, #32
	stmib	fp, {r0, r1, r2, r3}
	ldr	r2, [sp, #48]
	ldr	r3, .L8
	lsl	r2, r2, #8
	str	r2, [r3, #8]
	ldr	r2, [sp, #44]
	str	r10, [r3, #72]
	str	r2, [r3, #12]
	str	r9, [r3, #84]
	str	r8, [r3, #40]
	str	r7, [r3, #52]
	str	r6, [r3, #16]
	str	r6, [r3, #20]
	str	lr, [r3, #96]
	str	lr, [r3, #80]
	str	lr, [r3, #24]
	str	r5, [r3, #76]
	str	r5, [r3, #88]
	str	ip, [r3, #68]
	str	ip, [r3, #60]
	str	ip, [r3, #28]
	str	ip, [r3, #36]
	str	ip, [r3, #64]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L14
	add	r1, r3, #1440
.L11:
	str	r0, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L11
	bx	lr
.L15:
	.align	2
.L14:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #8
	mov	r2, #0
	str	r3, [r0, #20]
	str	r2, [r0, #28]
	str	r3, [r0, #24]
	bx	lr
	.size	initBullet, .-initBullet
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, lr}
	ldr	ip, [r0, #68]
	add	lr, sp, #20
	cmp	ip, #0
	stm	lr, {r1, r2, r3}
	bne	.L18
	mov	r3, #1
	mov	r1, #16
	mov	r2, #3
	mov	r5, #4
	mov	r4, #2
	mov	lr, #12
	str	ip, [r0, #40]
	str	ip, [r0]
	str	r3, [r0, #64]
	str	r3, [r0, #32]
	str	r3, [r0, #72]
	str	r1, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #60]
	str	r2, [r0, #76]
	str	r5, [r0, #44]
	str	r4, [r0, #48]
	str	lr, [r0, #56]
.L17:
	pop	{r4, r5, r6, lr}
	add	sp, sp, #16
	bx	lr
.L18:
	cmp	ip, #1
	bne	.L29
	mov	r4, #40
	mov	lr, #4
	mov	r3, #0
	mov	r2, #64
	mov	r1, #12
	str	r4, [r0, #60]
	str	lr, [r0, #44]
	pop	{r4, r5, r6, lr}
	str	ip, [r0, #64]
	str	ip, [r0, #36]
	str	ip, [r0, #72]
	str	r2, [r0, #28]
	str	r2, [r0, #24]
	str	r3, [r0, #40]
	str	r3, [r0, #48]
	str	r3, [r0]
	str	r1, [r0, #56]
	add	sp, sp, #16
	bx	lr
.L29:
	cmp	ip, #2
	bne	.L30
	mov	r4, #4
	mov	lr, #12
	mov	r3, #0
	mov	r1, #16
	mov	r2, #1
	str	r4, [r0, #44]
	str	lr, [r0, #56]
	pop	{r4, r5, r6, lr}
	str	ip, [r0, #76]
	str	r3, [r0, #64]
	str	r3, [r0, #40]
	str	r3, [r0]
	str	r1, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #60]
	str	r2, [r0, #72]
	add	sp, sp, #16
	bx	lr
.L30:
	cmp	ip, #3
	bne	.L31
	mov	r6, #16
	mov	r5, #32
	mov	r4, #6
	mov	lr, #12
	mov	r2, #1
	mov	r3, #0
	mov	r1, #10
	str	r6, [r0, #28]
	str	r5, [r0, #24]
	str	r4, [r0, #60]
	str	lr, [r0, #56]
	pop	{r4, r5, r6, lr}
	str	ip, [r0, #44]
	str	ip, [r0, #48]
	str	r2, [r0, #64]
	str	r2, [r0, #72]
	str	r3, [r0, #40]
	str	r3, [r0]
	str	r1, [r0, #76]
	add	sp, sp, #16
	bx	lr
.L31:
	cmp	ip, #4
	bne	.L17
	mov	r2, #1
	mov	r3, #16
	mov	ip, #5
	mov	r1, #2
	str	r2, [r0, #64]
	str	r2, [r0, #48]
	str	r3, [r0, #28]
	str	r3, [r0, #24]
	str	ip, [r0, #76]
	str	r1, [r0, #60]
	b	.L17
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 36, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	add	r6, sp, #56
	cmp	r0, #0
	stm	r6, {r0, r1, r2, r3}
	ldr	r10, [sp, #84]
	ble	.L32
	mov	r9, r0
	mov	r5, #0
	ldr	r3, [sp, #88]
	ldr	r4, [sp, #80]
	sub	r8, r3, #4
	add	fp, r10, #4
	add	r7, sp, #68
.L34:
	ldr	r3, [r8, #4]!
	str	r3, [r4, #68]
	ldr	r3, [r10, r5, lsl #3]
	str	r3, [r4, #20]
	ldr	r3, [fp, r5, lsl #3]
	ldm	r7, {r0, r1, r2}
	str	r3, [r4, #16]
	stm	sp, {r0, r1, r2}
	str	r9, [sp, #56]
	mov	r0, r4
	ldm	r6, {r1, r2, r3}
	add	r5, r5, #1
	bl	initEnemy
	cmp	r9, r5
	add	r4, r4, #80
	bne	.L34
.L32:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	lr, .L47
	ldr	ip, .L47+4
	ldr	r5, .L47+8
	sub	sp, sp, #24
	mov	r2, #1
	ldr	r1, .L47+12
	ldr	r0, .L47+16
	ldr	r3, .L47+20
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	mov	lr, pc
	bx	r3
	mov	r0, #28
	mov	r3, #67108864
	mov	r2, #4352
	ldr	lr, .L47+24
	ldr	ip, .L47+28
	ldr	r1, .L47+32
	ldr	r5, .L47+36
	str	r4, [lr]
	str	r4, [ip]
	str	r0, [r1]
	add	r6, r5, #16
	strh	r2, [r3]	@ movhi
	bl	initLevels
	ldm	r6, {r0, r1}
	stm	sp, {r0, r1}
	ldm	r5, {r0, r1, r2, r3}
	bl	initPlayer
	mov	r1, r4
	mov	r2, #8
	ldr	r3, .L47+40
	add	r0, r3, #1440
.L38:
	str	r1, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L38
	ldm	r6, {r0, r1}
	ldr	r3, .L47+44
	ldr	r2, .L47+48
	add	ip, r3, #20
	stm	sp, {r0, r1}
	str	r3, [sp, #16]
	str	ip, [sp, #12]
	str	r2, [sp, #8]
	ldm	r5, {r0, r1, r2, r3}
	bl	initEnemies
	ldr	r1, [r5, #4]
	cmp	r1, #0
	ble	.L39
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L47+52
	add	r1, r3, r1, lsl #5
.L40:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L40
.L39:
	ldr	r3, .L47+56
	ldr	r1, [r3, #4]
	cmp	r1, #0
	ble	.L41
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L47+60
	add	r1, r3, r1, lsl #5
.L42:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L42
.L41:
	mov	r3, #0
	ldr	r1, .L47+64
	ldr	r2, .L47+68
	strh	r3, [r1]	@ movhi
	strh	r3, [r2]	@ movhi
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	bossDefeated
	.word	activeBullets
	.word	stage
	.word	363744
	.word	chaos
	.word	playSoundA
	.word	playerHOff
	.word	gunslot
	.word	screenBlock
	.word	stage1
	.word	bullets
	.word	.LANCHOR0
	.word	s1Enemies
	.word	s1Loot
	.word	boss
	.word	bossLoot
	.word	hOff
	.word	vOff
	.size	initGame, .-initGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeLevel.part.0, %function
changeLevel.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #23552
	push	{r4, r5, r6, lr}
	ldr	r3, .L51
	sub	sp, sp, #24
	strh	r1, [r2, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r1, .L51+4
	ldr	r0, .L51+8
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L51+16
	ldr	r4, .L51+20
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r6
	mov	r3, #3888
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L51+28
	mov	lr, pc
	bx	r6
	add	r5, r4, #16
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L51+32
	ldr	r1, .L51+36
	mov	lr, pc
	bx	r6
	ldm	r5, {r0, r1}
	stm	sp, {r0, r1}
	ldm	r4, {r0, r1, r2, r3}
	bl	initPlayer
	ldr	r3, .L51+40
	ldm	r5, {r0, r1}
	ldr	ip, .L51+44
	add	r2, r3, #60
	add	r3, r3, #112
	stm	sp, {r0, r1}
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	str	ip, [sp, #8]
	ldm	r4, {r0, r1, r2, r3}
	bl	initEnemies
	mov	r3, #0
	mov	r1, #28
	ldr	lr, .L51+48
	ldr	ip, .L51+52
	ldr	r0, .L51+56
	ldr	r2, .L51+60
	strh	r3, [lr]	@ movhi
	str	r3, [ip]
	strh	r3, [r0]	@ movhi
	str	r1, [r2]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	stopSound
	.word	693229
	.word	panic
	.word	playSoundA
	.word	DMANow
	.word	boss
	.word	gwl_BOSSPal
	.word	gwl_BOSSTiles
	.word	100720640
	.word	gwl_BOSSMap
	.word	.LANCHOR0
	.word	bossEnemies
	.word	hOff
	.word	playerHOff
	.word	vOff
	.word	screenBlock
	.size	changeLevel.part.0, .-changeLevel.part.0
	.align	2
	.global	initLootBoxes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLootBoxes, %function
initLootBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L60
	ldr	r1, [r3, #4]
	cmp	r1, #0
	ble	.L54
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L60+4
	add	r1, r3, r1, lsl #5
.L55:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L55
.L54:
	ldr	r3, .L60+8
	ldr	r1, [r3, #4]
	cmp	r1, #0
	bxle	lr
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L60+12
	add	r1, r3, r1, lsl #5
.L57:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r1, r3
	bne	.L57
	bx	lr
.L61:
	.align	2
.L60:
	.word	stage1
	.word	s1Loot
	.word	boss
	.word	bossLoot
	.size	initLootBoxes, .-initLootBoxes
	.align	2
	.global	dropLoot
	.syntax unified
	.arm
	.fpu softvfp
	.type	dropLoot, %function
dropLoot:
	@ Function supports interworking.
	@ args = 32, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	str	lr, [sp, #-4]!
	add	ip, sp, #8
	stm	ip, {r1, r2, r3}
	ldr	ip, [sp, #12]
	cmp	ip, #0
	ble	.L62
	mov	r2, #0
	ldr	r3, [sp, #32]
	b	.L65
.L64:
	cmp	ip, r2
	add	r3, r3, #32
	beq	.L62
.L65:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	add	r2, r2, #1
	bne	.L64
	mov	ip, #1
	ldr	lr, [r0, #76]
	ldr	r1, [r0, #20]
	ldr	r2, [r0, #16]
	str	lr, [r3, #28]
	str	ip, [r3, #24]
	str	r1, [r3, #4]
	str	r2, [r3]
.L62:
	ldr	lr, [sp], #4
	add	sp, sp, #16
	bx	lr
	.size	dropLoot, .-dropLoot
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #8]
	str	lr, [sp, #-4]!
	ldr	lr, [r0, #40]
	ldr	r2, [r0, #12]
	add	r1, r1, lr
	ldr	ip, .L74
	ldr	lr, [r0, #36]
	ldr	r3, .L74+4
	add	r2, r2, lr
	ldrh	ip, [ip]
	ldr	r3, [r3]
	ldr	lr, [r0, #44]
	sub	ip, r1, ip
	sub	r3, r2, r3
	cmp	lr, #1
	str	r1, [r0, #8]
	str	ip, [r0]
	str	r3, [r0, #4]
	str	r2, [r0, #12]
	beq	.L73
	lsr	r3, r3, #31
	cmp	lr, #2
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L71
.L68:
	ldr	lr, [sp], #4
	bx	lr
.L73:
	cmp	r3, #240
	ble	.L68
.L71:
	mov	r1, #0
	ldr	r2, .L74+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r0, #28]
	ldr	lr, [sp], #4
	bx	lr
.L75:
	.align	2
.L74:
	.word	vOff
	.word	playerHOff
	.word	activeBullets
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L85
	push	{r4, lr}
	add	r4, r0, #1440
	b	.L78
.L77:
	add	r0, r0, #48
	cmp	r0, r4
	beq	.L84
.L78:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L77
	bl	updateBullet
	add	r0, r0, #48
	cmp	r0, r4
	bne	.L78
.L84:
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	bullets
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #20
	ldr	r0, [r0, #68]
	add	ip, sp, #36
	stm	ip, {r1, r2, r3}
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L88
.L90:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
.L89:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L96
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
.L88:
	ldr	r2, .L96+4
	ldr	r3, .L96+8
	ldr	r0, [r2]
	ldrh	r1, [r3]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L94:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L96+12
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L96+16
	mov	lr, pc
	bx	r3
	b	.L88
.L93:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L96+20
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L96+24
	mov	lr, pc
	bx	r3
	b	.L88
.L92:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L96+28
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L96+32
	mov	lr, pc
	bx	r3
	b	.L88
.L91:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L96+36
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L96+40
	mov	lr, pc
	bx	r3
	b	.L88
.L97:
	.align	2
.L96:
	.word	updateCrate
	.word	playerHOff
	.word	vOff
	.word	updateBeemon
	.word	animateBeemon
	.word	updateHeadMan
	.word	animateHeadMan
	.word	updateBeellet
	.word	animateBeellet
	.word	updateRatTank
	.word	animateRatTank
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #16
	add	r5, sp, #44
	cmp	r1, #0
	stm	r5, {r1, r2, r3}
	ble	.L98
	add	r6, r1, r1, lsl #2
	mov	r7, r1
	mov	r4, r0
	add	r6, r0, r6, lsl #4
	add	r8, sp, #56
	b	.L101
.L100:
	add	r4, r4, #80
	cmp	r4, r6
	beq	.L98
.L101:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L100
	ldm	r8, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	str	r7, [sp, #44]
	mov	r0, r4
	ldm	r5, {r1, r2, r3}
	add	r4, r4, #80
	bl	updateEnemy
	cmp	r4, r6
	bne	.L101
.L98:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	add	sp, sp, #16
	bx	lr
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateLootBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLootBox, %function
updateLootBox:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #16
	add	ip, sp, #52
	stm	ip, {r1, r2, r3}
	ldr	r6, [sp, #56]
	cmp	r6, #0
	ble	.L107
	mov	r4, r0
	mov	r10, #0
	ldr	r8, .L119
	ldr	r7, .L119+4
	ldr	r5, .L119+8
	ldr	r9, .L119+12
	add	r6, r0, r6, lsl #5
	b	.L112
.L109:
	ldr	r0, [r8]
	ldrh	r1, [r7]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L107
.L112:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	beq	.L109
	ldr	r1, [r4, #20]
	str	r1, [sp, #12]
	ldr	r0, [r4, #16]
	stm	sp, {r2, r3}
	str	r0, [sp, #8]
	ldr	r1, [r5, #8]
	add	r0, r5, #12
	ldm	r0, {r0, r2, r3}
	asr	r1, r1, #8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldreq	r2, [r4, #4]
	ldreq	r3, [r4]
	beq	.L109
.L110:
	str	r10, [r4, #24]
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #76]
	add	r2, r3, r2
	cmp	r2, #9
	str	r2, [r5, #76]
	movgt	r2, #9
	ldr	r1, [r5, #80]
	add	r3, r3, r1
	strgt	r2, [r5, #76]
	cmp	r3, #2
	movgt	r1, #2
	str	r3, [r5, #80]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	strgt	r1, [r5, #80]
	b	.L109
.L107:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	sp, sp, #16
	bx	lr
.L120:
	.align	2
.L119:
	.word	playerHOff
	.word	vOff
	.word	player
	.word	collision
	.size	updateLootBox, .-updateLootBox
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	push	{r4, r5, r6, lr}
	ldr	r4, .L133
	ldr	r5, [r4, #52]
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L133+4
	add	r3, r3, r3, lsl #16
	add	r3, r5, r3, lsl #1
	add	r2, r3, r2
	ldr	r3, .L133+8
	ldr	r6, [r4, #44]
	cmp	r3, r2, ror #2
	str	r6, [r4, #48]
	str	r1, [r4, #44]
	bcc	.L122
	ldr	r0, [r4, #36]
	ldr	r3, .L133+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L122:
	ldr	r3, .L133+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L123
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #44]
	bne	.L124
.L126:
	mov	r3, #1
	str	r3, [r4, #44]
.L124:
	add	r5, r5, #1
	str	r5, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L123:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L126
	mov	r3, #0
	str	r6, [r4, #44]
	str	r3, [r4, #36]
	str	r3, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	player
	.word	715827880
	.word	357913940
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	animateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateEnemy, %function
animateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #68]
	push	{r4, lr}
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L135
.L138:
	.word	.L141
	.word	.L140
	.word	.L139
	.word	.L137
.L137:
	ldr	r3, .L143
	mov	lr, pc
	bx	r3
.L135:
	pop	{r4, lr}
	bx	lr
.L141:
	ldr	r3, .L143+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L140:
	ldr	r3, .L143+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L139:
	ldr	r3, .L143+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L144:
	.align	2
.L143:
	.word	animateRatTank
	.word	animateBeemon
	.word	animateHeadMan
	.word	animateBeellet
	.size	animateEnemy, .-animateEnemy
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L154
	ldr	r2, [r3, #96]
	cmp	r2, #4
	beq	.L146
	cmp	r2, #5
	str	lr, [sp, #-4]!
	beq	.L147
	cmp	r2, #2
	beq	.L153
	ldr	lr, [sp], #4
	bx	lr
.L146:
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r3, #44]
	ldr	ip, [r3, #36]
	ldrb	r0, [r3]	@ zero_extendqisi2
	add	r3, r1, ip, lsl #4
	add	r3, r3, #191
	ldr	r1, .L154+4
	orr	r0, r0, #16384
	lsl	r3, r3, #2
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L153:
	ldr	r2, [r3, #4]
	ldr	lr, [r3, #36]
	ldr	r1, [r3, #44]
	lsl	r2, r2, #23
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r0, .L154+4
	add	r3, r1, lr, lsl #5
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	lsl	r3, r3, #1
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L147:
	ldr	r2, [r3, #4]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	ip, [r3, #36]
	ldr	r1, [r3, #44]
	ldr	lr, [r3, #20]
	ldr	r0, [r3]
	add	r3, r1, ip, lsl #5
	add	r3, r3, #129
	ldr	ip, .L154+4
	sub	r1, r0, lr
	and	r1, r1, #255
	lsl	r3, r3, #2
	strh	r2, [ip, #2]	@ movhi
	strh	r1, [ip]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L155:
	.align	2
.L154:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	fire
	.syntax unified
	.arm
	.fpu softvfp
	.type	fire, %function
fire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #1
	sub	sp, sp, #12
	beq	.L201
	cmp	r0, #3
	bne	.L156
	ldr	lr, .L206
	mov	r3, #0
	mov	r2, lr
	b	.L178
.L175:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #48
	beq	.L156
.L178:
	ldr	r0, [r2, #28]
	cmp	r0, #0
	bne	.L175
	ldr	r0, [r1, #48]
	cmp	r0, #1
	beq	.L202
	ldr	r2, .L206+4
	ldr	r2, [r2, #44]
	cmp	r2, #0
	moveq	ip, #2
	mvneq	r0, #2
	addeq	r2, r3, r3, lsl #1
	ldreq	r4, [r1, #20]
	addeq	r2, lr, r2, lsl #4
	streq	r4, [r2, #12]
	streq	ip, [r2, #44]
	streq	r0, [r2, #36]
	lsl	r2, r3, #1
.L177:
	mov	r5, #1
	mov	r4, #5
	mov	ip, #0
	ldr	r0, .L206+8
	add	r3, r2, r3
	ldr	r2, [r0]
	ldr	r1, [r1, #16]
	add	r3, lr, r3, lsl #4
	add	r2, r2, r5
	str	r1, [r3, #8]
	str	r5, [r3, #28]
	str	r4, [r3, #16]
	str	ip, [r3, #40]
	str	r2, [r0]
.L156:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L201:
	ldr	ip, .L206+4
	ldr	lr, [ip, #96]
	cmp	lr, #4
	beq	.L158
	cmp	lr, #5
	beq	.L159
	cmp	lr, #2
	bne	.L156
	ldr	lr, .L206
	mov	r3, #0
	mov	r2, lr
	b	.L165
.L161:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #48
	beq	.L156
.L165:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L161
	ldr	r2, [ip, #44]
	cmp	r2, #1
	beq	.L203
	cmp	r2, #2
	mvneq	r4, #3
	ldreq	r0, [ip, #12]
	addeq	r1, r3, r3, lsl #1
	addeq	r1, lr, r1, lsl #4
	addeq	r0, r0, #1
	streq	r0, [r1, #12]
	streq	r4, [r1, #36]
	streq	r2, [r1, #44]
	lsl	r2, r3, #1
.L163:
	mov	r6, #1
	mov	r5, #2
	b	.L200
.L202:
	mov	ip, #3
	add	r5, r1, #20
	ldmia	r5, {r4, r5}
	add	r4, r4, r5
	add	r2, r3, r3, lsl #1
	add	r2, lr, r2, lsl #4
	str	r4, [r2, #12]
	str	r0, [r2, #44]
	str	ip, [r2, #36]
	lsl	r2, r3, #1
	b	.L177
.L159:
	ldr	lr, .L206
	mov	r3, #0
	mov	r2, lr
	b	.L174
.L171:
	add	r3, r3, #1
	cmp	r3, #30
	add	r2, r2, #48
	beq	.L156
.L174:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L171
	ldr	r2, [ip, #44]
	cmp	r2, #1
	beq	.L204
	cmp	r2, #2
	mvneq	r4, #3
	ldreq	r0, [ip, #12]
	addeq	r1, r3, r3, lsl #1
	addeq	r1, lr, r1, lsl #4
	addeq	r0, r0, #1
	streq	r0, [r1, #12]
	streq	r4, [r1, #36]
	streq	r2, [r1, #44]
	lsl	r2, r3, #1
.L173:
	mov	r6, #1
	mov	r5, #5
.L200:
	mov	r4, #0
	ldr	r0, .L206+8
	ldr	r1, [ip, #8]
	add	r3, r2, r3
	ldr	r2, [r0]
	add	r3, lr, r3, lsl #4
	asr	r1, r1, #8
	add	r2, r2, r6
	str	r1, [r3, #8]
	str	r6, [r3, #28]
	str	r5, [r3, #16]
	str	r4, [r3, #40]
	str	r2, [r0]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L158:
	mov	r8, #0
	add	r2, ip, #12
	ldm	r2, {r2, r10}
	ldr	r9, [ip, #8]
	ldr	r4, .L206+8
	ldr	r3, .L206
	add	r10, r2, r10
	add	r2, r2, #1
	ldr	r5, [r4]
	mov	r1, r8
	ldr	r4, [ip, #44]
	mvn	fp, #3
	str	r2, [sp, #4]
	sub	r10, r10, #1
	asr	r9, r9, #8
	add	ip, r3, #1440
	b	.L169
.L166:
	add	r3, r3, #48
	cmp	r3, ip
	beq	.L205
.L169:
	ldr	r6, [r3, #28]
	cmp	r1, #2
	movgt	r2, #0
	movle	r2, #1
	cmp	r6, #0
	movne	r2, #0
	cmp	r2, #0
	beq	.L166
	cmp	r4, #1
	streq	r10, [r3, #12]
	streq	r4, [r3, #44]
	streq	lr, [r3, #36]
	add	r5, r5, #1
	add	r7, r1, #1
	beq	.L168
	cmp	r4, #2
	ldreq	r6, [sp, #4]
	streq	r4, [r3, #44]
	streq	r6, [r3, #12]
	streq	fp, [r3, #36]
.L168:
	sub	r6, r1, #1
	mov	r8, r2
	mov	r1, r7
	str	r6, [r3, #40]
	str	r0, [r3, #28]
	str	r9, [r3, #8]
	str	lr, [r3, #16]
	b	.L166
.L205:
	cmp	r8, #0
	ldrne	r3, .L206+8
	strne	r5, [r3]
	b	.L156
.L204:
	mov	r4, #4
	add	r1, ip, #12
	ldmia	r1, {r0, r1}
	add	r0, r0, r1
	add	r1, r3, r3, lsl #1
	add	r1, lr, r1, lsl r4
	sub	r0, r0, #1
	str	r2, [r1, #44]
	str	r0, [r1, #12]
	str	r4, [r1, #36]
	lsl	r2, r3, #1
	b	.L173
.L203:
	mov	r4, #4
	add	r1, ip, #12
	ldmia	r1, {r0, r1}
	add	r0, r0, r1
	add	r1, r3, r3, lsl #1
	add	r1, lr, r1, lsl r4
	sub	r0, r0, #1
	str	r2, [r1, #44]
	str	r0, [r1, #12]
	str	r4, [r1, #36]
	lsl	r2, r3, #1
	b	.L163
.L207:
	.align	2
.L206:
	.word	bullets
	.word	player
	.word	activeBullets
	.size	fire, .-fire
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r2, #512
	mov	r5, r2
	mov	r6, r0
	mov	r7, r1
	sub	sp, sp, #20
	ble	.L209
	ldr	r2, .L364
	ldrh	r3, [r2]
	cmp	r3, #256
	bls	.L210
	ldr	ip, .L364+4
	ldr	r1, [ip]
	cmp	r1, #30
	ble	.L352
.L209:
	ldr	r4, .L364+8
	ldr	r3, [r4, #92]
	ldr	r8, .L364+12
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #92]
	ldr	r3, [r8]
	ldr	r2, [r4, #8]
	cmp	r3, #0
	ldr	ip, [r4, #20]
	asr	r1, r2, #8
	beq	.L353
.L212:
	sub	r3, r7, #19
	cmp	r3, r1
	movle	r3, #0
	ldr	r0, [r4, #28]
	add	r0, r0, #100
	strle	r3, [r4, #76]
	strle	r3, [r4, #80]
	add	r2, r0, r2
	sub	r3, r7, ip
	cmp	r3, r2, asr #8
	str	r0, [r4, #28]
	asr	lr, r2, #8
	blt	.L216
	add	r3, lr, ip
	sub	r3, r3, #1
	mul	r3, r5, r3
	ldr	r8, [r4, #12]
	add	r1, r3, r8
	lsl	r1, r1, #1
	ldrh	r1, [r6, r1]
	cmp	r1, #0
	bne	.L354
.L216:
	mov	r3, #0
	ldr	r8, .L364+16
	str	r3, [r4, #32]
	str	r3, [r4, #28]
.L218:
	ldr	r9, .L364+20
	ldrh	r3, [r9]
	tst	r3, #64
	beq	.L219
	ldr	r2, .L364+24
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L355
.L219:
	ldr	r2, .L364+28
	ldrh	r1, [r2, #48]
	tst	r1, #32
	bne	.L220
	ldr	r1, [r4, #68]
	cmp	r1, #0
	bne	.L221
	ldr	r2, .L364+4
	ldr	r0, [r4, #24]
	ldr	r1, [r2]
	ldr	r2, [r4, #12]
	sub	r1, r1, #28
	sub	r2, r2, r0
	cmp	r2, r1, lsl #8
	blt	.L222
	ldr	r1, [r4, #8]
	asr	ip, r1, #8
	mla	ip, r5, ip, r2
	lsl	ip, ip, #1
	ldrh	ip, [r6, ip]
	cmp	ip, #0
	beq	.L222
	ldr	ip, [r4, #20]
	add	r1, r1, ip
	asr	r1, r1, #8
	mla	r1, r5, r1, r2
	lsl	r1, r1, #1
	ldrh	r1, [r6, r1]
	cmp	r1, #0
	strne	r2, [r4, #12]
.L222:
	ldr	r1, .L364
	ldrh	r2, [r1]
	cmp	r2, #0
	bne	.L223
.L350:
	ldr	r7, .L364+32
.L224:
	tst	r3, #2
	ldr	r1, [r4, #64]
	beq	.L226
	ldr	r2, .L364+24
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L226
	ldr	r2, [r4, #72]
	cmp	r2, r1
	blt	.L356
.L228:
	tst	r3, #1
	ldr	r0, [r4, #68]
	beq	.L232
	ldr	r2, .L364+24
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L232
	cmp	r0, #0
	bne	.L233
	ldr	r2, [r4, #96]
	cmp	r2, #2
	beq	.L357
.L234:
	tst	r3, #128
	beq	.L236
	ldr	r3, .L364+24
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L236
.L237:
	ldr	ip, .L364+36
	ldr	r2, [ip]
	ldr	r3, .L364+40
	add	r2, r2, #1
	smull	lr, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r2, r3
	str	r2, [ip]
	bne	.L239
	mov	ip, #2
	mov	lr, #20
	ldr	r3, [r4, #76]
	ldr	r2, [r4, #8]
	cmp	r0, #0
	str	lr, [r4, #72]
	str	ip, [r4, #96]
	str	ip, [r4, #24]
	str	r3, [r4, #88]
	ldr	r0, [r4, #12]
	ldr	r9, [r7]
	asr	lr, r2, #8
	bne	.L240
	add	r1, r1, #1
	str	r1, [r4, #64]
.L250:
	ldr	r3, [r4, #76]
	str	r3, [r4, #88]
	b	.L252
.L220:
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L350
	ldr	r2, [r4, #68]
	cmp	r2, #0
	bne	.L350
	add	r0, r4, #12
	ldm	r0, {r0, r2}
	add	r1, r0, r2
	sub	r2, r5, r2
	cmp	r1, r2
	bge	.L350
	ldr	ip, [r4, #24]
	ldr	r2, [r4, #8]
	add	r1, r1, ip
	sub	r1, r1, #1
	asr	lr, r2, #8
	mla	lr, r5, lr, r1
	lsl	lr, lr, #1
	ldrh	lr, [r6, lr]
	cmp	lr, #0
	beq	.L350
	ldr	lr, [r4, #20]
	add	r2, r2, lr
	asr	r2, r2, #8
	mla	r1, r5, r2, r1
	lsl	r1, r1, #1
	ldrh	r2, [r6, r1]
	cmp	r2, #0
	beq	.L350
	ldr	lr, .L364
	ldrh	r1, [lr]
	sub	r2, r5, #241
	add	r0, r0, ip
	cmp	r1, r2
	str	r0, [r4, #12]
	bge	.L350
	ldr	r2, [r4, #4]
	ldr	r7, .L364+32
	cmp	r2, #120
	ldrgt	r2, [r7]
	addgt	r1, r1, ip
	addgt	ip, r2, ip
	strhgt	r1, [lr]	@ movhi
	strgt	ip, [r7]
	b	.L224
.L226:
	ldr	r2, .L364+28
	ldrh	r2, [r2, #48]
	tst	r2, #2
	bne	.L228
	ldr	r2, [r4, #72]
	cmp	r2, r1
	bge	.L228
	b	.L356
.L232:
	ldr	r2, [r4, #60]
	cmp	r2, #9
	ble	.L234
	cmp	r0, #0
	beq	.L234
.L253:
	ldr	r2, [r4, #96]
	cmp	r2, #2
	bne	.L234
	mov	ip, #0
	ldr	r2, [r4, #24]
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	mov	r0, ip
	str	r2, [r4, #24]
	str	ip, [r4, #60]
	str	ip, [r4, #68]
	b	.L234
.L236:
	ldr	r3, [r4, #88]
	cmp	r3, #0
	ble	.L237
.L351:
	ldr	r2, [r4, #8]
	cmp	r0, #0
	ldr	ip, [r4, #96]
	ldr	r0, [r4, #12]
	ldr	r9, [r7]
	asr	lr, r2, #8
	beq	.L246
.L240:
	ldr	r3, [r4, #44]
	cmp	r3, #2
	beq	.L358
	cmp	r3, #1
	bne	.L249
	ldr	r3, [r4, #16]
	add	r10, r3, r0
	sub	r3, r5, r3
	cmp	r10, r3
	bge	.L249
	ldr	r3, [r4, #24]
	add	r10, r10, r3
	sub	r10, r10, #1
	mla	fp, r5, lr, r10
	lsl	fp, fp, #1
	ldrh	fp, [r6, fp]
	cmp	fp, #0
	bne	.L359
.L249:
	mov	r2, #0
	ldr	r3, [r4, #60]
	add	r3, r3, #1
	str	r3, [r4, #60]
	str	r2, [r4, #28]
.L246:
	add	r1, r1, #1
	cmp	ip, #2
	str	r1, [r4, #64]
	beq	.L250
	cmp	ip, #4
	bne	.L252
.L251:
	ldr	r3, [r4, #80]
	str	r3, [r4, #88]
.L252:
	ldrh	r3, [r8]
	sub	r0, r0, r9
	sub	r3, lr, r3
	str	r3, [r4]
	str	r0, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L356:
	ldr	r2, [r4, #88]
	cmp	r2, #0
	ble	.L228
	mov	r2, #0
	ldr	r3, [r4, #96]
	cmp	r3, #4
	str	r2, [r4, #64]
	beq	.L229
	cmp	r3, #5
	beq	.L230
	cmp	r3, #2
	beq	.L360
.L231:
	mov	r1, #0
	mov	r0, #1
	bl	fire
	mov	r1, #11008
	ldr	r3, .L364+44
	mov	r2, #0
	ldr	r0, .L364+48
	mov	lr, pc
	bx	r3
	ldrh	r3, [r9]
	ldr	r1, [r4, #64]
	b	.L228
.L239:
	cmp	r3, #1
	bne	.L361
	mov	r9, #50
	mov	lr, #2
	mov	ip, #4
	ldr	r3, [r4, #80]
	ldr	r2, [r4, #8]
	cmp	r0, #0
	str	r9, [r4, #72]
	str	lr, [r4, #24]
	str	ip, [r4, #96]
	str	r3, [r4, #88]
	ldr	r0, [r4, #12]
	ldr	r9, [r7]
	asr	lr, r2, #8
	bne	.L240
	add	r1, r1, #1
	str	r1, [r4, #64]
	b	.L251
.L221:
	ldrh	r2, [r2, #48]
	b	.L350
.L210:
	cmp	r3, #0
	bne	.L209
	ldr	r1, .L364+4
	ldr	r3, [r1]
	cmp	r3, #28
	ble	.L209
	mov	ip, #256
	mov	r0, #67108864
	sub	r3, r3, #1
	str	r3, [r1]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #8388608
	lsr	r3, r3, #16
	strh	ip, [r2]	@ movhi
	strh	r3, [r0, #8]	@ movhi
	b	.L209
.L355:
	ldr	r2, [r4, #32]
	cmp	r2, #0
	bne	.L219
	ldr	r2, [r4, #96]
	cmp	r2, #5
	beq	.L219
	mov	r1, #1
	ldr	r2, [r4, #28]
	sub	r2, r2, #1696
	sub	r2, r2, #4
	str	r2, [r4, #28]
	str	r1, [r4, #32]
	b	.L219
.L354:
	ldr	r1, [r4, #16]
	add	r1, r8, r1
	sub	r1, r1, #1
	add	r3, r3, r1
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	beq	.L216
	mul	lr, r5, lr
	add	r8, r8, lr
	lsl	r8, r8, #1
	ldrh	r3, [r6, r8]
	cmp	r3, #0
	beq	.L216
	add	lr, r1, lr
	lsl	lr, lr, #1
	ldrh	r3, [r6, lr]
	cmp	r3, #0
	beq	.L216
	ldr	r8, .L364+16
	cmp	r0, #0
	str	r2, [r4, #8]
	ldrh	r3, [r8]
	blt	.L362
	sub	r7, r7, #160
	cmp	r7, r3
	ble	.L218
	ldr	r2, [r4]
	add	ip, ip, r2
	cmp	ip, #140
	ble	.L218
	add	r3, r3, r0, asr #8
.L349:
	strh	r3, [r8]	@ movhi
	b	.L218
.L353:
	ldr	r9, .L364+52
	str	ip, [sp, #12]
	str	r1, [sp, #4]
	ldr	r10, [r4, #16]
	ldr	lr, [r4, #12]
	add	r2, r9, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r9, #8]
	ldr	r0, [r9, #12]
	str	r10, [sp, #8]
	str	lr, [sp]
	ldr	r10, .L364+56
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L348
	ldr	r3, [r9, #24]
	cmp	r3, #1
	str	r3, [r8]
	beq	.L214
.L348:
	ldr	r2, [r4, #8]
	ldr	ip, [r4, #20]
	asr	r1, r2, #8
	b	.L212
.L233:
	ldr	r2, [r4, #60]
	cmp	r2, #9
	bgt	.L253
	b	.L234
.L352:
	mov	lr, #67108864
	add	r0, r1, #1
	lsl	r1, r0, #24
	orr	r1, r1, #1073741824
	orr	r1, r1, #8388608
	lsr	r1, r1, #16
	sub	r3, r3, #256
	str	r0, [ip]
	strh	r3, [r2]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	b	.L209
.L223:
	ldr	ip, [r4, #4]
	ldr	r7, .L364+32
	cmp	ip, #119
	ldrle	ip, [r7]
	suble	r2, r2, r0
	suble	r0, ip, r0
	strhle	r2, [r1]	@ movhi
	strle	r0, [r7]
	b	.L224
.L361:
	cmp	r3, #2
	bne	.L351
	mov	r9, #1
	mov	ip, #5
	ldr	lr, [r4, #84]
	ldr	r2, [r4, #8]
	cmp	r0, #0
	str	r9, [r4, #24]
	str	lr, [r4, #88]
	str	r3, [r4, #72]
	str	ip, [r4, #96]
	ldr	r0, [r4, #12]
	ldr	r9, [r7]
	asr	lr, r2, #8
	bne	.L240
	add	r1, r1, #1
	str	r1, [r4, #64]
	b	.L252
.L358:
	ldr	r3, .L364+4
	ldr	fp, [r4, #24]
	ldr	r3, [r3]
	sub	r10, r0, fp
	sub	r3, r3, #28
	cmp	r10, r3, lsl #8
	blt	.L248
	mla	r3, r5, lr, r10
	lsl	r3, r3, #1
	ldrh	r3, [r6, r3]
	cmp	r3, #0
	bne	.L363
.L248:
	ldr	r2, .L364
	ldrh	r3, [r2]
	cmp	r3, #0
	beq	.L249
	ldr	r5, [r4, #4]
	cmp	r5, #119
	suble	r3, r3, fp
	suble	r9, r9, fp
	strhle	r3, [r2]	@ movhi
	strle	r9, [r7]
	b	.L249
.L363:
	ldr	r3, [r4, #20]
	add	r2, r2, r3
	asr	r2, r2, #8
	mla	r5, r2, r5, r10
	lsl	r5, r5, #1
	ldrh	r3, [r6, r5]
	cmp	r3, #0
	movne	r0, r10
	strne	r10, [r4, #12]
	b	.L248
.L357:
	ldr	r2, [r4, #32]
	cmp	r2, #0
	strne	r0, [r4, #28]
	mov	r0, #1
	mov	ip, #0
	ldr	r2, [r4, #24]
	lsl	r2, r2, r0
	str	r2, [r4, #24]
	str	ip, [r4, #60]
	str	r0, [r4, #68]
	b	.L234
.L359:
	ldr	fp, [r4, #20]
	add	r2, r2, fp
	asr	r2, r2, #8
	mla	r2, r5, r2, r10
	lsl	r2, r2, #1
	ldrh	r2, [r6, r2]
	cmp	r2, #0
	beq	.L249
	ldr	r10, .L364
	ldrh	r6, [r10]
	sub	r5, r5, #241
	add	r0, r0, r3
	cmp	r6, r5
	str	r0, [r4, #12]
	bge	.L249
	ldr	r2, [r4, #4]
	cmp	r2, #120
	addgt	r6, r6, r3
	addgt	r9, r9, r3
	strhgt	r6, [r10]	@ movhi
	strgt	r9, [r7]
	b	.L249
.L214:
	bl	changeLevel.part.0
	b	.L348
.L229:
	ldr	r3, [r4, #80]
	sub	r3, r3, #1
	str	r3, [r4, #80]
	b	.L231
.L230:
	ldr	r3, [r4, #84]
	sub	r3, r3, #1
	str	r3, [r4, #84]
	b	.L231
.L360:
	ldr	r3, [r4, #76]
	sub	r3, r3, #1
	str	r3, [r4, #76]
	b	.L231
.L362:
	adds	r3, r3, r0, asr #8
	bmi	.L218
	ldr	r2, [r4]
	cmp	r2, #29
	bgt	.L218
	b	.L349
.L365:
	.align	2
.L364:
	.word	hOff
	.word	screenBlock
	.word	player
	.word	stage
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	playerHOff
	.word	gunslot
	.word	1431655766
	.word	playSoundB
	.word	gunShot
	.word	stage1Exit
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L386
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L367
	cmp	r3, #1
	bne	.L366
	ldr	r5, .L386+4
	add	r1, r5, #16
	ldr	r0, .L386+8
	ldm	r1, {r1, r2}
	bl	updatePlayer
	ldr	r0, .L386+12
	ldr	r3, [r0, #28]
	cmp	r3, #0
	add	r4, r0, #1440
	bne	.L383
.L372:
	add	r0, r0, #48
	cmp	r0, r4
	beq	.L384
.L373:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L372
.L383:
	bl	updateBullet
	add	r0, r0, #48
	cmp	r0, r4
	bne	.L373
.L384:
	ldr	r4, .L386+16
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L386+20
	ldm	r5, {r1, r2, r3}
	bl	updateEnemies
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L386+24
	ldm	r5, {r1, r2, r3}
	bl	updateLootBox
.L366:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L367:
	ldr	r5, .L386+28
	add	r1, r5, #16
	ldr	r0, .L386+32
	ldm	r1, {r1, r2}
	bl	updatePlayer
	ldr	r0, .L386+12
	add	r4, r0, #1440
	b	.L371
.L370:
	add	r0, r0, #48
	cmp	r0, r4
	beq	.L385
.L371:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L370
	bl	updateBullet
	add	r0, r0, #48
	cmp	r0, r4
	bne	.L371
.L385:
	ldr	r4, .L386+36
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L386+40
	ldm	r5, {r1, r2, r3}
	bl	updateEnemies
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L386+44
	ldm	r5, {r1, r2, r3}
	bl	updateLootBox
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L387:
	.align	2
.L386:
	.word	stage
	.word	boss
	.word	gwl_BOSSCMBitmap
	.word	bullets
	.word	boss+12
	.word	bossEnemies
	.word	bossLoot
	.word	stage1
	.word	gwl_STAGE1CMBitmap
	.word	stage1+12
	.word	s1Enemies
	.word	s1Loot
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L398
	ldr	r2, .L398+4
	ldr	r1, [r3, #76]
	ldr	r3, .L398+8
	str	lr, [sp, #-4]!
	add	r2, r2, r1, lsl #3
	mov	lr, #192
	add	r0, r3, #1440
	b	.L391
.L389:
	ldrh	r1, [r2, #8]
	add	r3, r3, #48
	orr	r1, r1, #512
	cmp	r3, r0
	strh	r1, [r2, #8]	@ movhi
	add	r2, r2, #8
	beq	.L397
.L391:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L389
	ldr	r1, [r3, #4]
	sub	ip, r1, #1
	cmp	ip, #238
	bhi	.L389
	ldrb	ip, [r3]	@ zero_extendqisi2
	add	r3, r3, #48
	cmp	r3, r0
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L391
.L397:
	ldr	lr, [sp], #4
	bx	lr
.L399:
	.align	2
.L398:
	.word	player
	.word	shadowOAM
	.word	bullets
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	ip, sp, #36
	stmib	ip, {r0, r1, r2, r3}
	ldr	r6, [sp, #40]
	cmp	r6, #0
	ble	.L400
	mov	r7, #0
	ldr	r4, [sp, #64]
	ldr	fp, .L416
	ldr	r10, .L416+4
	ldr	r5, .L416+8
	ldr	r9, .L416+12
	ldr	r8, .L416+16
	b	.L410
.L402:
	ldr	r3, [fp, #76]
	ldr	r2, [r10]
	add	r3, r7, r3
	add	r3, r3, r2
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldrh	r2, [r5, r3]
	orr	r2, r2, #512
	strh	r2, [r5, r3]	@ movhi
.L403:
	add	r7, r7, #1
	cmp	r6, r7
	add	r4, r4, #80
	beq	.L400
.L410:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L402
	ldr	r3, [r4, #12]
	sub	r3, r3, #1
	cmp	r3, #238
	bhi	.L402
	ldr	r3, [r4, #68]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L403
.L405:
	.word	.L409
	.word	.L408
	.word	.L407
	.word	.L406
	.word	.L404
.L400:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	sp, sp, #16
	bx	lr
.L404:
	mov	r1, r7
	mov	r0, r4
	mov	lr, pc
	bx	r9
	b	.L403
.L409:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, .L416+20
	mov	lr, pc
	bx	r3
	b	.L403
.L408:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, .L416+24
	mov	lr, pc
	bx	r3
	b	.L403
.L407:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, .L416+28
	mov	lr, pc
	bx	r3
	b	.L403
.L406:
	mov	r1, r7
	mov	r0, r4
	mov	lr, pc
	bx	r8
	b	.L403
.L417:
	.align	2
.L416:
	.word	player
	.word	activeBullets
	.word	shadowOAM
	.word	drawCrate
	.word	drawRatTank
	.word	drawBeemon
	.word	drawHeadMan
	.word	drawBeellet
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawLootBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLootBox, %function
drawLootBox:
	@ Function supports interworking.
	@ args = 28, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, lr}
	add	ip, sp, #12
	stm	ip, {r1, r2, r3}
	ldr	r1, [sp, #16]
	cmp	r1, #0
	ldr	ip, [sp, #12]
	ble	.L418
	mov	r4, #128
	ldr	r2, .L426
	ldr	r3, .L426+4
	ldr	r2, [r2]
	ldr	r3, [r3, #76]
	add	r2, r2, r3
	ldr	r3, .L426+8
	add	r2, r2, ip
	ldr	lr, .L426+12
	add	r1, r0, r1, lsl #5
	add	r3, r3, r2, lsl #3
.L422:
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrne	r2, [r0, #12]
	ldrheq	r2, [r3, #8]
	ldrbne	ip, [r0, #8]	@ zero_extendqisi2
	andne	r2, r2, lr
	orrne	r2, r2, #16384
	orreq	r2, r2, #512
	add	r0, r0, #32
	strhne	r2, [r3, #10]	@ movhi
	strhne	ip, [r3, #8]	@ movhi
	strhne	r4, [r3, #12]	@ movhi
	strheq	r2, [r3, #8]	@ movhi
	cmp	r1, r0
	add	r3, r3, #8
	bne	.L422
.L418:
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
.L427:
	.align	2
.L426:
	.word	activeBullets
	.word	player
	.word	shadowOAM
	.word	511
	.size	drawLootBox, .-drawLootBox
	.align	2
	.global	changeLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeLevel, %function
changeLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L430
	ldr	r3, [r3]
	cmp	r3, #1
	bxne	lr
	b	changeLevel.part.0
.L431:
	.align	2
.L430:
	.word	stage
	.size	changeLevel, .-changeLevel
	.align	2
	.global	drawHealthBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealthBar, %function
drawHealthBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L452
	ldr	r3, [r1, #96]
	cmp	r3, #4
	push	{r4, lr}
	beq	.L433
	cmp	r3, #5
	beq	.L434
	cmp	r3, #2
	beq	.L451
.L432:
	pop	{r4, lr}
	bx	lr
.L433:
	ldr	r0, [r1, #76]
	cmp	r0, #0
	ble	.L432
	mov	r2, #0
	mov	r4, #193
	mov	lr, r2
	ldr	ip, [r1, #80]
	ldr	r1, .L452+4
.L443:
	cmp	ip, r2
	lsl	r3, r2, #3
	and	r3, r3, #504
	ldrhle	r3, [r1, #8]
	add	r2, r2, #1
	orrle	r3, r3, #512
	strhgt	lr, [r1, #8]	@ movhi
	strhgt	r3, [r1, #10]	@ movhi
	strhgt	r4, [r1, #12]	@ movhi
	strhle	r3, [r1, #8]	@ movhi
	cmp	r0, r2
	add	r1, r1, #8
	bne	.L443
	pop	{r4, lr}
	bx	lr
.L451:
	ldr	r0, [r1, #76]
	cmp	r0, #0
	ble	.L432
	mov	r2, #0
	mov	lr, #193
	mov	ip, r2
	ldr	r3, .L452+4
.L440:
	lsl	r1, r2, #3
	add	r2, r2, #1
	and	r1, r1, #504
	cmp	r2, r0
	strh	ip, [r3, #8]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	add	r3, r3, #8
	bne	.L440
	pop	{r4, lr}
	bx	lr
.L434:
	ldr	r0, [r1, #76]
	cmp	r0, #0
	ble	.L432
	mov	r2, #0
	mov	r4, #193
	mov	lr, r2
	ldr	ip, [r1, #80]
	ldr	r1, .L452+4
.L446:
	cmp	ip, r2
	lsl	r3, r2, #3
	and	r3, r3, #504
	ldrhle	r3, [r1, #8]
	add	r2, r2, #1
	orrle	r3, r3, #512
	strhgt	lr, [r1, #8]	@ movhi
	strhgt	r3, [r1, #10]	@ movhi
	strhgt	r4, [r1, #12]	@ movhi
	strhle	r3, [r1, #8]	@ movhi
	cmp	r2, r0
	add	r1, r1, #8
	bne	.L446
	pop	{r4, lr}
	bx	lr
.L453:
	.align	2
.L452:
	.word	player
	.word	shadowOAM
	.size	drawHealthBar, .-drawHealthBar
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L459
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L455
	cmp	r3, #1
	bne	.L457
	ldr	r4, .L459+4
	bl	drawPlayer
	bl	drawBullets
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r3, .L459+8
	stm	sp, {r0, r1}
	str	r3, [sp, #8]
	ldm	r4, {r0, r1, r2, r3}
	bl	drawEnemies
	add	r3, r4, #12
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L459+12
	ldm	r4, {r1, r2, r3}
	bl	drawLootBox
.L457:
	bl	drawHealthBar
	ldr	r3, .L459+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L459+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L459+24
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L459+28
	ldrh	r1, [r2]
	ldr	r2, .L459+32
	strh	r1, [r3, #16]	@ movhi
	ldrh	r2, [r2]
	strh	r2, [r3, #18]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L455:
	ldr	r4, .L459+36
	bl	drawPlayer
	bl	drawBullets
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r3, .L459+40
	stm	sp, {r0, r1}
	str	r3, [sp, #8]
	ldm	r4, {r0, r1, r2, r3}
	bl	drawEnemies
	add	r3, r4, #12
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L459+44
	ldm	r4, {r1, r2, r3}
	bl	drawLootBox
	b	.L457
.L460:
	.align	2
.L459:
	.word	stage
	.word	boss
	.word	bossEnemies
	.word	bossLoot
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	stage1
	.word	s1Enemies
	.word	s1Loot
	.size	drawGame, .-drawGame
	.comm	screenBlock,4,4
	.comm	playerHOff,4,4
	.comm	vOff,2,2
	.comm	hOff,2,2
	.global	bossEnemyTypes
	.global	bossEnemySpawns
	.comm	bossLoot,416,4
	.comm	bossEnemies,1040,4
	.comm	boss,24,4
	.comm	stage1Exit,28,4
	.global	s1EnemyTypes
	.global	s1EnemySpawns
	.comm	s1Loot,160,4
	.comm	s1Enemies,400,4
	.comm	stage1,24,4
	.comm	activeBullets,4,4
	.comm	gunslot,4,4
	.comm	bullets,1440,4
	.comm	player,100,4
	.comm	bossDefeated,4,4
	.comm	stage,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s1EnemyTypes, %object
	.size	s1EnemyTypes, 20
s1EnemyTypes:
	.word	0
	.word	0
	.word	0
	.word	4
	.word	4
	.type	s1EnemySpawns, %object
	.size	s1EnemySpawns, 40
s1EnemySpawns:
	.word	200
	.word	120
	.word	480
	.word	120
	.word	616
	.word	80
	.word	112
	.word	88
	.word	592
	.word	160
	.type	bossEnemyTypes, %object
	.size	bossEnemyTypes, 52
bossEnemyTypes:
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	2
	.word	3
	.word	4
	.word	4
	.type	bossEnemySpawns, %object
	.size	bossEnemySpawns, 104
bossEnemySpawns:
	.word	440
	.word	50
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	176
	.word	88
	.word	200
	.word	88
	.word	240
	.word	64
	.ident	"GCC: (devkitARM release 53) 9.1.0"
