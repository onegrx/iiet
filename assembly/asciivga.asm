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
    
ASCIImatrix dw	offset Sign_exclamation, offset Sign_quotation, offset Sign_hash, offset Sign_dollar, offset Sign_percent, offset Sign_ampersand, offset Sign_apostrophe
			dw	offset Sign_lparen, offset Sign_rparen, offset Sign_star, offset Sign_plus, offset Sign_comma, offset Sign_minus, offset Sign_dot, offset Sign_slash
			dw	offset Sign_0, offset Sign_1, offset Sign_2, offset Sign_3, offset Sign_4, offset Sign_5, offset Sign_6, offset Sign_7, offset Sign_8, offset Sign_9
			dw	offset Sign_colon, offset Sign_semicolon, offset Sign_lessthan, offset Sign_equals, offset Sign_greaterthan, offset Sign_?, offset Sign_@, offset Sign_A, offset Sign_B 
			dw	offset Sign_C, offset Sign_D, offset Sign_E, offset Sign_F, offset Sign_G, offset Sign_H, offset Sign_I, offset Sign_J, offset Sign_K, offset Sign_L
			dw	offset Sign_M, offset Sign_N, offset Sign_O, offset Sign_P, offset Sign_Q, offset Sign_R, offset Sign_S, offset Sign_T, offset Sign_U, offset Sign_V
			dw	offset Sign_W, offset Sign_X, offset Sign_Y, offset Sign_Z, offset Sign_lsquarebracket, offset Sign_backslash, offset Sign_rsquarebracket, offset Sign_caret, offset Sign_underscore, offset Sign_acute
			dw	offset Sign_as, offset Sign_bs, offset Sign_cs, offset Sign_ds, offset Sign_es, offset Sign_fs, offset Sign_gs, offset Sign_hs, offset Sign_is, offset Sign_js
			dw	offset Sign_ks, offset Sign_ls, offset Sign_ms, offset Sign_ns, offset Sign_os, offset Sign_ps, offset Sign_qs, offset Sign_rs, offset Sign_ss, offset Sign_ts
			dw	offset Sign_us, offset Sign_vs, offset Sign_ws, offset Sign_xs, offset Sign_ys, offset Sign_zs, offset Sign_lbrace, offset Sign_pipe, offset Sign_rbrace, offset Sign_tilde

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;END OF BIT MATRICES DEFINITIONS;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;MORE DATA DEFINED BELOW

    syntax db "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    
    buffer db 512 dup(0)
    
    sign db 0
    color db 0
    enlargement db 0
    
    Xread db 4 dup(0)
    Yread db 4 dup(0)
    
    X dw 0
    Y dw 0    
    
    ;Input file
    input_file_handle dw ?
    input_file_name db 16 dup(0)

    ;Errors section
    error_no_args db "Error: you have not entered any arguments.", CR, LF, "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    error_too_many_args db "Error: you have entered too many arguments.", CR, LF, "The correct syntax is: asciivga [input_file]", CR, LF, '$'
    invalid_syntax_entered_forbidden_char_message db "You have entered a forbidden character.", CR, LF, '$'
    error_cannot_open_file_input_message db "Cannot open input file.", CR, LF, '$'
    error_cannot_read_file db "Cannot read input file.", CR, LF, '$'
    error_cannot_close_file db "Cannot properly close file. The program will exit.", CR, LF, '$'

data1 ends

code1 segment

    begin:
        ;Stack initialize
        mov ax, seg p_stack
        mov ss, ax
        mov sp, offset p_stack
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;PARSIONG CMDLINE ARGS;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
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
        call ignorewhitechars
        call iswhitechar
        cmp dl, 0h
        xor ch, ch ;CH will be the length of input_file_name
        je read_each_char_of_input_file
        
        mov dx, offset error_no_args
        call error_found
        
    read_each_char_of_input_file:
        cmp cl, 0h
        je parse_args_end
        ;In the AL remains a value from calling ignorewhitechars
        call check_read_char_for_filename
        mov	byte ptr es:[di], al ;save to input_file_name
        inc si
        inc di
        mov al, byte ptr ds:[si]
        dec cl
        call iswhitechar
        cmp dl, 0h
        jne toomanyargs
        jmp read_each_char_of_input_file
        
    toomanyargs:
        inc cl ;because it was decremented above
        call ignorewhitechars
        call iswhitechar
        cmp dl, 0h
        jne parse_args_end
        
        mov dx, offset error_too_many_args
        call error_found
        
    parse_args_end:
        
        ;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;OPENING THE FILE;;;
        ;;;;;;;;;;;;;;;;;;;;;;;
        
        ;Opening the file
        
        mov ax, seg data1
        mov ds, ax
        
        xor cx, cx
        xor ax, ax
        mov ah, 03dh
        mov dx, offset input_file_name
        
        int 021h
        jc error_cannot_open_file_input
        mov word ptr ds:[input_file_handle], ax
        jmp file_opened
        
    error_cannot_open_file_input:
        mov dx, offset error_cannot_open_file_input_message
        call error_found
        
    file_opened:
    
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;DRAW SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
    
    ;Graphic mode VGA
    ;AH = 00h ie. set video mode
    ;AL = 13h ie. 320x200 Graphics, 256 colours, 1 page
        mov ax, 013h
        int 010h
        
        mov cx, 200h
    
    draw_loop:
        call readfromfile
        call parseanddraw
        cmp ax, cx ;if less that means the file was entirely read
        je draw_loop
        

    waitforESC:
    ;int 016h
    ;AH = 00
    ;on return:
    ;AH = keyboard scan code
    ;AL = ASCII character or zero if special function key

        mov	ah, 00h 
        int	016h
        cmp	al, 27d
        jne	waitforESC
    
        ;Return to text mode
        mov ah, 0h
        mov al, 03h
        int 010h
        
        ;;;;;;;;;;;;;;;;;;;;
        ;;;;EXIT SECTION;;;;
        ;;;;;;;;;;;;;;;;;;;;
        
        ;Exit with success
    finish:
        mov ax, 4c00h
        int 021h
        
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
        ;Actually the main section
        ;=====================================================================
    parseanddraw:
        mov si, offset buffer
        mov cx, ax ;Counter of signs
        
    readline:
        cmp cx, 0h
        je buffer_empty
        mov al, byte ptr ds:[si]
        
        cmp al, LF
        jne parseline
        
        inc si
        dec cx
        
        
    buffer_empty:   
    parseline:
    
    parsesign:
        mov al, byte ptr ds:[si]
        mov byte ptr ds:[sign], al
        inc si
        inc si
        
    parsecolor:
        mov al, byte ptr ds:[si]
        mov byte ptr ds:[color], al
        inc si   
        inc si
        
    parseenlargement:
        mov al, byte ptr ds:[si]
        mov byte ptr ds:[enlargement], al
        inc si
        inc si
        
    parsecoordX:
        mov al, byte ptr ds:[si]
        mov byte ptr ds:[Xread], al
        inc si
        mov al, byte ptr ds:[si]
        call iswhitechar
        cmp dl, 01h ;DL = 1 means white char
        je parsecoordY
        mov byte ptr ds:[Xread + 1], al
        inc si
        mov al, byte ptr ds:[si]
        call iswhitechar
        cmp dl, 01h ;DL = 1 means white char
        je parsecoordY
        mov byte ptr ds:[Xread + 2], al
        inc si
        
    parsecoordY:
        inc si
        mov al, byte ptr ds:[si]
        mov byte ptr ds:[Yread], al
        inc si
        mov al, byte ptr ds:[si]
        call iswhitechar
        cmp dl, 01h ;DL = 1 means white char
        je line_loaded_to_vars
        mov byte ptr ds:[Yread + 1], al
        inc si
        mov al, byte ptr ds:[si]
        call iswhitechar
        cmp dl, 01h ;DL = 1 means white char
        je line_loaded_to_vars
        mov byte ptr ds:[Yread + 2], al
        
        inc si
        
        mov bx, offset Xread
        call calucate_coords
        mov word ptr ds:[X], dx
        
        mov bx, offset Yread
        call calucate_coords
        mov word ptr ds:[Y], dx
        
    line_loaded_to_vars:
    display:
        call paint
        
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;Other functions and utilities;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        
    ;Draw the sign
    paint:
        
        ;Load memory address
        mov	ax, 0A000h
        mov	es, ax
        
        ;Calculating the real coordinates
        mov	dx, word ptr ds:[Y]	
        mov	ax, 199d
        sub	ax, dx
        mov	word ptr ds:[Y], ax
        
        ;Loading the character's bit matrix
        xor bx, bx
        mov bl, byte ptr ds:[sign]
        sub	bl, 33d
        shl	bx, 1
        add	bx, offset ASCIImatrix
        mov	ax, word ptr ds:[bx]
        mov	bx, ax
        
        ret
        
        
        
        
    ;Extract integer value from string digits
    calucate_coords:
    
        xor dx, dx
        
        mov	al, byte ptr ds:[bx]
        mov	byte ptr ds:[bx], 0d
        inc bx
        
        sub	al, '0'
        add	dx, ax
        
    coordloop:

		mov	al, byte ptr ds:[bx]
		mov	byte ptr ds:[bx], 0d
		inc	bx
		cmp al, 0h
		je endofcoordloop
        cmp al, 13d
        je endofcoordloop
        cmp al, 32d
        je endofcoordloop
		sub	al, '0'
        
        push ax
        mov al, 10d
        mul dl
        
        
        mov dx, ax
        pop ax
        add dl, al
                
		jmp	coordloop
        
    endofcoordloop:
        ret
        
    ;Calculate real colour
    ispropercolor:
        push ax
    
        mov	al, byte ptr ds:[color]
        call tolower

        mov	byte ptr ds:[color], 15d		
        cmp	al, 'b'
        je	propercolor_finish

        mov	byte ptr ds:[color], 40d
        cmp	al, 'c'
        je	propercolor_finish

        mov	byte ptr ds:[color], 47d
        cmp	al, 'z'
        je	propercolor_finish

        mov	byte ptr ds:[color], 33d
        cmp	al, 'n'
        je	propercolor_finish

    propercolor_finish:
        pop	ax
        ret	
    
    ;Read from file
    readfromfile:
        push ax
        mov bx, word ptr ds:[input_file_handle]
        ;CX is set to 200h = 512d
        mov dx, offset buffer
        mov ah, 03fh
        int 021h

        jc	readfromfile_err ;if an error has occurred the CF equals 1, otherwise 0
        
        pop ax
        ret
        
    readfromfile_err:
        mov bx, word ptr ds:[input_file_handle]
        mov dx, offset error_cannot_read_file
        call error_found
        
    
    ;Close file
    closefile:
        ;Assumes the file handle in BX
        push ax
        mov ah, 03eh
        int 021h
        
        jc closefile_err
        
        pop ax
        ret
        
    closefile_err:
        mov dx, offset error_cannot_close_file
        call error_found
        
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
        
    ;Check if AL is white character, returns 1 in DL if yes, 0 if not white (normal char)
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
        
    ;Ignore white characters, address in DS:[SI]
    ;Returns SI pointing to first non-white char.
    ;CL keeps number of remaining chars in the string
    ignorewhitechars:
        push dx
    
        mov al, ds:[si]
        dec cl
        call iswhitechar
        cmp dl, 0h
        je ignorewhitechars_end
        
    ignore_loop:
        cmp cl, 0h
        je ignorewhitechars_end
        inc si
        mov al, byte ptr ds:[si]
        dec cl
        call iswhitechar
        cmp dl, 0h
        je ignorewhitechars_end
        jmp ignore_loop
    ignorewhitechars_end:
        pop dx
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