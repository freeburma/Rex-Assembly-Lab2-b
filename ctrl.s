.global	counter_ctrl
.text
counter_ctrl:
	subui	$sp, $sp, 6
	sw	$13, 0($sp)
	sw	$13, 1($sp)
	sw	$13, 2($sp)
	sw	$ra, 3($sp)
	sw	$13, 4($sp)
	sw	$13, 5($sp)
	
	
	
	
	lw	$13, 6($sp)
	andi	$13, $13, 127
	
	
	lw	$13, 6($sp)
	srai	$13, $13, 7
	
	
	lw	$13, 5($sp)
	lw	$13, 4($sp)
	
	jal	counter
L.1:
	lw	$13, 2($sp)
	lw	$ra, 3($sp)
	addui	$sp, $sp, 6
	jr	$ra
