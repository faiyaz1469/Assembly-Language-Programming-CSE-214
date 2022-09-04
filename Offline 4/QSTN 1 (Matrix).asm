.MODEL SMALL

.STACK 100H

.DATA
   
    MSG1   DB  'ENTER MATRIX 1: ',13,10,'$'        
    MSG2   DB  10,13,'ENTER MATRIX 2: ',13,10,'$'
    MSG3   DB  10,13,'THE RESULTANT MATRIX: ',13,10,'$'

    ARRAY  DW  26 DUP(?)    
         
.CODE

MAIN PROC
    
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, MSG1              
     MOV AH, 9
     INT 21H

     LEA SI, ARRAY                ; set SI=offset address of ARRAY
     MOV CX, 2                    

  LOOP_1:                     
       
       MOV BX, 2                

  LOOP_2:                  
         CALL INDEC             

         MOV [SI], AX             ; set [SI]=AX
         ADD SI, 2                ; set SI=SI+2                 

         MOV AH, 2                
         MOV DL,0AH
         INT 21H               
         MOV DL,' '
         INT 21H                  
                                                
         DEC BX                    
         
         MOV AH, 2                  
         MOV DL, ' '                
         INT 21H                    
  
      JNZ LOOP_2                

         MOV AH, 2                  
         MOV DL, 0DH                
         INT 21H                    
         MOV DL, 0AH                
         INT 21H                   
         
     LOOP LOOP_1                    
     
         LEA DX, MSG2              
         MOV AH, 9
         INT 21H

         LEA SI, ARRAY             ; set SI=offset address of ARRAY
         MOV CX, 2                    

  LOOP_3:                     
      
        MOV BX, 2               

  LOOP_4:                   
         
        CALL INDEC               
         
         MOV [SI+8], AX             ; set [SI]=AX 
         MOV AX,[SI]
         MOV DX,[SI+8] 
         ADD AX,DX
         MOV [SI+16],AX  
        
         ADD SI, 2                ; set SI=SI+2

         MOV AH, 2                
         MOV DL, 0AH              
         INT 21H                  
         MOV DL,' '
         INT 21H                  
                                                
         DEC BX                    
         
         MOV AH, 2                  
         MOV DL, ' '                
         INT 21H         
      
     JNZ LOOP_4                  ; jump to label LOOP_4 if BX=0
          
         MOV AH, 2                  
         MOV DL, 0DH                
         INT 21H                    
         MOV DL, 0AH                
         INT 21H        
      
     LOOP LOOP_3                 ; jump to label LOOP_3 if CX!=0  
     
        LEA DX, MSG3            
        MOV AH, 9
        INT 21H

        LEA SI, ARRAY            ; set SI=offset address of ARRAY
        MOV CX, 2                    

  LOOP_5:                     
        MOV BX, 2                  

  LOOP_6:                   
         MOV AX, [SI+16]             ; set AX=[SI]

         CALL OUTDEC             
         
         MOV AH, 2                
         MOV DL, ' '              
         INT 21H   

         ADD SI, 2                ; set SI=SI+2
         DEC BX                  
     
     JNZ LOOP_6                  ; jump to label LOOP_6 if BX=0

       MOV AH, 2                  
       MOV DL, 0DH                
       INT 21H                    
       MOV DL, 0AH                
       INT 21H                   
    
    LOOP LOOP_5                  ; jump to label @LOOP_5 if CX!=0

     MOV AH, 4CH                 ; return control to DOS
     INT 21H

MAIN ENDP

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
   
   