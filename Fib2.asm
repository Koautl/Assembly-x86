INCLUDE Irvine32.inc
; 
; 11/1/2023
; Fib version 2
.code
main PROC
mov  ecx,25
mov eax, 0
call writeint
mov ebx, eax
mov eax, 1
call writeint


MEOW1 :
	mov edx, eax
	add edx, ebx
	mov ebx, eax
	mov eax, edx
	call writeint
	loop MEOW1


    exit
main ENDP

END main
