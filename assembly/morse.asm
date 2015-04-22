;; Author: Bartlomiej Szalach
;; Program 1 - ASCII to Morse Code converter

CR equ 13d
LF equ 10d

data1 segment
    
    stars db "********************************", CR, LF, '$'
    entry db "ASCII <-> Morse's Code Covnerter", CR, LF, '$'
    farewell db CR, LF, "Goodbye", CR, LF, '$'
    
    morse db " .-..$a.-$b-...$c-.-.$d-..$e.$f..-.$g--.$"
    
    bufferSize db 101  ;100 char + return
    inputLength db 0 ;number of read characters
    buffer db 101 dup('$') ;actual buffer
    
    option0 db " [0] Exit program", CR, LF, '$'
    option1 db " [1] Convert ASCII string to Morse's code", CR, LF, '$'
    option2 db " [2] Convert Morse's code to ASCII string", CR, LF, '$'
    your_option db "Select option: $"
    invalid_option db CR, LF, "Invalid option, please try again.", CR, LF, '$'

    string_to_morse db CR, LF, "Enter the string:", CR, LF, '$'
    morse_to_string db CR, LF, "Enter the Morse's code:", CR, LF, '$'
    
    ;morse_list db "a.-i..o---e.z--..n-.r.-.w.--s...t-c-.-.y-.--k-.-d-..p.--.m--u..-j.---l.-..b-...g--.h....f..-.v...-x-..-0-----1.----2..---3...--4....-5.....6-....7--...8---..9----.$"
    
    newline db CR, LF, '$'
    prompt db CR,LF,">> ",'$'
    
data1 ends

code1 segment
    
    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack
        
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
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;ENCODE SECTION;;;
        ;;;;;;;;;;;;;;;;;;;;
    encode:
        mov dx, offset string_to_morse
        call puts
        mov dx, offset bufferSize
        call gets
        mov dx, offset newline
        call puts
        
        mov bx, offset bufferSize
        inc bx
        mov cx, bx ;CX shows number of read chars
        inc bx ;BX shows the first read char
    encode_each:
        cmp cx, 0d
        je finish
        mov al, byte ptr ds:[bx] ;AL is the first letter
        call up_to_low
        ;Now AL contains first read character in lower case
        call encode_char
        inc bx
        dec cx
        jmp encode_each
    encode_char:    
        mov si, offset morse
        mov ah, byte ptr ds:[si]
    find:
        cmp al, ah
        je put_encoded_char
        inc si
        mov ah, byte ptr ds:[si]
        jmp find
    put_encoded_char:
        inc si
        mov dx, si
        call puts
        
   
        
        
        
        jmp finish
        
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;DECODE SECTION;;;
        ;;;;;;;;;;;;;;;;;;;;
    decode:
        jmp finish
        
    ;Exit program with code 0
    finish:
        mov dx, offset farewell
        call puts
        mov ax, 4c00h
        int	021h
        
        
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Reading,writing and other functions
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
    ;Display string from DS:DX
    puts:
        push ax
        mov ah, 09h
        int 021h
        pop ax
        ret
    
    ;Read string into DS:DX
    gets:
        push ax
        mov ah, 0Ah
        int 021h
        pop ax
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
     
    ;Change A-Z into a-z
    up_to_low:
        cmp al, 'A'
        jl up_to_low_end
        cmp al, 'Z'
        jg up_to_low_end
        add al, 32d
    up_to_low_end:
        ret
        
        
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin
