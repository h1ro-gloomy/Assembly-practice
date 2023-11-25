section .data
  num1 dw 2
  num2 dw 4
  result dw 0

section .text
  global _start

_start:
  mov ax, num1
  mov bx, num2
  add ax, bx
  mov result, ax
  
  
  ; Завершить программу
  mov eax, 1
  xor ebx, ebx
  int 0x80