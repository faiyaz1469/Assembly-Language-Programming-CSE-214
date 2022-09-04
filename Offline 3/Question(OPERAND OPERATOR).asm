.MODEL SMALL

.STACK 100H

.DATA

   MSG1  DB  'Enter Operand 1: $'  
   MSG2  DB  10,13,'Enter an Operator: $'
   MSG3  DB  10,13,'Enter Operand 2: $'  
   MSG4  DB  10,13,'WRONG OPERATOR $'
   MSG5  DB  10,13,'The Output is: $'
   
   X DB ?  
   Y DW ?
   Z DW ?

.CODE

MAIN PROC 
     MOV AX, @DATA                ; initialize DS and ES
     MOV DS, AX   
     
     LEA DX, MSG1                 ; load and print the string MSG1 
     MOV AH, 9
     INT 21H 
    
     CALL INDEC                   ; input of OPERAND 1
     MOV  Y,AX
     PUSH AX 

     LEA DX, MSG2                 ; load and print the string MSG2
     MOV AH, 9
     INT 21H 
                                  
     MOV AH,1                     ; input of OPERATOR
     INT 21H  
    
     CMP AL,'+'                   ; +,-,*,/ will be valid, q will quit the program
     JE  L2                       
     CMP AL,'-' 
     JE  L2    
     CMP AL,'*'
     JE  L2
     CMP AL,'/'
     JE  L2
     CMP AL,'q'
     JE  EXIT1
       
     MOV AH,9
     LEA DX,MSG4                   ; print wrong operator
     INT 21H 
     JMP EXIT1  
    
L2:
     MOV X,AL
    
     LEA DX, MSG3                   ; load and print the string MSG3
     MOV AH, 9
     INT 21H  
     
     CALL INDEC                     ; input of OPERAND 2
     MOV Z,AX 
     PUSH AX
   
    
     LEA DX, MSG5                   ; load and print the string MSG5
     MOV AH, 9                       
     INT 21H
     
     MOV AH,2
     MOV DL,'['
     INT 21H
     
     POP AX 
     MOV AX,Y                       ; display OPERAND 1
     CALL OUTDEC
     
     MOV AH,2
     MOV DL,']'
     INT 21H  
     
     MOV AH,2
     MOV DL,'['
     INT 21H
     
     MOV AH, 2                       ; display the OPERATOR
     MOV DL, X  
     INT 21H 
     
     MOV AH,2
     MOV DL,']'
     INT 21H 
     
     MOV AH,2
     MOV DL,'['
     INT 21H
     
     POP AX 
     MOV AX,Z                         ; display OPERAND 2
     CALL OUTDEC
     
     MOV AH,2
     MOV DL,']'
     INT 21H   
     
     MOV AH,2
     MOV DL,'='
     INT 21H  
     
     MOV AH,2
     MOV DL,'['
     INT 21H 
     
     MOV AL,X
     CMP AL,'+'
     JE  L3  
     CMP AL,'-'
     JE  L4 
     CMP AL,'*'
     JE  L5  
     CMP AL,'/'
     JE  L6
L3:     
     POP AX  
     MOV AX,Y
     MOV BX,Z
     ADD AX,BX
     CALL OUTDEC 
     JMP L7
    
L4:
     POP AX  
     MOV AX,Y
     MOV BX,Z
     SUB AX,BX
     CALL OUTDEC 
     JMP L7
    
L5:     
     POP AX  
     MOV AX,Y
     MOV BX,Z            ;AX=AX*BX
     IMUL BX
     CALL OUTDEC 
     JMP L7
    
L6:
     POP AX              ;DIVIDEND
     MOV AX,Y            ;EXTEND SIGN TO DX
     CWD
     MOV BX,Z
     IDIV BX             ;AX= QUOTIENT, DX REMAINDER
     CALL OUTDEC 
     JMP L7

L7:     
     MOV AH,2
     MOV DL,']'
     INT 21H   
    
EXIT1:   
   MOV AH,4CH
   INT 21H
    
MAIN ENDP
         
INDEC PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
BEGIN:
                             ;BX HOLDS TOTAL
     XOR BX,BX
                             ;CX HOLDS SIGN
     XOR CX,CX
     
     MOV AH,1
     INT 21H
     
     CMP AL,'-'
     JE MINUS
     CMP AL,'+'
     JE PLUS
     JMP REPEAT2
     
MINUS:
    MOV CX,1
    
PLUS:
    INT 21H
    
REPEAT2:
                             ;CONVERT TO DIGIT
    AND AX,000FH
    PUSH AX
    
    MOV AX,10
    MUL BX
    POP BX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JNE REPEAT2
    
    MOV AX,BX
    
    OR CX,CX
    JE EXIT
    
    NEG AX
    
EXIT:
    POP DX
    POP CX
    POP BX
    RET

    
INDEC ENDP    
    
    
             
OUTDEC PROC      
       
       PUSH AX
       PUSH BX
       PUSH CX
       PUSH DX
       
       OR AX,AX           ;CHECKS WHETHER AX<0 OR NOT
       JGE END_IF1
       
       PUSH AX
       MOV DL,'-'
       MOV AH,2
       INT 21H 
       POP AX
       NEG AX
  END_IF1:
        XOR CX,CX
        MOV BX,10
  REPEAT:
        XOR DX,DX
        DIV BX             ;AX QUOTIENT , DX REMAINDER
        PUSH DX            ;SAVE REMAINDER ON STACK
        INC CX
        
        OR AX,AX
        JNE REPEAT
        
        MOV AH,2
        
  PRINTLOOP:
        POP DX
        OR  DL,30H          ;CONVERT TO CHARACTER
        INT 21H
        LOOP PRINTLOOP
        
        POP DX
        POP CX
        POP BX
        POP AX 
        RET
        
OUTDEC ENDP                
  
  END MAIN