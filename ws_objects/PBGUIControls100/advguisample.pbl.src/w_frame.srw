$PBExportHeader$w_frame.srw
forward
global type w_frame from window
end type
type mdi_1 from mdiclient within w_frame
end type
type uo_xplistbar from u_cst_xplistbar within w_frame
end type
type uo_powerdock from u_cst_powerdock within w_frame
end type
end forward

global type w_frame from window
integer width = 3959
integer height = 1724
boolean titlebar = true
string title = "Untitled"
string menuname = "m_main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
uo_xplistbar uo_xplistbar
uo_powerdock uo_powerdock
end type
global w_frame w_frame

type variables
u_cst_mle uo_mle1
u_cst_mle uo_mle2
u_cst_mle uo_mle3
u_cst_mle uo_mle4
u_cst_mle uo_mle5
end variables

on w_frame.create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.mdi_1=create mdi_1
this.uo_xplistbar=create uo_xplistbar
this.uo_powerdock=create uo_powerdock
this.Control[]={this.mdi_1,&
this.uo_xplistbar,&
this.uo_powerdock}
end on

on w_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.uo_xplistbar)
destroy(this.uo_powerdock)
end on

event open;uo_powerdock.of_SetMDI(MDI_1)

///Open some documents (i.e. windows)
//uo_PowerDock.of_OpenDocument(iuo_5, 'About','Help!')

//Activate a document
//uo_PowerDock.of_ActivateDocument(iuo_5)

//Add items to the dock windows
uo_PowerDock.of_AddDockItem(uo_PowerDock.RIGHT, uo_mle1, "Right", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.LEFT, uo_xplistbar, "Navigation", 'TreeView!', FALSE) //Pass false so item can't be closed
uo_PowerDock.of_AddDockItem(uo_PowerDock.LEFT, uo_mle2, "LEFT", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.BOTTOM, uo_mle3, "Output", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.BOTTOM, uo_mle4, "Errors", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.TOP, uo_mle5, "Top", 'ListBox!')

//Set some initial sizes
uo_PowerDock.of_SetDockSize(uo_PowerDock.LEFT, 900)
uo_PowerDock.of_SetDockSize(uo_PowerDock.RIGHT, 875)
uo_PowerDock.of_SetDockSize(uo_PowerDock.TOP, 500)
uo_PowerDock.of_SetDockSize(uo_PowerDock.BOTTOM, 500)

//Auto dock the left dock window
uo_PowerDock.of_SetDock(uo_PowerDock.LEFT, TRUE)

//Set focus to specific dock items
uo_PowerDock.of_SetDockItemFocus(uo_xplistbar)


//XPListBar
Long ll_parent

ll_parent = uo_xplistbar.of_AddGroup('UI Controls', '', uo_xplistbar.SPECIAL)
uo_xplistbar.of_AddLink('Group Box', 'GroupBox!', ll_parent)
uo_xplistbar.of_AddLink('Tab Control','Tab!', ll_parent)
uo_xplistbar.of_AddLink('Shortcutbar','ListBox!', ll_parent)
uo_xplistbar.of_AddLink('Toolbarstrip','SQL!', ll_parent)
uo_xplistbar.of_AddLink('Buttonlistbar','ArrangeIcons!', ll_parent)
uo_xplistbar.of_AddLink('Statictext','StaticText!', ll_parent)
uo_xplistbar.of_AddLink('XPListBar','TreeView!', ll_parent)

ll_parent = uo_xplistbar.of_AddGroup('More Info', '')
uo_xplistbar.of_AddLink('About','Help!', ll_parent)
uo_xplistbar.of_AddLine(ll_parent)
uo_xplistbar.of_AddLink('Purchase', 'StaticHyperLink!', ll_parent)
uo_xplistbar.of_AddLink('PowerToTheBuilder.com', 'StaticHyperLink!', ll_parent)
uo_xplistbar.of_AddLink('Werysoft.com', 'StaticHyperLink!', ll_parent)


//POST EVENT ue_PostOpen()



end event

event resize;uo_PowerDock.Move(WorkSpaceX(), WorkSpaceY())
uo_PowerDock.Width = THIS.WorkSpaceWidth() - 8
uo_PowerDock.Height = THIS.WorkSpaceHeight() - MDI_1.MicroHelpHeight
end event

type mdi_1 from mdiclient within w_frame
long BackColor=268435456
end type

type uo_xplistbar from u_cst_xplistbar within w_frame
event destroy ( )
integer x = 2336
integer y = 1096
integer width = 873
integer height = 312
integer taborder = 50
end type

on uo_xplistbar.destroy
call u_cst_xplistbar::destroy
end on

event itemselected;call super::itemselected;CHOOSE CASE Upper(as_group)
	CASE 'UI CONTROLS'
		String ls_label
		w_sheet lw
		
		ls_label = as_item
		
		CHOOSE CASE Upper(as_item)
			CASE 'GROUP BOX'
				OpenSheetWithParm(lw, 'u_cst_groupboxtest', w_frame)
			CASE 'TAB CONTROL'
				OpenSheetWithParm(lw, 'u_cst_tabcontroltest', w_frame)
			CASE 'SHORTCUTBAR'
				OpenSheetWithParm(lw, 'u_cst_outlookshortcutbartest', w_frame)
			CASE 'TOOLBARSTRIP'
				OpenSheetWithParm(lw, 'u_cst_toolbartest', w_frame)
			CASE 'BUTTONLISTBAR'
				OpenSheetWithParm(lw, 'u_cst_buttonlistbartest', w_frame)
			CASE 'STATICTEXT'
				OpenSheetWithParm(lw, 'u_cst_statictexttest', w_frame)
			CASE 'XPLISTBAR'
				OpenSheetWithParm(lw, 'u_cst_xplistbartest', w_frame)
		END CHOOSE
		
		
		
	CASE 'MORE INFO'
		CHOOSE CASE Upper(as_item)
			CASE 'ABOUT'
				OpenSheetWithParm(lw, 'u_cst_abouttest', w_frame)
			CASE 'POWERTOTHEBUILDER.COM'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.powertothebuilder.com")
			CASE 'PURCHASE'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.powertothebuilder.com/purchase.aspx")
			CASE 'WERYSOFT.COM'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.werysoft.com")
		END CHOOSE
END CHOOSE

end event

type uo_powerdock from u_cst_powerdock within w_frame
integer taborder = 40
end type

on uo_powerdock.destroy
call u_cst_powerdock::destroy
end on

