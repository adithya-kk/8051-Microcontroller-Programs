.model small                                 ;size of program

.data                                        ;indicates data segment
msg1 db 10,13,"Enter a number:$"             ;data declaration
msg2 db 10,13,"Enter a number:$"
msg3 db 10,13,"Multiplication is:$"
a dw 0                                       ;set a=0
b dw 0                                       ;set b=0
c dw 0                                       ;set c=0

.code                                        ;code segment
mov ax,@data                                 ;load data
mov ds,ax
mov ah,09h                                   ;to print message
lea dx,msg1                                  ;load effective address
int 21h
call accept                                  ;call the accept function
mov a,bx                                     ;move value bx to a
mov ah,09h                                   ;prints the string
lea dx,msg2                                  ;load effective address
int 21h
call accept                                  ;call the accept function 
mov ax,a                                     ;mov value a to ax
mul bx                                       ;multiplty the comtents of ax to bx
mov b,dx                                     ;move value dx to b
mov c,ax                                     ;move value ax to c
mov ah,09h                                   ;print the string
lea dx,msg3                                  ;load effective address
int 21h
mov ax,b                                     ;move value b to ax
call display1                                ;call display function
mov ax,c                                     ;move value c to ax
call display1                                ;call display function  
jmp exit                                     ;jump to exit

proc accept                                  ;accept procedure begins
mov bx,0                                     ;set value bx to 0
mov ch,04                                    ;set value ch to 4
a4:mov ah,01                                 ;set value of ah to 1
int 21h
mov dl,al                                    ;set value of al to dl
cmp dl,39h                                   ;compare dl to 39h
jbe a3                                       ;if dl is less than jump to a3
cmp dl,39h                                   ;compare dl to 39h
jg a6                                        ;jump to a6 if dl is greater
a3:sub dl,30h                                ;subtract 30 from dl
jmp a5                                       ;jump to a5
a6:sub dl,37h                                ;subtract 37 from dl
jmp a5                                       ;jump to a5
a5:rol bx,04                                 ;rotate bl by 4 bits
add bx,dx                                    ;add bx and dx
dec ch                                       ; decrement ch
jnz a4                                       ;jump to a4 if ch!=0
ret                                          ;return
accept endp                                  ;accept the end process

proc display1                                ;call display function 
mov ch,04                                    ;set ch to 04
mov bx,ax                                    ;set value of ax to bx
a2:rol bx,04                                 ;rotate bx by 4 bits
mov dl,bl                                    ;move value of bl to dl
and dl,0fh                                   ;compare dl and 09h
cmp dl,09h                                   ;compare dl to 9
jbe a1                                       ;jump to a1 if dl is less than 9
add dl,07h                                   ;add 7 to dl
a1:add dl,30h                                ;add 30 to dl
mov ah,02                                    ;set value of ah to 2
int 21h   
dec ch											;dec ch                                          ;decrement ch by 1
jnz a2                                       ;jump to a2 if ch!=0
ret                                          ;return
display1 endp                                ;end display1
exit:                                        ;exit
mov ah,4ch                                   ;end function
int 21h
end                                          ;end















