name "hi-world"

; this example prints out  "hello world!"
; by writing directly to video memory.
; in vga memory: first byte is ascii character, byte that follows is character attribute.
; if you change the second byte, you can change the color of
; the character even after it is printed.
; character attribute is 8 bit value,
; high 4 bits set background color and low 4 bits set foreground color.

; hex    bin        color
; 
; 0      0000      black
; 1      0001      blue
; 2      0010      green
; 3      0011      cyan
; 4      0100      red
; 5      0101      magenta
; 6      0110      brown
; 7      0111      light gray
; 8      1000      dark gray
; 9      1001      light blue
; a      1010      light green
; b      1011      light cyan
; c      1100      light red
; d      1101      light magenta
; e      1110      yellow
; f      1111      white
 


org 100h

; set video mode    
mov ax, 3     ; text mode 80x25, 16 colors, 8 pages (ah=0, al=3)
int 10h       ; do it!

; cancel blinking and enable all 16 colors:
mov ax, 1003h
mov bx, 0 

int 10h


; set segment register:
mov     ax, 0b800h
mov     ds, ax

; print "Name"
; first byte is ascii code, second byte is color code.

mov [02h], 'N'

mov [04h], 'a'

mov [06h], 'm'

mov [08h], 'e'

mov [0ah], ':'

mov [0ch], ' '

mov [0eh], 'R'
 
mov [10h], 'a'

mov [12h], 'n'

mov [14h], 'i'

mov [16h], 'a'

mov [18h], ' ' 

mov [1ah], 'H'

mov [1ch], 'a'

mov [1eh], 'm'

mov [20h], 'a'

mov [22h], 'd'

mov [24h], 'a' 


;Print seat number

mov [142h], 'S'

mov [144h], 'e'

mov [146h], 'a'

mov [148h], 't'

mov [14Ah], ' '

mov [14ch], 'N'

mov [14eh], 'u'

mov [150h], 'm'

mov [152h], 'b'

mov [154h], 'e'

mov [156h], 'r'

mov [158h], ':'

mov [15ah], '8'

mov [15ch], '3'


;Print Academic ID 

mov [282h], 'A'

mov [284h], 'c'

mov [286h], 'a'

mov [288h], 'd'

mov [28ah], 'e'

mov [28ch], 'm'

mov [28eh], 'i'

mov [290h], 'c'

mov [292h], ' '

mov [294h], 'N'

mov [296h], 'u'

mov [298h], 'm'

mov [29ah], 'b'

mov [29ch], 'e'

mov [29eh], 'r'

mov [2a0h], ':'

mov [2a2h], '0'

mov [2a4h], '1'

mov [2a6h], '7'

mov [2a8h], '0'

mov [2aah], '0'

mov [2ach], '7'

mov [2aeh], '2'

mov [2b0h], '4'




; color all characters:
mov cx, 18  ; number of characters.
mov di, 03h ; start from byte after 'h'

c:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop c
    
    
mov cx, 14  ; number of characters.
mov di, 143h ; start from byte after 'h'

d:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop d
    
    
mov cx, 24  ; number of characters.
mov di, 283h ; start from byte after 'h'

e:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop e   

; wait for any key press:
mov ah, 0
int 16h

ret

