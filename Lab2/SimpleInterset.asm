# Start .text segment (program code)
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

    mul.s $f4,$f1,$f2
    mul.s $f5,$f3,$f4
    li.s $f7,100.0
    div.s $f6,$f5,$f7

    li $v0,2
    mov.s $f12,$f6
    syscall

    add.s $f8,$f6,$f1
    
    li $v0,2
    mov.s $f10,$f8
    syscall

    # to exit system call bellow is it  when store 10 in v0
    li $v0,10
    syscall



