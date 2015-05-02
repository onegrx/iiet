;; Author: Bartlomiej Szalach
;; Program 3 - Encrypt/Decrypt a file by XOR with input

CR equ 13d
LF equ 10d

data1 segment
    
    syntax db "Syntax is: xor.exe [input_file] [output_file] ", '"', "passphare", '"', CR, LF, '$'
    
    input_file_handle dw ?
    input_file_name db 16 dup(0)
    output_file_handle dw ?
    output_file_name db 16 dup(0)
    secret_key db 20 dup(?)
    
    buffer db 100 dup(?)
    
    ;Error messages
    invalid_syntax_no_args_message db "You have not entered any arguments.", CR, LF, '$'
    invalid_syntax_interrupted_arg_message db "You have entered too less arguments or there are incorrect", CR, LF, '$'
    invalid_syntax_entered_forbidden_char_message db "You have entered a forbidden character", CR, LF, '$'
    
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
        ;READ PASSPHARE
        
        
        
        
        
        nop
        
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;EXIT SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
    
    ;Exit program with code 0
    finish:
        ;close files here todo
        mov ax, 4c00h
        int	021h    
        
    invalid_syntax_no_args:
        mov dx, offset invalid_syntax_no_args_message
        call puts
        mov dx, offset syntax
        call puts
        jmp finish  
    
    invalid_syntax_interrupted_arg:
        mov dx, offset invalid_syntax_interrupted_arg_message
        call puts
        mov dx, offset syntax
        call puts
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
