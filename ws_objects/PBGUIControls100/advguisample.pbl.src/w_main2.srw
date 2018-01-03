$PBExportHeader$w_main2.srw
forward
global type w_main2 from w_ribbonwindow
end type
type uo_toolbarstrip from u_cst_toolbarstrip within w_main2
end type
type uo_xplistbar from u_cst_xplistbar within w_main2
end type
type uo_powerdock from u_cst_powerdock within w_main2
end type
end forward

global type w_main2 from w_ribbonwindow
integer width = 2194
integer height = 1208
string title = "PowerDock Sample"
string menuname = "m_frame"
windowstate windowstate = maximized!
event hide pbm_hidewindow
event ue_postopen ( )
uo_toolbarstrip uo_toolbarstrip
uo_xplistbar uo_xplistbar
uo_powerdock uo_powerdock
end type
global w_main2 w_main2

type prototypes
Function Long ShowWindow(long hwnd, long nCmdShow) library "user32.dll" 

end prototypes

type variables
u_cst_toolbartest iuo_1
u_cst_statictexttest iuo_2
u_cst_outlookshortcutbartest iuo_3
u_cst_buttonlistbartest iuo_4
u_cst_abouttest iuo_5
u_cst_tabcontroltest iuo_6
u_cst_xplistbartest iuo_7
u_cst_groupboxtest iuo_8
u_cst_picturetest iuo_9

u_cst_mle uo_mle1
u_cst_mle uo_mle2
u_cst_mle uo_mle3
u_cst_mle uo_mle4
u_cst_mle uo_mle5
end variables

forward prototypes
public function integer of_changetheme (string as_color)
end prototypes

public function integer of_changetheme (string as_color);
as_color = Upper(as_color)

IF Len(as_color) > 0 THEN
	of_SetTheme(as_color)
	uo_PowerDock.of_SetTheme(as_color)
	uo_toolbarstrip.of_SetTheme(as_color)
	uo_xplistbar.of_SetTheme(as_color)
	
	IF IsValid(iuo_1) THEN iuo_1.of_SetTheme(as_color)
	IF IsValid(iuo_2) THEN iuo_2.of_SetTheme(as_color)
	IF IsValid(iuo_3) THEN iuo_3.of_SetTheme(as_color)
	IF IsValid(iuo_4) THEN iuo_4.of_SetTheme(as_color)
	IF IsValid(iuo_5) THEN iuo_5.of_SetTheme(as_color)
	IF IsValid(iuo_6) THEN iuo_6.of_SetTheme(as_color)
	IF IsValid(iuo_7) THEN iuo_7.of_SetTheme(as_color)
END IF

RETURN 1
end function

event resize;call super::resize;uo_toolbarstrip.Width = THIS.WorkSpaceWidth() - 12
uo_PowerDock.Move(WorkSpaceX(), WorkSpaceY())
uo_PowerDock.Width = THIS.WorkSpaceWidth() - 8
uo_PowerDock.Height = THIS.WorkSpaceHeight()
end event

on w_main2.create
int iCurrent
call super::create
if this.MenuName = "m_frame" then this.MenuID = create m_frame
this.uo_toolbarstrip=create uo_toolbarstrip
this.uo_xplistbar=create uo_xplistbar
this.uo_powerdock=create uo_powerdock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbarstrip
this.Control[iCurrent+2]=this.uo_xplistbar
this.Control[iCurrent+3]=this.uo_powerdock
end on

on w_main2.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_toolbarstrip)
destroy(this.uo_xplistbar)
destroy(this.uo_powerdock)
end on

event open;call super::open;
of_DisplayProgramTab("properties.ico")

//Ribbon Menu

Long ll_saveas, ll_print

of_RibbonMenu().of_AddCommandButton("New", "new.gif", "m_new")
of_RibbonMenu().of_AddCommandButton("Open", "Open!", "m_open")
of_RibbonMenu().of_AddSeperator ()
of_RibbonMenu().of_AddCommandButton("Save", "Save!", "m_save")
of_RibbonMenu().of_AddCommandButton("Save as", "saveas!", "m_saveas")
of_RibbonMenu().of_AddSeperator ()
of_RibbonMenu().of_AddCommandButton("Print", "Prin!", "m_print")
of_RibbonMenu().of_AddCommandButton("Send in email", "", "m_email")
of_RibbonMenu().of_AddSeperator ()
of_RibbonMenu().of_AddCommandButton("Exit", "exit.gif", "m_exit")


///Open some documents (i.e. windows)
uo_PowerDock.of_OpenDocument(iuo_5, 'About','Help!')

//Activate a document
uo_PowerDock.of_ActivateDocument(iuo_5)

//Add items to the dock windows
uo_PowerDock.of_AddDockItem(uo_PowerDock.RIGHT, uo_mle1, "Right", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.LEFT, uo_xplistbar, "Navigation", 'TreeView!', FALSE) //Pass false so item can't be closed
uo_PowerDock.of_AddDockItem(uo_PowerDock.LEFT, uo_mle2, "LEFT", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.BOTTOM, uo_mle3, "Output", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.BOTTOM, uo_mle4, "Errors", 'ListBox!')
uo_PowerDock.of_AddDockItem(uo_PowerDock.TOP, uo_mle5, "Top", 'ListBox!')

//Auto dock the left dock window
uo_PowerDock.of_SetDock(uo_PowerDock.LEFT, TRUE)

//Set some initial sizes
uo_PowerDock.of_SetDockSize(uo_PowerDock.LEFT, 900)
uo_PowerDock.of_SetDockSize(uo_PowerDock.RIGHT, 875)
uo_PowerDock.of_SetDockSize(uo_PowerDock.TOP, 500)
uo_PowerDock.of_SetDockSize(uo_PowerDock.BOTTOM, 500)

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

of_ChangeTheme("BLUE")

POST EVENT ue_PostOpen()

end event

event closequery;call super::closequery;IF uo_powerdock.of_CloseAllDocuments() = 0 THEN
	RETURN 1
END IF
end event

event ribbonmenuclicked;call super::ribbonmenuclicked;CHOOSE CASE as_command
	CASE 'm_save', 'm_saveas'
		string ls_path, ls_file
		GetFileSaveName ( "Select File", &
		ls_path, ls_file, "DOC", &
		"All Files (*.*),*.*" , "C:\My Documents", 32770)
		
	CASE 'm_exit'
		Close(THIS)
END CHOOSE
end event

type uo_ribbonmenu from w_ribbonwindow`uo_ribbonmenu within w_main2
end type

type uo_ribbon from w_ribbonwindow`uo_ribbon within w_main2
end type

type uo_toolbarstrip from u_cst_toolbarstrip within w_main2
event destroy ( )
boolean visible = false
integer x = 5
integer y = 536
integer width = 3662
integer taborder = 20
long il_currentstyle = 4
end type

on uo_toolbarstrip.destroy
call u_cst_toolbarstrip::destroy
end on

event constructor;call super::constructor;of_DisplayRaisedBorder(TRUE)
end event

event ue_buttonclicked;call super::ue_buttonclicked;String ls_color



// process buttons
choose case Upper(as_button)
	case "EXIT"
		Close(Parent)
		RETURN
	CASE "BLUE"
		ls_color = Upper(as_button)
	CASE "SILVER"
		ls_color = Upper(as_button)
	CASE "OLIVE"
		ls_color = Upper(as_button)
	CASE "CLASSIC"
		ls_color = Upper(as_button)
end choose


IF Len(ls_color) > 0 THEN
	uo_PowerDock.of_SetTheme(ls_color)
	uo_toolbarstrip.of_SetTheme(ls_color)
	uo_xplistbar.of_SetTheme(ls_color)
	
	IF IsValid(iuo_1) THEN
		iuo_1.of_SetTheme(ls_color)
		iuo_2.of_SetTheme(ls_color)
		iuo_3.of_SetTheme(ls_color)
		iuo_4.of_SetTheme(ls_color)
		iuo_5.of_SetTheme(ls_color)
		iuo_7.of_SetTheme(ls_color)
		iuo_6.of_SetTheme(ls_color)
	END IF
END IF
end event

event ue_mousemove;call super::ue_mousemove;Parent.SetMicroHelp("Mouse moved over " + as_button)

end event

type uo_xplistbar from u_cst_xplistbar within w_main2
integer y = 672
integer width = 873
integer height = 312
integer taborder = 40
end type

on uo_xplistbar.destroy
call u_cst_xplistbar::destroy
end on

event itemselected;call super::itemselected;CHOOSE CASE Upper(as_group)
	CASE 'UI CONTROLS'
		String ls_label
		
		ls_label = as_item
		
		CHOOSE CASE Upper(as_item)
			CASE 'GROUP BOX'
				IF IsValid(iuo_8) THEN
					uo_PowerDock.of_ActivateDocument(iuo_8)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_8, ls_label,'GroupBox!')
				END IF
			CASE 'TAB CONTROL'
				IF IsValid(iuo_6) THEN
					uo_PowerDock.of_ActivateDocument(iuo_6)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_6, ls_label,'Tab!')
				END IF
			CASE 'SHORTCUTBAR'
				IF IsValid(iuo_3) THEN
					uo_PowerDock.of_ActivateDocument(iuo_3)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_3, ls_label,'ListBox!')
				END IF
			CASE 'TOOLBARSTRIP'
				IF IsValid(iuo_1) THEN
					uo_PowerDock.of_ActivateDocument(iuo_1)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_1, ls_label,'SQL!')
				END IF
			CASE 'BUTTONLISTBAR'
				IF IsValid(iuo_4) THEN
					uo_PowerDock.of_ActivateDocument(iuo_4)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_4, ls_label,'ArrangeIcons!')
				END IF
			CASE 'STATICTEXT'
				IF IsValid(iuo_2) THEN
					uo_PowerDock.of_ActivateDocument(iuo_2)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_2, ls_label,'StaticText!')
				END IF
			CASE 'XPLISTBAR'
				IF IsValid(iuo_7) THEN
					uo_PowerDock.of_ActivateDocument(iuo_7)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_7, ls_label,'TreeView!')
				END IF
			CASE 'PICTURE'
            IF IsValid(iuo_9) THEN
					uo_PowerDock.of_ActivateDocument(iuo_9)
            ELSE
               uo_PowerDock.of_OpenDocument(iuo_9, ls_label,'Picture5!')
            END IF
		END CHOOSE
		
		
		
	CASE 'MORE INFO'
		CHOOSE CASE Upper(as_item)
			CASE 'ABOUT'
				IF IsValid(iuo_5) THEN
					uo_PowerDock.of_ActivateDocument(iuo_5)
				ELSE
					uo_PowerDock.of_OpenDocument(iuo_5, 'About','Help!')
				END IF
			CASE 'POWERTOTHEBUILDER.COM'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.powertothebuilder.com")
			CASE 'PURCHASE'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.powertothebuilder.com/purchase.aspx")
			CASE 'WERYSOFT.COM'
				POST Run("rundll32.exe url.dll,FileProtocolHandler http://www.werysoft.com")
		END CHOOSE
END CHOOSE

end event

type uo_powerdock from u_cst_powerdock within w_main2
integer x = 891
integer y = 112
integer width = 585
integer height = 112
integer taborder = 20
end type

on uo_powerdock.destroy
call u_cst_powerdock::destroy
end on

event panelexpanded;call super::panelexpanded;//Parent.SetMicroHelp("Panel Expanded " + String(panel))
end event

event panelpinned;call super::panelpinned;//Parent.SetMicroHelp("Panel Pinned " + String(panel))
end event

event panelobjectdisplayed;call super::panelobjectdisplayed;//Parent.SetMicroHelp("Panel Object Displayed " + String(panelobject.classname()))
end event

event documentselectionchanged;call super::documentselectionchanged;//Parent.SetMicroHelp("Document Selection Changed " + String(document))
end event

event panelunpinned;call super::panelunpinned;//Parent.SetMicroHelp("Panel UnPinned " + String(panel))
end event

