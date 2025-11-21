;Robert Martinez
; I think I've probably spent more time on this single assigment than any other assignment this semester. I'm genuinely sorry to submmit something very broken but this is the best
; I could come up without cheating. I understand if I don't get any credit. I would definitely love if possible to have the proper code and it's logic broken down to me. 


INCLUDE irvine32.inc
.data
nums DWORD 1000 DUP(0) ; array with 1000 elements filled with zeros
primes DWORD ? DUP (0)	; array with x amount of elements to be filled later	
			;so what I think I can do is, make an array up to 1000, skip to 2 since 1 isn't a prime. 
			;I can go through the array and mulitply it's self and anything divisble by it is struck off and put into into another array or taken out and then so on and so fourth
			;My only problem is, I don't know how to write this in assembly


.code
main PROC
	call fillArray ; Ideally it's 1 to 1000
	call sieve ; call proc that tests for primes
	call print ; ideally prints primes

next:
    exit

main ENDP

fillArray PROC  ; fills the array of 1000 numbers
mov ecx, 1000 ; counter set to 1000
mov edi, OFFSET nums
inc ecx
loop1:
INC eax ; incrament eax by 1 up to 1000
mov [edi], eax ; mov it into the array
add edi, type nums ; move to next slot
call writestring ; print the int in the element within array
loop loop1 ; loop loop1 until counter
ret
fillArray ENDP ; end fillarray PROC

sieve PROC 
inc  esi ; incrament source index  
cmp  esi,31 ; 31 is the largest prime to check for other composites by multiplying by itself
jl loop2 ; jump to loop if esi is not at 31 yet
loop2: ; loop through the array somehow and if its not a multiple of esi upto 31 then move it into primes? 
shl esi,500 ; multiply the esi by itself 500 times because the first number will be 2 and I have to tick off the first half
loop loop2
ret
sieve ENDP

print PROC
ecx, lengthof primes ; however many primes there are is how many times will loop
inc ecx
loop3:
mov [edi], eax 
add edi, type nums ; move to next slot
call writestring ; print the int in the element within array
ret
print ENDP
END main

