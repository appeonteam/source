$PBExportHeader$w_demo.srw
$PBExportComments$Demo window
forward
global type w_demo from window
end type
type cb_1 from commandbutton within w_demo
end type
end forward

global type w_demo from window
integer width = 3168
integer height = 1320
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
global w_demo w_demo

on w_demo.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_demo.destroy
destroy(this.cb_1)
end on

event open;Int  li_rc

li_rc	=	THIS.Trigger Event help( 100, 200 )

end event

type cb_1 from commandbutton within w_demo
integer x = 1216
integer y = 168
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

