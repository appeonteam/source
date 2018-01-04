$PBExportHeader$w_main_syntax.srw
forward
global type w_main_syntax from window
end type
type cb_3 from commandbutton within w_main_syntax
end type
type cb_2 from commandbutton within w_main_syntax
end type
type cb_1 from commandbutton within w_main_syntax
end type
end forward

global type w_main_syntax from window
integer width = 1769
integer height = 1360
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_main_syntax w_main_syntax

on w_main_syntax.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_main_syntax.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_main_syntax
integer x = 512
integer y = 860
integer width = 754
integer height = 200
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "w_image_sample"
end type

event clicked;open (w_image_sample)
end event

type cb_2 from commandbutton within w_main_syntax
integer x = 512
integer y = 424
integer width = 754
integer height = 200
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "w_nosyntax_sample"
end type

event clicked;string ls_w
window	lw
ls_w = 'w_nosyntax_sample'

open (lw, ls_w)
end event

type cb_1 from commandbutton within w_main_syntax
integer x = 512
integer y = 640
integer width = 754
integer height = 200
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "w_syntax_sample"
end type

event clicked;open (w_syntax_sample)
end event

