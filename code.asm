PRINTMSG MACRO MSG
    LEA DX,MSG
	MOV AH,9
	INT 21H  
	CALL NL                                           ; Macros 
ENDM
INPUT MACRO
    MOV AH,01
    INT 21H
ENDM
.MODEL SMALL
.STACK 100H
.DATA    

MSG1 DB '                .....WELCOME TO YOUR FIRST QUIZ.....$'
MSG2 DB 'Rules : $'
MSG3 DB '*. For Every Correct answer you will get 1 point.$'
MSG4 DB '*. Only enter single character answer i.e: a , b , c.$'
STRTMATH DB '.....MATHS QUIZ BEGINS.....  $' 
STRTENG DB '.....ENGLISH QUIZ BEGINS.....  $'
STRTGK DB '.....GENERAL KNOWLEDGE QUIZ BEGINS.....  $'
MSG5 DB 'Press Enter to start the quiz : $'
MSG6 DB 'Right Answer....$'
MSG7 DB 'Wrong Answer....$'
MSG8 DB 'You have successfully completed your quiz.$'
MSG9 DB 'Your Total obtained point is : $'
MSG10 DB 'Press 1 to Re-attempt quiz or 0 to Exit.$'
MSG11 DB 'CHOOSE THE SUBJECT FOR YOUR QUIZ.$'
MSG12 DB '   a)MATHS    b)ENGLISH    c) G.K$'
MSG13 DB '                    ***Thank you.! ***$'
OPT DB ?
Q1 DB '1. 2+3=?$'
QA1 DB '   a) 5    b) 6    c) 7$'
Q2 DB '2. 5+6=?$'
QA2 DB '   a) 10    b) 11    c) 12$'
Q3 DB '3. 15-12=?$'
QA3 DB '   a) 5    b) 1    c) 3$'                                       ;MATHS
Q4 DB '4. 3*6=?$'
QA4 DB '   a) 10    b) 18    c) 12$'
Q5 DB '5. 6/3=?$'
QA5 DB '   a) 2    b) 1    c) 12$'
Q6 DB '6. 8-8=?$'
QA6 DB '   a) -1    b) -2    c) 0$'
Q7 DB '7. 3*12=?$'
QA7 DB '   a) 33    b) 36    c) 38$'
Q8 DB '8. 9*9=?$'
QA8 DB '   a) 72    b) 91    c) 81$'
Q9 DB '9. 11+13=?$'
QA9 DB '   a) 24    b) 26    c) 19$'
Q10 DB '10. 56/8=?$'
QA10 DB '   a) 7    b) 9    c) 6$'  


BQ1 DB '1. What is the past tense of the verb "to be" ?$'
BQA1 DB '   a) Am    b) Is    c) Was$'
BQ2 DB '2. What is the plural form of the noun "mouse" ?$'
BQA2 DB '   a) Mice    b) Mouses    c) Meese $'
BQ3 DB '3. What is the opposite of the adjective "happy" ?$'
BQA3 DB '   a) Angry    b) Sad    c) Tired $'
BQ4 DB '4. What is the past participle of the verb "to eat" ?$'                                  
BQA4 DB '   a) Eaten    b) Ate    c) Eat $'
BQ5 DB '5. What is the conjunction used to connect two independent clauses? $'
BQA5 DB '   a) Or    b) But    c) and $'                                                            ;ENGLISH
BQ6 DB '6. What is the noun form of the verb "to explain" ?$'
BQA6 DB '   a) Explanation    b) Explainer    c) Explain$'
BQ7 DB '7. What is the adverb form of the adjective "fast" ?$'
BQA7 DB '   a) Fastly    b) Faster    c) Quickly$'
BQ8 DB '8. What is the possessive form of the noun "child"?$'
BQA8 DB '   a) Child s    b) Children    c) Childrens$'
BQ9 DB '9. What is the subject of the sentence "The dog chased the cat"?$'
BQA9 DB '   a) Dog    b) Cat    c) The$'
BQ10 DB '10. What is the future tense of the verb "to go" ?$'
BQA10 DB '   a) Go    b) Goes    c) Will go$' 

CQ1 DB '1. What is the smallest planet in our solar system?$'
CQA1 DB '   a) Mercury    b) Venus    c) Mars$'
CQ2 DB '2. What is the largest continent on Earth?$'
CQA2 DB '   a) Europe    b) Africa    c) Asi$a'
CQ3 DB '3. Who wrote the famous novel "The Great Gatsby" ?$'
CQA3 DB '   a) Harper Lee    b) F.Scott Fitzgerald    c) Ernest Hemingway$'
CQ4 DB '4. What is the capital of Italy?$'
CQA4 DB '   a) Rome    b) Paris    c) London$'
CQ5 DB '5. What is the highest mountain peak in the world?$'                                       
CQA5 DB '   a) Mount Denali    b) K2    c) Mount Everest$'                                         ;GENERAL KNOWLEDGE
CQ6 DB '6. What is the deepest ocean trench in the world?$'
CQA6 DB '   a) Mariana Trench    b) Tonga Trench    c) Phillipine Trench$'
CQ7 DB '7. Who was the first president of the United States?$'
CQA7 DB '   a) George Washington    b)  Abraham Lincoln   c) Ronald Reagan$'
CQ8 DB '8. What is the currency used in China?$'
CQA8 DB '   a) Yen    b) Renminbi    c) Dollar$'
CQ9 DB '9. Who was the lead singer of the band The Beatles?$'
CQA9 DB '   a) Ringo Starr    b) John Lennon    c) Paul McCartney$'
CQ10 DB '10. What is the largest bird in the world?$'
CQA10 DB '   a) Ostrich    b) Emu    c) Cassowary$'   
  

.CODE
MAIN PROC 
    MOV AX,@DATA
	MOV DS,AX
	
    PRINTMSG MSG1   
    PRINTMSG MSG2
    PRINTMSG MSG3
    PRINTMSG MSG4

TAKEOPT:                  ; For Selection of subject 
	CALL NL 
	                         ; LOAD EFFECTIVE ADDRESS
    PRINTMSG MSG11            ;it moves the contents of the designated memory location into the target register.
    CALL NL 
	
    PRINTMSG MSG12
	CALL NL
	
    INPUT
    mov OPT,AL 

FORMATHS: 
    CMP AL, 097
	JE MATH
	JNE FORENG 
	CALL NL
  
FORENG:           
    CMP AL, 098
	JE  ENGLISH
	JNE  FORGK
	CALL NL                                  ; The call instruction calls near procedures using a full pointer
	               ; When the called procedure completes, execution flow resumes at the instruction following the call instruction
FORGK:           
    CMP AL, 099
	JE  GK
	CALL NL                 
             
MATH:
	MOV BL, 0                          ;counter
    CALL NL
    PRINTMSG STRTMATH

     
QSN1:
	CALL NL
    
	PRINTMSG Q1
	                              ;disp q1 opts
    
	PRINTMSG QA1
	                              
	
	INPUT                             ;input ans
	
	
	CMP AL, 'a'
	JE QSN2
    JNE QSNW2
	
	
QSN2:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL QN2 
	
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN3
	JNE QSNW3
	
QSNW2:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL QN2 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN3 
	JNE QSNW3
	
	
QSN3:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL    

    
	CALL QN3 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN4
	JNE QSNW4
	
QSNW3:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL QN3
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN4 
	JNE QSNW4
	
QSN4:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN5
	JNE QSNW5
	
QSNW4:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL QN4 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN5 
	JNE QSNW5
	
QSN5:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL QN5 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN6
	JNE QSNW6
	
QSNW5:
	CALL NL
    
	PRINTMSG MSG7
	
	
	DEC BL
	CALL NL
    
	CALL QN5 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN6 
	JNE QSNW6
	
QSN6:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL QN6 
	
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN7
	JNE QSNW7
	
QSNW6:
	CALL NL
    
    PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL QN6 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN7 
	JNE QSNW7
	
QSN7:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL QN7
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN8
	JNE QSNW8
	
QSNW7:
	CALL NL
    
	PRINTMSG MSG7
	
	
	CALL NL
    
	CALL QN7 
	CALL INPUT
	
	CMP AL, 'b'
	JE QSN8 
	JNE QSNW8
	
QSN8:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN9
	JNE QSNW9
	
QSNW8:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL QN8 
	CALL INPUT
	
	CMP AL, 'c'
	JE QSN9 
	JNE QSNW9
	
QSN9:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN10
	JNE QSNW10
	
QSNW9:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL QN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE QSN10 
	JNE QSNW10
	
QSN10:
	CALL NL
	PRINTMSG MSG6	
	INC BL
	CALL NL    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT
	JNE EXITW
	
QSNW10:
	CALL NL    
    PRINTMSG MSG7	
	CALL NL    
	CALL QN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT 
	JNE EXITW
EXIT:
	CALL NL     
    PRINTMSG MSG6
	INC BL
	CALL NL
	CALL NL
    PRINTMSG MSG8
	CALL NL
	PRINTMSG MSG9
	
	
	ADD BL, 48
	
	CMP BL,57
	JG TEN
	MOV AH, 2
	MOV DL, BL
	INT 21H
	JMP EXIT1
	
	EXITW:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
	CALL NL  

    
PRINTMSG MSG8

	
	CALL NL
    CALL NL
    
PRINTMSG MSG9
	
	
	ADD BL,49
	MOV AH,2
	MOV DL, BL
	INT 21H
	
	JMP EXIT1
	
	TEN:
	MOV AH,2
	MOV DL,"1"
	INT 21H  
	MOV DL,"0"
	INT 21H
	JMP EXIT1
	
	NL: 
	MOV AH,2
	MOV DL, 0AH
	INT 21H   
    MOV DL, 0DH
    INT 21H
    RET 
    
    QN2:
 PRINTMSG Q2

	
	CALL NL
    
PRINTMSG QA2

	RET 
	
	QN3:
 PRINTMSG Q3

	
	CALL NL
    
PRINTMSG QA3

	RET
	
	QN4:
 PRINTMSG Q4

	
	CALL NL
    
PRINTMSG QA4

	RET
	
	QN5:
 PRINTMSG Q5
	
	
	CALL NL
    
PRINTMSG QA5

	RET 
	
	QN6:
 PRINTMSG Q6
	
	
	CALL NL
    
PRINTMSG QA6

	RET
	
	QN7:
    PRINTMSG Q7

	
	CALL NL
    
PRINTMSG QA7

	RET 
	
	QN8:
 PRINTMSG Q8

	
	CALL NL
    
PRINTMSG QA8

	RET  
	
	QN9:
 PRINTMSG Q9
	
	
	CALL NL
    
	PRINTMSG QA9

	RET 
	
	QN10:
 PRINTMSG Q10

	
	CALL NL
    
PRINTMSG QA10

	RET  
	       
	       
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GENERAL KNOWLEDGE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	       
	       
	       
	       
GK:
	MOV BL, 0                          ;counter
    CALL NL
    PRINTMSG STRTGK

     
	GQSN1:
	CALL NL
    
	PRINTMSG CQ1
	                              ;disp q1 opts
    
	PRINTMSG CQA1
	                              
	
	INPUT                             ;input ans
	
	
	CMP AL, 'a'        ;1
	JE GQSN2
    JNE GQSNW2
	
	
	GQSN2:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL GQN2 
	
	CALL INPUT
	
	CMP AL, 'a'       ;2
	JE GQSN3
	JNE GQSNW3
	
	GQSNW2:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL GQN2 
	CALL INPUT
	
	CMP AL, 'a'        ;3
	JE GQSN3 
	JNE GQSNW3
	
	
	GQSN3:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL    

    
	CALL GQN3 
	CALL INPUT
	
	CMP AL, 'b'         ;4
	JE GQSN4
	JNE GQSNW4
	
	GQSNW3:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL GQN3
	CALL INPUT
	
	CMP AL, 'b'         ;5
	JE GQSN4 
	JNE GQSNW4
	
	GQSN4:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
         
	CALL GQN4 
	CALL INPUT
	
	CMP AL, 'c'         ;6
	JE GQSN5
	JNE GQSNW5
	
	GQSNW4:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL GQN4 
	CALL INPUT
	
	CMP AL, 'c'          ;7
	JE GQSN5 
	JNE GQSNW5
	
	GQSN5:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL GQN5 
	
	CALL INPUT
	
	CMP AL, 'b'          ;8
	JE GQSN6
	JNE GQSNW6
	
	GQSNW5:
	CALL NL
    
	PRINTMSG MSG7
	
	
	DEC BL
	CALL NL
    
	CALL GQN5 
	CALL INPUT
	
	CMP AL, 'b'          ;9
	JE GQSN6 
	JNE GQSNW6
	
	GQSN6:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL GQN6 
	
	CALL INPUT
	
	CMP AL, 'c'          
	JE GQSN7
	JNE GQSNW7
	
	GQSNW6:
	CALL NL
    
    PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL GQN6 
	CALL INPUT
	
	CMP AL, 'c'
	JE GQSN7 
	JNE GQSNW7
	
	GQSN7:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL GQN7
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN8
	JNE GQSNW8
	
	GQSNW7:
	CALL NL
    
	PRINTMSG MSG7
	
	
	CALL NL
    
	CALL GQN7 
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN8 
	JNE GQSNW8
	
	GQSN8:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL GQN8 
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN9
	JNE GQSNW9
	
	GQSNW8:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL GQN8 
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN9 
	JNE GQSNW9
	
	GQSN9:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL GQN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN10
	JNE GQSNW10
	
	GQSNW9:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL GQN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE GQSN10 
	JNE GQSNW10
	
	GQSN10:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL GQN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXIT
	JNE EXITW
	
	GQSNW10:
	CALL NL
    
PRINTMSG MSG7

	
	
	CALL NL
    
	CALL GQN10 
	CALL INPUT
	
	CMP AL, 'a'
	JE EXITG 
	JNE EXITWG
	
	EXITG:
	CALL NL 
    
PRINTMSG MSG6
	
	INC BL
	CALL NL
	CALL NL
    
	PRINTMSG MSG8
	
	
	CALL NL
    
	PRINTMSG MSG9
	
	
	ADD BL, 48
	
	CMP BL,57
	JG TEN
	MOV AH, 2
	MOV DL, BL
	INT 21H
	JMP EXIT1
	
	EXITWG:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
	CALL NL  

    
PRINTMSG MSG8

	
	CALL NL
    CALL NL
    
PRINTMSG MSG9
	
	
	ADD BL,49
	MOV AH,2
	MOV DL, BL
	INT 21H
	
	JMP EXIT1
	
	TENG:
	MOV AH,2
	MOV DL,"1"
	INT 21H  
	MOV DL,"0"
	INT 21H
	JMP EXIT1
	 
    
    GQN2:
 PRINTMSG CQ2

	
	CALL NL
    
PRINTMSG CQA2

	RET 
	
	GQN3:
 PRINTMSG CQ3

	
	CALL NL
    
PRINTMSG CQA3

	RET
	
	GQN4:
 PRINTMSG CQ4

	
	CALL NL
    
PRINTMSG CQA4

	RET
	
	GQN5:
 PRINTMSG CQ5
	
	
	CALL NL
    
PRINTMSG CQA5

	RET 
	
	GQN6:
 PRINTMSG CQ6
	
	
	CALL NL
    
PRINTMSG CQA6

	RET
	
	GQN7:
    PRINTMSG CQ7

	
	CALL NL
    
PRINTMSG CQA7

	RET 
	
	GQN8:
 PRINTMSG CQ8

	
	CALL NL
    
PRINTMSG CQA8

	RET  
	
	GQN9:
 PRINTMSG CQ9
	
	
	CALL NL
    
	PRINTMSG CQA9

	RET 
	
	GQN10:
 PRINTMSG CQ10

	
	CALL NL
    
PRINTMSG CQA10

	RET  	       
	       
	       
	       
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ENGLISH;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	
ENGLISH:
  
  
  
  
  
  
	MOV BL, 0                          ;counter
    CALL NL
    PRINTMSG STRTENG

     
	EQSN1:
	CALL NL
    
	PRINTMSG BQ1
	                              ;disp q1 opts
    
	PRINTMSG BQA1
	                              
	
	INPUT                             ;input ans
	
	
	CMP AL, 'c'
	JE EQSN2
    JNE EQSNW2
	
	
	EQSN2:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL EQN2 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN3
	JNE EQSNW3
	
	EQSNW2:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL EQN2 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN3 
	JNE EQSNW3
	
	
	EQSN3:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL    

    
	CALL EQN3 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN4
	JNE EQSNW4
	
	EQSNW3:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL EQN3
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN4 
	JNE EQSNW4
	
	EQSN4:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
         
	CALL EQN4 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN5
	JNE EQSNW5
	
	EQSNW4:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL EQN4 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN5 
	JNE EQSNW5
	
	EQSN5:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL EQN5 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN6
	JNE EQSNW6
	
	EQSNW5:
	CALL NL
    
	PRINTMSG MSG7
	
	
	DEC BL
	CALL NL
    
	CALL EQN5 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN6 
	JNE EQSNW6
	
	EQSN6:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL EQN6 
	
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN7
	JNE EQSNW7
	
	EQSNW6:
	CALL NL
    
    PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL EQN6 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN7 
	JNE EQSNW7
	
	EQSN7:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL EQN7
	CALL INPUT
	
	CMP AL, 'd'
	JE EQSN8
	JNE EQSNW8
	
	EQSNW7:
	CALL NL
    
	PRINTMSG MSG7
	
	
	CALL NL
    
	CALL EQN7 
	CALL INPUT
	
	CMP AL, 'd'
	JE EQSN8 
	JNE EQSNW8
	
	EQSN8:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL EQN8 
	CALL INPUT
	
	CMP AL, 'd'
	JE EQSN9
	JNE EQSNW9
	
	EQSNW8:
	CALL NL
    
	PRINTMSG MSG7

	
	
	CALL NL
    
	CALL EQN8 
	CALL INPUT
	
	CMP AL, 'd'
	JE EQSN9 
	JNE EQSNW9
	
	EQSN9:
	CALL NL
    
	PRINTMSG MSG6
	
	
	INC BL
	CALL NL
    
	CALL EQN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN10
	JNE EQSNW10
	
	EQSNW9:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
    
	CALL EQN9 
	CALL INPUT
	
	CMP AL, 'a'
	JE EQSN10 
	JNE EQSNW10
	
	EQSN10:
	CALL NL
    
	PRINTMSG MSG6

	
	INC BL
	CALL NL
    
	CALL EQN10 
	CALL INPUT
	
	CMP AL, 'd'
	JE EXIT
	JNE EXITW
	
	EQSNW10:
	CALL NL
    
PRINTMSG MSG7

	
	
	CALL NL
    
	CALL EQN10 
	CALL INPUT
	
	CMP AL, 'd'
	JE EXITE 
	JNE EXITWE
	
	EXITE:
	CALL NL 
    
PRINTMSG MSG6
	
	INC BL
	CALL NL
	CALL NL
    
	PRINTMSG MSG8
	
	
	CALL NL
    
	PRINTMSG MSG9
	
	
	ADD BL, 48
	
	CMP BL,57
	JG TENE
	MOV AH, 2
	MOV DL, BL
	INT 21H
	JMP EXIT1
	
	EXITWE:
	CALL NL
    
	PRINTMSG MSG7
	
	
	
	CALL NL
	CALL NL  

    
PRINTMSG MSG8

	
	CALL NL
    CALL NL
    
PRINTMSG MSG9
	  
	  
	ADD BL,49
	MOV AH,2
	MOV DL, BL
	INT 21H
	
	JMP EXIT1
	
	TENE:
	MOV AH,2
	MOV DL,"1"
	INT 21H  
	MOV DL,"0"
	INT 21H
	JMP EXIT1
	
    
	

    
    EQN2:
 PRINTMSG BQ2

	
	CALL NL
    
PRINTMSG BQA2

	RET 
	
	EQN3:
 PRINTMSG BQ3

	
	CALL NL
    
PRINTMSG BQA3

	RET
	
	EQN4:
 PRINTMSG BQ4

	
	CALL NL
    
PRINTMSG BQA4

	RET
	
	EQN5:
 PRINTMSG BQ5
	
	
	CALL NL
    
PRINTMSG BQA5

	RET 
	
	EQN6:
 PRINTMSG BQ6
	
	
	CALL NL
    
PRINTMSG BQA6

	RET
	
	EQN7:
    PRINTMSG BQ7

	
	CALL NL
    
PRINTMSG BQA7

	RET 
	
	EQN8:
 PRINTMSG BQ8

	
	CALL NL
    
PRINTMSG BQA8

	RET  
	
	EQN9:
 PRINTMSG BQ9
	
	
	CALL NL
    
	PRINTMSG BQA9

	RET 
	
	EQN10:
 PRINTMSG BQ10

	
	CALL NL
    
PRINTMSG BQA10

	RET  
 
 
  EEXIT1: 
	CALL NL 
	CALL NL
	         
	      
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP      
	          	       
	       
	INPUT:
	CALL NL
    
	INPUT
	RET
	
	
	EXIT1: 
	CALL NL 
	CALL NL
	
PRINTMSG MSG10
	   CALL NL
	CALL NL
	INPUT
	
	CMP AL,'1'
	JE 	TAKEOPT 
	CMP AL,'0'
	JE FINISHg
	
FINISHg: 
    CALL NL
	CALL NL
    PRINTMSG MSG13  

END MAIN  
