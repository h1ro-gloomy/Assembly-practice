org 100h
mov cx, 3

;    dec cx
;    test cx, cx
;    jnz x

x: 
  test cx, cx
loop X

nop 

jmp $