; robert martinez
;I realized in the at the end that im just making a variable
;I just rewrote the proc since that's what the question in the book said to do
INCLUDE Irvine32.inc

.data
    array DWORD 1,2,3,4,5
.code


main PROC
    

    exit
main ENDP





BubbleSort PROC USES eax ecx esi, 
pArray:PTR DWORD,
Count:DWORD,
zp:DWORD

	mov zp, 0 ;couldnt find the exchange flag so im  using the zeroflag 
	mov ecx,Count 
	dec ecx
L1:	push ecx ; save outer loop count 
	mov esi,pArray ; point to first value

L2:	mov eax,[esi] ; get array value 
	cmp [esi+4],eax ; compare a pair of values 
	jg L3 ; if [ESI] <= [ESI+4], no exchange 
	xchg eax,[esi+4] ; exchange the pair 
	inc zp ; if exchage happens set zp to 1
	mov [esi],eax 
	

L3:	add esi,4 ; move both pointers forward 
	loop L2 ; inner loop 
	cmp zp,0
	je L4 ; if it equals 0 then jump to L4
	dec zp ;decrament zp to make it 0 again if set to 1
	pop ecx ; retrieve outer loop count 
	loop L1 ; else repeat outer 
	
	
L4:
	ret 
BubbleSort ENDP

END main