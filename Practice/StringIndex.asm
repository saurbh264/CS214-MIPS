    .text
    .globl main
    
main:
    li $v0,4
    la $a0,enters
    syscall

    li $v0,8
    la $a0,name
    li $a1,5
    move $t1,$a0
    syscall

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,ans
    syscall

    lbu $t2, 2($t1)

    li $v0,11
    move $a0,$t2
    syscall

    li $v0,10
    syscall

.data

endl: .asciiz"\n"
name: .space 81
enters: .asciiz" Enter string : "
index: .asciiz" Enter Index Req : "
ans: .asciiz" Char is : "

