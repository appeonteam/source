$PBExportHeader$n_cst_toolbarstrip_painter.sru
forward
global type n_cst_toolbarstrip_painter from n_cst_base_painter
end type
end forward

global type n_cst_toolbarstrip_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow)
public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public subroutine of_drawverticalline (integer x1, integer y1, integer x2, integer y2, long al_color1)
public subroutine of_drawline (integer x1, integer y1, integer x2, integer y2, long al_color1)
public subroutine of_drawhorizontalline (integer x1, integer y1, integer x2, integer y2, long al_color1)
public function integer of_drawverticaltext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap)
public function integer of_drawarrow (long ahdc, long ll_x, long ll_y)
public function integer of_drawbuttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, long al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess)
end prototypes

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow);RETURN of_DrawText (ado_palette, as_text, al_color, as_font, al_size, ab_bold, al_align, al_x, al_y, al_width, al_height, ab_displayshadow, FALSE, FALSE, FALSE)
end function

public function integer of_drawtext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC, ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback

LONG hRPen, ll_origalign

IF Len(Trim(as_text)) = 0 THEN
	il_newWidth = 1
	il_NewHeight = al_height
	RETURN 0
END IF

ll_origalign = al_align

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN 0

ll_DC = il_HDC

of_CreateFont(as_font, al_size, ab_underline)

IF ab_bold THEN
	inv_win32.SelectObject(ll_DC, iul_fontbold)
ELSE
	inv_win32.SelectObject(ll_DC, iul_font)
END IF

al_align = of_BitWiseOr(DT_NOCLIP, al_align)

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
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ll_DC, al_color)

IF NOT ab_elipse THEN
	inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)
END IF

IF ll_origalign = ALIGN_RIGHT OR ll_origalign = ALIGN_CENTER THEN
	l_Rect.Right = al_x + al_width
END IF

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, al_align)

il_NewHeight = PixelsToUnits(l_Rect.Bottom, YPixelsToUnits!)
il_newWidth = PixelsToUnits(l_Rect.RIGHT, XPixelsToUnits!)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public subroutine of_drawverticalline (integer x1, integer y1, integer x2, integer y2, long al_color1);GRADIENT_RECT l_Gradient[]
LONG hRPen, ll_DC
uLONG hRgn

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

l_Gradient[1].upperleft = X1 + 1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2 + 1
l_Gradient[2].lowerright = Y2

hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
inv_win32.SelectObject(ll_DC, hRPen)
hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)
end subroutine

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

public subroutine of_drawhorizontalline (integer x1, integer y1, integer x2, integer y2, long al_color1);GRADIENT_RECT l_Gradient[]
LONG hRPen, ll_DC
uLONG hRgn

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2

ll_DC = il_HDC

hRPen = inv_win32.CreatePen(0,0,al_color1)
inv_win32.SelectObject(ll_DC, hRPen)
hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

l_Gradient[1].upperleft = X1
l_Gradient[1].lowerright = Y1 + 1
l_Gradient[2].upperleft = X2
l_Gradient[2].lowerright = Y2 + 1

hRPen = inv_win32.CreatePen(0,0,RGB(255,255,255))
inv_win32.SelectObject(ll_DC, hRPen)
hRgn = inv_win32.PolyLine(ll_DC, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)
end subroutine

public function integer of_drawverticaltext (graphicobject ado_palette, string as_text, long al_color, string as_font, long al_size, boolean ab_bold, long al_align, long al_x, long al_y, long al_width, long al_height, boolean ab_displayshadow, boolean ab_elipse, boolean ab_underline, boolean ab_wordwrap);Long	ll_Red, &
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

Long graphicsMode

graphicsMode = inv_win32.GetGraphicsMode (ll_DC)

of_CreateFont(as_font, al_size, ab_underline, 270)

inv_win32.SelectObject(ll_DC, iul_font)

inv_win32.SetBkMode(ll_DC, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x + 3
l_Rect.Top = al_y
l_Rect.Right = al_width
l_Rect.Bottom = al_height

inv_win32.SetTextColor(ll_DC, al_color)

//Get new dimensions

inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, DT_CALCRECT)

//Draw real text
ll_parm = of_BitWiseOr(DT_VBOTTOM, DT_HCENTER)
ll_parm = of_BitWiseOr(ll_parm, DT_NOCLIP)

l_Rect.Left = l_Rect.Left + 37
l_Rect.Top = l_Rect.Top - 5
l_Rect.Bottom = l_Rect.Bottom + l_Rect.Right - 20

inv_win32.SelectObject(ll_DC, iul_fontv)
inv_win32.Drawtext(ll_DC, as_text, LEN(as_text), l_Rect, ll_parm)

il_NewHeight = l_Rect.Bottom + 5
il_newWidth = l_Rect.RIGHT

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

inv_win32.SetGraphicsMode (ll_DC, graphicsMode)

RETURN 1
end function

public function integer of_drawarrow (long ahdc, long ll_x, long ll_y);Long ll_index
	ll_y = ll_y + 2
	ll_x = ll_x + 1
	
	FOR ll_index = 1 TO 7
		inv_win32.SetPixel(ahdc, ll_x + ll_index, ll_y, 0)
	NEXT
	
	ll_y = ll_y + 1
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

public function integer of_drawbuttons (dragobject ado_palette, toolbaritem ast_buttons[], string fontname, integer fontsize, long fontcolor, long al_imagelist, long al_currentorientation, long al_chevronindex, boolean ab_textunderimage, boolean ab_quickaccess);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_texty, ll_textwidth, ll_y, ll_x
Boolean lb_bold, lb_buttonstyle
Long ll_align, ll_fudge, ll_childindex

ll_count = UpperBound(ast_buttons)

FOR ll_index = 1 TO ll_count
	IF ast_buttons[ll_index].Visible = FALSE OR ast_buttons[ll_index].Hidden OR &
	  ast_buttons[ll_index].IsChild THEN
		CONTINUE
	END IF
	
	IF UpperBound(ast_buttons[ll_index].PaintRegion) = 0 THEN
		CONTINUE
	END IF
	
	
	IF ast_buttons[ll_index].IsParent AND NOT ast_buttons[ll_index].IsLocked THEN
		ll_childindex = ast_buttons[ll_index].SelectedChild
		IF ll_childindex = 0 THEN ll_childindex = 1
	ELSE
		ll_childindex = ll_index
	END IF
	
	IF ast_buttons[ll_index].Separator THEN
		lp = ast_buttons[ll_index].PaintRegion
		
		IF al_CurrentOrientation = 1 THEN
			of_DrawVerticalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		ELSE
			of_DrawHorizontalLine(lp[1].px, lp[1].py, lp[2].px, lp[2].py, ast_buttons[ll_index].SeparatorColor)
		END IF
	
	ELSEIF ast_buttons[ll_index].ObjectType THEN
		IF Len(Trim(ast_buttons[ll_index].Text)) > 0 AND UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
				of_DrawText(ado_palette, &
									ast_buttons[ll_index].Text, &
									ll_textcolor, &
									FontName, &
									fontsize, lb_bold, ALIGN_LEFT, &
									ast_buttons[ll_index].PaintRegion[1].px + 2, &
									(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
									(ast_buttons[ll_index].TextHeight / 2) + 1, &
									ast_buttons[ll_index].TextWidth, &
									ast_buttons[ll_index].PaintRegion[3].py, &
									FALSE, FALSE, FALSE, TRUE) 
		END IF
	ELSE
	
		IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
			lp = ast_buttons[ll_index].PaintRegion
			
			l_Gradient[1].UpperLeft = 0
			l_Gradient[1].LowerRight = 2
			
			IF ast_buttons[ll_index].backcolor1 > -1 THEN
				Corner[1].X = lp[1].px 
				Corner[1].Y = lp[1].py
				Corner[2].X = lp[2].px 
				Corner[2].Y = lp[2].py
				Corner[3].X = lp[3].px 
				Corner[3].Y = lp[3].py
				Corner[4].X = lp[4].px 
				Corner[4].Y = lp[4].py
				
				// Set the colors in the first corner (top left)
				of_SplitRGB (ast_buttons[ll_index].BackColor1, ll_Red, ll_Green, ll_Blue)
				Corner[1].Red = ll_Red
				Corner[1].Green = ll_Green
				Corner[1].Blue = ll_Blue
				
				// Set the colors in the third corner (bottom right)
				of_SplitRGB (ast_buttons[ll_index].BackColor2, ll_Red, ll_Green, ll_Blue)
				Corner[3].Red = ll_Red
				Corner[3].Green = ll_Green
				Corner[3].Blue = ll_Blue
				
				//Create Polygon
				hRPen = inv_win32.CreatePen(0,0,ast_buttons[ll_index].BorderColor)
				inv_win32.SelectObject(il_HDC, hRPen)
				hRgn = inv_win32.CreateRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X - 1, Corner[3].Y - 1)
				inv_win32.Rectangle( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y)
				
				inv_win32.SelectClipRgn(il_HDC, hRgn)
				
				//Gradient Fill
				inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
				
				inv_win32.SelectClipRgn(il_HDC, 0)
				
				inv_win32.DeleteObject(hRPen)
				inv_win32.DeleteObject(hRgn)
			END IF
		END IF
		
		IF ast_buttons[ll_index].Enabled THEN
			ll_textcolor = fontcolor
		ELSE
			ll_textcolor = RGB(100,100,100)
		END IF
		
		lb_bold = FALSE
	
			
				IF ast_buttons[ll_index].DisplayText THEN
					IF al_CurrentOrientation = 1 THEN  //Horizontal
						IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
							IF ab_textunderimage THEN
								
								of_DrawText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_CENTER, &
											ast_buttons[ll_index].PaintRegion[1].px , &
											ast_buttons[ll_index].imagesize + 8, &
											ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
											ast_buttons[ll_index].TextHeight, &
											FALSE, FALSE, FALSE, TRUE)
							ELSE
									of_DrawText(ado_palette, &
										ast_buttons[ll_childindex].Text, &
										ll_textcolor, &
										FontName, &
										fontsize, lb_bold, ALIGN_LEFT, &
										ast_buttons[ll_index].PaintRegion[1].px + 5 + ast_buttons[ll_index].ImageSize, &
										(ast_buttons[ll_index].PaintRegion[3].py / 2) - &
										(ast_buttons[ll_index].TextHeight / 2) +  &
										ast_buttons[ll_index].PaintRegion[1].py, &
										ast_buttons[ll_index].TextWidth, &
										ast_buttons[ll_index].imagesize + 2, &
										FALSE, FALSE, FALSE, TRUE)
									END IF
						END IF
 
					ELSE
						IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
							IF ab_textunderimage THEN
								of_DrawText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_CENTER, &
											ast_buttons[ll_index].PaintRegion[1].px , &
											ast_buttons[ll_index].PaintRegion[1].py + ast_buttons[ll_index].imagesize + 2, &
											ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px, &
											ast_buttons[ll_index].TextHeight, &
											FALSE, TRUE, FALSE, FALSE)
							ELSE
								of_DrawVerticalText(ado_palette, &
											ast_buttons[ll_childindex].Text, &
											ll_textcolor, &
											FontName, &
											fontsize, lb_bold, ALIGN_LEFT, &
											0, &
											ast_buttons[ll_index].PaintRegion[1].py + 10 + ast_buttons[ll_index].ImageSize, &
											ast_buttons[ll_index].imagesize + 2, &
											0, &
											FALSE, FALSE, FALSE, TRUE)
							END IF
						END IF
					END IF
				END IF

			
			Long ll_extrax, ll_padding
			
			IF ab_quickaccess THEN
				ll_padding = 1
				ll_extrax = 1
			ELSE
				ll_padding = 2
				IF ab_textunderimage THEN
					ll_extrax = ast_buttons[ll_index].PaintRegion[2].px - ast_buttons[ll_index].PaintRegion[1].px - 4
					
					IF al_CurrentOrientation = 1 THEN
						IF ll_extrax < ast_buttons[ll_index].TextWidth THEN
							ll_extrax = ast_buttons[ll_index].TextWidth
						END IF
						
						IF ast_buttons[ll_index].IsParent THEN
							ll_extrax = ll_extrax - 12
						END IF
					END IF
					
					ll_extrax = ((ll_extrax - ast_buttons[ll_index].ImageSize) / 2) + 1
				ELSE
					ll_extrax = 2
				END IF
			END IF
			
			IF ast_buttons[ll_index].Enabled THEN
				IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
					inv_win32.ImageList_Draw(al_imagelist, &
										  ast_buttons[ll_childindex].ImageIndex - 1, &
										  il_HDC, &
										  ast_buttons[ll_index].PaintRegion[1].px + ll_extrax, &
										  ast_buttons[ll_index].PaintRegion[1].py + ll_padding, &
										  ILD_TRANSPARENT )
				END IF
									
			ELSE
				IF UpperBound(ast_buttons[ll_index].PaintRegion) > 0 THEN
					ll_parm = of_BitWiseOR(ILD_TRANSPARENT, ILD_BLEND50)
					inv_win32.ImageList_DrawEx(al_imagelist, &
										  ast_buttons[ll_childindex].ImageIndex - 1, &
										  il_HDC, &
										  ast_buttons[ll_index].PaintRegion[1].px + ll_padding + ll_extrax, &
										  ast_buttons[ll_index].PaintRegion[1].py + ll_padding, &
										  ast_buttons[ll_index].ImageSize,ast_buttons[ll_index].ImageSize, &
										  4294967295, RGB(128,128,128), ll_parm )
				END IF
			END IF
			
			IF ast_buttons[ll_index].IsParent THEN
				lp = ast_buttons[ll_index].ChevronRegion
				
				IF ast_buttons[ll_index].backcolor1 > -1 THEN
					IF al_CurrentOrientation = 2 THEN
						of_DrawLine(PixelsToUnits(lp[1].px + 4, XPixelsToUnits!), &
						            PixelsToUnits(lp[1].py - 1, YPixelsToUnits!), &
										PixelsToUnits(lp[2].px - 5, XPixelsToUnits!), &
										PixelsToUnits(lp[1].py - 1, YPixelsToUnits!), 0)
					ELSE
						of_DrawLine(PixelsToUnits(lp[1].px - 1, XPixelsToUnits!), &
						            PixelsToUnits(lp[1].py + 4, YPixelsToUnits!), &
										PixelsToUnits(lp[1].px - 1, XPixelsToUnits!), &
										PixelsToUnits(lp[4].py - 5, YPixelsToUnits!), 0)
					END IF
				
				END IF
					IF al_CurrentOrientation = 1 THEN
						of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - 6, ((lp[4].py - lp[1].py) / 2) - 1 ) 
					ELSE
						of_DrawArrow(il_HDC, lp[1].px + ((lp[2].px - lp[1].px) / 2) - 6, lp[1].py + ((lp[4].py - lp[1].py) / 2) - 5 ) 
					END IF
	
			END IF
	END IF
NEXT

RETURN 1
end function

on n_cst_toolbarstrip_painter.create
call super::create
end on

on n_cst_toolbarstrip_painter.destroy
call super::destroy
end on

