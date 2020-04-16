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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #1024
	mov	lr, #20
	mov	fp, #3
	mov	r10, #4
	mov	r0, #80
	mov	ip, #256
	mov	r9, #512
	mov	r8, #16
	mov	r7, #40
	mov	r6, #712
	mov	r5, #24
	mov	r4, #1
	mov	r1, #10
	ldr	r2, .L4
	str	r3, [r2, #20]
	str	lr, [r2, #8]
	ldr	r3, .L4+4
	str	fp, [r2]
	str	r10, [r2, #4]
	str	r0, [r2, #12]
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
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #16
	mov	r4, #2
	mov	lr, #1
	mov	r9, #20
	mov	r8, #9
	mov	r7, #4
	mov	r6, #12
	mov	ip, #0
	add	r10, sp, #28
	stmib	r10, {r0, r1, r2, r3}
	ldr	r2, [sp, #44]
	ldr	r3, .L8
	lsl	r2, r2, #8
	str	r2, [r3, #8]
	str	r9, [r3, #72]
	ldr	r2, [sp, #40]
	str	r8, [r3, #76]
	str	r7, [r3, #40]
	str	r6, [r3, #52]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #84]
	str	r4, [r3, #24]
	str	lr, [r3, #32]
	str	lr, [r3, #44]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3, #12]
	str	ip, [r3, #68]
	str	ip, [r3, #60]
	str	ip, [r3, #28]
	str	ip, [r3, #36]
	str	ip, [r3, #64]
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
	mov	r2, #8
	mov	r0, #0
	ldr	r3, .L14
	add	r1, r3, #3072
	add	r1, r1, r2
.L11:
	str	r0, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #44
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
	add	ip, sp, #32
	stmib	ip, {r0, r1, r2, r3}
	ldr	r4, [sp, #36]
	cmp	r4, #0
	ldr	r5, [sp, #64]
	ble	.L17
	mov	r1, #0
	mov	lr, #4
	ldr	r2, [sp, #68]
	mov	r6, r1
	mov	r10, #12
	mov	ip, #1
	mov	r9, #16
	mov	r8, #3
	ldr	r3, [sp, #60]
	sub	r0, r2, #4
	add	r7, r5, lr
	b	.L21
.L24:
	mov	fp, #2
	str	ip, [r3, #64]
	str	r9, [r3, #28]
	str	r9, [r3, #24]
	str	r8, [r3, #60]
	str	lr, [r3, #44]
	str	r2, [r3, #40]
	str	fp, [r3, #48]
	str	r10, [r3, #56]
	str	ip, [r3, #32]
	str	ip, [r3, #72]
	str	r2, [r3]
	str	r8, [r3, #76]
.L20:
	add	r1, r1, #1
	cmp	r4, r1
	add	r3, r3, #80
	beq	.L17
.L21:
	ldr	r2, [r0, #4]!
	str	r2, [r3, #68]
	ldr	fp, [r5, r1, lsl #3]
	str	fp, [r3, #20]
	ldr	fp, [r7, r1, lsl #3]
	cmp	r2, #0
	str	fp, [r3, #16]
	beq	.L24
	cmp	r2, #1
	bne	.L20
	mov	fp, #64
	add	r1, r1, #1
	cmp	r4, r1
	str	r2, [r3, #64]
	str	fp, [r3, #28]
	str	fp, [r3, #24]
	str	lr, [r3, #60]
	str	lr, [r3, #44]
	str	r6, [r3, #40]
	str	r6, [r3, #48]
	str	r10, [r3, #56]
	str	r2, [r3, #36]
	str	r2, [r3, #72]
	str	r6, [r3]
	add	r3, r3, #80
	bne	.L21
.L17:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r0, #28
	mov	r4, #0
	mov	r3, #67108864
	mov	r2, #4352
	ldr	lr, .L33
	ldr	ip, .L33+4
	ldr	r1, .L33+8
	str	r4, [lr]
	str	r0, [r1]
	str	r4, [ip]
	sub	sp, sp, #24
	strh	r2, [r3]	@ movhi
	bl	initLevels
	mov	r2, #8
	mov	r1, #12
	mov	r7, #16
	mov	r6, #2
	mov	r5, #1
	mov	r10, #20
	mov	r9, #9
	mov	r8, #4
	mov	r0, r4
	ldr	lr, .L33+12
	ldr	r3, [lr, #12]
	ldr	ip, .L33+16
	lsl	r3, r3, r2
	str	r3, [ip, #8]
	ldr	r3, [lr, #8]
	str	r3, [ip, #12]
	ldr	r3, .L33+20
	str	r1, [ip, #52]
	str	r4, [ip, #68]
	add	r1, r3, #3072
	str	r4, [ip, #60]
	str	r4, [ip, #28]
	str	r4, [ip, #36]
	str	r4, [ip, #64]
	str	r10, [ip, #72]
	str	r9, [ip, #76]
	str	r8, [ip, #40]
	str	r7, [ip, #16]
	str	r7, [ip, #20]
	str	r6, [ip, #84]
	str	r6, [ip, #24]
	str	r5, [ip, #32]
	str	r5, [ip, #44]
	add	r1, r1, r2
.L26:
	str	r0, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L26
	ldr	r3, .L33+24
	ldm	r3, {r0, r1}
	ldr	ip, .L33+28
	ldr	r2, .L33+32
	ldr	r3, .L33+36
	stm	sp, {r0, r1}
	str	ip, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldm	lr, {r0, r1, r2, r3}
	bl	initEnemies
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L33+40
	add	r1, r3, #128
.L27:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L27
	mov	r1, #0
	mov	r2, #8
	ldr	r3, .L33+44
	add	r0, r3, #320
.L28:
	str	r1, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L28
	ldr	r2, .L33+48
	ldr	r3, .L33+52
	strh	r1, [r2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	stage
	.word	playerHOff
	.word	screenBlock
	.word	stage1
	.word	player
	.word	bullets
	.word	stage1+16
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	s1Enemies
	.word	s1Loot
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #256
	sub	sp, sp, #24
	ldr	r4, .L37
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L37+4
	mov	lr, pc
	bx	r4
	mov	r3, #3344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L37+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L37+12
	ldr	r1, .L37+16
	mov	lr, pc
	bx	r4
	mov	r1, #9
	mov	r0, #4
	mov	r8, #20
	mov	r7, #12
	mov	r4, #0
	mov	lr, #1
	mov	r6, #16
	mov	r5, #2
	ldr	r3, .L37+20
	ldr	r2, [r3, #12]
	ldr	ip, .L37+24
	lsl	r2, r2, #8
	str	r2, [ip, #8]
	ldr	r2, [r3, #8]
	str	r1, [ip, #76]
	str	r0, [ip, #40]
	ldr	r1, [r3, #20]
	ldr	r0, [r3, #16]
	str	r2, [ip, #12]
	ldr	r2, .L37+28
	str	r8, [ip, #72]
	stm	sp, {r0, r1}
	ldr	r0, .L37+32
	add	r1, r2, #24
	add	r2, r2, #28
	str	r7, [ip, #52]
	str	r0, [sp, #8]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r6, [ip, #16]
	ldm	r3, {r0, r1, r2, r3}
	str	r6, [ip, #20]
	str	r5, [ip, #84]
	str	r5, [ip, #24]
	str	r4, [ip, #68]
	str	r4, [ip, #60]
	str	r4, [ip, #28]
	str	r4, [ip, #36]
	str	r4, [ip, #64]
	str	lr, [ip, #32]
	str	lr, [ip, #44]
	bl	initEnemies
	mov	r2, #28
	ldr	ip, .L37+36
	ldr	r0, .L37+40
	ldr	r1, .L37+44
	ldr	r3, .L37+48
	strh	r4, [ip]	@ movhi
	str	r4, [r0]
	strh	r4, [r1]	@ movhi
	str	r2, [r3]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	DMANow
	.word	gwl_BOSSPal
	.word	gwl_BOSSTiles
	.word	100720640
	.word	gwl_BOSSMap
	.word	boss
	.word	player
	.word	.LANCHOR1
	.word	bossEnemies
	.word	hOff
	.word	playerHOff
	.word	vOff
	.word	screenBlock
	.size	changeLevel.part.0, .-changeLevel.part.0
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
	push	{r4, r5, lr}
	ldr	lr, [r0, #68]
	add	ip, sp, #16
	cmp	lr, #0
	stm	ip, {r1, r2, r3}
	bne	.L40
	mov	r3, #1
	mov	r1, #16
	mov	r2, #3
	mov	r5, #4
	mov	r4, #2
	mov	ip, #12
	str	lr, [r0, #40]
	str	lr, [r0]
	str	r3, [r0, #64]
	str	r3, [r0, #32]
	str	r3, [r0, #72]
	str	r1, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #60]
	str	r2, [r0, #76]
	str	r5, [r0, #44]
	str	r4, [r0, #48]
	str	ip, [r0, #56]
.L39:
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L40:
	cmp	lr, #1
	bne	.L39
	mov	r3, #0
	mov	r1, #64
	mov	r2, #4
	mov	ip, #12
	str	lr, [r0, #64]
	str	lr, [r0, #36]
	str	lr, [r0, #72]
	pop	{r4, r5, lr}
	str	r1, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #60]
	str	r2, [r0, #44]
	str	r3, [r0, #40]
	str	r3, [r0, #48]
	str	r3, [r0]
	str	ip, [r0, #56]
	add	sp, sp, #16
	bx	lr
	.size	initEnemy, .-initEnemy
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
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L49
	add	r1, r3, #128
.L44:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L44
	mov	r0, #0
	mov	r2, #8
	ldr	r3, .L49+4
	add	r1, r3, #320
.L45:
	str	r0, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L45
	bx	lr
.L50:
	.align	2
.L49:
	.word	s1Loot
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
	@ link register save eliminated.
	sub	sp, sp, #16
	add	ip, sp, #4
	stm	ip, {r1, r2, r3}
	ldr	r1, [sp, #8]
	cmp	r1, #0
	ble	.L51
	mov	ip, #1
	ldr	r3, [sp, #28]
	add	r1, r3, r1, lsl #5
.L54:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L53
	ldr	r2, [r0, #76]
	str	r2, [r3, #28]
	ldr	r2, [r0, #20]
	str	r2, [r3, #4]
	ldr	r2, [r0, #16]
	str	ip, [r3, #24]
	str	r2, [r3]
.L53:
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L54
.L51:
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
	@ link register save eliminated.
	add	r1, r0, #36
	ldm	r1, {r1, r2}
	ldr	r3, [r0, #12]
	cmp	r2, #1
	add	r3, r1, r3
	beq	.L61
	cmp	r2, #2
	bne	.L59
	cmp	r3, #0
	blt	.L60
.L59:
	ldr	r2, .L62
	ldr	r1, .L62+4
	ldrh	ip, [r2]
	ldr	r1, [r1]
	ldr	r2, [r0, #8]
	sub	r1, r3, r1
	sub	r2, r2, ip
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0]
	bx	lr
.L61:
	ldr	r2, [r0, #4]
	ldr	ip, [r0, #20]
	add	r2, r2, ip
	add	r1, r2, r1
	cmp	r1, #240
	ble	.L59
.L60:
	mov	r2, #0
	str	r2, [r0, #28]
	b	.L59
.L63:
	.align	2
.L62:
	.word	vOff
	.word	playerHOff
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
	ldr	r0, .L73
	push	{r4, lr}
	add	r4, r0, #3072
	add	r4, r4, #8
	b	.L66
.L65:
	add	r0, r0, #44
	cmp	r0, r4
	beq	.L72
.L66:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L65
	bl	updateBullet
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L66
.L72:
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
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
	ldr	r0, [r0, #68]
	sub	sp, sp, #20
	add	ip, sp, #36
	cmp	r0, #0
	stm	ip, {r1, r2, r3}
	beq	.L76
	cmp	r0, #1
	bne	.L75
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L80
	mov	r0, r4
	ldm	ip, {r1, r2, r3}
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L80+4
	mov	lr, pc
	bx	r3
.L75:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L76:
	add	r3, sp, #48
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r5, .L80+8
	ldm	ip, {r1, r2, r3}
	mov	r0, r4
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r3, .L80+12
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L81:
	.align	2
.L80:
	.word	updateBoss
	.word	animateBoss
	.word	updateBeemon
	.word	animateBeemon
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
	ble	.L82
	add	r6, r1, r1, lsl #2
	mov	r7, r1
	mov	r4, r0
	add	r6, r0, r6, lsl #4
	add	r8, sp, #56
	b	.L85
.L84:
	add	r4, r4, #80
	cmp	r4, r6
	beq	.L82
.L85:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L84
	ldm	r8, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	str	r7, [sp, #44]
	mov	r0, r4
	ldm	r5, {r1, r2, r3}
	add	r4, r4, #80
	bl	updateEnemy
	cmp	r4, r6
	bne	.L85
.L82:
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
	ble	.L91
	mov	r4, r0
	mov	r10, #0
	ldr	r8, .L103
	ldr	r7, .L103+4
	ldr	r5, .L103+8
	ldr	r9, .L103+12
	add	r6, r0, r6, lsl #5
	b	.L95
.L93:
	ldr	r0, [r8]
	ldrh	r1, [r7]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	add	r4, r4, #32
	cmp	r6, r4
	beq	.L91
.L95:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	beq	.L93
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
	strne	r10, [r4, #24]
	ldrne	r2, [r4, #28]
	ldrne	r3, [r5, #76]
	addne	r3, r3, r2
	strne	r3, [r5, #76]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	b	.L93
.L91:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	sp, sp, #16
	bx	lr
.L104:
	.align	2
.L103:
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
	ldr	r4, .L117
	ldr	r5, [r4, #52]
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L117+4
	add	r3, r3, r3, lsl #16
	add	r3, r5, r3, lsl #1
	add	r2, r3, r2
	ldr	r3, .L117+8
	ldr	r6, [r4, #44]
	cmp	r3, r2, ror #2
	str	r6, [r4, #48]
	str	r1, [r4, #44]
	bcc	.L106
	ldr	r0, [r4, #36]
	ldr	r3, .L117+12
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L106:
	ldr	r3, .L117+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L107
	mov	r2, #2
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #44]
	bne	.L108
.L110:
	mov	r3, #1
	str	r3, [r4, #44]
.L108:
	add	r5, r5, #1
	str	r5, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L110
	mov	r3, #0
	str	r6, [r4, #44]
	str	r3, [r4, #36]
	str	r3, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L118:
	.align	2
.L117:
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
	cmp	r3, #0
	push	{r4, lr}
	beq	.L120
	cmp	r3, #1
	ldreq	r3, .L124
	moveq	lr, pc
	bxeq	r3
.L119:
	pop	{r4, lr}
	bx	lr
.L120:
	ldr	r3, .L124+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	animateBoss
	.word	animateBeemon
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
	@ link register save eliminated.
	ldr	r1, .L127
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	lsl	r3, r3, #23
	ldr	r0, .L127+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L128:
	.align	2
.L127:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L137
	ldr	r0, [r4, #44]
	ldr	lr, .L137+4
	sub	ip, r0, #2
	mov	r3, #0
	mov	r2, lr
	bic	ip, ip, #2
	bic	r0, r0, #2
	b	.L133
.L131:
	cmp	ip, #0
	beq	.L136
.L130:
	add	r3, r3, #1
	cmp	r3, #70
	add	r2, r2, #44
	beq	.L129
.L133:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L130
	cmp	r0, #1
	bne	.L131
	mov	r1, #4
	add	r2, r3, r3, lsl #2
	add	r3, r3, r2, lsl #1
	add	lr, lr, r3, lsl #2
	add	ip, r4, #12
	ldmia	ip, {r2, ip}
	add	r2, r2, ip
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #84]
	sub	r2, r2, #1
	asr	r3, r3, #8
	str	r0, [lr, #28]
	str	r0, [lr, #40]
	str	r2, [lr, #12]
	str	r3, [lr, #8]
	str	ip, [lr, #16]
	str	r1, [lr, #36]
.L129:
	pop	{r4, r5, lr}
	bx	lr
.L136:
	mov	ip, #2
	mov	r5, #1
	mvn	r0, #3
	add	r2, r3, r3, lsl ip
	add	r3, r3, r2, lsl r5
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #8]
	add	r3, lr, r3, lsl ip
	ldr	lr, [r4, #84]
	add	r1, r1, r5
	asr	r2, r2, #8
	str	lr, [r3, #16]
	str	r5, [r3, #28]
	str	r1, [r3, #12]
	str	r2, [r3, #8]
	str	ip, [r3, #40]
	str	r0, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	player
	.word	bullets
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
	mov	r7, r0
	mov	r6, r1
	sub	sp, sp, #20
	bgt	.L140
	ldr	r8, .L216
.L141:
	ldr	r4, .L216+4
	ldr	r3, [r4, #80]
	ldr	r9, .L216+8
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #80]
	ldr	r3, [r9]
	ldr	r2, [r4, #8]
	cmp	r3, #0
	ldr	r0, [r4, #20]
	asr	r1, r2, #8
	beq	.L209
.L145:
	sub	r3, r6, #19
	cmp	r3, r1
	movle	r3, #0
	ldr	ip, [r4, #28]
	add	ip, ip, #100
	strle	r3, [r4, #76]
	add	r2, ip, r2
	sub	r3, r6, r0
	cmp	r3, r2, asr #8
	str	ip, [r4, #28]
	asr	lr, r2, #8
	blt	.L149
	add	r3, lr, r0
	sub	r3, r3, #1
	mul	r3, r5, r3
	ldr	r9, [r4, #12]
	add	r1, r3, r9
	lsl	r1, r1, #1
	ldrh	r1, [r7, r1]
	cmp	r1, #0
	bne	.L210
.L149:
	mov	r3, #0
	ldr	r9, .L216+12
	str	r3, [r4, #32]
	str	r3, [r4, #28]
.L151:
	ldr	r6, .L216+16
	ldrh	r0, [r6]
	tst	r0, #64
	beq	.L152
	ldr	r3, .L216+20
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L211
.L152:
	ldr	r3, .L216+24
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L153
	ldr	r3, .L216+28
	ldr	ip, [r4, #24]
	ldr	r3, [r3]
	ldr	r1, [r4, #12]
	sub	r3, r3, #28
	sub	r1, r1, ip
	cmp	r1, r3, lsl #8
	blt	.L154
	ldr	r3, [r4, #8]
	asr	r2, r3, #8
	mla	r2, r5, r2, r1
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	beq	.L154
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	asr	r3, r3, #8
	mla	r5, r3, r5, r1
	lsl	r5, r5, #1
	ldrh	r3, [r7, r5]
	cmp	r3, #0
	strne	r1, [r4, #12]
.L154:
	ldr	r2, .L216+32
	ldrh	r3, [r2]
	subs	r3, r3, ip
	bmi	.L156
	ldr	r1, [r4, #4]
	cmp	r1, #79
	ble	.L212
.L156:
	tst	r0, #2
	ldr	r1, [r4, #64]
	beq	.L158
	ldr	r3, .L216+20
	ldrh	r3, [r3]
	ands	r3, r3, #2
	beq	.L213
.L158:
	tst	r0, #1
	ldr	r3, [r4, #68]
	beq	.L159
	ldr	r2, .L216+20
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L159
	cmp	r3, #0
	bne	.L160
	mov	r3, #1
	ldr	r2, [r4, #24]
	lsl	r2, r2, #2
	str	r2, [r4, #24]
	str	r3, [r4, #68]
	b	.L161
.L159:
	ldr	r2, [r4, #60]
	cmp	r2, #9
	bgt	.L214
	cmp	r3, #0
	beq	.L164
.L166:
	ldr	r3, [r4, #60]
	add	r3, r3, #1
.L161:
	str	r3, [r4, #60]
.L164:
	ldrh	r2, [r9]
	ldr	r0, [r8]
	ldr	ip, [r4, #8]
	ldr	r3, [r4, #12]
	add	r1, r1, #1
	rsb	r2, r2, ip, asr #8
	sub	r3, r3, r0
	stm	r4, {r2, r3}
	str	r1, [r4, #64]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L153:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L156
	add	r1, r4, #12
	ldm	r1, {r1, r3}
	add	r2, r1, r3
	sub	r3, r5, r3
	cmp	r2, r3
	bge	.L156
	ldr	ip, [r4, #24]
	ldr	r3, [r4, #8]
	add	r2, r2, ip
	sub	r2, r2, #1
	asr	lr, r3, #8
	mla	lr, r5, lr, r2
	lsl	lr, lr, #1
	ldrh	lr, [r7, lr]
	cmp	lr, #0
	beq	.L156
	ldr	lr, [r4, #20]
	add	r3, r3, lr
	asr	r3, r3, #8
	mla	r2, r5, r3, r2
	lsl	r2, r2, #1
	ldrh	r3, [r7, r2]
	cmp	r3, #0
	beq	.L156
	ldr	r2, .L216+32
	ldrh	r3, [r2]
	sub	r5, r5, #241
	add	r1, r1, ip
	cmp	r3, r5
	str	r1, [r4, #12]
	bge	.L156
	ldr	r1, [r4, #4]
	cmp	r1, #120
	ble	.L156
	ldr	r1, .L216+28
	ldr	r1, [r1]
	cmp	r1, #30
	ldrle	r1, [r8]
	addle	r3, r3, ip
	addle	ip, r1, ip
	strhle	r3, [r2]	@ movhi
	strle	ip, [r8]
	b	.L156
.L214:
	cmp	r3, #0
	beq	.L164
.L165:
	mov	r3, #0
	mov	r2, #2
	str	r3, [r4, #60]
	str	r2, [r4, #24]
	str	r3, [r4, #68]
	b	.L164
.L210:
	ldr	r1, [r4, #16]
	add	r1, r9, r1
	sub	r1, r1, #1
	add	r3, r3, r1
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #0
	beq	.L149
	mul	lr, r5, lr
	add	r9, r9, lr
	lsl	r9, r9, #1
	ldrh	r3, [r7, r9]
	cmp	r3, #0
	beq	.L149
	add	r1, r1, lr
	lsl	r1, r1, #1
	ldrh	r3, [r7, r1]
	cmp	r3, #0
	beq	.L149
	ldr	r9, .L216+12
	cmp	ip, #0
	str	r2, [r4, #8]
	ldrh	r3, [r9]
	blt	.L215
	sub	r6, r6, #160
	cmp	r6, r3
	ble	.L151
	ldr	r2, [r4]
	add	r0, r0, r2
	cmp	r0, #140
	ble	.L151
	add	r3, r3, ip, asr #8
.L208:
	strh	r3, [r9]	@ movhi
	b	.L151
.L211:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L152
	mov	r2, #1
	ldr	r3, [r4, #28]
	sub	r3, r3, #1696
	sub	r3, r3, #4
	str	r3, [r4, #28]
	str	r2, [r4, #32]
	b	.L152
.L213:
	ldr	r2, [r4, #72]
	cmp	r2, r1
	bge	.L158
	ldr	r2, [r4, #76]
	cmp	r2, #0
	ble	.L158
	sub	r2, r2, #1
	str	r2, [r4, #76]
	str	r3, [r4, #64]
	bl	fire
	ldrh	r0, [r6]
	ldr	r1, [r4, #64]
	b	.L158
.L140:
	ldr	r2, .L216+32
	ldrh	r3, [r2]
	cmp	r3, #256
	bls	.L142
	ldr	ip, .L216+28
	ldr	r1, [ip]
	cmp	r1, #30
	bgt	.L142
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
.L142:
	ldr	r8, .L216
	ldr	r3, [r8]
	cmp	r3, #512
	subgt	r3, r3, #512
	strgt	r3, [r8]
	b	.L141
.L209:
	ldr	r10, .L216+36
	add	ip, r4, #12
	ldm	ip, {ip, lr}
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	add	r2, r10, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r10, #8]
	ldr	r0, [r10, #12]
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	fp, .L216+40
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L207
	ldr	r3, [r10, #24]
	cmp	r3, #1
	str	r3, [r9]
	beq	.L147
.L207:
	ldr	r2, [r4, #8]
	ldr	r0, [r4, #20]
	asr	r1, r2, #8
	b	.L145
.L212:
	ldr	r1, [r8]
	sub	ip, r1, ip
	strh	r3, [r2]	@ movhi
	str	ip, [r8]
	b	.L156
.L160:
	ldr	r3, [r4, #60]
	cmp	r3, #9
	bgt	.L165
	b	.L166
.L147:
	bl	changeLevel.part.0
	b	.L207
.L215:
	adds	r3, r3, ip, asr #8
	bmi	.L151
	ldr	r2, [r4]
	cmp	r2, #29
	bgt	.L151
	b	.L208
.L217:
	.align	2
.L216:
	.word	playerHOff
	.word	player
	.word	stage
	.word	vOff
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	screenBlock
	.word	hOff
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
	ldr	r3, .L238
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L219
	cmp	r3, #1
	bne	.L218
	ldr	r5, .L238+4
	add	r1, r5, #16
	ldr	r0, .L238+8
	ldm	r1, {r1, r2}
	bl	updatePlayer
	ldr	r0, .L238+12
	ldr	r3, [r0, #28]
	add	r4, r0, #3072
	cmp	r3, #0
	add	r4, r4, #8
	bne	.L235
.L224:
	add	r0, r0, #44
	cmp	r0, r4
	beq	.L236
.L225:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L224
.L235:
	bl	updateBullet
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L225
.L236:
	ldr	r3, .L238+16
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L238+20
	ldm	r5, {r1, r2, r3}
	bl	updateEnemies
.L218:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L219:
	ldr	r5, .L238+24
	add	r1, r5, #16
	ldr	r0, .L238+28
	ldm	r1, {r1, r2}
	bl	updatePlayer
	ldr	r0, .L238+12
	add	r4, r0, #3072
	add	r4, r4, #8
	b	.L223
.L222:
	add	r0, r0, #44
	cmp	r0, r4
	beq	.L237
.L223:
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L222
	bl	updateBullet
	add	r0, r0, #44
	cmp	r0, r4
	bne	.L223
.L237:
	ldr	r4, .L238+32
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L238+36
	ldm	r5, {r1, r2, r3}
	bl	updateEnemies
	ldm	r4, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L238+40
	ldm	r5, {r1, r2, r3}
	bl	updateLootBox
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L239:
	.align	2
.L238:
	.word	stage
	.word	boss
	.word	gwl_BOSSCMBitmap
	.word	bullets
	.word	boss+12
	.word	bossEnemies
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
	push	{r4, lr}
	mov	r4, #192
	ldr	r3, .L246
	ldr	r2, .L246+4
	add	r0, r3, #3072
	ldr	lr, .L246+8
	add	r0, r0, #8
.L243:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	ldrne	r1, [r3, #4]
	ldrheq	r1, [r2, #8]
	ldrbne	ip, [r3]	@ zero_extendqisi2
	andne	r1, r1, lr
	orreq	r1, r1, #512
	add	r3, r3, #44
	strhne	r4, [r2, #12]	@ movhi
	strhne	r1, [r2, #10]	@ movhi
	strhne	ip, [r2, #8]	@ movhi
	strheq	r1, [r2, #8]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L243
	pop	{r4, lr}
	bx	lr
.L247:
	.align	2
.L246:
	.word	bullets
	.word	shadowOAM
	.word	511
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	ip, sp, #28
	stmib	ip, {r0, r1, r2, r3}
	ldr	r9, [sp, #32]
	cmp	r9, #0
	ble	.L248
	mov	r5, #0
	ldr	r4, [sp, #56]
	ldr	r8, .L260
	ldr	r7, .L260+4
	ldr	r6, .L260+8
	b	.L254
.L250:
	lsl	r2, r5, #3
	ldrh	r3, [r2, r8]
	orr	r3, r3, #512
	strh	r3, [r2, r8]	@ movhi
.L253:
	add	r5, r5, #1
	cmp	r9, r5
	add	r4, r4, #80
	beq	.L248
.L254:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L250
	ldr	r3, [r4, #12]
	sub	r3, r3, #1
	cmp	r3, #238
	bhi	.L250
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L251
	cmp	r3, #1
	bne	.L253
	mov	r1, r5
	mov	r0, r4
	add	r5, r5, #1
	mov	lr, pc
	bx	r6
	cmp	r9, r5
	add	r4, r4, #80
	bne	.L254
.L248:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	add	sp, sp, #16
	bx	lr
.L251:
	mov	r1, r5
	mov	r0, r4
	mov	lr, pc
	bx	r7
	b	.L253
.L261:
	.align	2
.L260:
	.word	shadowOAM+568
	.word	drawBeemon
	.word	drawBoss
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
	ldr	r2, [sp, #12]
	ble	.L262
	mov	r4, #128
	ldr	r3, .L270
	add	r2, r2, #71
	ldr	lr, .L270+4
	add	r1, r0, r1, lsl #5
	add	r3, r3, r2, lsl #3
.L266:
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrne	r2, [r0, #12]
	ldrheq	r2, [r3]
	ldrbne	ip, [r0, #8]	@ zero_extendqisi2
	andne	r2, r2, lr
	orrne	r2, r2, #16384
	orreq	r2, r2, #512
	add	r0, r0, #32
	strhne	r2, [r3, #2]	@ movhi
	strhne	ip, [r3]	@ movhi
	strhne	r4, [r3, #4]	@ movhi
	strheq	r2, [r3]	@ movhi
	cmp	r1, r0
	add	r3, r3, #8
	bne	.L266
.L262:
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
.L271:
	.align	2
.L270:
	.word	shadowOAM
	.word	511
	.size	drawLootBox, .-drawLootBox
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
	ldr	r3, .L277
	ldr	r3, [r3]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L273
	cmp	r3, #1
	bne	.L275
	ldr	r1, .L277+4
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	lsl	r3, r3, #23
	ldr	r0, .L277+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsr	r3, r3, #23
	ldr	r4, .L277+12
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bl	drawBullets
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r3, .L277+16
	stm	sp, {r0, r1}
	str	r3, [sp, #8]
	ldm	r4, {r0, r1, r2, r3}
	bl	drawEnemies
	add	r3, r4, #12
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L277+20
	ldm	r4, {r1, r2, r3}
	bl	drawLootBox
.L275:
	ldr	r3, .L277+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L277+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L277+8
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L277+32
	ldrh	r1, [r2]
	ldr	r2, .L277+36
	strh	r1, [r3, #16]	@ movhi
	ldrh	r2, [r2]
	strh	r2, [r3, #18]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L273:
	ldr	r1, .L277+4
	ldr	r3, [r1, #4]
	ldr	ip, [r1, #36]
	ldr	r2, [r1, #44]
	lsl	r3, r3, #23
	ldr	r0, .L277+8
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsr	r3, r3, #23
	ldr	r4, .L277+40
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bl	drawBullets
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r3, .L277+44
	stm	sp, {r0, r1}
	str	r3, [sp, #8]
	ldm	r4, {r0, r1, r2, r3}
	bl	drawEnemies
	add	r3, r4, #12
	ldm	r3, {r0, r1, r2}
	stm	sp, {r0, r1, r2}
	ldr	r0, .L277+48
	ldm	r4, {r1, r2, r3}
	bl	drawLootBox
	b	.L275
.L278:
	.align	2
.L277:
	.word	stage
	.word	player
	.word	shadowOAM
	.word	boss
	.word	bossEnemies
	.word	bossLoot
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.word	stage1
	.word	s1Enemies
	.word	s1Loot
	.size	drawGame, .-drawGame
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
	ldr	r3, .L281
	ldr	r3, [r3]
	cmp	r3, #1
	bxne	lr
	b	changeLevel.part.0
.L282:
	.align	2
.L281:
	.word	stage
	.size	changeLevel, .-changeLevel
	.comm	screenBlock,4,4
	.comm	playerHOff,4,4
	.comm	vOff,2,2
	.comm	hOff,2,2
	.global	bossEnemyTypes
	.global	bossEnemySpawns
	.comm	bossLoot,320,4
	.comm	bossEnemies,800,4
	.comm	boss,24,4
	.comm	stage1Exit,28,4
	.global	s1EnemyTypes
	.global	s1EnemySpawns
	.comm	s1Loot,128,4
	.comm	s1Enemies,240,4
	.comm	stage1,24,4
	.comm	bullets,3080,4
	.comm	player,88,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	bossDefeated,4,4
	.comm	stage,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	s1EnemySpawns, %object
	.size	s1EnemySpawns, 24
s1EnemySpawns:
	.word	200
	.word	120
	.word	480
	.word	120
	.word	616
	.word	80
	.type	bossEnemyTypes, %object
	.size	bossEnemyTypes, 4
bossEnemyTypes:
	.word	1
	.type	bossEnemySpawns, %object
	.size	bossEnemySpawns, 8
bossEnemySpawns:
	.word	400
	.word	50
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s1EnemyTypes, %object
	.size	s1EnemyTypes, 12
s1EnemyTypes:
	.space	12
	.ident	"GCC: (devkitARM release 53) 9.1.0"
