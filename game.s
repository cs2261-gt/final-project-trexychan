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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r0, #20
	mov	r7, #120
	mov	r6, #9
	mov	r5, #4
	mov	r4, #2
	mov	lr, #12
	mov	r1, #16
	mov	ip, #1
	ldr	r3, .L4
	str	r7, [r3, #8]
	str	r6, [r3, #80]
	str	r5, [r3, #44]
	str	r4, [r3, #24]
	str	lr, [r3, #56]
	str	r0, [r3, #12]
	str	r0, [r3, #76]
	str	ip, [r3, #36]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #88]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #60]
	str	r2, [r3, #68]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	mov	r0, #28
	mov	r3, #67108864
	mov	r2, #4352
	ldr	r1, .L10
	ldr	ip, .L10+4
	str	r4, [r1]
	ldr	r1, .L10+8
	str	r4, [ip]
	str	r0, [r1]
	strh	r2, [r3]	@ movhi
	bl	initPlayer
	mov	r1, r4
	mov	r2, #8
	ldr	r3, .L10+12
	add	r0, r3, #2000
.L7:
	str	r1, [r3, #24]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L7
	mov	ip, #1
	mov	r4, #16
	mov	lr, #3
	mov	r8, #200
	mov	r7, #120
	mov	r6, #4
	mov	r5, #6
	mov	r0, #12
	ldr	r3, .L10+16
	str	r8, [r3, #16]
	str	r1, [r3]
	str	r7, [r3, #12]
	str	r6, [r3, #40]
	str	r5, [r3, #44]
	str	r0, [r3, #52]
	str	ip, [r3, #60]
	ldr	r0, .L10+20
	str	ip, [r3, #28]
	str	ip, [r3, #68]
	str	r4, [r3, #24]
	str	r4, [r3, #20]
	str	lr, [r3, #56]
	str	lr, [r3, #72]
	str	r1, [r3, #64]
	str	r1, [r3, #36]
	ldr	ip, .L10+24
	ldr	r3, .L10+28
	str	r1, [r0, #24]
	str	r2, [r0, #20]
	str	r2, [r0, #16]
	strh	r1, [ip]	@ movhi
	strh	r1, [r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	stage
	.word	playerHOff
	.word	screenBlock
	.word	minigunMag
	.word	s1Enemies
	.word	s1Loot
	.word	hOff
	.word	vOff
	.size	initGame, .-initGame
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
	ldr	r3, .L16
	add	r1, r3, #2000
.L13:
	str	r0, [r3, #24]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L13
	bx	lr
.L17:
	.align	2
.L16:
	.word	minigunMag
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
	str	r3, [r0, #16]
	str	r2, [r0, #24]
	str	r3, [r0, #20]
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r1, #0
	mov	r2, #1
	mov	r7, #200
	mov	r6, #120
	mov	r5, #4
	mov	r4, #6
	mov	lr, #12
	mov	ip, #16
	mov	r0, #3
	ldr	r3, .L21
	str	r7, [r3, #16]
	str	r6, [r3, #12]
	str	r5, [r3, #40]
	str	r4, [r3, #44]
	str	lr, [r3, #52]
	str	r1, [r3, #64]
	str	r1, [r3, #36]
	str	r1, [r3]
	str	r2, [r3, #60]
	str	r2, [r3, #28]
	str	r2, [r3, #68]
	str	ip, [r3, #24]
	str	ip, [r3, #20]
	str	r0, [r3, #56]
	str	r0, [r3, #72]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	s1Enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #64]
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, lr}
	mov	r2, #1
	mov	r7, #200
	mov	r6, #120
	mov	ip, #16
	mov	r1, #3
	mov	r5, #4
	mov	r4, #6
	mov	lr, #12
	str	r7, [r0, #16]
	str	r6, [r0, #12]
	str	r5, [r0, #40]
	str	r4, [r0, #44]
	str	lr, [r0, #52]
	str	r3, [r0, #36]
	str	r3, [r0]
	str	r2, [r0, #60]
	str	r2, [r0, #28]
	str	r2, [r0, #68]
	str	ip, [r0, #24]
	str	ip, [r0, #20]
	str	r1, [r0, #56]
	str	r1, [r0, #72]
	pop	{r4, r5, r6, r7, lr}
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
	mov	r2, #8
	mov	r1, #0
	ldr	r3, .L30
	str	r1, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	bx	lr
.L31:
	.align	2
.L30:
	.word	s1Loot
	.size	initLootBoxes, .-initLootBoxes
	.align	2
	.global	initLootBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLootBox, %function
initLootBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #8
	mov	r2, #0
	str	r3, [r0, #20]
	str	r2, [r0, #24]
	str	r3, [r0, #16]
	bx	lr
	.size	initLootBox, .-initLootBox
	.align	2
	.global	spawnEnemyLoot
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemyLoot, %function
spawnEnemyLoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bxne	lr
	mov	ip, #1
	add	r1, r0, #12
	str	lr, [sp, #-4]!
	ldr	r2, [r0, #72]
	ldm	r1, {r1, lr}
	str	ip, [r3, #24]
	str	lr, [r3, #4]
	str	r1, [r3]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	s1Loot
	.size	spawnEnemyLoot, .-spawnEnemyLoot
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
	ldr	r1, [r0, #36]
	ldr	ip, [r0, #32]
	ldr	r3, [r0, #12]
	cmp	r1, #0
	add	r3, ip, r3
	bne	.L42
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #16]
	add	r2, r2, r1
	add	r2, r2, ip
	cmp	r2, #240
	ble	.L43
.L44:
	mov	r2, #0
	str	r2, [r0, #24]
.L43:
	ldr	r2, .L45
	ldr	r1, .L45+4
	ldrh	ip, [r2]
	ldrh	r1, [r1]
	ldr	r2, [r0, #8]
	sub	r1, r3, r1
	sub	r2, r2, ip
	str	r3, [r0, #12]
	str	r1, [r0, #4]
	str	r2, [r0]
	bx	lr
.L42:
	cmp	r1, #1
	bne	.L43
	cmp	r3, #0
	bge	.L43
	b	.L44
.L46:
	.align	2
.L45:
	.word	vOff
	.word	hOff
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
	ldr	r0, .L56
	push	{r4, lr}
	add	r4, r0, #2000
	b	.L49
.L48:
	add	r0, r0, #40
	cmp	r0, r4
	beq	.L55
.L49:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L48
	bl	updateBullet
	add	r0, r0, #40
	cmp	r0, r4
	bne	.L49
.L55:
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	minigunMag
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateLootBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLootBox, %function
updateLootBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L68
	ldr	r3, [r4, #24]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L58
	ldr	r5, .L68+4
	add	r6, r4, #16
	ldm	r6, {r6, r7}
	ldr	lr, [r4]
	ldr	ip, [r4, #4]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #8]
	str	r6, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r0, [r5, #12]
	str	r7, [sp, #12]
	ldr	r6, .L68+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L60
	mov	r2, #0
	ldr	r3, [r5, #80]
	ldr	r1, [r4, #28]
	add	r3, r3, r1
	str	r3, [r5, #80]
	str	r2, [r4, #24]
.L60:
	ldr	r2, .L68+12
	ldr	r3, .L68+16
	ldrh	r0, [r2]
	ldrh	r1, [r3]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #12]
	str	r3, [r4, #8]
.L58:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	s1Loot
	.word	player
	.word	collision
	.word	hOff
	.word	vOff
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
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L82
	ldr	r5, [r4, #56]
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl r1
	add	r3, r3, r3, lsl #8
	ldr	r2, .L82+4
	add	r3, r3, r3, lsl #16
	add	r3, r5, r3, lsl #1
	add	r2, r3, r2
	ldr	r3, .L82+8
	ldr	r6, [r4, #48]
	cmp	r3, r2, ror #2
	str	r6, [r4, #52]
	str	r1, [r4, #48]
	bcc	.L71
	ldr	r0, [r4, #40]
	ldr	r3, .L82+12
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L71:
	ldr	r3, .L82+16
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L72
	mov	r2, #1
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #48]
	bne	.L73
.L75:
	mov	r3, #0
	str	r3, [r4, #48]
.L73:
	add	r5, r5, #1
	str	r5, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L75
	mov	r3, #0
	str	r6, [r4, #48]
	str	r3, [r4, #40]
	str	r3, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	.align	2
.L82:
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
	push	{r4, r5, r6, lr}
	ldr	r5, [r0, #52]
	add	r3, r5, r5, lsl #2
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r2, .L92
	add	r3, r3, r3, lsl #16
	ldr	r1, .L92+4
	add	r3, r5, r3, lsl #1
	add	r2, r3, r2
	cmp	r1, r2, ror #2
	mov	r4, r0
	bcc	.L85
	ldr	r0, [r0, #36]
	ldr	r3, .L92+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L85:
	ldr	r3, [r4]
	cmp	r3, #39
	ble	.L91
	ldr	r2, [r4, #44]
	cmp	r2, #5
	moveq	r2, #6
	moveq	r3, #1
	streq	r2, [r4, #44]
	beq	.L87
	cmp	r2, #6
	beq	.L89
.L91:
	add	r3, r3, #1
.L87:
	add	r5, r5, #1
	str	r5, [r4, #52]
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	mov	r2, #5
	mov	r3, #1
	str	r2, [r4, #44]
	b	.L87
.L93:
	.align	2
.L92:
	.word	715827880
	.word	357913940
	.word	__aeabi_idivmod
	.size	animateEnemy, .-animateEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r0, #44]
	cmp	r3, #5
	mov	r5, r0
	sub	sp, sp, #16
	ldr	r0, [r0, #16]
	beq	.L114
	cmp	r3, #6
	ldreq	r3, [r5, #28]
	subeq	r0, r0, r3
	streq	r0, [r5, #16]
.L96:
	ldr	r4, .L118
	add	r1, r4, #16
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldm	r1, {r1, ip}
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #20
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #12]
	ldr	r7, .L118+4
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L97
	ldr	r3, [r4, #84]
	cmp	r3, #0
	beq	.L115
.L97:
	ldr	r4, .L118+8
	mov	r9, #0
	mov	r10, #1
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	ldr	r8, .L118+12
	add	r6, r4, #2000
	b	.L102
.L98:
	add	r4, r4, #40
	cmp	r6, r4
	beq	.L116
.L102:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L98
	ldr	r0, [r5, #24]
	ldr	r3, [r5, #20]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L99
	ldr	r3, [r5, #56]
	cmp	r3, #1
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	ble	.L117
.L100:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L98
	ldr	r0, [r5, #24]
	ldr	r3, [r5, #20]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L101
	add	r4, r4, #40
	cmp	r6, r4
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	bne	.L102
.L116:
	ldr	r0, .L118+16
	ldrh	r0, [r0]
	sub	r1, r1, r0
	mov	r0, r5
	ldr	r3, .L118+20
	ldrh	r3, [r3]
	sub	r2, r2, r3
	str	r1, [r5, #8]
	str	r2, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animateEnemy
.L99:
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	b	.L100
.L101:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	subgt	r3, r3, #1
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #12]
	strgt	r3, [r5, #56]
	strgt	r9, [r4, #24]
	b	.L98
.L117:
	ldr	r3, [r8, #24]
	cmp	r3, #0
	str	r9, [r5, #60]
	str	r9, [r4, #24]
	bne	.L98
	ldr	r3, [r5, #72]
	str	r1, [r8, #4]
	str	r2, [r8]
	str	r10, [r8, #24]
	str	r3, [r8, #28]
	b	.L98
.L115:
	mov	r2, #50
	ldr	r1, [r5, #68]
	ldr	r3, [r4, #80]
	sub	r3, r3, r1
	str	r3, [r4, #80]
	str	r2, [r4, #84]
	b	.L97
.L114:
	ldr	r3, [r5, #28]
	add	r0, r0, r3
	str	r0, [r5, #16]
	b	.L96
.L119:
	.align	2
.L118:
	.word	player
	.word	collision
	.word	minigunMag
	.word	s1Loot
	.word	hOff
	.word	vOff
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L122
	ldr	r3, [r0, #60]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy
.L123:
	.align	2
.L122:
	.word	s1Enemies
	.size	updateEnemies, .-updateEnemies
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
	ldr	r1, .L125
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #48]
	ldr	ip, [r1, #40]
	lsl	r2, r2, #23
	add	r3, r3, #1
	ldr	r0, .L125+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	add	r3, r3, ip, lsl #5
	orr	r2, r2, #16384
	lsl	r3, r3, #1
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L126:
	.align	2
.L125:
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
	ldr	ip, .L136
	mov	r3, #0
	mov	r2, ip
	push	{r4, lr}
	ldr	lr, .L136+4
	ldr	r0, [lr, #48]
.L131:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L128
	cmp	r0, #0
	beq	.L134
	cmp	r0, #1
	beq	.L135
.L128:
	add	r3, r3, #1
	cmp	r3, #50
	add	r2, r2, #40
	bne	.L131
	pop	{r4, lr}
	bx	lr
.L134:
	mov	r4, #1
	mov	r1, #4
	add	r3, r3, r3, lsl #2
	add	r3, ip, r3, lsl #3
	add	ip, lr, #12
	ldmia	ip, {r2, ip}
	add	r2, r2, ip
	ldr	ip, [lr, #8]
	sub	r2, r2, #1
	str	r4, [r3, #24]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	ip, [r3, #8]
	str	r1, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L135:
	mvn	r1, #3
	ldr	r2, [lr, #12]
	add	r3, r3, r3, lsl #2
	ldr	lr, [lr, #8]
	add	r3, ip, r3, lsl #3
	add	r2, r2, #1
	str	lr, [r3, #8]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	r1, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	minigunMag
	.word	player
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L178
	ldr	r3, [r4, #84]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #84]
	ldr	r3, .L178+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L174
	ldr	r3, .L178+8
	ldr	r2, [r4, #24]
	ldr	r1, [r3]
	ldr	r3, [r4, #12]
	sub	r1, r1, #28
	sub	r3, r3, r2
	cmp	r3, r1, lsl #8
	blt	.L142
	ldr	r0, [r4, #8]
	sub	r1, r3, #1
	ldr	lr, .L178+12
	add	ip, r1, r0, lsl #10
	lsl	ip, ip, #1
	ldrh	ip, [lr, ip]
	cmp	ip, #0
	beq	.L142
	ldr	ip, [r4, #20]
	add	r0, r0, ip
	sub	r0, r0, #1
	add	r1, r1, r0, lsl #10
	lsl	r1, r1, #1
	ldrh	r1, [lr, r1]
	cmp	r1, #0
	strne	r3, [r4, #12]
.L142:
	ldr	r1, .L178+16
	ldrh	r3, [r1]
	subs	r3, r3, r2
	bmi	.L174
	ldr	r0, [r4, #4]
	ldr	r5, .L178+20
	cmp	r0, #119
	strhle	r3, [r1]	@ movhi
	ldr	r3, .L178+4
	ldrle	r0, [r5]
	ldrh	r3, [r3, #48]
	suble	r2, r0, r2
	strle	r2, [r5]
	tst	r3, #16
	beq	.L175
.L145:
	ldr	r3, .L178+24
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r3, [r4, #68]
	beq	.L148
	ldr	r2, .L178+28
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L148
	ldr	r2, [r4, #76]
	cmp	r2, r3
	bgt	.L150
.L177:
	ldr	r2, [r4, #80]
	cmp	r2, #0
	bgt	.L176
.L150:
	ldr	r2, .L178+32
	ldr	ip, [r5]
	ldr	r1, [r4, #12]
	ldrh	r0, [r2]
	ldr	r2, [r4, #8]
	add	r3, r3, #1
	sub	r1, r1, ip
	sub	r2, r2, r0
	str	r3, [r4, #68]
	str	r1, [r4, #4]
	str	r2, [r4]
	pop	{r4, r5, r6, lr}
	b	animatePlayer
.L174:
	ldr	r3, .L178+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldr	r5, .L178+20
	bne	.L145
.L175:
	add	r1, r4, #12
	ldm	r1, {r1, r2}
	add	r3, r1, r2
	rsb	r2, r2, #1024
	cmp	r3, r2
	bge	.L146
	ldr	ip, [r4, #24]
	ldr	r2, [r4, #8]
	add	r3, r3, ip
	sub	r3, r3, #1
	ldr	lr, .L178+12
	add	r0, r3, r2, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [lr, r0]
	cmp	r0, #0
	beq	.L146
	ldr	r0, [r4, #20]
	add	r2, r2, r0
	sub	r2, r2, #1
	add	r3, r3, r2, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	addne	r1, r1, ip
	strne	r1, [r4, #12]
.L146:
	ldr	r2, .L178+16
	ldr	r1, .L178+36
	ldrh	r3, [r2]
	cmp	r3, r1
	bhi	.L145
	ldr	r1, [r4, #4]
	cmp	r1, #120
	ble	.L145
	ldr	r1, .L178+8
	ldr	r1, [r1]
	cmp	r1, #30
	bgt	.L145
	ldr	r0, [r4, #24]
	ldr	r1, [r5]
	add	r3, r3, r0
	add	r1, r1, r0
	strh	r3, [r2]	@ movhi
	str	r1, [r5]
	b	.L145
.L148:
	ldr	r2, .L178+4
	ldrh	r2, [r2, #48]
	tst	r2, #2
	bne	.L150
	ldr	r2, [r4, #76]
	cmp	r2, r3
	bgt	.L150
	b	.L177
.L176:
	mov	r3, #0
	sub	r2, r2, #1
	str	r3, [r4, #68]
	str	r2, [r4, #80]
	bl	fire
	ldr	r3, [r4, #68]
	b	.L150
.L179:
	.align	2
.L178:
	.word	player
	.word	67109120
	.word	screenBlock
	.word	gwl_STAGE1CMBitmap
	.word	hOff
	.word	playerHOff
	.word	oldButtons
	.word	buttons
	.word	vOff
	.word	782
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
	ldr	r2, .L196
	ldrh	r3, [r2]
	cmp	r3, #256
	push	{r4, lr}
	bls	.L181
	ldr	ip, .L196+4
	ldr	r1, [ip]
	cmp	r1, #30
	ble	.L194
.L181:
	ldr	r2, .L196+8
	ldr	r3, [r2]
	cmp	r3, #512
	subgt	r3, r3, #512
	strgt	r3, [r2]
	bl	updatePlayer
	ldr	r0, .L196+12
	add	r4, r0, #2000
	b	.L184
.L183:
	add	r0, r0, #40
	cmp	r4, r0
	beq	.L195
.L184:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L183
	bl	updateBullet
	add	r0, r0, #40
	cmp	r4, r0
	bne	.L184
.L195:
	ldr	r0, .L196+16
	ldr	r3, [r0, #60]
	cmp	r3, #0
	blne	updateEnemy
.L186:
	pop	{r4, lr}
	b	updateLootBox
.L194:
	mov	lr, #67108864
	add	r1, r1, #1
	lsl	r0, r1, #24
	orr	r0, r0, #1073741824
	orr	r0, r0, #8388608
	lsr	r0, r0, #16
	sub	r3, r3, #256
	str	r1, [ip]
	strh	r3, [r2]	@ movhi
	strh	r0, [lr, #8]	@ movhi
	b	.L181
.L197:
	.align	2
.L196:
	.word	hOff
	.word	screenBlock
	.word	playerHOff
	.word	minigunMag
	.word	s1Enemies
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
	ldr	r3, .L204
	push	{r4, lr}
	ldr	r2, .L204+4
	ldr	r4, .L204+8
	ldr	lr, .L204+12
	add	r0, r3, #2000
.L201:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	ldrne	r1, [r3, #4]
	ldrheq	r1, [r2, #8]
	ldrbne	ip, [r3]	@ zero_extendqisi2
	andne	r1, r1, r4
	orreq	r1, r1, #512
	add	r3, r3, #40
	strhne	lr, [r2, #12]	@ movhi
	strhne	r1, [r2, #10]	@ movhi
	strhne	ip, [r2, #8]	@ movhi
	strheq	r1, [r2, #8]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L201
	pop	{r4, lr}
	bx	lr
.L205:
	.align	2
.L204:
	.word	minigunMag
	.word	shadowOAM
	.word	511
	.word	258
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L213
	ldr	r3, [r2, #60]
	cmp	r3, #0
	beq	.L207
	ldr	r3, [r2, #8]
	str	lr, [sp, #-4]!
	ldr	r1, [r2, #44]
	ldr	lr, [r2, #36]
	lsl	r3, r3, #23
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	ldr	r0, .L213+4
	add	r2, r1, lr, lsl #5
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L207:
	ldr	r2, .L213+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L214:
	.align	2
.L213:
	.word	s1Enemies
	.word	shadowOAM+408
	.size	drawEnemies, .-drawEnemies
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
	ldr	r1, .L219
	ldr	r3, [r1, #48]
	push	{r4, r5, r6, lr}
	ldr	r0, [r1, #40]
	ldr	r2, [r1, #4]
	ldr	r5, .L219+4
	add	r3, r3, #1
	ldrb	r1, [r1]	@ zero_extendqisi2
	ldr	r4, .L219+8
	add	r3, r3, r0, lsl #5
	and	r2, r2, r5
	lsl	r3, r3, #1
	orr	r2, r2, #16384
	strh	r3, [r4, #4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	bl	drawBullets
	bl	drawEnemies
	ldr	r3, .L219+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L216
	ldr	r2, [r3, #12]
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	ldr	r1, .L219+16
	add	r3, r4, #416
	and	r5, r5, r2
	add	r4, r4, #420
	strh	r5, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r4]	@ movhi
.L217:
	ldr	r3, .L219+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L219+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L219+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L219+28
	ldrh	r1, [r2]
	ldr	r2, .L219+32
	strh	r1, [r3, #16]	@ movhi
	ldrh	r2, [r2]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L216:
	add	r4, r4, #416
	ldrh	r3, [r4]
	orr	r3, r3, #512
	strh	r3, [r4]	@ movhi
	b	.L217
.L220:
	.align	2
.L219:
	.word	player
	.word	511
	.word	shadowOAM
	.word	s1Loot
	.word	258
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	drawLootBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLootBox, %function
drawLootBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L224
	ldr	r3, [r2, #24]
	cmp	r3, #0
	beq	.L222
	ldr	r3, [r2, #12]
	ldrb	r0, [r2, #8]	@ zero_extendqisi2
	ldr	r1, .L224+4
	ldr	r2, .L224+8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L222:
	ldr	r2, .L224+8
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L225:
	.align	2
.L224:
	.word	s1Loot
	.word	258
	.word	shadowOAM+416
	.size	drawLootBox, .-drawLootBox
	.comm	screenBlock,4,4
	.comm	playerHOff,4,4
	.comm	vOff,2,2
	.comm	hOff,2,2
	.comm	s1Loot,32,4
	.comm	minigunMag,2000,4
	.comm	s1Enemies,76,4
	.comm	player,92,4
	.comm	timer,4,4
	.comm	vDisp,4,4
	.comm	oldVDisp,4,4
	.comm	stage,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
