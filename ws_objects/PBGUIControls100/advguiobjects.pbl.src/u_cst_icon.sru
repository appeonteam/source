$PBExportHeader$u_cst_icon.sru
forward
global type u_cst_icon from u_cst_canvas
end type
end forward

global type u_cst_icon from u_cst_canvas
integer width = 114
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
global u_cst_icon u_cst_icon

type prototypes

end prototypes

type variables
u_cst_shortcutitem iuo_shortcutitem
u_cst_icontray iuo_parent
n_cst_ui_imagelist inv_imagelist

Long il_dc, il_imagelist
Long il_imageindex

n_cst_shortcutbar_painter in_Gradient
n_cst_tooltip 	inv_tooltip

Boolean ib_mousecaptured
Boolean ib_enabled = TRUE

Long il_ID

String is_image

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

// for color adjustment
coloradjustment mystructure1
end variables

forward prototypes
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_setimage (string as_image)
public function integer of_setparent (u_cst_icontray auo_parent)
public function integer of_settiptext (string as_text)
public function integer of_drawimage (long ahdc)
public function boolean of_enabled (boolean ab_enabled)
public function integer of_drawdisabled (long ahdc)
end prototypes

event mousewithin;Long li_X, li_Y

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
	
		of_releasemouse()
		
		this.event post mouseleave()
	
	end if

end if
end event

event mouseenter();Long li_X, li_Y, ll_return

IF il_Id > 0 THEN
	li_X = 0
	li_Y = 0
	inv_tooltip.of_UpdatetipRect( This, il_ID, &
									li_x, li_y, &
									li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
									li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
		
	
	inv_tooltip.Of_SetTipText( This, il_Id, iuo_shortcutitem.of_GetText()) 
END IF

SetRedraw(TRUE)
end event

event mouseleave();
SetRedraw(TRUE)
end event

event clicked;iuo_shortcutitem.TriggerEvent('clicked')
iuo_parent.of_Refresh()
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

public function integer of_setimage (string as_image);is_image = as_image

IF Len(Trim(is_image)) > 0 THEN
	Long ll_index
		
	ll_index = inv_imagelist.of_AddImage(as_image)
	
	il_imagelist = inv_imagelist.of_GetSmallHandle()
	
	il_imageindex = ll_index
	
	RETURN ll_index
END IF

RETURN 0
end function

public function integer of_setparent (u_cst_icontray auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_settiptext (string as_text);PowerTipText = as_text

RETURN 1
end function

public function integer of_drawimage (long ahdc);inv_win32.ImageList_Draw(il_imagelist, il_imageindex - 1, ahdc, UnitsToPixels(14, XUnitsToPixels!), UnitsToPixels(25, YUnitsToPixels!), ILD_TRANSPARENT )

RETURN 1
end function

public function boolean of_enabled (boolean ab_enabled);ib_enabled = ab_enabled

Return ib_enabled
end function

public function integer of_drawdisabled (long ahdc);// Created by Serge Samson on Nov 06, 2006
Integer	li_counter

// we need to apply this twice to have a nicer fade effect
FOR li_counter = 0 to 2
	
	inv_win32.GetColorAdjustment (ahdc , mystructure1)

	// There is several potential 
	mystructure1.caBrightness 		= +100	//+60	// +80	// +100
	mystructure1.caColorfulness 	= -10		//-40 // -30		// -10
	mystructure1.caContrast 		= -34		//-10 // -14		// - 34
	
	IF inv_win32.GetStretchBltMode(ahdc) <> 4 THEN
		inv_win32.SetStretchBltMode (ahdc, 4)
	ELSE
		inv_win32.SetStretchBltMode (ahdc, 3)
	END IF
	
	inv_win32.SetColorAdjustment (ahdc , mystructure1)
		
	inv_win32.StretchBlt (ahdc,1, 1, UnitsToPixels(THIS.Width, XUnitsToPixels!) - 2, THIS.Height, ahdc, 1,1,UnitsToPixels(THIS.Width, XUnitsToPixels!) - 2, THIS.Height, 13369376)
Next

Return 1
end function

on u_cst_icon.create
call super::create
end on

on u_cst_icon.destroy
call super::destroy
end on

event constructor;call super::constructor;il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 

end event

event onpaint;call super::onpaint;IF IsValid(iuo_shortcutitem) THEN
	IF IsValid(iuo_shortcutitem.iuo_parent) THEN
		
		in_Gradient.of_SetHDC(hdc)
		
		IF iuo_shortcutitem.ib_selected THEN
			IF ib_mousecaptured THEN
				in_Gradient.of_VerticalGradient (iuo_shortcutitem.iuo_parent.of_GetColor("HOVERSELECTED1"), iuo_shortcutitem.iuo_parent.of_GetColor("HOVERSELECTED2"), THIS, FALSE, 0, iuo_shortcutitem.iuo_parent.of_GetStyle())
			ELSE
				in_Gradient.of_VerticalGradient (iuo_shortcutitem.iuo_parent.of_GetColor("SELECTED1"), iuo_shortcutitem.iuo_parent.of_GetColor("SELECTED2"), THIS,FALSE, 0, iuo_shortcutitem.iuo_parent.of_GetStyle())
			END IF 
		ELSE
			IF ib_mousecaptured THEN
				in_Gradient.of_VerticalGradient (iuo_shortcutitem.iuo_parent.of_GetColor("HOVER1"), iuo_shortcutitem.iuo_parent.of_GetColor("HOVER2"), THIS,FALSE, 0, iuo_shortcutitem.iuo_parent.of_GetStyle())
			ELSE
				in_Gradient.of_VerticalGradient (iuo_shortcutitem.iuo_parent.of_GetColor("BACKCOLOR1"), iuo_shortcutitem.iuo_parent.of_GetColor("BACKCOLOR2"), THIS,FALSE, 0, iuo_shortcutitem.iuo_parent.of_GetStyle())
			END IF
		
		END IF

		of_DrawImage(hdc)
		
		IF ib_enabled = FALSE THEN 
			of_DrawDisabled(hdc)
		END IF
		
	END IF
END IF

RETURN 1
end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_icon
end type

