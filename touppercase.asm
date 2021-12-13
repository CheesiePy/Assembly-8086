; -------------------------
; Set in data an empty str, 21 bytes size
; Get user input 
; Assingment the input --> str
; Iterate str to initialize loop counter 
; Loop counter to compare str[c] to ASCII code 
; Condition : if  96 < str[c] < 124  -->  str[c] - 32
; Assingment new str
; Print new str
; ------------------------- 

.MODEL SMALL
.STACK 100h
.DATA  

prompt   db  10, 13,  "Please enter a sentence here : ", '$' ;-> Messege for the user
str      db  21, ?, 21  dup(?), 0                                                                 ;
counter  dw  0                                                  
new_line db  0Dh, 0Ah, '$'                                   ;-> Instruction for new line
    
    
;-------------
.CODE
;------------- 
 
  
  
; (1) Initionalize  

mov  ax,  @data                                          
mov  ds,  ax


      

      
; (2) Print prompt
lea  dx,  prompt
mov  ah,  09h
int  21h 





; (3) I\O_Part 

lea  dx,  str
mov  ah,  0ah
int  21h

mov  bx,  dx
mov  ah,  0  
mov  al,  ds:[bx+1]
add  bx,  ax
mov  byte ptr [bx+2], '$' 

lea dx, new_line
mov ah, 09h
int 21h

lea  bx,  str  
           
           
           
; (4) Opperation_Part 

mov  cx,  0                                                 ;-> Iterate str to initialize loop counter 
check_lenght:                                               ;-> Initionalize the counter register
            cmp  [bx], 0
            je   lenght
            inc  bx
            inc  cx
            jmp  check_lenght
          
lenght:
            mov  bx,       ax 
            add  counter,  cx



;-> Loop counter to compare str[c] to ASCII code : if  96 < str[c] < 124  -->  str[c] - 32  

lea  bx,  str+2
sub  cx,  3

upper_case:
    cmp   [bx],   20h
    je    next_step
    sub   [bx],   32

next_step:
    mov    dx,    [bx]
    mov    ah,    02
    int    21h
    inc    bx
    
    loop upper_case               
; ------------------------------------------------------------



 