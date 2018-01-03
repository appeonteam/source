$PBExportHeader$n_cst_xplistbar_painter.sru
forward
global type n_cst_xplistbar_painter from n_cst_base_painter
end type
end forward

global type n_cst_xplistbar_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public subroutine of_horizontalgradient (long al_color1, long al_color2)
public subroutine of_horizontalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_border)
public function boolean of_setdevicecontext (graphicobject ado_palette, integer ai_style, boolean ab_border)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1)
public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1, boolean ab_double)
public subroutine of_drawcircle (integer x1, integer y1, integer x2, integer y2, long al_color1, long al_color2)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawtext (string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
end prototypes

public subroutine of_horizontalgradient (long al_color1, long al_color2);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

ll_DC = il_HDC
inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)

end subroutine

public subroutine of_horizontalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_border);of_SetDeviceContext (ado_palette)
ib_displayborder = ab_border
of_HorizontalGradient (al_Color1, al_Color2)
end subroutine

public function boolean of_setdevicecontext (graphicobject ado_palette, integer ai_style, boolean ab_border);IF NOT IsValid (ado_Palette) THEN RETURN FALSE

// Get the object's handle
HDC = Handle (ado_Palette)

// Get the object's dimensions
inv_win32.GetClientRect (HDC, DC_RECT)

// let's resize the grandient rectangle if border is displayed
choose case ai_style
	case 2
	IF ab_border THEN
		// Initialize the vertices
		Corner[1].X = DC_RECT.Left +1 
		Corner[1].Y = DC_RECT.Top +1 
		Corner[2].X = DC_RECT.Right -1
		Corner[2].Y = DC_RECT.Top +1
		Corner[3].X = DC_RECT.Right -1
		Corner[3].Y = DC_RECT.Bottom - 1
		Corner[4].X = DC_RECT.Left +1
		Corner[4].Y = DC_RECT.Bottom - 1
	
		VistaCorner1[1].X = DC_RECT.Left + 2 
		VistaCorner1[1].Y = DC_RECT.Top + 2
		VistaCorner1[2].X = DC_RECT.Right - 1
		VistaCorner1[2].Y = DC_RECT.Top + 2
		VistaCorner1[3].X = DC_RECT.Right -2
		VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .48)//14
		VistaCorner1[4].X = DC_RECT.Left +1
		VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .48)//14
	
		VistaCorner3[1].X = DC_RECT.Left + 2
		VistaCorner3[1].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16
		VistaCorner3[2].X = DC_RECT.Right //-1
		VistaCorner3[2].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16 
		VistaCorner3[3].X = DC_RECT.Right - 2
		VistaCorner3[3].Y = DC_RECT.Bottom - 2
		VistaCorner3[4].X = DC_RECT.Left 
		VistaCorner3[4].Y = DC_RECT.Bottom - 2
	ELSE
		Corner[1].X = DC_RECT.Left +1 
		Corner[1].Y = DC_RECT.Top +1 
		Corner[2].X = DC_RECT.Right -1
		Corner[2].Y = DC_RECT.Top +1
		Corner[3].X = DC_RECT.Right -1
		Corner[3].Y = DC_RECT.Bottom - 1
		Corner[4].X = DC_RECT.Left +1
		Corner[4].Y = DC_RECT.Bottom - 1
	
		VistaCorner1[1].X = DC_RECT.Left
		VistaCorner1[1].Y = DC_RECT.Top 
		VistaCorner1[2].X = DC_RECT.Right
		VistaCorner1[2].Y = DC_RECT.Top 
		VistaCorner1[3].X = DC_RECT.Right
		VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .48)//14
		VistaCorner1[4].X = DC_RECT.Left
		VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .48)//14
	
		VistaCorner3[1].X = DC_RECT.Left
		VistaCorner3[1].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16
		VistaCorner3[2].X = DC_RECT.Right 
		VistaCorner3[2].Y = DC_RECT.Top + (DC_RECT.Bottom * .53)//16 
		VistaCorner3[3].X = DC_RECT.Right
		VistaCorner3[3].Y = DC_RECT.Bottom
		VistaCorner3[4].X = DC_RECT.Left 
		VistaCorner3[4].Y = DC_RECT.Bottom
	END IF
end choose

RETURN TRUE


end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1);of_DrawLine(x1, y1, x2, y2, al_color1, TRUE)
end subroutine

public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1, boolean ab_double);GRADIENT_RECT l_Gradient[]
LONG hRPen, ll_DC
uLONG hRgn

l_Gradient[1].upperleft = UnitsToPixels(X1, XUnitsToPixels!)
l_Gradient[1].lowerright = UnitsToPixels(Y1, YUnitsToPixels!)
l_Gradient[2].upperleft = UnitsToPixels(X2, XUnitsToPixels!)
l_Gradient[2].lowerright = UnitsToPixels(Y2, YUnitsToPixels!)

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

IF ab_double THEN
	l_Gradient[1].upperleft = UnitsToPixels(X1, XUnitsToPixels!)
	l_Gradient[1].lowerright = UnitsToPixels(Y1, YUnitsToPixels!)+1
	l_Gradient[2].upperleft = UnitsToPixels(X2, XUnitsToPixels!)
	l_Gradient[2].lowerright = UnitsToPixels(Y2, YUnitsToPixels!)+1
	
	hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
	inv_win32.SelectObject(ll_DC, hRPen)
	hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF
end subroutine

public subroutine of_drawcircle (integer x1, integer y1, integer x2, integer y2, long al_color1, long al_color2);GRADIENT_RECT l_Gradient[]
LONG hRPen, ll_DC, ll_x1, ll_x2, ll_y1, ll_y2
ULONG hRgn
ULONG ull_BrushColor
LONG ll_LightColorCircle

ll_x1 = UnitsToPixels(X1, XUnitsToPixels!)
ll_y1 = UnitsToPixels(Y1, YUnitsToPixels!)
ll_x2 = UnitsToPixels(X2, XUnitsToPixels!)
ll_y2 = UnitsToPixels(Y2, YUnitsToPixels!)

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)

// Changed by Serge Samson to allowed color in circle and have a circle Anti Alias Style
ull_BrushColor = inv_win32.CreateSolidBrush(al_color2)
inv_win32.SelectObject(ll_DC, ull_BrushColor)

uLong ll1, ll2

ll1 = inv_win32.Chord (ll_DC , X1 - 1, Y1 - 1, X2 + 1, Y2 + 1 , 1, 1, 1, 1)
ll2 = inv_win32.Chord (ll_DC , X1, Y1, X2, Y2 , 1, 1, 1, 1)

inv_win32.DeleteObject(ll1)
inv_win32.DeleteObject(ll2)
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BrushColor)
end subroutine

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

IF ab_elipse THEN
	al_align = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		al_align = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF

IF ab_wordwrap THEN
	ll_parm = of_BitWiseOr(DT_CALCRECT, DT_WORDBREAK)
ELSE
	ll_parm = DT_CALCRECT
END IF

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = UnitsToPixels(al_x, XUnitsToPixels!)
l_Rect.Top = UnitsToPixels(al_y, YUnitsToPixels!)
l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
l_Rect.Bottom = UnitsToPixels(al_height, YUnitsToPixels!)

inv_win32.SetTextColor(ll_DC, al_color)

IF NOT ab_elipse THEN
	inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
END IF

IF al_align = ALIGN_RIGHT THEN
	l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, al_align)

il_NewHeight = PixelsToUnits(l_Rect.Bottom, YPixelsToUnits!)
il_newWidth = PixelsToUnits(l_Rect.RIGHT, XPixelsToUnits!)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)


RETURN 1
end function

public function integer of_drawtext (string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

ll_DC = il_HDC

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

IF ab_elipse THEN
	al_align = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		al_align = of_BitWiseOr(al_align, DT_WORDBREAK)
	END IF
END IF

IF ab_wordwrap THEN
	ll_parm = of_BitWiseOr(DT_CALCRECT, DT_WORDBREAK)
ELSE
	ll_parm = DT_CALCRECT
END IF

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = UnitsToPixels(al_x, XUnitsToPixels!)
l_Rect.Top = UnitsToPixels(al_y, YUnitsToPixels!)
l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
l_Rect.Bottom = UnitsToPixels(al_height, YUnitsToPixels!)

inv_win32.SetTextColor(ll_DC, al_color)

IF NOT ab_elipse THEN
	inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
END IF

IF al_align = ALIGN_RIGHT THEN
	l_Rect.Right = UnitsToPixels(al_width, XUnitsToPixels!)
END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, al_align)

il_NewHeight = PixelsToUnits(l_Rect.Bottom, YPixelsToUnits!)
il_newWidth = PixelsToUnits(l_Rect.RIGHT, XPixelsToUnits!)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

on n_cst_xplistbar_painter.create
call super::create
end on

on n_cst_xplistbar_painter.destroy
call super::destroy
end on

