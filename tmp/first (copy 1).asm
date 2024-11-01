
segment .data
	
segment .bss

segment .text
	global asm_main
	extern puts, dlopen, dlsym

asm_main:
	;enter 12,0
	;pusha
	
	push ebp
	mov ebp, esp
	sub esp,12
	
	pusha
	
	;;"./libmy.so"
	mov dword [ebp-12],1768697646 ;./li
	mov dword [ebp-8],779709794 ;bmy.
	mov dword [ebp-4],28531 ;so\0
	
	lea ebx,[ebp-12]
	
	;;lib=dlopen("./libmy.so",RTLD_LAZY)
	push 1
	push ebx
	call dlopen
	add esp,8
	
	;;"myfunc"
	mov dword [ebp-12],1969650029 ;myfu
	mov dword [ebp-8],25454 ;nc\0
		
	;;dlsym(lib,"myfunc");
	push   ebx
	push   eax
	call   dlsym
	add esp,8
	
	;;myfunc(argc,argv)
	mov edx, [ebp+12]
	push dword edx
	mov edx, [ebp+8]
	push dword edx
	call eax
	add esp,8


	mov	ebx,0
	mov	eax,1
	int	0x80	
	
	;;
	popa
	
	mov esp, ebp
	pop ebp
	
	;popa
	mov eax, 0	
	;leave
	ret
	
	 
	 