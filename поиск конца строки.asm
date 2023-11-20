ORG 100h            

MAX_STR_LENGTH = 255

mov si, offset str1
mov cx, MAX_STR_LENGTH

;@@:     

L:
    mov al, [si]
    test al, al
    loopne L
    
jmp $

str1 db '1234',0