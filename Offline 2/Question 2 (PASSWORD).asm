.MODEL SMALL

.STACK 100H

.DATA
    
    MSG1 DB 'ENTER PASSWORD: $'    
    MSG2 DB 10, 13,'INVALID PASSWORD $'
    MSG3 DB 10, 13,'VALID PASSWORD $'    
    X DB ?
    Y DB ?
    Z DB ? 

.CODE

MAIN PROC  
 
;initialize DS
    MOV AX, @DATA
    MOV DS, AX 
   
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1

;Putting random value in X,Y,Z    
    MOV BH,3
    MOV X,BH
    MOV BL,4
    MOV Y,BL
    MOV CL,5
    MOV Z,CL
    
    INT 21H  
   
L1: 
    
    CMP AL,21H
    JNGE  L2    ; JUMP IF NOT GREATER THAN OR EQUAL TO
    CMP AL,7EH 
    JNLE  L2    ; JUMP IF NOT GREATER THAN OR EQUAl TO
    JMP L3
    
L3:
    CMP AL,30H
    JNGE END_IF
    CMP AL,39H 
    JNLE L4 
    MOV BH,1
    MOV X,BH
    JMP END_IF

L4:
         
    CMP AL,41H
    JNGE END_IF
    CMP AL,5AH 
    JNLE L5
    MOV BL,1
    MOV Y,BL 
    JMP END_IF
    
L5:
   
    CMP AL,61H
    JNGE END_IF
    CMP AL,7AH 
    JNLE END_IF   
    MOV CL,1
    MOV Z,CL
    JMP END_IF
    

L2:
    MOV BH,X
    MOV BL,Y
    MOV CL,Z
    CMP BH,BL
    JNE L8
    CMP BH,CL
    JNE L8
    JMP L9


L8:     
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    JMP EXIT  
    
L9:
    MOV AH,9
    LEA DX,MSG3
    INT 21H 
    JMP EXIT   

END_IF:
    INT 21H
    JMP L1
    
;DOS exit

EXIT:   
    MOV AH, 4CH
    INT 21H
  
MAIN ENDP

    END MAIN    
         
    
          