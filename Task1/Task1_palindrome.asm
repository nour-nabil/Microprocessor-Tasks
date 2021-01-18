
; this sample checks if string is a palindrome or not.
; palindrome is a text that can be read backwards
; and give the same meaning as if it was read forward.
; for example: "abba" is polindrome.
; note: this program is case sensitive, "abba" is not "abba".

name "pali"

org 100h  

; set video mode    
mov ax, 3     ; text mode 80x25, 16 colors, 8 pages (ah=0, al=3)
int 10h       ; do it!

; cancel blinking and enable all 16 colors:
mov ax, 1003h
mov bx, 0
int 10h


jmp studentName

m1:
s db ' Name: Rania Hamada'
s_size = $ - m1
  db 0Dh,0Ah,'$'

studentName:

; first let's print it:
mov ah, 9
mov dx, offset s
int 21h  

stop1: 
    ; print new line 
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h 
    
    
jmp seatNo

m2:
no db ' Seat number: 83'
no_size = $ - m1
  db 0Dh,0Ah,'$'

seatNo:

; first let's print it:
mov ah, 9
mov dx, offset no
int 21h

stop2: 
    ; print new line 
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h 
    
jmp AcademicNo

m3:
Ano db ' Academic number: 01700724'
Ano_size = $ - m3
  db 0Dh,0Ah,'$'

AcademicNo:

; first let's print it:
mov ah, 9
mov dx, offset Ano
int 21h 


stop:

; wait for any key press:
;mov ah, 0
;int 16h 


; set segment register:
mov     ax, 0b800h
mov     ds, ax


; color all characters:
mov cx, 18  ; number of characters.
mov di, 03h ; start from byte after 'h'

c:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop c 
    
mov cx, 15  ; number of characters.
mov di, 143h ; start from byte after 'h'

d:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop d
    
  
mov cx, 25  ; number of characters.
mov di, 283h ; start from byte after 'h'

e:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop e 

ret


;msg1 db "  this is palindrome!$"
;msg2 db "  this is not a palindrome!$"




