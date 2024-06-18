.section .data
.section .text

.type stampa @function
.global stampa
stampa:

pushl %eax
pushl %ebx
pushl %ecx
pushl %edx


movl $-1, %ecx
xorl %edx, %edx
xorl %eax, %eax

scorri:
  incl %ecx
  movb (%edi, %ecx), %bl  
  cmpb $0, %bl

jne scorri

decl %ecx

movl 20(%esp), %ebx     # prelevo la scritta che è stata messa precedentemente nello stack

stamp:

movb (%ebx,%eax),%dl
incl %eax
incl %ecx
cmpb $0, %dl
je end
movb %dl, (%edi, %ecx)    # inserisco nel file di output la scritta
jmp stamp

end:

popl %edx
popl %ecx
popl %ebx
popl %eax

ret
