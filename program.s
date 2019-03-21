.globl _start

_start:
  mov x0, #0
  mov x1, #1
  mov x2, #2
loop:
  add x2, x2 ,#2


  b loop
