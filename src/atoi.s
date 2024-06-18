.section .data

fineStringa:
  .ascii "\0"   # stringa contenente il carattere di fine stringa

.section .text
.global atoi

.type atoi @function    # definisco la funzione atoi (conversione da stringa a carattere)

atoi:
  pushl %ebx    # carico nello stack lo stato dei registri facendo una sorta di backup
  pushl %edx
  pushl %ecx
  movl 16(%esp), %edx
  xorl %eax, %eax
  xorl %ecx, %ecx

  ciclo:                      # con questo ciclo scorriamo tutta la stringa finchè non si trova un carattere uguale
    movb fineStringa, %bl     #al carattere di fine stringa
    cmpb %bl, (%edx, %ecx)
    je fineCiclo

    movl $10, %ebx
    mull %ebx
    movl 16(%esp), %edx
    xorl %ebx, %ebx
    addb (%edx, %ecx), %bl
    subb $48, %bl
    addl %ebx, %eax
    incl %ecx
    jmp ciclo

  fineCiclo:

  popl %ecx
  popl %edx
  popl %ebx

  ret
