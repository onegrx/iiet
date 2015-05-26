;; Author: Bartlomiej Szalach
;; Program 3 - Encrypt/Decrypt a file by XOR with input

CR equ 13d
LF equ 10d

data1 segment
    
    syntax db "Syntax is: xor.exe [input_file] [output_file] ", '"', "passphrase", '"', CR, LF, '$'
    
    input_file_handle dw ?
    input_file_name db 16 dup(0)
    output_file_handle dw ?
    output_file_name db 16 dup(0)
    secret_key db 20 dup(?)
    key_length db ?
    
    buffer db 100 dup(?)
    
    ;Statements
    data_encryption_done db "Data encryption has been finished succesfully.", CR, LF, '$'
    
    ;Error messages
    invalid_syntax_no_args_message db "You have not entered any arguments.", CR, LF, '$'
    invalid_syntax_interrupted_arg_message db "You have entered too less arguments or there are incorrect.", CR, LF, '$'
    invalid_syntax_entered_forbidden_char_message db "You have entered a forbidden character.", CR, LF, '$'
    invalid_syntax_missing_quotation_message db "A quotation mark is missing, please use the correct syntax given below.", CR, LF, '$'
    invalid_syntax_empty_passphrase_message db "The key (passphrase) cannot be empty.", CR, LF, '$'
    invalid_syntax_too_long_passphrase_message db "The key (passphrase) must be at most 20 characters long.", CR, LF, '$'
    
    newline db CR, LF, '$'
    
data1 ends

code1 segment
        
    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack

        ;;;;;;;;;;;;;;;;;;;;;;
        ;READING ARGS SECTION;
        ;;;;;;;;;;;;;;;;;;;;;;
        
        ;Prepare to reading arguments
        xor cx, cx
        mov cl, byte ptr ds:[080h] ;CL keeps argc + CR
        cmp cl, 0h
        jne try_to_read_file_names
        jmp invalid_syntax_no_args
    try_to_read_file_names:
        mov si, 082h
        mov ax, seg data1
        mov es, ax
        ;READ INPUT FILE
        mov di, offset input_file_name

    read_each_char_of_input_file:
        cmp cl, 0h
        jle invalid_syntax_interrupted_arg
        mov al, byte ptr ds:[si]
        cmp al, ' '
        je read_each_char_of_input_file_done
        call check_read_char_for_filename
        mov byte ptr es:[di], al
        inc si
        inc di
        dec cl
        jmp read_each_char_of_input_file
        
    read_each_char_of_input_file_done:
        ;READ OUTPUT FILE
        mov di, offset output_file_name
        inc si
        
    read_each_char_of_output_file:
        cmp cl, 0h
        jle invalid_syntax_interrupted_arg
        mov al, byte ptr ds:[si]
        cmp al, ' '
        je read_each_char_of_output_file_done
        call check_read_char_for_filename
        mov byte ptr es:[di], al
        inc si
        inc di
        dec cl
        jmp read_each_char_of_output_file    
        
    read_each_char_of_output_file_done:
        ;READ PASSPHRASE
        mov di, offset secret_key
        inc si
        dec cl
        cmp cl, 0h
        jle invalid_syntax_interrupted_arg
        mov al, byte ptr ds:[si]
        cmp al, '"'
        jne invalid_syntax_missing_quotation
        inc si
        dec cl
        xor bx, bx ;BX will contain a length of passphrase
        mov al, byte ptr ds:[si]
        cmp al, '"'
        je invalid_syntax_empty_passphrase
        ;Here there is one properly read char of passphrase
        inc bh
        mov byte ptr es:[di], al
        inc si
        inc di
        dec cl
    read_next_passphrase_char:
        mov al, byte ptr ds:[si]
        cmp al, '"'
        je passphrase_read_done
        inc bh ;One more char
        cmp bh, 20d
        jg invalid_syntax_too_long_passphrase
        mov byte ptr es:[di], al
        inc si
        inc di
        dec cl
        cmp cl, 0h
        jne read_next_passphrase_char
        jmp invalid_syntax_missing_quotation
        
    passphrase_read_done:
        
        mov ax, seg data1
        mov ds, ax
        mov si, offset key_length
        mov byte ptr ds:[si], bh 
    
        ;;;;;;;;;;;;;;;;;;;;;;;
        ;OPENING FILES SECTION;
        ;;;;;;;;;;;;;;;;;;;;;;;
        
        ;OPEN INPUT FILE
        mov dx, offset input_file_name
        xor cx, cx
        xor ax, ax
        ;AL = 0 - read only
        mov ah, 03dh
        int 21h
        ;If an error has occurred the CF is set to 1
        jc error_cannot_open_file_input
        mov word ptr ds:[input_file_handle], ax
        
        ;OPEN OUTPUT FILE
        mov dx, offset output_file_name
        xor cx, cx
        xor ax, ax
        mov al, 01h ;write only
        mov ah, 03dh
        int 21h
        ;If an error has occurred the CF is set to 1
        jc error_cannot_open_file_output
        mov word ptr ds:[output_file_handle], ax    
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;READ SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;  
        
        ;AH = 3F
        ;BX = file handle
        ;CX = number of bytes to read
        ;DS:DX = pointer to read buffer

    read_section:
        mov bx, word ptr ds:[input_file_handle]
        mov cx, 100d
        mov dx, offset buffer
        mov ah, 03fh
        int 021h
        
        cmp ax, 0h
        je crypt_done
        
        mov es, ax ;number of read bytes
        mov cx, ax
        mov si, offset secret_key
        mov di, offset buffer
        mov ah, 0 ;char counter
        mov bx, offset key_length

    xorring:
         
        cmp ah, ds:[bx]
        jne dont_scrool
        mov ah, 0h
        mov si, offset secret_key
    dont_scrool:
        mov al, byte ptr ds:[di] ;buffer sign
        mov dl, byte ptr ds:[si] ;key sign
        xor al, dl
        mov byte ptr ds:[di], al ;back to buffer after xor
        inc si
        inc di
        inc ah
        loop xorring
        
        ;Saving buffer to output_file
        
        ;AH = 40
        ;BX = file handle
        ;CX = number of bytes to write
        ;DS:DX = pointer to buffer to be written
       
        mov cx, es ;number of read bytes which has been just xorred to save
        mov bx, ds:[output_file_handle]
        mov dx, offset buffer
        mov ah, 040h
        int 021h
        
        jmp read_section
        
    crypt_done:
        mov dx, offset data_encryption_done
        call puts
        
        ;;;;;;;;;;;;;;;;;;;;
        ;CLOSE FILE SECTION;
        ;;;;;;;;;;;;;;;;;;;;
        
        mov bx, ds:[input_file_handle]
        mov ah, 03eh
        int 021h
        
        mov bx, ds:[output_file_handle]
        mov ah, 03eh
        int 021h
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;EXIT SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
    
    ;Exit program with code 0
    finish:
        mov ax, 4c00h
        int	021h 
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;ERRORS SECTION;;;
        ;;;;;;;;;;;;;;;;;;;;    
    
    invalid_syntax_no_args:
        mov dx, offset invalid_syntax_no_args_message 
        jmp continue_error_message
        
    invalid_syntax_interrupted_arg:
        mov dx, offset invalid_syntax_interrupted_arg_message
        jmp continue_error_message
        
    invalid_syntax_missing_quotation:
        mov dx, offset invalid_syntax_missing_quotation_message
        jmp continue_error_message
        
    invalid_syntax_empty_passphrase:
        mov dx, offset invalid_syntax_empty_passphrase_message
        jmp continue_error_message
        
    invalid_syntax_too_long_passphrase:
        mov dx, offset invalid_syntax_too_long_passphrase_message
        jmp continue_error_message
        
    continue_error_message:
        call puts
        mov dx, offset syntax
        call puts
        jmp finish 
        
        
    error_cannot_open_file_input:
    error_cannot_open_file_output:
        nop
        jmp finish
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Reading,writing and other functions
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;Check if AL is a letter, number or dot (if not exit)
    check_read_char_for_filename:
        cmp al, '.'
        je good_char
        cmp al, '0'
        je bad_char_exit
        cmp al, '9'
        jle good_char
        cmp al, 'A'
        jl bad_char_exit
        cmp al, 'Z'
        jle good_char
        cmp al, 'a'
        jl bad_char_exit
        cmp al, 'z'
        jle good_char
        jmp bad_char_exit
        
    bad_char_exit:
        mov dx, offset invalid_syntax_entered_forbidden_char_message
        call puts
        mov dx, offset syntax
        call puts
        jmp finish
    good_char:
        ret
        
    ;Display string from DS:DX
    puts:
        push ax
        push ds
        mov ax, seg data1
        mov ds, ax
        mov ah, 09h
        int 021h
        pop ds
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
        
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end begin
