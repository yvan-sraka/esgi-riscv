# Exercise 07: Increment all the elements of an array

# In this exercise, we will once again practice loops.
# The goal is to find the maximum of an array.

# We want to write a function with label: `find_max`

.data

array:
# It's up to you to define a piece of contiguous memory containing 32-bit integers.
# Hint: .word index 1,2,3,4
.word  32, 64, 16, 90, 40, 250, 71

array_size:
# You can define the size of the array it will be useful ;)
# Hint: .word 4
.word 7

.text
main:

# Prepare the arguments for find_max in registers a0 and a1!
la a0, array
la a1, array_size
lw a1, 0(a1)

# Jump to find_max
jal ra, find_max

# Come back from find_max, display the result
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
li t5, 0			# max
mv t2, a1			# size
slli t2, t2, 2			# Décalage
add t0, a0, t2			# End Address
mv t1, a0			# Iterator

for: 
	beq t0, t1, end_for 	# if (t0 == t1) return
	lw t4, 0(t1)
	bge t4, t5, superior 	# if (t4 >= t5) t5 = t4
	continue:
	addi t1, t1, 4		# incrémentation iterator
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
