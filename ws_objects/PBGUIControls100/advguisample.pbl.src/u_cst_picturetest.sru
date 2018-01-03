$PBExportHeader$u_cst_picturetest.sru
forward
global type u_cst_picturetest from u_cst_tabpage
end type
type cbx_transparent from checkbox within u_cst_picturetest
end type
type cbx_resize from checkbox within u_cst_picturetest
end type
type cbx_stretch from checkbox within u_cst_picturetest
end type
type cb_load from commandbutton within u_cst_picturetest
end type
type uo_picture from u_cst_picture within u_cst_picturetest
end type
end forward

global type u_cst_picturetest from u_cst_tabpage
integer width = 2560
integer height = 1604
cbx_transparent cbx_transparent
cbx_resize cbx_resize
cbx_stretch cbx_stretch
cb_load cb_load
uo_picture uo_picture
end type
global u_cst_picturetest u_cst_picturetest

type variables

end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);
end subroutine

on u_cst_picturetest.create
int iCurrent
call super::create
this.cbx_transparent=create cbx_transparent
this.cbx_resize=create cbx_resize
this.cbx_stretch=create cbx_stretch
this.cb_load=create cb_load
this.uo_picture=create uo_picture
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_transparent
this.Control[iCurrent+2]=this.cbx_resize
this.Control[iCurrent+3]=this.cbx_stretch
this.Control[iCurrent+4]=this.cb_load
this.Control[iCurrent+5]=this.uo_picture
end on

on u_cst_picturetest.destroy
call super::destroy
destroy(this.cbx_transparent)
destroy(this.cbx_resize)
destroy(this.cbx_stretch)
destroy(this.cb_load)
destroy(this.uo_picture)
end on

event constructor;call super::constructor;uo_picture.of_LoadImage("PttBLogo.bmp")

cbx_stretch.Checked     = uo_picture.StretchToFit
cbx_resize.Checked      = uo_picture.ResizeControl
cbx_transparent.Checked = uo_picture.Transparent

end event

type cbx_transparent from checkbox within u_cst_picturetest
integer x = 1463
integer y = 44
integer width = 407
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transparent"
end type

event clicked;uo_picture.of_SetTransparency(this.Checked)

end event

type cbx_resize from checkbox within u_cst_picturetest
integer x = 987
integer y = 44
integer width = 407
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ResizeControl"
end type

event clicked;uo_picture.of_SetResizeControl(this.Checked)

end event

type cbx_stretch from checkbox within u_cst_picturetest
integer x = 512
integer y = 44
integer width = 407
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "StretchToFit"
end type

event clicked;uo_picture.of_SetStretchToFit(this.Checked)

end event

type cb_load from commandbutton within u_cst_picturetest
integer x = 37
integer y = 32
integer width = 407
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Load Image"
end type

event clicked;// load image into control

Integer li_rc
String ls_pathname, ls_filename

li_rc = GetFileOpenName("Select Image File", &
				ls_pathname, ls_filename, "bmp", &
				+ "Windows Bitmap (*.bmp),*.bmp," &
				+ "Graphics Interchange Format (*.gif),*.gif," &
				+ "JPEG (*.jpg;*.jpeg;*.jpe),*.jpg;*.jpeg;*.jpe," &
				+ "Portable Network Graphics (*.png),*.png," &
				+ "Run-length encoding (*.rle),*.rle," &
				+ "Windows Metafile (*.wmf),*.wmf," &
				+ "Enhanced Metafile (*.emf),*.emf," &
				+ "Tagged Image File Format (*.tif;*.tiff),*.tif;*.tiff," &
				+ "Windows Icon (*.ico), *.ico")
If li_rc = 1 Then
	uo_picture.of_LoadImage(ls_pathname)
End If

end event

type uo_picture from u_cst_picture within u_cst_picturetest
integer x = 37
integer y = 192
integer width = 1870
integer height = 1220
integer taborder = 10
boolean resizecontrol = true
end type

on uo_picture.destroy
call u_cst_picture::destroy
end on

