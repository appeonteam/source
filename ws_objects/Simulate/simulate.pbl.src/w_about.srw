$PBExportHeader$w_about.srw
forward
global type w_about from window
end type
type st_client from statictext within w_about
end type
type st_runtime_platform from statictext within w_about
end type
type st_sys_platform from statictext within w_about
end type
type mle_about from multilineedit within w_about
end type
type st_about_header from statictext within w_about
end type
type cb_close from commandbutton within w_about
end type
end forward

global type w_about from window
integer width = 1682
integer height = 752
boolean titlebar = true
string title = "About"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_client st_client
st_runtime_platform st_runtime_platform
st_sys_platform st_sys_platform
mle_about mle_about
st_about_header st_about_header
cb_close cb_close
end type
global w_about w_about

on w_about.create
this.st_client=create st_client
this.st_runtime_platform=create st_runtime_platform
this.st_sys_platform=create st_sys_platform
this.mle_about=create mle_about
this.st_about_header=create st_about_header
this.cb_close=create cb_close
this.Control[]={this.st_client,&
this.st_runtime_platform,&
this.st_sys_platform,&
this.mle_about,&
this.st_about_header,&
this.cb_close}
end on

on w_about.destroy
destroy(this.st_client)
destroy(this.st_runtime_platform)
destroy(this.st_sys_platform)
destroy(this.mle_about)
destroy(this.st_about_header)
destroy(this.cb_close)
end on

event open;string ls_sys_platform, ls_rt_platform, ls_client_type

IF am.of_get_app_client_type() = am.APP_CLIENT_TYPE_WEB THEN
	ls_client_type = "Web"
ELSEIF am.of_get_app_client_type() = am.APP_CLIENT_TYPE_PB THEN
	ls_client_type = "Client-Server"
ELSE
	ls_client_type = "Unknown"
END IF

st_client.Text += " " + ls_client_type

IF am.of_get_system_platform() = am.PLATFORM_64 THEN
	ls_sys_platform = "x64"
ELSE
	ls_sys_platform = "x86"
END IF

st_sys_platform.Text += " " + ls_sys_platform

IF am.of_get_runtime_platform() = am.PLATFORM_64 THEN
	ls_rt_platform = "x64"
ELSE
	ls_rt_platform = "x86"
END IF

st_runtime_platform.Text += " " + ls_rt_platform
end event

type st_client from statictext within w_about
integer x = 5
integer y = 360
integer width = 1339
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Client:"
boolean focusrectangle = false
end type

type st_runtime_platform from statictext within w_about
integer x = 5
integer y = 512
integer width = 1317
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Runtime Platform:"
boolean focusrectangle = false
end type

type st_sys_platform from statictext within w_about
integer x = 5
integer y = 440
integer width = 1326
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "System Platform:"
boolean focusrectangle = false
end type

type mle_about from multilineedit within w_about
integer x = 5
integer y = 204
integer width = 1641
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Simulate is test-bed application to simulate appeon conversion changes."
boolean border = false
boolean displayonly = true
end type

type st_about_header from statictext within w_about
integer x = 5
integer y = 24
integer width = 1637
integer height = 140
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 33554432
long backcolor = 67108864
string text = "Simulate"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_about
integer x = 1385
integer y = 548
integer width = 261
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
string text = "Close"
boolean cancel = true
boolean default = true
end type

event clicked;Close(Parent)
end event

