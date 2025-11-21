Table
; Robert Martinez
; 10/11/2023
; Comments
INCLUDE irvine32.inc
.data
&rob BYTE 1h
&rob1 SBYTE 2
rob2 WORD 3
rob3 SWORD 4
rob4 DWORD 55123h
rob5 SDWORD 1231451
rob6 FWORD 1234311
rob7 QWORD 123412342315
rob8 TBYTE 1h
rob9 REAL4  1.2
rob10 REAL8 1.3
rob11 REAL10 44.1
rob12 DB 225
rob13 DW 221
rob14 DD 11111
rob15 DQ 123h
rob16 DT "hi"
.code

main PROC
 call writeint
	exit
main ENDP
END main
