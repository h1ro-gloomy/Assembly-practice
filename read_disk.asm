org 100h

mov ah, 2  ; head number
mov dh, 0  ; number of line
mov ch, 0  ; number of line
mov cl, 1  ; sector
mov al, 1  ; number of sectors
mov bx, 0x200
int 13h 