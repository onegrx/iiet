;; Author: Bartlomiej Szalach
;; Program 3 - Encrypt/Decrypt a file by XOR with input

CR equ 13d
LF equ 10d

data1 segment
    
    stars db "********************************", CR, LF, '$'
    farewell db CR, LF, "Goodbye", CR, LF, '$'
    
    newline db CR, LF, '$'
    prompt db CR,LF,">> ",'$'
    
data1 ends

code1 segment
    
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;MAIN SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
        
    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack
        
        ;Copy address of data1 segment to DS through AX 
		mov	ax, seg data1
		mov	ds, ax
        
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin
