
		
code    segment
        assume  cs:code,ds:code
        org     100h
		hex_n	dw	0FAADh
		
start:	mov		dx, code
		mov		ds, dx
		mov		dx, hex_n
		xchg	dl, dh
		call 	print_dl
		mov		dl, dh
		call 	print_dl
		mov		dl, '='
		int		21h
		
		mov 	cx, 10000
		mov		ax, hex_n
		sub		dx, dx
		div		cx
		mov		bx, dx
		mov		dx, ax
		call	print
		
		mov 	cx, 1000
		mov		ax, bx
		sub		dx, dx
		div		cx
		mov		bx, dx
		mov		dx, ax
		call	print
		
		mov 	cx, 100
		mov		ax, bx
		sub		dx, dx
		div		cx
		mov		bx, dx
		mov		dx, ax
		call	print
		
		mov 	cx, 10
		mov		ax, bx
		sub		dx, dx
		div		cx
		mov		bx, dx
		mov		dx, ax
		call	print
		
		mov		dx, bx
		call	print
		
		
		
		mov     ax,4c00h
        int     21h 
		
		
print_dl proc near
	mov bh, dl
	mov cl, 4
	shr dl, cl
	call print
	mov dl, bh
	and dl, 0fh
	call print
	ret
print_dl endp

print proc near
	add dl, 30h
	cmp dl, '9'
	jbe ok
	add dl, 7
ok:	mov ah, 2
	int 21h
	ret
print endp

code ends
end start