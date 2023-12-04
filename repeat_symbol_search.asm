org 100h
MAX_STR EQU 255

cld
lea di, str
mov cx, MAX_STR
xor ax, ax 
repne scasb

sub di, offset str + 1 
mov ax, di

str db '1234',0