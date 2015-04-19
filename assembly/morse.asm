;; Bartlomiej Szalach
;; Task 1 - ASCII to Morse Code converter
CR equ 13d
LF equ 10d
data1 segment
    text1 db "Hello $"
	newline db CR, LF, '$' 
	prompt db CR,LF,">> ",'$'
data1 ends


code1 segment
    start1:
	
		mov	ax, seg p_stack	
		mov	ss, ax
		mov	sp, offset p_stack	

		mov	ax, seg text1
		mov	ds, ax
		mov	dx, offset text1
		mov	ah, 9
		int	21h	

		mov ax, 4c00h
		int	021h
		
code1 ends

stack1 segment stack
    dw 250 dup(?)
	p_stack dw ?
stack1 ends

end start1
