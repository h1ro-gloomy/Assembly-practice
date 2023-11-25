org 100h

ORIG_INT EQL 0x600

xor ax,ax
mov si, ax
mov ds,ax 

; orig  int 13h backup
les ax, [13h * 4] ;assume hook int 13h
mov bx, es
mov cs:[ORIG_INT+0], ax ; save offset
mov cs:[ORIG_INT+2], bx ; save segment

;set new int 13h

mov [si+13h * 4 + 0], NewInt13h
push cs
pop bx
mov [si+13h * 4 + 2], bx

mov ah,3 
xor dx, dx :example for zf flag reset 

mov ah, 2
mov dh, 0
mov ch, 0
mov cl, 1
mov al, 1
mov bx, 0x200
ihn 13h

nop
nop

newInt13:
	cmp ah, 2
	jnz goto_orig

	;pushf
	;push cs
	;push process
	;jmp far cs:[ORIG_INT]
	pushf
	call far cs:[ORIG_INT]
process:	

	nop
goto_orig:
	jmp far [cs:old_vector]
iret


jmp $

