;; Author: Bartlomiej Szalach
;; Program 1 - ASCII to Morse Code converter

CR equ 13d
LF equ 10d

data1 segment
    
    stars db "********************************", CR, LF, '$'
    entry db "ASCII <-> Morse's Code Covnerter", CR, LF, '$'
    input db 102d dup(?) ;102 bytes because of adding 0 at the end
    farewell db CR, LF, "Goodbye", CR, LF, '$'
    
    option0 db "[0] Exit program", CR, LF, '$'
    option1 db "[1] Convert ASCII string to Morse's code", CR, LF, '$'
    option2 db "[2] Convert Morse's code to ASCII string", CR, LF, '$'
    your_option db "Select option: $"
    invalid_option db CR, LF, "Invalid option, please try again.", CR, LF, '$'

    string_to_morse db CR, LF, "Enter the string:", CR, LF, '$'
    morse_to_string db CR, LF, "Enter the Morse's code:", CR, LF, '$'
    
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
        mov dx, offset newline
        call puts
        mov dx, offset stars
        call puts
		mov	dx, offset entry
        call puts
        mov dx, offset stars
        call puts
    menu:
        mov dx, offset option0
        call puts
        mov dx, offset option1
        call puts
        mov dx, offset option2
        call puts
        mov dx, offset prompt
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
        jmp menu
        
        ;;;ENCODE SECTION;;;
    encode:
        mov dx, offset string_to_morse
        call puts
        mov dx, offset input
        call get_str
        ;;Place more code here
        jmp finish
        
        ;;;DECODE SECTION;;;
    decode:
        mov dx, offset morse_to_string
        call puts
        mov dx, offset input
        call get_str
        ;;Place more code here
        jmp finish
        
    ;Exit program with code 0
    finish:
        mov dx, offset farewell
        call puts
        mov ax, 4c00h
        int	021h
        
    ;Display string from DS:DX
    puts: 
        mov ah, 09h
        int 021h
        ret
        
    ;Display one character from DL
    putc:
        push ax
        mov ah, 02h
        int 021h
        pop ax
        ret
        
    ;Read character into AL
    getc:
        mov ah, 01h
        int 021h
        ret
    
    ;Display string terminated by 0 whose address is in DX
    put_str:
        push ax
        push bx
        mov bx, dx
        mov al, byte ptr [bx]
    put_loop:
        cmp al, 0
        je put_finish
        call putc
        inc bx
        mov al, byte ptr [bx]
        jmp put_loop
    put_finish:
        pop bx
        pop ax
        ret

    ;Read string terminated by CR into array whose address is in DX
    get_str:
        push ax
        push bx
        mov bx, dx
        call getc
        mov byte ptr [bx], al ;Place just inserted character into array
    get_loop:
        cmp al, 13d
        je get_finish
        inc bx
        call getc
        mov byte ptr [bx], al
        jmp get_loop
    get_finish:
        mov byte ptr [bx], 0 ;Terminate it with 0
        pop bx
        pop ax
        ret
        
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin
