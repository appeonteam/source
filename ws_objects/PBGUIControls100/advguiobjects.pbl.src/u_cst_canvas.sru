$PBExportHeader$u_cst_canvas.sru
forward
global type u_cst_canvas from u_canvas
end type
type rect from structure within u_cst_canvas
end type
type inv_win32 from n_cst_win32 within u_cst_canvas
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type u_cst_canvas from u_canvas
inv_win32 inv_win32
end type
global u_cst_canvas u_cst_canvas

type prototypes
FUNCTION ulong DrawText(ulong lhdc,ref string lpStr,ulong nCount,ref RECT lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextW"
end prototypes

type variables

end variables

forward prototypes
public function integer of_draweval (long hdc)
end prototypes

public function integer of_draweval (long hdc);
//n_cst_toolbarstrip_painter lnv_gradient
//lnv_gradient.of_SetHdc(hdc)
//lnv_gradient.of_DrawText(THIS, 'Eval', RGB(150,150,150), 'Tahoma', 9, TRUE, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 50,FALSE, FALSE, false, false) 
//
RETURN 1
end function

on u_cst_canvas.create
call super::create
this.inv_win32=create inv_win32
end on

on u_cst_canvas.destroy
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within u_cst_canvas descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

