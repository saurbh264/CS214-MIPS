    .text
    .globl main
    
main:

    li $v0,6
    syscall
    mov.s $f1,$f0

    li $v0,6
    syscall
    mov.s $f2,$f0

    li $v0,6
    syscall
    mov.s $f3,$f0

    li $v0,4
    la $a0,msg
    syscall

    c.eq.s $f1,$f2
    bc1t f1eqf2

    c.lt.s $f2,$f3
    bc1t f3gf2

    c.lt.s $f1,$f3
    bc1t f1smallest
    bc1f f3smallest



    li $v0,10
    syscall

f3gf2: 
    c.lt.s $f1,$f2
    bc1f f1gf2

    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f2
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,10
    syscall

f1gf2: 
    li $v0,2
    mov.s $f12,$f2
    syscall

    c.lt.s $f1,$f3
    bc1f f1gf3

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,10
    syscall

f1gf3: 

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,10
    syscall

f1smallest:
    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f2
    syscall

    li $v0,10
    syscall

f3smallest:
    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,4
    la $a0,msg
    syscall

    c.lt.s $f1,$f2
    bc1t f2greatest


    li $v0,2
    mov.s $f12,$f2
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,10
    syscall

f2greatest:
    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f2
    syscall

    li $v0,10
    syscall

f1eqf2:

    c.le.s $f2,$f3
    bc1f f3smallest

    li $v0,2
    mov.s $f12,$f1
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f2
    syscall

    li $v0,4
    la $a0,msg
    syscall

    li $v0,2
    mov.s $f12,$f3
    syscall

    li $v0,10
    syscall



.data
msg: .asciiz"\n"
eqmsg: .asciiz" is equal to "
grtmsg: .asciiz" is greater than "

