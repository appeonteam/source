$PBExportHeader$n_cst_groupbox_painter.sru
forward
global type n_cst_groupbox_painter from n_cst_base_painter
end type
end forward

global type n_cst_groupbox_painter from n_cst_base_painter
end type

type prototypes

end prototypes

type variables
TRIVERTEX Header[4]
strgroupbox istrgroupbox
end variables

forward prototypes
public function integer of_drawgroupbox (dragobject ado_palette, strgroupbox al_strgroupbox)
public function integer of_drawtext (graphicobject ado_palette, long al_x, long al_y)
public function integer of_gettextsize (graphicobject ado_palette)
public function unsignedlong of_createfont ()
end prototypes

public function integer of_drawgroupbox (dragobject ado_palette, strgroupbox al_strgroupbox);point lp[], lp_line[]
point lp_empty[]
gradient_rect l_Gradient[1]
GRADIENT_RECT l_Line[]
rect rc
Long	ll_Red, &
		ll_Green, &
		ll_Blue
long hRgn, hRPen, ll_index, ll_count, ll_textcolor, ll_parm
Long ll_inner, ll_innercount
Long ll_textx, ll_regionx, ll_textwidth, ll_y, ll_texty, ll_imagey
Boolean lb_bold

istrgroupbox = al_strGroupBox

of_GetTextSize(ado_palette)

hRgn = inv_win32.CreateRectRgn (0, 0 , al_strGroupBox.width , al_strGroupBox.height )
hRPen = inv_win32.CreatePen(0,0,al_strGroupBox.BackColor)
inv_win32.FillRgn (il_HDC, hRgn , hRPen )
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

l_Gradient[1].UpperLeft = 0
l_Gradient[1].LowerRight = 2
	
Corner[1].X = 2

IF al_strGroupBox.style = 0 THEN
	Corner[1].Y = il_newHeight / 2
ELSE
	Corner[1].Y = 1
END IF

Corner[2].X = al_strGroupBox.width - 1 

IF al_strGroupBox.style = 0 THEN	
	Corner[2].Y = il_newHeight / 2
ELSE
	Corner[2].Y = 1
END IF

Corner[3].X = al_strGroupBox.width - 1
Corner[3].Y = al_strGroupBox.height - 1
Corner[4].X = 2 
Corner[4].Y = al_strGroupBox.height - 1


Header[1].X = 2
Header[1].Y = 1
Header[2].X = al_strGroupBox.width - 1 
Header[2].Y = 1
Header[3].X = al_strGroupBox.width - 1
Header[3].Y = il_newHeight + 7
Header[4].X = 2 
Header[4].Y = il_newHeight + 7
		
// Set the colors in the first corner (top left)
of_SplitRGB (al_strGroupBox.gradient1, ll_Red, ll_Green, ll_Blue)
Corner[1].Red = ll_Red
Corner[1].Green = ll_Green
Corner[1].Blue = ll_Blue
	
// Set the colors in the third corner (bottom right)
of_SplitRGB (al_strGroupBox.gradient2, ll_Red, ll_Green, ll_Blue)
Corner[3].Red = ll_Red
Corner[3].Green = ll_Green
Corner[3].Blue = ll_Blue
	
//Create Polygon
hRPen = inv_win32.CreatePen(0,0,al_strGroupBox.bordercolor)
inv_win32.SelectObject(il_HDC, hRPen)
hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X, Corner[1].Y, Corner[3].X, Corner[3].Y,7,7)
inv_win32.RoundRect( il_HDC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X, Corner[3].Y,10,10)
	
inv_win32.SelectClipRgn(il_HDC, hRgn)
	
//Gradient Fill
IF al_strGroupBox.gradientdirection = 'H' THEN
	inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
ELSE
	inv_win32.GradientRectangle (il_HDC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
END IF

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

//Draw Header****************************
IF al_strGroupBox.style = 1 THEN
	// Set the colors in the first corner (top left)
	of_SplitRGB (al_strGroupBox.headercolor1, ll_Red, ll_Green, ll_Blue)
	Header[1].Red = ll_Red
	Header[1].Green = ll_Green
	Header[1].Blue = ll_Blue
		
	// Set the colors in the third corner (bottom right)
	of_SplitRGB (al_strGroupBox.headercolor2, ll_Red, ll_Green, ll_Blue)
	Header[3].Red = ll_Red
	Header[3].Green = ll_Green
	Header[3].Blue = ll_Blue
		
	//Create Polygon
	hRgn = inv_win32.CreateRoundRectRgn( Header[1].X, Header[1].Y, Header[3].X, Header[3].Y,7,7)
	inv_win32.RoundRect( il_HDC, Header[1].X - 1, Header[1].Y - 1, Header[3].X, Header[3].Y,10,10)
		
	inv_win32.SelectClipRgn(il_HDC, hRgn)
		
	//Gradient Fill
	inv_win32.GradientRectangle (il_HDC, Header, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	
	//DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF
//***************************************

inv_win32.SelectClipRgn(il_HDC, 0)

IF al_strGroupBox.bold THEN
	lb_bold = TRUE
ELSE
	lb_bold = FALSE
END IF

IF al_strGroupBox.Image = 0 THEN
	ll_textx = 14
	ll_regionx = 12
ELSE
	ll_textx = 32
	ll_regionx = 26
END IF

IF al_strGroupBox.style = 0 THEN
	ll_texty = 0
	ll_imagey = il_newHeight / 2 - 8
ELSE
	ll_texty = 3
	ll_imagey = ((il_newHeight + 7 - 16) / 2)
END IF

IF al_strGroupBox.style = 0 THEN
	hRgn = inv_win32.CreateRectRgn (ll_regionx , 4 , il_newWidth + ll_textx + 2 , il_newHeight )
	hRPen = inv_win32.CreatePen(0,0,al_strGroupBox.backcolor)
	inv_win32.FillRgn (il_HDC, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF

of_DrawText(ado_palette, &
				ll_textx, ll_texty)
	

inv_win32.ImageList_DrawEx(al_strGroupBox.Image, &
				  al_strGroupBox.ImageIndex - 1, &
				  il_HDC, &
				  12, &
				  ll_imagey, &
				  16,16, &
				  0, 0, ILD_TRANSPARENT )
	
	
RETURN 1
end function

public function integer of_drawtext (graphicobject ado_palette, long al_x, long al_y);Long	ll_Red, &
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

// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = 0
l_Rect.Bottom = 0

inv_win32.SetTextColor(ll_DC, istrgroupbox.FontColor)

inv_win32.Drawtext(ll_DC, istrgroupbox.Text, LEN(istrgroupbox.Text), l_Rect, ll_parm)
inv_win32.Drawtext(ll_DC, istrgroupbox.Text, LEN(istrgroupbox.Text), l_Rect, ll_sizeparm)

inv_win32.DeleteObject(iul_font)
inv_win32.DeleteObject(iul_fontbold)
inv_win32.DeleteObject(iul_fontv)

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
inv_win32.DeleteObject(iul_fontv)

RETURN 1
end function

public function unsignedlong of_createfont ();LogFont lstr_Lf
uLong lul_Font

lstr_Lf.lffacename = istrgroupbox.FontFamily
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(istrgroupbox.FontSize, inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY), 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

IF istrgroupbox.underline THEN
	lstr_Lf.lfunderline = Char(1)
END IF

IF istrgroupbox.italics THEN
	lstr_Lf.lfitalic = Char(1)
END IF

IF istrgroupbox.strikeout THEN
	lstr_Lf.lfstrikeout = Char(1)
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

on n_cst_groupbox_painter.create
call super::create
end on

on n_cst_groupbox_painter.destroy
call super::destroy
end on

