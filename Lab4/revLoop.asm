    .text
    .globl main
    
main:
    li $v0,4
    la $a0,inp
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    j loop_here

    li $v0,10
    syscall

loop_here:

    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,msg
    syscall

    sub $t1,$t0,1
    move $t0,$t1
    beq $t0,0,end

    j loop_here

end:
    li $v0,10
    syscall

.data
msg: .asciiz"\n"
name: .space 81
inp: .asciiz" Enter n : "

