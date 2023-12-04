org 100h

MAX_STR EQU 255

xor ax,ax
lea si, str1
lea di, str2
mov cx, STR_LEN

L:
	lodsb
	xor al, 0x0D ; simple metasploit crypt example 
	stosb
	loop L
	;mov al, [si]
	;inc si             ;same as lodsb

jmp $

str1 db '1234',0
str2 db 5 dup (0)