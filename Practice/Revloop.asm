    .text
    .globl main
    
main:
    li $v0,4
    la $a0,n
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,4
    la $a0,endl
    syscall

    li $t1,0

    j iloop

    li $v0,10
    syscall

iloop:
    beq $t0,$t1,breakf

    li $v0,1
    move $a0,$t0
    syscall
    
    li $v0,4
    la $a0,endl
    syscall

    sub $t0,1

    j iloop

breakf: 
    li $v0,10
    syscall

.data

endl: .asciiz"\n"
name: .space 81
star: .asciiz"*"
n: .asciiz"Enter n: "

