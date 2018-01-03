$PBExportHeader$u_cst_powerdockpanelheader.sru
forward
global type u_cst_powerdockpanelheader from u_cst_canvas
end type
type st_1 from statictext within u_cst_powerdockpanelheader
end type
type rect from structure within u_cst_powerdockpanelheader
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type u_cst_powerdockpanelheader from u_cst_canvas
integer width = 603
integer height = 104
long backcolor = 67108864
string pointer = "Arrow!"
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event paint pbm_paint
event clicked pbm_lbuttonup
event mousewithin pbm_mousemove
event mouseenter ( )
event mouseleave ( )
event resize pbm_size
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
st_1 st_1
end type
global u_cst_powerdockpanelheader u_cst_powerdockpanelheader

type prototypes

end prototypes

type variables
n_cst_ui_imagelist inv_imagelist

Long il_dc, il_imagelist
Long il_image

Boolean ib_shadowtext
String is_image
string is_font = "tahoma"
Long il_fontsize = 9
Long il_imagepos

n_cst_powerpanelheader_painter	in_gradient

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
CONSTANT Long RIGHT = 1
CONSTANT Long LEFT = 2

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

CONSTANT Long XP = 0
CONSTANT Long VISTAEMBOSSED = 1
CONSTANT Long VISTAORIGINAL = 2
CONSTANT Long VISTAGLASS = 3
CONSTANT Long CUSTOM = 4

Long il_CurrentStyle = XP
Long il_CurrentTheme = BLUE
Long il_Gradient1 = RGB(255,255,255)
Long il_Gradient2 = RGB(255,255,255)
Long il_bordercolor

Long il_rightwidth
Long il_leftwidth
Long il_leftx
Long il_rightcolor = 0
Long il_leftcolor = 0

String is_lefttext
String is_righttext

Long il_x, il_y
Boolean ib_overpin
Boolean ib_overx

Boolean ib_selected
Boolean ib_mousecaptured
Boolean ib_mouseleave
Boolean ib_mousedown
Boolean ib_mouseover

Boolean ib_Vista = FALSE

u_cst_powerdockpanel iuo_parent


end variables

forward prototypes
public function string of_getimage ()
public function integer of_settext (string as_text, long al_pos)
public function string of_gettext (long al_pos)
public function long of_getcolor (string as_color)
public function integer of_settheme (long al_theme)
public function integer of_setcolor (long al_gradient1, long al_gradient2)
public function integer of_settextcolor (long al_color, long al_pos)
public function integer of_setimage (string as_image, integer ai_pos)
public function integer of_settheme (string as_color)
public function integer of_setstyle (integer ai_style)
public function integer of_setshadowtext (boolean ab_switch)
public function integer of_drawimage (long ahdc)
public function integer of_drawpin (long hdc)
public function boolean of_isoverpin (long al_x, long al_y)
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_capturemouse ()
public function boolean of_isoverx (long al_x, long al_y)
public function integer of_drawx (long hdc)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (long al_fontsize)
end prototypes

event mousewithin;il_x = xpos
il_y = ypos

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
		
		of_releasemouse()
		this.event post mouseleave()

	ELSE
		IF of_IsOverPin(il_x, il_y) THEN
			IF NOT ib_overpin THEN
				ib_overpin = TRUE
				SetRedraw(TRUE)
			END IF
		ELSE
			IF ib_overpin THEN
				ib_overpin = FALSE
				SetRedraw(TRUE)
			END IF
		END IF
		
		IF of_IsOverX(il_x, il_y) THEN
			IF NOT ib_overX THEN
				ib_overX = TRUE
				SetRedraw(TRUE)
			END IF
		ELSE
			IF ib_overX THEN
				ib_overX = FALSE
				SetRedraw(TRUE)
			END IF
		END IF
	end if
	
end if

end event

event mouseleave();ib_overpin = FALSE
ib_overx = FALSE

SetRedraw(TRUE)
end event

event resize;call super::resize;IF Len(Trim(is_image)) > 0 THEN
	CHOOSE CASE il_imagepos
		CASE RIGHT
			il_rightwidth = Width - 25 - 110
			il_leftx = 24
		CASE LEFT
			il_leftx = 110
			il_rightwidth = Width - 18 - 25
	END CHOOSE
	
ELSE
	il_rightwidth = Width - 18 - 25
END IF

il_leftwidth = Width - il_leftx - 10

SetRedraw(TRUE)
end event

public function string of_getimage ();RETURN is_image//p_1.PictureName
end function

public function integer of_settext (string as_text, long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		is_righttext = as_text
	CASE LEFT
		is_lefttext = as_text
END CHOOSE

SetRedraw(TRUE)

RETURN 1
end function

public function string of_gettext (long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		RETURN is_righttext
	CASE LEFT
		RETURN is_lefttext
	CASE ELSE
		RETURN ''
END CHOOSE
end function

public function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "HEADER1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(89,135,214)
			CASE SILVER
				ll_color = RGB(168,167,191)
			CASE OLIVE
				ll_color = RGB(175,192,130)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
			CASE DEFAULT
				ll_color = inv_win32.GetSysColor(16)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(4,56,148)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
			CASE DEFAULT
				ll_color = inv_win32.GetSysColor(16)
		END CHOOSE
END CHOOSE

RETURN ll_color
end function

public function integer of_settheme (long al_theme);il_CurrentTheme = al_theme
CHOOSE CASE il_CurrentTheme
	CASE BLUE
		il_bordercolor = RGB(4,56,148)
	CASE SILVER
		il_bordercolor = RGB(112,111,145)
	CASE OLIVE
		il_bordercolor = RGB(99,122,68)
	CASE CLASSIC
		il_bordercolor = RGB(128,128,128)				
END CHOOSE

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setcolor (long al_gradient1, long al_gradient2);il_Gradient1 = al_gradient1
il_Gradient2 = al_gradient2
il_CurrentTheme = 0

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settextcolor (long al_color, long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		il_rightcolor = al_color
	CASE LEFT
		il_leftcolor = al_color
END CHOOSE

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (string as_image, integer ai_pos);is_image = as_image
il_imagepos = ai_pos

IF Len(Trim(is_image)) > 0 THEN

	il_image = inv_imagelist.of_AddImage(as_image)
	il_imagelist = inv_imagelist.of_GetSmallHandle()

END IF

TriggerEvent('resize')

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

public function integer of_setstyle (integer ai_style);il_CurrentStyle = ai_style

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setshadowtext (boolean ab_switch);ib_shadowtext = ab_switch

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_drawimage (long ahdc);CHOOSE CASE il_imagepos
	CASE RIGHT
		inv_win32.ImageList_Draw(il_imagelist, il_image - 1, ahdc, UnitsToPixels(width - 90, XUnitsToPixels!), UnitsToPixels(16, YUnitsToPixels!), ILD_TRANSPARENT )
	CASE LEFT
		inv_win32.ImageList_Draw(il_imagelist, il_image - 1, ahdc, UnitsToPixels(16, XUnitsToPixels!), UnitsToPixels(16, YUnitsToPixels!), ILD_TRANSPARENT )
END CHOOSE

RETURN 1
end function

public function integer of_drawpin (long hdc);Boolean lb_docked

IF NOT IsValid(iuo_parent) THEN
	lb_docked = FALSE
ELSE
	lb_docked = iuo_parent.#docked
END IF

ulong ll_brush, ll_oldbrush, ll_font, ll_oldfont
string ls_x
Rect rc
point lp
long llx, lly
Long hRgn, hRPen

rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - 35
rc.Bottom = UnitsToPixels(Height, YUnitsToPixels!)
rc.Top =  ((rc.Bottom - 7) / 2) - 1//4

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - 15
		END IF
	END IF
END IF


IF of_IsOverPin(il_x, il_y) THEN
	hRgn = inv_win32.CreateRectRgn (rc.Left - 2, 1 , rc.Left + 13 , rc.Bottom + 1 )
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (rc.Left - 1, 2 , rc.Left + 12 , rc.Bottom - 2 )
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	ll_brush = inv_win32.CreatePen(0, 0, 0)
ELSE
	ll_brush = inv_win32.CreatePen(0, 0, RGB(255,255,255))
END IF

inv_win32.SelectObject(hdc, ll_brush)

IF NOT lb_docked THEN	
	//draw unpinned
	llx = rc.left ; lly = (rc.bottom / 2) + 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 4
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly += 7
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + 2
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
	lly += 4
	inv_win32.LineTo(hdc, llx, lly)
	llx -= 7
	inv_win32.LineTo(hdc, llx, lly)
	lly -= 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
ELSE
	//draw pinned
	llx = rc.left + 5; lly = rc.bottom - 3
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 4
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + 2
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + 3
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 6
	inv_win32.LineTo(hdc, llx, lly)
	llx += 4
	inv_win32.LineTo(hdc, llx, lly)
	lly += 6
	inv_win32.LineTo(hdc, llx, lly)
	llx -= 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 6
	inv_win32.LineTo(hdc, llx, lly)
END IF

inv_win32.DeleteObject(ll_brush)

RETURN 1

end function

public function boolean of_isoverpin (long al_x, long al_y);Long ll_pos

ll_pos = 35

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			ll_pos = 15
		END IF
	END IF
END IF


IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - ll_pos AND & 
   UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - (ll_pos - 13)  AND &
	UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - 2 AND & 
   UnitsToPixels(al_y, XUnitsToPixels!) > 2  AND &
	ib_mousecaptured THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public function boolean of_ismousecaptured ();return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_isoverx (long al_x, long al_y);

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			RETURN FALSE
		END IF
	END IF
END IF

IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - 17 AND & 
   UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - 4  AND &
	UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - 2 AND & 
   UnitsToPixels(al_y, XUnitsToPixels!) > 2  AND &
	ib_mousecaptured THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public function integer of_drawx (long hdc);
ulong ll_brush, ll_oldbrush, ll_font, ll_oldfont, ll_color
string ls_x
Rect rc
point lp
long ll_x, ll_y
Long hRgn, hRPen
Boolean lb_canclose

rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - 15
rc.Top = 1
rc.Bottom = UnitsToPixels(Height, YUnitsToPixels!)

IF IsValid(iuo_parent) THEN
	lb_canclose = iuo_parent.of_CanDockPanelClose()
ELSE
	lb_canclose = TRUE
END IF
IF of_IsOverX(il_x, il_y) AND lb_canclose THEN
	hRgn = inv_win32.CreateRectRgn (rc.Left - 4, 1 , rc.Left + 13 , rc.Bottom + 1)
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (rc.Left - 3, 2 , rc.Left + 12 , rc.Bottom - 2 )
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	ll_color = 0
ELSE
	IF lb_canclose THEN
		ll_color = RGB(255,255,255)
	ELSE
		ll_color = RGB(200,200,200)
	END IF
END IF


ll_y = ((rc.Bottom - 8) / 2) - 4 //rc.Top
ll_x = rc.Left

inv_win32.SetPixel(hdc, ll_x + 0, 4 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 1, 4 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 7, 4 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 8, 4 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 1, 5 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 2, 5 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 6, 5 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 7, 5 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 2, 6 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 3, 6 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 5, 6 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 6, 6 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 3, 7 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 4, 7 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 5, 7 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 3, 8 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 4, 8 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 5, 8 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 2, 9 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 3, 9 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 5, 9 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 6, 9 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 1, 10 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 2, 10 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 6, 10 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 7, 10 + ll_y, ll_color)

inv_win32.SetPixel(hdc, ll_x + 0, 11 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 1, 11 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 7, 11 + ll_y, ll_color)
inv_win32.SetPixel(hdc, ll_x + 8, 11 + ll_y, ll_color)

RETURN 1
end function

public function integer of_setfontname (string as_font);is_font = as_font
RETURN 1
end function

public function integer of_setfontsize (long al_fontsize);il_fontsize = al_fontsize

RETURN 1
end function

on u_cst_powerdockpanelheader.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_powerdockpanelheader.destroy
call super::destroy
destroy(this.st_1)
end on

event constructor;call super::constructor;Long ll_color1, ll_color2
n_cst_theme lnv_Theme

of_SetTextColor(RGB(255,255,255), LEFT)

If lnv_Theme.of_IsAppThemed() And lnv_Theme.of_IsWindowsXp() Then
	ll_Color1 = lnv_Theme.of_GetColor( 1, 1, 3821 )
	ll_Color2 = lnv_Theme.of_GetColor( 1, 1, 3805 )
	Choose Case ll_Color1
			 Case 15029248   // Blue
						of_SetTheme(BLUE)
			 Case 12493732   // Silver
						of_SetTheme(SILVER)
			 Case 8829098    // olive green
						of_SetTheme(OLIVE)
			 Case Else
						of_SetTheme(CLASSIC)
	End Choose
Else
	IF lnv_Theme.of_IsWindowsVista() THEN
		of_SetTheme(BLUE)
	ELSE
		of_SetTheme(CLASSIC)
	END IF
End If 

POST EVENT Resize(0, Width, Height)
end event

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)

in_Gradient.of_VerticalGradient (of_GetColor("HEADER1"), of_GetColor("HEADER2"), THIS, TRUE, il_bordercolor, il_CurrentStyle)

in_Gradient.of_DrawText(THIS, is_lefttext, il_leftcolor, is_font, il_fontsize, TRUE, in_Gradient.ALIGN_LEFT, il_leftx + 14, 2, il_leftwidth, 80, ib_shadowtext) 
in_Gradient.of_DrawText(THIS, is_righttext, il_rightcolor, is_font, il_fontsize, FALSE, in_Gradient.ALIGN_RIGHT, 18, 20, il_rightwidth, 80, ib_shadowtext) 

IF Len(Trim(is_image)) > 0 THEN of_DrawImage(hdc)

of_DrawPin(hdc)

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			of_DrawX(hdc)
		END IF
	END IF
ELSE
	of_DrawX(hdc)
END IF

RETURN 1
end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_powerdockpanelheader
end type

type st_1 from statictext within u_cst_powerdockpanelheader
integer width = 10002
integer height = 10000
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Gradient Header"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

