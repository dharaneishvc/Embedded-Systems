		AREA missing,CODE,READONLY
		ENTRY
	
main	LDR R1,=array   		; Loading base address to a register
		LDR R4,[R1],#4   		; Loading first value as no of elements
		MOV R0,R4       		; Initializing counter register

loop 	LDR R2,[R1],#4   		; Loading value from array and updating the address
		ADD R3,R3,R2     		; Sum is stored in R3 register
		SUB R0,R0,#1     		; Decrementing counter value
		CMP R0,#1       		; Checking counter value
		BNE loop				; loop if prev check is not 1. (read n-1 elements, bcz 1 number is missing)

diff_find	ADD R6,R4,#1			; R6 = n+1
			LSR R6,#1				; R6 = (n+1)/2
			MUL R5,R4,R6			; R5 = n*(n+1)/2
			SUB R6,R5,R3			; R6 = n(n+1)/2 - sum
			STR R6,[R1]			; store the missing number (R6)
stop	B stop

array	DCD 5,1,2,4,5
		END