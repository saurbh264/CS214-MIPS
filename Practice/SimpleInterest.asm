    .text
    .globl main
    
main:
    li $v0,4
    la $a0,enterp
    syscall
    
    li $v0,6
    syscall
    mov.s $f1,$f0

    li $v0,4
    la $a0,endl
    syscall
    
    li $v0,4
    la $a0,enterr
    syscall
    
    li $v0,6
    syscall
    mov.s $f2,$f0

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,entert
    syscall
    
    li $v0,6
    syscall
    mov.s $f3,$f0

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,ans
    syscall

    mul.s $f4,$f1,$f2
    mul.s $f5,$f3,$f4

    li.s $f7,100.0
    div.s $f6,$f5,$f7

    li $v0,2
    mov.s $f12,$f6
    syscall

    li $v0,10
    syscall

.data

endl: .asciiz"\n"
name: .space 81
enterp: .asciiz" Enter p : "
enterr: .asciiz" Enter r : "
entert: .asciiz" Enter t : "
ans: .asciiz" SI is : "

