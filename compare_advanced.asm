org 100h
MAX_STR EQU 255

cld
lea si, str1
lea di, str2 
mov cx, MAX_STR
repz cmpsb
;jnz NOTEQ




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lea si, str1
lea di, str2 

M:
	cmpsb
	loopz M 
	jnz NOTEQ
	nop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lea si, str1
lea di, str2
mov cx, MAX_STR
L:
	mov al, [si]
	mov ah, [di]
	inc si   ;pointer offset
	inc di   ;pointer offset
	cmp al, ah
	
	loopz L
	jnz NOTEQ
	nop
	;EQ
	;jz L

jmp$

str1 db '1234',0
str2 db '1434',0