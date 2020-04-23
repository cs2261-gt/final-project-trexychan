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
	mov	r3, #2432
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
	mov	r3, #7168
	mov	r4, #67108864
	mov	r1, #0
	strh	r3, [r4, #8]	@ movhi
	ldr	r3, .L8
	ldr	r0, .L8+4
	ldrh	ip, [r3, #48]
	ldr	r2, .L8+8
	ldr	r3, .L8+12
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L8+20
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	mov	r3, #256
	strh	r3, [r4]	@ movhi
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupInterrupts
	.word	setupSounds
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
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #1888
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
	ldr	r3, .L26
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L22
	cmp	r3, #1
	bne	.L24
	mov	r2, #67108864
	ldr	r3, .L26+4
	ldr	r3, [r3]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L26+8
	ldr	r4, .L26+12
	mov	lr, pc
	bx	r4
	mov	r3, #3888
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L26+20
	ldr	r1, .L26+24
	mov	lr, pc
	bx	r4
.L24:
	mov	r2, #2
	ldr	r3, .L26+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L22:
	mov	r2, #67108864
	ldr	r3, .L26+4
	ldr	r3, [r3]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #8388608
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
	ldr	r4, .L26+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26+32
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L26+36
	ldr	r1, .L26+40
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L26+20
	ldr	r1, .L26+44
	mov	lr, pc
	bx	r4
	b	.L24
.L27:
	.align	2
.L26:
	.word	stage
	.word	screenBlock
	.word	gwl_BOSSPal
	.word	DMANow
	.word	gwl_BOSSTiles
	.word	100720640
	.word	gwl_BOSSMap
	.word	state
	.word	gwl_STAGE1Pal
	.word	16224
	.word	gwl_STAGE1Tiles
	.word	gwl_STAGE1Map
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
	ldr	r4, .L40
	ldr	r5, .L40+4
	ldr	r3, [r4]
	ldrh	r2, [r5]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r4]
	beq	.L29
	ldr	r3, .L40+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
.L29:
	tst	r2, #4
	beq	.L28
	ldr	r3, .L40+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L39
.L28:
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	pop	{r4, r5, r6, lr}
	b	goToRules
.L38:
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r0, [r4]
	ldr	r3, .L40+16
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	b	.L29
.L41:
	.align	2
.L40:
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
	push	{r4, r5, r6, lr}
	mov	r2, #7168
	mov	r4, #67108864
	ldr	r5, .L44
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L44+4
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L44+8
	ldr	r1, .L44+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L44+16
	ldr	r1, .L44+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #3
	ldr	r2, .L44+24
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	DMANow
	.word	gwl_PAUSEBGPal
	.word	6448
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
	ldr	r4, .L58
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L58+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L56
.L47:
	tst	r3, #4
	beq	.L48
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L57
.L48:
	mov	r2, #0
	mov	r3, #67108864
	ldr	r1, .L58+8
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L58+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L58+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L57:
	bl	goToStart
	b	.L48
.L56:
	ldr	r3, .L58+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L47
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	unpauseSound
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
	push	{r4, r5, r6, lr}
	mov	r2, #7168
	mov	r4, #67108864
	ldr	r5, .L62
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L62+4
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L62+8
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L62+16
	ldr	r1, .L62+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #4
	ldr	r2, .L62+24
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	DMANow
	.word	gwl_WINBG1Pal
	.word	7584
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
	ldr	r3, .L71
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L65
	ldr	r3, .L71+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L65:
	mov	r2, #0
	mov	r3, #67108864
	ldr	r1, .L71+8
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L71+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L70:
	bl	goToStart
	b	.L65
.L72:
	.align	2
.L71:
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
	ldr	r4, .L75
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L75+4
	mov	lr, pc
	bx	r4
	mov	r3, #1376
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L75+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L75+12
	mov	r0, #3
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L75+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L76:
	.align	2
.L75:
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
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L78
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
.L78:
	ldr	r3, .L91+8
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ble	.L89
.L79:
	ldr	r3, .L91+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L90
.L80:
	ldr	r3, .L91+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L89:
	ldr	r3, [r3, #80]
	cmp	r3, #0
	bgt	.L79
	ldr	r3, .L91+24
	mov	lr, pc
	bx	r3
	bl	goToLose
	ldr	r3, .L91+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L80
.L90:
	ldr	r3, .L91+24
	mov	lr, pc
	bx	r3
	bl	goToWin
	b	.L80
.L88:
	ldr	r3, .L91+28
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L78
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	bossDefeated
	.word	updateGame
	.word	drawGame
	.word	stopSound
	.word	pauseSound
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
	ldr	r6, .L108
	ldr	fp, .L108+4
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L108+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L108+16
	ldr	r9, .L108+20
	ldr	r8, .L108+24
	ldr	r7, .L108+28
	ldr	r4, .L108+32
.L95:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L103
.L97:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L96
	.word	.L96
.L96:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L95
.L98:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L95
.L99:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L95
.L100:
	tst	r0, #8
	beq	.L103
	tst	r3, #8
	beq	.L107
.L103:
	mov	r0, r3
	b	.L95
.L101:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L95
.L107:
	ldr	r3, .L108+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L95
.L109:
	.align	2
.L108:
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
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
