.data
	podajPromien: .asciiz "Podaj promien okregu: "
	podajPunktX: .asciiz "x:  "
	podajPunktY: .asciiz "y: "
	zewnatrz: .asciiz "Punkt jest na zewnatrz okregu\n"
	wewnatrz: .asciiz "Punkt jest wewnatrz okregu\n"
	na: .asciiz "Punkt jest na okregu\n"
	powtorzPunkt : .asciiz "Nacisnij 0 by powtorzyc: "
	punktyWewnatrz: .asciiz "Ilosc punktow wewnatrz okregu: "

	
.text

main:
	# counter punktow w okregu
	addi $t1, $zero, 0
	
	# counter punktow na okregu
	addi $t2, $zero, 0
	
	# counter punktow poza okregiem
	addi $t3, $zero,  0

	# promien 
	li $v0, 4
	la $a0, podajPromien
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
podajXY:
	# punkt x do s0
	li $v0, 4
	la $a0, podajPunktX
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# punkt y do s1
	li $v0, 4
	la $a0, podajPunktY
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# x^2 do s2
	mul $s2, $s0, $s0
	# y^2 do s3
	mul $s3, $s1, $s1
	# r^2 do s4
	mul $s4, $t0, $t0
	# x^2 + y^2 do s5
	add $s5, $s2, $s3
	
porownaj:

	bne  $s5, $s4, mniejsze
	add $t2, $t2, 1
	
	li $v0, 4
	la $a0, na
	syscall
	
	j zapetl

mniejsze:
	# x^2 + y^2 < R^2
	bgt $s5, $s4, wieksze
	addi $t1, $t1, 1
		
	li $v0, 4
	la $a0, wewnatrz
	syscall
	
	j zapetl
wieksze:
	# else
	
	addi $t3, $t3, 1
	
	li $v0, 4
	la $a0, zewnatrz
	syscall
	
zapetl:
	# czy dodac wiecej punktow?
	li $v0, 4
	la $a0, powtorzPunkt
	syscall
	
	li $v0, 5
	syscall
	beqz $v0, podajXY
	
	li $v0, 4
	la $a0, punktyWewnatrz
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall
	
	

	


	