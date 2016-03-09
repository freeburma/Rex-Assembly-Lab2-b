.global	main
.text
main:
	subui	$sp, $sp, 4
	sw	$13, 1($sp)
	sw	$ra, 2($sp)
	jal	readswitches
	addu	$13, $0, $1
	sw	$13, 3($sp)
	lw	$13, 3($sp)
	sw	$13, 0($sp)
	jal	counter_ctrl
	la	$13, L.2
	sw	$13, 0($sp)
	jal	putstr
	jal	exit
L.1:
	lw	$13, 1($sp)
	lw	$ra, 2($sp)
	addui	$sp, $sp, 4
	jr	$ra
.data
L.2:
	.asciiz	"Done!\n"
