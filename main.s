	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	waitForVBlank
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L2:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L2
	mov	r2, #67108864
.L4:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L4
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	mov	r1, r1, asl #1
	add	r1, r1, #100663296
	strh	r2, [r1]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r2, #0
	ldrh	ip, [sp, #12]
	ble	.L9
	mov	r4, #0
	rsb	r0, r0, r0, lsl #4
	add	lr, r1, r0, lsl #4
	mov	lr, lr, asl #1
	add	lr, lr, #100663296
	mov	r5, r3, asl #1
.L13:
	cmp	r3, #0
	ble	.L14
	mov	r1, lr
	add	r0, lr, r5
.L12:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L12
.L14:
	add	r4, r4, #1
	cmp	r2, r4
	add	lr, lr, #480
	bne	.L13
.L9:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
	.size	drawRect, .-drawRect
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L27
	ldr	lr, [r6, #8]
	cmn	lr, #3
	ldmia	r6, {r0, r3}
	ldr	r5, [r6, #12]
	blt	.L20
	mov	ip, #0
	mov	r1, ip
	rsb	r0, r0, r0, lsl #4
	add	r0, r3, r0, lsl #4
	mov	r0, r0, asl #1
	mov	r4, r5, asl #1
	add	r0, r0, #100663296
	add	lr, lr, #4
	add	r4, r4, #8
.L22:
	cmn	r5, #3
	blt	.L23
	mov	r3, r0
	add	r2, r4, r0
.L21:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L21
.L23:
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r0, #480
	bne	.L22
.L20:
	mov	r2, #5
	mov	r3, #0
	mov	r4, #117
	mov	lr, #50
	mov	ip, #40
	mov	r0, #97
	mov	r1, #140
	str	r2, [r6, #16]
	str	r2, [r6, #8]
	ldr	r2, .L27+4
	str	r4, [r6, #20]
	str	lr, [r6, #24]
	strb	r3, [r6, #28]
	str	ip, [r6, #12]
	str	r0, [r6, #32]
	str	r1, [r6, #36]
	str	r3, [r2]
	str	r3, [r2, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initialize, .-initialize
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, .L52+4
	ldr	r4, [r3, #24]
	ldr	r1, [r5]
	ldr	r2, [r5, #4]
	add	r4, r1, r4
	ldr	r0, [r3, #20]
	orrs	r1, r1, r2
	ldr	r1, .L52+8
	add	r2, r2, r0
	ldrh	r0, [r1, #48]
	ldr	r1, [r3, #32]
	mov	r0, r0, lsr #5
	str	r4, [r3, #24]
	eor	r0, r0, #1
	addeq	r4, r4, #1
	streq	r4, [r3, #24]
	cmp	r1, #0
	movle	r0, #0
	andgt	r0, r0, #1
	cmp	r0, #0
	ldr	r0, .L52
	str	r1, [r3, #4]
	subne	r1, r1, #1
	strne	r1, [r0, #32]
	ldr	r0, .L52+8
	ldrh	r0, [r0, #48]
	ldr	ip, [r3, #36]
	tst	r0, #16
	str	r2, [r3, #20]
	str	ip, [r3]
	ldr	lr, [r3, #12]
	bne	.L33
	rsb	r0, lr, #240
	cmp	r0, r1
	ldr	r0, .L52
	addgt	r1, r1, #1
	strgt	r1, [r0, #32]
.L33:
	cmp	r2, r1
	add	r6, lr, r1
	movge	r0, #1
	movlt	r0, #0
	cmp	r2, r6
	movge	r0, #0
	cmp	r0, #0
	ldr	r0, [r3, #16]
	beq	.L35
	rsb	r7, r0, ip
	cmp	r7, r4
	ldr	r7, .L52
	beq	.L49
.L35:
	cmp	r4, #0
	blt	.L50
.L37:
	rsb	lr, r0, #160
	cmp	lr, r4
	ldrlt	r7, [r5]
	rsblt	r7, r7, #0
	movlt	r4, lr
	strlt	lr, [r3, #24]
	strlt	r7, [r5]
	cmp	r2, #0
	blt	.L51
.L39:
	rsb	r0, r0, #240
	cmp	r0, r2
	ldrlt	r2, [r5, #4]
	rsblt	r2, r2, #0
	strlt	r0, [r3, #20]
	strlt	r2, [r5, #4]
	cmp	ip, r4
	bge	.L29
	ldr	r3, [r3, #20]
	cmp	r3, r1
	cmpge	r6, r3
	movle	r2, #1
	ldr	r3, .L52
	strleb	r2, [r3, #28]
.L29:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L51:
	mov	r7, #0
	ldr	lr, [r5, #4]
	rsb	lr, lr, #0
	mov	r2, r7
	str	lr, [r5, #4]
	str	r7, [r3, #20]
	b	.L39
.L50:
	mov	r7, #0
	ldr	lr, [r5]
	rsb	lr, lr, #0
	mov	r4, r7
	str	lr, [r5]
	str	r7, [r3, #24]
	b	.L37
.L49:
	mov	r8, #1
	add	lr, lr, lr, lsr #31
	add	lr, r1, lr, asr r8
	cmp	r2, lr
	str	r8, [r5, #4]
	mvnlt	r7, #0
	mvnge	r8, #0
	ldr	lr, .L52+4
	addge	r2, r2, #1
	strlt	r7, [lr]
	strlt	r7, [lr, #4]
	strge	r2, [r7, #20]
	strge	r8, [lr]
	b	.L35
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	67109120
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L84
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	lr, [ip, #8]
	cmp	lr, #0
	ldmia	ip, {r0, r3}
	ldr	r4, [ip, #12]
	ble	.L56
	mov	r6, #0
	mov	r1, r6
	rsb	r0, r0, r0, lsl #4
	add	r0, r3, r0, lsl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	mov	r5, r4, asl #1
.L58:
	cmp	r4, #0
	ble	.L60
	mov	r3, r0
	add	r2, r5, r0
.L57:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L57
.L60:
	add	r6, r6, #1
	cmp	lr, r6
	add	r0, r0, #480
	bne	.L58
	mov	r6, #0
	mvn	r1, #32768
	ldr	r0, [ip, #36]
	ldr	r3, [ip, #32]
	rsb	r0, r0, r0, lsl #4
	add	r0, r3, r0, lsl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
.L69:
	cmp	r4, #0
	ble	.L62
	mov	r3, r0
	add	r2, r5, r0
.L61:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L61
.L62:
	add	r6, r6, #1
	cmp	lr, r6
	add	r0, r0, #480
	bne	.L69
.L56:
	ldr	lr, [ip, #16]
	add	r0, ip, #40
	cmp	lr, #0
	ldr	r2, .L84
	ldmia	r0, {r0, r3}
	ble	.L63
	mov	r5, #0
	mov	r1, r5
	rsb	r0, r0, r0, lsl #4
	add	r0, r3, r0, lsl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	mov	r4, lr, asl #1
.L65:
	mov	r3, r0
	add	r2, r0, r4
.L64:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L64
	add	r5, r5, #1
	cmp	lr, r5
	add	r0, r0, #480
	bne	.L65
	mov	r5, #0
	mvn	r1, #64512
	ldr	r6, [ip, #24]
	ldr	r7, [ip, #20]
	rsb	r0, r6, r6, lsl #4
	add	r0, r7, r0, lsl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
.L68:
	mov	r3, r0
	add	r2, r0, r4
.L67:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L67
	add	r5, r5, #1
	cmp	lr, r5
	add	r0, r0, #480
	bne	.L68
	str	r6, [ip, #40]
	str	r7, [ip, #44]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L63:
	ldr	r6, [r2, #24]
	ldr	r7, [r2, #20]
	str	r6, [ip, #40]
	str	r7, [ip, #44]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	.LANCHOR0
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	mov	fp, #67108864
	ldr	r3, .L100
	ldr	r4, .L100+4
	ldr	r7, .L100+8
	strh	r3, [fp]	@ movhi
	ldr	r10, .L100+12
	mov	lr, pc
	bx	r10
	ldr	r5, .L100+16
	ldr	r2, [r4]
	ldrb	r1, [r7, #28]	@ zero_extendqisi2
	ldr	r9, .L100+20
	ldr	r8, .L100+24
	ldr	r6, .L100+28
.L87:
	ldrh	r3, [r6, #48]
	cmp	r1, #0
	str	r2, [r5]
	str	r3, [r4]
	bne	.L88
	mov	lr, pc
	bx	r9
.L89:
	ldrh	r3, [fp, #6]
	cmp	r3, #160
	bhi	.L89
.L95:
	ldrh	r3, [fp, #6]
	cmp	r3, #159
	bls	.L95
	mov	lr, pc
	bx	r8
	ldrb	r1, [r7, #28]	@ zero_extendqisi2
	cmp	r1, #0
	ldreq	r2, [r4]
	beq	.L87
	ldr	r2, [r5]
	ldr	r3, [r4]
.L88:
	tst	r2, #8
	beq	.L99
	tst	r3, #8
	beq	.L94
.L99:
	mov	r2, r3
	ldrb	r1, [r7, #28]	@ zero_extendqisi2
	b	.L87
.L94:
	mov	lr, pc
	bx	r10
	ldr	r2, [r4]
	ldrb	r1, [r7, #28]	@ zero_extendqisi2
	b	.L87
.L101:
	.align	2
.L100:
	.word	1027
	.word	buttons
	.word	.LANCHOR0
	.word	initialize
	.word	oldButtons
	.word	update
	.word	draw
	.word	67109120
	.size	main, .-main
	.global	dead
	.global	start
	.global	cd
	.global	rd
	.global	oldBallCol
	.global	oldBallRow
	.global	ballRow
	.global	ballCol
	.global	ballSize
	.global	oldP1Col
	.global	oldP1Row
	.global	p1Col
	.global	p1Row
	.global	p1Width
	.global	p1Height
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	oldP1Row, %object
	.size	oldP1Row, 4
oldP1Row:
	.word	120
	.type	oldP1Col, %object
	.size	oldP1Col, 4
oldP1Col:
	.word	97
	.type	p1Height, %object
	.size	p1Height, 4
p1Height:
	.word	5
	.type	p1Width, %object
	.size	p1Width, 4
p1Width:
	.word	40
	.type	ballSize, %object
	.size	ballSize, 4
ballSize:
	.word	5
	.type	ballCol, %object
	.size	ballCol, 4
ballCol:
	.word	117
	.type	ballRow, %object
	.size	ballRow, 4
ballRow:
	.word	50
	.type	dead, %object
	.size	dead, 1
dead:
	.byte	1
	.space	3
	.type	p1Col, %object
	.size	p1Col, 4
p1Col:
	.word	97
	.type	p1Row, %object
	.size	p1Row, 4
p1Row:
	.word	140
	.type	oldBallRow, %object
	.size	oldBallRow, 4
oldBallRow:
	.word	50
	.type	oldBallCol, %object
	.size	oldBallCol, 4
oldBallCol:
	.word	117
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rd, %object
	.size	rd, 4
rd:
	.space	4
	.type	cd, %object
	.size	cd, 4
cd:
	.space	4
	.type	start, %object
	.size	start, 1
start:
	.space	1
	.ident	"GCC: (devkitARM release 45) 5.3.0"
