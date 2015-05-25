;; Author: Bartlomiej Szalach
;; Program 2 - Printing ASCII chars in graphical mode

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

Sign_procent:
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

Sign_plus   
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
    
    ;Clean up yet to here

Sign_wieksze    db  00000000b
db  11000000b
db  00110000b
db  00001100b
db  00110000b
db  11000000b
db  00000000b
db  00000000b

Sign_?      db  00111000b
db  01000100b
db  00000100b
db  00011000b
db  00000000b
db  00010000b
db  00000000b
db  00000000b

Sign_@      db  00000000b
db  00011110b
db  00100010b
db  01001110b
db  01001010b
db  00101110b
db  00010000b
db  00001110b

Sign_A      db  00011000b
db  00011000b
db  00100100b
db  00111100b
db  01000010b
db  01000010b
db  00000000b
db  00000000b

Sign_B      db  01111100b
db  01000010b
db  01111100b
db  01000010b
db  01000010b
db  01111100b
db  00000000b
db  00000000b

Sign_C      db  00111100b
db  01000010b
db  10000000b
db  10000000b
db  01000010b
db  00111100b
db  00000000b
db  00000000b

Sign_D      db  01111000b
db  01000100b
db  01000010b
db  01000010b
db  01000100b
db  01111000b
db  00000000b
db  00000000b

Sign_E      db  01111110b
db  01000000b
db  01111100b
db  01000000b
db  01000000b
db  01111110b
db  00000000b
db  00000000b

Sign_F      db  01111110b
db  01000000b
db  01111100b
db  01000000b
db  01000000b
db  01000000b
db  00000000b
db  00000000b

Sign_G      db  00111100b
db  01000010b
db  10000000b
db  10011100b
db  01000010b
db  00111100b
db  00000000b
db  00000000b

Sign_H      db  01000010b
db  01000010b
db  01111110b
db  01000010b
db  01000010b
db  01000010b
db  00000000b
db  00000000b

Sign_I      db  00111110b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00111110b
db  00000000b
db  00000000b

Sign_J      db  00111100b
db  00000100b
db  00000100b
db  00000100b
db  01000100b
db  00111000b
db  00000000b
db  00000000b

Sign_K      db  01000100b
db  01001000b
db  01010000b
db  01110000b
db  01001000b
db  01000100b
db  00000000b
db  00000000b

Sign_L      db  01000000b
db  01000000b
db  01000000b
db  01000000b
db  01000000b
db  01111110b
db  00000000b
db  00000000b

Sign_M      db  01000001b
db  01100011b
db  01010101b
db  01001001b
db  01000001b
db  01000001b
db  00000000b
db  00000000b

Sign_N      db  01000010b
db  01100010b
db  01010010b
db  01001010b
db  01000110b
db  01000010b
db  00000000b
db  00000000b

Sign_O      db  00011100b
db  00100010b
db  00100010b
db  00100010b
db  00100010b
db  00011100b
db  00000000b
db  00000000b

Sign_P      db  01111000b
db  01000100b
db  01111000b
db  01000000b
db  01000000b
db  01000000b
db  00000000b
db  00000000b

Sign_Q      db  00011100b
db  00100010b
db  00100010b
db  00100010b
db  00100010b
db  00011100b
db  00000010b
db  00000000b

Sign_R      db  01111000b
db  01000100b
db  01111000b
db  01010000b
db  01001000b
db  01000100b
db  00000000b
db  00000000b

Sign_S      db  00011100b
db  00100010b
db  00010000b
db  00001100b
db  00100010b
db  00011100b
db  00000000b
db  00000000b

Sign_T      db  01111111b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00000000b
db  00000000b

Sign_U      db  01000010b
db  01000010b
db  01000010b
db  01000010b
db  01000010b
db  00111100b
db  00000000b
db  00000000b

Sign_V      db  10000001b
db  01000010b
db  01000010b
db  00100100b
db  00100100b
db  00011000b
db  00000000b
db  00000000b

Sign_W      db  01000001b
db  01000001b
db  01001001b
db  01010101b
db  01100011b
db  01000001b
db  00000000b
db  00000000b

Sign_X      db  01000010b
db  00100100b
db  00011000b
db  00011000b
db  00100100b
db  01000010b
db  00000000b
db  00000000b

Sign_Y      db  01000001b
db  00100010b
db  00010100b
db  00001000b
db  00001000b
db  00001000b
db  00000000b
db  00000000b

Sign_Z      db  01111110b
db  00000100b
db  00001000b
db  00010000b
db  00100000b
db  01111110b
db  00000000b
db  00000000b

Sign_lkwparen   db  00111000b
db  00100000b
db  00100000b
db  00100000b
db  00100000b
db  00111000b
db  00000000b
db  00000000b

Sign_backslash  db  01000000b
db  00100000b
db  00010000b
db  00001000b
db  00000100b
db  00000010b
db  00000000b
db  00000000b

Sign_rkwparen   db  00111000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00111000b
db  00000000b
db  00000000b

Sign_daszek db  00010000b
db  00101000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b

Sign__      db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  01111110b
db  00000000b
db  00000000b

Sign_odapost    db  00010000b
db  00001000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b
db  00000000b

Sign_am     db  00000000b
db  00111100b
db  00000010b
db  00111110b
db  01000110b
db  00111010b
db  00000000b
db  00000000b

Sign_bm     db  01000000b
db  01000000b
db  01111100b
db  01000010b
db  01100010b
db  01011100b
db  00000000b
db  00000000b

Sign_cm     db  00000000b
db  00000000b
db  00011100b
db  00100000b
db  00100000b
db  00011100b
db  00000000b
db  00000000b

Sign_dm     db  00000010b
db  00000010b
db  00111110b
db  01000010b
db  01000110b
db  00111010b
db  00000000b
db  00000000b

Sign_em     db  00000000b
db  00111100b
db  01000010b
db  01111110b
db  01000000b
db  00111100b
db  00000000b
db  00000000b

Sign_fm     db  00000000b
db  00011000b
db  00010000b
db  00111000b
db  00010000b
db  00010000b
db  00000000b
db  00000000b

Sign_gm     db  00000000b
db  00000000b
db  00110100b
db  01001100b
db  01000100b
db  00110100b
db  00000100b
db  00111000b

Sign_hm     db  00100000b
db  00100000b
db  00111000b
db  00100100b
db  00100100b
db  00100100b
db  00000000b
db  00000000b

Sign_im     db  00001000b
db  00000000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00000000b
db  00000000b

Sign_jm     db  00001000b
db  00000000b
db  00011000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  01110000b

Sign_km     db  00100000b
db  00100000b
db  00100100b
db  00101000b
db  00110000b
db  00101100b
db  00000000b
db  00000000b

Sign_lm     db  00010000b
db  00010000b
db  00010000b
db  00010000b
db  00010000b
db  00011000b
db  00000000b
db  00000000b

Sign_mm     db  00000000b
db  00000000b
db  01100110b
db  01011010b
db  01000010b
db  01000010b
db  00000000b
db  00000000b

Sign_nm     db  00000000b
db  00000000b
db  00101110b
db  00110010b
db  00100010b
db  00100010b
db  00000000b
db  00000000b

Sign_om     db  00000000b
db  00000000b
db  00111100b
db  01000010b
db  01000010b
db  00111100b
db  00000000b
db  00000000b

Sign_pm     db  00000000b
db  00000000b
db  01011100b
db  01100010b
db  01000010b
db  01111100b
db  01000000b
db  01000000b

Sign_qm     db  00000000b
db  00000000b
db  00111010b
db  01000110b
db  01000010b
db  00111110b
db  00000010b
db  00000010b

Sign_rm     db  00000000b
db  00000000b
db  00101100b
db  00110010b
db  00100000b
db  00100000b
db  00000000b
db  00000000b

Sign_sm     db  00000000b
db  00011100b
db  00100000b
db  00011000b
db  00000100b
db  00111000b
db  00000000b
db  00000000b

Sign_tm     db  00000000b
db  00010000b
db  00111100b
db  00010000b
db  00010000b
db  00011000b
db  00000000b
db  00000000b

Sign_um     db  00000000b
db  00000000b
db  00100010b
db  00100010b
db  00100110b
db  00011010b
db  00000000b
db  00000000b

Sign_vm     db  00000000b
db  00000000b
db  01000010b
db  01000010b
db  00100100b
db  00011000b
db  00000000b
db  00000000b

Sign_wm     db  00000000b
db  00000000b
db  10000001b
db  10000001b
db  01011010b
db  01100110b
db  00000000b
db  00000000b

Sign_xm     db  00000000b
db  00000000b
db  01000010b
db  00100100b
db  00011000b
db  01100110b
db  00000000b
db  00000000b

Sign_ym     db  00000000b
db  00000000b
db  01000010b
db  00100010b
db  00010100b
db  00001000b
db  00010000b
db  01100000b

Sign_zm     db  00000000b
db  00000000b
db  00111100b
db  00001000b
db  00010000b
db  00111100b
db  00000000b
db  00000000b

Sign_lwas   db  00011100b
db  00010000b
db  00110000b
db  00110000b
db  00010000b
db  00011100b
db  00000000b
db  00000000b

Sign_pipe   db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00001000b
db  00000000b

Sign_rwas   db  00111000b
db  00001000b
db  00001100b
db  00001100b
db  00001000b
db  00111000b
db  00000000b
db  00000000b

Sign_tylda  db  00000000b
db  00000000b
db  00000000b
db  00110010b
db  01001100b
db  00000000b
db  00000000b
db  00000000b

    ASCIItab    dw  offset Sign_exclamation, offset Sign_quotation, offset Sign_hash, offset Sign_dollar, offset Sign_procent, offset Sign_persant, offset Sign_apostrof
            dw  offset Sign_lparen, offset Sign_rparen, offset Sign_gwiazdka, offset Sign_plus, offset Sign_przecinek, offset Sign_minus, offset Sign_dot, offset Sign_slash
            dw  offset Sign_0, offset Sign_1, offset Sign_2, offset Sign_3, offset Sign_4, offset Sign_5, offset Sign_6, offset Sign_7, offset Sign_8, offset Sign_9
            dw  offset Sign_dwukropek, offset Sign_srednik, offset Sign_mniejsze, offset Sign_rownasie, offset Sign_wieksze, offset Sign_?, offset Sign_@, offset Sign_A, offset Sign_B
            dw  offset Sign_C, offset Sign_D, offset Sign_E, offset Sign_F, offset Sign_G, offset Sign_H, offset Sign_I, offset Sign_J, offset Sign_K, offset Sign_L
            dw  offset Sign_M, offset Sign_N, offset Sign_O, offset Sign_P, offset Sign_Q, offset Sign_R, offset Sign_S, offset Sign_T, offset Sign_U, offset Sign_V
            dw  offset Sign_W, offset Sign_X, offset Sign_Y, offset Sign_Z, offset Sign_lkwparen, offset Sign_backslash, offset Sign_rkwparen, offset Sign_daszek, offset Sign__, offset Sign_odapost
            dw  offset Sign_am, offset Sign_bm, offset Sign_cm, offset Sign_dm, offset Sign_em, offset Sign_fm, offset Sign_gm, offset Sign_hm, offset Sign_im, offset Sign_jm
            dw  offset Sign_km, offset Sign_lm, offset Sign_mm, offset Sign_nm, offset Sign_om, offset Sign_pm, offset Sign_qm, offset Sign_rm, offset Sign_sm, offset Sign_tm
            dw  offset Sign_um, offset Sign_vm, offset Sign_wm, offset Sign_xm, offset Sign_ym, offset Sign_zm, offset Sign_lwas, offset Sign_pipe, offset Sign_rwas, offset Sign_tylda


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