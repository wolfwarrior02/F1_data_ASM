.section .data


pilot_0_str:
    .string   "Pierre Gasly\n"
pilot_0_len:
    .long . - pilot_0_str

pilot_1_str:
    .string   "Charles Leclerc\n"
pilot_1_len:
    .long . - pilot_1_str

pilot_2_str:
    .string   "Max Verstappen\n"
pilot_2_len:
    .long . - pilot_2_str

pilot_3_str:
    .string   "Lando Norris\n"
pilot_3_len:
    .long . - pilot_3_str

pilot_4_str:
    .string   "Sebastian Vettel\n"
pilot_4_len:
    .long . - pilot_4_str

pilot_5_str:
    .string   "Daniel Ricciardo\n"
pilot_5_len:
    .long . - pilot_5_str

pilot_6_str:
    .string   "Lance Stroll\n"
pilot_6_len:
    .long . - pilot_6_str

pilot_7_str:
    .string   "Carlos Sainz\n"
pilot_7_len:
    .long . - pilot_7_str

pilot_8_str:
    .string   "Antonio Giovinazzi\n"
pilot_8_len:
    .long . - pilot_8_str

pilot_9_str:
    .string   "Kevin Magnussen\n"
pilot_9_len:
    .long . - pilot_9_str

pilot_10_str:
    .string  "Alexander Albon\n"
pilot_10_len:
    .long . - pilot_10_str

pilot_11_str:
    .string  "Nicholas Latifi\n"
pilot_11_len:
    .long . - pilot_11_str

pilot_12_str:
    .string  "Lewis Hamilton\0"
pilot_12_len:
    .long . - pilot_12_str

pilot_13_str:
    .string  "Romain Grosjean\n"
pilot_13_len:
    .long . - pilot_13_str

pilot_14_str:
    .string  "George Russell\n"
pilot_14_len:
    .long . - pilot_14_str

pilot_15_str:
    .string  "Sergio Perez\n"
pilot_15_len:
    .long . - pilot_15_str

pilot_16_str:
    .string  "Daniil Kvyat\n"
pilot_16_len:
    .long . - pilot_16_str

pilot_17_str:
    .string  "Kimi Raikkonen\n"
pilot_17_len:
        .long . - pilot_17_str

pilot_18_str:
    .string  "Esteban Ocon\n"
pilot_18_len:
    .long . - pilot_18_str

pilot_19_str:
    .string  "Valtteri Bottas\n"
pilot_19_len:
    .long . - pilot_19_str


invalid_pilot_str:
    .string "Invalid\0"
invalid_pilot_len:
    .long . - invalid_pilot_str

id:
     .long 0



.section .text
.global trovaPilota

.type trovaPilota @function    # definisco la funzione atoi (conversione da stringa a carattere)

trovaPilota:

pushl %ecx
pushl %edx

##################################################### 0

CercaPilota0:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_0_str, %ebx
  # leal pilota, %eax

  controllo0:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota1

    incl %ecx

    cmpb $10, %dl

  jne controllo0
  movl $0, id
jmp finepilota

##################################################### 1

CercaPilota1:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_1_str, %ebx
  # leal pilota, %eax

  controllo1:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota2

    incl %ecx

    cmpb $10, %dl

  jne controllo1
  movl $1, %eax
jmp finepilota

##################################################### 2

CercaPilota2:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_2_str, %ebx
  # leal pilota, %eax

  controllo2:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota3

    incl %ecx

    cmpb $10, %dl

  jne controllo2
  movl $2, id
jmp finepilota

##################################################### 3

CercaPilota3:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_3_str, %ebx
  # leal pilota, %eax

  controllo3:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota4

    incl %ecx

    cmpb $10, %dl

  jne controllo3
  movl $3, id
jmp finepilota

##################################################### 4

CercaPilota4:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_4_str, %ebx
  # leal pilota, %eax

  controllo4:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota5

    incl %ecx

    cmpb $10, %dl

  jne controllo4
  movl $4, id
jmp finepilota

##################################################### 5

CercaPilota5:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_5_str, %ebx
  # leal pilota, %eax

  controllo5:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota6

    incl %ecx

    cmpb $10, %dl

  jne controllo5
  movl $5, id
jmp finepilota

##################################################### 6

CercaPilota6:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_6_str, %ebx
  # leal pilota, %eax

  controllo6:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota7

    incl %ecx

    cmpb $10, %dl

  jne controllo6
  movl $6, id
jmp finepilota

##################################################### 7

CercaPilota7:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_7_str, %ebx
  # leal pilota, %eax

  controllo7:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota8

    incl %ecx

    cmpb $10, %dl

  jne controllo7
  movl $7, id
jmp finepilota

##################################################### 8

CercaPilota8:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_8_str, %ebx
  # leal pilota, %eax

  controllo8:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota9

    incl %ecx

    cmpb $10, %dl

  jne controllo8
  movl $8, id
jmp finepilota

##################################################### 9

CercaPilota9:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_9_str, %ebx
  # leal pilota, %eax

  controllo9:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota10

    incl %ecx

    cmpb $10, %dl

  jne controllo9
  movl $9, id
jmp finepilota

##################################################### 10

CercaPilota10:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_10_str, %ebx
  # leal pilota, %eax

  controllo10:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota11

    incl %ecx

    cmpb $10, %dl

  jne controllo10
  movl $10, id
jmp finepilota


##################################################### 11

CercaPilota11:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_11_str, %ebx
  # leal pilota, %eax

  controllo11:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota12

    incl %ecx

    cmpb $10, %dl

  jne controllo11
  movl $11, id
jmp finepilota

##################################################### 12

CercaPilota12:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_12_str, %ebx
  # leal pilota, %eax

  controllo12:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota13

    incl %ecx

    cmpb $10, %dl

  jne controllo12
  movl $12, id
jmp finepilota

##################################################### 13

CercaPilota13:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_13_str, %ebx
  # leal pilota, %eax

  controllo13:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota14

    incl %ecx

    cmpb $10, %dl

  jne controllo13
  movl $13, id
jmp finepilota

##################################################### 14

CercaPilota14:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_14_str, %ebx
  # leal pilota, %eax

  controllo14:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota15

    incl %ecx

    cmpb $10, %dl

  jne controllo14
  movl $14, id
jmp finepilota

##################################################### 15

CercaPilota15:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_15_str, %ebx
  # leal pilota, %eax

  controllo15:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota16

    incl %ecx

    cmpb $10, %dl

  jne controllo15
  movl $15, id
jmp finepilota

##################################################### 16

CercaPilota16:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_16_str, %ebx
  # leal pilota, %eax

  controllo16:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota17

    incl %ecx

    cmpb $10, %dl

  jne controllo16
  movl $16, id
jmp finepilota

##################################################### 17

CercaPilota17:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_17_str, %ebx
  # leal pilota, %eax

  controllo17:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota18

    incl %ecx

    cmpb $10, %dl

  jne controllo17
  movl $17, id
jmp finepilota

##################################################### 18

CercaPilota18:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_18_str, %ebx
  # leal pilota, %eax

  controllo18:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne CercaPilota19

    incl %ecx

    cmpb $10, %dl

  jne controllo18
  movl $18, id
jmp finepilota

##################################################### 19

CercaPilota19:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal pilot_19_str, %ebx
  # leal pilota, %eax

  controllo19:

    movb (%ebx ,%ecx), %dl

    cmpb %dl, (%eax,%ecx)
    jne PilotaNonValido

    incl %ecx

    cmpb $10, %dl
    jne controllo19
    movl $19, id

jmp finepilota

##################################################### pilota non valido

PilotaNonValido:

  xorl %ecx, %ecx
  xorb %dl ,%dl

  leal invalid_pilot_str, %edx

  ciclone:
    movb (%edx, %ecx), %bl
    movb %bl, (%edi, %ecx)
    incl %ecx
    cmpb $0, %bl
  jne ciclone

  movl $20, id
  jmp finepilota

finepilota:

movl id, %ebx

popl %edx
popl %ecx


ret
