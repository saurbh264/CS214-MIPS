# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 0
    li $t1, 1

    nor $t3,$t0,$t0
    nor $t4,$t1,$t1

    and $t5,$t3,$t1
    and $t8,$t4,$t0

    or $t9,$t5,$t8

    and $s0,$t3,$t1

    ; Sum same A^B // diff = A.notB

    # to exit system call bellow is it  when store 10 in v0
    li $v0,10
    syscall