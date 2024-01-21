.globl main
.data
int_arr1: .word 0:2
          .word 0:2
int_arr2: .word 0:2
          .word 0:2
prompt1: .asciiz "Enter first matrix numbers:"
prompt2: .asciiz "Enter second matrix numbers:"
space: .asciiz " "

.text
main:
    li $v0,4
    la $a0,prompt1
    syscall

    li $t9,0

loop1:
    bgt $t9,3,prompt
    li $v0,5
    syscall
    move $t1, $v0
    sb $t1, int_arr1($t9)
    lb $t2 ,int_arr1($t9)
    addi $t9,$t9,1
    j loop1

prompt:
    li $v0,4
    la $a0,prompt2
    syscall

    li $t9,0

loop2:
    bgt $t9,3,redefine
    li $v0,5
    syscall
    move $t1, $v0
    sb $t1, int_arr2($t9)
    lb $t2 ,int_arr2($t9)
    addi $t9,$t9,1
    j loop2

redefine:
    li $t9,0

addition:
    bgt $t9,3,exit
    lb $t1,int_arr1($t9)
    lb $t2,int_arr2($t9)
    add $t3,$t1,$t2
    li $v0,1
    move $a0,$t3
    syscall
    addi $t9,$t9,1
    j addition

exit:
    li $v0,10
    syscall

