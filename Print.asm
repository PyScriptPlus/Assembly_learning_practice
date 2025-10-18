.386
.model flat, stdcall
.stack 4096

ExitProcess proto :dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword
; console output handle --> GetStdHandle --> Parameter(-11)
; -11 handle chap kardan hast
; -11 for output console OR -10 for input console 
GetStdHandle proto :dword

; address
; length

; count character: baraye inke tamam character ha chap she
; Adad 0 ro midim 
; In ham akharin parameter default male WriteConsoleA hast ke (0) hast

.data
	message db "Hello World!" ; 12 length dare
	; db chiye? mokhafaf Define Byte
	; Miyad baraye message ke 12length hast
	; har 1length --> 1byte chon char --> 8bit OR 1Byte hast
	; In 12 character hast pas in 
	; Define Byte (db) miyad 12 Byte baraye in Hello World! 
	; Dar nazar migire

	msgLen = ($ - offset message) ; baraye be dast ovardan length message hast
	; (offset) kalameye offset baraye be dast ovardan address hast
	; mesal dar C ,C++ ba &Variable be dast miovardim 
	; ($) akharin khone address kam mikonim az 
	; Akharin khone address (offset message)

.code
main PROC
	;mov eax, 5 ; In testi bod

	;push 0
	;call ExitProcess

	invoke GetStdHandle, -11

	; Method 1:
	;push 0
	;push 0
	;push msgLen
	;push offset message
	;push eax
	;call WriteConsoleA

	; Method 2: in ravesh awlie
	invoke WriteConsoleA, eax, offset message, msgLen, 0, 0



	invoke ExitProcess, 0
main ENDP

END main