.MODEL SMALL

.STACK 100H

.DATA
    
    MSG1 DB 'ENTER 1ST NUMBER: $'    
    MSG2 DB 10, 13,'ENTER 2ND NUMBER: $'
    MSG3 DB 10, 13,'ENTER 3RD NUMBER: $'    
    MSG4 DB 10, 13,'THE SECOND LARGEST NUMBER IS: $' 
    MSG5 DB 10, 13,'ALL THE NUMBERS ARE EQUAL $'   
    X DB ?
    Y DB ?
    Z DB ?  

.CODE

MAIN PROC  
 
;initialize DS
    MOV AX, @DATA
    MOV DS, AX 
    
;print user prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

;input of X   
    MOV AH, 1
    INT 21H 
    MOV X,AL  
  
;print user prompt 
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
   
;input of Y 
    MOV AH, 1
    INT 21H 
    MOV Y,AL  
       
;print user prompt 
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
   
;input of Z 
    MOV AH, 1
    INT 21H 
    MOV Z,AL  
    
;1st Condition   X>Y && X>Z
    MOV BL,X
    MOV BH,Y
    CMP BL,BH 
     JE L2      ; Jump If Equal
    JNG L3      ; Jump If Not Greater Than
    CMP BL,Z
    JNG L3
    CMP BH,Z
    JNGE L1     ; Jump If Not Greater Than Or Equal To
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, BH   
    INT 21H  
    JMP EXIT  

L1: 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, Z  
    INT 21H  
    JMP EXIT  

        
L2: 
    CMP BL,Z
    JNG L3 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, Z  
    INT 21H  
    JMP EXIT 

;2nd condition   Y>Z && Y>X
L3: 
    MOV BL,Y
    MOV BH,Z
    CMP BL,BH
     JE L5
    JNG L6
    CMP BL,X
    JNG L6
    CMP BH,X
    JNGE L4    
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, BH   
    INT 21H  
    JMP EXIT  
L4: 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, X  
    INT 21H  
    JMP EXIT  
L5:
    CMP BL,X
    JNG L6 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, X  
    INT 21H  
    JMP EXIT 
    
;3rd condition     Z>X && Z>Y
L6:                
    MOV BL,Z
    MOV BH,X
    CMP BL,BH
     JE L8
    JNG L9
    CMP BL,Y
    JNG L9
    CMP BH,Y
    JNGE L7    
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, BH   
    INT 21H  
    JMP EXIT  
L7: 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, Y  
    INT 21H  
    JMP EXIT  
L8:
    CMP BL,Y
    JNG L9 
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display RESULT     
    MOV AH, 2
    MOV DL, Y  
    INT 21H  
    JMP EXIT
    
L9: 
   
    LEA DX,MSG5
    MOV AH,9
    INT 21H
    JMP EXIT   
    
;DOS exit 

EXIT:
    MOV AH, 4CH
    INT 21H
  
MAIN ENDP

    END MAIN