    .text
    .globl main
    
main:
    ; take input

    ; int 
    li $v0,5
    syscall
    move $t0,$v0

    
    ; float 
    li $v0,6
    syscall
    move $f1,$f0

    
    ; string 
    li $v0,8
    la $a0,inp
    li $a1, 5
    syscall

    ; char 
    li $v0,12
    syscall
    move $t2,$v0

    ; /////////////////////////

    ; print

    ; int 
    li $v0,1
    move $a0,$t0
    syscall
    
    ; float 
    li $v0,2
    la $f12,$f1
    syscall
    
    ; string 
    li $v0,4
    la $a0,inp
    syscall

    ; char
    li $v0,11
    la $a0,$t3
    syscall

    ; string index i / Ex i =2 and string in $t5
    lbu $t2,2($t5) 
    
.data

inp: .space 81

msg: .asciiz"\n"
eqmsg: .asciiz" is equal to "
grtmsg: .asciiz" is greater than "

