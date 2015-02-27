	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	push {r3, r4}
	ldr r4, =locked
.L1:
	ldr r3, [r0]
	cmp r3, #0
	bne .L1
	str r4, [r0]
	pop {r3, r4}
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
    push {r4}
	ldr r4, =unlocked
	str r4, [r0]
	pop {r4}
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
