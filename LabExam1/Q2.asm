    
     
     
    
    
    +++++++++++++++++++-   .text
    .globl main
    
main:
    li $t3,3
    
    j loopdd

    li $v0,10
    syscall
loopdd:
    beq $t3,$0,end
    li $v0,1
    move $a0,$t3
    syscall

    addi $t3,$t3,-1

    j loopdd

end:
    li $v0,10
    syscall
    
.data

n: .word 9


