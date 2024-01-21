.data
    prompt:     .asciiz "Enter name: "
    name1: .asciiz "Luv"
    name2: .asciiz "Nani"
    name3: .asciiz "Saurabh"

    names : .word  name1, name2, name3
    marks : .word  1, 2, 3, 4
            .word  10, 20, 30, 40
            .word  100, 200, 300, 400

    val:     .asciiz "\nvalid\n"
    inva:     .asciiz "Name not found\n"
    endl:     .asciiz "\n"
    inp: .space 81

.text
    .globl main

main:
    li $v0,4
    la $a0,prompt
    syscall

    li $v0,8
    la $a0,inp
    li $a1, 10
    syscall

    li $v0,4
    la $a0,endl
    syscall

    li $t0,0
    la $s0,inp
    li $t9,12

    j names_loop_to_match_name

    li $v0,10
    syscall


names_loop_to_match_name:
    beq $t0,$t9,not_found
    lw $s1,names($t0)
    
    li $t1,0
    j match_name

match_name:
    lb $t2,0($s0)
    lb $t3,0($s1)

    beqz $t2,not_match
    bne $t2,$t3,not_match

    addi $s1,$s1,1
    addi $s0,$s0,1

    j match_name

not_match:
    beqz $t3,matched
    add $t0,$t0,4

    j names_loop_to_match_name

matched:
    mul $t0,$t0,4
    
    li $t2,0
    j print_marks
    
    li $v0,10
    syscall

print_marks:
    beq $t2,4,end
    lw $t1,marks($t0)

    li $v0,1
    move $a0,$t1
    syscall

    li $v0,4
    la $a0,endl
    syscall

    add $t0,$t0,4
    add $t2,$t2,1

    j print_marks

end:
    li $v0,10
    syscall

not_found:

    li $v0,4
    la $a0,inva
    syscall

    li $v0,10
    syscall


