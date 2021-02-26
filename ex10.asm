code    segment public  'code'
        assume  cs:code,ds:code
		extrn   print_bl_hex:near   ;06 宣告外部副程式
        org     100h
start:  jmp     short begin
msg1    db      'ASCII character:$'
msg2    db      '  ,Scan code:$'
begin:	mov		ax, code
		mov		ds, ax
		mov		ah, 0h
		int		16h
		mov		bx, ax
		mov		dx, offset msg1
		mov		ah, 9
		int		21h	
		mov		dl, bl
		mov		ah, 2
		int 	21h
		mov		dx, offset msg2
		mov		ah, 9
		int		21h
		xchg	bh, bl
		call 	print_bl_hex

		mov		ax, 4c00h
		int		21h
code 	ends
		end 	start