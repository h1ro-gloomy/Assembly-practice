org 100h

MAX_STR EQU 255

xor ax,ax
lea di, str
mov cx, 4
rep stosb

jmp $

str1 db '1234',0
