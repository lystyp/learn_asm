;***************************************  ;01
message segment                           ;02
mes     db      'Hi, I learn assemblasdasdsadsad.$'  ;03
message ends                              ;04
;***************************************
stack   segment stack                     ;06
        db      20 dup ('stack123')       ;07
stack   ends                              ;08
;***************************************
pnt_msg segment                           ;10
        assume  cs:pnt_msg,ds:message     ;11
;---------------------------------------
main    proc    near                       ;13
start:  push    ds                        ;14
        sub     ax,ax                     ;15
        push    ax                        ;16
        mov     ax,message                ;17
        mov     ds,ax                     ;18

        mov     dx,offset mes             ;20
        mov     ah,9
        int     21h
        mov     ax,4c00h
        int     21h                       ;24
main    endp
;---------------------------------------
pnt_msg ends                              ;27
;***************************************
        end     start                     ;29