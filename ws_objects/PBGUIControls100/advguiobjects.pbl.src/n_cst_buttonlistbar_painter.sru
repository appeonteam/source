$PBExportHeader$n_cst_buttonlistbar_painter.sru
forward
global type n_cst_buttonlistbar_painter from n_cst_base_painter
end type
end forward

global type n_cst_buttonlistbar_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, long al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style)
public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, long al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm, ll_sizeparm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC//GetDC (HDC)

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

IF ab_elipse THEN
	ll_sizeparm = of_BitWiseOr(al_align, DT_WORD_ELLIPSIS)
ELSE
	IF ab_wordwrap THEN
		ll_sizeparm = of_BitWiseOr(al_align, DT_WORDBREAK)
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
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ll_DC, al_color)

IF NOT ab_elipse THEN
	inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
END IF

l_Rect.Right = al_width

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_sizeparm)

il_NewHeight = l_Rect.Bottom
il_newWidth = l_Rect.RIGHT

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function integer of_drawbuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, long al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth, ll_y
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	lp = lp_empty
	
	lp = ast_buttons[ll_index].ast_point
	
	IF lp[4].py < 0 OR lp[1].py > al_height THEN
		CONTINUE
	END IF
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_buttons[ll_index].ab_selected OR &
	   ast_buttons[ll_index].ab_mouseover THEN
		Corner[1].X = lp[1].px 
		Corner[1].Y = lp[1].py
		Corner[2].X = lp[2].px 
		Corner[2].Y = lp[2].py
		Corner[3].X = lp[3].px 
		Corner[3].Y = lp[3].py
		Corner[4].X = lp[4].px 
		Corner[4].Y = lp[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue
		
		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
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
	
	IF ast_buttons[ll_index].ab_enabled THEN
		ll_textcolor = 0
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_buttons[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF al_style = 1 THEN //BUTTON STYLE
		lb_buttonstyle = TRUE
	ELSE
		lb_buttonstyle = FALSE
	END IF
	
	IF lb_ButtonStyle THEN
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'tahoma', &
					8, lb_bold, ALIGN_CENTER, &
					ast_buttons[ll_index].ast_point[1].px, &
					ast_buttons[ll_index].ast_point[1].py + il_imagesize + 6, &
					ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px + 10, &
					ast_buttons[ll_index].al_textheight, &
					FALSE, FALSE, FALSE, TRUE)
	
		IF ast_buttons[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (il_imagesize / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + 4, &
								  ILD_TRANSPARENT )
		ELSE
			ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
			inv_win32.ImageList_DrawEx(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (il_imagesize / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + 4, &
								  il_imagesize,il_imagesize, &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	ELSE
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'tahoma', &
					8, lb_bold, ALIGN_LEFT, &
					ast_buttons[ll_index].ast_point[1].px + il_imagesize + 6, &
					ast_buttons[ll_index].ast_point[1].py + &
								                 ((ast_buttons[ll_index].ast_point[4].py - &
											     ast_buttons[ll_index].ast_point[1].py - &
												 ast_buttons[ll_index].al_textheight) / 2), &
					ast_buttons[ll_index].ast_point[2].px  , &
					ast_buttons[ll_index].ast_point[4].py, &
					FALSE, FALSE, FALSE, TRUE)
					
		IF ast_buttons[ll_index].al_image > 0 THEN
			IF ast_buttons[ll_index].ab_enabled THEN
				inv_win32.ImageList_Draw(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].ast_point[1].px + 2, &
									  ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - il_imagesize) / 2), &
									  ILD_TRANSPARENT )
									  //ast_buttons[ll_index].ast_point[1].py + 2, &
									  //ILD_TRANSPARENT )
			ELSE
				ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
				inv_win32.ImageList_DrawEx(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].ast_point[1].px + 2, &
										ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - il_imagesize) / 2), &
									  il_imagesize,il_imagesize, &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_drawmenubuttons (dragobject ado_palette, buttons ast_buttons[], long al_bordercolor, long al_imagelist, boolean ab_boldselected, long il_imagesize, long al_height, integer al_style);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth, ll_y
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	lp = lp_empty
	
	lp = ast_buttons[ll_index].ast_point
	
	IF ast_buttons[ll_index].ab_line THEN
		l_Line[1].upperleft = lp[1].px
		l_Line[1].lowerright = lp[1].py
		l_Line[2].upperleft = lp[2].px
		l_Line[2].lowerright = lp[2].py
		
		hRPen = inv_win32.CreatePen(0,0,RGB(207,219,235))
		inv_win32.SelectObject(il_HDC, hRPen)
		hRgn = inv_win32.PolyLine(il_HDC, l_Line, 2)
		
		inv_win32.DeleteObject(hRPen)
		inv_win32.DeleteObject(hRgn)
		
		CONTINUE
	END IF
	
	l_Gradient[1].UpperLeft = 0
	l_Gradient[1].LowerRight = 2
	
	IF ast_buttons[ll_index].ab_selected OR &
	   ast_buttons[ll_index].ab_mouseover THEN
		Corner[1].X = lp[1].px 
		Corner[1].Y = lp[1].py
		Corner[2].X = lp[2].px 
		Corner[2].Y = lp[2].py
		Corner[3].X = lp[3].px 
		Corner[3].Y = lp[3].py
		Corner[4].X = lp[4].px 
		Corner[4].Y = lp[4].py
		
		// Set the colors in the first corner (top left)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor1, ll_Red, ll_Green, ll_Blue)
		Corner[1].Red = ll_Red
		Corner[1].Green = ll_Green
		Corner[1].Blue = ll_Blue
		
		// Set the colors in the third corner (bottom right)
		of_SplitRGB (ast_buttons[ll_index].al_backcolor2, ll_Red, ll_Green, ll_Blue)
		Corner[3].Red = ll_Red
		Corner[3].Green = ll_Green
		Corner[3].Blue = ll_Blue
		
		//Create Polygon
		hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
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
	
	IF ast_buttons[ll_index].ab_enabled THEN
		ll_textcolor = 0
	ELSE
		ll_textcolor = RGB(100,100,100)
	END IF
	
	IF ab_boldselected AND ast_buttons[ll_index].ab_selected THEN
		lb_bold = TRUE
	ELSE
		lb_bold = FALSE
	END IF
	
	IF al_style = 1 THEN //BUTTON STYLE
		lb_buttonstyle = TRUE
	ELSE
		lb_buttonstyle = FALSE
	END IF
	
	IF lb_ButtonStyle THEN
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'tahoma', &
					8, lb_bold, ALIGN_CENTER, &
					ast_buttons[ll_index].ast_point[1].px, &
					ast_buttons[ll_index].ast_point[1].py + il_imagesize + 6, &
					ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px + 10, &
					ast_buttons[ll_index].al_textheight, &
					FALSE, FALSE, FALSE, TRUE)
	
		IF ast_buttons[ll_index].ab_enabled THEN
			inv_win32.ImageList_Draw(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (il_imagesize / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + 4, &
								  ILD_TRANSPARENT )
		ELSE
			ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
			inv_win32.ImageList_DrawEx(al_imagelist, &
								  ast_buttons[ll_index].al_image - 1, &
								  il_HDC, &
								  ast_buttons[ll_index].ast_point[1].px + (ast_buttons[ll_index].ast_point[2].px - ast_buttons[ll_index].ast_point[1].px) / 2 - (il_imagesize / 2) , &
								  ast_buttons[ll_index].ast_point[1].py + 4, &
								  il_imagesize,il_imagesize, &
								  4294967295, RGB(128,128,128), ll_parm )
		END IF
	ELSE
		of_DrawText(ado_palette, &
	            ast_buttons[ll_index].as_text, &
					ll_textcolor, &
					'tahoma', &
					8, lb_bold, ALIGN_LEFT, &
					ast_buttons[ll_index].ast_point[1].px + il_imagesize + 18, &
					ast_buttons[ll_index].ast_point[1].py + &
								                 ((ast_buttons[ll_index].ast_point[4].py - &
											     ast_buttons[ll_index].ast_point[1].py - &
												 ast_buttons[ll_index].al_textheight) / 2), &
					ast_buttons[ll_index].ast_point[2].px  , &
					ast_buttons[ll_index].ast_point[4].py, &
					FALSE, FALSE, FALSE, TRUE)
					
		IF ast_buttons[ll_index].al_image > 0 THEN
			IF ast_buttons[ll_index].ab_enabled THEN
				inv_win32.ImageList_Draw(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].ast_point[1].px + 6, &
									  ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - il_imagesize) / 2), &
									  ILD_TRANSPARENT )
									  //ast_buttons[ll_index].ast_point[1].py + 2, &
									  //ILD_TRANSPARENT )
			ELSE
				ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
				inv_win32.ImageList_DrawEx(al_imagelist, &
									  ast_buttons[ll_index].al_image - 1, &
									  il_HDC, &
									  ast_buttons[ll_index].ast_point[1].px + 6, &
										ast_buttons[ll_index].ast_point[1].py + &
														  ((ast_buttons[ll_index].ast_point[4].py - ast_buttons[ll_index].ast_point[1].py - il_imagesize) / 2), &
									  il_imagesize,il_imagesize, &
									  4294967295, RGB(128,128,128), ll_parm )
			END IF
		END IF
	END IF
NEXT

RETURN 1
end function

on n_cst_buttonlistbar_painter.create
call super::create
end on

on n_cst_buttonlistbar_painter.destroy
call super::destroy
end on

