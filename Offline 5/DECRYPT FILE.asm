.MODEL SMALL
.STACK 100H
.DATA

FILENAME DW 'Sample.txt',0 
FILE     DW 'Output.txt',0  
BUFFER DB 512 DUP (?)
HANDLE DW ?         
X DB ?

.CODE

MAIN PROC

MOV AX,@DATA
MOV DS,AX 

LEA DX,FILENAME
CALL OPEN
MOV HANDLE,AX

READ_LOOP:
       
        LEA DX,BUFFER
        MOV BX,HANDLE
        CALL READ
        OR AX,AX
        JE EXIT
        JMP READ_LOOP

EXIT:
   
    MOV BX,HANDLE
    CALL CLOSE 
    
     ;MOV AH,42H
     ;MOV BX,HANDLE
     ;XOR CX,CX
     ;XOR DX,DX
     ;MOV AL,2
     ;INT 21H
    
      LEA SI,BUFFER
      MOV CX,50
      MOV AL,[SI] 
      SUB AL,30H 
      MOV X,AL 
      XOR AL,AL
      
 LOOP_3:                   
         
         MOV AL, [SI+3]           ; set AX=[SI]  
         CMP AL,20H
         JE  L4 
         SUB AL,X
         CMP AL,60H
         JG L4
         JLE L1
      
      L1: 
         CMP AL,5AH
         JG L2  
         CMP AL,40H
         JG L4
         JMP L2
     
      L4:     
         MOV [SI],AL    
         JMP L3
     
      L2:
          ADD AL,26 
          MOV [SI],AL   
          JMP L3 
     
      L3:     
          INC SI                 ; set SI=SI+1 
                                            
   LOOP LOOP_3            
    
    LEA DX,FILE
    CALL OPENW
    MOV HANDLE,AX
   
    MOV BX,HANDLE
    MOV CX,50
    LEA DX,BUFFER
    CALL WRITE
   
    JMP EXIT_1
    
EXIT_1:
   
    MOV BX,HANDLE
    CALL CLOSE
       
    MOV AH,4CH
    INT 21H 

MAIN ENDP

OPEN PROC
   
    MOV AH,3DH
    MOV AL,0
    INT 21H
    RET

OPEN ENDP 

OPENW PROC

    MOV AH,3DH
    MOV AL,1
    INT 21H
    RET

OPENW ENDP

READ PROC

    MOV AH,3FH
    INT 21H
    RET

READ ENDP 
    
WRITE PROC
    
    MOV AH,40H
    INT 21H
    RET

WRITE ENDP

CLOSE PROC

    MOV AH,3EH
    INT 21H
    RET

CLOSE ENDP   
    
    END MAIN  
    
    
