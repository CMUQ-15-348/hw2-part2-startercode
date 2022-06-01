SYSCTL_RCGCGPIO_R		.field	0x400FE608,32
UNLOCK_CONSTANT			.field	0x4C4F434B,32

GPIO_PORTF_DATA_BITS_R	.field	0x40025000,32
GPIO_PORTF_DATA_R		.field	0x400253FC,32
GPIO_PORTF_LOCK_R		.field	0x40025520,32
GPIO_PORTF_CR_R			.field	0x40025524,32
GPIO_PORTF_AMSEL_R		.field	0x40025528,32
GPIO_PORTF_PCTL_R		.field	0x4002552C,32
GPIO_PORTF_DIR_R		.field	0x40025400,32
GPIO_PORTF_AFSEL_R		.field	0x40025420,32
GPIO_PORTF_DEN_R		.field	0x4002551C,32
GPIO_PORTF_PUR_R		.field	0x40025510,32

GPIO_PORTE_DATA_BITS_R	.field	0x40024000,32
GPIO_PORTE_DATA_R		.field	0x400243FC,32
GPIO_PORTE_DIR_R		.field	0x40024400,32
GPIO_PORTE_AFSEL_R		.field	0x40024420,32
GPIO_PORTE_PUR_R		.field	0x40024510,32
GPIO_PORTE_DEN_R		.field	0x4002451C,32
GPIO_PORTE_LOCK_R		.field	0x40024520,32
GPIO_PORTE_CR_R			.field	0x40024524,32
GPIO_PORTE_AMSEL_R		.field	0x40024528,32
GPIO_PORTE_PCTL_R		.field	0x4002452C,32

GPIO_PORTD_DATA_BITS_R	.field	0x40007000,32
GPIO_PORTD_DATA_R		.field	0x400073FC,32
GPIO_PORTD_DIR_R		.field	0x40007400,32
GPIO_PORTD_AFSEL_R		.field	0x40007420,32
GPIO_PORTD_PUR_R		.field	0x40007510,32
GPIO_PORTD_DEN_R		.field	0x4000751C,32
GPIO_PORTD_LOCK_R		.field	0x40007520,32
GPIO_PORTD_CR_R			.field	0x40007524,32
GPIO_PORTD_AMSEL_R		.field	0x40007528,32
GPIO_PORTD_PCTL_R		.field	0x4000752C,32

NVIC_ST_CTRL_R			.field	0xE000E010,32
NVIC_ST_RELOAD_R		.field	0xE000E014,32
NVIC_ST_CURRENT_R		.field	0xE000E018,32
MAX_RELOAD_VAL			.field	0x00ffffff,32

; Create 4-byte integers in the data segment. Both have initial values of 0.
	.data
a	.word	0
b	.word	0

	; Create an array of 3 bytes (uninitialized) in the bss segment
	.bss	array, 3

	; Start the text segment
	.text
	.thumb

; Make pointers to our variables.  This lets us load the addresses of them
; into registers by doing something like... LDR R0, a_ptr
a_ptr			.field	a,32
b_ptr			.field	b,32
array_ptr		.field	array,32

; An example of a helper function.
some_helper_func:
	; Save the link register, in case we do any function calls inside here and
	; it gets overwritten.
	PUSH {R14}

	; Put useful helper code here

	; Restore the link register
	POP {R14}
	BX LR

; The actual main function
	.global main
main: .asmfunc
	; Entry point

	; Example of calling a helper function
	BL some_helper_func

	; Do more initializiation work here

main_loop:
	; By convention, your main should have an infinite loop in it.

	; Do work here

	B main_loop

	BX LR
	.endasmfunc
