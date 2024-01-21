#nth number in fibonacci
.data
    arr: .word 1, 2, 3, 0

.text
.globl main

main:

    la $a0,0
    la $a1,3

    jal func

    move $a0, $v0
	li	$v0, 1
	syscall

    li $v0, 10
    syscall

func:
    addi $sp,  $sp, -12
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)

    move $s0,$a0
    move $s1,$a1

    add $t9,$s0,$s1
    div $t9,$t9,2

    beq $s0,$s1, return

    # call1
    move $a0,$s0
    move $a1,$t9

    jal func

    move $t0,$v0

    # call2
    addi $t9,$t9,1

    move $a0,$t9
    move $a1,$s1

    jal func

    ble $t0,$v0,ret_1

    j finish

ret_1:
    move $v0,$t0
    j finish

return:
    mul $t7,$s0,4
    lw $v0,arr($t7)
    j finish
	
finish: 
    lw	$s1, 8($sp)
	lw	$s0, 4($sp)
	lw	$ra, 0($sp)
	addi $sp, $sp, 12
	jr	$ra
    