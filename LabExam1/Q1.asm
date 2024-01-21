    .text
    .globl main
    
main:
    li $v0,4
    la $a0,inp
    syscall

    li $v0,5
    syscall
    move $t0,$v0

    li $v0,4
    la $a0,endl
    syscall

    beq $t0,5,end

    li $v0,4
    la $a0,ai
    syscall

    li $v0,5
    syscall
    move $t1,$v0

    li $v0,4
    la $a0,endl
    syscall

    li $v0,4
    la $a0,bi
    syscall

    li $v0,5
    syscall
    move $t2,$v0

    li $v0,4
    la $a0,endl
    syscall



    beq $t0,0,addn
    beq $t0,1,subn
    beq $t0,2,multi
    beq $t0,3,bitand
    beq $t0,4,bitor

addn:
    li $v0,4
    la $a0,sum
    syscall

    add $t3,$t1,$t2

    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    j main
subn:
    li $v0,4
    la $a0,subp
    syscall

    sub $t3,$t1,$t2

    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    j main
multi:
    li $v0,4
    la $a0,multin
    syscall

    mul $t3,$t1,$t2

    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    j main
bitand:
    li $v0,4
    la $a0,bit
    syscall

    and $t3,$t1,$t2

    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    j main
bitor:
    li $v0,4
    la $a0,bitorp
    syscall

    or $t3,$t1,$t2

    li $v0,1
    move $a0,$t3
    syscall

    li $v0,4
    la $a0,endl
    syscall

    j main

end:
    li $v0,4
    la $a0,breakf
    syscall
    li $v0,10
    syscall
    
.data

endl: .asciiz"\n"
inp: .asciiz" Enter n: "
ai:  .asciiz" Enter a: "
bi:  .asciiz" Enter b: "
sum:  .asciiz" sum is: "
subp:  .asciiz" Diff is: "
multin:  .asciiz" Multi is: "
bit:  .asciiz"Bitwise And is: "
bitorp:  .asciiz"Bitwise Or is: "
breakf:  .asciiz"Program Ended "


