.386
.model flat, stdcall
.stack 4096

.code 

main PROC
	
	; create label
	Mohammad:
		mov eax, 10
		jmp Mohammad ; Jump to Label


	ret ; hamon return khodemune :D
main ENDP

END main