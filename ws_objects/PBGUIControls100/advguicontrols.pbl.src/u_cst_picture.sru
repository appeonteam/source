$PBExportHeader$u_cst_picture.sru
forward
global type u_cst_picture from u_cst_canvas
end type
type st_1 from statictext within u_cst_picture
end type
end forward

global type u_cst_picture from u_cst_canvas
integer width = 759
integer height = 332
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global u_cst_picture u_cst_picture

type prototypes

end prototypes

type variables
Public:

// colors
CONSTANT Long BLACK = 0
CONSTANT Long GRAY = 12632256
CONSTANT Long WHITE = 16777215

Boolean StretchToFit
Boolean ResizeControl
Boolean Transparent = TRUE

Private:

Long iul_hIcon
Long il_IconSize
ULong iul_hBitmap
Long il_BackColor = BLACK
String as_image

Constant Long STATUS_OK = 0

CONSTANT Long IMAGE_BITMAP	= 0
CONSTANT Long IMAGE_ICON	= 1
CONSTANT Long IMAGE_CURSOR	= 2

CONSTANT Long LR_DEFAULTCOLOR			= 0
CONSTANT Long LR_MONOCHROME			= 1
CONSTANT Long LR_COLOR					= 2
CONSTANT Long LR_COPYRETURNORG		= 4
CONSTANT Long LR_COPYDELETEORG		= 8
CONSTANT Long LR_LOADFROMFILE			= 16
CONSTANT Long LR_LOADTRANSPARENT		= 32
CONSTANT Long LR_DEFAULTSIZE			= 64
CONSTANT Long LR_VGACOLOR				= 128
CONSTANT Long LR_LOADMAP3DCOLORS		= 4096
CONSTANT Long LR_CREATEDIBSECTION	= 8192
CONSTANT Long LR_COPYFROMRESOURCE	= 16384
CONSTANT Long LR_SHARED					= 32768

// Raster Operations
//CONSTANT long SRCCOPY		= 13369376
CONSTANT long SRCPAINT		= 15597702
CONSTANT long SRCAND			= 8913094
CONSTANT long SRCINVERT		= 6684742
CONSTANT long SRCERASE		= 4457256
CONSTANT long NOTSRCCOPY	= 3342344
CONSTANT long NOTSRCERASE	= 1114278
CONSTANT long MERGECOPY		= 12583114
CONSTANT long MERGEPAINT	= 12255782
CONSTANT long PATCOPY		= 15728673
CONSTANT long PATPAINT		= 16452105
CONSTANT long PATINVERT		= 5898313
CONSTANT long DSTINVERT		= 5570569
CONSTANT long BLACKNESS		= 66
CONSTANT long WHITENESS		= 16711778

end variables
forward prototypes
private subroutine of_destroy ()
private function boolean of_drawbitmap (unsignedlong hdc)
private function boolean of_drawicon (unsignedlong hdc)
public function boolean of_loadbitmap (string as_filename, string as_resourceid)
public function string of_pbvmbitmapid (string as_imagename)
public function string of_pbvmname ()
public subroutine of_setstretchtofit (boolean ab_value)
private subroutine redraw ()
public subroutine of_settransparency (boolean ab_value)
public subroutine of_settransparencycolor (long al_value)
public function boolean of_loadimage (string as_filename)
public function boolean of_loadlargeicon (string as_filename, long al_index)
public function boolean of_loadlargeicon (string as_filename)
public function boolean of_loadsmallicon (string as_filename, long al_index)
public function boolean of_loadsmallicon (string as_filename)
public subroutine of_setresizecontrol (boolean ab_value)
end prototypes

private subroutine of_destroy ();// release bitmap handle
If iul_hBitmap > 0 Then
	inv_win32.GdipDisposeImage(iul_hBitmap)
	iul_hBitmap = 0
End If


// release icon handle
If iul_hIcon > 0 Then
	inv_win32.DestroyIcon(iul_hIcon)
	iul_hIcon = 0
End If

end subroutine

private function boolean of_drawbitmap (unsignedlong hdc);Constant Long ColorAdjustTypeBitmap = 1
Constant Long UnitPixel = 2
Constant ULong ImageLockModeRead = 1
Constant Long PixelFormatDontCare = 0
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Status, ll_Width, ll_Height, ll_Units, ll_rtn
Integer il_LastStatus
ULong lul_Graphic, lul_BitmapData, lul_GdiToken, lul_Attribs, lul_Color, lul_hBitmap

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then
	
	inv_win32.GetClientRect(Handle(this), lstr_Rect)
	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 0)
	inv_win32.GdipCreateBitmapFromFileICM(as_image, lul_hBitmap)
	inv_win32.GdipGetImageBounds(lul_hBitmap, lstr_gRect, ll_Units)
	
	If StretchToFit Then
		ll_Width  = lstr_Rect.Right
		ll_Height = lstr_Rect.Bottom
	Else
		ll_Width  = lstr_gRect.Width
		ll_Height = lstr_gRect.Height
	End If
	
	// set background color transparent
	If Transparent Then
		inv_win32.GdipCreateImageAttributes(lul_Attribs)
		inv_win32.GdipBitmapGetPixel(lul_hBitmap, 0, 0, lul_Color)	// get color at pixel 0,0
		il_LastStatus = inv_win32.GdipSetImageAttributesColorKeys(lul_Attribs, &
									ColorAdjustTypeBitmap, True, lul_Color, lul_Color)
	End If
	
	// draw the image
	il_LastStatus = inv_win32.GdipDrawImageRectRectI(lul_Graphic, lul_hBitmap, &
								0, 0, ll_Width, ll_Height, &
								0, 0, lstr_gRect.Width, lstr_gRect.Height, &
								UnitPixel, lul_Attribs, 0, 0)
	If il_LastStatus <> STATUS_OK Then
//		PopulateError(il_LastStatus, of_GdiStatusMsg())
		Return False
	End If
	
	// cleanup
	If Transparent Then
		inv_win32.GdipDisposeImageAttributes(lul_Attribs)
	End If
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdipDisposeImage(lul_hBitmap)
	inv_win32.GdiplusShutdown(lul_GdiToken)
END IF

Return True

end function

private function boolean of_drawicon (unsignedlong hdc);// draw the current icon

Constant Long DI_NORMAL = 3

Return inv_win32.DrawIconEx(hdc, 0, 0, iul_hIcon, &
					il_IconSize, il_IconSize, 0, 0, DI_NORMAL)

end function

public function boolean of_loadbitmap (string as_filename, string as_resourceid);// load bitmap from a resource file

BITMAP lstr_Bitmap
Long ll_Index, ll_Module, ll_Bitmap
String ls_ResourceID

// release handles
of_Destroy()

// load the library into memory
ll_Module = inv_win32.LoadLibrary(as_filename)
If ll_Module <= 0 Then
	Return False
End If

// prefix # for numbered resource
If IsNumber(as_resourceid) Then
	ls_ResourceID = "#" + as_resourceid
Else
	ls_ResourceID = as_resourceid
End If

// load the bitmap
iul_hBitmap = inv_win32.LoadImage(ll_Module, ls_ResourceID, IMAGE_BITMAP, &
							0, 0, LR_LOADTRANSPARENT)

If iul_hBitmap = 0 Then
	Return False
End If

// free the library
inv_win32.FreeLibrary(ll_Module)

// resize control to match image
If Not StretchToFit Then
	If ResizeControl Then
		inv_win32.GetObject(iul_hBitmap, 24, lstr_Bitmap)
		this.Width  = PixelsToUnits(lstr_bitmap.bmWidth, XPixelsToUnits!)
		this.Height = PixelsToUnits(lstr_bitmap.bmHeight, YPixelsToUnits!)
	End If
End If

Redraw()

Return True

end function

public function string of_pbvmbitmapid (string as_imagename);// return PowerBuilder VM resource id

Long ll_index

ll_index = inv_win32.FN_ResGetBitmapID(as_imagename)

Return String(ll_index)

end function

public function string of_pbvmname ();// return the name of the PowerBuilder VM

Environment le_env
String ls_vmname

GetEnvironment(le_env)

If le_env.PBMinorRevision = 5 Then
	ls_vmname = "pbvm" + String(le_env.PBMajorRevision) + "5.dll"
Else
	ls_vmname = "pbvm" + String(le_env.PBMajorRevision) + "0.dll"
End If

Return ls_vmname

end function

public subroutine of_setstretchtofit (boolean ab_value);StretchToFit = ab_value

Redraw()

end subroutine

private subroutine redraw ();// force onpaint

SetRedraw(True)

end subroutine

public subroutine of_settransparency (boolean ab_value);Transparent = ab_value

Redraw()

end subroutine

public subroutine of_settransparencycolor (long al_value);il_BackColor = al_value

Redraw()

end subroutine

public function boolean of_loadimage (string as_filename);// Load image from file
//
// Supported file formats:
//
//		Windows Bitmap						.bmp, .dib
//		Graphics Interchange Format	.gif
//		JPEG									.jpg, .jpeg, .jpe
//		Portable Network Graphics		.png
//		Run-length encoding				.rle
//		Windows Metafile					.wmf
//		Enhanced Metafile					.emf
//		Tagged Image File Format		.tif, .tiff
//		Windows Icon						.ico

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
BITMAP lstr_Bitmap
ULong lul_GdiToken, lul_Bitmap, lul_hBitmap
Long ll_rtn
RECTF lstr_gRect
Long ll_Units

// release handles
of_Destroy()

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then
	
	inv_win32.GdipCreateBitmapFromFileICM(as_filename, lul_hBitmap)
	as_image = as_filename
	
	// resize control to match image
	If Not StretchToFit Then
		If ResizeControl Then
			inv_win32.GdipGetImageBounds(lul_hBitmap, lstr_gRect, ll_Units)
			this.Width  = PixelsToUnits(lstr_gRect.Width, XPixelsToUnits!)
			this.Height = PixelsToUnits(lstr_gRect.Height, YPixelsToUnits!)
		End If
	End If
	
	inv_win32.GdipDisposeImage(lul_hBitmap)
	inv_win32.GdiplusShutdown(lul_GdiToken)
Else
	Return False
End If

Redraw()

Return True

end function

public function boolean of_loadlargeicon (string as_filename, long al_index);// load large icon from a file

Long ll_LargeIcons[], ll_SmallIcons[], ll_rtn

// release handles
of_Destroy()

// extract icon from file and load into memory
ll_rtn = inv_win32.ExtractIconEx(as_FileName, al_index, &
					ll_LargeIcons, ll_SmallIcons, 1)

If ll_rtn = 0 Then
	Return False
End If

iul_hIcon = ll_LargeIcons[1]
inv_win32.DestroyIcon(ll_SmallIcons[1])
il_IconSize = 32

Redraw()

Return True

end function

public function boolean of_loadlargeicon (string as_filename);// load large icon from a file

Return of_LoadLargeIcon(as_filename, 0)

end function

public function boolean of_loadsmallicon (string as_filename, long al_index);// load small icon from a file

Long ll_LargeIcons[], ll_SmallIcons[], ll_rtn

// release handles
of_Destroy()

// extract icon from file and load into memory
ll_rtn = inv_win32.ExtractIconEx(as_FileName, al_index, &
					ll_LargeIcons, ll_SmallIcons, 1)

If ll_rtn = 0 Then
	Return False
End If

iul_hIcon = ll_SmallIcons[1]
inv_win32.DestroyIcon(ll_LargeIcons[1])
il_IconSize = 16

Redraw()

Return True

end function

public function boolean of_loadsmallicon (string as_filename);// load small icon from a file

Return of_LoadSmallIcon(as_filename, 0)

end function

public subroutine of_setresizecontrol (boolean ab_value);ResizeControl = ab_value

Redraw()

end subroutine

on u_cst_picture.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_picture.destroy
call super::destroy
destroy(this.st_1)
end on

event constructor;call super::constructor;PowerObject	lpo_parent
UserObject luo_parent
Window lw_parent

lpo_parent = this.GetParent()
choose case lpo_parent.TypeOf()
	case UserObject!
		luo_parent = lpo_parent
		il_BackColor = luo_parent.BackColor
	case Window!
		lw_parent = lpo_parent
		il_BackColor = lw_parent.BackColor
end choose

of_SetTransparent(Transparent)

end event

event destructor;call super::destructor;// release handles
of_Destroy()

end event

event onpaint;call super::onpaint;// paint the canvas

// draw icon
If iul_hIcon > 0 Then
	of_DrawIcon(hdc)
End If

// draw bitmap
If Len(Trim(as_image)) > 0 Then
	of_DrawBitmap(hdc)
End If

Return 1

end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_picture
end type

type st_1 from statictext within u_cst_picture
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Picture Control"
boolean focusrectangle = false
end type

event constructor;Hide()
TextSize = 13
end event

