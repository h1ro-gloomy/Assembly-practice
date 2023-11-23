org 100h


;mov ah, 0
;Int 0x16 ;keyboard interrupt

;mov ah, 0x0e 
;int 0x10     ; teletype interrupt


push offset str
call print
nop
ret                            

; print str
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
      
      jmp print_L
      
      
      
print_exit:   
    mov sp, bp
    pop bp
    ret 2

jmp $

str db 'hello neo',0