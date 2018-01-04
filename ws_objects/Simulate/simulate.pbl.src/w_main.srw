$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type p_1 from u_picture within w_main
end type
end forward

global type w_main from window
integer width = 1408
integer height = 1434
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
end type
global w_main w_main

type prototypes
	FUNCTION ulong SetCapture(ulong hwnd) LIBRARY "user32.dll"
	FUNCTION ulong ReleaseCapture() LIBRARY "user32.dll"
end prototypes

on w_main.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_main.destroy
destroy(this.p_1)
end on

event open;p_1.enabled = true
end event

type p_1 from u_picture within w_main
integer x = 457
integer y = 515
integer width = 172
integer height = 150
string picturename = ".\login_ok.gif"
end type

event clicked;call super::clicked;close(w_main)
open(w_2)
end event

