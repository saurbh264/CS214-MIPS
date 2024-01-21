    .text
    .globl main
    
main:
    li $v0,4
    la $a0,msg
    syscall

    li $v0,8
    la $a0,val
    li $a1,5
    move $t0,$a0
    syscall

    lbu $t1, 1($t0)
    # 1($t0) = *(1+$t0)  1 as char
    
    li $v0,11
    move $a0,$t1
    syscall

    li $v0,10
    syscall




.data
val: .space 20
msg: .asciiz"Enter String \n"