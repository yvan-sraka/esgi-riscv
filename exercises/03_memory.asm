# Exercise 3
#
# Objective: Play with integers in memory to start!
#
# TODO: complete the hole program.
#
# Questions:
#
# - What's the address of `num0`,` num1`, `result`?
# - What's the last code address of your program?
# - How is instruction `lw t1, 0​​(t0)` quoted in machine language (hex)?
# - Is memory (not registers) in the processor?
# - When you access the memory by 32-bit words, what's the step?
# - What's the value in memory of the value at address `num0`?

# Imagine a C program like this: (available in 03_memory.c)
#
# ```C
# #include <stdint.h>
# // We ask the compiler to * not optimize * the memory access with `volatile`.
# // In embedded or kernel it is sometimes essential.
# // The rest of the time it's counterproductive. ;)
# // `static` indicates the variable is local to the file.
# static volatile int32_t num0 = 124;
# static volatile int32_t num1 = 256;
# static volatile int32_t result_g = 0;

# void main(void) {
#   // Note that your language hides the use of pointers here, in reality we
#   // are manipulating memory here (especially if no optimization takes place)
#   result_g = num0 + num1;
#   printf("% d", result_g);
# }
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
l? ???, num0_g
# Load word from address 0 + register in register t1
lw t1, 0​​(t0)

# t2 <- @ num1
l? t2, ???
# Which instruction is used to load a memory word?
??? t3, 0(t2)

# Loading of the address of the result.
la t4, ???
# Make the addition between our two registers, saving the result in another register.
add ???, ???, ???
# Store word: store the contents of the register in the address at 0 + t4
sw ???, 0(t4)

# TODO: Display our two numbers in the console!
# Hint: syscall printInt
