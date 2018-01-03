$PBExportHeader$w_about.srw
forward
global type w_about from window
end type
type cb_1 from commandbutton within w_about
end type
type st_4 from statictext within w_about
end type
type st_3 from statictext within w_about
end type
type st_2 from statictext within w_about
end type
type st_1 from statictext within w_about
end type
type phl_2 from picturehyperlink within w_about
end type
type phl_1 from picturehyperlink within w_about
end type
end forward

global type w_about from window
integer width = 1765
integer height = 1356
boolean titlebar = true
string title = "About"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
phl_2 phl_2
phl_1 phl_1
end type
global w_about w_about

on w_about.create
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.phl_2=create phl_2
this.phl_1=create phl_1
this.Control[]={this.cb_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.phl_2,&
this.phl_1}
end on

on w_about.destroy
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.phl_2)
destroy(this.phl_1)
end on

type cb_1 from commandbutton within w_about
integer x = 1367
integer y = 1144
integer width = 352
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(PARENT)
end event

type st_4 from statictext within w_about
integer x = 142
integer y = 516
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

type st_3 from statictext within w_about
integer x = 142
integer y = 448
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

type st_2 from statictext within w_about
integer x = 82
integer y = 332
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

type st_1 from statictext within w_about
integer x = 238
integer y = 700
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

type phl_2 from picturehyperlink within w_about
integer width = 1755
integer height = 268
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "PttBLogo.bmp"
boolean focusrectangle = false
end type

event clicked;Run("rundll32.exe url.dll,FileProtocolHandler http://www.powertothebuilder.com")
end event

type phl_1 from picturehyperlink within w_about
integer x = 261
integer y = 788
integer width = 969
integer height = 192
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "logo.bmp"
boolean focusrectangle = false
end type

event clicked;Run("rundll32.exe url.dll,FileProtocolHandler http://www.werysoft.com")
end event

