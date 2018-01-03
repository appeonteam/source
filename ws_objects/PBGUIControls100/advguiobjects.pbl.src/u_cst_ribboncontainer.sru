$PBExportHeader$u_cst_ribboncontainer.sru
forward
global type u_cst_ribboncontainer from userobject
end type
type uo_ribbon from u_cst_ribbon within u_cst_ribboncontainer
end type
type uo_shadow from u_cst_canvas within u_cst_ribboncontainer
end type
type uo_quickaccess from u_cst_toolbarstrip within u_cst_ribboncontainer
end type
type inv_win32 from n_cst_win32 within u_cst_ribboncontainer
end type
end forward

global type u_cst_ribboncontainer from userobject
integer width = 1024
integer height = 420
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event lbuttondown pbm_lbuttondown
event ue_programtabclicked ( )
event ue_mousewheel ( long wparam,  long lparam )
uo_ribbon uo_ribbon
uo_shadow uo_shadow
uo_quickaccess uo_quickaccess
inv_win32 inv_win32
end type
global u_cst_ribboncontainer u_cst_ribboncontainer

type prototypes

end prototypes

type variables
Boolean ib_docked
Boolean ib_expanded
Boolean ib_captured

n_cst_ribbontiming inv_timer
CONSTANT Long il_dockheight = 442 //430
CONSTANT Long il_collapsedheight = 80
Long il_qaheight

w_ribbonwindow iw_parent

Menu im_quickaccessitems[]

Long il_quickaccessposition
CONSTANT Long TOP = 0
CONSTANT Long BOTTOM = 1

n_cst_base_painter inv_painter
end variables

forward prototypes
public function long of_getheight ()
public function integer of_undock ()
public function integer of_dock ()
public function u_cst_ribbon of_getribbon ()
public function integer of_tabclicked ()
public function integer of_hide ()
public function integer of_postconstructor ()
public function integer of_tabsdoubleclicked (integer al_index)
public function integer of_setparent (window aw_parent)
public function integer of_buildquickaccess (menu am_menu)
public function integer of_settheme (string as_color)
public function integer of_gety ()
public function integer of_clearquickaccess ()
public function integer of_displayquickaccess (long al_quickaccessposition)
public function integer of_displayprogramorb (string as_image)
public function integer of_collapse ()
public function w_ribbonwindow of_getparent ()
end prototypes

event resize;uo_ribbon.Width = NewWidth
uo_quickaccess.Width = NewWidth
uo_shadow.Resize(NewWidth, PixelsToUnits(6, YPixelsToUnits!))


IF il_quickaccessposition = BOTTOM THEN
	IF ib_docked OR ib_expanded THEN
		uo_quickaccess.Y = Height - uo_quickaccess.Height - PixelsToUnits(2, YPixelsToUnits!)
	ELSE
		uo_quickaccess.Y = Height - uo_quickaccess.Height
	END IF
	
	uo_shadow.Y = uo_ribbon.Y + uo_ribbon.Height - PixelsToUnits(4, YPixelsToUnits!)
ELSE
	uo_shadow.Y = il_dockheight + il_qaheight - PixelsToUnits(7, YPixelsToUnits!)
END IF
end event

event lbuttondown;IF NOT ib_docked AND ib_expanded THEN
	POINT lp
	ulong ll
	ulong lul
	
	lul = Handle(this)
	
	inv_win32.GetCursorPos(lp)
	inv_win32.Screentoclient(lul, lp)
	
	IF lp.px < 0 OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
		lp.py < UnitsToPixels(uo_ribbon.Y + THIS.Y, YUnitsToPixels!) OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN
		
		of_UnDock()
	END IF
	
	inv_win32.ReleaseCapture()
	ib_captured = FALSE
END IF
end event

event ue_mousewheel(long wparam, long lparam);Long ll_start, ll_current, ll_total
		
IF uo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_current = uo_ribbon.of_GetSelectedTab()
ll_total = uo_ribbon.of_GetTabCount()

u_cst_ribbonpanel luo_panel
luo_panel = uo_ribbon.of_GetObject(ll_current)
luo_panel.of_ReleaseMouse()
luo_panel.of_MouseOver(0)

If (IntHigh(wparam) > 0) Then
	//Select tab to the left
	IF ll_current > ll_start THEN
		uo_ribbon.of_SelectTab(ll_current - 1)
	END IF
Else
	//Select tab to the right
	IF ll_current < ll_total THEN
		uo_ribbon.of_SelectTab(ll_current + 1)
	END IF
End If

iw_parent.SetFocus()
end event

public function long of_getheight ();RETURN Height

end function

public function integer of_undock ();inv_timer.Stop()

ib_docked = FALSE
ib_expanded = FALSE
uo_ribbon.il_selected = 0
uo_ribbon.il_index = 0
uo_ribbon.ib_dirty = TRUE
uo_ribbon.POST SetRedraw(TRUE)

THIS.Height = il_collapsedheight + il_qaheight + 4

IF IsValid(iw_parent) THEN iw_parent.TriggerEvent("resize")

RETURN 1
end function

public function integer of_dock ();inv_timer.Stop()

ib_docked = TRUE
ib_expanded = TRUE
uo_ribbon.ib_dirty = TRUE
uo_ribbon.POST SetRedraw(TRUE)

Height = il_dockheight + il_qaheight

IF IsValid(iw_parent) THEN iw_parent.TriggerEvent("resize")

RETURN 1
end function

public function u_cst_ribbon of_getribbon ();RETURN uo_ribbon
end function

public function integer of_tabclicked ();

RETURN 1
end function

public function integer of_hide ();
POINT lp
ulong ll
ulong lul

lul = Handle(this)

inv_win32.GetCursorPos(lp)
inv_win32.Screentoclient(lul, lp)

IF lp.px < 0 OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
	lp.py < 0 OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN

	inv_win32.SetCapture(lul)
	ib_captured = TRUE
ELSE
	IF ib_captured THEN
		ib_captured = FALSE
		inv_win32.ReleaseCapture()
	END IF
END IF

RETURN 1
end function

public function integer of_postconstructor ();uo_quickaccess.of_QuickAccessMode(uo_ribbon.il_backcolor)

RETURN 1
end function

public function integer of_tabsdoubleclicked (integer al_index);IF ib_docked THEN
	of_Undock()
ELSE
	IF al_index <= 0 THEN al_index = 1
	of_Dock()
	
	IF uo_ribbon.ib_displayprogramtab AND al_index = 1 THEN
		IF uo_ribbon.of_GetSelectedTab() <= 1 THEN
			uo_ribbon.of_SelectTab(2)
		ELSE
			uo_ribbon.of_SelectTab(uo_ribbon.of_GetSelectedTab())
		END IF
	ELSE
		uo_ribbon.of_SelectTab(al_index)
	END IF
END IF

RETURN 1
end function

public function integer of_setparent (window aw_parent);iw_parent = aw_parent

RETURN 1
end function

public function integer of_buildquickaccess (menu am_menu);Long ll_index, ll_count
Long ll_item
String ls_image

//Add to quick access toolbar

IF Pos(Lower(am_menu.Tag), "quickaccess:true", 1) > 0 THEN
	
	IF am_menu.Text = "-" THEN
		uo_quickaccess.of_AddSeparator()
	ELSE
		ls_image = am_menu.toolbaritemname
		
		IF Len(Trim(ls_image)) = 0 THEN
			ls_image = "BorderNone!"
		END IF
		
		ll_item = uo_quickAccess.of_AddItem(am_menu.Text, am_menu.toolbaritemname, am_menu.MicroHelp)
		im_quickaccessitems[ll_item] = am_menu
	END IF
	
END IF

//Recursively add children to quick access toolbar
ll_count = UpperBound(am_menu.Item)

FOR ll_index = 1 TO ll_count
	of_BuildQuickAccess(am_menu.Item[ll_index])
NEXT

RETURN 1
end function

public function integer of_settheme (string as_color);uo_ribbon.of_SetTheme(as_color)

uo_Shadow.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_gety ();RETURN Y + uo_ribbon.Y
end function

public function integer of_clearquickaccess ();Menu lm_quickaccessitems[]
im_quickaccessitems = lm_quickaccessitems[]
RETURN 1
end function

public function integer of_displayquickaccess (long al_quickaccessposition);il_quickaccessposition = al_quickaccessposition

IF UpperBound(im_quickaccessitems) > 0 THEN
	uo_quickaccess.Visible = TRUE
	il_qaheight = 85
	
	IF al_quickaccessposition = TOP THEN
		uo_quickaccess.Y = 0
		uo_ribbon.Y = il_qaheight
	ELSE
		uo_quickaccess.Y = uo_ribbon.Height
		uo_ribbon.Y = 0
	END IF
ELSE
	uo_quickaccess.Visible = FALSE
	uo_ribbon.Y = 0
	il_qaheight = 0
END IF

IF ib_docked THEN
	THIS.Height = il_dockheight + il_qaheight
ELSE
	THIS.Height = il_collapsedheight + il_qaheight
END IF

RETURN 1
end function

public function integer of_displayprogramorb (string as_image);of_DisplayQuickAccess(TOP)
//uo_quickaccess.X = uo_orb.X + uo_orb.Width + 8
uo_ribbon.ib_displayprogramorb = TRUE
//uo_orb.of_SetImage(as_image)
//uo_orb.Show()
RETURN 1
end function

public function integer of_collapse ();IF NOT ib_docked AND ib_expanded THEN
	of_UnDock()
	inv_win32.ReleaseCapture()
	ib_captured = FALSE
END IF

RETURN 1
end function

public function w_ribbonwindow of_getparent ();RETURN iw_parent
end function

on u_cst_ribboncontainer.create
this.uo_ribbon=create uo_ribbon
this.uo_shadow=create uo_shadow
this.uo_quickaccess=create uo_quickaccess
this.inv_win32=create inv_win32
this.Control[]={this.uo_ribbon,&
this.uo_shadow,&
this.uo_quickaccess}
end on

on u_cst_ribboncontainer.destroy
destroy(this.uo_ribbon)
destroy(this.uo_shadow)
destroy(this.uo_quickaccess)
destroy(this.inv_win32)
end on

event constructor;ib_docked = TRUE
uo_ribbon.iuo_parentcontainer = THIS

inv_timer = CREATE n_cst_ribbontiming
inv_timer.i_parent = THIS

POST of_PostConstructor()
end event

type uo_ribbon from u_cst_ribbon within u_cst_ribboncontainer
integer height = 432
integer taborder = 20
boolean bringtotop = true
end type

on uo_ribbon.destroy
call u_cst_ribbon::destroy
end on

event selectionchanging;call super::selectionchanging;IF NOT ib_expanded AND NOT ib_docked THEN
	ib_expanded = TRUE
	
	PARENT.Height = il_dockheight + il_qaheight
	
	PARENT.BringToTop = TRUE
	
	inv_timer.Start(.1)
END IF
end event

type uo_shadow from u_cst_canvas within u_cst_ribboncontainer
integer y = 152
integer width = 402
integer taborder = 20
end type

on uo_shadow.destroy
call u_cst_canvas::destroy
end on

event onpaint;call super::onpaint;Long ll_color

ll_color =  uo_ribbon.of_GetColor("BORDER")

inv_painter.of_sethdc (hdc)
inv_painter.of_setdevicecontext (THIS)
inv_painter.of_xpgradient (RGB(ll_color,ll_color,ll_color), PARENT.BackColor, THIS, FALSE, PARENT.BackColor, TRUE)

RETURN 1
end event

type uo_quickaccess from u_cst_toolbarstrip within u_cst_ribboncontainer
boolean visible = false
integer taborder = 20
end type

on uo_quickaccess.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;Long ll_index

ll_index = THIS.of_GetIndex(as_button)

IF ll_index > 0 THEN
	im_quickaccessitems[ll_index].PostEvent("Clicked")
END IF


end event

event lbuttonup;call super::lbuttonup;IF PARENT.ib_expanded AND NOT PARENT.ib_docked  THEN
	PARENT.of_UnDock()
END IF
end event

type inv_win32 from n_cst_win32 within u_cst_ribboncontainer descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

