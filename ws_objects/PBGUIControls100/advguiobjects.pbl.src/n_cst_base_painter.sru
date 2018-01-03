$PBExportHeader$n_cst_base_painter.sru
forward
global type n_cst_base_painter from nonvisualobject
end type
type inv_win32 from n_cst_win32 within n_cst_base_painter
end type
end forward

global type n_cst_base_painter from nonvisualobject autoinstantiate
inv_win32 inv_win32
end type

type prototypes

end prototypes

type variables
n_cst_theme n_theme

// MS Windows enumerations
CONSTANT ULong GRADIENT_FILL_RECT_H = 0
CONSTANT ULong GRADIENT_FILL_RECT_V = 1
CONSTANT ULong GRADIENT_FILL_TRIANGLE = 2
CONSTANT ULong GRADIENT_FILL_OP_FLAG = 255

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
CONSTANT Long ILD_BLEND50 = 4
CONSTANT Long ILD_BLEND25 = 2

// User object enumerations
CONSTANT String TOPLEFT = "TOPLEFT"
CONSTANT String TOPRIGHT = "TOPRIGHT"
CONSTANT String BOTTOMRIGHT = "BOTTOMRIGHT"
CONSTANT String BOTTOMLEFT = "BOTTOMLEFT"

BOOLEAN	ib_displayborder

CONSTANT LONG ALIGN_LEFT = 0
CONSTANT LONG ALIGN_CENTER = 1
CONSTANT LONG ALIGN_RIGHT = 2

CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VBOTTOM = 8
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16

CONSTANT LONG GM_ADVANCED = 2

Long	il_HDC

Long il_newHeight
Long il_newWidth

// Object Handle
Long	HDC

Long	il_ShadowBackColor

ULong iul_font
ULong iul_fontv
ULong iul_fontbold

PUBLIC:
// Dimensions
RECT DC_Rect

// Vertices
TRIVERTEX Corner[4]
TRIVERTEX BorderCorner[2]
TRIVERTEX VistaCorner1[4]
TRIVERTEX VistaCorner2[4]
TRIVERTEX VistaCorner3[4]

end variables

forward prototypes
public subroutine of_verticalgradient (long al_color1, long al_color2)
public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue)
public function boolean of_setdevicecontext (graphicobject ado_palette)
public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette)
public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, integer ai_style)
public function boolean of_setdevicecontext (graphicobject ado_palette, integer ai_style, boolean ab_border)
public function integer of_sethdc (long al_hdc)
public function boolean of_getbit (long al_decimal, integer ai_bit)
public function unsignedlong of_createfont (string as_name, long al_size, boolean ab_underline)
public function long of_bitwiseand (long al_value1, long al_value2)
public subroutine of_xpgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_vertical)
public function unsignedlong of_createfont (string as_name, long al_size, boolean ab_underline, readonly long al_escapment)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
public subroutine of_vista1gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal)
public subroutine of_vista2gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal)
public subroutine of_vista3gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal)
public subroutine of_customgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal)
end prototypes

public subroutine of_verticalgradient (long al_color1, long al_color2);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

LONG hRPen

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

// Create a border if ib_displayborder is true
IF 	ib_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,1090519039)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X +1, Corner[3].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

end subroutine

public subroutine of_splitrgb (long al_color, ref long red, ref long green, ref long blue);Red = Mod (al_Color, 256)
Red *= 256

al_Color /= 256
Green	= Mod (al_Color, 256)
Green *= 256

Blue = al_Color / 256
Blue *= 256
end subroutine

public function boolean of_setdevicecontext (graphicobject ado_palette);IF NOT IsValid (ado_Palette) THEN RETURN FALSE

// Get the object's handle
HDC = Handle (ado_Palette)

// Get the object's dimensions
inv_win32.GetClientRect (HDC, DC_RECT)

// let's resize the grandient rectangle if border is displayed
IF ib_displayborder THEN
	// Initialize the vertices
	Corner[1].X = DC_RECT.Left +1 
	Corner[1].Y = DC_RECT.Top +1 
	Corner[2].X = DC_RECT.Right -1
	Corner[2].Y = DC_RECT.Top +1
	Corner[3].X = DC_RECT.Right -1
	Corner[3].Y = DC_RECT.Bottom - 1
	Corner[4].X = DC_RECT.Left +1
	Corner[4].Y = DC_RECT.Bottom - 1
	
	VistaCorner1[1].X = DC_RECT.Left + 1 
	VistaCorner1[1].Y = DC_RECT.Top + 1
	VistaCorner1[2].X = DC_RECT.Right -1
	VistaCorner1[2].Y = DC_RECT.Top + 1
	VistaCorner1[3].X = DC_RECT.Right -1
	VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20
	VistaCorner1[4].X = DC_RECT.Left +1
	VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)//20
	
	VistaCorner3[1].X = DC_RECT.Left + 1 
	VistaCorner3[1].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
	VistaCorner3[2].X = DC_RECT.Right -1
	VistaCorner3[2].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2)//10
	VistaCorner3[3].X = DC_RECT.Right -1
	VistaCorner3[3].Y = DC_RECT.Bottom - 1
	VistaCorner3[4].X = DC_RECT.Left +1
	VistaCorner3[4].Y = DC_RECT.Bottom - 1

ELSE
	Corner[1].X = DC_RECT.Left
	Corner[1].Y = DC_RECT.Top 
	Corner[2].X = DC_RECT.Right
	Corner[2].Y = DC_RECT.Top
	Corner[3].X = DC_RECT.Right
	Corner[3].Y = DC_RECT.Bottom 
	Corner[4].X = DC_RECT.Left
	Corner[4].Y = DC_RECT.Bottom
	
	VistaCorner1[1].X = DC_RECT.Left 
	VistaCorner1[1].Y = DC_RECT.Top
	VistaCorner1[2].X = DC_RECT.Right
	VistaCorner1[2].Y = DC_RECT.Top
	VistaCorner1[3].X = DC_RECT.Right
	VistaCorner1[3].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)// - 19
	VistaCorner1[4].X = DC_RECT.Left
	VistaCorner1[4].Y = DC_RECT.Bottom - (DC_RECT.Bottom * .65)// - 19
	
	VistaCorner3[1].X = DC_RECT.Left 
	VistaCorner3[1].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2) - 1// + 9//12 
	VistaCorner3[2].X = DC_RECT.Right
	VistaCorner3[2].Y = DC_RECT.Top + ((DC_RECT.Bottom * .65) / 2) - 1// + 9//12
	VistaCorner3[3].X = DC_RECT.Right
	VistaCorner3[3].Y = DC_RECT.Bottom
	VistaCorner3[4].X = DC_RECT.Left
	VistaCorner3[4].Y = DC_RECT.Bottom
END IF	

RETURN TRUE


end function

public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette);IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

of_VerticalGradient (al_Color1, al_Color2)
end subroutine

public subroutine of_verticalgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, integer ai_style);CHOOSE CASE ai_STYLE
	CASE 0
		of_XPGradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 1
		of_Vista1Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 2
		of_Vista2Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 3
		of_Vista3Gradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
	CASE 4
		of_CustomGradient (al_color1, al_color2, ado_palette,ab_displayborder,al_bordercolor, TRUE)
END CHOOSE
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

public function integer of_sethdc (long al_hdc);il_HDC = al_hdc

RETURN 1
end function

public function boolean of_getbit (long al_decimal, integer ai_bit);Boolean lb_null

//Check parameters
If IsNull(al_decimal) or IsNull(ai_bit) then
	SetNull(lb_null)
	Return lb_null
End If

//Assumption ai_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//al_decimal is a binary number as a base 10 long.
If Int(Mod(al_decimal / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function unsignedlong of_createfont (string as_name, long al_size, boolean ab_underline);LogFont lstr_Lf
uLong lul_Font

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY), 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

IF ab_underline THEN
	lstr_Lf.lfunderline = Char(1)
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfweight = 700
iul_fontbold = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function long of_bitwiseand (long al_value1, long al_value2);Integer		li_Cnt
Long			ll_Result
Boolean		lb_Value1[32], lb_Value2[32]

// Check for nulls
If IsNull(al_Value1) Or IsNull(al_Value2) Then
	SetNull(ll_Result)
	Return ll_Result
End If

// Get all bits for both values
For li_Cnt = 1 To 32
	lb_Value1[li_Cnt] = of_getbit(al_Value1, li_Cnt)
	lb_Value2[li_Cnt] = of_getbit(al_Value2, li_Cnt)
Next

// And them together
For li_Cnt = 1 To 32
	If lb_Value1[li_Cnt] And lb_Value2[li_Cnt] Then
		ll_Result = ll_Result + (2^(li_Cnt - 1))
	End If
Next

Return ll_Result
end function

public subroutine of_xpgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_vertical);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

LONG hRPen

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

//of_VerticalGradient (al_Color1, al_Color2)

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

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, Corner[3].X +1, Corner[3].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

IF ab_vertical THEN
	inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, Corner, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

end subroutine

public function unsignedlong of_createfont (string as_name, long al_size, boolean ab_underline, readonly long al_escapment);LogFont lstr_Lf
uLong lul_Font

lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(al_size, inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY), 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

IF ab_underline THEN
	lstr_Lf.lfunderline = Char(1)
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )
lstr_Lf.lfescapement = (al_escapment * 10)
lstr_Lf.lforientation = (al_escapment * 10)
iul_fontv = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);//Integer		li_Cnt

ulong ul_exp, ul_exp_last=1, ul_bit1, ul_bit2, ul_ret
long ll_i

for ll_i = 1 to 31

            ul_exp=2^ll_i
            ul_bit1=mod(aul_arg1,ul_exp)
            ul_bit2=mod(aul_arg2,ul_exp)

            if ul_bit1>0 or ul_bit2>0 then
                        ul_ret+=ul_exp_last
            end if

            ul_exp_last=ul_exp
            aul_arg1 -=ul_bit1
            aul_arg2 -=ul_bit2
next

if aul_arg1>0 or aul_arg2>0 then
            ul_ret+=ul_exp_last
end if


return ul_ret
end function

public subroutine of_vista1gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

Long ll_color1
LONG hRPen
uLONG hRgn

LONG ll_DC2

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette,2, ab_displayborder) THEN RETURN

il_ShadowBackColor = n_theme.of_DarkenColor(50,al_Color2)

al_Color1 = n_theme.of_LightenColor(90,al_Color1)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +1, BorderCorner[1].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

IF al_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

// Get the object's dimensions
inv_win32.GetClientRect (ll_DC2, DC_RECT)

int ll1
ll1 = inv_win32.PolyBezier(ll_DC2,DC_RECT,6)
inv_win32.DeleteObject(ll1)

end subroutine

public subroutine of_vista2gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean al_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

Long ll_color1, ll_color3
LONG hRPen
uLONG hRgn

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette,2, ab_displayborder) THEN RETURN

ll_color3 = n_theme.of_LightenColor(.2, al_color2)
al_Color1 = n_theme.of_LightenColor(.9, al_color1)

il_ShadowBackColor = n_theme.of_DarkenColor(50,al_Color2)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

of_SplitRGB (ll_color3, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC//GetDC (HDC)

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +1, BorderCorner[1].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

IF al_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

IF 	ab_displayborder THEN 
	// let's set some nice color
	al_Color2 = n_theme.of_DarkenColor(.3, al_color2)
	
	hRPen = inv_win32.CreatePen(0,0,al_color2)
	hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X + 1, (BorderCorner[1].Y * .53), BorderCorner[1].X, BorderCorner[1].Y  ,0,0)
	
	inv_win32.FillRgn (ll_DC, hRgn, hRPen) //Me.hdc, hRgn, hBrush
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
ELSE
	// let's set some nice color
	al_Color2 = n_theme.of_DarkenColor(.3, al_color2)
	
	hRPen = inv_win32.CreatePen(0,0,al_color2)
	hRgn = inv_win32.CreateRoundRectRgn( 0, (BorderCorner[1].Y * .53), BorderCorner[1].X + 4, BorderCorner[1].Y + 4  ,0,0)
	
	inv_win32.FillRgn (ll_DC, hRgn, hRPen) //Me.hdc, hRgn, hBrush
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
END IF
end subroutine

public subroutine of_vista3gradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

LONG hRPen
uLONG hRgn

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

il_ShadowBackColor = n_theme.of_DarkenColor(90,al_Color2)

al_Color1 = RGB(255,255,255)

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC

// Create a border if ib_displayborder is true
IF 	ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +1, BorderCorner[1].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

IF ab_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

hRPen = inv_win32.CreatePen(0,0,al_color2)
hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X +1 , Corner[1].Y + 10, BorderCorner[1].X , BorderCorner[1].Y - 16 ,4,4)
inv_win32.FillRgn (ll_DC, hRgn, hRPen) 

IF ab_horizontal THEN
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)
ELSE
	inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_H)
END IF

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

end subroutine

public subroutine of_customgradient (long al_color1, long al_color2, graphicobject ado_palette, boolean ab_displayborder, long al_bordercolor, boolean ab_horizontal);Long	ll_Red, &
		ll_Green, &
		ll_Blue, &
		ll_DC
GRADIENT_RECT l_Gradient[1]

LONG hRPen

ib_displayborder = ab_displayborder

IF NOT of_SetDeviceContext (ado_Palette) THEN RETURN

// Set the colors in the first corner (top left)
of_SplitRGB (al_Color1, ll_Red, ll_Green, ll_Blue)

VistaCorner1[1].Red = ll_Red
VistaCorner1[1].Green = ll_Green
VistaCorner1[1].Blue = ll_Blue

VistaCorner3[3].Red 		= ll_Red
VistaCorner3[3].Green 	= ll_Green
VistaCorner3[3].Blue 		= ll_Blue

// Set the colors in the third corner (bottom right)
of_SplitRGB (al_Color2, ll_Red, ll_Green, ll_Blue)

VistaCorner3[1].Red = ll_Red
VistaCorner3[1].Green = ll_Green
VistaCorner3[1].Blue = ll_Blue

VistaCorner1[3].Red 		= ll_Red
VistaCorner1[3].Green 	= ll_Green 
VistaCorner1[3].Blue 		= ll_Blue 

l_Gradient[1].UpperLeft = 0 // First corner, top left
l_Gradient[1].LowerRight = 2 // Third corner, bottom right

BorderCorner[1].X = Corner[3].X
BorderCorner[1].Y = Corner[3].Y

ll_DC = il_HDC//GetDC (HDC)

// Create a border if ib_displayborder is true
IF ab_displayborder THEN
	hRPen = inv_win32.CreatePen(0,0,al_bordercolor)
	inv_win32.SelectObject(ll_DC, hRPen)
	inv_win32.Rectangle(ll_DC, Corner[1].X - 1, Corner[1].Y - 1, BorderCorner[1].X +1, BorderCorner[1].Y +1)
	inv_win32.DeleteObject(hRPen)
END IF

inv_win32.GradientRectangle (ll_DC, VistaCorner1, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

uLONG hRgn

hRPen = inv_win32.CreatePen(0,0,al_color2)
hRgn = inv_win32.CreateRoundRectRgn( Corner[1].X +1 , Corner[1].Y + 10, BorderCorner[1].X , BorderCorner[1].Y - 16 ,4,4)

inv_win32.FillRgn (ll_DC, hRgn, hRPen)

inv_win32.GradientRectangle (ll_DC, VistaCorner3, 4, l_Gradient, 1, GRADIENT_FILL_RECT_V)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

//ReleaseDC (HDC, ll_DC)
end subroutine

on n_cst_base_painter.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_base_painter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within n_cst_base_painter descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

