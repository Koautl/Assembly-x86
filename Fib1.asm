INCLUDE Irvine32.inc
; Robert Martinez
; 11/1/2023
; Fib version 1, couldn't use edx as stated in the syllabus :( sry

.code
main PROC

mov cx,0
mov ax,0
call writeint
mov bx,ax
mov ax,1
call writeint
MEOW :
	mov  ax,bx    
	add  ax,dx
	mov  bx,dx
	mov  dx,ax
	call writeInt
	inc cx
	cmp cx,25
	jle MEOW

    exit
main ENDP
END main