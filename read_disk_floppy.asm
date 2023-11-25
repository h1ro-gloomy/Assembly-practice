org 100h

mov ah, 2
mov dh, 0
mov ch, 0
mov cl, 1
mov al, 1
mov bx, 0x200
int 13h


push offset str
call print
nop
ret

print:
	push bp
	mov bp, sp
	sub sp, 2

	mov si, [bp+4]
	cld

print_L:
	lodsb
	test al, al
	jz print_exit
	mov ah, 0x0e
	int 0x10

print_exit:
	mov sp, bp
	pop bp
	ret 2

jmp $