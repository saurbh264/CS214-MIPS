# Start .text segment (program code)
    .text
    .globl main

main:

    li $v0,8
    la $a0,val
    li $a1,5
    syscall

    li $v0,4
    la $a0,hi
    syscall

    li $v0,4
    la $a0,val
    syscall

    li $v0,4
    la $a0,newmsg
    syscall

    # to exit system call bellow is it  when store 10 in v0
    li $v0,10
    syscall

    .data

hi: .asciiz"Hi "
val: .space 20
newmsg: .asciiz" MIPS assembley programming is very intersting to learn"
