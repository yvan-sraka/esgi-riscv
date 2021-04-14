# Exercise 3
#
# Objective: Play with integers in memory to start!
#
# To do: complete the hole program.
#
# Questions:
#
# - What is the address of `num0`,` num1`, `result`?
#	num0: 0x10010000, num1: 0x10010004, result: 0x10010008
# - The last code address of your program
# 	0x10010008
# - How is the instruction quoted in machine language (hexadecimal): `lw t1, 0​​(t0)`
#	Valuer de T0 stockée dans t1
# - Is memory in the processor?
#	Data : In the RAM, Text: In the processor
# - When you access the memory by 32-bit words, what's the step?
# 	la: pour récupérer l'adresse de la mémoire, lw: pour récupérer la valeur de cette adresse
# - What is the value in memory of the value at address `num0`
# 	0x0000007c

# Imagine a C program like this: (available in 03_memory.c)
#
# ```C
# // We ask the compiler to * not optimize * the
# // memory access with `volatile`.
# // In embedded or kernel it is sometimes essential.
# // The rest of the time it's counterproductive. ;)
# // `static` indicates the variable is local to the file.
# static volatile int32_t num0 = 124;
# static volatile int32_t num1 = 256;
# static volatile int32_t result_g = 0;
#
# void main (void) {
# // Note that your language hides the use of pointers here,
# // actually we are manipulating memory here
# // (especially if no optimization takes place).
# result_g = num0 + num1;
#}
# ```
# We declare two 32-bit numbers in * memory *
# .word allows you to specify that you want a 32-bit word.

.data
# /!\ Warning! they are global variables in memory! /!\
num0_g: .word 124
num1_g: .word 256

# We want to load the result of the addition in the memory to the result address:
result_g: .word 0

.text

main:

# ??? <- @ num0
la t0, num0_g
# load word from address 0 + register in register t1
lw t1, 0 (t0)

# t2 <- @ num1
la t2, num1_g
# Which instruction is used to load a memory word?
lw t3, 0 (t2)

# loading of the address of the result.
la t4, result_g
# make the addition between our two registers in one register.
add t5, t1, t3
# store word, store the contents of the register in the address at 0 + t4
sw t5, 0 (t4)

# To be done by you totally, display our two numbers in the console (hint: syscall printInt)
add a0, t5, zero
li a7, 1
ecall
