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

    add $t0,1
    li $t1,1

    j iloop

    li $v0,10
    syscall

iloop:
    beq $t0,$t1,breakf
    li $t2,0
    j jloop

jloop:
    beq $t2,$t1,nextline

    li $v0,4
    la $a0,star
    syscall

    add $t2,1

    j jloop

nextline:
    li $v0,4
    la $a0,endl
    syscall

    add $t1,1

    j iloop

breakf: 
    li $v0,10
    syscall

.data

endl: .asciiz"\n"
name: .space 81
star: .asciiz"*"
n: .asciiz"Enter n: "

