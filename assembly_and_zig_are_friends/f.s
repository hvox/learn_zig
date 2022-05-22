.data
	hello:
		.string "Hello from assembly!\n"
.text
	.global f
	f:
		push {ip, lr}
		ldr r0, =hello
		bl printf
		mov r0, #42
		pop {ip, pc}
