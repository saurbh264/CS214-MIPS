.data
    prompt:     .asciiz "Enter string: "
    val:     .asciiz "\nvalid "
    inva:     .asciiz "\ninvalid "
    inp: .space 81

.text
    .globl main

main:
    li $v0,4
    la $a0,prompt
    syscall

    li $v0,8
    la $a0,inp
    li $a1, 10
    syscall

    li $t3,'('
    li $t4,')'
    li $t5,'['
    li $t6,']'
    li $t7,'{'
    li $t8,'}'

    li $t1,0

    li $t0,1
    j par

    li $t9,0

    li $v0,10
    syscall

par:

    beq $t0,0,invalid
    beq $t1,9,end
    lb $t2,inp($t1)

    beq $t2,$t3,push_s
    beq $t2,$t5,push_s
    beq $t2,$t7,push_s

    beq $t2,$t4,pop_1
    beq $t2,$t6,pop_2
    beq $t2,$t8,pop_3

    add $t1,$t1,1

    j par

invalid:
    li $v0,4
    la $a0,inva
    syscall

    li $v0,10
    syscall

end:
    bne $t9,0,invalid
    li $v0,4
    la $a0,val
    syscall


    li $v0,10
    syscall

pop_1:
    lw $a0, 4($sp)
    beq $a0,$t3,valid_pop
    li $t0,0

    j par

pop_2:
    lw $a0, 4($sp)
    beq $a0,$t5,valid_pop
    li $t0,0

    j par

pop_3:
    lw $a0, 4($sp)
    beq $a0,$t7,valid_pop
    li $t0,0

    j par

valid_pop:
    addi $sp,$sp,4
    add $t1,$t1,1
    addi $t9,$t9,-1

    j par

push_s:

    sub $sp, $sp, 4
    sw $t2, 4($sp)

    add $t1,$t1,1

    addi $t9,$t9,1

    j par

