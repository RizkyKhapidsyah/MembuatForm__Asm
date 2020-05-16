.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc

.Data?
.Data
.Code

WndProc proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
	.IF uMsg == WM_DESTROY
		invoke PostQuitMessage,NULL
	.ELSEIF uMsg == WM_COMMAND
		mov eax, wParam
		.IF lParam==0
			invoke DestroyWindow,hWnd
		.ELSE
			mov edx, wParam
			shr edx, 16
		.ENDIF
	.ELSE
		invoke DefWindowProc, hWnd, uMsg, wParam, lParam
		ret
	.ENDIF
	xor eax,eax
	ret
WndProc endp

ButtonSimpanClick proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
     xor eax, eax
     ret
ButtonSimpanClick endp

end
