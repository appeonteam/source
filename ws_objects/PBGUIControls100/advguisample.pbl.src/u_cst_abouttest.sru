$PBExportHeader$u_cst_abouttest.sru
forward
global type u_cst_abouttest from u_cst_tabpage
end type
type phl_1 from picturehyperlink within u_cst_abouttest
end type
type st_5 from statictext within u_cst_abouttest
end type
type st_2 from statictext within u_cst_abouttest
end type
type st_3 from statictext within u_cst_abouttest
end type
type st_4 from statictext within u_cst_abouttest
end type
type p_1 from picture within u_cst_abouttest
end type
end forward

global type u_cst_abouttest from u_cst_tabpage
integer width = 2537
integer height = 1536
long backcolor = 16777215
phl_1 phl_1
st_5 st_5
st_2 st_2
st_3 st_3
st_4 st_4
p_1 p_1
end type
global u_cst_abouttest u_cst_abouttest

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);
end subroutine

on u_cst_abouttest.create
int iCurrent
call super::create
this.phl_1=create phl_1
this.st_5=create st_5
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.phl_1
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.p_1
end on

on u_cst_abouttest.destroy
call super::destroy
destroy(this.phl_1)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.p_1)
end on

type phl_1 from picturehyperlink within u_cst_abouttest
integer x = 261
integer y = 804
integer width = 969
integer height = 192
string pointer = "HyperLink!"
string picturename = "logo.bmp"
boolean focusrectangle = false
end type

event clicked;Run("rundll32.exe url.dll,FileProtocolHandler http://www.werysoft.com")
end event

type st_5 from statictext within u_cst_abouttest
integer x = 238
integer y = 716
integer width = 873
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Developed By"
boolean focusrectangle = false
end type

type st_2 from statictext within u_cst_abouttest
integer x = 82
integer y = 348
integer width = 814
integer height = 116
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "PB UI Controls"
boolean focusrectangle = false
end type

type st_3 from statictext within u_cst_abouttest
integer x = 142
integer y = 464
integer width = 571
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Version: 4.0.1"
boolean focusrectangle = false
end type

type st_4 from statictext within u_cst_abouttest
integer x = 142
integer y = 532
integer width = 1029
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Copyright: © 2008-2012 Werysoft Inc. "
boolean focusrectangle = false
end type

type p_1 from picture within u_cst_abouttest
integer x = 37
integer y = 44
integer width = 1755
integer height = 268
boolean originalsize = true
string picturename = "pttblogo.bmp"
boolean focusrectangle = false
end type

