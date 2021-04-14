.data

# array: [1, 2, 3]
array: .word 3,4,5
size: 3

.text

main:

## Prepare the arguments for increment_array
# a0: contain the address of the array
la a0, array

# a1: contain the size of the array
la a1, size   # We load the address of size in a0
lw a1, 0 (a1) # We load the value which is at the address of size

# Jump into the increment_array function
jal increment_array

## Call exit syscall
li a7, 10
ecall
# The program stops


## Increment_array function
# Arguments:
# a0: address of the array to be incremented
# a1: array size
#
# Return
# a0: return base address of the array.
#
# Registers used by the function:
# - t0: index on the array
# - t1: a0 [i] value at the array iterator
# - t2: base address + index
increment_array:

li t0, 0 # index = 0

## Iterate over our array
# - stop if end of array
# - load the value of a [i] into t1
# - do t1 = t + 1
# - reload t1 in a [i]

for:
# stop if index> = size
beqz a1, end_for
add t2, a0, t0 # array + index: array [i]
# t1 <- a [i]
lw t1, 0 (t2)
# t1 = t1 + 1
addi t1, t1, 1
# a [i] <- t1
sw t1, 0 (t2)

# index + 1
addi t0, t0, 4 # index++
addi a1, a1, -1
j for
end_for:
# a0 already contains the base address
jr ra
## End increment_array
