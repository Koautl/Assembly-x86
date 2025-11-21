;Robert Martinez Olivera
;I got the quarter part correct, I'm just having trouble passing into the dimes etc.



INCLUDE Irvine32.inc
.data
	
	prompt1 BYTE "How much did the item cost?", 0 ; same prompt from flowgroithm
	PromptQ BYTE " # of Quarters returned = ", 0 ; prompt for number of quarters returned
	promptD BYTE " # of Dimes returned = ", 0 ; prompt for number of dimes returned
	promptN BYTE " # of Nickels returned =  ", 0 ; prompt for number of nickels returned
	promptP BYTE " # of Pennies returned = ", 0 ; prompt for number of pennies returned
	promptTotal BYTE "Total change given for 10 sales: ", 0 ; prompt for total change returned
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
        call writestring ; calls prompt
	call readint ; ask for user input
	mov chargeAmount,eax ; move charge amount to eax register
	mov ebx,eax ; move charge amount to ebx
	mov eax,100 ; move 100 to eax
	sub eax,ebx ;	subtract to get change; to get change, so if they pay 100, their change is 0 100 - 100 = 0, 50 - 100
	call dumpregs ; call dump regs
	call writeint ; call remainder of eax-ebx = 100 - charge amount
	cdq
	
	mov ebx,0 ; clear ebx
	mov edx, 0 
	mov ebx, 25 ; Divides chargeAmount by 25
	idiv ebx	; divide chargeAmount	
	call writeint
	mov edx, OFFSET PromptQ
        call WriteString
	mov eax, edx       ; move left over to use later in program
        call Crlf
	cdq
	mov edx, 0           
	mov ebx, 10          ; Divides chargeAmount by 10
	idiv ebx	; divide chargeAmount	
	call writeint
	add totalDimes, eax 
	mov edx, OFFSET promptD
        call WriteString
	mov eax, edx       ; move left over to use later in program
        call Crlf
	mov edx, 0            
	mov ebx, 5          ; Divides chargeAmount by 5
	idiv ebx	; divide chargeAmount	
	call writeint
	add totalNickels, eax  
	mov edx, OFFSET promptN
        call WriteString
	call Crlf
	mov eax, edx  
	mov edx, 0             
	mov ebx, 1          ; Divides chargeAmount by 1
	idiv ebx
	call writeint
	add totalPennies, eax  
	mov edx, OFFSET promptP
        call WriteString
	call Crlf
	dec cx
	je next
	jne loop1 ; kept getting error that loop jump was to far of distance so im using this to run back to the loop
	call Crlf
        
next:
	call Crlf ; new line
	mov edx, OFFSET promptTotal ; prompt
	call writestring ; print promt
	call Crlf ; new line

	mov eax, totalQuarters
	mov edx, OFFSET promptQ ; prompt
	call WriteString ; print promt
	call Writeint ; print total
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
