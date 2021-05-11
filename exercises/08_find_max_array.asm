# Exercise 07: Increment all the elements of an array

# In this exercise, we will once again practice loops.
# The goal is to find the maximum of an array.

# We want to write a function with label: `find_max`

.data

array: .word 32, 64 1000, 90, 40, 250, 71
# It's up to you to define a piece of contiguous memory containing 32-bit integers.
# Hint: .word index 1,2,3,4

array_size: .word 7
# You can define the size of the array it will be useful ;)
# Hint: .word 4

.text
main:

# TODO: prepare the arguments for find_max in registers a0 and a1!
la a0, array
la a1, array_size
lw a1, 0(a1)
# TODO: jump to find_max
jal ra, find_max
# TODO: come back from find_max, display the result
li a7, 1
ecall
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
# return value
li t5, 0

mv t2, a1

# decalage
slli t2, t2, 2


add t0, a0, t2


mv t1, a0
for:
   # end of the loop
   beq t0, t1, end_for

   # get the value
   lw t4, 0(t1)

   # compare with the biggest value saved before
   bge t4, t5, superior
   continue:

   addi t1, t1, 4

   # loop
   j for

superior:
      mv t5, t4
      j continue

end_for:
mv a0, t5
jr ra

## Exit a program by calling the corresponding exit syscall.
## Do not return.
exit:
li a7, 10
ecall
