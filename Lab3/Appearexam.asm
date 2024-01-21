    .text
    .globl main
    
main:

    li $v0,6
    syscall
    mov.s $f1,$f0

    li.s $f2,80.0
    li.s $f3,60.0
    li.s $f4,40.0

    c.lt.s $f1,$f4
    bc1t Fg

    c.le.s $f2,$f1
    bc1t Ag

    c.lt.s $f1,$f2
    bc1t Bg




    li $v0,10
    syscall

Fg: 
    li $v0,4
    la $a0,F
    syscall

    li $v0,10
    syscall
Ag: 
    li $v0,4
    la $a0,A
    syscall

    li $v0,10
    syscall
Bg: 
    c.le.s $f3,$f1
    bc1f Cg

    li $v0,4
    la $a0,B
    syscall

    li $v0,10
    syscall
Cg: 
    c.le.s $f4,$f1
    bc1f Fg

    li $v0,4
    la $a0,C
    syscall

    li $v0,10
    syscall

.data
msg: .asciiz"\n"
A: .asciiz"A Grade"
B: .asciiz"B Grade"
C: .asciiz"C Grade"
F: .asciiz"F Grade"
