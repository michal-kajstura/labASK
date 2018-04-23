.data

	iX: .asciiz "x: "
	i3: .asciiz "wspolczynnik przy x^3: "
	i2: .asciiz "wspolczynnik przy x^2: "
	i1: .asciiz "wspolczynnik przy x: "
	ic: .asciiz "stala: "
	wynik: .asciiz "="
	plus: .asciiz "+"
	x3: .asciiz "x^3"
	x2: .asciiz "x^2"
	x1: .asciiz "x"
	czyZakonczyc: .asciiz "\nCzy zakonczyc? \n0-nie, 1-tak"
.text

main:
	# wprowadz x
	li $v0, 4
	la $a0, iX
	syscall
	
	# pobierz x
	li $v0, 5
	syscall
	# przenies do s0
	move $s0, $v0
	# ---------------
	# wprowadz x^3
	li $v0, 4
	la $a0, i3
	syscall
	
	# pobierz
	li $v0, 5
	syscall
	# przenies do s1
	move $s1, $v0

	# ---------------

	# wprowadz x^2
	li $v0, 4
	la $a0, i2
	syscall
	
	# pobierz 
	li $v0, 5
	syscall
	# przenies do s2
	move $s2, $v0


	# ---------------
	# wprowadz x
	li $v0, 4
	la $a0, i1
	syscall
	
	# pobierz 
	li $v0, 5
	syscall
	# przenies do s3
	move $s3, $v0
	# ---------------
	# wprowadz stala
	li $v0, 4
	la $a0, ic
	syscall
	
	# pobierz 
	li $v0, 5
	syscall
	# przenies do s4
	move $s4, $v0
	# ---------------
	# teraz obliczenia
	# x ^ 3
	mul $t0, $s0, $s0
	mul $t0, $t0, $s0
	# razy wspolczynnik
	mul $t0, $t0, $s1
	
	# x^2
	mul $t1, $s0, $s0
	# razy wsp
	mul $t1, $t1, $s2
	
	# x razy wsp
	mul $t2, $s0, $s3
	
	# dodajemy wszystko, wynik w t3
	add $t3, $t0, $t1
	add $t3, $t3, $t2
	add $t3, $t3, $s4 
	
	#wyswietlamy wielomian
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, x3
	syscall
	
	li $v0, 4
	la $a0, plus
	syscall
	# --------------------
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 4
	la $a0, x2
	syscall
	
	li $v0, 4
	la $a0, plus
	syscall
	# --------------------
	li $v0, 1
	move $a0, $s3
	syscall
	
	li $v0, 4
	la $a0, x1
	syscall
	
	li $v0, 4
	la $a0, plus
	syscall
	# --------------------
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	li $v0, 4
	la $a0, wynik
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	
	li $v0, 4
	la $a0, czyZakonczyc
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, $zero, main
	
	li $v0, 10
	syscall
	
	