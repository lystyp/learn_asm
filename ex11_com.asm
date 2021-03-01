;***************************************
code    SEGMENT                         ;.code 段開始位址
        ASSUME  cs:code,ds:code         ;.假設程式段及資料段
;---------------------------------------
start:  jmp     begin                   ;程式進入點
mes     DB      'Hi, I learn assembly.$';要印出的訊息
begin:  mov     dx,OFFSET mes           ;指向 mes 的位址
		ORG     100h 
        mov     ah,9                    ;呼叫DOS服務程式，AH=9/INT 21H 表示印出字串
        int     21h                     ;呼叫 DOS 服務程式
        mov     ax,4c00h                ;指定要呼叫的服務號碼
        int     21h                     ;呼叫 DOS 服務程式
;---------------------------------------
code    ENDS                            ;code 段結束
;***************************************
        END     start                   ;使組譯器知道程式進入點