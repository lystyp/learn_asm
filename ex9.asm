code    segment
        assume  cs:code,ds:code
        org     100h
		hex_n	dw	?
		
start:	mov		ax, code
		mov		ds, ax
		sub		bx, bx
next:	mov		ah, 0
		int		16h
		mov		dl, al
		cmp		al, '='
		je		show
		cmp		al, '0'
		jb		next
		cmp		al, '9'
		ja		alpha
		sub 	al, 30h
		jmp		short number
alpha:  and     al,0dfh ;強迫變大寫!!!
        mov     dl,al
        sub     al,37h  
        cmp     al,0ah
        jb      next
        cmp     al,0fh
        ja      next    

number:	push	ax
		mov		ah, 02h
		int 	21h
		pop		ax
		mov		cl, 4
		shl		bx, cl
		and 	ax, 00ffh
		add		bx, ax
		mov 	dh, bh
		and		dx, 0f000h
		jnz		show
		jmp		next
		
show:	mov		dl, '='
		mov		ah, 2
		int		21h
		
		mov 	cx, 10000
		mov		ax, bx
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