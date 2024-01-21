#gcd
.data
n1: .word 20
n2: .word 4

.text
.globl main

main:
    lw $a0,n1  
    lw $a1,n2  
    jal GCD 

    move $a0,$v0 
    li $v0,1
    syscall 
    li $v0, 10 
    syscall

GCD:
    # GCD(n1, n2)
    # n1 = $a0
    # n2 = $a1

    move $s0, $a0 
    move $s1, $a1 

    addi $sp, $sp, -12
    sw $ra, 0($sp) 
    sw $s0, 4($sp) 
    sw $s1, 8($sp) 

    beq $s0, 0, returnn1 # if a == 0 return b

    move $a1, $s0
    div $s1, $s0
    mfhi $a0
    # return (b%a,a)

    jal GCD

exitGCD:
    lw $ra, 0 ($sp)  
    lw $s0, 4 ($sp)
    lw $s1, 8 ($sp)
    addi $sp, $sp, 12 
    jr $ra

returnn1:
    move $v0, $s1
    j exitGCD

# ll GCD(ll a, ll b)
# {
# if (a == 0)
#       return b;
#  return GCD(b % a, a);
# }