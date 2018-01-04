$PBExportHeader$w_yyq.srw
forward
global type w_yyq from window
end type
type cb_1 from commandbutton within w_yyq
end type
end forward

global type w_yyq from window
integer width = 3959
integer height = 1648
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
end type
global w_yyq w_yyq

on w_yyq.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_yyq.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_yyq
integer x = 635
integer y = 724
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;str_test   lstr_a
end event

