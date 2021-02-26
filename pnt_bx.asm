code    segment byte    public  'code'
        assume  cs:code,ds:code
        public  print_bx_hex
		
print_bx_hex proc near
	mov		cl, 4
	rol 	bx, cl
	call 	print_bl_4bits
	rol 	bx, cl
	call 	print_bl_4bits
	rol 	bx, cl
	call 	print_bl_4bits
	rol 	bl, cl
print_bl_4bits:
	mov		dx, bx
	and		dl, 0fh
	add		dl, 30h
	cmp		dl, 3ah
	jb		print
	add		dl, 7
print:
	mov		ah, 2
	int 	21h
	ret
print_bx_hex	endp

code    ends	
	end     print_bx_hex