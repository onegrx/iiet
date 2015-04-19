;; Bartlomiej Szalach
;; Task 1 - ASCII to Morse Code converter

CR equ 13d
LF equ 10d

data1 segment

    entry db "ASCII <-> Morse's Code Covnerter", CR, LF, '$'
    input db 100d dup(?)
    
    option0 db "[0] Exit program", CR, LF, '$'
    option1 db "[1] Convert ASCII string to Morse's code", CR, LF, '$'
    option2 db "[2] Convert Morse's code to ASCII string", CR, LF, '$'
    your_option db "Select option: $"
    invalid_option db "Invalid option, please try again.", CR, LF, '$'

    string_to_morse db "Enter the string:", CR, LF, '$'
    morse_to_string db "Enter the Morse's code:", CR, LF, '$'
    
	newline db CR, LF, '$' 
	prompt db CR,LF,">> ",'$'
    
data1 ends

code1 segment
    
    begin:
        ;Stack initialize
		mov	ax, seg p_stack	
		mov	ss, ax
		mov	sp, offset p_stack	

        ;Copy address of data1 segment to DS through AX 
		mov	ax, seg data1
		mov	ds, ax
        
        ;Display entry message and options
		mov	dx, offset entry
        call puts
    menu:
        mov dx, offset option0
        call puts
        mov dx, offset option1
        call puts
        mov dx, offset option2
        call puts
        
        ;Read option into AL and navigate to proper function
        call getc
        
        cmp al, '0'
        je finish
        cmp al, '1'
        je encode
        cmp al, '2'
        je decode
        
        ;If other than 0/1/2 invoke "invalid section"
        mov dx, offset invalid_option
        call puts
        
        ;;;ENCODE SECTION;;;
        mov dx, offset string_to_morse
        call puts
        
        
        
    ;Exit program with code 0
    finish:
        mov ax, 4c00h
        int	021h
        
    ;Display character from AX
    puts: 
        push ax
        mov ah, 09h
        int 021h
        pop ax 
        ret
        
    ;Read character into AL
    getc:
        mov ah, 01h
        int 021h
        ret
		
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin
