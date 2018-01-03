$PBExportHeader$n_cst_win32.sru
forward
global type n_cst_win32 from nonvisualobject
end type
end forward

global type n_cst_win32 from nonvisualobject
end type
global n_cst_win32 n_cst_win32

type prototypes
Function long FN_ResGetBitmapID (string lpImageName) Library "pbvm100.dll"
FUNCTION Ulong Chord (Long hdc2 , Long X1 , Long Y1 , Long X2 , Long Y2 , Long X3 , Long Y3 , Long X4 , Long Y4 ) Library "gdi32.dll" 
FUNCTION ulong ChildWindowFromPoint (ulong hWnd, ref POINT lpPoint) Library "USER32.DLL"
FUNCTION uLong CloseThemeData (uLong hTheme )  Library "UxTheme.dll"
Function ulong CreateCompatibleDC (ulong hdc) Library "gdi32.dll"
FUNCTION ulong CreateFontIndirect (ref LOGFONT lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA;ANSI"
FUNCTION ulong CreatePen (ulong nPenStyle, ulong nWidth, ulong crColor) LIBRARY "Gdi32.dll"
FUNCTION ulong CreateRectRgn (Long X1, Long Y1 , Long X2 , Long Y2 ) LIBRARY "Gdi32.dll"
FUNCTION ulong CreateRoundRectRgn (long X1 , long Y1 , long X2 , long Y2 , long X3 , long Y3 ) LIBRARY "Gdi32.dll"
FUNCTION ulong CreatePolygonRgn (ref POINT ppoint[], int count, int fillMode) Library "GDI32.DLL" alias for "CreatePolygonRgn;Ansi"
FUNCTION Ulong CreateSolidBrush (Long crColor) Library "gdi32.dll"
FUNCTION long CreateWindowEx (ulong dwExStyle, string ClassName, long WindowName, ulong dwStyle, ulong X, ulong Y, ulong nWidth, ulong nHeight, ulong hWndParent, ulong hMenu, ulong hInstance, ulong lpParam) library "user32.dll" alias for "CreateWindowExW"
FUNCTION boolean DeleteObject(ulong hgdiobject) library "gdi32.dll" 
Function boolean DeleteDC (ulong hdc) Library "gdi32.dll"
Function boolean DestroyIcon (long hIcon) Library "user32.dll"
FUNCTION integer DestroyWindow (long hWnd) library "user32.dll"
Function boolean DrawIconEx (ulong hdc, long xLeft, long yTop, ulong hIcon, long cxWidth, long cyWidth, ulong istepIfAniCur, long hbrFlickerFreeDraw, ulong diFlags) Library "user32.dll"
FUNCTION ulong DrawText (ulong lhdc,ref string lpStr,ulong nCount,ref RECT lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextW"
FUNCTION boolean Ellipse (ulong hwnd,long x1,long y1,long x2,long y2) LIBRARY "Gdi32.dll"
Function ulong ExtractIconEx (string lpszFile, long nIconIndex, Ref long phIconLarge[], Ref long phIconSmall[], ulong nIcons) Library "shell32.dll" Alias For "ExtractIconExW"
FUNCTION ULONG FillRgn (Long hdc6, Long hRgn , Long hBrush ) LIBRARY "Gdi32.dll"
Function boolean FreeLibrary(long hModule) Library "kernel32.dll"
FUNCTION Long GetClientRect (Long hwnd, REF RECT lpRect) Library 'user32' alias for "GetClientRect"
FUNCTION uLong GetColorAdjustment (uLong hdc , ref coloradjustment mystructure) Library "gdi32.dll" 
FUNCTION uLong GetCurrentThemeName (Ref String pszThemeFileName, long dwMaxNameChars, Ref String pszColorBuff, Long cchMaxColorChars, Ref String pszSizeBuff, Long cchMaxSizeChars ) Library "UxTheme.dll"
FUNCTION uLong GetCurrentThemeName (Ref Blob pszThemeFileName, long dwMaxNameChars, Ref Blob pszColorBuff, Long cchMaxColorChars, Ref Blob pszSizeBuff, Long cchMaxSizeChars ) Library "UxTheme.dll"
FUNCTION boolean GetCursorPos (ref POINT lpPoint) Library "USER32.DLL"
FUNCTION long GetDC (ulong hWnd) Library "USER32.DLL"
FUNCTION Ulong GetDeviceCaps (ULong Hdc, Long nIndex) Library "gdi32.dll" 
FUNCTION ulong GetGraphicsMode (ulong lhdc) LIBRARY "gdi32.dll"
FUNCTION Long GetNearestColor (uLong hdc, Long crColor ) Library "gdi32.dll"
Function long GetObject(ulong hgdiobj, long cbBuffer, Ref BITMAP lpvObject) Library "gdi32.dll" Alias For "GetObjectW"
FUNCTION ULong GetParent (Long lChild) LIBRARY "user32.dll"
FUNCTION Long GetPixel (Long ahdc, int aX, int aY) Library "Gdi32.dll"
FUNCTION Ulong	GetStretchBltMode (Long hdc) Library "gdi32.dll"
FUNCTION ULong SetStretchBltMode (Long hdc, Long nStretchMode) Library "gdi32.dll"
FUNCTION ulong GetSysColor (ulong nIndex) LIBRARY "user32.dll"
FUNCTION integer GetSystemMetrics (int nIndex ) Library "user32.dll"
FUNCTION boolean GetTextExtentPoint32 (ulong hdcr, string lpString, long nCount, Ref SIZE size) Library "gdi32.dll" Alias For "GetTextExtentPoint32W"
FUNCTION uLong GetThemeColor (uLong hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Long pColor ) Library "UxTheme.dll"
FUNCTION uLong GetThemeEnumValue (uLong hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Integer piVal ) Library "UxTheme.dll"
FUNCTION uLong GetThemeInt (uLong hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Integer piVal ) Library "UxTheme.dll"
FUNCTION uLong GetThemePartSize (uLong hTheme, uLong hdc, Int iPartId, Int iStateId, uLong prc, Integer eSize, Ref Size psz ) Library "UxTheme.dll" alias for "GetThemePartSize;Ansi"
FUNCTION Long GetWindowLong (Long hWnd, Long offset) LIBRARY 'user32.dll' ALIAS FOR "GetWindowLongA"
FUNCTION BOOLEAN GetWindowRect (ulong hWnd,  REF Rect rect) library "user32.dll" alias for "GetWindowRect;Ansi"
FUNCTION uLong GetWindowTheme (uLong hwnd ) Library "UxTheme.dll" Alias for "GetWindowTheme"
FUNCTION long GlobalAlloc (long Flags, long Bytes) Library "kernel32.dll"
FUNCTION long GlobalFree (long MemHandle) Library "kernel32.dll"
FUNCTION long GlobalLock(long MemHandle) Library "kernel32.dll"
FUNCTION long GlobalUnlock (long MemHandle) Library "kernel32.dll"
FUNCTION Boolean GradientRectangle (Long hdc2, TRIVERTEX pVert[], ULong numVert, GRADIENT_RECT pMesh [], ULong numMesh, ULong dMode) Library 'msimg32' Alias For 'GradientFill'
FUNCTION Boolean GradientTriangle (Long hdc3, TRIVERTEX pVert[], ULong numVert, GRADIENT_TRIANGLE pMesh [], ULong numMesh, ULong dMode) Library 'msimg32' Alias For 'GradientFill;Ansi'
FUNCTION boolean ImageList_Draw (long himl, long i, long hdcDst, long lx, long ly, ulong fStyle) Library "comctl32.dll"
FUNCTION boolean ImageList_DrawEx (long himl, long i, long hdcDst, long lx, long ly, long lwidth, long lheight, long lback, long lfore , ulong fStyle) Library "comctl32.dll"
FUNCTION Boolean InitCommonControlsEx (REF INITCOMMONCONTROLSEX iccex) library "comctl32.dll" alias for "InitCommonControlsEx;Ansi"
Function ulong LoadImage (long hinst, string lpszName, ulong uType, long cxDesired, long cyDesired, ulong fuLoad) Library "user32.dll" Alias For "LoadImageW"
FUNCTION long LocalAlloc (long Flags, long Bytes) library "kernel32.dll"
FUNCTION long LocalFree (long MemHandle) library "kernel32.dll"
Function long LoadLibrary(string lpFileName) Library "kernel32.dll" Alias For "LoadLibraryW"
FUNCTION ulong LineTo (ulong hdc,ulong lx,ulong ly) LIBRARY "gdi32.dll"
FUNCTION Boolean IsAppThemed () Library "UxTheme.dll"
FUNCTION Boolean IsThemeActive () Library "UxTheme.dll"
FUNCTION Boolean IsThemePartDefined (uLong hTheme, Int iPartId, Int iStateId ) Library "UxTheme.dll"
FUNCTION long lstrcpy (long Destination, string Source) library "kernel32.dll" alias for "lstrcpyW"
FUNCTION ulong MoveToEx (ulong hdc,ulong lx,ulong ly,ref POINT lpPoint) LIBRARY "gdi32.dll" alias for "MoveToEx"
FUNCTION Long MulDiv (Long nNumber, Long nNumerator, Long nDenominator ) Library "kernel32.dll"
FUNCTION Long OpenThemeData (uLong hWnd, String pszClassList )  Library "UxTheme.dll"
FUNCTION Long OpenThemeData (uLong hWnd, Blob pszClassList )  Library "UxTheme.dll"
FUNCTION ULONG PolyBezier (Long hdc7, REF RECT lpRect, long cPoints ) LIBRARY "Gdi32.dll" alias for "PolyBezier;Ansi"
FUNCTION ULONG Polyline (Long hdc8, GRADIENT_RECT lppt[], long cPoints) LIBRARY "Gdi32.dll" alias for "Polyline;Ansi"
FUNCTION ULONG Polyline (Long hdc8, point lppt[], int cPoints) LIBRARY "Gdi32.dll" alias for "Polyline;Ansi"
FUNCTION long PtInRegion (ulong hrgn, int x, int y) LIBRARY "GDI32.dll"
FUNCTION ulong Rectangle (ulong hwnd, ulong X1, ulong Y1, ulong X2, ulong Y2) library "gdi32" 
FUNCTION integer RelayMsg (long hWnd, long uMsg, long wParam, REF MSG Msg) library "user32.dll" Alias For "SendMessageW"
FUNCTION BOOLEAN ReleaseCapture () Library "USER32.DLL"
FUNCTION int ReleaseDC (ulong hWnd, ulong hDC) Library "USER32.DLL"
FUNCTION ulong RoundRect (uLong hdc5 , uLong X1, ulong Y1 , ulong X2 , ulong Y2 , ulong X3 , ulong Y3 ) LIBRARY "Gdi32.dll"
FUNCTION boolean ScreenToClient (ulong hWnd, ref POINT lpPoint) Library "USER32.DLL"
FUNCTION long SelectClipRgn (ulong lhdc, ulong lhrgn) Library "GDI32.DLL"
FUNCTION ulong SelectObject (ulong hdc, ulong hWnd ) Library "gdi32.dll"
FUNCTION uLong SendMessageString (uLong hwnd, uLong Msg, uLong wParam, Ref String lpzString ) Library "user32.dll" Alias For "SendMessageW"
FUNCTION ulong SetBkColor (ulong lhdc,ulong nColor) LIBRARY "gdi32.dll"
FUNCTION ulong SetBkMode (ulong lhdc,ulong nBkMode) LIBRARY "gdi32.dll"
FUNCTION ulong SetCapture (ulong hWnd) Library "USER32.DLL"
FUNCTION uLong SetColorAdjustment (uLong	hdc , ref coloradjustment mystructure) Library "gdi32.dll" 
FUNCTION ulong SetGraphicsMode (ulong lhdc,ulong nMode) LIBRARY "gdi32.dll"
FUNCTION Long SetLayeredWindowAttributes (ULong hWnd, ULong colorref, Char Transparency, ULong flag) LIBRARY 'user32.dll' alias for "SetLayeredWindowAttributes"
FUNCTION Long SetParent (Long lChild, Long lParent) LIBRARY "user32.dll"
FUNCTION Long SetPixel (Long ahdc, int aX, int aY, Long crColor) Library "Gdi32.dll"
FUNCTION Ulong SetROP2 (uLong hdc , uLong nDrawMode ) Library "gdi32.dll" 
FUNCTION ulong SetTextColor (ulong lhdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION Long SetWindowLong (Long hWnd, Long offset, Long attributes) LIBRARY 'user32.dll' ALIAS FOR "SetWindowLongW"
FUNCTION Long SetWindowPos (Long hWnd, Long m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
FUNCTION Long SetWindowTheme (uLong hwnd, Ref String pszSubAppName, ref String pszSubIdList ) Library "UxTheme.dll" Alias for "SetWindowTheme;Ansi"
FUNCTION Long SetWindowTheme (uLong hwnd, Ref Blob pszSubAppName, ref Blob pszSubIdList ) Library "UxTheme.dll" Alias for "SetWindowTheme"
FUNCTION ULong StretchBlt (Long hdc,Long x2, Long y2, Long nWidth, Long nHeight, Long hSrcDC, Long xSrc, Long ySrc, Long nSrcWidth, Long nSrcHeight,Long dwRop) Library "gdi32.dll"
Function boolean StretchBlt (ulong hdcDest, long nXOriginDest, long nYOriginDest, long nWidthDest, long nHeightDest, ulong hdcSrc, long nXOriginSrc, long nYOriginSrc, long nWidthSrc, long nHeightSrc, long dwRop) Library "gdi32.dll"
FUNCTION Boolean SystemParametersInfo (uInt uiAction, uInt uiParam, Ref Any pvPAram, uInt fWinIni ) Library "user32.dll" Alias For "SystemParametersInfoA"
FUNCTION Boolean SystemParametersInfo (uInt uiAction, uInt uiParam, Long pvPAram, uInt fWinIni ) Library "user32.dll" Alias For "SystemParametersInfoA"//A"
FUNCTION ulong TextOut (ulong lhdc,ulong lx,ulong ly,ref string lpString,ulong nCount) LIBRARY "gdi32.dll" ALIAS FOR "TextOutW"
FUNCTION integer ToolTipMsg (long hWnd, long uMsg, long wParam, REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageW"
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
Function boolean TransparentBlt (ulong hdcDest, long xoriginDest, long yoriginDest, long wDest, long hDest, ulong hdcSrc, long xoriginSrc, long yoriginSrc, long wSrc, long hSrc, ulong crTransparent) Library "msimg32.dll"



//GDI+
FUNCTION Long CreatePathGradient (REF PointF pPoints, Long count, Long wrapMode, REF Long polyGradient) library "Gdiplus.dll" Alias For "GdipCreatePathGradient"
Function long GdipCreateBitmapFromFileICM(string filename, Ref ulong bitmap ) Library "gdiplus.dll"
Function long GdipDisposeImage(ulong image) Library "gdiplus.dll"
function long GdipCreateFromHDC(ulong hdc, ref ulong graphics) library "gdiplus.dll"
function long GdipSetSmoothingMode(ulong graphics, long smoothingmode) library "gdiplus.dll"
function long GdipDrawImageRectRectI(ulong graphics, ulong gImage, long dx, long dy, long dw, long dh, long sx, long sy, long sw, long sh, long unit, ulong gImageAttrib, long callback, long callbackData) library "gdiplus.dll"
function long GdipDrawImageRectI(ulong graphics, ulong gImage, long x, long y, long width, long height) library "gdiplus.dll"
function long GdipDeleteGraphics(ulong graphics) library "gdiplus.dll"
Function long GdipGetImageBounds(ulong image, Ref RECTF srcRect, Ref long srcUnit) Library "gdiplus.dll"
Function long GdiplusStartup (Ref ulong token, GdiplusStartupInput input, Ref GdiplusStartupOutput output) Library "gdiplus.dll"
Subroutine GdiplusShutdown (ulong token) Library "gdiplus.dll"
Function long GdipCreateImageAttributes( &
	Ref ulong gImgattr &
	) Library "gdiplus.dll"

Function long GdipDisposeImageAttributes( &
	ulong gImgattr &
	) Library "gdiplus.dll"

Function long GdipBitmapGetPixel( &
	ulong gBitmap, &
	long lx, &
	long ly, &
	Ref ulong argb &
	) Library "gdiplus.dll"

Function long GdipSetImageAttributesColorKeys( &
	ulong gImgattr, &
	long colorAdjustType, &
	boolean enableFlag, &
	ulong argbColorLow, &
	ulong argbColorHigh &
	) Library "gdiplus.dll"

end prototypes

type variables
CONSTANT Long LOGPIXELSX = 88
CONSTANT Long LOGPIXELSY = 90

CONSTANT Long WM_MOUSEWHEEL = 522
end variables

forward prototypes
public function double getdpix ()
public function double getdpiy ()
public function double scalex (double al_value)
public function double scaley (double al_value)
end prototypes

public function double getdpix ();ULong screen
Double scale
screen = GetDC(0)
scale = GetDeviceCaps(screen, LOGPIXELSX) / 96.0
ReleaseDC(0, screen)
RETURN scale
end function

public function double getdpiy ();ULong screen
Double scale
screen = GetDC(0)
scale = GetDeviceCaps(screen, LOGPIXELSY) / 96.0
ReleaseDC(0, screen)
RETURN scale
end function

public function double scalex (double al_value);RETURN al_value * GetDpiX()
end function

public function double scaley (double al_value);RETURN al_value * GetDpiY()
end function

on n_cst_win32.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_win32.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

