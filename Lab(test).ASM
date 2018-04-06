        org 100h

Start:
        mov ah, $09              ;Вывод enter your string
        mov dx, stroka
        int 21h

        mov ah, $0a ;
        mov dx, strInput         ;Ввод строки
        int 21h

        mov ah, $09
        mov dx, strNext
        int 21h

        mov bl, [strInput+1]     ;Проверка на длину
        cmp bl, 5
        js WriteNo

        mov cl, [strInput+3]     ;Проверка на равные символы
        cmp cl, [strInput+7]
        jnz WriteNo
 
        mov bx, strInput+1;
        add bl, byte[strInput+1] ;Проверка на букву предпоследного символа
        mov al, byte[bx]
        cmp al, 48 ;
        js WriteNo
 
        cmp al, 58
        jns WriteNo
 
        mov bx, strInput+2
        add bx, 2                ;Проверка на букву третьего символа
        mov al, byte[bx]
        cmp al, 64
        js WriteNo

        cmp al, 91
        jns WriteNo
 
WriteYes: 
        mov ah, $09;
        mov dx, Yes
        int 21h
        jmp exit

WriteNo: 
        mov ah, $09
        mov dx, No
        int 21h
        jmp exit
 
exit: 
        mov ah, $08
        int 21h
        ret


strNext db 10,13,'$'
stroka db "Enter your string: $" 
strInput db 10,12 dup ('$')
Yes db 10,13,'Yes$'
No db 10,13,'No$'