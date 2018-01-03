$PBExportHeader$w_frame.srw
forward
global type w_frame from window
end type
type mdi_1 from mdiclient within w_frame
end type
end forward

global type w_frame from window
integer width = 3666
integer height = 2284
boolean titlebar = true
string title = "Simulate"
string menuname = "m_frame"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_frame w_frame

type variables
Public:

end variables

on w_frame.create
if this.MenuName = "m_frame" then this.MenuID = create m_frame
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;am = CREATE nv_app_manager
end event

event close;DESTROY am
end event

type mdi_1 from mdiclient within w_frame
long BackColor=268435456
end type

