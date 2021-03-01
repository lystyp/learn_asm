;***************************************
code    segment
        assume  cs:code,ds:code
		org     100h

start: 		jmp 	begin
file_name 	db	'C:\test.txt', 0
file_handle	dw	?
message_1	db	'Create t1.TXT fail$'
message_2	db	'Can not write to TEXT.TXT$'
message_3	db	0dh, 0ah, 'Write success.$'
buffer		db	200	dup	(?)

begin:		mov		ah, 3ch
			mov		dx, offset file_name
			sub 	cx, cx
			int		21h
			mov		dx, offset message_1
			jc		error
			mov		[file_handle], ax
			mov		si, offset buffer

next:		mov		ah, 0
			int		16h
			cmp		al, 1bh ;Cmp with ESC
			je		save
			mov		[si], al
			mov		dl, al
			mov		ah, 02h
			int 	21h
			cmp     al,0dh	;Cmp with Enter
			jne		isfull
			inc		si
			mov		[si], al
			mov		dl, 0ah
			mov		ah, 02h
			int 	21h
			
isfull:		inc		si
			cmp		si, offset begin ; the end of data segment next to begin of code segment
			jne		next
			
save:		mov		dx, offset buffer
			mov		cx, si
			sub		cx, dx
			jz      close
			mov		ah, 40h
			mov		bx, file_handle
			int		21h
			mov		dx, offset message_2
			jc		error

close:		mov		ah, 3eh
			mov		bx, file_handle
			int		21h
			mov     dx,offset message_3
			
error:		mov		ah, 09h
			int 	21h
			mov     ax,4c00h
			int     21h

code    ends
;***************************************
        end     start