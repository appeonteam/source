$PBExportHeader$n_cst_tabstrip_painter.sru
forward
global type n_cst_tabstrip_painter from n_cst_base_painter
end type
end forward

global type n_cst_tabstrip_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables
Long il_position
Long il_adjustment
end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1)
public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1, boolean ab_double)
public function integer of_drawclosebutton (point a_bounds[], long ahdc, boolean ab_mouseoverclose)
public function integer of_getycenter (point a_points[])
public function integer of_drawtabs (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, long al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize)
public function integer of_drawprogramtabarrow (long ahdc, point a_point[])
public subroutine of_programtabgradient (long al_color1, long al_color2, point points[])
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

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

public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1);GRADIENT_RECT l_Gradient[]
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

public function integer of_drawclosebutton (point a_bounds[], long ahdc, boolean ab_mouseoverclose);Long ll_y, ll_x
ULong hRgn, hRPen

IF ab_mouseoverclose THEN
	hRgn = inv_win32.CreateRectRgn (a_bounds[1].px, a_bounds[1].py , a_bounds[3].px , a_bounds[3].py )
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (ahdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (a_bounds[1].px + 1, a_bounds[1].py + 1, a_bounds[3].px - 1 , a_bounds[3].py - 1)
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (ahdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF

ll_y = a_bounds[1].py - 2
ll_x = a_bounds[1].px + 2

inv_win32.SetPixel(ahdc, ll_x + 0, 4 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 1, 4 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 7, 4 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 8, 4 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 1, 5 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 2, 5 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 6, 5 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 7, 5 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 2, 6 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 3, 6 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 5, 6 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 6, 6 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 3, 7 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 4, 7 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 5, 7 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 3, 8 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 4, 8 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 5, 8 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 2, 9 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 3, 9 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 5, 9 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 6, 9 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 1, 10 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 2, 10 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 6, 10 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 7, 10 + ll_y, 0)

inv_win32.SetPixel(ahdc, ll_x + 0, 11 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 1, 11 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 7, 11 + ll_y, 0)
inv_win32.SetPixel(ahdc, ll_x + 8, 11 + ll_y, 0)

RETURN 1

end function

public function integer of_getycenter (point a_points[]);Long ll_index, ll_count
Long ll_max

ll_count = UpperBound(a_points)

FOR ll_index = 1 TO ll_count
	IF ll_max < a_points[ll_index].PY THEN
		ll_max = a_points[ll_index].PY
	END IF
NEXT

RETURN ((ll_max - 16) / 2) + 1
end function

public function integer of_drawtabs (boolean ab_vistastyle, dragobject ado_palette, tabstrip ast_tab[], long al_width, long al_height, long al_bordercolor, long al_imagelist, boolean ab_bottom, boolean ab_boldselected, long al_start, string fontname, long fontsize);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth
Boolean lb_bold

ll_count = UpperBound(ast_tab)

l_Line[1].upperleft = 0
l_Line[1].lowerright = al_height - 1
l_Line[2].upperleft = al_width
l_Line[2].lowerright = al_height - 1

IF ab_bottom THEN
	ll_texty = 16
	l_Line[1].lowerright = 0
	l_Line[2].lowerright = 0
ELSE
	ll_texty = 22
	
	IF UpperBound(ast_tab) > 0 THEN
		IF ast_tab[1].al_style = 4 THEn
			ll_texty = 30
		END IF
	END IF
END IF

hRPen =inv_win32.CreatePen(0,0,al_bordercolor)
inv_win32.SelectObject(il_HDC, hRPen)
hRgn = inv_win32.PolyLine(il_HDC, l_Line, 2)
inv_win32.DeleteObject(hRgn)
inv_win32.DeleteObject(hRPen)

Long ll_iteration
FOR ll_iteration = 1 TO 2
FOR ll_index = ll_count TO al_start STEP -1 //al_start TO ll_count
	IF NOT ast_tab[ll_index].ab_visible THEN CONTINUE
	
	IF ll_iteration = 2 AND NOT ast_tab[ll_index].ab_selected THEN CONTINUE
	
	lp = lp_empty
	
	lp = ast_tab[ll_index].ast_point
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	Corner[1].X = 0 
	Corner[1].Y = 3 
	Corner[2].X = al_width
	Corner[2].Y = 3
	Corner[3].X = al_width
	Corner[3].Y = al_height
	Corner[4].X = 0
	Corner[4].Y = al_height
	
	IF ab_bottom THEN
		Corner[1].Y = 1 
		Corner[2].Y = 1
		Corner[3].Y = al_height - 3
		Corner[3].Y = al_height - 3
	ELSE
		
	END IF
	
	// Set the colors in the first corner (top left)
	IF ast_tab[ll_index].al_style = 4 AND NOT ast_tab[ll_index].ab_mouseover THEN
		of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	ELSE
		of_SplitRGB (ast_tab[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
	END IF
	Corner[1].Red = ll_Red
	Corner[1].Green = ll_Green
	Corner[1].Blue = ll_Blue
	
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (ast_tab[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
	Corner[3].Red = ll_Red
	Corner[3].Green = ll_Green
	Corner[3].Blue = ll_Blue
	
	//Create Polygon
	hRgn = inv_win32.CreatePolygonRgn(lp, UpperBound(lp), 1)
	inv_win32.SelectClipRgn(il_HDC, hRgn)
	
	//Gradient Fill
	IF ast_tab[ll_index].ab_programtab THEN
		//of_Vista2Gradient(ast_tab[ll_index].al_backcolor1, ast_tab[ll_index].al_backcolor2, ado_palette,ab_bottom,0, TRUE)
		
		IF ast_tab[ll_index].ab_MouseOver THEN
			of_ProgramTabGradient(ast_tab[ll_index].al_backcolor1,ast_tab[ll_index].al_backcolor1,lp)
		ELSE
			of_ProgramTabGradient(ast_tab[ll_index].al_backcolor1,ast_tab[ll_index].al_backcolor2,lp)
		END IF
	ELSE
		IF ll_iteration = 2 OR NOT ab_vistastyle THEN
			inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		ELSE
			of_Vista2Gradient(ast_tab[ll_index].al_backcolor1, ast_tab[ll_index].al_backcolor2, ado_palette,ab_bottom,0, TRUE)
		END IF
	END IF
	
	inv_win32.SelectClipRgn(il_HDC, 0)
	
	inv_win32.DeleteObject(hRgn)
	
	IF ast_tab[ll_index].ab_enabled THEN
		ll_textcolor = ast_tab[ll_index].al_textcolor
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_tab[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF il_position = 1 THEN
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ALIGN_LEFT, PixelsToUnits(ast_tab[ll_index].al_textx + 21, XPixelsToUnits!), ll_texty - 5, PixelsToUnits(ast_tab[ll_index].al_textwidth, XPixelsToUnits!), 76, FALSE, FALSE, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ALIGN_LEFT, PixelsToUnits(ast_tab[ll_index].al_textx + 5, XPixelsToUnits!), ll_texty - 5, PixelsToUnits(ast_tab[ll_index].al_textwidth, XPixelsToUnits!), 76, FALSE, FALSE, FALSE, FALSE)
		END IF
	ELSE
		IF ast_tab[ll_index].al_pic_index > 0 THEN
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ALIGN_LEFT, PixelsToUnits(ast_tab[ll_index].al_textx + 21, XPixelsToUnits!), ll_texty - 10, PixelsToUnits(ast_tab[ll_index].al_textwidth, XPixelsToUnits!), 76, FALSE, FALSE, FALSE, FALSE)
		ELSE
			of_DrawText(ado_palette, ast_tab[ll_index].as_tab_text, ll_textcolor, FontName, FontSize, lb_bold, ALIGN_LEFT, PixelsToUnits(ast_tab[ll_index].al_textx + 5, XPixelsToUnits!), ll_texty - 10, PixelsToUnits(ast_tab[ll_index].al_textwidth, XPixelsToUnits!), 76, FALSE, FALSE, FALSE, FALSE)
		END IF
	END IF
	
	//-----------------------------------------
	//Don't display border around the ribbon type tab
	IF (ast_tab[ll_index].al_style = 4 AND & 
		(ast_tab[ll_index].ab_selected OR ast_tab[ll_index].ab_programtab)) OR &
		ast_tab[ll_index].al_style <> 4 THEN
		
		IF ast_tab[ll_index].ab_programtab THEN
			hRPen = inv_win32.CreatePen(0,0,ast_tab[ll_index].al_bordercolor)
		ELSE
			hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
		END IF
		
		inv_win32.SelectObject(il_HDC, hRPen)
		hRgn = inv_win32.PolyLine(il_HDC, lp, UpperBound(lp))
	
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	//----------------------------------------

	IF ast_tab[ll_index].ab_enabled THEN
		inv_win32.ImageList_Draw(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ast_tab[ll_index].al_Textx + 2, of_GetYCenter(ast_tab[ll_index].ast_point) - il_adjustment, ILD_TRANSPARENT )
	ELSE
		ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
		inv_win32.ImageList_DrawEx(al_imagelist, ast_tab[ll_index].al_pic_index - 1, il_HDC, ast_tab[ll_index].al_Textx + 2, of_GetYCenter(ast_tab[ll_index].ast_point) - 2, 16,16, 4294967295, RGB(128,128,128), ll_parm )
	END IF

	//-----------------------------------------
	
	
	IF ast_tab[ll_index].ab_selected THEN
		
		l_Line[1].upperleft = ast_tab[ll_index].ast_point[1].px + 1
		l_Line[1].lowerright = ast_tab[ll_index].ast_point[1].py
		l_Line[2].upperleft = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].px
		l_Line[2].lowerright = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].py
		
		IF ab_bottom THEN
			l_Line[1].lowerright = ast_tab[ll_index].ast_point[1].py - 1
			l_Line[2].lowerright = ast_tab[ll_index].ast_point[UpperBound(ast_tab[ll_index].ast_point)].py - 1
		END IF
		
		hRPen = inv_win32.CreatePen(0,0,ast_tab[ll_index].al_backcolor2)
		inv_win32.SelectObject(il_HDC, hRPen)
		hRgn = inv_win32.PolyLine(il_HDC, l_Line, 2)
		inv_win32.DeleteObject(hRgn)
		inv_win32.DeleteObject(hRPen)		
	END IF

	IF UpperBound(ast_tab[ll_index].ast_closebutton) > 1 THEN
		of_DrawCloseButton(ast_tab[ll_index].ast_closebutton, il_HDC, ast_tab[ll_index].ab_mouseoverclose)
	END IF
	
	IF ast_tab[ll_index].ab_programtab THEN
		of_DrawProgramTabArrow(il_HDC, ast_tab[ll_index].ast_point)
	END IF
	
		
NEXT
NEXT

RETURN 1
end function

public function integer of_drawprogramtabarrow (long ahdc, point a_point[]);Long ll_x, ll_y, ll_index
Long ll_color

ll_color = RGB(255,255,255)
ll_y = 11 - il_adjustment
ll_x = 33

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(ahdc, ll_x, ll_y, ll_color)
	
RETURN 1
end function

public subroutine of_programtabgradient (long al_color1, long al_color2, point points[]);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen
Long ll_width, ll_height
TRIVERTEX dim[4]

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
ll_width = 60
ll_height = 24
	
dim[1].X = 0 
dim[1].Y = 0 
dim[2].X = ll_width
dim[2].Y = 0
dim[3].X = ll_width
dim[3].Y = ll_height / 2
dim[4].X = 0
dim[4].Y = ll_height / 2

	
// Set the colors in the first corner (top left)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
dim[1].Red = ll_Red
dim[1].Green = ll_Green
dim[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
dim[3].Red = ll_Red
dim[3].Green = ll_Green
dim[3].Blue = ll_Blue
	
//Create Polygon
hRgn = inv_win32.CreatePolygonRgn(points, UpperBound(points), 1)
inv_win32.SelectClipRgn(il_HDC, hRgn)
inv_win32.GradientRectangle (il_HDC, dim, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
inv_win32.DeleteObject(hRgn)


dim[1].X = 0 
dim[1].Y = ll_height / 2 
dim[2].X = ll_width
dim[2].Y = ll_height / 2
dim[3].X = ll_width
dim[3].Y = ll_height + 3
dim[4].X = 0
dim[4].Y = ll_height	+ 3
	
// Set the colors in the first corner (top left)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
dim[1].Red = ll_Red
dim[1].Green = ll_Green
dim[1].Blue = ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
dim[3].Red = ll_Red
dim[3].Green = ll_Green
dim[3].Blue = ll_Blue
	
//Create Polygon
hRgn = inv_win32.CreatePolygonRgn(points, UpperBound(points), 1)
inv_win32.SelectClipRgn(il_HDC, hRgn)
inv_win32.GradientRectangle (il_HDC, dim, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
inv_win32.DeleteObject(hRgn)
end subroutine

on n_cst_tabstrip_painter.create
call super::create
end on

on n_cst_tabstrip_painter.destroy
call super::destroy
end on

