$PBExportHeader$n_cst_ribbongroup_painter.sru
forward
global type n_cst_ribbongroup_painter from n_cst_base_painter
end type
end forward

global type n_cst_ribbongroup_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

CONSTANT LONG SCROLLWIDTH = 10

TRIVERTEX Header[4]
strgroupbox istrgroupbox
end variables

forward prototypes
public function unsignedlong of_createfont ()
public function integer of_gettextsize (graphicobject ado_palette)
public function integer of_drawribbongroup (dragobject ado_palette, strgroupbox al_strgroupbox)
public function integer of_drawribbonitems (unsignedlong al_imagelistsmall, unsignedlong al_imagelistlarge, ribbonitem a_items[])
public function integer of_drawarrow (long al_y, long al_x, long al_width, long al_height)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center)
public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center)
public function integer of_drawbackground (long al_color1, long al_color2, long width, long height)
public function integer of_drawverticalline (integer x1, integer y1, integer x2, integer y2, long al_color)
public function integer of_drawleftscroll (long ahdc, dragobject a_container, long al_color)
public function integer of_drawrightscroll (long ahdc, dragobject a_container, long al_color)
public function integer of_drawleftarrow (long al_y, long al_x, long al_width, long al_height)
public function integer of_drawrightarrow (long al_y, long al_x, long al_width, long al_height)
end prototypes

public function unsignedlong of_createfont ();LogFont lstr_Lf
uLong lul_Font

lstr_Lf.lffacename = istrgroupbox.fontfamily
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(istrgroupbox.FontSize, inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY), 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_gettextsize (graphicobject ado_palette);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm, ll_sizeparm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(istrgroupbox.Text)) = 0 THEN
	RETURN 0
END IF

ll_DC = il_HDC

of_CreateFont()

IF istrgroupbox.bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

ll_parm = DT_CALCRECT

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = 0
l_Rect.Top = 0
l_Rect.Right = 0
l_Rect.Bottom = 0

inv_win32.SetTextColor(ll_DC, istrgroupbox.FontColor)

inv_win32.Drawtext(ll_DC, istrgroupbox.Text, LEN(istrgroupbox.Text), l_Rect, ll_parm)

il_newHeight = l_Rect.Bottom
il_newWidth = l_Rect.Right

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function integer of_drawribbongroup (dragobject ado_palette, strgroupbox al_strgroupbox);Long ll_texty

istrgroupbox = al_strGroupBox

of_GetTextSize(ado_palette)

of_DrawText(al_strGroupBox.text, RGB(30,57,91), &
            al_strGroupBox.X, &
				al_strGroupBox.y + al_strGroupBox.height - 14, &
				al_strGroupBox.Width, 16, TRUE)
	
of_DrawVerticalLine(al_strGroupBox.X + al_strGroupBox.Width, &
                    0, &
						  al_strGroupBox.X + al_strGroupBox.Width, &
						  UnitsToPixels(ado_palette.Height, YUnitsToPixels!), &
						  al_strGroupBox.BorderColor)
	
RETURN 1
end function

public function integer of_drawribbonitems (unsignedlong al_imagelistsmall, unsignedlong al_imagelistlarge, ribbonitem a_items[]);Long ll_index, ll_count, ll_imagesize, ll_parm, ll_x, ll_color1, ll_color2, ll_minus, ll_textcolor, ll_border
ULong ll_imagelist, hRPen, hRgn
Long	ll_Red, &
		ll_Green, &
		ll_Blue
gradient_rect l_Gradient[1]

ll_count = UpperBound(a_items)

FOR ll_index = 1 TO ll_count
	
	IF (a_items[ll_index].ab_selected OR &
	   a_items[ll_index].ab_mouseover OR &
		a_items[ll_index].a_menu.Checked) AND &
		a_items[ll_index].a_menu.Enabled THEN
		
		IF a_items[ll_index].ab_mouseover OR a_items[ll_index].a_menu.Checked THEN
			ll_color1 = a_items[ll_index].al_mouseovercolor1
			ll_color2 = a_items[ll_index].al_mouseovercolor2
			ll_border = RGB(238, 200, 88)
		END IF
		
		IF a_items[ll_index].ab_selected THEN
			ll_color1 = a_items[ll_index].al_mouseovercolor2
			ll_color2 = a_items[ll_index].al_mouseovercolor1
			ll_border = RGB(238, 200, 88)
		END IF

		l_Gradient[1].UpperLeft = 0
		l_Gradient[1].LowerRight = 2
	
		Corner[1].X = a_items[ll_index].ast_point[1].px 
		Corner[1].Y = a_items[ll_index].ast_point[1].py
		Corner[2].X = a_items[ll_index].ast_point[2].px 
		Corner[2].Y = a_items[ll_index].ast_point[2].py
		Corner[3].X = a_items[ll_index].ast_point[3].px 
		Corner[3].Y = a_items[ll_index].ast_point[3].py
		Corner[4].X = a_items[ll_index].ast_point[4].px 
		Corner[4].Y = a_items[ll_index].ast_point[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ll_color1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ll_color2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue

		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,ll_border)
		inv_win32.SelectObject(il_HDC, hRPen)
		
		hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,7,7)
		inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,10,10)
		
		inv_win32.SelectClipRgn(il_HDC, hRgn)
		
		//Gradient Fill
		inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
		
		inv_win32.SelectClipRgn(il_HDC, 0)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
	END IF
	
	IF a_items[ll_index].ai_type = 0 OR a_items[ll_index].ai_type = 2 THEN
		//Small
		ll_imagesize = 16
		ll_imagelist = al_imagelistsmall
		ll_x = 0
	ELSE
		ll_imagesize = 32
		ll_imagelist = al_imagelistlarge
		ll_x = ((a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px - ll_imagesize) / 2) - 2
	END IF

	IF a_items[ll_index].a_menu.Enabled THEN
		ll_textcolor = RGB(30,57,91)
	ELSE
		ll_textcolor = RGB(128,128,128)
	END IF

	IF Len(Trim(a_items[ll_index].as_image)) > 0 THEN

		IF a_items[ll_index].a_menu.Enabled THEN
			
			inv_win32.ImageList_Draw(ll_imagelist, &
								  a_items[ll_index].al_imageindex - 1, &
								  il_HDC, &
								  a_items[ll_index].ast_point[1].px + ll_x + 2, &
								  a_items[ll_index].ast_point[1].py + 2, &
								  ILD_TRANSPARENT )
		ELSE
			
			ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
			inv_win32.ImageList_DrawEx(ll_imagelist, &
								  a_items[ll_index].al_imageindex - 1, &
								  il_HDC, &
								  a_items[ll_index].ast_point[1].px + ll_x + 2, &
								  a_items[ll_index].ast_point[1].py + 2, &
								  ll_imagesize,ll_imagesize, &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	END IF
	

	
	IF a_items[ll_index].ai_type = 0 OR a_items[ll_index].ai_type = 2 THEN
		of_DrawText(a_items[ll_index].as_text, ll_textcolor, a_items[ll_index].ast_point[1].px + ll_imagesize + 4, a_items[ll_index].ast_point[1].py + 3, FALSE)
		
		IF a_items[ll_index].ai_type = 2 THEN
			of_DrawArrow(a_items[ll_index].ast_point[1].py +  4, &
								 a_items[ll_index].ast_point[2].px - 8, 0, &
								 a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py)
		END IF
	ELSE
		
		IF a_items[ll_index].ai_type = 3 THEN //COLLECTION
			of_DrawArrow(a_items[ll_index].ast_point[1].py + ll_imagesize, &
			             a_items[ll_index].ast_point[1].px + 1, &
							 a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px, &
							 a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py)
			
		END IF
		
		IF a_items[ll_index].ai_type = 3 OR a_items[ll_index].ai_type = 1 THEN
			ll_imagesize = ll_imagesize + 2
		END IF
		
		of_DrawText(a_items[ll_index].as_text, ll_textcolor, &
									a_items[ll_index].ast_point[1].px, &
									a_items[ll_index].ast_point[1].py + ll_imagesize + 2, &
									a_items[ll_index].ast_point[2].px - a_items[ll_index].ast_point[1].px, &
									a_items[ll_index].ast_point[3].py - a_items[ll_index].ast_point[1].py, TRUE)
	END IF
NEXT

RETURN 1
end function

public function integer of_drawarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(93,93,93)

ll_y = al_y + 1
ll_x = al_x + (al_width / 2 - 4)
	
ll_y = ll_y + 2
ll_x = ll_x + 1

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x + ll_index, ll_y, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 2

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, long al_width, long al_height, boolean ab_center);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm, ll_sizeparm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF

ll_DC = il_HDC

inv_win32.SetBkMode(ll_DC, 1)

of_CreateFont()

inv_win32.SelectObject(ll_DC, iul_font)

ll_parm = of_BitWiseOr(ALIGN_CENTER, DT_WORDBREAK)

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = 200

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function integer of_drawtext (string as_text, long al_color, long al_x, long al_y, boolean ab_center);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm, ll_sizeparm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF


ll_DC = il_HDC

inv_win32.SetBkMode(ll_DC, 1)

of_CreateFont()

inv_win32.SelectObject(ll_DC, iul_font)

ll_parm = DT_CALCRECT

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = 0
l_Rect.Bottom = 0

inv_win32.SetTextColor(ll_DC, al_color)

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

IF ab_center THEN
	l_Rect.Left = (istrgroupbox.Width - l_Rect.Right) / 2
	l_Rect.Right = istrgroupbox.Width
END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_sizeparm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)

RETURN 1
end function

public function integer of_drawbackground (long al_color1, long al_color2, long width, long height);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_color1, l_color2

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = 0
Corner[1].Y = 0
Corner[2].X = width
Corner[2].Y = 0
Corner[3].X = width
Corner[3].Y = height
Corner[4].X = 0 
Corner[4].Y = height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

public function integer of_drawverticalline (integer x1, integer y1, integer x2, integer y2, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_color1, l_color2

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
//FIRST LINE
Corner[1].X = X1
Corner[1].Y = Y1
Corner[2].X = X1 + 1
Corner[2].Y = Y1
Corner[3].X = X1 + 1
Corner[3].Y = Y2
Corner[4].X = X1 
Corner[4].Y = Y2
		
// Set the colors in the first corner (top left)
of_SplitRGB (RGB(225, 234, 246), ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

//SECOND LINE
Corner[1].X = X1 + 1
Corner[1].Y = Y1
Corner[2].X = X1 + 2
Corner[2].Y = Y1
Corner[3].X = X1 + 2
Corner[3].Y = Y2
Corner[4].X = X1 + 1
Corner[4].Y = Y2
		
// Set the colors in the first corner (top left)
//of_SplitRGB (RGB(220,235,253), ll_Red, ll_Green, ll_Blue)
of_SplitRGB (RGB(236,236,248), ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (RGB(239,244,251), ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(il_HDC, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)


RETURN 1
end function

public function integer of_drawleftscroll (long ahdc, dragobject a_container, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_color1, l_color2
Long ll_height

ll_height = UnitsToPixels(a_container.Height, YUnitsToPixels!)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = 0
Corner[1].Y = 0
Corner[2].X = SCROLLWIDTH
Corner[2].Y = 0
Corner[3].X = SCROLLWIDTH
Corner[3].Y = ll_height
Corner[4].X = 0 
Corner[4].Y = ll_height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (ahdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(ahdc, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

of_DrawLeftArrow(ll_height / 2, 0, SCROLLWIDTH, ll_height)

RETURN 1
end function

public function integer of_drawrightscroll (long ahdc, dragobject a_container, long al_color);gradient_rect l_Gradient[1]
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_color1, l_color2
Long ll_height, ll_width

ll_height = UnitsToPixels(a_container.Height, YUnitsToPixels!)
ll_width = UnitsToPixels(a_container.Width, XUnitsToPixels!)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = ll_width - SCROLLWIDTH
Corner[1].Y = 0
Corner[2].X = ll_width
Corner[2].Y = 0
Corner[3].X = ll_width
Corner[3].Y = ll_height
Corner[4].X = ll_width - SCROLLWIDTH
Corner[4].Y = ll_height
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_color, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Gradient Fill
inv_win32.GradientRectangle (ahdc, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.SelectClipRgn(ahdc, 0)
	
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

of_DrawRightArrow(ll_height / 2, ll_width - SCROLLWIDTH, SCROLLWIDTH, ll_height)

RETURN 1
end function

public function integer of_drawleftarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(255,255,255)

ll_y = al_y - 2
ll_x = al_x + 6

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x, ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x - 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x - 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 2
ll_x = ll_x - 1

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

public function integer of_drawrightarrow (long al_y, long al_x, long al_width, long al_height);Long ll_y, ll_x, ll_index
Long ll_color

ll_color = RGB(255,255,255)

ll_y = al_y - 2
ll_x = al_x + 4

FOR ll_index = 1 TO 7
	inv_win32.SetPixel(il_HDC, ll_x, ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 5
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 1
ll_x = ll_x + 1

FOR ll_index = 1 TO 3
	inv_win32.SetPixel(il_HDC, ll_x , ll_y + ll_index, ll_color)
NEXT

ll_y = ll_y + 2
ll_x = ll_x + 1

inv_win32.SetPixel(il_HDC, ll_x, ll_y, ll_color)

RETURN 1

end function

on n_cst_ribbongroup_painter.create
call super::create
end on

on n_cst_ribbongroup_painter.destroy
call super::destroy
end on

