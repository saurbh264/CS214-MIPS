# Start .text segment (program code)
    .text
    .globl main

main:

    li $v0,8
    la $a0,val
    li $a1,5
    syscall
    
    move $t0,$v0
    li $v0,12
    syscall

    move $t1,$v0
    li $v0,12
    syscall
    
    move $t2,$v0
    
    li $v0,11
    move $a0,$t1
    syscall

    # to exit system call bellow is it  when store 10 in v0
    li $v0,10
    syscall

    .data


val: .space 20