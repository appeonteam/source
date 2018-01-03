$PBExportHeader$uo_dwr_progressbar.sru
forward
global type uo_dwr_progressbar from userobject
end type
end forward

global type uo_dwr_progressbar from userobject
integer width = 1170
integer height = 84
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global uo_dwr_progressbar uo_dwr_progressbar

type prototypes
Function long CreateWindowExA(ulong dwExStyle, string ClassName,long WindowName, ulong dwStyle, ulong X, ulong Y, ulong nWidth,ulong nHeight, ulong hWndParent, ulong hMenu, ulong hInstance,ulong lpParam) library "user32.dll" alias for "CreateWindowExA;Ansi"
Function ULong DestroyWindow(ULong hwnd) Library "user32.dll"
Function ULong InitCommonControls()Library"ComCtl32.dll"

end prototypes

type variables
Public Long hhwnd
Public Long Value
Public Long minvalue
Public Long maxvalue
Public UInt stepvalue
Public String progress_class = "msctls_progress32"
Public ULong cw_usedefault = 2147483648
Public Integer wm_user = 1024
Public Integer pbm_setrange = 1025
Public Integer pbm_setpos = 1026
Public Integer pbm_deltapos = 1027
Public Integer pbm_setstep = 1028
Public Integer pbm_stepit = 1029
Public Integer pbm_setrange32 = 1030
Public Integer pbm_getrange = 1031
Public Integer bm_getpos = 1032
Public Long ws_child = 1073741824
Public Long ws_visible = 268435456

end variables

forward prototypes
public subroutine setrange (long min, long max)
public subroutine setvalue (long newvalue)
public subroutine setstep (unsignedinteger stepval)
public subroutine stepit ()
protected subroutine initialize ()
end prototypes

public subroutine setrange (long min, long max);minvalue = Min
maxvalue = Max
Send(hhwnd,1025,0,Long(minvalue, maxvalue))

end subroutine

public subroutine setvalue (long newvalue);//valuechanged(value, newvalue)
Value = newvalue
Send(hhwnd, 1026, Value, 0)

end subroutine

public subroutine setstep (unsignedinteger stepval);stepvalue = stepval
Send(hhwnd,1028,stepvalue,0)

end subroutine

public subroutine stepit ();//valuechanged(value, value + stepvalue)
Value += stepvalue
Send(hhwnd, 1029, 0, 0)

end subroutine

protected subroutine initialize ();SetRange(minvalue,maxvalue)
SetStep(stepvalue)
end subroutine

on uo_dwr_progressbar.create
end on

on uo_dwr_progressbar.destroy
end on

event constructor;Long ll_x
Long ll_y
Long ll_width
Long ll_height
InitCommonControls()
ll_x = UnitsToPixels(X, xunitstopixels!)
ll_y = UnitsToPixels(Y, yunitstopixels!)
ll_width = UnitsToPixels(Width, xunitstopixels!)
ll_height = UnitsToPixels(Height, yunitstopixels!)
String WinName=""
hhwnd = CreateWindowExA(0,progress_class,0,1073741824+268435456,ll_x,ll_y,ll_width,ll_height, Handle(Parent),0,Handle(GetApplication()),0)
Visible = False
Initialize()
end event

event destructor;DestroyWindow(hhwnd)
end event

