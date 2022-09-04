.MODEL SMALL

.STACK 100H

.DATA
 
 XCUBE DW 184 
 X1CUBE DW ?
 X2CUBE DW ?
 YCUBE DW 50 
 Y1CUBE DW ?  
 Y2CUBE DW ?
 
 XLINE DW 100
 X1LINE DW ?
 X2LINE DW ?
 YLINE DW 190
 Y1LINE DW ?  
 Y2LINE DW ?
 
 NXLINE DW 160 
 NX1LINE DW ?
 NX2LINE DW ?
 NYLINE DW 70 
 NY1LINE DW ?  
 NY2LINE DW ?
             
 NNXLINE DW 30
 NNX1LINE DW ?
 NNX2LINE DW ?
 NNYLINE DW 140
 NNY1LINE DW ?  
 NNY2LINE DW ?   
 
 NNNXLINE DW 230
 NNNX1LINE DW ?
 NNNX2LINE DW ?
 NNNYLINE DW 100
 NNNY1LINE DW ?  
 NNNY2LINE DW ?
             
 CHECK DW 1
 
 RANDNUMBER DW 0 
 
 TIK DW ?  
 
 CHECK_UND DW 0
 NCHECK_UND DW 0 
 NNCHECK_UND DW 0  
 NNNCHECK_UND DW 0
  
 RATE DW 1  
 
 SCOREMSG DB 'Score: $'
 SCORE DW 0 
 SCORE1 DW 0  
 HIGHSCORE DW 0
 
 COUNT DW 3
 COUNT1 DW 3 
 
 X DW 1
 Y DW 1 
 
 BORDERX DW 1
 BORDERY DW 16 
                
  MSG DB 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,'             RAPID ROLL$'  
 MSG1 DB 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,'       PRESS 1 TO START THE GAME$'
 MSG2 DB 0AH,0DH,0AH,0DH,'       PRESS 2 FOR HELP$'
 MSG3 DB 0AH,0DH,0AH,0DH,'       PRESS 3 TO EXIT THE GAME$'
 MSG4 DB 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,'           CSE 214 PROJECT$'   
 MSG5 DB 0AH,0DH,0AH,0DH,'   PREPARED BY SONET,NABIL,BAKIBILLAH$' 
 MSG6 DB 0AH,0DH,' LIFE REMAINING: 3$'
 MSG7 DB 0AH,0DH,' LIFE REMAINING: 2$'
 MSG8 DB 0AH,0DH,' LIFE REMAINING: 1$'  
 MSG9 DB '                SCORE: $'   
 MSG10 DB 0AH,0DH,'LIFE REMAINING:$'
 
 
 IMSG1 DB 0AH,0DH,' YOU HAVE A SMALL CUBE THAT FALLS ALONG'
      db 0AH,0DH,0AH,0DH,' THROUGH THE SCREEN. BY CONTINUING IN'
      db 0AH,0DH,0AH,0DH,' YOUR DESCEND THROUGH LEVELS OF THE '
      db 0AH,0DH,0AH,0DH,' GAME,YOU GAIN POINTS'
      db 0AH,0DH,0AH,0DH,0AH,0DH,' CONTROLS:'
      db 0AH,0DH,0AH,0DH,' PRESS A TO MOVE LEFT'
      db 0AH,0DH,0AH,0DH,' PRESS D TO MOVE RIGHT'
      db 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,' PRESS ANY KEY TO GET BACK$'      

  GAMEOVERMSG DB 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,'              GAME OVER'
              DB 0AH,0DH,0AH,0DH,0AH,0DH,'            YOUR SCORE: $'
        
  GAMEOVERMSG1 DB 0AH,0DH,0AH,0DH,0AH,0DH,'         PRESS P TO PLAY AGAIN$'  
  
  GAMEOVERMSG2 DB 0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,0AH,0DH,'        YOU FORFEITED THE GAME$' 
  
  GAMEOVERMSG3 DB 0AH,0DH,0AH,0DH,0AH,0DH,'           PRESS X TO EXIT$'  
  
  
  HIGHESTMSG  DB  0AH,0DH,0AH,0DH,'           HIGHEST SCORE: 100$'   
  HIGHESTMSG2 DB  0AH,0DH,0AH,0DH,0AH,0DH,'           HIGHEST SCORE: $' 
  
  SCORE_ARRAY DB ? ;2,2,3,0,0
  
.CODE 


PLAY_AGAIN PROC   
    
  MOV XCUBE , 184
  MOV YCUBE , 50
 
  MOV XLINE , 100
  MOV YLINE , 190
 
  MOV NXLINE , 160
  MOV NYLINE , 70
             
  MOV NNXLINE , 30
  MOV NNYLINE , 140
 
  MOV NNNXLINE , 230
  MOV NNNYLINE , 100

  RET
 
PLAY_AGAIN ENDP 

PLAY_AGAIN_2 PROC
 
 MOV XCUBE , 36
 MOV YCUBE , 56

 RET
 
PLAY_AGAIN_2 ENDP
                        
UPDRAWCUBE PROC 
    MOV BX,XCUBE
    MOV X1CUBE,BX
    MOV X2CUBE,BX
    ADD X1CUBE,7
    
    MOV BX,YCUBE
    MOV Y1CUBE,BX
    MOV Y2CUBE,BX
    SUB Y1CUBE,7

LUP:
    MOV AH,0CH
    MOV AL,12     ;L.RED COLOR
    MOV CX,XCUBE
    MOV DX,YCUBE
    INT 10H
    INC XCUBE
    MOV BX,X1CUBE
    CMP XCUBE,BX
    JLE LUP
    MOV BX,X2CUBE
    MOV XCUBE,BX
    DEC YCUBE
    MOV BX,Y1CUBE
    CMP YCUBE,BX
    JNE LUP
    
    RET
    
ENDP UPDRAWCUBE

DOWNDRAWCUBE PROC 
    MOV BX,XCUBE
    MOV X1CUBE,BX
    MOV X2CUBE,BX
    ADD X1CUBE,7
    
    MOV BX,YCUBE
    MOV Y1CUBE,BX
    MOV Y2CUBE,BX
    ADD Y1CUBE,7

LDOWN:
    MOV AH,0CH
    MOV AL,12     ; L.RED COLOR
    MOV CX,XCUBE
    MOV DX,YCUBE
    INT 10H
    INC XCUBE
    MOV BX,X1CUBE
    CMP XCUBE,BX
    JLE LDOWN
    
    MOV BX,X2CUBE
    MOV XCUBE,BX
    INC YCUBE
    MOV BX,Y1CUBE
    CMP YCUBE,BX
    JNE LDOWN
    
    RET
    
ENDP DOWNDRAWCUBE

UPRMVCUBE PROC  
    
    MOV BX,X2CUBE          
    MOV XCUBE,BX
    
    MOV BX,XCUBE
    MOV X1CUBE,BX
    MOV X2CUBE,BX
    ADD X1CUBE,7
    
    MOV BX,Y2CUBE
    MOV YCUBE,BX

L1:
    MOV AH,0CH
    MOV AL,0
    MOV CX,XCUBE
    MOV DX,YCUBE
    INT 10H
    INC XCUBE
    MOV BX,X1CUBE
    CMP XCUBE,BX
    JLE L1
    
    MOV BX,X2CUBE
    MOV XCUBE,BX
    DEC YCUBE
    
    MOV BX,Y1CUBE
    CMP YCUBE,BX
    JNE L1
    
    MOV BX,X2CUBE
    MOV XCUBE,BX
    MOV BX,Y2CUBE
    MOV YCUBE,BX 
           
    RET
           
ENDP UPRMVCUBE 

DOWNRMVCUBE PROC 
    
    MOV BX,X2CUBE           
    MOV XCUBE,BX
     
    MOV BX,XCUBE
    MOV X1CUBE,BX
    MOV X2CUBE,BX
    ADD X1CUBE,7 
     
    MOV BX,Y2CUBE
    MOV YCUBE,BX

L1DOWN:
    MOV AH,0CH
    MOV AL,0
    MOV CX,XCUBE
    MOV DX,YCUBE
    INT 10H
    INC XCUBE
    MOV BX,X1CUBE
    CMP XCUBE,BX
    JLE L1DOWN
    MOV BX,X2CUBE
    MOV XCUBE,BX
    INC YCUBE
    MOV BX,Y1CUBE
    CMP YCUBE,BX
    JNE L1DOWN
    
    MOV BX,X2CUBE
    MOV XCUBE,BX
    MOV BX,Y2CUBE
    MOV YCUBE,BX 
           
    RET
           
ENDP DOWNRMVCUBE  

CHECK_UP_OR_DOWN PROC  
    
    MOV BX,YLINE
    SUB BX,3
    CMP YCUBE,BX
    JE NEXTPHASE
    DEC BX     
    CMP YCUBE,BX
    JE  NEXTPHASE  
    MOV CHECK_UND,0
    JMP DID
    
    NEXTPHASE:
    MOV BX,XLINE
    ADD BX,57
    CMP XCUBE,BX
    JL NEXTPHASE1
    MOV CHECK_UND,0
    JMP DID
    
    NEXTPHASE1:
    MOV BX,XLINE
    SUB BX,9
    CMP BX,XCUBE
    JL LASTPHASE
    MOV CHECK_UND,0
    JMP DID
    
    LASTPHASE:
    MOV CHECK_UND,1
    
    DID:
    RET
ENDP CHECK_UP_OR_DOWN

NCHECK_UP_OR_DOWN PROC
    
    MOV BX,NYLINE
    SUB BX,3
    CMP YCUBE,BX
    JE  NNEXTPHASE
    DEC BX     
    CMP YCUBE,BX
    JE  NNEXTPHASE  
    MOV NCHECK_UND,0
    JMP NDID
    
    NNEXTPHASE:
    MOV BX,NXLINE
    ADD BX,57
    CMP XCUBE,BX
    JL NNEXTPHASE1
    MOV NCHECK_UND,0
    JMP NDID
    
    NNEXTPHASE1:
    MOV BX,NXLINE
    SUB BX,9
    CMP BX,XCUBE
    JL NLASTPHASE
    MOV NCHECK_UND,0
    JMP NDID
    
    NLASTPHASE:
    MOV NCHECK_UND,1
    
    NDID:
    RET
ENDP NCHECK_UP_OR_DOWN

NNCHECK_UP_OR_DOWN PROC
    
    MOV BX,NNYLINE
    SUB BX,3
    CMP YCUBE,BX
    JE NNNEXTPHASE
    DEC BX     
    CMP YCUBE,BX
    JE  NNNEXTPHASE  
    MOV NNCHECK_UND,0
    JMP NNDID
    
    NNNEXTPHASE:
    MOV BX,NNXLINE
    ADD BX,57
    CMP XCUBE,BX
    JL NNNEXTPHASE1
    MOV NNCHECK_UND,0
    JMP NNDID
    
    NNNEXTPHASE1:
    MOV BX,NNXLINE
    SUB BX,9
    CMP BX,XCUBE
    JL NNLASTPHASE
    MOV NNCHECK_UND,0
    JMP NNDID
    
    NNLASTPHASE:
    MOV NNCHECK_UND,1
    
    NNDID:
    RET
ENDP NNCHECK_UP_OR_DOWN

NNNCHECK_UP_OR_DOWN PROC    
    
    MOV BX,NNNYLINE
    SUB BX,3
    CMP YCUBE,BX
    JE  NNNNEXTPHASE
    DEC BX     
    CMP YCUBE,BX
    JE  NNNNEXTPHASE
    MOV NNNCHECK_UND,0
    JMP NNNDID
    
    NNNNEXTPHASE:
    MOV BX,NNNXLINE
    ADD BX,57
    CMP XCUBE,BX
    JL NNNNEXTPHASE1
    MOV NNNCHECK_UND,0
    JMP NNNDID
    
    NNNNEXTPHASE1:
    MOV BX,NNNXLINE
    SUB BX,9
    CMP BX,XCUBE
    JL NNNLASTPHASE
    MOV NNNCHECK_UND,0
    JMP NNNDID
    
    NNNLASTPHASE:
    MOV NNNCHECK_UND,1
    
    NNNDID:
    RET
ENDP NNNCHECK_UP_OR_DOWN
   
             
DELAY PROC    
   
    ;Reports the current time of day
    MOV AX,00H
    INT 1AH
    MOV TIK,DX  ; LOW ORDER PART OF CLOCK COUNT
    ADD TIK,3H
   
  DELAYL:
    
    MOV AX,00H
    INT 1AH
    CMP TIK,DX
    JGE DELAYL
    
    CMP CHECK,0
    JE DDD
    
    ;DIRECT CHARACTER INPUT WITHOUT ECHO
    MOV AH,7
    INT 21H
    DEC CHECK
  
   DDD:
    RET

DELAY ENDP  

DELAY2 PROC    
   
    MOV AX,00H
    INT 1AH
    MOV TIK,DX 
    ADD TIK,2H
   
  DELAYL2:
    
    MOV AX,00H
    INT 1AH
    CMP TIK,DX
    JGE DELAYL2
    
    CMP CHECK,0
    JE DDD2
    
    MOV AH,7
    INT 21H
    DEC CHECK
  
   DDD2:
    RET

DELAY2 ENDP       

DELAY3 PROC    
   
    MOV AX,00H
    INT 1AH
    MOV TIK,DX 
    ADD TIK,1H
   
  DELAYL3:
    
    MOV AX,00H
    INT 1AH
    CMP TIK,DX
    JGE DELAYL3
    
    CMP CHECK,0
    JE DDD3
    
    MOV AH,7
    INT 21H
    DEC CHECK
  
   DDD3:
    RET

DELAY3 ENDP  

DELAY4 PROC    
   
    MOV AX,00H
    INT 1AH
    MOV TIK,DX 
   
  DELAYL4:
    
    MOV AX,00H
    INT 1AH
    CMP TIK,DX
    JGE DELAYL4
    
    CMP CHECK,0
    JE DDD4
    
    MOV AH,7
    INT 21H
    DEC CHECK
  
   DDD4:
    RET

DELAY4 ENDP 

DELAY5 PROC    
   
    MOV AX,00H
    INT 1AH
    MOV TIK,DX 
    SUB TIK,1H
   
  DELAYL5:
    
    MOV AX,00H
    INT 1AH
    CMP TIK,DX
    JGE DELAYL5
    
    CMP CHECK,0
    JE DDD5
    
    MOV AH,7
    INT 21H
    DEC CHECK
  
   DDD5:
    RET

DELAY5 ENDP 
 
DRAWLINE PROC
    
    MOV BX,XLINE
    MOV X1LINE,BX
    MOV X2LINE,BX
    ADD X1LINE,55  
    
    MOV BX,YLINE
    MOV Y1LINE,BX
    MOV Y2LINE,BX
    SUB Y1LINE,3    
    
  LINE:
  
    MOV AH,0CH
    MOV AL,4    ; RED COLOR
    MOV CX,XLINE
    MOV DX,YLINE
    INT 10H
    INC XLINE
    MOV BX,X1LINE
    CMP XLINE,BX
    JLE LINE
    
    MOV BX,X2LINE
    MOV XLINE,BX
    DEC YLINE
    MOV BX,Y1LINE
    CMP YLINE,BX
    JNE LINE
    
    RET 
    
DRAWLINE ENDP   
 
RMVLINE PROC 
    
    MOV BX,XLINE
    MOV X1LINE,BX
    MOV X2LINE,BX
    ADD X1LINE,55
               
    MOV XLINE,BX
    MOV BX,Y2LINE
    MOV YLINE,BX

LINE1: 

    MOV AH,0CH
    MOV AL,0     ;BACKGROUND COLOR(BLACK)
    MOV CX,XLINE
    MOV DX,YLINE
    INT 10H
    INC XLINE
    MOV BX,X1LINE
    CMP XLINE,BX
    JLE LINE1 
    
    MOV BX,X2LINE
    MOV XLINE,BX
    DEC YLINE
    MOV BX,Y1LINE
    CMP YLINE,BX
    JNE LINE1
    
    MOV BX,X2LINE
    MOV XLINE,BX
    MOV BX,Y2LINE
    MOV YLINE,BX 
           
    RET
           
RMVLINE ENDP  

DRAWNLINE PROC
    
    MOV BX,NXLINE
    MOV NX1LINE,BX
    MOV NX2LINE,BX
    ADD NX1LINE,55
    
    MOV BX,NYLINE
    MOV NY1LINE,BX
    MOV NY2LINE,BX
    SUB NY1LINE,3
    
    NLINE:
    MOV AH,0CH
    MOV AL,3      ; CYAN COLOR
    MOV CX,NXLINE
    MOV DX,NYLINE
    INT 10H
    INC NXLINE
    MOV BX,NX1LINE
    CMP NXLINE,BX
    JLE NLINE
    
    MOV BX,NX2LINE
    MOV NXLINE,BX
    DEC NYLINE
    MOV BX,NY1LINE
    CMP NYLINE,BX
    JNE NLINE
     
    RET
    
DRAWNLINE ENDP   
 
RMVNLINE PROC 
    
    MOV BX,NXLINE
    MOV NX1LINE,BX
    MOV NX2LINE,BX
    ADD NX1LINE,55
               
    MOV NXLINE,BX
    MOV BX,NY2LINE
    MOV NYLINE,BX

NLINE1:  

    MOV AH,0CH
    MOV AL,0
    MOV CX,NXLINE
    MOV DX,NYLINE
    INT 10H
    INC NXLINE
    MOV BX,NX1LINE
    CMP NXLINE,BX
    JLE NLINE1 
    
    MOV BX,NX2LINE
    MOV NXLINE,BX
    DEC NYLINE
    MOV BX,NY1LINE
    CMP NYLINE,BX
    JNE NLINE1
    
    MOV BX,NX2LINE
    MOV NXLINE,BX
    MOV BX,NY2LINE
    MOV NYLINE,BX 
           
    RET
           
RMVNLINE ENDP 

DRAWNNLINE PROC
    
    MOV BX,NNXLINE
    MOV NNX1LINE,BX
    MOV NNX2LINE,BX
    ADD NNX1LINE,55
    
    MOV BX,NNYLINE
    MOV NNY1LINE,BX
    MOV NNY2LINE,BX
    SUB NNY1LINE,3
    
    NNLINE:
    MOV AH,0CH
    MOV AL,13       ; MAGENTA COLOR
    MOV CX,NNXLINE
    MOV DX,NNYLINE
    INT 10H
    INC NNXLINE
    MOV BX,NNX1LINE
    CMP NNXLINE,BX
    JLE NNLINE
    
    MOV BX,NNX2LINE
    MOV NNXLINE,BX
    DEC NNYLINE
    MOV BX,NNY1LINE
    CMP NNYLINE,BX
    JNE NNLINE
    
    
     
    NNDIDI:
    
    RET
DRAWNNLINE ENDP  
 
RMVNNLINE PROC 
    
    MOV BX,NNXLINE
    MOV NNX1LINE,BX
    MOV NNX2LINE,BX
    ADD NNX1LINE,55
               
    MOV NNXLINE,BX
    MOV BX,NNY2LINE
    MOV NNYLINE,BX

NNLINE1:
    MOV AH,0CH
    MOV AL,0
    MOV CX,NNXLINE
    MOV DX,NNYLINE
    INT 10H
    INC NNXLINE
    MOV BX,NNX1LINE
    CMP NNXLINE,BX
    JLE NNLINE1 
    
    MOV BX,NNX2LINE
    MOV NNXLINE,BX
    DEC NNYLINE
    MOV BX,NNY1LINE
    CMP NNYLINE,BX
    JNE NNLINE1
    
    MOV BX,NNX2LINE
    MOV NNXLINE,BX
    MOV BX,NNY2LINE
    MOV NNYLINE,BX 
           
    RET
           
RMVNNLINE ENDP   

DRAWNNNLINE PROC
    
    MOV BX,NNNXLINE
    MOV NNNX1LINE,BX
    MOV NNNX2LINE,BX
    ADD NNNX1LINE,55
    
    MOV BX,NNNYLINE
    MOV NNNY1LINE,BX
    MOV NNNY2LINE,BX
    SUB NNNY1LINE,3
    
    NNNLINE:
    MOV AH,0CH
    MOV AL,2        ; GREEN COLOR
    MOV CX,NNNXLINE
    MOV DX,NNNYLINE
    INT 10H
    INC NNNXLINE
    MOV BX,NNNX1LINE
    CMP NNNXLINE,BX
    JLE NNNLINE
    
    MOV BX,NNNX2LINE
    MOV NNNXLINE,BX
    DEC NNNYLINE
    MOV BX,NNNY1LINE
    CMP NNNYLINE,BX
    JNE NNNLINE
    
    
     
    NNNDIDI:
    
    RET
DRAWNNNLINE ENDP   

RMVNNNLINE PROC 
    
    MOV BX,NNNXLINE
    MOV NNNX1LINE,BX
    MOV NNNX2LINE,BX
    ADD NNNX1LINE,55
               
    MOV NNNXLINE,BX
    MOV BX,NNNY2LINE
    MOV NNNYLINE,BX

NNNLINE1:
    MOV AH,0CH
    MOV AL,0
    MOV CX,NNNXLINE
    MOV DX,NNNYLINE
    INT 10H
    INC NNNXLINE
    MOV BX,NNNX1LINE
    CMP NNNXLINE,BX
    JLE NNNLINE1 
    
    MOV BX,NNNX2LINE
    MOV NNNXLINE,BX
    DEC NNNYLINE
    MOV BX,NNNY1LINE
    CMP NNNYLINE,BX
    JNE NNNLINE1
    
    MOV BX,NNNX2LINE
    MOV NNNXLINE,BX
    MOV BX,NNNY2LINE
    MOV NNNYLINE,BX 
           
    RET
           
RMVNNNLINE ENDP   
  
GENERATE_RANDOM_NUMBER PROC
    
  PUSHALL MACRO
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
  ENDM

  POPALL MACRO
    POP DX 
    POP CX
    POP BX
    POP AX
  ENDM
    
  GETRAND MACRO CUR 
    
    PUSHALL
    MOV AH,0
    INT 1AH
    
    MOV AX,DX ; CX HIGH PART OF CLOCK COUNT DX LOW PART OF CLOCKMCOUNT
    MOV DX,CX ; dx:ax contains system time
    
    MOV BX,7261
    MUL AX
    ADD AX,1
    MOV DX,0
    MOV BX,200
    DIV BX
    
    MOV CUR,DX   ; REMAINDER
    POPALL
  
  ENDM   
    
    MOV CX,0
    GETRAND RANDNUMBER
    
    RET    
        
GENERATE_RANDOM_NUMBER ENDP     


NEXT_XLINE PROC
          
    CMP YLINE,18
    JGE NOCHANGE
    MOV YLINE,196
    MOV Y2LINE,196 
    
    MOV BX,RANDNUMBER
    MOV XLINE,BX
    MOV X1LINE,BX 
    
    NOCHANGE:
    RET
    
NEXT_XLINE ENDP 

NEXT_NXLINE PROC
          
    CMP NYLINE,18
    JGE NNOCHANGE
    MOV NYLINE,196
    MOV NY2LINE,196 
    
    MOV BX,RANDNUMBER
    MOV NXLINE,BX
    MOV NX1LINE,BX 
    
    NNOCHANGE:
    RET
NEXT_NXLINE ENDP 

NEXT_NNXLINE PROC
          
    CMP NNYLINE,18
    JGE NNNOCHANGE
    MOV NNYLINE,196
    MOV NNY2LINE,196 
    
    MOV BX,RANDNUMBER
    MOV NNXLINE,BX
    MOV NNX1LINE,BX 
    
    NNNOCHANGE:
    RET 
    
NEXT_NNXLINE ENDP    

NEXT_NNNXLINE PROC
          
    CMP NNNYLINE,18
    JGE NNNNOCHANGE
    MOV NNNYLINE,196
    MOV NNNY2LINE,196 
    
    MOV BX,RANDNUMBER
    MOV NNNXLINE,BX
    MOV NNNX1LINE,BX 
    
    NNNNOCHANGE:
    RET 
    
NEXT_NNNXLINE ENDP 

BORDER PROC
    
    BOR:
    MOV AH,0CH
    MOV AL,6
    MOV CX,BORDERX
    MOV DX,BORDERY
    INT 10H
    INC BORDERX
    CMP BORDERX,318
    JE NNP
    JMP BOR
    
    NNP:
    MOV BORDERX,1
    MOV BORDERY,198
    BOR1:
    MOV AH,0CH
    MOV AL,6
    MOV CX,BORDERX
    MOV DX,BORDERY
    INT 10H
    INC BORDERX
    CMP BORDERX,318
    JE NNP1
    JMP BOR1
    
    NNP1:
    MOV BORDERX,1
    MOV BORDERY,16
    BOR2:
    MOV AH,0CH
    MOV AL,6
    MOV CX,BORDERX
    MOV DX,BORDERY
    INT 10H
    INC BORDERY
    CMP BORDERY,198
    JE NNP2
    JMP BOR2
    
    NNP2:
    MOV BORDERX,318
    MOV BORDERY,16
    BOR3:
    MOV AH,0CH
    MOV AL,6
    MOV CX,BORDERX
    MOV DX,BORDERY
    INT 10H
    INC BORDERY
    CMP BORDERY,198
    JG DADA
    JMP BOR3
    
    DADA:
    MOV BORDERX,1
    MOV BORDERY,16
    RET 
    
BORDER ENDP 

MAIN_MENU PROC
   
  MPR:
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    LEA DX,MSG1
    INT 21H
    LEA DX,MSG2
    INT 21H
    LEA DX,MSG3
    INT 21H
    LEA DX,MSG4
    INT 21H
    LEA DX,MSG5
    INT 21H
    
  LL1:
    
    ;DIRECT CHAR INPUT
    MOV AH,7
    INT 21H
    CMP AL,'1'
    JE  STG
    CMP AL,'2'
    JE  INSTRUC
    CMP AL,'3'
    JE  EXIT1
    JMP LL1
    
  INSTRUC:
    
    CALL RESET_THE_SCREEN
    
    MOV AH,9
    LEA DX,IMSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CALL RESET_THE_SCREEN
     
    JMP MPR
    
  STG: 
  
    CALL RESET_THE_SCREEN
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H  
    
    JMP GAME    
    
  EXIT1:
    
    ;SET 80 X 25 16 COLOR TEXT          
    MOV AH,0
    MOV AL,2
    INT 10H
       
    MOV AH,4CH
    INT 21H

  RET

MAIN_MENU ENDP 


RESET_THE_SCREEN PROC
   
    MOV AH,0
    MOV AL,2
    INT 10H
    MOV AX,13H
    INT 10H
    
    RET

RESET_THE_SCREEN ENDP  
   

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

 DISP:                      
    
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                     
  
   LOOP DISP                   ; jump to label DISPLAY if CX!=0

    POP DX                        ; pop a value from STACK into DX
    POP CX                         
    POP BX 
                          
    RET                            
 
OUTDEC ENDP      

OUTDECGPS PROC   
  
   PUSH BX                        ; push BX onto the STACK
   PUSH CX                       
   PUSH DX                        

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     

 OUTPUTGP:                       
    
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                     
     INC CX                       
     OR AX, AX                    
    
   JNE OUTPUTGP                     ; jump to label OUTPUT if ZF=0

     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,39
     INT 10H
     MOV AH,9                     

 DISPGP:                      
    
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code 
     MOV AL,DL
     MOV BL,2
     MOV CX,1
     INT 10H                     
  
   LOOP DISPGP                   ; jump to label DISPLAY if CX!=0

    POP DX                        ; pop a value from STACK into DX
    POP CX                         
    POP BX 
                          
    RET                            
 
OUTDECGPS ENDP           

OUTDECGPS1 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'1'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS1 ENDP    

OUTDECGPS2 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'2'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS2 ENDP  

OUTDECGPS3 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'3'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS3 ENDP  

OUTDECGPS4 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'4'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS4 ENDP   

OUTDECGPS5 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'5'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS5 ENDP 

OUTDECGPS6 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'6'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS6 ENDP 

OUTDECGPS7 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'7'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS7 ENDP 

OUTDECGPS8 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'8'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS8 ENDP 

OUTDECGPS9 PROC   
  
     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,38
     INT 10H
     MOV AH,9                     

     MOV AL,'9'
     MOV BL,2
     MOV CX,1
     INT 10H                     
                     
    RET                            
 
OUTDECGPS9 ENDP 

OUTDECGPC PROC   
                
   
   PUSH BX                        ; push BX onto the STACK
   PUSH CX                       
   PUSH DX                        

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     

 OUTPUTGP1:                       
    
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                     
     INC CX                       
     OR AX, AX                    
    
   JNE OUTPUTGP1                     ; jump to label OUTPUT if ZF=0

     MOV AH, 0BH
     INT 10H
     MOV AH,02
     MOV BH,0
     MOV DH,1
     MOV DL,16
     INT 10H
     MOV AH,9                     

 DISPGP1:                      
    
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code 
     MOV AL,DL
     MOV BL,14
     MOV CX,1
     INT 10H                     
  
   LOOP DISPGP1                   ; jump to label DISPLAY if CX!=0

    POP DX                        ; pop a value from STACK into DX
    POP CX                         
    POP BX 
                          
    RET                                                
 
OUTDECGPC ENDP

GAME_OVER PROC
    
    
   
    MOV DI,0
    ;MOV BX,COUNT1
    ;MOV COUNT,BX
    GLO:
    
    DEC COUNT
    CMP COUNT,0
    JE  GLO1
     
   ; CALL RESET_THE_SCREEN 
   ; CALL PLAY_AGAIN_2
    
   ; MOV AH,9
   ; LEA DX,MSG10
   ; INT 21H 
    CALL RESET_THE_SCREEN
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H 
    
    MOV AX,COUNT
    CALL OUTDECGPC 
    
    XOR AX,AX
    XOR BX,BX
    XOR CX,CX
    XOR DX,DX
    
    MOV AX,SCORE
    CALL OUTDECGPS 
    CALL PLAY_AGAIN_2
    JMP GAME
    
   GLO1:
    CALL RESET_THE_SCREEN 
    
    MOV AH,9
    LEA DX,GAMEOVERMSG
    INT 21H    
    
    MOV AX,SCORE
    CALL OUTDEC  
    
    MOV AH,9  
    LEA DX,HIGHESTMSG2
    INT 21H  
    
    MOV AX,SCORE
    CMP AX,HIGHSCORE
    JG  HSCORE  
    JMP NHSCORE
    
 HSCORE: 
    
    MOV AX,SCORE
    MOV HIGHSCORE,AX
    CALL OUTDEC 
    JMP FNSH 
    
 NHSCORE:
    
    MOV AX,HIGHSCORE
    CALL OUTDEC
    JMP FNSH 
    
 FNSH:
    MOV AH,9
    LEA DX,GAMEOVERMSG1
    INT 21H   
    
    LEA DX,GAMEOVERMSG3
    INT 21H 
    
    MOV BX,SCORE1
    MOV SCORE,BX
    
    AGA:
    ;DIRECT CHARACTER INPUT WITHOUT ECHO
    MOV AH,7
    INT 21H
    CMP AL,'X'
    JE GGG
    CMP AL,'x'
    JE GGG
    CMP AL,'P'
    JE DIDA 
    CMP AL,'p'
    JE DIDA
    JMP AGA
    
    DIDA:
    MOV BX,COUNT1
    MOV COUNT,BX 
    
    CALL RESET_THE_SCREEN   
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H  
    CALL PLAY_AGAIN
    JMP GAME
    
    GGG:
     RET  
     
GAME_OVER ENDP   

HIGHEST PROC
    
    CALL RESET_THE_SCREEN 
    
    MOV AH,9
    LEA DX,GAMEOVERMSG
    INT 21H    
    
    MOV AX,SCORE
    CALL OUTDEC 
    
    MOV AH,9
    LEA DX,GAMEOVERMSG1
    INT 21H 
    
    MOV BX,SCORE1
    MOV SCORE,BX  
    
    MOV AH,9
    LEA DX,HIGHESTMSG
    INT 21H    
    
    LEA DX,GAMEOVERMSG3
    INT 21H 
    
    AGAH:
    ;DIRECT CHARACTER INPUT WITHOUT ECHO
    MOV AH,7
    INT 21H
    CMP AL,'X'
    JE GGGH
    CMP AL,'x'
    JE GGGH
    CMP AL,'P'
    JE DIDAH 
    CMP AL,'p'
    JE DIDAH
    JMP AGAH
    
    DIDAH:
    MOV BX,COUNT1
    MOV COUNT,BX 
    
    CALL RESET_THE_SCREEN   
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H  
    CALL PLAY_AGAIN
    JMP GAME
    
    GGGH:
     RET  
     
HIGHEST ENDP  

FINAL_EX PROC
    MOV AH,0
    MOV AL,2
    INT 10H
       
    MOV AH,4CH
    INT 21H
FINAL_EX ENDP

 MAIN PROC
   
    MOV AX,@DATA
    MOV DS,AX 
    
    ;SET GRAPHICS MODE 320 X 200 256 COLOR
    MOV AX,13H
    INT 10H
    CALL MAIN_MENU   
    
    MOV BX,COUNT1
    MOV COUNT,BX   
    
  GAME:
    
    ;Checks to see if a character is available in the buffer
    MOV AH,1
    INT 16H
    
     JZ NOKEYPRESS  ;JUMP IF FLAG IS ZERO
    JNZ KEYPRESS
    
  NOKEYPRESS:
  
    CALL NEXT_XLINE
    CALL NEXT_NXLINE
    CALL NEXT_NNXLINE  
    CALL NEXT_NNNXLINE 
    CALL GENERATE_RANDOM_NUMBER
    
    CALL BORDER 
    
    CALL UPDRAWCUBE
   
    CALL DRAWLINE
    CALL DRAWNLINE
    CALL DRAWNNLINE  
    CALL DRAWNNNLINE
    
    MOV  BX,SCORE
    CMP  BX,80 
    JG   DLA5 
    CMP  BX,60
    JG   DLA4 
    CMP  BX,40
    JG   DLA3 
    CMP  BX,20
    JG   DLA2 
    CMP  BX,0
    JGE  DLA
  
  DLA5: 
    CALL DELAY5
    JMP  NXT  
    
  DLA4: 
    CALL DELAY4
    JMP  NXT 
    
  DLA3: 
    CALL DELAY3
    JMP  NXT  
    
  DLA2: 
    CALL DELAY2
    JMP  NXT
  
  DLA: 
    CALL DELAY
    JMP  NXT  
   
   
  NXT:
    
    CALL UPRMVCUBE
               
    CALL RMVLINE
    CALL RMVNLINE
    CALL RMVNNLINE    
    CALL RMVNNNLINE
     JMP AGAIN 
   
  KEYPRESS:  
   
    MOV AH,0
    INT 16H 
    CMP AL,'E'
    JE  EXIT2
    CMP AL,'e'
    JE  EXIT2
    CMP AL,'A'
    JE MOVELEFT
    CMP AL,'a'
    JE MOVELEFT
    CMP AL,'D'
    JE MOVERIGHT
    CMP AL,'d'
    JE MOVERIGHT
    JMP AGAIN  
       
  MOVELEFT: 
    MOV BX,XCUBE
    CMP BX,4
    JL  AGAIN
    SUB XCUBE,2
    SUB X2CUBE,2
    JMP AGAIN 
     
  MOVERIGHT:  
    MOV BX,XCUBE 
    ADD BX,7
    CMP BX,315
    JG  AGAIN
    ADD XCUBE,2
    ADD X2CUBE,2 
    JMP AGAIN
    
  EXIT2: 
  
    CALL RESET_THE_SCREEN
    MOV AH,9
    LEA DX,GAMEOVERMSG2
    INT 21H       
    LEA DX,GAMEOVERMSG1
    INT 21H    
    LEA DX,GAMEOVERMSG3
    INT 21H 
    JMP AGA2
    
  AGAIN:  
  
    CALL CHECK_UP_OR_DOWN
    CALL NCHECK_UP_OR_DOWN
    CALL NNCHECK_UP_OR_DOWN 
    CALL NNNCHECK_UP_OR_DOWN
    
    CMP CHECK_UND,1
    JE AGAIN1
    CMP NCHECK_UND,1
    JE AGAIN1
    CMP NNCHECK_UND,1
    JE AGAIN1
    CMP NNNCHECK_UND,1
    JE AGAIN1  
    JMP AGAIN3
    
   AGAIN1: 
    CMP CHECK_UND,1
    JE  LIFEDEC 
    
    CMP NNNCHECK_UND,1
    JE  LIFEINC   
    JMP LIFEADJ 
    
   LIFEINC: 
   
     MOV BX,Y  
     CMP BX,1
     JE  YES2
     JMP LIFEADJ
     
   YES2:
     
     MOV BX,0
     MOV Y,BX
     INC COUNT 
     
     CMP COUNT,9
     JG  CNTG
     JMP CNTL
   
   CNTG:
    MOV COUNT,9
    
   
   CNTL:
    MOV AX,COUNT
    CALL OUTDECGPC 
    
    JMP LIFEADJ
    
   LIFEDEC:
    
    MOV BX,X
    CMP BX,1  
    JE  YES 
    JMP LIFEADJ
    
   YES: 
    
    MOV BX,0    
    MOV X,BX
    DEC COUNT
    
    MOV AX,COUNT
    CALL OUTDECGPC 
    
    CMP COUNT,0
    JE  DEAD
    JMP ALIVE
   
   DEAD: 
    CALL RESET_THE_SCREEN 
    
    MOV AH,9
    LEA DX,GAMEOVERMSG
    INT 21H    
    
    MOV AX,SCORE
    CALL OUTDEC 
    
    MOV AH,9  
    LEA DX,HIGHESTMSG2
    INT 21H  
    
    MOV AX,SCORE
    CMP AX,HIGHSCORE
    JG  HSCORE1  
    JMP NHSCORE1
    
 HSCORE1: 
    
    MOV AX,SCORE
    MOV HIGHSCORE,AX
    CALL OUTDEC 
    JMP FNSH1 
    
 NHSCORE1:
    
    MOV AX,HIGHSCORE
    CALL OUTDEC
    JMP FNSH1 
    
 FNSH1:
    
    MOV AH,9
    LEA DX,GAMEOVERMSG1
    INT 21H   
    
    LEA DX,GAMEOVERMSG3
    INT 21H 
    
    MOV BX,SCORE1
    MOV SCORE,BX
    
    AGAD:
    ;DIRECT CHARACTER INPUT WITHOUT ECHO
    MOV AH,7
    INT 21H
    CMP AL,'P'
    JE DIDAD 
    CMP AL,'p'
    JE DIDAD 
    CMP AL,'X'
    JE  FEX
    CMP AL,'x'
    JE  FEX
    JMP AGAD   
    
    FEX:
    CALL FINAL_EX
    
    DIDAD:
    MOV BX,COUNT1
    MOV COUNT,BX 
    
    CALL RESET_THE_SCREEN   
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H  
    CALL PLAY_AGAIN
    JMP GAME
     
   ALIVE: 
    JMP LIFEADJ  
    
   LIFEADJ:
     DEC YCUBE
     JMP AGAIN2
     
    
    
  AGAIN3:
   
    LIFEADJX: 
   
    MOV BX,YLINE
    CMP YCUBE,BX
    JE  XNEW 
    DEC BX     
    CMP YCUBE,BX
    JE  XNEW 
    JMP LIFEADJY
  
   XNEW:
    MOV BX,1
    MOV X,BX  
    
    
   LIFEADJY: 
   
    MOV BX,NNNYLINE
    CMP YCUBE,BX
    JE  YNEW 
    DEC BX     
    CMP YCUBE,BX
    JE  YNEW 
    JMP FINAL
  
   YNEW:
    MOV BX,1
    MOV Y,BX    
    
  FINAL:  
    MOV BX,YLINE
    CMP YCUBE,BX
    JE  SCOREL 
    DEC BX     
    CMP YCUBE,BX
    JE  SCOREL 
    MOV BX,NYLINE
    CMP YCUBE,BX
    JE  SCOREL 
    DEC BX     
    CMP YCUBE,BX
    JE  SCOREL 
    MOV BX,NNYLINE
    CMP YCUBE,BX
    JE  SCOREL 
    DEC BX     
    CMP YCUBE,BX
    JE  SCOREL 
    MOV BX,NNNYLINE
    CMP YCUBE,BX
    JE  SCOREL 
    DEC BX     
    CMP YCUBE,BX
    JE  SCOREL 
   
    INC YCUBE   
   ; CMP YCUBE,BX
   ; JE  SCOREL  
   
    JMP AGAIN2
 SCOREL: 
    INC YCUBE
    INC SCORE 
    
    ;CALL RESET_THE_SCREEN 
     MOV AX,COUNT
    CALL OUTDECGPC   
   
   ; MOV AH,9
   ; LEA DX,MSG10
   ; INT 21H 
    CMP SCORE,10
    JL  SC1 
    
    CMP SCORE,20
    JL  SC2  
    
    CMP SCORE,30
    JL  SC3 
    
    CMP SCORE,40
    JL SC4
    
    CMP SCORE,50
    JL SC5  
    
    CMP SCORE,60
    JL SC6    
    
    CMP SCORE,70
    JL SC7  
    
    CMP SCORE,80
    JL SC8
    
    CMP SCORE,90
    JL  SC9   
    
    CMP SCORE,100
    JL  SC10
    
    CMP SCORE,100
    JGE EXITH  
    
   EXITH:
    CALL HIGHEST
    
   
    
   ; MOV AH,9
   ; LEA DX,MSG9
   ; INT 21H 
   SC1: 
    MOV AX,SCORE
    JMP FJUMP
   SC2:   
    CALL OUTDECGPS1
    MOV AX,SCORE
    SUB AX,10    
    JMP FJUMP 
   SC3:
    CALL OUTDECGPS2
    MOV AX,SCORE
    SUB AX,20    
    JMP FJUMP
      
   SC4:   
    CALL OUTDECGPS3
    MOV AX,SCORE
    SUB AX,30    
    JMP FJUMP
     
   SC5:
    CALL OUTDECGPS4
    MOV AX,SCORE
    SUB AX,40  
    JMP FJUMP
    
   SC6:
    CALL OUTDECGPS5
    MOV AX,SCORE
    SUB AX,50    
    JMP FJUMP    
    
   SC7:
    CALL OUTDECGPS6
    MOV AX,SCORE
    SUB AX,60    
    JMP FJUMP  
    
   SC8:
    CALL OUTDECGPS7
    MOV AX,SCORE
    SUB AX,70    
    JMP FJUMP
   
   SC9:
    CALL OUTDECGPS8
    MOV AX,SCORE
    SUB AX,80    
    JMP FJUMP  
    
   SC10:
    CALL OUTDECGPS9
    MOV AX,SCORE
    SUB AX,90    
    JMP FJUMP 
  
  FJUMP:  
    CALL OUTDECGPS
    JMP AGAIN2
    
      
    
 AGAIN2:
    DEC YLINE
    DEC NYLINE
    DEC NNYLINE 
    DEC NNNYLINE  
    
    CMP YCUBE,198
    JE EXIT
    CMP YCUBE,25
    JE EXIT
    CMP YCUBE,26
    JE EXIT
    JMP GAME 

  
 AGA2:
    ;DIRECT CHARACTER INPUT WITHOUT ECHO
    MOV AH,7
    INT 21H
    CMP AL,'X'
    JE  FINAL_EXIT
    CMP AL,'x'
    JE  FINAL_EXIT
    CMP AL,'P'
    JE  DIDA2 
    CMP AL,'p'
    JE  DIDA2
    JMP AGA2
DIDA2:
    MOV BX,COUNT1
    MOV COUNT,BX   
    
    MOV BX,SCORE1
    MOV SCORE,BX
   
    CALL RESET_THE_SCREEN 
    MOV AH,9
    LEA DX,MSG10
    INT 21H  
    MOV AH,9 
    LEA DX,MSG9
    INT 21H  
    CALL PLAY_AGAIN
    JMP GAME
    
  EXIT:
    CALL GAME_OVER  
    JMP  FINAL_EXIT
    
   
    
  FINAL_EXIT:           
   
    MOV AH,0
    MOV AL,2
    INT 10H
       
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

END MAIN    



