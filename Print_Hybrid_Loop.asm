.386
.model flat, stdcall 
.stack 4096

ExitProcess proto :dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword
GetStdHandle proto :dword

.data
	message db "Hello World!", 10 ; ASCII 10, or \n.
	; In 10 dar code ASCII new Line ya hamon \n hast

	msgLen = ($ - offset message)

.code
main PROC
	
	invoke GetStdHandle, -11
	; baad az gereftan GetStdHandle
	; eax ro midim be yek Register dige

	mov ebx, eax ; age eax ro mov nakonim be Register dige
	; 1 bar faghat chap mikone chon ma Function
	; GetStdHandle dakhel eax negah midarim 
	mov esi, 10
	Mohammad:
		; parameter avval WriteConsoleA ro dige eax gharar nemidim
		; Chon on ro mov kardim be ebx
		invoke WriteConsoleA, ebx, offset message, msgLen, 0, 0

			dec esi ; dec hamon decrement hast esi-- || --esi
		jnz Mohammad
		; jnz mige age 0 nabod jump kon
		; age esi == 0 bashe halghe false mishe


	;invoke ExitProcess, 0
	ret ; man ba return ziad okeyam :D

main ENDP

END main