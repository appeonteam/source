$PBExportHeader$u_canvas.sru
forward
global type u_canvas from userobject
end type
type p_canvas from picture within u_canvas
end type
type bitmapfileheader from structure within u_canvas
end type
type bitmapinfoheader from structure within u_canvas
end type
type bitmapinfo from structure within u_canvas
end type
end forward

type bitmapfileheader from structure
	integer		bftype
	long		bfsize
	integer		bfreserved1
	integer		bfreserved2
	long		bfoffbits
end type

type bitmapinfoheader from structure
	long		bisize
	long		biwidth
	long		biheight
	integer		biplanes
	integer		bibitcount
	long		bicompression
	long		bisizeimage
	long		bixpelspermeter
	long		biypelspermeter
	long		biclrused
	long		biclrimportant
end type

type bitmapinfo from structure
	bitmapinfoheader		bmiheader
	unsignedlong		bmicolors[]
end type

global type u_canvas from userobject
integer width = 402
integer height = 200
event type integer onpaint ( unsignedlong hdc )
event resize pbm_size
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event paint pbm_paint
event doubleclicked pbm_lbuttondblclk
event clicked pbm_lbuttonup
event mousewithin pbm_mousemove
p_canvas p_canvas
end type
global u_canvas u_canvas

type prototypes
FUNCTION long GetDC (ulong hWnd) Library "USER32.DLL"
FUNCTION ULong GetParent (Long lChild) LIBRARY "user32.dll"
FUNCTION BOOLEAN GetWindowRect (ulong hWnd,  REF Rect rect) library "user32.dll" alias for "GetWindowRect;Ansi"
FUNCTION Long GetClientRect (Long hwnd, REF RECT lpRect) Library 'user32' alias for "GetClientRect"

function boolean DeleteObject(ulong hgdiobject) library "gdi32.dll"

Function ulong GetLastError( ) Library "kernel32.dll"

Function ulong FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageW"

Function long GetTempPath ( &
	long nBufferLength, &
	Ref string lpBuffer &
	) Library "kernel32.dll" Alias For "GetTempPathW"

Function long GetDesktopWindow ( &
	) Library "user32.dll"

Function ulong GetDC ( &
	long hWnd &
	) Library "user32.dll"

Function ulong CreateCompatibleDC ( &
	ulong hdc &
	) Library "gdi32.dll"

Function ulong CreateCompatibleBitmap ( &
	ulong hdc, &
	long nWidth, &
	long nHeight &
	) Library "gdi32.dll"

Function ulong SelectObject ( &
	ulong hdc, &
	ulong hgdiobj &
	) Library "gdi32.dll"

Function boolean BitBlt ( &
	ulong hdcDest, &
	long nXDest, &
	long nYDest, &
	long nWidth, &
	long nHeight, &
	ulong hdcSrc, &
	long nXSrc, &
	long nYSrc, &
	long dwRop &
	) Library "gdi32.dll"

Function boolean StretchBlt ( &
	ulong hdcDest, &
	long nXOriginDest, &
	long nYOriginDest, &
	long nWidthDest, &
	long nHeightDest, &
	ulong hdcSrc, &
	long nXOriginSrc, &
	long nYOriginSrc, &
	long nWidthSrc, &
	long nHeightSrc, &
	long dwRop &
	) Library "gdi32.dll"

Function long GetDIBits ( &
	ulong hdc, &
	ulong hbmp, &
	uint uStartScan, &
	uint cScanLines, &
	Ref blob lpvBits, &
	Ref bitmapinfo lpbi, &
	uint uUsage &
	) Library "gdi32.dll"

Function long GetDIBits ( &
	ulong hdc, &
	ulong hbmp, &
	uint uStartScan, &
	uint cScanLines, &
	ulong lpvBits, &
	ref bitmapinfo lpbi, &
	uint uUsage &
	) Library "gdi32.dll"

Subroutine CopyBitmapFileHeader ( &
	Ref blob Destination, &
	bitmapfileheader Source, &
	long Length &
	) Library "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyBitmapInfo ( &
	Ref blob Destination, &
	bitmapinfo Source, &
	long Length &
	) Library "kernel32.dll" Alias For "RtlMoveMemory"

Function boolean DeleteDC ( &
	ulong hdc &
	) Library "gdi32.dll"

Function long ReleaseDC ( &
	long hWnd, &
	ulong hDC &
	) Library "user32.dll"

Function boolean OpenClipboard ( &
	long hWndNewOwner &
	) Library "user32.dll"

Function boolean EmptyClipboard ( &
	) Library "user32.dll"

Function boolean CloseClipboard ( &
	) Library "user32.dll"

Function ulong SetClipboardData ( &
	uint uFormat, &
	ulong hMem &
	) Library "user32.dll"

Function long CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	ulong lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	ulong hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileW"

Function boolean WriteFile ( &
	long hFile, &
	blob lpBuffer, &
	ulong nNumberOfBytesToWrite, &
	Ref ulong lpNumberOfBytesWritten, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean CloseHandle ( &
	long hObject &
	) Library "kernel32.dll"

end prototypes

type variables
Constant uint CF_BITMAP = 2
Constant uint DIB_PAL_COLORS = 1
Constant uint DIB_RGB_COLORS = 0
Constant integer BITMAPTYPE = 19778
CONSTANT integer WM_PRINT = 15
CONSTANT ULong SRCCOPY = 13369376

CONSTANT Long PRF_CHILDREN = 16
CONSTANT Long PRF_NONCLIENT = 2
CONSTANT Long PRF_CLIENT = 4
CONSTANT Long PRF_ERASEBKGND = 8

Boolean ib_freeze = FALSE
Boolean ib_transparent = FALSE
end variables

forward prototypes
public function integer of_settransparent (boolean ab_set)
public function integer setredraw (boolean f)
public function integer resize (integer w, integer h)
public function integer stopdrawing ()
public function integer startdrawing ()
public function integer show ()
end prototypes

event resize;IF IsNull(NewWidth) OR IsNull(NewHeight) THEN RETURN

p_canvas.Width = NewWidth
p_canvas.Height = NewHeight

SetRedraw(TRUE)
end event

public function integer of_settransparent (boolean ab_set);ib_transparent = ab_set

RETURN 1
end function

public function integer setredraw (boolean f);IF ib_freeze THEN RETURN SUPER::SetRedraw(f)

IF f THEN
	
	// capture bitmap and return as blob
	
	BitmapInfo lstr_Info
	BitmapFileHeader lstr_Header
	Blob lblb_header, lblb_info, lblb_bitmap
	ULong lul_hdc, lul_hdcMem, lul_hBitmap
	Integer li_pixels
	Boolean lb_result
	Long ll_width, ll_height
	RECT rc
	
	p_canvas.Resize(Width, Height)
	
	GetClientRect(Handle(THIS), rc);
	
	ll_width = UnitsToPixels(Width, XUnitsToPixels!)
	ll_height = UnitsToPixels(Height, YUnitsToPixels!)
	
	// Get the device context of window and allocate memory
	lul_hdc = GetDC(Handle(THIS))
	lul_hdcMem = CreateCompatibleDC(lul_hdc)
	lul_hBitmap = CreateCompatibleBitmap(lul_hdc, ll_width, ll_height)
	
	If lul_hBitmap <> 0 Then
		// Select an object into the specified device context
		SelectObject(lul_hdcMem, lul_hBitmap)
		// Copy the bitmap from the source to the destination
		
		IF ib_transparent THEN
					RECT rcw, rcw2;	
					ULong lpmemdc, pHwnd, pDC, hpmembmp, poldbmp, LRESULT, lr
					Long ll_null
					SetNull(ll_null)
					
					pHwnd = GetParent(Handle(THIS))
					GetWindowRect(pHwnd, rcw)
					lpmemdc =  CreateCompatibleDC(ll_null)
					pDC = GetDC(pHwnd)
					hpmembmp = CreateCompatibleBitmap(pDC, rcw.right - rcw.left, rcw.bottom - rcw.top)
					ReleaseDC(pHwnd, pDC)
					poldbmp = SelectObject(lpmemdc, hpmembmp)

					//lr = Send(pHwnd, WM_PRINT, lpmemdc, PRF_CHILDREN | PRF_NONCLIENT | PRF_CLIENT | PRF_ERASEBKGND);
					lr = Send(pHwnd, WM_PRINT, lpmemdc, 30)
					
					GetWindowRect(Handle(THIS), rcw2)
					POINT lp

					lp.px = rcw2.left - rcw.left
					lp.py = rcw2.top - rcw.top
					
					BitBlt(lul_hdcMem, 0, 0, rc.right - rc.left, rc.bottom - rc.top, lpmemdc, lp.px, lp.py, SRCCOPY)
					SelectObject(lpmemdc, poldbmp)
					DeleteObject(hpmembmp)
					DeleteDC(lpmemdc)
		END IF
	
		Event OnPaint(lul_hdcMem)
	
		// try to store the bitmap into a blob so we can save it
		lstr_Info.bmiHeader.biSize = 40
				
		// Get the bitmapinfo
		If GetDIBits(lul_hdcMem, lul_hBitmap, 0, ll_height, &
								0, lstr_Info, DIB_RGB_COLORS) > 0 Then
			
			li_pixels = lstr_Info.bmiHeader.biBitCount
			lstr_Info.bmiColors[li_pixels] = 0
			lblb_bitmap = Blob(Space(lstr_Info.bmiHeader.biSizeImage/2))
			
			// get the actual bits
			GetDIBits(lul_hdcMem, lul_hBitmap, 0, ll_height, &
								lblb_bitmap, lstr_Info, DIB_RGB_COLORS) 
								
			// create a bitmap header
			lstr_Header.bfType = BITMAPTYPE
			lstr_Header.bfSize = lstr_Info.bmiHeader.biSizeImage
			lstr_Header.bfOffBits = 54 + (li_pixels * 4)
			
			// copy the header structure to a blob
			lblb_header = Blob(Space(14/2))
			CopyBitmapFileHeader(lblb_header, lstr_Header, 14)
			
			// copy the info structure to a blob
			lblb_Info = Blob(Space((40  + li_pixels * 4)/2))
			CopyBitmapInfo(lblb_Info, lstr_Info, 40 + li_pixels * 4)
			
			// add all together and we have a window bitmap in a blob
			lblb_bitmap = lblb_header + lblb_info + lblb_bitmap
		End If
	
	End If
	
	// Clean up handles
	DeleteObject(lul_hBitmap)
	DeleteDC(lul_hdcMem)
	ReleaseDC(Handle(THIS), lul_hdc)
	
	p_canvas.SetPicture(lblb_bitmap)

END IF

RETURN 1
end function

public function integer resize (integer w, integer h);Long ll_return
ll_return = SUPER::Resize(w,h)
SetRedraw(TRUE)
RETURN ll_return
end function

public function integer stopdrawing ();ib_freeze = TRUE


RETURN 1
end function

public function integer startdrawing ();ib_freeze = FALSE

SetRedraw(TRUE)

RETURN 1
end function

public function integer show ();SetRedraw(TRUE)
RETURN SUPER::Show()
end function

on u_canvas.create
this.p_canvas=create p_canvas
this.Control[]={this.p_canvas}
end on

on u_canvas.destroy
destroy(this.p_canvas)
end on

event constructor;p_canvas.BringToTop = FALSE
POST SetRedraw(TRUE)
end event

type p_canvas from picture within u_canvas
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event doubleclick pbm_lbuttondblclk
integer width = 293
integer height = 152
boolean originalsize = true
boolean focusrectangle = false
end type

event mousemove;PARENT.Event MouseMove(flags, xpos, ypos)
PARENT.Event MouseWithin(flags, xpos, ypos)
end event

event lbuttonup;PARENT.Event LButtonUp(flags, xpos, ypos)
end event

event lbuttondown;PARENT.Event LButtonDown(flags, xpos, ypos)
end event

event doubleclick;PARENT.Event DoubleClicked(flags, xpos, ypos)
end event

event doubleclicked;//PARENT.Event DoubleClicked(0, 0, 0)
end event

event clicked;PARENT.Event Clicked(0,THIS.PointerX(),THIS.PointerY())
end event

