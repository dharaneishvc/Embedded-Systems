	AREA fibonacci,CODE,READONLY
	ENTRY
MAIN	MOV R1,#16; n = 16
	MOV R3,#0; fn1 = 0
	MOV R0,#1; fn = 1
	MOV R2,#1; curr = 1
	LDR R5,=0x40000000;
	STR R3,[R5],#4;
	STR R0,[R5],#4;
Whn CMP R2, R1; while (curr < 1)
	beq endwhn;
	ADD R2,R2,#1; curr = curr + 1
	MOV R4,R0; tmp = fn
	ADDS R0,R0,R3; fn = fn + fn1
	MOV R3, R4; fn1 = tmp
	STR R0,[R5],#4;
	B Whn ; 
endwhn
STOP B STOP
	END