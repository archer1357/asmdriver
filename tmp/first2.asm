
segment .data
	prompt db "abc.so", 0
	errmsg1 db "err1",0
	errmsg2 db "err2",0
	
segment .bss

segment .text
	global asm_main
	extern puts, dlopen, dlsym,dlerror

asm_main:
	enter 0,0
	pusha
	
	push ebp
	mov ebp, esp
	;sub esp, 8
	
	sub esp,12
	
	mov dword [ebp-12],1768697646 ;./li
	mov dword [ebp-8],779709794 ;bmy.
	mov dword [ebp-4],28531 ;so\0
	
	lea    ebx,[ebp-12]
	push   ebx ;libmy,so
	call   puts
	
	mov eax,1
	push   1 ;RTLD_LAZY
	push ebx ;libmy,so
	call dlopen
	
	cmp  eax,0
	
	jne ok1
	push errmsg1
	call puts
	
	call dlerror
	push eax
	call puts
	
ok1:
	
	mov dword [ebp-12],1969650029 ;myfu
	mov dword [ebp-8],25454 ;nc\0
	;mov dword [ebp-4], eax ;lib
	
	lea    ebx,[ebp-12]
	
	push   ebx ;myfunc
	push   eax ;lib
	call   dlsym

	cmp  eax,0
	jne ok2
	
	push errmsg2
	call puts
	
	call dlerror
	push eax
	call puts

ok2:
	
	call eax
	
	;mov dword [ebp-4], eax
	
	
	
;add    esp,4
	
	;;;mov esp, 111
	;mov [esp+4],DWORD  1932425581
	
	;push prompt
	;;push esp
	;;call puts
	
	mov esp, ebp
	pop ebp
	
	popa
	mov eax, 3
	leave
	ret
	
	 
	 