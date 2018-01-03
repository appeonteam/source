$PBExportHeader$w_sheet.srw
forward
global type w_sheet from window
end type
end forward

global type w_sheet from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Sheet"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_sheet w_sheet

type variables
UserObject iuo
end variables

on w_sheet.create
end on

on w_sheet.destroy
end on

event open;String ls_object

ls_object = Message.StringParm

IF NOT IsNull(ls_object) THEN
	IF Len(Trim(ls_object)) > 0 THEN
		OpenUserObject(iuo, ls_object, 0,0)
	END IF
END IF
end event

event resize;IF IsValid(iuo) THEN iuo.Resize(NewWidth, NewHeight)
end event

