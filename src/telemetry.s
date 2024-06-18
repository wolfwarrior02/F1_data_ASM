.section .data


# DEFINIZIONE SOGLIE

GiriMotoreMinimi:         #ricordati che gli input sono velocità, giri e Temperatura
    .long 5000            #ma gli output sono tempo, TipoLivelloRotazione, LivelloTemperatura, LivelloVelocità
GiriMotoreMassimo:
    .long 10000

VelocitaMinima:
    .long 100
VelocitaMassima:
    .long 250

TemperaturaMinima:
    .long 90
TemperaturaMassima:
    .long 110

# CREAZIONE VARIABILI

pilota:
     .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0" #20 spazi

tempo:
     .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

idstr:
    .ascii "\0\0\0"

vel:
    .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

giri:
    .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

temperatura:
    .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"



id:
  .long 0


idInt:
  .long 0


velocitaMax:
  .long 0

velocitaMaxStr:
  .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

TemperaturaMax:
  .long 0
TemperaturaMaxStr:
  .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

giriMax:
  .long 0
giriMaxStr:
  .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"


LOW:
  .ascii "LOW,\0"
MEDIUM:
  .ascii "MEDIUM,\0"
HIGH:
  .ascii "HIGH,\0"

LOW_v:
  .ascii "LOW\n\0"
MEDIUM_v:
  .ascii "MEDIUM\n\0"
HIGH_v:
  .ascii "HIGH\n\0"

media:
  .long 0

mediaStr:
  .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"

mediaTotale:
  .long 0
counter:
  .long 0





temperaturaAttuale:
  .long 0

velocitaAttuale:
  .long 0

giriAttuale:
  .long 0



.section .text
.global telemetry

telemetry:

movl 4(%esp), %esi  # salvo input in esi
movl 8(%esp), %edi  # salvo output in edi


pushl %eax
pushl %ebx
pushl %ecx
pushl %edx


xorl %eax, %eax
xorl %ebx, %ebx
xorl %ecx, %ecx
xorl %edx, %edx



########## CONTROLLO NOMI ##########

nomepilota:

leal pilota,  %eax

movb (%esi,%ecx),%dl
movb %dl, (%eax, %ecx)
incl %ecx
cmpb $10, %dl
jne nomepilota



call trovaPilota
movl %ebx, id  # prendo l'id dalla memoria e lo metto in id    #CONTROLLO

cmpl $20, id
je fineProgramma


########## TROVA ID ALLA RIGA GIUSTA ##########


inizioRiga:

xorl %edx, %edx
movl $-1, %ebx
xorl %eax, %eax

cmpb $0, (%esi, %ecx)
je StampaRigaFinale

decl %ecx

leal tempo, %eax    #CONTROLLO
                    #CONTROLLO se salviamo il tempo con la virgola e se in caso da problemi
salvaTempo:
	
    incl %ebx
    incl %ecx
    movb (%esi ,%ecx), %dl
    movb %dl, (%eax, %ebx)      #salvo il tempo nella variabile tempo

    cmpb $44, %dl               #CONTROLLO PER LA VIRGOLA
    jne salvaTempo

uscitaTempo:
  incl %ebx
  movb $0, (%eax, %ebx)

  movl $-1, %ebx
  leal idstr, %eax

prelevoId:                    #prendo l'id dal file #PRENDE IL SECONDO VALORE DAL FILE

  incl %ebx
  incl %ecx
  movb (%esi ,%ecx), %dl

  cmpb $44, %dl
  je controlloId

  movb %dl, (%eax, %ebx)      #salvo l'id nella variabile id
  jmp prelevoId


controlloId:
pushl %eax
call atoi   # l'id ora è in eax ed è un intero

movl %eax, idInt    #CONTROLLO IN EAX ABBIAMO IL TEMPO
popl %eax           #CONTROLLO

# check id

movl idInt, %eax

cmpl %eax, id  #dubbio
je azzeramento

#SKIPPPA LA RIGA
scorrir: #si entra se lid non è uguale
  movb (%esi,%ecx),%dl
  incl %ecx
  cmpb $0, %dl
je StampaRigaFinale
  cmpb $10, %dl
jne scorrir             # qua dentro si controlla se l'id corrisponde in altre righe e ci si porta alla riga con l'id che ci serve

  jmp inizioRiga #arrivi a fine riga e ricominci con quella successiva


# da qui la roba da fare azzeramento
#---------------------------------------------#
##########  PRENDIAMO I VALORI  ##########
##########      VELOCITA'       ##########
azzeramento:
movl $-1, %ebx
leal vel, %eax
xorb %dl, %dl

controlloVelocita:

  movb (%esi ,%ecx), %dl

  incl %ebx
  incl %ecx
  movb %dl, (%eax, %ebx)      # metto la velocità dentro a %eax
  cmpb $44, %dl
 jne controlloVelocita



 pushl %eax
 call atoi            # ora dentro il registro eax c'è la velocità in formato int
 movl %eax, velocitaAttuale     #salva la velocita attuale per stamparla
 popl %eax


 movl %eax,%edx                 # controllo se la velocità attuale è superiore alla velocità massima
 movl velocitaMax, %ebx
 call massimo
 movl %ebx, velocitaMax

addl %eax, media            #somma tutti i valori che prende per ogni ciclo
incl counter

#fine ciclo somma



##########      GIRI       ##########

movl $-1, %ebx
leal giri, %eax
xorb %dl, %dl

controlloGiri:

movb (%esi ,%ecx), %dl

incl %ebx
incl %ecx
movb %dl, (%eax, %ebx)      # metto i giri dentro a %eax
cmpb $44, %dl
jne controlloGiri

pushl %eax
call atoi    # ora dentro il registro eax ci sono i giri in formato int
movl %eax, giriAttuale
popl %eax


movl (%esi, %ecx), %edx       # controllo se i giri attuali sono superiori ai giri massimi
movl giriMax, %ebx
call massimo
movl %ebx, giriMax


##########      TEMPERATURA       ##########


movl $-1, %ebx
leal temperatura, %eax
xorb %dl, %dl

controlloTemperatura:

  movb (%esi ,%ecx), %dl

  incl %ebx
  incl %ecx
  movb %dl, (%eax, %ebx)      # metto la temperatura dentro a %eax
  cmpb $44, %dl
jne controlloTemperatura

 pushl %eax
 call atoi    # ora dentro il registro eax c'è la temperatura in formato int
 movl %eax, temperaturaAttuale
 popl %eax


 movl (%esi, %ecx), %edx        # controllo se la temperatura attuale è superiore alla temperatura massima
 movl TemperaturaMax, %ebx
 call massimo
 movl %ebx, TemperaturaMax


 # ora si ritrascivono in ordine i livelli nell'output
#--------------------------------------------#
leal tempo, %ebx
pushl %ebx
call stampa
popl %ebx

# RPM
giriL:

movl GiriMotoreMinimi, %eax
cmpl %eax, giriAttuale
jg giriH
#se arriva qua i giri del motore sono bassi

leal LOW, %ebx
pushl %ebx
call stampa
popl %ebx
jmp temperaturaL        #salta al controllo temperaatur se i giri erano bassi

giriH:
movl GiriMotoreMassimo, %eax
cmpl %eax, giriAttuale
jl giriM
#se arriva qua i giri del motore sono alti
leal HIGH, %ebx
pushl %ebx
call stampa
popl %ebx

jmp temperaturaL    #salta al controllo temperaatur se i giri erano alti

giriM:
#se arriva qua i giri del motore sono medi
leal MEDIUM, %ebx
pushl %ebx
call stampa
popl %ebx

#--------------------------------------------#
# TEMPERATURA

temperaturaL:
movl TemperaturaMinima, %eax
cmpl %eax, temperaturaAttuale
jg temperaturaH
#se arriva qua la temperatura è bassa
leal LOW, %ebx
pushl %ebx
call stampa
popl %ebx
jmp velocitaL

temperaturaH:
  movl TemperaturaMassima, %eax
  cmpl %eax, temperaturaAttuale
  jl temperaturaM
  # se arriva qua vuol dire che la temperatura è alta
  leal HIGH, %ebx
  pushl %ebx
  call stampa
  popl %ebx

jmp velocitaL

temperaturaM:

  # se arriva qua vuol dire che la temperatura è media
  leal MEDIUM, %ebx
  pushl %ebx
  call stampa
  popl %ebx



#--------------------------------------------#
#VELOCITA

velocitaL:
movl VelocitaMinima, %eax
cmpl %eax, velocitaAttuale
jg velocitaH

leal LOW_v, %ebx
pushl %ebx
call stampa
popl %ebx

jmp Acapo

velocitaH:
movl VelocitaMassima, %eax
cmpl %eax , velocitaAttuale
jl velocitaM

leal HIGH_v, %ebx
pushl %ebx
call stampa
popl %ebx

jmp Acapo

velocitaM:
leal MEDIUM_v, %ebx
pushl %ebx
call stampa
popl %ebx



Acapo:
jmp inizioRiga

#ControlloFineFile:
#stampare alla fine  GIRI massimi (giriMax),TEMPERATURA(TemperaturaMax), massimo VELOCITA massima(velocitaMax)   ,VELOCITA MEDIA(mediaTotale)

StampaRigaFinale:

movl giriMax, %eax
leal giriMaxStr, %ebx
call itoa

movl TemperaturaMax, %eax
leal TemperaturaMaxStr, %ebx
call itoa

movl velocitaMax, %eax
leal velocitaMaxStr, %ebx
call itoa

xorl %ebx, %ebx
xorl %edx, %edx
xorl %eax, %eax
xorl %ecx, %ecx



scorri:
  movb (%edi, %ecx), %dl
  incl %ecx
  cmpb $0, %dl
jne scorri

  decl %ecx

  leal giriMaxStr, %eax
# stampa dei giri massimi


stampaG:

    movb (%eax ,%ebx), %dl

    incl %ebx
    cmpb $0, %dl               #CONTROLLO PER LA VIRGOLA
    je uscitaStampaG
    movb %dl, (%edi, %ecx)      #salvo il tempo nella variabile tempo
    jmp stampaG

uscitaStampaG:

    movb $44, (%edi,%ecx)
    incl %ecx
    leal TemperaturaMaxStr, %eax
    xorl %ebx, %ebx

# stampa della temperatura massima

stampaT:

    movb (%eax ,%ebx), %dl

    incl %ebx
    cmpb $0, %dl               #CONTROLLO PER LA VIRGOLA
    je uscitaStampaT
    movb %dl, (%edi, %ecx)      #salvo il tempo nella variabile tempo
    jmp stampaT

uscitaStampaT:

    movb $44, (%edi,%ecx)
    incl %ecx
    leal velocitaMaxStr, %eax
    xorl %ebx, %ebx

# stampa della velocità massima

stampaV:

    movb (%eax ,%ebx), %dl

    incl %ebx
    cmpb $0, %dl               #CONTROLLO PER LA VIRGOLA
    je uscitaStampaV
    movb %dl, (%edi, %ecx)      #salvo il tempo nella variabile tempo
    jmp stampaV

uscitaStampaV:

    movb $44, (%edi,%ecx)
    incl %ecx

mediatotale:
    xorl %edx, %edx
    movl media, %eax
    movl counter, %ebx


    divl %ebx     # il valore della media viene salvato in eax
    

    #converti str media
    leal mediaStr, %ebx
    call itoa

    leal mediaStr, %eax
    xorl %ebx, %ebx
stampaM:

    movb (%eax ,%ebx), %dl

    incl %ebx
    cmpb $0, %dl               #CONTROLLO PER LA VIRGOLA
    je fineProgramma
    
    movb %dl, (%edi, %ecx)      #salvo il tempo nella variabile tempo
    jmp stampaM

    

fineProgramma:
    incl %ecx
    movb $10, (%edi,%ecx)
    incl %ecx
    movb $0, (%edi,%ecx)

popl %edx
popl %ecx
popl %ebx
popl %eax

ret
#
