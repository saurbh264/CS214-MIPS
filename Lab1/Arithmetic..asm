# Start .text segment (program code)
    .text
    .globl main

main:
    li $t0, 2
    li $t1, 1
    add $t2, $t0, $t1
    # sub $t3, $t0 , $t1
    mul $t5, $t0 , $t1
    div $t3, $t1 , $t2

    # addi: add imediate: $1,$2,100 : $1 = $2 + 100
    addi $t4 , $t0, 1
    # mult to store multiply in $low,$hi: upper 32 bits in hi lower 32 in low
    # mult $t2,$t3      : $hi,$low=$t2*$t3


    # to exit system call bellow is it  when store 10 in v0
    li $v0,10
    syscall
