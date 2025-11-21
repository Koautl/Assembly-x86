;Robert Martinez Olivera
;i've actually been having a lot of fun with this assignment. I feel really close and I will  sumbmit a working version the morning before the test.
;I just wanted to hand in a semi complete draft because I think I'll have to stay up and go past midnight.
;I need to calulate total and actually have it divide correctly but I think most of the structure is there


INCLUDE Irvine32.inc
.data
	
	prompt1 BYTE "How much did the item cost?", 0 ; same prompt from flowgroithm
	PromptQ BYTE " # of Quarters returned = ", 0 ; prompt for number of quarters returned
	promptD BYTE " # of Dimes returned = ", 0 ; prompt for number of dimes returned
	promptN BYTE " # of Nickels returned =  ", 0 ; prompt for number of nickels returned
	promptP BYTE " # of Pennies returned = ", 0 ; prompt for number of pennies returned
	promptTotal BYTE "Total change given for 10 sales: ", 0 ; prompt for total change returned
	total DWORD ?
	chargeAmount DWORD 0 ; HOW MUCH DID WE CHARGE THE COSTOMER
	totalQuarters DWORD 0 ; total number of quarters
	totalDimes DWORD 0 ; total number of dimes
	totalNickels DWORD 0 ; total number of nickels
	totalPennies DWORD 0 ; total number of pennies

.code
main PROC
   
    mov ecx, 10  ; Loop 10 times for 10 sales
loop1:
       
        mov edx, OFFSET prompt1 ; Ask user for the sale amount
        call WriteString
	call readint
	mov chargeAmount,eax
	mov ebx,100
	sub eax,ebx ;	subtract to get change; to get change, so if they pay 100, their change is 0 100 - 100 = 0, 50 - 100			
	call dumpregs
	call writeint
	mov eax,0		;reset to 0 for future use
	mov edx, 0             ; dividend high half = 0. 
	mov ebx, 25          ; Divides chargeAmount by 25
	div ebx	
	add totalQuarters, eax  
	mov edx, OFFSET PromptQ
        call WriteString
	call Writeint
	mov eax, edx       ; move left over to use later in program
        call WriteInt
        call Crlf
	mov edx, 0           
	mov ebx, 10          ; Divides chargeAmount by 10
	div ebx	
	add totalDimes, eax  
	mov edx, OFFSET promptD
        call WriteString
	call Writeint
	call Crlf
	mov eax, edx       ; move remainder to eax for next calculation
	mov edx, 0            
	mov ebx, 5          ; Divides chargeAmount by 5
	div ebx	
	add totalNickels, eax  
	mov edx, OFFSET promptN
        call WriteString
	call Writeint
	call Crlf
	mov eax, edx  
	mov edx, 0             
	mov ebx, 1          ; Divides chargeAmount by 1
	div ebx	
	add totalPennies, eax  
	mov edx, OFFSET promptP
        call WriteString
	call Writeint
	call Crlf
	dec cx
	je next
	jne loop1 ; kept getting error that loop jump was to far of distance so im using this to run back to the loop
	call Crlf
        
next:
	mov eax, total ; move total to eax
	mov edx, OFFSET promptTotal ; prompt
	call WriteString ; print promt
	call WriteInt ; print total
	call Crlf ; new line

	mov eax, totalQuarters
	mov edx, OFFSET promptQ ; prompt
	call WriteString ; print promt
	call WriteInt ; print total
	call Crlf ; new line

	mov eax, totalDimes
	mov edx, OFFSET promptD ; prompt
	call WriteString ; print promt
	call WriteInt ; print total
	call Crlf ; new line

	mov eax, totalNickels
	mov edx, OFFSET promptN ; prompt
	call WriteString ; print promt
	call WriteInt ; print total
	call Crlf ; new line

	mov eax, totalPennies
	mov edx, OFFSET promptP ; prompt
	call WriteString ; print promt
	call WriteInt ; print total
	call Crlf ; new line

	
    exit
main ENDP

END main
