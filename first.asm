
segment .data
	mydata db "yesme",0
	
segment .bss

segment .text
	global asm_main,mything
	extern puts, dlopen, dlsym,

mything:

	push ebp
	mov ebp, esp
	
	push mydata
	call puts
	

	mov esp, ebp
	pop ebp
		
	ret
	
asm_main:
	;enter 12,0
	;pusha
	
	push ebp
	mov ebp, esp
	
	pusha
	

	;lib=dlopen("./libmy.so",RTLD_LAZY)
	sub esp,12
	mov dword [ebp-12],1768697646 ;./li
	mov dword [ebp-8],779709794 ;bmy.
	mov dword [ebp-4],28531 ;so\0
	push 1 ;RTLD_LAZY
	lea eax,[ebp-12]
	push eax ;"./libmy.so"
	call dlopen
	add esp,12+8
	
	;;;;dlsym(lib,"myfunc")
	sub esp,12
	mov dword [ebp-12],eax
	mov dword [ebp-8],1969650029 ;myfu
	mov dword [ebp-4],25454 ;nc\0
	lea eax,[ebp-8]
	push eax ;"myfunc")
	push dword [ebp-12]	 ;lib
	call   dlsym
	add esp,12+8
	
	;;;;myfunc(argc,argv)
	sub esp,4
	mov dword [ebp-4],eax ;myfunc
	push mything
	mov eax, [ebp+12]
	push eax ;argv
	mov eax, [ebp+8]
	push eax ;argc
	mov eax, dword [ebp-4]
	call eax
	add esp,4+12
	
	;;

	; sub esp,24
	; mov dword [ebp-24],1819047270
	; mov dword [ebp-20],1701995379
	; mov dword [ebp-16],805334629	
	; mov dword [ebp-12],1852405504
	; mov dword [ebp-8],1702326116
	; mov dword [ebp-4],3211364
	
	; lea eax,[ebp-24]
	; push eax

	; lea eax,[ebp-24]
	; push eax
	
	
	
	; add esp,24


	; mov	ebx,0
	; mov	eax,1
	; int	0x80	
	
	;;
	popa
	
	mov esp, ebp
	pop ebp
	
	;popa
	mov eax, 0	
	;leave
	ret
	
	 
	 