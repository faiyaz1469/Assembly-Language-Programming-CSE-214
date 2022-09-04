.MODEL SMALL

.STACK 100H 

.DATA
 
 MSG1   DB  'ENTER NUMBER OF TERMS: $'        
 MSG2   DB  10,13,'THE FIBONACCI SEQUENCE IS:',13,10,'$'
 
 ARR DW 100 DUP(?) 
 X DW ?
 Y DW ?
 Z DW ?

.CODE

MAIN PROC 
         
         MOV AX, @DATA             ; initialize DS
         MOV DS, AX 
         
         LEA DX, MSG1              
         MOV AH, 9
         INT 21H 
    
         LEA SI,ARR
         CALL INDEC
         MOV X,AX
         MOV CX,X 
        
       ; PUSH AX
       ; CALL FIB
       ; CALL OUTDEC
       ; JMP EXIT
        
         XOR AX,AX
     
    LOOP_2:                  
         
         PUSH AX 
         MOV Z,AX
         CALL FIB 
                     

         MOV [SI], AX             ; set [SI]=AX
         ADD SI, 2 
         
         MOV AX,Z
         INC AX    
         
      LOOP LOOP_2   
       
         LEA DX, MSG2              
         MOV AH, 9
         INT 21H 
    
         LEA SI, ARR            ; set SI=offset address of ARR
         MOV CX, X
         DEC X
         MOV BX,X    
      
     LOOP_3:                   
         
         MOV AX, [SI]           ; set AX=[SI]
         
         CALL OUTDEC             
         
         CMP BX,0
         JE  EXIT
         
         MOV AH, 2                  
         MOV DL, ','                
         INT 21H                    
         ;MOV DL, ' '                
         ;INT 21H                 
          
         ADD SI, 2               ; set SI=SI+2 
         DEC BX 
                                            
     
     LOOP LOOP_3                 ; jump to label LOOP_3 if CX!=0

EXIT:        
        MOV AH,4CH
        INT 21H

MAIN ENDP

FIB PROC   
    
        PUSH BP
        MOV BP,SP  
        MOV AX,[BP+4]
        
        CMP AX,1
        JE  L1
        CMP AX,0
        JE  L2
       
        JNE L3
        
     L1:
        MOV AX,1
        JMP RETURN 
        
     L2:
        MOV AX,0
        JMP RETURN
  
     L3:
       
        MOV  DX,[BP+4]
        DEC  DX
        PUSH DX
        CALL FIB
        PUSH AX
        
        MOV  DX,[BP+4]
        SUB  DX,02H
        PUSH DX 
        CALL FIB
        
        POP BX
        ADD AX,BX 
        
  RETURN:
       
        POP BP
        RET 2

FIB ENDP 

INDEC PROC
    
    PUSH BX                     ;BX HOLDS TOTAL
    PUSH DX
    
    XOR BX,BX
   
    MOV AH,1
    INT 21H
     
 REPEAT:
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
    JNE REPEAT
    
    MOV AX,BX
   
    POP DX
    POP BX
    RET

INDEC ENDP 

OUTDEC PROC
  
   PUSH BX                        ; push BX onto the STACK
   PUSH CX                       
   PUSH DX                        

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     

 OUTPUT:                       
    
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                     
     INC CX                       
     OR AX, AX                    
    
   JNE OUTPUT                     ; jump to label OUTPUT if ZF=0

     MOV AH, 2                     

 DISPLAY:                      
    
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                     
  
   LOOP DISPLAY                   ; jump to label DISPLAY if CX!=0

    POP DX                        ; pop a value from STACK into DX
    POP CX                         
    POP BX                         
    RET                            
 
OUTDEC ENDP    
        
        END MAIN