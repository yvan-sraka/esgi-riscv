# Exercise 07: Increment all the elements of an array

# In this exercise, we will once again practice loops.
# The goal is to find the maximum of an array.

# We want to write a function with label: `find_max`

.data

array:
# It's up to you to define a piece of contiguous memory containing 32-bit integers.
# Hint: .word index 1,2,3,4

array_size:
# You can define the size of the array it will be useful ;)
# Hint: .word 4

.text
main:

# TODO: prepare the arguments for find_max in registers a0 and a1!

# TODO: jump to find_max

# TODO: come back from find_max, display the result

# We quit the program by jumping to the exit function.
jal exit

## find_max
##
## Arguments
##
## a0: Address of a contiguous memory chunk containing integer on 32bits.
## a1: Size of the contiguous memory chunk
##
## Return: Address of the max element, if the array is empty: NULL address (0)

find_max:

## Exit a program by calling the corresponding exit syscall.
## Do not return.
exit:
li a7, 10
ecall