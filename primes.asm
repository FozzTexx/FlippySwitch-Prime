;;; Program to display prime numbers on IMSAI front panel
;;; created by FozzTexx for Flippy Switch Week on RetroBattlestations.com
;;; Tried to make it as small as possible at the cost of executing much
;;; more than it needs to.
	
	ORG	0000h
	
LEDS	EQU	0ffh

	MVI	A,0ffh
	OUT	LEDS
	XRA	A
	MOV	C,A
	MOV	L,A
	MVI	B,10h
	MOV	H,B
SETUP:	STAX	B	; zero array
	INR	C
	JNZ	SETUP
	MVI	C,2
SIEVE:	LDAX	B
	MOV	E,C
	INR	C
	JZ	SIEVED
	ORA	A
	JNZ	SIEVE
	MOV	A,E
MARK:	ADC	E
	JC	SIEVE
	MOV	L,A
	MOV	M,A
	JMP	MARK

SIEVED:	MVI	C,2
	MVI	L,0ffh
NEXTPR:	LDAX	B
	ORA	A
	JNZ	INCPR

	MOV	A,L
	CALL	DISP
	MOV	A,C
	XRA	L
	CALL	DISP

INCPR:	INR	C
	JNZ	NEXTPR
DONE:	JMP	DONE

DISP:	OUT	LEDS
DELAY:	DCX	D
	MOV	A,D
	ORA	E
	JNZ	DELAY
	RET
