.data
prompt: .asciiz "Enter n: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

	jal	fac

	move $a0, $v0
	jal	print_int
	jal	print_newline

    li $v0, 10
    syscall

fac:	

    addi $sp,  $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
	move $s0, $a0
    
    li $t9,1
	beq	$t9, $s0, done
	
	addi $a0, $s0, -1
	jal	fac

    mul $v0,$v0,$s0

	j finish
	
done:	
    add	$v0, $0, $s0
	j	finish
	
finish: 
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addi $sp, $sp, 8
	jr	$ra

print_int:
	move $a0, $v0
	li	$v0, 1
	syscall
	jr	$ra
	
print_newline:
	li	$a0, '\n'
	li	$v0, 11
	syscall
	jr	$ra