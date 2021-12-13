;HomeWork.asm
;quation 1 - define (sourse, dest) -> strings(size 20b)
;param: source gets and store string. param: dest gets a reversed version of source
;"hollo world" -> "dlrow olleW"
;print(source, dest);
;-------------------------------------------
.MODEL SMALL
.STACK 100h
.DATA
    prompt     db   10, 13, "Please enter a String: $"
    result     db   "the reverse of your String: ", "$"          
    source     db   21, ?, 21 dup(?), 0  
    dest       db   21 dup(?)      ;empty string of size 20Bit
    counter    dw   0
    new_line   db   0Dh,0Ah, '$'   ; new line code.
.CODE
start:
     ;-------------initialize--------------------------------- 
     mov ax, @data                 ; need to ask @
     mov ds, ax
     
     ;-> print promt
     lea dx, prompt                ; -> copy address of prompt to dx
     mov ah, 09h                    ; -> print subfunc
     int 21h  
     
     ;-------------opprations---------------------------------
     ;1) load our pointer to the beginning of the structure
     lea dx, source
     mov ah, 0ah                    ; GetLine function
     int 21h
                           
     mov bx, dx
     mov al, ds:[bx+1]
     add bx, ax                    ; point to end of the string
     mov byte ptr [bx+2], '$'      ; put zeror to the end.
     
     lea bx, source

     ;2) initialize counter
     mov cx, 0                     ; reset counter.
     compare: cmp [bx], 0          ; is it the end of the string?
              je done              ; if zero, then its the end
              inc cx               ; count char
              inc bx               ; next memory position in source
              jmp compare

     done:
          mov bx, ax
          add counter, cx
         
          
     ;3) initialize loop condition     mov si, 0
     mov di, 0
     mov si, 0
     mov di, counter 
     inc di
    
     
     looper:
          mov al, source[si]
          mov dest[di], al
          inc si
          dec di
          loop looper     
          
          
          mov dest[si], '$'
     
     ;4) print new line
     lea dx, new_line
     mov ah, 09h
     int 21h
     

     ;5) print result
     lea dx, result
     mov ah, 09h
     int 21h
             
     ;6) print new line
     lea dx, new_line
     mov ah, 09h
     int 21h        
             
     ;7) print source ,dest
     lea dx, dest 
     mov ah, 09h ; output
     int 21h
     end start        



     
       
           
                 
                 


