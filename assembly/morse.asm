;; Author: Bartlomiej Szalach
;; Program 1 - ASCII to Morse Code converter

CR equ 13d
LF equ 10d

data1 segment
    
    stars db "********************************", CR, LF, '$'
    entry db "ASCII <-> Morse's Code Covnerter", CR, LF, '$'
    farewell db CR, LF, "Goodbye", CR, LF, '$'
    
    ;Array "morse" for encoding, "morse_heap" for decoding
    morse db " .-..-$a.-$b-...$c-.-.$d-..$e.$f..-.$g--.$h....$i..$j.---$k-.-$l.-..$m--$n-.$o---$p.--.$q--.-$r.-.$s...$t-$u..-$v...-$w.--$x-..-$y-.--$z--..$0-----$1.----$2..---$3...--$4....-$5.....$6-....$7--...$8---..$9----.$"
    morse_heap db 0h, "etianmsurwdkgohvf,l,pjbxcyzq,,54,3,,,2, ,,,,,16,,,,,,,7,,,8,90$"
    
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
    
    newline db CR, LF, '$'
    prompt db CR,LF,">> ",'$'
    
    dot db ".-.-.-$"
    dash db "-....-$"
    
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
        mov cl, byte ptr ds:[bx] ;CX shows number of read chars
        inc bx ;BX shows the first read char
        
    encode_each:
        cmp cl, 0d
        je finish
        mov al, byte ptr ds:[bx] ;AL is the first letter
        call up_to_low
        ;Now AL contains first read character in lower case
    
    encode_char:    
        mov si, offset morse
        mov ah, byte ptr ds:[si]
    find:
        cmp al, '.'
        je special_cases
        cmp al, '-'
        je special_cases
        cmp al, ah
        je put_encoded_char
        inc si
        mov ah, byte ptr ds:[si]
        jmp find
    put_encoded_char:
        inc si
        mov dx, si
        call puts
        mov dl, ' '
        call putc
        inc bx
        dec cl
        jmp encode_each
        
    special_cases:
        cmp al, '.'
        je dotcase
        cmp al, '-'
        je dashcase
    dotcase:
        mov dx, offset dot
        call puts
        jmp special_cases_end
    dashcase:
        mov dx, offset dash
        call puts
        jmp special_cases_end
    special_cases_end:
        mov dl, ' '
        call putc
        inc bx
        dec cl
        jmp encode_each
                
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;DECODE SECTION;;;
        ;;;;;;;;;;;;;;;;;;;;
    decode:
    
        mov dx, offset string_to_morse
        call puts
        mov dx, offset bufferSize
        call gets
        mov dx, offset newline
        call puts
        
        mov bx, offset buffer
        xor cx, cx
 
    decode_each:
        mov al, byte ptr ds:[bx] ;AL is the first letter  
        
        cmp al, CR
        je print_morse ;special case for end
        cmp al, ' '
        je print_morse
        
        call decode_dot_or_dash
        inc bx
        jmp decode_each
        
    print_morse:
        mov si, offset morse_heap
        add si, cx
        mov dl, byte ptr ds:[si]
        call putc
        
        ;If it was CR and not space go to finish
        cmp al, CR
        je finish
        
        ;After putting a letter continue others
        xor cx, cx
        inc bx
        jmp decode_each
    

        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;EXIT SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
    
    ;Exit program with code 0
    finish:
        mov dx, offset farewell
        call puts
        mov ax, 4c00h
        int	021h
        
        
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Reading,writing and other functions
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;Decode one dot or dash to increase CX pointer to heap
    decode_dot_or_dash:
        cmp al, '.'
        je decode_dot
        cmp al, '-'
        je decode_dash
        jmp no_dot_nor_dash
        
    decode_dot:
        push ax
        mov al, 2
        mul cl
        mov cl, al
        add cl, 1
        pop ax
        jmp no_dot_nor_dash
        
    decode_dash:
        push ax
        mov al, 2
        mul cl
        mov cl, al
        add cl, 2
        pop ax
        jmp no_dot_nor_dash
        
    no_dot_nor_dash:
        ret
 
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
