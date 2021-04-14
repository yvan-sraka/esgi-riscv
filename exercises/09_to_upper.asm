.data

ma_chaine: .asciz "I love cats"
size: .word 11

.text

main:

# TODO: prepare arguments for to_upper
la a0, ma_chaine
la a1, size
lw a1, 0(a1)

# TODO: jump in to_upper
jal ra, to_upper

# TODO: display the updated channel! :)
li a7, 4
ecall

li a7, 10
ecall

# Uppercase a character string in ASCII
# a0: pointer to the string
# a1: size string
to_upper:

# size
mv t0, a1

# decalage
#slli t0, t0, 2

# t1 = end address
add t1, a0, t0

# t2 = iterator
mv t2, a0

li t4, 97
li t5, 122

# for x in str:
# TODO: load an index letter (character on 8 bits, not 32)! ;p
for:
   beq t1, t2, end_for
# if x is between a and z index: man ascii (spoiler A = 65; a = 97)
# then x + 32, otherwise nothing
   lb t3, 0(t2)
   bge t3, t4, condition1
   continue:
   sb t3, 0(t2)
   addi t2, t2, 1
   
   j for

# Increment the pointer on our word index string by 8bits (again)
# j for

end_for:
sub t2, t2, a1
mv a0, t2
jr ra
# return nothing (we jump to the main)

condition1:
   blt t3, t5, upperChar
   j continue
   
upperChar:
   addi t3, t3, -32
   j continue