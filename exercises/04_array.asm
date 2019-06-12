# Exercise 4
#
# Objective: Add all the cells of a table version "naive"
# Without a loop, this corresponds to adding array_g [0] + array_g [1] + array_g [2].
#
# To do: complete the hole program.
#
# Questions:
#
# - What does the lw: load word instruction do?
# - lw: What is the immediate use in front of the register containing the address?
# - What will lw's destination register contain?
#
# - With an instruction like add what do the three registers correspond to?
# `add reg0, reg1, reg2`
# - reg0:
# - reg1:
# - reg2:
#
# - `la` what is it for?
# - When working on 32-bit words the addresses are allocated from how many to how many?

.data
# /!\ Warning! they are global variables in memory! /!\

# We declare "naively" an array and its size, in the data segment.
# We will see in the rest of the course that this is not exactly how we do it,
# in real life do things in the stack.
size_array_g: .word 3
array_g: .word 124, 256, 512

# In memory it looks like this @ refer in this diagram to the address
# base of the array.
# + ------- + ----- + ----- + ----- +
# | Address | @ + 0 | @ + 4 | @ + 8 |
# + ------- + ----- + ----- + ----- +
# | Content | 124   | 256   | 512   |
# + ------- + ----- + ----- + ----- +

# Chains for testing
msg_success: .asciz "The sum matches well! Well done."
msg_fail: .asciz "Whops it's not that yet, courage! :)"

.text

main:

la t0, array_g # t0 contains the address of the array

# To sum the array we will add manually,
# the content of all the cells of the table.

lw t1, 0​​(t0) # t1: array_g [0]
# lw ???, 4 (???) <- TODO: To be completed!
# You can also add on the address which is in t0
add a0, t1, t2 # sum = t2 + t1


# Here you have to add a0 which contains the sum
# with the register which will contain the value of the 3rd cell of the table.

###
# Teacher part: test if it works and displays a message accordingly.
###
test:
# Test sum == 892
li  a1, 892
bne a0, a1, fail_test # if a0 !t1 then fail_test
la a0, msg_success
j print
fail_test:
la a0, msg_fail

print:
li a7, 4
ecall