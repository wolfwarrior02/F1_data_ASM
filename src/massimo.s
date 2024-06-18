.section .data
.section .text

.type massimo @function
.global massimo
massimo:

cmpl %edx, %ebx      # confronto il massimo e il valore attuale messo su edx
jle fine            # se il valore è massimo
movl %edx, %ebx

fine:

ret
