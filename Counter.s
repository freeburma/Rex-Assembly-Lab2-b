.global	counter
.text
counter:
	subui	$sp, $sp, 4
	sw	$7, 1($sp)
	sw	$13, 2($sp)
	sw	$ra, 3($sp)
	lw	$13, 5($sp)
	sne	$13, $13, $0
	bnez	$13, L.2
	addu	$7, $0, $0
	j	L.7
L.4:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay100
L.5:
	addi	$7, $7, 1
L.7:
	lw	$13, 4($sp)
	sle	$13, $7, $13
	bnez	$13, L.4
L.2:
	lw	$13, 5($sp)
	snei	$13, $13, 1
	bnez	$13, L.8
	lw	$7, 4($sp)
	j	L.13
L.10:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay100
L.11:
	subi	$7, $7, 1
L.13:
	sge	$13, $7, $0
	bnez	$13, L.10
L.8:
L.1:
	lw	$7, 1($sp)
	lw	$13, 2($sp)
	lw	$ra, 3($sp)
	addui	$sp, $sp, 4
	jr	$ra
