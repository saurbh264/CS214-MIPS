    .text
    .globl main
    
main:
    li $v0,4
    la $a0,ainp
    syscall

    li $v0,5
    syscall
    move $t0,$v0
    li $v0,5
    syscall
    move $t1,$v0
    li $v0,5
    syscall
    move $t2,$v0

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,binp
    syscall

    li $v0,5
    syscall
    move $t3,$v0
    li $v0,5
    syscall
    move $t4,$v0
    li $v0,5
    syscall
    move $t5,$v0

    li $v0,4
    la $a0,endl
    syscall


    blt $t3,$t0,agbp
    blt $t0,$t3,bgap

    blt $t4,$t1,agbp
    blt $t1,$t4,bgap

    blt $t5,$t2,agbp
    blt $t2,$t5,bgap

    li $v0,4
    la $a0,eq 
    syscall

    li $v0,10
    syscall
agbp:
    li $v0,4
    la $a0,agb 
    syscall

    li $v0,10
    syscall
bgap:
    li $v0,4
    la $a0,bga 
    syscall

    li $v0,10
    syscall


.data

endl: .asciiz"\n"
name: .space 81
ainp: .asciiz" Enter bit a : "
binp: .asciiz" Enter bit b  : "
agb: .asciiz" A is Greater than B"
bga: .asciiz" B is Greater than A"
eq: .asciiz" A equals B"

