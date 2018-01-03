$PBExportHeader$wn_ink_mdi.srw
forward
global type wn_ink_mdi from window
end type
type mdi_1 from mdiclient within wn_ink_mdi
end type
end forward

global type wn_ink_mdi from window
integer width = 3077
integer height = 2768
boolean titlebar = true
string title = "Ink Demo"
string menuname = "mu_ink_demo"
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
global wn_ink_mdi wn_ink_mdi

on wn_ink_mdi.create
if this.MenuName = "mu_ink_demo" then this.MenuID = create mu_ink_demo
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on wn_ink_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;
OpenSheet (wn_ink_demo, THIS, 0, Layered!)
end event

type mdi_1 from mdiclient within wn_ink_mdi
long BackColor=268435456
end type

