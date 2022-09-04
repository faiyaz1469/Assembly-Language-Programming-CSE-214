.MODEL SMALL

.STACK 100H

.DATA
    
    MSG1 DB 'ENTER 1ST NUMBER: $'    
    MSG2 DB 10, 13,'ENTER 2ND NUMBER: $'
    MSG3 DB 10, 13,'THE 1ST RESULT IS: $'    
    MSG4 DB 10, 13,'THE 2ND RESULT IS: $' 
    MSG5 DB 10, 13,'THE 3RD RESULT IS: $'   
    MSG6 DB 10, 13,'THE 4TH RESULT IS: $'
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

;input of x   
    MOV AH, 1
    INT 21H 
    MOV X,AL  
    MOV BL,X

;print user prompt 
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
   
;input of Y 
    MOV AH, 1
    INT 21H 
    MOV Y,AL  
    MOV BH,Y 
    
    SUB BL,30H
    SUB BH,30H  
   
;1ST EQN    
    SUB BL,BH 
    SUB BL,BH
    ADD BL,30H
    MOV Z,BL  
   
    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
;display 1ST RESULT 
    MOV AH, 2
    MOV DL, Z
    INT 21H  

;CLEAR    
    MOV BL,X
    MOV BH,Y  
    
    SUB BL,30H
    SUB BH,30H  

;2ND EQN   
    ADD BL,BH  
    NEG BL
    ADD BL,19H
    ADD BL,30H 
    MOV Z,BL  
   
    LEA DX,MSG4
    MOV AH,9
    INT 21H

;display 2ND RESULT     
    MOV AH,2
    MOV DL,Z
    INT 21H      

;CLEAR    
    MOV BL,X
    MOV BH,Y  
    
    SUB BL,30H 
    SUB BH,30H    

;3RD EQN    
    ADD BL,BL  
    SUB BL,BH 
    SUB BL,BH
    SUB BL,BH
    ADD BL,30H
    MOV Z,BL    
   
    LEA DX,MSG5
    MOV AH,9
    INT 21H

;display 3RD RESULT     
    MOV AH, 2
    MOV DL, Z  
    INT 21H       
    
;CLEAR    
    MOV BL,X
    MOV BH,Y 
    
    SUB BL,30H 
    SUB BH,30H  
    
;4TH EQN    
    INC BH
    NEG BL
    ADD BL,BH 
    ADD BL,30H
    MOV Z,BL    
  
    LEA DX,MSG6
    MOV AH,9
    INT 21H

;display 4TH RESULT     
    MOV AH, 2
    MOV DL, Z   
    INT 21H          
    
    
    
;DOX exit
    
    MOV AH, 4CH
    INT 21H
  
MAIN ENDP

    END MAIN