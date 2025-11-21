;Robert Martinez-Olivera
;Date - 11/29/2023
INCLUDE Irvine32.inc
    .data
	gradeA BYTE "A",0
	gradeB BYTE "B",0
	gradeC BYTE "C",0
	gradeD BYTE "D",0
	gradeF BYTE "F",0
	generatedTestGrades SDWORD 10 DUP(0) ; array for 10 tests
	
.code
main PROC
call writestring
Call dumpregs
	mov ecx,10 ; loop 10 times
L1:	
	MOV EAX,100
	CALL randomRange ; generate random int from 0-100
	INC EAX
	MOV  generatedTestGrades[ESI],EAX ; move int into array
	ADD ESI,TYPE generatedTestGrades
	LOOP L1
	
    exit

main ENDP
END main
COMMENT!
GradeCalc PROC ; pass in array, and compare each element in the array
.IF <>  ; if element in array is  90 between 100 print A
.ELSEIF <> ;if element in array is  80 between 89 print B
.ELSEIF <> ;if element in array is   70 between 79 print C
.ELSEIF <> ;if element in array is  60 between 69 print D
.ELSE <> . ; print F
GradeCalc ENDP



