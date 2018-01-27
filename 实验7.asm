assume cs:code,ds:data,es:table,ss:stack
data segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995'
	;以上是表示21年的21个字符串
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514,345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	;以上是表示21年公司总收入的21个dword型数据
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226,11542,14430,15257,17800
	;以上是表示21年公司雇员人数的21个word型数据
data ends

table segment
	db 21 dup('year summ ne ?? ')
table ends

stack segment
	db 8 dup(0)
stack ends

code segment

start:	mov ax,data
		mov ds,ax
		mov ax,table
		mov es,ax
		
		mov bx,0h
		mov si,0h
		mov di,0h
		mov bp,0h
		
		mov cx,21
s:		push cx
		mov ax,[bx]
		mov es:[bp],ax
		add bx,2
		add bp,2
		mov ax,[bx]
		mov es:[bp],ax
		add bx,2
		add bp,3
		
		mov ax,[84+si]
		mov es:[bp],ax
		add si,2
		add bp,2
		mov dx,[84+si]
		mov es:[bp],dx
		add bp,3
		add si,2
		
		mov cx,[168+di]
		mov es:[bp],cx
		add di,2
		add bp,3
		
		div cx
		mov es:[bp],ax
		add bp,3
		pop cx
		loop s
		


		mov ax,4c00h
		int 21h
code ends
end start