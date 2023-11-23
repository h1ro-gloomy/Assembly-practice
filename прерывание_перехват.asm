Mov ax, 0x1111
Mov bx, 0x2222
Xor si, si    
mov ds, si
Mov [si+2], ax
Mov [si+0], bx

xor ax, ax
div ah

ret
Int 0
