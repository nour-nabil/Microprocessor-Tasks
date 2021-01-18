
;This code is used to get the prime factors of 2 unsigned numbers and then calculating their gcd and lcm 

; It's devided into 4 parts, the first part is to take the inputs from the user 

; the second part is to calculate the prime factors for each number 

; the third part is to calculate the gcd for each number 

; the last part is to calculate the lcm for each number

INCLUDE "EMU8086.INC"

name "Prime Factors - GCD - LCM"

org 100h

 

;---------------PRINT A WELCOMING MESSAGE -----------------------



; first let's print it:
mov ah, 9
mov dx, offset msg1 
int 21h

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h 

; first let's print it:
mov ah, 9
mov dx, offset msg2
int 21h 

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h

;-------------- TAKE THE FIRST INPUT FROM THE USER ----------------------------

INPUT: 

CALL TAKEINPUT

CMP BX, 1        ;CHECK IF THE INPUT IS GREATER THAN 1 
JG CHECK1         ;IF YES, GO TO CHECK IF IT'S LESS THAN OR EQUAL 255
JLE CALLAGAIN1


CHECK1: 
CMP BX, 255      ;CHECK IF IT'S LESS THAN 255 
JLE DOIT1
JG CALLAGAIN1 
RET


DOIT1:
MOV NUM1, BL     ; STORE AL IN NUM1
JMP ENDLOOP1
RET

CALLAGAIN1:
CALL TAKEINPUTAGAIN
CMP BX,1
JLE CALLAGAIN1
JG CHECK1
RET

LOOP INPUT

ENDLOOP1:
;---------------------------------------------------------------------


;-------------- TAKE THE SECOND INPUT ----------------------------

CALL TAKEINPUT   ;ASK THE USER FOR THE SECOND NUMBER


CMP BX, 1        ;CHECK IF THE INPUT IS GREATER THAN 1 
JG CHECK2         ;IF YES, GO TO CHECK IF IT'S LESS THAN OR EQUAL 255
JLE CALLAGAIN2


CHECK2: 
CMP BX, 255      ; CHECK IF IT'S LESS THAN 255 
JLE DOIT2
JG CALLAGAIN2 
RET


DOIT2:
MOV NUM2, BL     ; STORE AL IN NUM2
JMP ENDLOOP2
RET

CALLAGAIN2:   
CALL TAKEINPUTAGAIN
CMP BX,1
JLE CALLAGAIN2
JG CHECK2
RET

ENDLOOP2: 
;-----------------------------------------------------------------------------------

;------------------ CODE FOR GETTING THE PRIME FACTORS OF THE FIRST NUMBER ---------

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h 


; PRINT MSG5 
MOV AH, 9
MOV DX, OFFSET MSG5
INT 21H 

MOV AH, 0
MOV AL, NUM1
    
CALL PRINT_NUM  ;print the first number 

MOV AH, 9
MOV DX, OFFSET MSG6
INT 21H 

;----------------------------------------- 

MOV AX, 0000H  ;INITIALIZE AX
MOV AL, NUM1   ;COPY THE FIRST NUMER 
MOV BL, 2      ;TO EVEN OR ODD CHECK 
JMP CLOOP1 
 

CLOOP1:
    MOV DL, AL ;COPY AL TO USE AGAIN      
    DIV BL     ;DIVIDE BY 2
    
    CMP AH, 0  ;even 
    JE L1      ;GO TO L1
    
    CMP AH, 1  ;odd 
    
    MOV AL, DL
    MOV CL, 1 ;START LOOP FROM 3
    
    MUL AL
    MOV BX, AX 
    
    MOV AL, DL
    MOV DX, BX
    
    JE L2 
   
    
LOOP CLOOP1


L1: 
    MOV VAR3, AL

    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h 
    
    PRINT '2'   ;PRINT 2
    
    PUSH 2   ; TO STORE IN STACK 
    
    MOV AX, 0000H
    MOV AL, VAR3

    
    CMP AL, 1   ;CHECK AL VALUE 
    
    JE LOOPEND  ;IF IT'S EQUAL 1 
    
    JNE CLOOP1  ;   
RET
 

L2: 
    MOV AH, 0
    MOV VAR2, AL
    ADD CL, 2
    
    DIV CL
    CMP AH, 0
    JE L3 
    
    CMP AH, 1
    JGE L6
    

RET 

L3:
    
    MOV VAR5, AL
    MOV VAR4, CL
    
    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h 
    
    MOV AX, 0000H
    MOV CX, 0000H
    
    MOV CL, VAR4 
    MOV AL, CL 
    
    CALL PRINT_NUM
    
    PUSH AX  ; STORE IT IN STACK 
    
    MOV AX, 0000H
    MOV AL, VAR5
    CMP AL, 1
    JE LOOPEND 
    
    JG L4
    
    
RET 

L4:

    DIV CL
    CMP AH, 0
    JE L3 
    
    JNE L5
    
    
RET 

L5:
MOV AL, VAR5 
JMP L2
RET

L6:
MOV AL, VAR2
JMP L2
RET

LOOPEND: 


;------------------ CODE FOR GETTING THE PRIME FACTORS OF THE SECOND NUMBER --------- 

PUSH 0

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h 


; PRINT MSG5 
MOV AH, 9
MOV DX, OFFSET MSG5
INT 21H 

MOV AH, 0
MOV AL, NUM2
    
CALL PRINT_NUM  ;print the first number 

MOV AH, 9
MOV DX, OFFSET MSG6
INT 21H 

;----------------------------------------- 

MOV AX, 0000H  ;INITIALIZE AX
MOV AL, NUM2   ;COPY THE FIRST NUMER 
MOV BL, 2      ;TO EVEN OR ODD CHECK 
JMP CLOOP2 
 

CLOOP2:
    MOV DL, AL ;COPY AL TO USE AGAIN      
    DIV BL     ;DIVIDE BY 2
    
    CMP AH, 0  ;even 
    JE L1_1      ;GO TO L1
    
    CMP AH, 1  ;odd 
    
    MOV AL, DL
    MOV CL, 1 ;START LOOP FROM 3
    
    MUL AL
    MOV BX, AX 
    
    MOV AL, DL
    MOV DX, BX
    
    JE L2_1 
   
    
LOOP CLOOP2


L1_1: 
    MOV VAR3, AL

    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h 
    
    PRINT '2'   ;PRINT 2
    
    PUSH 2   ; STORE IT IN STACK 
    
    MOV AX, 0000H
    MOV AL, VAR3

    
    CMP AL, 1   ;CHECK AL VALUE 
    
    JE LOOPEND_1  ;IF IT'S EQUAL 1 
    
    JNE CLOOP2  ;   
RET
 

L2_1: 
    MOV AH, 0
    MOV VAR2, AL
    ADD CL, 2
    
    DIV CL
    CMP AH, 0
    JE L3_1 
    
    CMP AH, 1
    JGE L6_1
    

RET 

L3_1:
    
    MOV VAR5, AL
    MOV VAR4, CL
    
    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h 
    
    MOV AX, 0000H
    MOV CX, 0000H
    
    MOV CL, VAR4 
    MOV AL, CL 
    
    CALL PRINT_NUM 
    
    PUSH AX    ; STORE IT IN STACK 
    
    MOV AX, 0000H
    MOV AL, VAR5
    CMP AL, 1
    JE LOOPEND_1 
    
    JG L4_1
    
    
RET 

L4_1:

    DIV CL
    CMP AH, 0
    JE L3_1 
    
    JNE L5_1
    
    
RET 

L5_1:
MOV AL, VAR5 
JMP L2_1
RET

L6_1:
MOV AL, VAR2
JMP L2_1
RET

LOOPEND_1: 

 

;---------------------------------------------------------------------------------------  

;------------------------- GET COMMON FACTORS -----------------------------------------
  

MOV AX, 00H
MOV BX, 00H
MOV CX, 00H 
MOV DX, 00H 
MOV SI, 00H

FACTORS2:

MOV AX, SP 

POP AX 

MOV BX, AX

CMP BX, 0
JNE STORE2

MOV SI, 0
JE FACTORS1
 

STORE2:
    INC PRIMESLEN2
    MOV PRIMES2[SI], BL
    INC SI 
    JMP FACTORS2  
RET


FACTORS1:
MOV AX, SP 

POP AX 

MOV BX, AX

CMP BX, 0
JE ENDFACTORS 
JNE STORE1

STORE1:
    INC PRIMESLEN1
    MOV PRIMES1[SI], BL
    INC SI
    JMP FACTORS1  
RET 

ENDFACTORS:

;CMP PRIMESLEN1, PRIMESLEN2
;JGE SETCXG
;JL  SETCXL
;
;SETCXG:
;MOV CX, PRIMESLEN1
;RET
;
;SETCXL:
;MOV CX, PRIMESLEN2
;RET

MOV SI, OFFSET PRIMES1 
MOV DI, OFFSET PRIMES2

MOV DIHELP, DI
MOV CX, 0 

CMPLOOP1:
    MOV DX, CX

    MOV AL, [SI]  ;[SI] ELEMENT IN AL
    
    CMPLOOP2:
         
    MOV BL, [DI]
    
    INC DI
    
    CMP AL, BL
     
    JNE NOTSAME
    
    JE STORECOMMON ;STORE IN COMMON FACTOR ARRAY     
    
    LOOP CMPLOOP2
     
    
LOOP CMPLOOP1 

STORECOMMON:

MOV SIPRIMES, SI  ;SI OF PRIMES1 ARRAY 

MOV SI, SIFACTORS 

MOV COMMONFACTORS[SI], AL

INC SI 
MOV SIFACTORS, SI 

MOV [DI-1], 0 

INC DL
CMP DL, PRIMESLEN1
JGE ENDCMP
JL RESETL1AGAIN
RET

RESETL1AGAIN:
MOV CX, DX 
INC SIPRIMES
MOV SI, SIPRIMES
MOV DI, DIHELP  
JMP CMPLOOP1
RET 

NOTSAME:
INC CL
CMP CL, PRIMESLEN2
JG RESETL1   ; RESET CMPLOOP2 
JLE CMPLOOP2
RET

RESETL1:
INC DX
CMP DL, PRIMESLEN1
JG ENDCMP
 
MOV CX, DX
;INC SI
;MOV DI, DIHELP
JMP CMPLOOP1 
RET 

ENDCMP:


;----------------------- GET GCD FROM COMMON FACTORS ARRAY -----------------------------

MOV SI, 0
MOV AL, 1

GCDLOOP:    
    CMP COMMONFACTORS[SI], 0
    JE ENDGCD
    JNE CALCGCD ;CALCULATE GCD
LOOP GCDLOOP 
 

CALCGCD:
    MUL COMMONFACTORS[SI]
    MOV GCD, AX
    INC SI
    JMP GCDLOOP
RET 

ENDGCD: 

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h 


; PRINT GCD  
MOV AH, 9
MOV DX, OFFSET MSG7
INT 21H

MOV AX, GCD  
    
CALL PRINT_NUM  ;print gcd

;---------------------------- CALCULATE LCM ----------------------------------------

MOV AX, 00H
MOV BX, 00H

MOV AL, NUM1 
MOV BL, NUM2 

MUL BL 

MOV DX, GCD 
DIV DL  

MOV LCM,AX 

;PRINT A NEW LINE 
MOV dl, 10
MOV ah, 02h
INT 21h
MOV dl, 13
MOV ah, 02h
INT 21h  

; PRINT GCD  
MOV AH, 9
MOV DX, OFFSET MSG8
INT 21H

MOV AX, LCM 

CALL PRINT_NUM

; wait for any key press:
mov ah, 0
int 16h 

ret

primes1 db 100 dup(?) 
primes2 db 100 dup(?)
commonfactors db 100 dup(?)  

primeslen1 db 0 
primeslen2 db 0

SIPRIMES DW ? 
SIFACTORS DW 0
DIHELP DW ? 

GCD DW 1
LCM DW ?

msg1 db 'Welcome to our program for calculating prime factors$'

msg2 db 'This program takes two numbers and then prints the prime factors for each one$'

msg3 db 'Please, Enter a number between 2 and 255: $'

msg4 db 'Please, Enter a VALID number between 2 and 255: $'

msg5 db 'Prime factors of $'

msg6 db ' are: $'

msg7 db 'GCD = $'

msg8 db 'LCM = $'

NUM1 DB ?
NUM2 DB ?

VAR1 DB ?
VAR2 DB ?
VAR3 DB ?
VAR4 DB ?
VAR5 DB ?

; PROC TO TAKE INPUT FROM THE USER 

TAKEINPUT PROC 
    
    
    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h
    
    
    mov ah, 9
    mov dx, offset msg3
    int 21h 


    CALL SCAN_NUM  ; GET NUMBER IN CX 

    MOV AX, CX     ; COPY THE NUMBER TO AX
    
    MOV BX, AX 
    
    
    RET            ; RETURN TO CALLER 
    
    TAKEINPUT ENDP


; PROC TO TAKE INPUT AGAIN FROM THE USER
 
TAKEINPUTAGAIN PROC 
    
    ;PRINT A NEW LINE 
    MOV dl, 10
    MOV ah, 02h
    INT 21h
    MOV dl, 13
    MOV ah, 02h
    INT 21h
    
    mov ah, 9
    mov dx, offset msg4
    int 21h


    CALL SCAN_NUM  ; GET NUMBER IN CX 

    MOV AX, CX     ; COPY THE NUMBER TO AX
    
    MOV BX, AX
    
    RET
    
    TAKEINPUTAGAIN ENDP 
    
 

; MACROS TO DEFINE PROCS 

DEFINE_SCAN_NUM

;DEFINE_PRINT_STRING

DEFINE_PRINT_NUM

DEFINE_PRINT_NUM_UNS  ;REQUIRED FOR PRINT_NUM

;DEFINE_PTHIS