                                    ORG 100h            

MAX_STR_LENGTH = 255

mov si, 0
mov cx, MAX_STR_LENGTH

;@@:     

L:
    mov al, str1[si] ;index iteration
    inc si
    test al, al
    loopne L
    
jmp $

str1 db '1234',0