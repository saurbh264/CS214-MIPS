.data
    prompt1:     .asciiz "Enter:  "
    prompt2:     .asciiz "Enter string2 of upto 8 char: "
    prompt3:     .asciiz "Enter char : "
    s1:     .asciiz "\nstring1: \n"
    s2:     .asciiz "\nstring2: \n"
    len1:       .asciiz "\nLen of string 1: "
    len2:     .asciiz "\nLen of string 2: "
    found:     .asciiz "\nfound given char in string"
    not_found:     .asciiz "\nNot found given char in string"

    endl:     .asciiz "\n"
    inp1: .space 81
    inp2: .space 81
    concat_s: .space 81

.text
    .globl main

main:
    li $a0,1
    li $a1,2

    jal sum

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
func:
    addi $sp,$sp,-4
    sw $ra,0($sp)
    move $v1,$a0
    li $v0,1
    beq $a0,$zero,return

    addi $a0,$a0,-1
    addi $sp,$sp,-8

    sw $v1,0($sp)
    sw $a0,4($sp)

    jal func
    lw $v1,0($sp)
    lw $a0,4($sp)

    addi $sp,$sp,8
    mul $v0,$v0,$v1

return:
    lw $ra,0($sp)
    addi $sp,$sp,4
    jr $ra


sum: 
    addi $sp,$sp,-4
    sw $ra,0($sp)
    add $v0,$a0,$a1
    lw $ra,0($sp)
    addi $sp,$sp,4
    jr $ra