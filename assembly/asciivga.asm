;; Author: Bartlomiej Szalach
;; Program 2 - Printing ASCII chars in graphical mode

data1 segment
    
data1 ends

code1 segment
 
    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack
        
        ;Graphic mode VGA 
        ;AH = 00h ie. set video mode
        ;AL = 13h ie. 320x200 Graphics, 256 colors, 1 page
        mov ax, 013h
        int 10h
        
    
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin