.data
array: .space 40
prompt: .asciiz"Enter the elements in the array: \n"
prompt2: .asciiz"Your Given array is: "
prompt3: .asciiz"Your Array after Bubble Sort is: "
newline: .asciiz"\n"

.text
.globl main

main:
	li $v0,4
	la $a0,prompt
	syscall

	li $t0,0
	li $t2,0
	li $s0,40

	j take_input
	
take_input:
	beq $t0,$s0,print_prompt

	li $v0,5
	syscall
	move $t1,$v0
	
	sw $t1,array($t0)
	addi $t0,$t0,4
	j take_input

print_prompt:
	li $v0,4
	la $a0,prompt2
	syscall

	j print_array
    
print_array:
	beq $t2,$s0,exit

	lw $t1,array($t2)

	addi $t2,$t2,4

	li $v0,1
	move $a0,$t1
	syscall

    # print space
	li $v0,11
	li $a0,32
	syscall

	j print_array
