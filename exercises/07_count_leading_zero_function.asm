# Exercise 06: CLZ / Discovery of functions

# In this exercise we will count the number of zero before the first bit at 1
# in a 32-bit word.

# This function often called "Count Leading Zeros" (clz) is quite useful in the
# embedded and operating systems or databases.
# Especially when you want to compress packets of 0 before data ;)

# Hint: https://en.wikipedia.org/wiki/Find_first_set

# So useful that often a dedicated instruction exists!

# We imagine an 8-bit word:

# + - + - + - + - + - + - + - + - +
# | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
# + - + - + - + - + - + - + - + - +
# | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 |
# + - + - + - + - + - + - + - + - +

# Here your code for clz should return 4!

# We will also learn about the functions.
.data
my_word: .word 512

.text

#################
# Start of main #
#################
main:

la a0, my_word
lw a0, 0(a0) # We load the word located at the my_word label.
jal ra, soft_clz # We jump into the soft_clz function
# We remember the return position with the ra register.
# <- at the end of the function we are here.

# a0 already contains what we want to display.
li a7, 1 # print integer
ecall

# Syscall exit to end our program.
li a7, 10 # Exit
ecall
###############
# End of main #
###############

##############################
# Beginning of your function #
##############################
soft_clz:
# Soft_clz function, calculate the number of 0 before the first bit at 1.
# Arguments:
# a0: 32-bit word in which we try to determine the number of 0 in front of the first 1.
# Return (register a0) numbers from 0 before the first bit to 1 if 0 returns 32.

# Convention: In a function we mainly use the tX registers.
# These are the temporary registers, the aX registers are the parameter registers
# This is the function which calls which saves them.
# The sX registers are saved by the called function, they will not be used here.

# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
# Here begins the place where you can write your code!

# To succeed in your function you can make an un and shifting loop.
# Or an aggressive version with lots of and's.
# Try to do it on paper first draw an 8-bit table and do the algo by hand to count.
# You will see that you have to do 3 things, do 32 comparison, by shifting a cursor to the left or right.
# To test the value of two bits between them I recommend the `and` operation.

# - + - Happy coding! - + -

# End of the code you should write the result should be in a0!
# \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

jr ra # we go back to where we came from here the main!
########################
# End of your function #
########################