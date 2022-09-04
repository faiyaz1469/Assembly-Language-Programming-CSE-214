.MODEL SMALL

.STACK 100H

.DATA
    CR EQU 0DH
    LF EQU 0AH
    
    MSG1 DB 'ENTER A UPPER CASE LETTER: $'
    MSG2 DB CR, LF, 'PREVIOUS LOWER CASE LETTER IS: $' 
    MSG3 DB CR, LF, '1S COMPLIMENT OF THE GIVEN LETTER IS: $'
    CHAR1 DB ? 
    CHAR2 DB ? 
    X DB ?
    

.CODE

MAIN PROC
;initialize DS
    MOV AX, @DATA
    MOV DS, AX 
    
;print user prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

;input a upper case character and convert it to previous lower case     
    MOV AH,1
    INT 21H
    MOV X,AL 
    MOV BL,X
    ADD BL,1FH
    MOV CHAR1,BL
    
;display on the next line
    LEA DX,MSG2
    MOV AH,9
    INT 21H  
    
;display the previous lower case character  
    MOV AH,2
    MOV DL,CHAR1
    INT 21H

;2ND PART 
    MOV BH,X
    NEG BH  
    DEC BH  
    MOV CHAR2,BH
    
;display on the next line
    LEA DX, MSG3
    MOV AH, 9
    INT 21H  
    
;display 1'S compliment  
    MOV AH,2
    MOV DL,CHAR2
    INT 21H
    
;DOX exit
    MOV AH, 4CH
    INT 21H
  
MAIN ENDP

    END MAIN