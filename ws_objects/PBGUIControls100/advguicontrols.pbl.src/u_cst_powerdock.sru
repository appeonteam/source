$PBExportHeader$u_cst_powerdock.sru
forward
global type u_cst_powerdock from userobject
end type
type uo_powerdockpanelright from u_cst_powerdockpanel within u_cst_powerdock
end type
type uo_powerdockpanelleft from u_cst_powerdockpanel within u_cst_powerdock
end type
type split_top from u_cst_splitbar within u_cst_powerdock
end type
type split_right from u_cst_splitbar within u_cst_powerdock
end type
type split_bottom from u_cst_splitbar within u_cst_powerdock
end type
type split_left from u_cst_splitbar within u_cst_powerdock
end type
type uo_powerdocktab from u_cst_tabcontrol within u_cst_powerdock
end type
type uo_powerdockpaneltop from u_cst_powerdockpanel within u_cst_powerdock
end type
type uo_powerdockpanelbottom from u_cst_powerdockpanel within u_cst_powerdock
end type
type st_1 from statictext within u_cst_powerdock
end type
type bitmapfileheader from structure within u_cst_powerdock
end type
type bitmapinfoheader from structure within u_cst_powerdock
end type
type bitmapinfo from structure within u_cst_powerdock
end type
type inv_win32 from n_cst_win32 within u_cst_powerdock
end type
end forward

type bitmapfileheader from structure
	integer		bftype
	long		bfsize
	integer		bfreserved1
	integer		bfreserved2
	long		bfoffbits
end type

type bitmapinfoheader from structure
	long		bisize
	long		biwidth
	long		biheight
	integer		biplanes
	integer		bibitcount
	long		bicompression
	long		bisizeimage
	long		bixpelspermeter
	long		biypelspermeter
	long		biclrused
	long		biclrimportant
end type

type bitmapinfo from structure
	bitmapinfoheader		bmiheader
	unsignedlong		bmicolors[]
end type

global type u_cst_powerdock from userobject
integer width = 2158
integer height = 1108
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event panelexpanded ( integer panel )
event panelobjectdisplayed ( userobject panelobject )
event panelpinned ( integer panel )
event type integer documentselectionchanging ( integer olddocument,  integer newdocument )
event documentselectionchanged ( integer document )
event panelunpinned ( integer panel )
event panelmoved ( userobject a_object,  integer a_panel )
uo_powerdockpanelright uo_powerdockpanelright
uo_powerdockpanelleft uo_powerdockpanelleft
split_top split_top
split_right split_right
split_bottom split_bottom
split_left split_left
uo_powerdocktab uo_powerdocktab
uo_powerdockpaneltop uo_powerdockpaneltop
uo_powerdockpanelbottom uo_powerdockpanelbottom
st_1 st_1
inv_win32 inv_win32
end type
global u_cst_powerdock u_cst_powerdock

type prototypes



end prototypes

type variables
CONSTANT LONG TOP = 1
CONSTANT LONG BOTTOM = 2
CONSTANT LONG LEFT = 3
CONSTANT LONG RIGHT = 4

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

Long il_CurrentTheme, il_CurrentParentIndex

Window iw_parent
w_powerdockfloat iw_activefloatwindow
MDIClient mdi_1

Constant uint CF_BITMAP = 2
Constant long SRCCOPY = 13369376
Constant uint DIB_PAL_COLORS = 1
Constant uint DIB_RGB_COLORS = 0
Constant integer BITMAPTYPE = 19778

CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6

Long il_lastx
Long il_lasty
Boolean ib_capturefloat


Menu iWindowMenu
Int  iMenuCount

Boolean ib_allowpanelstoclose = TRUE
Boolean ib_allowpanelstomove = TRUE
end variables

forward prototypes
public function integer of_setdock (long al_panel, boolean ab_dock)
public function integer of_settheme (long al_color)
public function integer of_settheme (string as_color)
public function integer of_opendocument (ref userobject uo_object, string as_text, string as_image)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image)
public function integer of_closedocument (userobject auo_object)
public function integer of_opendocument (ref window uo_object, string as_text, string as_image)
public function integer of_closedocument (window auo_object)
public function integer of_activatedocument (userobject auo_object)
public function integer of_activatedocument (window auo_object)
public function integer of_setdocksize (long al_position, long al_size)
public function integer of_showdocker (long al_panel)
private function long of_getwindowtitleheight ()
public function string of_getdocumenttext (userobject auo_object)
public function string of_getdocumenttext (window auo_object)
public function integer of_setdocumenttext (userobject auo_object, string as_text)
public function integer of_setdocumenttext (window auo_object, string as_text)
public function integer of_setdockitemfocus (integer al_panel, long al_index)
public function integer of_closedockitem (userobject auo_object)
public function window of_getactivewindow ()
public function userobject of_getactiveobject ()
public function integer of_opendocument (ref window uo_object, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, powerobject apo_parm, string as_text, string as_image)
public function integer of_activedocumenttriggerevent (string as_event)
public function integer of_alldocumenttriggerevent (string as_event)
public function long of_getdocumentcount ()
private function integer of_getparentwindow ()
public function long of_getdockitempanel (userobject auo_object)
public function integer of_setmenu (menu a_menu)
public function integer of_refreshsubmenu ()
public function integer of_showmorewindows ()
public function integer of_activatedocument (long al_index)
public function integer of_closedocument (long al_index)
public function long of_getdocumentcollection (ref powerdockdocument pdd_documents[])
public function integer of_setdockitemfocus (userobject uo_object)
public function integer of_closealldocuments ()
public function integer of_refreshtabmenu (ref menu a_menu)
public function integer of_closeactivedocument ()
public function integer of_showclosebutton ()
public function integer of_framemoved ()
public function integer of_setdocumentvisible (userobject auo_object, boolean ab_visible)
public function integer of_setdocumentvisible (window auo_object, boolean ab_visible)
public function integer of_setdocumentenabled (userobject auo_object, boolean ab_enabled)
public function integer of_setdocumentenabled (window auo_object, boolean ab_enabled)
public function integer of_displayclosebuttonintab (boolean ab_switch)
public function window of_getdocumentwindow (integer index)
public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image, long al_parentindex)
public function integer of_showparentdocuments (long al_parentindex)
public function integer of_settabbackcolor (long al_backcolor)
public function integer of_setvistastyle (boolean ab_displayasvista)
public function integer of_hideclosebutton ()
public function integer of_displayclosebuttoninalltabs (boolean ab_switch)
public function integer of_adddockitem (long al_position, ref window auo_object, string as_text, string as_image)
public function integer of_closedockitem (window auo_object)
public function long of_getdockitempanel (window auo_object)
public function integer of_setdockitemfocus (window uo_object)
private function integer of_checkifundockisrequired (integer ai_position, u_cst_powerdockpanel auo_panel)
public function integer of_setdockitemtext (window auo_object, string as_text)
public function integer of_setdockitemtext (userobject auo_object, string as_text)
public function u_cst_tabcontrol of_getdocumenttabcontrol ()
public function integer of_activatecurrentdocument ()
public function integer of_opendocument (ref window uo_object, string as_type, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function integer of_opendocument (ref userobject uo_object, string as_type, string as_text, string as_image)
public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image, boolean ab_canclose)
public function boolean of_isdocumentfloating (window aw_window)
public function boolean of_isdocumentfloating (userobject auo_object)
public function integer of_allowpanelstoclose (boolean ab_switch)
public function integer of_setmdi (mdiclient a_mdiclient)
public function integer of_allowpanelstomove (boolean ab_switch)
public function long of_setbackcolor (long al_backcolor)
public function long of_getdocksize (integer al_position)
public function integer of_setfontname (string as_font)
public function boolean of_isdocked (long al_position)
end prototypes

event resize;Long ll_TitleBarHeight = 0
Long ll_splittopheight = 2
Long ll_splitbottomheight = 0
Long ll_splitleftwidth = 0
Long ll_splitrightwidth = 0

SetRedraw(FALSE)

ll_splittopheight = split_top.Height
ll_splitbottomheight = split_bottom.Height
ll_splitleftwidth = split_left.Width + 4
ll_splitrightwidth = split_right.Width + 4

split_top.Hide()
split_bottom.Hide()
split_left.Hide()
split_right.Hide()

IF uo_powerdockpaneltop.#Docked THEN split_top.Show()	
IF uo_powerdockpanelbottom.#Docked THEN split_bottom.Show()
IF uo_powerdockpanelleft.#Docked THEN split_left.Show()	
IF uo_powerdockpanelright.#Docked THEN split_right.Show()

IF uo_powerdockpaneltop.of_GetItemCount() = 0 THEN ll_splittopheight = 4	
IF uo_powerdockpanelbottom.of_GetItemCount() = 0 THEN ll_splitbottomheight = 4
IF uo_powerdockpanelleft.of_GetItemCount() = 0 THEN ll_splitleftwidth = 4	
IF uo_powerdockpanelright.of_GetItemCount() = 0 THEN ll_splitrightwidth = 4

uo_powerdockpaneltop.Width = Width
split_top.Y = uo_powerdockpaneltop.Height
split_top.Width = Width

uo_powerdockpanelbottom.Y = Height - uo_powerdockpanelbottom.Height - ll_TitleBarHeight
uo_powerdockpanelbottom.Width = Width
split_bottom.Y = uo_powerdockpanelbottom.Y - ll_splitbottomheight
split_bottom.Width = Width

split_left.X = uo_powerdockpanelleft.Width
uo_powerdocktab.Move(split_left.X + ll_splitleftwidth, split_top.Y + ll_splittopheight)

uo_powerdocktab.Resize(Width - uo_powerdockpanelleft.Width - uo_powerdockpanelright.Width - ll_splitleftwidth - ll_splitrightwidth, &
                       Height - uo_powerdockpaneltop.Height - uo_powerdockpanelbottom.Height - 5 - ll_splitbottomheight - ll_splittopheight)



split_right.Y = uo_powerdocktab.Y - 2
split_right.X = uo_powerdocktab.X + uo_powerdocktab.Width
split_right.Height = uo_powerdocktab.Height - 2
uo_powerdockpanelright.Y = uo_powerdocktab.Y - 2
uo_powerdockpanelright.X = split_right.X + ll_splitrightwidth
uo_powerdockpanelright.Height = uo_powerdocktab.Height

uo_powerdockpanelleft.Y = uo_powerdocktab.Y - 2
uo_powerdockpanelleft.Height = uo_powerdocktab.Height
split_left.Y = uo_powerdocktab.Y - 2
split_left.Height = uo_powerdocktab.Height

SetRedraw(TRUE)
end event

event type integer documentselectionchanging(integer olddocument, integer newdocument);return 0
end event

public function integer of_setdock (long al_panel, boolean ab_dock);IF ab_dock THEN
	CHOOSE CASE al_panel
		CASE TOP
			uo_powerdockpaneltop.of_Dock()
		CASE BOTTOM
			uo_powerdockpanelbottom.of_Dock()
		CASE LEFT
			uo_powerdockpanelleft.of_Dock()
		CASE RIGHT
			uo_powerdockpanelright.of_Dock()
	END CHOOSE
ELSE
	CHOOSE CASE al_panel
		CASE TOP
			uo_powerdockpaneltop.of_UnDock()
		CASE BOTTOM
			uo_powerdockpanelbottom.of_UnDock()
		CASE LEFT
			uo_powerdockpanelleft.of_UnDock()
		CASE RIGHT
			uo_powerdockpanelright.of_UnDock()
	END CHOOSE
END IF

TriggerEvent('Resize')

RETURN 1
end function

public function integer of_settheme (long al_color);Long ll_index, ll_loop

uo_powerdockpanelleft.of_SetTheme(al_color)
uo_powerdockpanelright.of_SetTheme(al_color)
uo_powerdockpaneltop.of_SetTheme(al_color)
uo_powerdockpanelbottom.of_SetTheme(al_color)
uo_powerdocktab.of_SetTheme(al_color)

of_SetBackcolor(al_color)

il_CurrentTheme = al_color

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settheme (string as_color);CHOOSE CASE Upper(as_color)
	CASE 'BLUE'
		of_SetTheme(BLUE)
	CASE 'SILVER'
		of_SetTheme(SILVER)
	CASE 'OLIVE'
		of_SetTheme(OLIVE)
	CASE 'CLASSIC'
		of_SetTheme(CLASSIC)
	CASE 'DEFAULT'
		of_SetTheme(DEFAULT)
	CASE ELSE
		of_SetTheme(CLASSIC)
END CHOOSE
		
RETURN 1
end function

public function integer of_opendocument (ref userobject uo_object, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, po, as_text, as_image)
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image);RETURN of_AddDockItem(al_position, auo_object, as_text, as_image, TRUE)
end function

public function integer of_closedocument (userobject auo_object);of_RefreshSubMenu()
RETURN uo_powerdocktab.of_CloseTab(auo_object)
end function

public function integer of_opendocument (ref window uo_object, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, po, as_text, as_image)
end function

public function integer of_closedocument (window auo_object);of_RefreshSubMenu()
RETURN uo_powerdocktab.of_CloseTab(auo_object)
end function

public function integer of_activatedocument (userobject auo_object);RETURN uo_powerdocktab.of_SelectTab(auo_object)
end function

public function integer of_activatedocument (window auo_object);RETURN uo_powerdocktab.of_SelectTab(auo_object)
end function

public function integer of_setdocksize (long al_position, long al_size);CHOOSE CASE al_position
	CASE TOP
		uo_powerdockpaneltop.ll_height = al_size
		IF uo_powerdockpaneltop.#Docked THEN uo_powerdockpaneltop.Height = al_size
	CASE BOTTOM
		uo_powerdockpanelbottom.ll_height = al_size
		IF uo_powerdockpanelbottom.#Docked THEN uo_powerdockpanelbottom.Height = al_size
	CASE LEFT
		uo_powerdockpanelleft.ll_width = al_size
		IF uo_powerdockpanelleft.#Docked THEN uo_powerdockpanelleft.Width = al_size
	CASE RIGHT
		uo_powerdockpanelright.ll_width = al_size
		IF uo_powerdockpanelright.#Docked THEN uo_powerdockpanelright.Width = al_size
END CHOOSE

TriggerEvent("Resize")

RETURN 1
end function

public function integer of_showdocker (long al_panel);Open(w_powerdockdocker)

w_powerdockdocker.Move(iw_parent. X + THIS.X + 15, iw_parent. Y + THIS.Y + of_GetWindowTitleHeight())

w_powerdockdocker.Resize(THIS.Width, THIS.Height)
w_powerdockdocker.of_Resize()

w_powerdockdocker.il_clickedpanel = al_panel

inv_win32.SetCapture(Handle(w_powerdockdocker))

//w_powerdockdocker.of_SetTheme(il_currenttheme)
w_powerdockdocker.iuo_parent = THIS

w_powerdockdocker.POST Show()

RETURN 1
end function

private function long of_getwindowtitleheight ();Long ll_height

ll_height = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYCAPTION), YPixelsToUnits!)

ll_height += 90

RETURN ll_height
end function

public function string of_getdocumenttext (userobject auo_object);RETURN uo_powerdocktab.of_GetText(auo_object)
end function

public function string of_getdocumenttext (window auo_object);RETURN uo_powerdocktab.of_GetText(auo_object)
end function

public function integer of_setdocumenttext (userobject auo_object, string as_text);RETURN uo_powerdocktab.of_SetText(auo_object, as_text)

end function

public function integer of_setdocumenttext (window auo_object, string as_text);RETURN uo_powerdocktab.of_SetText(auo_object, as_text)

end function

public function integer of_setdockitemfocus (integer al_panel, long al_index);CHOOSE CASE al_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(al_index)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(al_index)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(al_index)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(al_index)
END CHOOSE

RETURN 1
end function

public function integer of_closedockitem (userobject auo_object);uo_powerdockpaneltop.of_CloseItem(auo_object)
uo_powerdockpanelbottom.of_CloseItem(auo_object)
uo_powerdockpanelleft.of_CloseItem(auo_object)
uo_powerdockpanelright.of_CloseItem(auo_object)

of_CheckIfUndockIsRequired(TOP, uo_powerdockpaneltop)
of_CheckIfUndockIsRequired(BOTTOM, uo_powerdockpanelbottom)
of_CheckIfUndockIsRequired(LEFT, uo_powerdockpanelleft)
of_CheckIfUndockIsRequired(RIGHT, uo_powerdockpanelright)

TriggerEvent("resize")

RETURN 1
end function

public function window of_getactivewindow ();Boolean lb_done
Long ll_parent, ll_hdl1, ll_hdl2
Window lw_window1, lw_window2

ll_parent = Handle(GetFocus())

lw_window1 = uo_powerdocktab.of_GetWindow(uo_powerdocktab.of_GetSelectedTab())
IF IsValid(iw_activefloatwindow) THEN lw_window2 = iw_activefloatwindow.of_GetChildWindow()


IF IsValid(lw_window1) THEN ll_hdl1 = Handle(lw_window1)
IF IsValid(lw_window2) THEN ll_hdl2 = Handle(lw_window2)

DO UNTIL lb_done

	IF ll_parent <= 0 THEN
		EXIT
	END IF

	IF ll_parent = ll_hdl1 THEN RETURN lw_window1
	IF ll_parent = ll_hdl2 THEN RETURN lw_window2
	
	ll_parent = inv_win32.GetParent(ll_parent)
LOOP

RETURN uo_powerdocktab.of_GetWindow(uo_powerdocktab.of_GetSelectedTab())
end function

public function userobject of_getactiveobject ();Boolean lb_done
Long ll_parent, ll_hdl1, ll_hdl2
UserObject luo1, luo2

ll_parent = Handle(GetFocus())

luo1 = uo_powerdocktab.of_GetObject(uo_powerdocktab.of_GetSelectedTab())
IF IsValid(iw_activefloatwindow) THEN luo2 = iw_activefloatwindow.of_GetChildObject()


IF IsValid(luo1) THEN ll_hdl1 = Handle(luo1)
IF IsValid(luo2) THEN ll_hdl2 = Handle(luo2)

DO UNTIL lb_done

	IF ll_parent <= 0 THEN
		EXIT
	END IF

	IF ll_parent = ll_hdl1 THEN RETURN luo1
	IF ll_parent = ll_hdl2 THEN RETURN luo2
	
	ll_parent = inv_win32.GetParent(ll_parent)
LOOP

RETURN uo_powerdocktab.of_GetObject(uo_powerdocktab.of_GetSelectedTab())
end function

public function integer of_opendocument (ref window uo_object, powerobject apo_parm, string as_text, string as_image);RETURN of_OpenDocument(uo_object, "", apo_parm, as_text, as_image)
end function

public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

//of_RefreshSubMenu()

of_ShowCloseButton()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

//of_RefreshSubMenu()

of_ShowCloseButton()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_activedocumenttriggerevent (string as_event);Window l_window
UserObject l_object

l_window = of_GetActiveWindow()

IF IsValid(l_window) THEN
	l_window.TriggerEvent(as_event)
	RETURN 1
END IF

l_object = of_GetActiveObject()

IF IsValid(l_object) THEN
	l_object.TriggerEvent(as_event)
	RETURN 2
END IF

RETURN 0


end function

public function integer of_alldocumenttriggerevent (string as_event);Window l_window
UserObject l_object
Long ll_index, ll_count

ll_count = uo_powerdocktab.of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = uo_powerdocktab.of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		l_window.TriggerEvent(as_event)
	
	ELSE
		l_object = uo_powerdocktab.of_GetObject(ll_index)
		
		IF IsValid(l_object) THEN
			l_object.TriggerEvent(as_event)
		END IF
	END IF
	
NEXT

RETURN 0


end function

public function long of_getdocumentcount ();RETURN uo_powerdocktab.of_GetTabCount()
end function

private function integer of_getparentwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

iw_parent = lw_window

RETURN 1
end function

public function long of_getdockitempanel (userobject auo_object);IF Len(Trim(uo_powerdockpaneltop.of_GetText(auo_object))) > 0 THEN
	RETURN TOP
ELSEIF Len(Trim(uo_powerdockpanelbottom.of_GetText(auo_object))) > 0 THEN
	RETURN BOTTOM
ELSEIF Len(Trim(uo_powerdockpanelleft.of_GetText(auo_object))) > 0 THEN
	RETURN LEFT
ELSEIF Len(Trim(uo_powerdockpanelright.of_GetText(auo_object))) > 0 THEN
	RETURN RIGHT
END IF
	
RETURN 0
end function

public function integer of_setmenu (menu a_menu);iWindowMenu = a_menu
iMenuCount = UpperBound(a_menu.Item)

RETURN 1
end function

public function integer of_refreshsubmenu ();//Long ll_index, ll_count, ll_start
//Boolean lb_morewindows
//m_powerdockmenu lm_newmenus[]
//Menu lm_ExistingMenu[]
//
//IF NOT IsValid(iWindowMenu) THEN RETURN 0
//
//ll_count = uo_powerdocktab.of_GetTabCount()
//
//IF ll_count > 9 THEN
//	lb_morewindows = TRUE
//	ll_count = 8
//END IF
//
//FOR ll_index = 1 TO ll_count
//
//	lm_newmenus[ll_index] = CREATE m_powerdockmenu
//	lm_newmenus[ll_index].Text = String(ll_index) + "  " + uo_powerdocktab.of_GetText(ll_index)
//	lm_newmenus[ll_index].iuo_parent = THIS
//	lm_newmenus[ll_index].il_index = ll_index
//	
//	IF uo_powerdocktab.of_GetSelectedTab() = ll_index THEN
//		lm_newmenus[ll_index].Checked = TRUE
//	END IF
//
//NEXT
//
////Clean-Up Dynamic menu items
//ll_count = UpperBound(iWindowMenu.Item)
//FOR ll_index = ll_count TO iMenuCount + 1 STEP -1
//	DESTROY iWindowMenu.Item[ll_index]
//NEXT
//
//ll_start = iMenuCount
//
////Add Separator
//IF UpperBound(lm_newmenus) > 0 THEN
//	Menu lMenuSep	
//	lMenuSep = CREATE Menu
//	lMenuSep.Text = "-"
//	ll_start++
//	iWindowMenu.Item[ll_start] = lMenuSep
//END IF
//
////Add Dynamic Menu Items
//ll_count = UpperBound(lm_newmenus)
//FOR ll_index = 1 TO ll_count
//	ll_start++
//	iWindowMenu.Item[ll_start] = lm_newmenus[ll_index]
//NEXT
//
//IF lb_morewindows THEN
//	
//	m_powerdockmenu lMenuMore	
//	lMenuMore = CREATE m_powerdockmenu
//	lMenuMore.Text = "More Windows..."
//	lMenuMore.iuo_parent = THIS
//	lMenuMore.ib_morewindows = TRUE
//	ll_start++
//	iWindowMenu.Item[ll_start] = lMenuMore
//	
//END IF
//
//iWindowMenu.Hide()
//iWindowMenu.Show()

RETURN 1
end function

public function integer of_showmorewindows ();OpenWithParm(w_powerdockdocumentselector, uo_powerdocktab)

RETURN 1
end function

public function integer of_activatedocument (long al_index);RETURN uo_powerdocktab.of_SelectTab(al_index)
end function

public function integer of_closedocument (long al_index);Long ll_return

ll_return = uo_powerdocktab.of_CloseTab(al_index)
of_RefreshSubMenu()
of_ShowCloseButton()

THIS.SetFocus()

RETURN ll_return
end function

public function long of_getdocumentcollection (ref powerdockdocument pdd_documents[]);Long ll_index, ll_count
PowerDockDocument pdd_NewDoc

ll_count = UpperBound(uo_powerdocktab.ist_tabs)

FOR ll_index = 1 TO ll_count
	pdd_Documents[ll_index].text = uo_powerdocktab.of_GetText(ll_index)
	pdd_Documents[ll_index].window = uo_powerdocktab.of_GetWindow(ll_index)
	pdd_Documents[ll_index].userobject = uo_powerdocktab.of_GetObject(ll_index)
	
	IF IsValid(pdd_Documents[ll_index].window) THEN
		pdd_Documents[ll_index].IsWindow = TRUE
	END IF
NEXT

RETURN ll_count
end function

public function integer of_setdockitemfocus (userobject uo_object);Long ll_panel

ll_panel = of_GetDockItemPanel(uo_object)

CHOOSE CASE ll_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(uo_object)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(uo_object)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(uo_object)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(uo_object)
END CHOOSE

RETURN 1
end function

public function integer of_closealldocuments ();Long ll_index, ll_count

SetRedraw(FALSE)

ll_count = of_GetDocumentCount()

FOR ll_index = ll_count TO 1 STEP - 1
	IF of_CloseDocument(ll_index) = 0 THEN
		of_RefreshSubMenu()
		SetRedraw(TRUE)
		RETURN 0
	END IF
NEXT

of_RefreshSubMenu()

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_refreshtabmenu (ref menu a_menu);Long ll_index, ll_count, ll_start, lm_MenuCount
Boolean lb_morewindows
m_powerdockmenu lm_newmenus[]
Menu lm_ExistingMenu[]

IF NOT IsValid(a_menu) THEN RETURN 0

lm_MenuCount = UpperBound(a_menu.Item)
ll_count = uo_powerdocktab.of_GetTabCount()

IF ll_count > 9 THEN
	lb_morewindows = TRUE
	ll_count = 8
END IF

FOR ll_index = 1 TO ll_count

	lm_newmenus[ll_index] = CREATE m_powerdockmenu
	lm_newmenus[ll_index].Text = String(ll_index) + "  " + uo_powerdocktab.of_GetText(ll_index)
	lm_newmenus[ll_index].iuo_parent = uo_powerdocktab
	lm_newmenus[ll_index].il_index = ll_index
	
	IF uo_powerdocktab.of_GetSelectedTab() = ll_index THEN
		lm_newmenus[ll_index].Checked = TRUE
	END IF

NEXT

//Clean-Up Dynamic menu items
ll_count = UpperBound(a_menu.Item)
FOR ll_index = ll_count TO lm_MenuCount + 1 STEP -1
	DESTROY a_menu.Item[ll_index]
NEXT

ll_start = lm_MenuCount

//Add Separator
IF UpperBound(lm_newmenus) > 0 THEN
	Menu lMenuSep	
	lMenuSep = CREATE Menu
	lMenuSep.Text = "-"
	ll_start++
	a_menu.Item[ll_start] = lMenuSep
END IF

//Add Dynamic Menu Items
ll_count = UpperBound(lm_newmenus)
FOR ll_index = 1 TO ll_count
	ll_start++
	a_menu.Item[ll_start] = lm_newmenus[ll_index]
NEXT

IF lb_morewindows THEN
	
	m_powerdockmenu lMenuMore	
	lMenuMore = CREATE m_powerdockmenu
	lMenuMore.Text = "More Windows..."
	lMenuMore.iuo_parent = uo_powerdocktab
	lMenuMore.ib_morewindows = TRUE
	ll_start++
	a_menu.Item[ll_start] = lMenuMore
	
END IF

a_menu.Hide()
a_menu.Show()

RETURN 1
end function

public function integer of_closeactivedocument ();RETURN of_CloseDocument(uo_powerdocktab.of_GetSelectedTab())
end function

public function integer of_showclosebutton ();uo_powerdocktab.of_ShowCloseButton()

RETURN 1
end function

public function integer of_framemoved ();of_ShowCloseButton()

RETURN 1
end function

public function integer of_setdocumentvisible (userobject auo_object, boolean ab_visible);RETURN uo_powerdocktab.of_SetVisible(auo_object, ab_visible)

end function

public function integer of_setdocumentvisible (window auo_object, boolean ab_visible);RETURN uo_powerdocktab.of_SetVisible(auo_object, ab_visible)

end function

public function integer of_setdocumentenabled (userobject auo_object, boolean ab_enabled);RETURN uo_powerdocktab.of_SetEnabled(auo_object, ab_enabled)

end function

public function integer of_setdocumentenabled (window auo_object, boolean ab_enabled);RETURN uo_powerdocktab.of_SetEnabled(auo_object, ab_enabled)

end function

public function integer of_displayclosebuttonintab (boolean ab_switch);
uo_powerdocktab.of_DisplayCloseButtonInTab(ab_switch)

RETURN 1
end function

public function window of_getdocumentwindow (integer index);RETURN uo_powerdocktab.of_GetWindow(index)
end function

public function integer of_opendocument (ref window uo_object, string as_type, powerobject apo_parm, string as_text, string as_image, long al_parentindex);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image, al_parentindex)
uo_powerdocktab.of_SelectTab(ll_tab)
uo_object.SetFocus()

//of_RefreshSubMenu()

of_ShowCloseButton()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_showparentdocuments (long al_parentindex);il_CurrentParentIndex = al_parentindex

uo_powerdocktab.of_showparenttabs(al_parentindex)

RETURN 1
end function

public function integer of_settabbackcolor (long al_backcolor);RETURN uo_powerdocktab.of_SetBackcolor(al_backcolor)
end function

public function integer of_setvistastyle (boolean ab_displayasvista);uo_powerdocktab.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpaneltop.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelleft.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)
uo_powerdockpanelright.uo_paneltabcontrol.of_SetVistaStyle(ab_displayasvista)

RETURN 1
end function

public function integer of_hideclosebutton ();DO WHILE Yield()
LOOP

uo_powerdocktab.of_DisplayCloseButtonInTab(FALSE)
uo_powerdocktab.of_HideCloseButton()

RETURN 1
end function

public function integer of_displayclosebuttoninalltabs (boolean ab_switch);
uo_powerdocktab.of_DisplayCloseButtonInAllTabs(ab_switch)

RETURN 1
end function

public function integer of_adddockitem (long al_position, ref window auo_object, string as_text, string as_image);
CHOOSE CASE al_position
	CASE TOP
			
		IF NOT uo_powerdockpaneltop.#Docked THEN
			split_top.Hide()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.uo_paneltoolbarstrip.Height
		ELSE
			split_top.Show()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.ll_height
		END IF
		
		uo_powerdockpaneltop.of_AddItem(auo_object, as_text, as_image)
	CASE BOTTOM
			
		IF NOT uo_powerdockpanelbottom.#Docked THEN
			split_bottom.Hide()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.uo_paneltoolbarstrip.Height
		ELSE
			split_bottom.Show()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.ll_height
		END IF
		
		uo_powerdockpanelbottom.of_AddItem(auo_object, as_text, as_image)
	CASE LEFT
			
		IF NOT uo_powerdockpanelleft.#Docked THEN
			split_left.Hide()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.uo_paneltoolbarstrip.Width
		ELSE
			split_left.Show()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.ll_Width
		END IF
		
		uo_powerdockpanelleft.of_AddItem(auo_object, as_text, as_image)
	CASE RIGHT
			
		IF NOT uo_powerdockpanelright.#Docked THEN
			split_right.Hide()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.uo_paneltoolbarstrip.Width
		ELSE
			split_right.Show()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.ll_Width
		END IF
		
		uo_powerdockpanelright.of_AddItem(auo_object, as_text, as_image)
END CHOOSE

THIS.TriggerEvent("Resize")

RETURN 1
end function

public function integer of_closedockitem (window auo_object);uo_powerdockpaneltop.of_CloseItem(auo_object)
uo_powerdockpanelbottom.of_CloseItem(auo_object)
uo_powerdockpanelleft.of_CloseItem(auo_object)
uo_powerdockpanelright.of_CloseItem(auo_object)

of_CheckIfUndockIsRequired(TOP, uo_powerdockpaneltop)
of_CheckIfUndockIsRequired(BOTTOM, uo_powerdockpanelbottom)
of_CheckIfUndockIsRequired(LEFT, uo_powerdockpanelleft)
of_CheckIfUndockIsRequired(RIGHT, uo_powerdockpanelright)

TriggerEvent("resize")

RETURN 1
end function

public function long of_getdockitempanel (window auo_object);IF Len(Trim(uo_powerdockpaneltop.of_GetText(auo_object))) > 0 THEN
	RETURN TOP
ELSEIF Len(Trim(uo_powerdockpanelbottom.of_GetText(auo_object))) > 0 THEN
	RETURN BOTTOM
ELSEIF Len(Trim(uo_powerdockpanelleft.of_GetText(auo_object))) > 0 THEN
	RETURN LEFT
ELSEIF Len(Trim(uo_powerdockpanelright.of_GetText(auo_object))) > 0 THEN
	RETURN RIGHT
END IF
	
RETURN 0
end function

public function integer of_setdockitemfocus (window uo_object);Long ll_panel

ll_panel = of_GetDockItemPanel(uo_object)

CHOOSE CASE ll_panel
	CASE TOP
		uo_powerdockpaneltop.of_SetFocus(uo_object)
	CASE BOTTOM
		uo_powerdockpanelbottom.of_SetFocus(uo_object)
	CASE LEFT
		uo_powerdockpanelleft.of_SetFocus(uo_object)
	CASE RIGHT
		uo_powerdockpanelright.of_SetFocus(uo_object)
END CHOOSE

RETURN 1
end function

private function integer of_checkifundockisrequired (integer ai_position, u_cst_powerdockpanel auo_panel);IF auo_panel.of_GetItemCount() = 0 THEN
	auo_panel.#Docked = FALSE
	auo_panel.inv_timer.Stop()
	auo_panel.of_Undock()
				
	CHOOSE CASE ai_position
		CASE TOP, BOTTOM
				auo_panel.Height = 0
		CASE LEFT, RIGHT
				auo_panel.Width = 0
	END CHOOSE
END IF

RETURN 1
end function

public function integer of_setdockitemtext (window auo_object, string as_text);uo_powerdockpaneltop.of_SetText(auo_object, as_text)
uo_powerdockpanelbottom.of_SetText(auo_object, as_text)
uo_powerdockpanelleft.of_SetText(auo_object, as_text)
uo_powerdockpanelright.of_SetText(auo_object, as_text)


RETURN 1

end function

public function integer of_setdockitemtext (userobject auo_object, string as_text);uo_powerdockpaneltop.of_SetText(auo_object, as_text)
uo_powerdockpanelbottom.of_SetText(auo_object, as_text)
uo_powerdockpanelleft.of_SetText(auo_object, as_text)
uo_powerdockpanelright.of_SetText(auo_object, as_text)


RETURN 1

end function

public function u_cst_tabcontrol of_getdocumenttabcontrol ();RETURN uo_powerdocktab
end function

public function integer of_activatecurrentdocument ();uo_powerdocktab.of_SelectTab(uo_powerdocktab.il_selected)

RETURN 1
end function

public function integer of_opendocument (ref window uo_object, string as_type, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, as_type, po, as_text, as_image)
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_image
Long ll_tab

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_powerdocktab.of_AddImage(as_image)
END IF

ll_tab = uo_powerdocktab.of_OpenTab(uo_object, as_type, apo_parm, as_text, ll_image)
uo_powerdocktab.of_SelectTab(ll_tab)

//of_RefreshSubMenu()

of_ShowCloseButton()

DO
LOOP WHILE Yield()

RETURN ll_tab
end function

public function integer of_opendocument (ref userobject uo_object, string as_type, string as_text, string as_image);PowerObject po

RETURN of_OpenDocument(uo_object, as_type, po, as_text, as_image)
end function

public function integer of_adddockitem (long al_position, ref userobject auo_object, string as_text, string as_image, boolean ab_canclose);
IF NOT IsValid(auo_object) THEN
	iw_parent.OpenUserObject(auo_object)
END IF

CHOOSE CASE al_position
	CASE TOP
			
		IF NOT uo_powerdockpaneltop.#Docked THEN
			split_top.Hide()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.uo_paneltoolbarstrip.Height
		ELSE
			split_top.Show()
			uo_powerdockpaneltop.Height = uo_powerdockpaneltop.ll_height
		END IF
		
		uo_powerdockpaneltop.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE BOTTOM
			
		IF NOT uo_powerdockpanelbottom.#Docked THEN
			split_bottom.Hide()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.uo_paneltoolbarstrip.Height
		ELSE
			split_bottom.Show()
			uo_powerdockpanelbottom.Height = uo_powerdockpanelbottom.ll_height
		END IF
		
		uo_powerdockpanelbottom.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE LEFT
			
		IF NOT uo_powerdockpanelleft.#Docked THEN
			split_left.Hide()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.uo_paneltoolbarstrip.Width
		ELSE
			split_left.Show()
			uo_powerdockpanelleft.Width = uo_powerdockpanelleft.ll_Width
		END IF
		
		uo_powerdockpanelleft.of_AddItem(auo_object, as_text, as_image, ab_canclose)
	CASE RIGHT
			
		IF NOT uo_powerdockpanelright.#Docked THEN
			split_right.Hide()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.uo_paneltoolbarstrip.Width
		ELSE
			split_right.Show()
			uo_powerdockpanelright.Width = uo_powerdockpanelright.ll_Width
		END IF
		
		uo_powerdockpanelright.of_AddItem(auo_object, as_text, as_image, ab_canclose)
END CHOOSE

THIS.TriggerEvent("Resize")

RETURN 1
end function

public function boolean of_isdocumentfloating (window aw_window);RETURN uo_powerdocktab.of_IsTabFloating(aw_window)
end function

public function boolean of_isdocumentfloating (userobject auo_object);RETURN uo_powerdocktab.of_IsTabFloating(auo_object)
end function

public function integer of_allowpanelstoclose (boolean ab_switch);ib_allowpanelstoclose = ab_switch

RETURN 1
end function

public function integer of_setmdi (mdiclient a_mdiclient);mdi_1 = a_mdiclient
uo_powerdocktab.Visible = FALSE

mdi_1.BringToTop = TRUE


RETURN 1
end function

public function integer of_allowpanelstomove (boolean ab_switch);ib_allowpanelstomove = ab_switch
RETURN 1
end function

public function long of_setbackcolor (long al_backcolor);split_left.of_SetBarColor(al_backcolor)
split_right.of_SetBarColor(al_backcolor)
split_top.of_SetBarColor(al_backcolor)
split_bottom.of_SetBarColor(al_backcolor)

uo_powerdockpanelleft.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpanelright.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpaneltop.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)
uo_powerdockpanelbottom.uo_paneltabcontrol.of_SetBackcolor(al_backcolor)


THIS.Backcolor = al_backcolor

RETURN uo_powerdocktab.of_SetBackcolor(al_backcolor)
end function

public function long of_getdocksize (integer al_position);CHOOSE CASE al_position
	CASE TOP
		RETURN uo_powerdockpaneltop.of_GetHeight()
	CASE BOTTOM
		RETURN uo_powerdockpanelbottom.of_GetHeight()
	CASE LEFT
		RETURN uo_powerdockpanelleft.of_GetWidth()
	CASE RIGHT
		RETURN uo_powerdockpanelright.of_GetWidth()
END CHOOSE

RETURN 0
end function

public function integer of_setfontname (string as_font);uo_powerdocktab.of_SetFontName(as_font)
uo_powerdockpanelright.of_SetFontName(as_font)
uo_powerdockpanelleft.of_SetFontName(as_font)
uo_powerdockpaneltop.of_SetFontName(as_font)
uo_powerdockpanelbottom.of_SetFontName(as_font)

RETURN 1
end function

public function boolean of_isdocked (long al_position);CHOOSE CASE al_position
	CASE TOP
		RETURN uo_powerdockpaneltop.of_IsDocked()
	CASE BOTTOM
		RETURN uo_powerdockpanelbottom.of_IsDocked()
	CASE LEFT
		RETURN uo_powerdockpanelleft.of_IsDocked()
	CASE RIGHT
		RETURN uo_powerdockpanelright.of_IsDocked()
END CHOOSE

RETURN FALSE
end function

on u_cst_powerdock.create
this.uo_powerdockpanelright=create uo_powerdockpanelright
this.uo_powerdockpanelleft=create uo_powerdockpanelleft
this.split_top=create split_top
this.split_right=create split_right
this.split_bottom=create split_bottom
this.split_left=create split_left
this.uo_powerdocktab=create uo_powerdocktab
this.uo_powerdockpaneltop=create uo_powerdockpaneltop
this.uo_powerdockpanelbottom=create uo_powerdockpanelbottom
this.st_1=create st_1
this.inv_win32=create inv_win32
this.Control[]={this.uo_powerdockpanelright,&
this.uo_powerdockpanelleft,&
this.split_top,&
this.split_right,&
this.split_bottom,&
this.split_left,&
this.uo_powerdocktab,&
this.uo_powerdockpaneltop,&
this.uo_powerdockpanelbottom,&
this.st_1}
end on

on u_cst_powerdock.destroy
destroy(this.uo_powerdockpanelright)
destroy(this.uo_powerdockpanelleft)
destroy(this.split_top)
destroy(this.split_right)
destroy(this.split_bottom)
destroy(this.split_left)
destroy(this.uo_powerdocktab)
destroy(this.uo_powerdockpaneltop)
destroy(this.uo_powerdockpanelbottom)
destroy(this.st_1)
destroy(this.inv_win32)
end on

event constructor;st_1.Hide()

of_GetParentWindow()

uo_powerdocktab.of_HideCloseButton()
uo_powerdocktab.of_SetStyle(uo_powerdocktab.VS2005)
uo_powerdocktab.of_SetTabPosition(uo_powerdocktab.TOP)

uo_powerdocktab.of_ShowChevron()
uo_powerdocktab.POST of_DisplayCloseButtonInAllTabs(TRUE)

uo_powerdockpanelright.iuo_parent = THIS
uo_powerdockpanelleft.iuo_parent = THIS
uo_powerdockpaneltop.iuo_parent = THIS
uo_powerdockpanelbottom.iuo_parent = THIS

end event

event destructor;of_CloseAllDocuments()
end event

type uo_powerdockpanelright from u_cst_powerdockpanel within u_cst_powerdock
integer x = 1449
integer y = 340
integer width = 0
integer height = 432
integer taborder = 30
long #orientation = 4
end type

on uo_powerdockpanelright.destroy
call u_cst_powerdockpanel::destroy
end on

type uo_powerdockpanelleft from u_cst_powerdockpanel within u_cst_powerdock
integer y = 340
integer width = 0
integer height = 432
integer taborder = 30
long #orientation = 3
end type

on uo_powerdockpanelleft.destroy
call u_cst_powerdockpanel::destroy
end on

type split_top from u_cst_splitbar within u_cst_powerdock
integer y = 328
integer width = 2158
integer height = 12
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpaneltop, THIS.ABOVE)
THIS.of_Register(uo_powerdocktab, THIS.BELOW)
THIS.of_Register(uo_powerdockpanelleft, THIS.BELOW)
THIS.of_Register(uo_powerdockpanelright, THIS.BELOW)
THIS.of_Register(split_right, THIS.BELOW)
THIS.of_Register(split_left, THIS.BELOW)
end event

type split_right from u_cst_splitbar within u_cst_powerdock
integer x = 1435
integer y = 340
integer width = 14
integer height = 432
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelright, THIS.RIGHT)
THIS.of_Register(uo_powerdocktab, THIS.LEFT)
end event

type split_bottom from u_cst_splitbar within u_cst_powerdock
integer y = 768
integer width = 2158
integer height = 12
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelbottom, THIS.BELOW)
THIS.of_Register(uo_powerdocktab, THIS.ABOVE)
THIS.of_Register(uo_powerdockpanelleft, THIS.ABOVE)
THIS.of_Register(uo_powerdockpanelright, THIS.ABOVE)
THIS.of_Register(split_right, THIS.ABOVE)
THIS.of_Register(split_left, THIS.ABOVE)
end event

type split_left from u_cst_splitbar within u_cst_powerdock
integer x = 690
integer y = 340
integer width = 14
integer height = 432
end type

event constructor;call super::constructor;THIS.of_Register(uo_powerdockpanelleft, THIS.LEFT)
THIS.of_Register(uo_powerdocktab, THIS.RIGHT)
end event

type uo_powerdocktab from u_cst_tabcontrol within u_cst_powerdock
integer x = 704
integer y = 340
integer width = 731
integer height = 432
integer taborder = 20
boolean ib_allowtabdrag = true
end type

on uo_powerdocktab.destroy
call u_cst_tabcontrol::destroy
end on

event selectionchanged;call super::selectionchanged;PARENT.of_RefreshSubMenu()
PARENT.EVENT DocumentSelectionChanged(newindex)
end event

event rightclicked;call super::rightclicked;m_powerdocktabmenu m_tabmenu

m_tabmenu = CREATE m_powerdocktabmenu

m_tabmenu.il_index = index
m_tabmenu.iuo_parent = uo_powerdocktab

uo_powerdocktab.of_RefreshTabMenu(m_tabmenu)

m_tabmenu.PopMenu(iw_parent.PointerX(),iw_parent.PointerY())
end event

event selectionchanging;call super::selectionchanging;RETURN PARENT.EVENT DocumentSelectionChanging(oldindex, newindex)
end event

event ue_movetofloatingwindow;call super::ue_movetofloatingwindow;Long ll_selected, ll_x, ll_y
String ls_text
w_powerdockfloat lw_window
UserObject luo
Window lw

Open(lw_window)

luo = uo_powerdocktab.of_GetObject(uo_powerdocktab.il_selected)
lw = uo_powerdocktab.of_GetWindow(uo_powerdocktab.il_selected)
ls_text = uo_powerdocktab.of_GetText(uo_powerdocktab.il_selected)

IF IsValid(luo) THEN
	luo.Hide()
	of_DetachTab(luo, lw_window)
	
	lw_window.Resize(luo.Width, luo.Height)	
	lw_window.of_AddObject(ls_text, luo)
END IF

IF IsValid(lw) THEN
	lw.Hide()
	of_DetachTab(lw, lw_window)
	
	lw_window.Resize(lw.Width, lw.Height)
	lw_window.of_AddObject(ls_text, lw)
END IF

lw_window.of_SetPowerDock(PARENT)
lw_window.of_SetParentWindow(uo_powerdocktab.iw_parent)
lw_window.of_SetTheme(il_CurrentTheme)

lw_window.Post of_Move(PARENT.X + THIS.X, THIS.Y)
lw_window.Post Show()
lw_window.PostEvent('Activate')
end event

event resize;call super::resize;IF IsValid(PARENT.mdi_1) THEN
	PARENT.mdi_1.Move(PARENT.X + THIS.X, PARENT.Y + THIS.Y)

	PARENT.mdi_1.Resize(NewWidth, NewHeight)
END IF
end event

type uo_powerdockpaneltop from u_cst_powerdockpanel within u_cst_powerdock
integer width = 2158
integer height = 0
integer taborder = 20
boolean bringtotop = true
long #orientation = 1
end type

on uo_powerdockpaneltop.destroy
call u_cst_powerdockpanel::destroy
end on

type uo_powerdockpanelbottom from u_cst_powerdockpanel within u_cst_powerdock
integer y = 780
integer width = 2158
integer height = 0
integer taborder = 10
boolean bringtotop = true
long #orientation = 2
end type

on uo_powerdockpanelbottom.destroy
call u_cst_powerdockpanel::destroy
end on

type st_1 from statictext within u_cst_powerdock
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerDock"
boolean focusrectangle = false
end type

type inv_win32 from n_cst_win32 within u_cst_powerdock descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

