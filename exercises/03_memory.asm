# Exercise 3
#
# Objective: Play with integers in memory to start!
#
# To do: complete the hole program.
#
# Questions:
#
# - What is the address of `num0`,` num1`, `result`?
# - The last code address of your program
# - How is the instruction quoted in machine language (hexadecimal): `lw t1, 0​​(t0)`
# - Is memory in the processor?
# - When you access the memory by 32-bit words, what's the step?
# - What is the value in memory of the value at address `num0`

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
li t0, num0_g
# load word from address 0 + register in register t1
lw t1, ​​(t0)

# t2 <- @ num1
li t2, num1_g
# Which instruction is used to load a memory word?
lw t3, (t2)

# loading of the address of the result.
la t4, result_g
# make the addition between our two registers in one register.
add t4, t1, t3
# store word, store the contents of the register in the address at 0 + t4
sw a0, 0 (t4)
li a7, 4
ecall
# To be done by you totally, display our two numbers in the console (hint: syscall printInt)
