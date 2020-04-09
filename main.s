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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #2384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+20
	ldr	r2, .L4+24
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	gwl_STARTBG1Pal
	.word	gwl_STARTBG1Tiles
	.word	100720640
	.word	gwl_STARTBG1Map
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #7168
	mov	r4, #67108864
	ldr	r5, .L8
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r3, #256
	strh	r3, [r4]	@ movhi
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	gwl_SPRITESPal
	.word	100728832
	.word	gwl_SPRITESTiles
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	goToRules
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToRules, %function
goToRules:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #1776
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+12
	mov	r0, #3
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	gwl_GUIDEBG1Pal
	.word	gwl_GUIDEBG1Tiles
	.word	100720640
	.word	gwl_GUIDEBG1Map
	.word	state
	.size	goToRules, .-goToRules
	.align	2
	.global	rules
	.syntax unified
	.arm
	.fpu softvfp
	.type	rules, %function
rules:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L19+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	buttons
	.size	rules, .-rules
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L23
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L23+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L23+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L23+12
	ldr	r1, .L23+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L23+20
	mov	r0, #3
	ldr	r1, .L23+24
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L23+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	23680
	.word	DMANow
	.word	gwl_STAGE1Pal
	.word	25696
	.word	gwl_STAGE1Tiles
	.word	100720640
	.word	gwl_STAGE1Map
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L37
	ldr	r5, .L37+4
	ldr	r3, [r4]
	ldrh	r2, [r5]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r4]
	beq	.L26
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
.L26:
	tst	r2, #4
	beq	.L25
	ldr	r3, .L37+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L36
.L25:
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	pop	{r4, r5, r6, lr}
	b	goToRules
.L35:
	bl	goToGame
	ldr	r3, .L37+12
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L37+16
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	b	.L26
.L38:
	.align	2
.L37:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	srand
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L41
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L41+4
	mov	lr, pc
	bx	r4
	mov	r3, #3648
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L41+12
	mov	r0, #3
	ldr	r1, .L41+16
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L41+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	gwl_PAUSEBGPal
	.word	gwl_PAUSEBGTiles
	.word	100720640
	.word	gwl_PAUSEBGMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L55
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L44
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L53
.L44:
	tst	r3, #4
	beq	.L45
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L54
.L45:
	ldr	r3, .L55+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L55+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L54:
	bl	goToStart
	b	.L45
.L53:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L44
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L59
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L59+4
	mov	lr, pc
	bx	r4
	mov	r3, #1216
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L59+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L59+12
	mov	r0, #3
	ldr	r1, .L59+16
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L59+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
	.word	DMANow
	.word	gwl_WINBG1Pal
	.word	gwl_WINBG1Tiles
	.word	100720640
	.word	gwl_WINBG1Map
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L68
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L62
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L62:
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L68+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L67:
	bl	goToStart
	b	.L62
.L69:
	.align	2
.L68:
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L72
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L72+4
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L72+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L72+12
	mov	r0, #3
	ldr	r1, .L72+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L72+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L73:
	.align	2
.L72:
	.word	DMANow
	.word	gwl_LOSEBG1Pal
	.word	gwl_LOSEBG1Tiles
	.word	100720640
	.word	gwl_LOSEBG1Map
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L75
	ldr	r3, .L85+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L75:
	ldr	r4, .L85+8
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ble	.L83
.L76:
	ldr	r3, [r4, #12]
	cmp	r3, #768
	bge	.L84
.L77:
	ldr	r3, .L85+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L84:
	bl	goToWin
	b	.L77
.L83:
	bl	goToLose
	b	.L76
.L82:
	bl	goToPause
	b	.L75
.L86:
	.align	2
.L85:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	updateGame
	.word	drawGame
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L102
	ldr	fp, .L102+4
	ldr	r3, .L102+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L102+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L102+16
	ldr	r9, .L102+20
	ldr	r8, .L102+24
	ldr	r7, .L102+28
	ldr	r4, .L102+32
.L89:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L97
.L91:
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L90
	.word	.L90
.L90:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L92:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L93:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L94:
	tst	r0, #8
	beq	.L97
	tst	r3, #8
	beq	.L101
.L97:
	mov	r0, r3
	b	.L89
.L95:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L101:
	ldr	r3, .L102+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L103:
	.align	2
.L102:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
