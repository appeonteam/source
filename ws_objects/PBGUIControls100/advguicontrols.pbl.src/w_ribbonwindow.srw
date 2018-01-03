$PBExportHeader$w_ribbonwindow.srw
forward
global type w_ribbonwindow from window
end type
type uo_ribbonmenu from u_cst_ribbonmenu within w_ribbonwindow
end type
type uo_ribbon from u_cst_ribboncontainer within w_ribbonwindow
end type
type inv_win32 from n_cst_win32 within w_ribbonwindow
end type
end forward

global type w_ribbonwindow from window
integer width = 3959
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean toolbarvisible = false
boolean center = true
event ribbonmenuclicked ( string as_command )
uo_ribbonmenu uo_ribbonmenu
uo_ribbon uo_ribbon
inv_win32 inv_win32
end type
global w_ribbonwindow w_ribbonwindow

type variables
Boolean DisplayQuickAccessUnderRibbon

Private:

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
end variables

forward prototypes
private function integer of_hidemenu ()
public function integer workspaceheight ()
public function integer workspacey ()
private function integer of_buildribbon ()
private function string of_convertkeytoletter (keycode akc_key)
public function boolean of_isribbondocked ()
public function integer of_undockribbon ()
public function integer workspacewidth ()
public function integer workspacex ()
public function string of_removeampersand (string as_text)
public function integer of_buildquickaccess ()
public function integer of_rebuildribbon ()
public function integer changemenu (ref menu m)
public function integer changemenu (ref menu m, integer w)
public function integer of_settheme (string as_theme)
public function integer of_displayprogramtab (string as_image)
public function u_cst_ribbonmenu of_ribbonmenu ()
end prototypes

private function integer of_hidemenu ();Menu l_menu
Long ll_index

IF IsValid(THIS.menuId) THEN
	l_menu= THIS.menuId
	l_menu.visible = FALSE
	
	FOR ll_index = 1 TO UpperBound(l_menu.item)
		l_menu.item[ll_index].visible = FALSE
	NEXT
END IF

RETURN 1
end function

public function integer workspaceheight ();
RETURN super::WorkSpaceHeight() - WorkSpaceY() - 8
end function

public function integer workspacey ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacey()
ELSE
	RETURN uo_ribbon.of_GetHeight() + 12 + uo_ribbon.Y
END IF
end function

private function integer of_buildribbon ();Menu l_menu
Long ll_index
u_cst_ribbonpanel panels[]
u_cst_ribbonpanel panel

IF IsValid(THIS.menuId) THEN
	l_menu= THIS.menuId
	
	FOR ll_index = 1 TO UpperBound(l_menu.item)
		IF l_menu.item[ll_index].Visible = FALSE THEN CONTINUE
		uo_ribbon.of_GetRibbon().of_OpenTab(panels[UpperBound(panels) + 1], of_RemoveAmpersand(l_menu.item[ll_index].Text), l_menu.item[ll_index].toolbaritemname)
		panels[UpperBound(panels)].of_SetContainer(uo_ribbon)
		panels[UpperBound(panels)].of_SetParentWindow(THIS)
		panels[UpperBound(panels)].of_SetTheme(uo_ribbon.of_GetRibbon().il_CurrentTheme)
		panels[UpperBound(panels)].of_LoadFromMenu(l_menu.item[ll_index])
	NEXT
END IF

IF uo_ribbon.of_GetRibbon().ib_DisplayProgramTab THEN
	IF uo_ribbon.of_GetRibbon().of_GetTabCount() > 2 THEN
		uo_ribbon.of_GetRibbon().of_SelectTab(2)
	END IF
ELSE
	IF uo_ribbon.of_GetRibbon().of_GetTabCount() > 1 THEN
		uo_ribbon.of_GetRibbon().of_SelectTab(1)
	END IF
END IF

of_HideMenu()

of_BuildQuickAccess()

RETURN 1
end function

private function string of_convertkeytoletter (keycode akc_key);String ls_letter

 CHOOSE CASE akc_key
	CASE KeyA!
		ls_letter = 'a'
	CASE KeyB!
		ls_letter = 'b'
	CASE KeyC!
		ls_letter = 'c'
	CASE KeyD!
		ls_letter = 'd'
	CASE KeyE!
		ls_letter = 'e'
	CASE KeyF!
		ls_letter = 'f'
	CASE KeyG!
		ls_letter = 'g'
	CASE KeyH!
		ls_letter = 'h'
	CASE KeyI!
		ls_letter = 'i'
	CASE KeyJ!
		ls_letter = 'j'
	CASE KeyK!
		ls_letter = 'k'
	CASE KeyL!
		ls_letter = 'l'
	CASE KeyM!
		ls_letter = 'm'
	CASE KeyN!
		ls_letter = 'n'
	CASE KeyO!
		ls_letter = 'o'
	CASE KeyP!
		ls_letter = 'p'
	CASE KeyQ!
		ls_letter = 'q'
	CASE KeyR!
		ls_letter = 'r'
	CASE KeyS!
		ls_letter = 's'
	CASE KeyT!
		ls_letter = 't'
	CASE KeyU!
		ls_letter = 'u'
	CASE KeyV!
		ls_letter = 'v'
	CASE KeyW!
		ls_letter = 'w'
	CASE KeyX!
		ls_letter = 'x'
	CASE KeyY!
		ls_letter = 'y'
	CASE KeyZ!
		ls_letter = 'z'
	CASE Key0!
		ls_letter = '0'
	CASE Key1!
		ls_letter = '1'
	CASE Key2!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '@'
		ELSE
			ls_letter = '2'
		END IF
	CASE Key3!
		ls_letter = '3'
	CASE Key4!
		ls_letter = '4'
	CASE Key5!
		ls_letter = '5'
	CASE Key6!
		ls_letter = '6'
	CASE Key7!
		ls_letter = '7'
	CASE Key8!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '*'
		ELSE
			ls_letter = '8'
		END IF
	CASE Key9!
		ls_letter = '9'
	CASE KeyDash!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '_'
		ELSE
			ls_letter = '-'
		END IF
END CHOOSE

RETURN ls_letter
end function

public function boolean of_isribbondocked ();RETURN uo_ribbon.ib_docked
end function

public function integer of_undockribbon ();RETURN uo_ribbon.of_undock()

end function

public function integer workspacewidth ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacewidth()
ELSE
	RETURN uo_ribbon.Width + 10
END IF
end function

public function integer workspacex ();IF NOT IsValid(uo_ribbon) THEN
	RETURN super::workspacex()
ELSE
	RETURN uo_ribbon.X
END IF
end function

public function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

public function integer of_buildquickaccess ();uo_ribbon.of_ClearQuickAccess()
uo_ribbon.of_BuildQuickAccess(THIS.menuId)

IF DisplayQuickAccessUnderRibbon THEN
	uo_ribbon.of_DisplayQuickAccess(uo_ribbon.BOTTOM)
ELSE
	uo_ribbon.of_DisplayQuickAccess(uo_ribbon.TOP)
END IF

RETURN 1
end function

public function integer of_rebuildribbon ();uo_ribbon.of_GetRibbon().of_CloseAllTabs()
uo_ribbon.uo_quickaccess.of_Reset()

of_BuildRibbon()

THIS.TriggerEvent("resize")

RETURN 1
end function

public function integer changemenu (ref menu m);Long ll_return

SetRedraw(FALSE)

ll_return = super::ChangeMenu(m)

of_RebuildRibbon()

SetRedraw(TRUE)

RETURN ll_return
end function

public function integer changemenu (ref menu m, integer w);Long ll_return

SetRedraw(FALSE)

ll_return = super::ChangeMenu(m, w)

of_RebuildRibbon()

SetRedraw(TRUE)

RETURN ll_return
end function

public function integer of_settheme (string as_theme);
CHOOSE CASE Upper(as_theme)
	CASE 'BLUE'
		THIS.BackColor = BLUE
	CASE 'SILVER'
		THIS.BackColor = SILVER
	CASE 'OLIVE'
		THIS.BackColor = OLIVE
	CASE ELSE
		THIS.BackColor = CLASSIC
END CHOOSE

uo_ribbonmenu.of_SetTheme(as_theme)
uo_ribbon.BackColor = THIS.BackColor
uo_ribbon.of_GetRibbon().of_SetBackColor(THIS.BackColor)
uo_ribbon.of_SetTheme(as_theme)
uo_ribbon.uo_quickaccess.of_SetTheme(as_theme)

RETURN 1
end function

public function integer of_displayprogramtab (string as_image);uo_ribbon.of_GetRibbon().of_InsertProgramTab(as_image)
uo_ribbonmenu.of_SetImage(as_Image)
IF uo_ribbon.of_GetRibbon().of_GetTabCount() > 2 THEN
	uo_ribbon.of_GetRibbon().of_SelectTab(2)
END IF

RETURN 1
end function

public function u_cst_ribbonmenu of_ribbonmenu ();RETURN uo_ribbonmenu
end function

on w_ribbonwindow.create
this.uo_ribbonmenu=create uo_ribbonmenu
this.uo_ribbon=create uo_ribbon
this.inv_win32=create inv_win32
this.Control[]={this.uo_ribbonmenu,&
this.uo_ribbon}
end on

on w_ribbonwindow.destroy
destroy(this.uo_ribbonmenu)
destroy(this.uo_ribbon)
destroy(this.inv_win32)
end on

event open;uo_ribbon.of_SetParent(THIS)
uo_ribbonmenu.of_SetParent(THIS)
uo_ribbonmenu.of_SetContainer(uo_ribbon)
of_BuildRibbon()

end event

event resize;uo_ribbon.Width = NewWidth - 8 - uo_ribbon.x
end event

event other;//appeon comment
//CHOOSE CASE Message.Number
//	CASE inv_win32.WM_MOUSEWHEEL
//		IF NOT uo_ribbonmenu.Visible AND uo_ribbon.ib_docked THEN
//			POINT p
//			p.px = IntLow(lparam)
//			p.py = IntHigh(lparam)
//			
//			IF inv_win32.ScreenToClient(Handle(THIS), p) THEN
//				IF p.py < UnitsToPixels(uo_ribbon.Height, YUnitsToPixels!) AND p.py > 0 THEN
//					uo_ribbon.EVENT ue_mousewheel(wparam, lparam)
//					Message.Processed = TRUE
//				END IF
//			END IF
//		END IF
//END CHOOSE
//appeon comment end
end event

type uo_ribbonmenu from u_cst_ribbonmenu within w_ribbonwindow
boolean visible = false
integer x = 9
integer y = 176
integer taborder = 20
end type

on uo_ribbonmenu.destroy
call u_cst_ribbonmenu::destroy
end on

type uo_ribbon from u_cst_ribboncontainer within w_ribbonwindow
event key pbm_keydown
integer x = 9
integer height = 432
integer taborder = 20
end type

on uo_ribbon.destroy
call u_cst_ribboncontainer::destroy
end on

event ue_programtabclicked;call super::ue_programtabclicked;uo_RibbonMenu.Y = THIS.Y + THIS.of_GetRibbon().Y + PixelsToUnits(2, YPixelsToUnits!)
uo_ribbonmenu.of_Show()
end event

type inv_win32 from n_cst_win32 within w_ribbonwindow descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

