org 100h
MAX_STR EQU 255

Start:
cld

str1 db '1234',0
;str2 db 0,0,0,0,0,0,0,0,0,0,0,0,0,0
db 50 dup('A')
end:

db (end-Start) %2 dup('X')  ;viravnivaniye