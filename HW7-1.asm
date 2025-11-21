;Robert Martinez-Olivera
;Date - 12/20/2023
INCLUDE Irvine32.inc

.data
	gradeA BYTE "A", 0
	gradeB BYTE "B", 0
	gradeC BYTE "C", 0
	gradeD BYTE "D", 0
	gradeF BYTE "F", 0
	generatedTestGrades SDWORD 10 DUP(0) ; array for 10 tests


.code
main PROC
	call dumpregs
	mov ecx, 10 ; loop 10 times
	lea esi, generatedTestGrades ; Load the address of the array into ESI

L1:
	mov eax, 100
	call RandomRange ; ; generate random int from 0-99
	inc eax         ; Increment to make it 1-100
	mov [esi], eax  ; move int into array
	add edi, type generatedTestGrades ; move to next slot
	call writeint
	
	call CalcGrade
	loop L1
	
	
    exit
main ENDP

CalcGrade PROC USES ecx ESI EAX
	mov ecx, 10 ; loop 10 times
L2:
	lea esi, generatedTestGrades ; Load the address of the array into ESI
	
	cmp eax, 59
	jle GF

	cmp eax, 69				
	jle  GD

	cmp eax, 79				
	jle GC
	
	cmp eax, 89				
	jle GB

	cmp eax, 90				
	jge GA

	add edi, type generatedTestGrades ; move to next slot
	
	

GF:
	mov  edx,OFFSET gradeF
	call WriteString
	call  Crlf
	je next
GD:
	mov  edx,OFFSET gradeD
	call WriteString
	call  Crlf
	je next
GC:
	mov  edx,OFFSET gradeC
	call WriteString
	call  Crlf
	je next
GB:
	mov  edx,OFFSET gradeB
	call WriteString
	call  Crlf
	je next
GA:
	mov  edx,OFFSET gradeA
	call WriteString
	call  Crlf
	je next

next:
	ret
CalcGrade ENDP
END main 



