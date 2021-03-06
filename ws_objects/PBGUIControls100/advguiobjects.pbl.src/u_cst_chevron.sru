﻿$PBExportHeader$u_cst_chevron.sru
forward
global type u_cst_chevron from u_cst_canvas
end type
end forward

global type u_cst_chevron from u_cst_canvas
integer width = 82
integer height = 100
long backcolor = 67108864
string pointer = "HyperLink!"
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event mousewithin pbm_mousemove
event mouseenter ( )
event mouseleave ( )
event paint pbm_paint
event clicked pbm_lbuttonup
end type
global u_cst_chevron u_cst_chevron

type prototypes

end prototypes

type variables
u_cst_icontray iuo_parent

n_cst_shortcutbar_painter in_Gradient

Boolean ib_mousecaptured

Long il_hover1 = RGB(255,255,220)
Long il_hover2 = RGB(247,192,91)
Long il_backcolor1 = RGB(203,225,252)
Long il_backcolor2 = RGB(126,166,225)
end variables

forward prototypes
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_setparent (u_cst_icontray auo_parent)
public function integer of_drawchevron (long ahdc)
end prototypes

event mousewithin;if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
	
		of_releasemouse()
		
		this.event post mouseleave()
		
	end if

end if
end event

event mouseenter();
SetRedraw(TRUE)
end event

event mouseleave();
SetRedraw(TRUE)
end event

event clicked;m_shortcutoptions lm_menu

This.SetFocus()

lm_menu = CREATE m_shortcutoptions

lm_menu.iuo_parent = iuo_parent.iuo_parent


lm_menu.of_LoadMenu()

lm_menu.m_options.m_showallitems.Text = iuo_parent.iuo_parent.is_ShowAllItems
lm_menu.m_options.m_showmorebuttons.Text = iuo_parent.iuo_parent.is_ShowMoreItems
lm_menu.m_options.m_showfewerbuttons.Text = iuo_parent.iuo_parent.is_ShowFewerItems
lm_menu.m_options.m_hideall.Text = iuo_parent.iuo_parent.is_HideAllItems
lm_menu.m_options.m_addorremovebuttons.Text = iuo_parent.iuo_parent.is_ShowOrHideItems

window lw_parent, lw_frame, lw_sheet, lw_childparent
GraphicObject lgo
boolean lb_frame

lw_parent = lm_menu.ParentWindow

if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	lgo = lw_frame
	
	do while IsValid (lgo)
		IF lgo.TypeOf() = Window! THEN
			lw_frame = lgo
			lgo = lw_frame.ParentWindow()
		ELSE
			lgo = lgo.GetParent()
		END IF

		if lw_frame.windowtype = MDI! or lw_frame.windowtype = MDIHelp! then
			lb_frame = true
			exit
		END IF
	loop
	 
	if lb_frame then
		if lw_parent.windowtype = Child! then
			lw_parent = lw_frame
		else
			lw_sheet = lw_frame.GetFirstSheet()
			if IsValid (lw_sheet) then
				do
					if lw_sheet = lw_parent then
						lw_parent = lw_frame
						exit
					end if
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
			end if
		end if
	else
		if lw_parent.windowtype = Child! then
			lw_childparent = lw_parent.ParentWindow()
			if IsValid (lw_childparent) then
				lw_parent = lw_childparent
			end if
		end if
	 end if
else
	 return 1
end if

lm_menu.m_options.PopMenu (lw_parent.PointerX() + (Width - xpos) + 5, lw_parent.PointerY()	 + (height - ypos))
	
of_releasemouse()
this.event post mouseleave()

end event

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();
return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_setparent (u_cst_icontray auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_drawchevron (long ahdc);Long ll_x, ll_y
Long ll_index

ll_y = UnitsToPixels(35, YUnitsToPixels!)
ll_x = UnitsToPixels(27, XUnitsToPixels!)

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 1, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 3, ll_y, 0)
	inv_win32.SetPixel(ahdc, ll_x + 4, ll_y, 0)
	
	ll_y = ll_y + 1
	IF ll_index < 3 THEN
		ll_x = ll_x + 1
	ELSE
		ll_x = ll_x - 1
	END IF
	
NEXT

ll_y = ll_y + 4
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(ahdc, ll_x, ll_y, 0)

RETURN 1
end function

on u_cst_chevron.create
call super::create
end on

on u_cst_chevron.destroy
call super::destroy
end on

event onpaint;call super::onpaint;IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		
		in_Gradient.of_SetHDC(hdc)
		
		IF ib_mousecaptured THEN
			in_Gradient.of_VerticalGradient (iuo_parent.iuo_parent.of_GetColor("HOVER1"), iuo_parent.iuo_parent.of_GetColor("HOVER2"), THIS, FALSE, 0, iuo_parent.iuo_parent.of_GetStyle())
		ELSE
			in_Gradient.of_VerticalGradient (iuo_parent.iuo_parent.of_GetColor("BACKCOLOR1"), iuo_parent.iuo_parent.of_GetColor("BACKCOLOR2"), THIS, FALSE, 0, iuo_parent.iuo_parent.of_GetStyle())
		END IF
		
		of_DrawChevron(hdc) 
	END IF
END IF

RETURN 1
end event

