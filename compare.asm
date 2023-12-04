org 100h
MAX_STR EQU 255

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
	;jz L

jmp$

str1 db '1234',0
str2 db '1434',0