;; Author: Bartlomiej Szalach
;; Program 2 - Printing ASCII chars in graphical mode

CR equ 13d
LF equ 10d

data1 segment

Sign_exclamation:
    db  00010000b
    db  00010000b
    db  00010000b
    db  00010000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_quotation:
    db  00101000b
    db  00101000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_hash:
    db  00000000b
    db  00101000b
    db  01111100b
    db  00101000b
    db  01111100b
    db  00101000b
    db  00000000b
    db  00000000b

Sign_dollar:
    db  00001000b
    db  00011110b
    db  00101000b
    db  00011100b
    db  00001010b
    db  00111100b
    db  00001000b
    db  00000000b

Sign_percent:
    db  01100000b
    db  10010100b
    db  01101000b
    db  00010110b
    db  00101001b
    db  00000110b
    db  00000000b
    db  00000000b

Sign_ampersand:    
    db  00011100b
    db  00100100b
    db  00100100b
    db  00011001b
    db  00100110b
    db  00011001b
    db  00000000b
    db  00000000b

Sign_apostrophe: 
    db  00001000b
    db  00001000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_lparen: 
    db  00001000b
    db  00010000b
    db  00100000b
    db  00100000b
    db  00010000b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_rparen: 
    db  00010000b
    db  00001000b
    db  00000100b
    db  00000100b
    db  00001000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_star:  
    db  00101010b
    db  00011100b
    db  00111110b
    db  00011100b
    db  00101010b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_plus:
    db  00000000b
    db  00001000b
    db  00001000b
    db  00111110b
    db  00001000b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_comma: 
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00010000b
    db  00100000b
    db  00000000b

Sign_minus:  
    db  00000000b
    db  00000000b
    db  00000000b
    db  00111100b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_dot:    
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_slash:  
    db  00000010b
    db  00000100b
    db  00001000b
    db  00010000b
    db  00100000b
    db  01000000b
    db  00000000b
    db  00000000b

Sign_0:      
    db  00011000b
    db  00100100b
    db  01000010b
    db  01000010b
    db  00100100b
    db  00011000b
    db  00000000b
    db  00000000b

Sign_1:      
    db  00001000b
    db  00011000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00011100b
    db  00000000b
    db  00000000b

Sign_2:      
    db  00111100b
    db  01000010b
    db  00000100b
    db  00011000b
    db  00100000b
    db  01111110b
    db  00000000b
    db  00000000b

Sign_3:      
    db  00111100b
    db  01000010b
    db  00000100b
    db  00011000b
    db  00000100b
    db  01000010b
    db  00111100b
    db  00000000b

Sign_4:
    db  00001000b
    db  00011000b
    db  00101000b
    db  01001000b
    db  01111100b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_5:      
    db  01111110b
    db  01000000b
    db  01111100b
    db  00000010b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_6:      
    db  00111100b
    db  01000000b
    db  01111100b
    db  01000010b
    db  01000010b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_7:      
    db  01111110b
    db  00000100b
    db  00001000b
    db  00010000b
    db  00100000b
    db  01000000b
    db  00000000b
    db  00000000b

Sign_8:      
    db  00111100b
    db  01000010b
    db  00111100b
    db  01000010b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_9:     
    db  00111100b
    db  01000010b
    db  01000010b
    db  00111110b
    db  00000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_colon:  
    db  00000000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_semicolon:
    db  00000000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b
    db  00010000b
    db  00100000b
    db  00000000b

Sign_lessthan:  
    db  00000000b
    db  00000011b
    db  00001100b
    db  00110000b
    db  00001100b
    db  00000011b
    db  00000000b
    db  00000000b

Sign_equals:   
    db  00000000b
    db  00000000b
    db  01111110b
    db  00000000b
    db  01111110b
    db  00000000b
    db  00000000b
    db  00000000b
    
Sign_greaterthan:
    db  00000000b
    db  11000000b
    db  00110000b
    db  00001100b
    db  00110000b
    db  11000000b
    db  00000000b
    db  00000000b

Sign_?:
    db  00111000b
    db  01000100b
    db  00000100b
    db  00011000b
    db  00000000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_@:
    db  00000000b
    db  00011110b
    db  00100010b
    db  01001110b
    db  01001010b
    db  00101110b
    db  00010000b
    db  00001110b

Sign_A:
    db  00011000b
    db  00011000b
    db  00100100b
    db  00111100b
    db  01000010b
    db  01000010b
    db  00000000b
    db  00000000b

Sign_B:
    db  01111100b
    db  01000010b
    db  01111100b
    db  01000010b
    db  01000010b
    db  01111100b
    db  00000000b
    db  00000000b

Sign_C:
    db  00111100b
    db  01000010b
    db  10000000b
    db  10000000b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_D:
    db  01111000b
    db  01000100b
    db  01000010b
    db  01000010b
    db  01000100b
    db  01111000b
    db  00000000b
    db  00000000b

Sign_E:
    db  01111110b
    db  01000000b
    db  01111100b
    db  01000000b
    db  01000000b
    db  01111110b
    db  00000000b
    db  00000000b

Sign_F:
    db  01111110b
    db  01000000b
    db  01111100b
    db  01000000b
    db  01000000b
    db  01000000b
    db  00000000b
    db  00000000b

Sign_G:
    db  00111100b
    db  01000010b
    db  10000000b
    db  10011100b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_H:
    db  01000010b
    db  01000010b
    db  01111110b
    db  01000010b
    db  01000010b
    db  01000010b
    db  00000000b
    db  00000000b

Sign_I:
    db  00111110b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00111110b
    db  00000000b
    db  00000000b

Sign_J:
    db  00111100b
    db  00000100b
    db  00000100b
    db  00000100b
    db  01000100b
    db  00111000b
    db  00000000b
    db  00000000b

Sign_K:
    db  01000100b
    db  01001000b
    db  01010000b
    db  01110000b
    db  01001000b
    db  01000100b
    db  00000000b
    db  00000000b

Sign_L:
    db  01000000b
    db  01000000b
    db  01000000b
    db  01000000b
    db  01000000b
    db  01111110b
    db  00000000b
    db  00000000b

Sign_M:
    db  01000001b
    db  01100011b
    db  01010101b
    db  01001001b
    db  01000001b
    db  01000001b
    db  00000000b
    db  00000000b

Sign_N:
    db  01000010b
    db  01100010b
    db  01010010b
    db  01001010b
    db  01000110b
    db  01000010b
    db  00000000b
    db  00000000b

Sign_O:
    db  00011100b
    db  00100010b
    db  00100010b
    db  00100010b
    db  00100010b
    db  00011100b
    db  00000000b
    db  00000000b

Sign_P:
    db  01111000b
    db  01000100b
    db  01111000b
    db  01000000b
    db  01000000b
    db  01000000b
    db  00000000b
    db  00000000b

Sign_Q:
    db  00011100b
    db  00100010b
    db  00100010b
    db  00100010b
    db  00100010b
    db  00011100b
    db  00000010b
    db  00000000b

Sign_R:
    db  01111000b
    db  01000100b
    db  01111000b
    db  01010000b
    db  01001000b
    db  01000100b
    db  00000000b
    db  00000000b

Sign_S:
    db  00011100b
    db  00100010b
    db  00010000b
    db  00001100b
    db  00100010b
    db  00011100b
    db  00000000b
    db  00000000b

Sign_T:
    db  01111111b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_U:
    db  01000010b
    db  01000010b
    db  01000010b
    db  01000010b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_V:
    db  10000001b
    db  01000010b
    db  01000010b
    db  00100100b
    db  00100100b
    db  00011000b
    db  00000000b
    db  00000000b

Sign_W:
    db  01000001b
    db  01000001b
    db  01001001b
    db  01010101b
    db  01100011b
    db  01000001b
    db  00000000b
    db  00000000b

Sign_X:
    db  01000010b
    db  00100100b
    db  00011000b
    db  00011000b
    db  00100100b
    db  01000010b
    db  00000000b
    db  00000000b

Sign_Y:
    db  01000001b
    db  00100010b
    db  00010100b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_Z:
    db  01111110b
    db  00000100b
    db  00001000b
    db  00010000b
    db  00100000b
    db  01111110b
    db  00000000b
    db  00000000b

Sign_lsquarebracket:  
    db  00111000b
    db  00100000b
    db  00100000b
    db  00100000b
    db  00100000b
    db  00111000b
    db  00000000b
    db  00000000b

Sign_backslash:
    db  01000000b
    db  00100000b
    db  00010000b
    db  00001000b
    db  00000100b
    db  00000010b
    db  00000000b
    db  00000000b

Sign_rsquarebracket:
    db  00111000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00111000b
    db  00000000b
    db  00000000b

Sign_caret:
    db  00010000b
    db  00101000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_underscore:
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  01111110b
    db  00000000b
    db  00000000b

Sign_acute:
    db  00010000b
    db  00001000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b
    db  00000000b

Sign_as:
    db  00000000b
    db  00111100b
    db  00000010b
    db  00111110b
    db  01000110b
    db  00111010b
    db  00000000b
    db  00000000b

Sign_bs:
    db  01000000b
    db  01000000b
    db  01111100b
    db  01000010b
    db  01100010b
    db  01011100b
    db  00000000b
    db  00000000b

Sign_cs:
    db  00000000b
    db  00000000b
    db  00011100b
    db  00100000b
    db  00100000b
    db  00011100b
    db  00000000b
    db  00000000b

Sign_ds:
    db  00000010b
    db  00000010b
    db  00111110b
    db  01000010b
    db  01000110b
    db  00111010b
    db  00000000b
    db  00000000b

Sign_es:
    db  00000000b
    db  00111100b
    db  01000010b
    db  01111110b
    db  01000000b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_fs:
    db  00000000b
    db  00011000b
    db  00010000b
    db  00111000b
    db  00010000b
    db  00010000b
    db  00000000b
    db  00000000b

Sign_gs:
    db  00000000b
    db  00000000b
    db  00110100b
    db  01001100b
    db  01000100b
    db  00110100b
    db  00000100b
    db  00111000b

Sign_hs:
    db  00100000b
    db  00100000b
    db  00111000b
    db  00100100b
    db  00100100b
    db  00100100b
    db  00000000b
    db  00000000b

Sign_is:
    db  00001000b
    db  00000000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00000000b
    db  00000000b

Sign_js:
    db  00001000b
    db  00000000b
    db  00011000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  01110000b

Sign_ks:
    db  00100000b
    db  00100000b
    db  00100100b
    db  00101000b
    db  00110000b
    db  00101100b
    db  00000000b
    db  00000000b

Sign_ls:
    db  00010000b
    db  00010000b
    db  00010000b
    db  00010000b
    db  00010000b
    db  00011000b
    db  00000000b
    db  00000000b

Sign_ms:
    db  00000000b
    db  00000000b
    db  01100110b
    db  01011010b
    db  01000010b
    db  01000010b
    db  00000000b
    db  00000000b

Sign_ns:
    db  00000000b
    db  00000000b
    db  00101110b
    db  00110010b
    db  00100010b
    db  00100010b
    db  00000000b
    db  00000000b

Sign_os:
    db  00000000b
    db  00000000b
    db  00111100b
    db  01000010b
    db  01000010b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_ps:
    db  00000000b
    db  00000000b
    db  01011100b
    db  01100010b
    db  01000010b
    db  01111100b
    db  01000000b
    db  01000000b

Sign_qs:
    db  00000000b
    db  00000000b
    db  00111010b
    db  01000110b
    db  01000010b
    db  00111110b
    db  00000010b
    db  00000010b

Sign_rs:
    db  00000000b
    db  00000000b
    db  00101100b
    db  00110010b
    db  00100000b
    db  00100000b
    db  00000000b
    db  00000000b

Sign_ss:
    db  00000000b
    db  00011100b
    db  00100000b
    db  00011000b
    db  00000100b
    db  00111000b
    db  00000000b
    db  00000000b

Sign_ts:
    db  00000000b
    db  00010000b
    db  00111100b
    db  00010000b
    db  00010000b
    db  00011000b
    db  00000000b
    db  00000000b

Sign_us:
    db  00000000b
    db  00000000b
    db  00100010b
    db  00100010b
    db  00100110b
    db  00011010b
    db  00000000b
    db  00000000b

Sign_vs:
    db  00000000b
    db  00000000b
    db  01000010b
    db  01000010b
    db  00100100b
    db  00011000b
    db  00000000b
    db  00000000b

Sign_ws:
    db  00000000b
    db  00000000b
    db  10000001b
    db  10000001b
    db  01011010b
    db  01100110b
    db  00000000b
    db  00000000b

Sign_xs:
    db  00000000b
    db  00000000b
    db  01000010b
    db  00100100b
    db  00011000b
    db  01100110b
    db  00000000b
    db  00000000b

Sign_ys:
    db  00000000b
    db  00000000b
    db  01000010b
    db  00100010b
    db  00010100b
    db  00001000b
    db  00010000b
    db  01100000b

Sign_zs:
    db  00000000b
    db  00000000b
    db  00111100b
    db  00001000b
    db  00010000b
    db  00111100b
    db  00000000b
    db  00000000b

Sign_lbrace:
    db  00011100b
    db  00010000b
    db  00110000b
    db  00110000b
    db  00010000b
    db  00011100b
    db  00000000b
    db  00000000b

Sign_pipe:
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00001000b
    db  00000000b

Sign_rbrace:
    db  00111000b
    db  00001000b
    db  00001100b
    db  00001100b
    db  00001000b
    db  00111000b
    db  00000000b
    db  00000000b

Sign_tilde:
    db  00000000b
    db  00000000b
    db  00000000b
    db  00110010b
    db  01001100b
    db  00000000b
    db  00000000b
    db  00000000b

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;END OF BIT MATRICES DEFINITIONS;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;MORE DATA DEFINED BELOW

    syntax db "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    
    input_file_handle dw ?
    input_file_name db 16 dup(0)

    ;Errors section
    error_no_args db "Error: you have not entered any arguments", CR, LF, "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    error_too_many_args db "Error: you have entered too many arguments", CR, LF, "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    invalid_syntax_entered_forbidden_char_message db "You have entered a forbidden character.", CR, LF, '$'

data1 ends

code1 segment

    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack
        
        mov cl, byte ptr ds:[080h] ;number of chars in args ie. argc
        cmp cl, 0h
        jnz parse_args
        
        mov dx, offset error_no_args
        call error_found
        
    parse_args:
        mov si, 082h
        mov ax, seg data1
        mov es, ax
        mov di, offset input_file_name
    read_each_char_of_input_file:
        cmp cl, 0h
        je endofcmdlargs
        mov al, byte ptr ds:[si]
        call check_read_char_for_filename
        
        
        
        
        
        
        
        endofcmdlargs:
        nop
        
        mov dx, seg data1
        mov ds, ax

        ;Graphic mode VGA
        ;AH = 00h ie. set video mode
        ;AL = 13h ie. 320x200 Graphics, 256 colours, 1 page
        ;mov ax, 013h
        ;int 10h
        
        ;Exit with success
    finish:
        mov ax, 4c00h
        int 021h
        
        
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;Other functions and utilities;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
    ;Error handling
    error_found:
        call puts
        jmp finish
        
    ;Change A-Z into a-z
    tolower:
        cmp al, 'A'
        jl up_to_low_end
        cmp al, 'Z'
        jg up_to_low_end
        add al, 32d
    up_to_low_end:
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
        
    ;Check if AL is white character, returns 1 in DL if yes
    iswhitechar:
        xor dl, dl
        cmp al, 032d
        je whitechar
        cmp al, 09d
        je whitechar
        ret
    whitechar:
        mov dl, 01h
        ret
        
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
        
        
code1 ends

stack1 segment stack
    dw 250 dup(?)
    p_stack dw ?
stack1 ends

end begin