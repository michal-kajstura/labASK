.data
hello_msg: .asciiz "Hello friend\n"
.text

main:
	li $v0,4
	la $a0,hello_msg
	
	syscall
	li $v0,10
	syscall