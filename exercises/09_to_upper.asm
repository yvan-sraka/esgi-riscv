.data

ma_chaine: .asciz "I love cats"
size: .word 11
.text

main:

# Prepare arguments for to_upper
la a0, ma_chaine
la a1, size
lw a1, 0(a1)

# Jump in to_upper
jal ra, to_upper

# Display the updated channel! :)

# Uppercase a character string in ASCII
# a0: pointer to the string
# a1: size string

to_upper:
mv t0, a1 		# size
slli t0, t0, 2		# Décalage
add t1, a0, t0		# end address
mv t2, a0		# Iterator


# for x in str:
# TODO: load an index letter (character on 8 bits, not 32)! ;p
for: 
	beq t1, t2, end_for
	
# if x is between a and z index: man ascii (spoiler A = 65; a = 97)
# then x + 32, otherwise nothing

	lw t3, 0(t2)

# Increment the pointer on our word index string by 8bits (again)
# j for

# return nothing (we jump to the main)
