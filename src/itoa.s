.section .data
end_str:		#Carattere di End String
.ascii "\0"

.section .text

.global itoa

.type itoa, @function

itoa:
	#Backup registri
	pushl %ecx
	pushl %edx

	#-------------------------------------------
	movl $1, %ecx			#Indice variabile input
	ciclo:
		#Controllo fine dato
		movl $10, %edx		#Carattere End String
		cmpl %edx,%eax
		jl end_ciclo
		
		pushl %ebx
		xorl %edx, %edx
		movl $10, %ebx
		divl %ebx
		popl %ebx
		addl $48, %edx
		pushl %edx
		incl %ecx
		jmp ciclo
	
	end_ciclo:
	addl $48, %eax
	pushl %eax
	movb end_str, %dl
	movb %dl, (%ebx, %ecx)
	
	movl $-1, %eax
	cicloS:
		incl %eax
		decl %ecx	
		popl %edx
		movb %dl, (%ebx, %eax)
		xorl %edx, %edx
		cmpl %edx, %ecx
	jne cicloS


	#-------------------------------------------	
	
	#Ripristino registri
	popl %edx
	popl %ecx

	ret
