### Here you can use
# two instructions to write to load 5 into t0 and t1 into 4.

# start of the program.
main:
li t0, 5
li t1, 4

# `bne` Branch if Not Equals: Jump if our registers are not equal.
bne t0, t1, not_eq # if t0! = t1 jump not_eq

# Equal cases t0 == t1
la a0, msg_eq # msg <- "These numbers are equal!"
j end # We are done so we can get out of the if.

# Unequal cases t0 != T1
not_eq:
la a0, msg_neq # msg <- "These numbers are not equal"
###

end:

# Display:
#
# Here we want to display on the console via a system call.
# take inspiration from 01_syscall, register a0 must contain
# the number of the syscall printString: 4 and a7 the string to display.

li a7, 4 # syscall number
ecall       # which instruction should we use to make a syscall?