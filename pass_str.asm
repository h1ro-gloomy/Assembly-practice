org 100h

MAX_STR EQU 255

lea si, str1
lea di, str2 
mov cx, 4 
rep movsb

jmp $

str1 db '1234',0
str2 db 5 dup(0)