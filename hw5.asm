;Robert Martinez
INCLUDE irvine32.inc
.data
num1 DWORD ?
num2 DWORD ?
prompt1 BYTE "Enter first int",0
prompt2 BYTE "Enter second int",0
prompt3 BYTE " sum of int 1 and 2",0
prompt4 BYTE "Enter adding 10 to sum int",0
.code

main PROC
 call READ

main ENDP 
READ PROC 
	mov  edx,OFFSET prompt1
	call WriteString
	call  Crlf
	call readint
	mov num1,eax
	call dumpregs
	mov ebx,eax
	call dumpregs
	call  Crlf
	mov  edx,OFFSET prompt2
	call WriteString
	call  Crlf
	call readint
	mov num2,eax
	add eax, ebx
	call  Crlf
	mov  edx,OFFSET prompt3
	call WriteString
	call  Crlf
	call writeint
	call  Crlf
	mov edx,OFFSET prompt4
	call WriteString
	call  Crlf
	add eax,10
	call writeint

READ ENDP

END main
