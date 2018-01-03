$PBExportHeader$w_main2.srw
forward
global type w_main2 from window
end type
type cb_1 from commandbutton within w_main2
end type
type dw_1 from datawindow within w_main2
end type
end forward

global type w_main2 from window
integer width = 3378
integer height = 1736
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_main2 w_main2

on w_main2.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_main2.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_main2
integer x = 425
integer y = 1436
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;uf_dw_as_excel(dw_1, "d:\test.xls")
end event

type dw_1 from datawindow within w_main2
integer x = 306
integer y = 116
integer width = 2894
integer height = 1248
integer taborder = 10
string title = "none"
string dataobject = "d_nup2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

