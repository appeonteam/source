$PBExportHeader$u_cst_groupboxtest.sru
forward
global type u_cst_groupboxtest from u_cst_tabpage
end type
type ddlb_2 from dropdownlistbox within u_cst_groupboxtest
end type
type st_13 from statictext within u_cst_groupboxtest
end type
type st_12 from statictext within u_cst_groupboxtest
end type
type cb_4 from commandbutton within u_cst_groupboxtest
end type
type sle_3 from singlelineedit within u_cst_groupboxtest
end type
type st_11 from statictext within u_cst_groupboxtest
end type
type st_10 from statictext within u_cst_groupboxtest
end type
type ddlb_1 from dropdownlistbox within u_cst_groupboxtest
end type
type cbx_5 from checkbox within u_cst_groupboxtest
end type
type uo_1 from u_cst_groupbox within u_cst_groupboxtest
end type
type sle_4 from singlelineedit within u_cst_groupboxtest
end type
type cbx_1 from checkbox within u_cst_groupboxtest
end type
type cbx_2 from checkbox within u_cst_groupboxtest
end type
type cbx_3 from checkbox within u_cst_groupboxtest
end type
type rb_1 from radiobutton within u_cst_groupboxtest
end type
type rb_2 from radiobutton within u_cst_groupboxtest
end type
type rb_3 from radiobutton within u_cst_groupboxtest
end type
type st_1 from statictext within u_cst_groupboxtest
end type
type st_2 from statictext within u_cst_groupboxtest
end type
type st_3 from statictext within u_cst_groupboxtest
end type
type st_4 from statictext within u_cst_groupboxtest
end type
type st_5 from statictext within u_cst_groupboxtest
end type
type st_6 from statictext within u_cst_groupboxtest
end type
type st_7 from statictext within u_cst_groupboxtest
end type
type cb_1 from commandbutton within u_cst_groupboxtest
end type
type sle_1 from singlelineedit within u_cst_groupboxtest
end type
type cb_2 from commandbutton within u_cst_groupboxtest
end type
type cb_3 from commandbutton within u_cst_groupboxtest
end type
type sle_2 from singlelineedit within u_cst_groupboxtest
end type
type st_8 from statictext within u_cst_groupboxtest
end type
type st_9 from statictext within u_cst_groupboxtest
end type
type cbx_4 from checkbox within u_cst_groupboxtest
end type
type gb_1 from groupbox within u_cst_groupboxtest
end type
end forward

global type u_cst_groupboxtest from u_cst_tabpage
integer width = 2560
integer height = 1604
ddlb_2 ddlb_2
st_13 st_13
st_12 st_12
cb_4 cb_4
sle_3 sle_3
st_11 st_11
st_10 st_10
ddlb_1 ddlb_1
cbx_5 cbx_5
uo_1 uo_1
sle_4 sle_4
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
cb_1 cb_1
sle_1 sle_1
cb_2 cb_2
cb_3 cb_3
sle_2 sle_2
st_8 st_8
st_9 st_9
cbx_4 cbx_4
gb_1 gb_1
end type
global u_cst_groupboxtest u_cst_groupboxtest

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);
end subroutine

on u_cst_groupboxtest.create
int iCurrent
call super::create
this.ddlb_2=create ddlb_2
this.st_13=create st_13
this.st_12=create st_12
this.cb_4=create cb_4
this.sle_3=create sle_3
this.st_11=create st_11
this.st_10=create st_10
this.ddlb_1=create ddlb_1
this.cbx_5=create cbx_5
this.uo_1=create uo_1
this.sle_4=create sle_4
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.cb_1=create cb_1
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.sle_2=create sle_2
this.st_8=create st_8
this.st_9=create st_9
this.cbx_4=create cbx_4
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_2
this.Control[iCurrent+2]=this.st_13
this.Control[iCurrent+3]=this.st_12
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.sle_3
this.Control[iCurrent+6]=this.st_11
this.Control[iCurrent+7]=this.st_10
this.Control[iCurrent+8]=this.ddlb_1
this.Control[iCurrent+9]=this.cbx_5
this.Control[iCurrent+10]=this.uo_1
this.Control[iCurrent+11]=this.sle_4
this.Control[iCurrent+12]=this.cbx_1
this.Control[iCurrent+13]=this.cbx_2
this.Control[iCurrent+14]=this.cbx_3
this.Control[iCurrent+15]=this.rb_1
this.Control[iCurrent+16]=this.rb_2
this.Control[iCurrent+17]=this.rb_3
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.st_3
this.Control[iCurrent+21]=this.st_4
this.Control[iCurrent+22]=this.st_5
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.st_7
this.Control[iCurrent+25]=this.cb_1
this.Control[iCurrent+26]=this.sle_1
this.Control[iCurrent+27]=this.cb_2
this.Control[iCurrent+28]=this.cb_3
this.Control[iCurrent+29]=this.sle_2
this.Control[iCurrent+30]=this.st_8
this.Control[iCurrent+31]=this.st_9
this.Control[iCurrent+32]=this.cbx_4
this.Control[iCurrent+33]=this.gb_1
end on

on u_cst_groupboxtest.destroy
call super::destroy
destroy(this.ddlb_2)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.cb_4)
destroy(this.sle_3)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.ddlb_1)
destroy(this.cbx_5)
destroy(this.uo_1)
destroy(this.sle_4)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.sle_2)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.cbx_4)
destroy(this.gb_1)
end on

event ue_postconstructor;call super::ue_postconstructor;ddlb_1.SelectItem(1)
ddlb_2.SelectItem(2)
uo_1.of_SetImage(sle_3.Text)
end event

type ddlb_2 from dropdownlistbox within u_cst_groupboxtest
integer x = 1367
integer y = 748
integer width = 389
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Normal","Header"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		uo_1.of_SetStyle(uo_1.NORMAL)
	CASE 2
		uo_1.of_SetStyle(uo_1.HEADER)
END CHOOSE
end event

type st_13 from statictext within u_cst_groupboxtest
integer x = 1134
integer y = 764
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Style"
boolean focusrectangle = false
end type

type st_12 from statictext within u_cst_groupboxtest
integer x = 1422
integer y = 1272
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Image"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within u_cst_groupboxtest
integer x = 2089
integer y = 1472
integer width = 210
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set"
end type

event clicked;uo_1.of_SetImage(sle_3.Text)
end event

type sle_3 from singlelineedit within u_cst_groupboxtest
integer x = 1454
integer y = 1352
integer width = 855
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "GroupBox!"
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within u_cst_groupboxtest
integer x = 206
integer y = 1316
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Border Color"
boolean focusrectangle = false
end type

type st_10 from statictext within u_cst_groupboxtest
integer x = 41
integer y = 1284
integer width = 146
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 8421504
boolean border = true
long bordercolor = 8421504
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long al_color

ChooseColor ( al_color )

THIS.Backcolor = al_color
uo_1.of_SetBorderColor(al_color)
end event

type ddlb_1 from dropdownlistbox within u_cst_groupboxtest
integer x = 1737
integer y = 628
integer width = 480
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"BLUE","OLIVE","SILVER","CLASSIC"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		uo_1.of_SetTheme(uo_1.BLUE)
	CASE 2
		uo_1.of_SetTheme(uo_1.OLIVE)
	CASE 3
		uo_1.of_SetTheme(uo_1.SILVER)
	CASE 4
		uo_1.of_SetTheme(uo_1.CLASSIC)
END CHOOSE
end event

type cbx_5 from checkbox within u_cst_groupboxtest
integer x = 1120
integer y = 644
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Theme Background"
end type

event clicked;IF THIS.Checked THEN
	ddlb_1.SelectItem(1)
	uo_1.of_ActivateTheme(uo_1.BLUE)
	rb_3.Checked = FALSE
	rb_1.Checked = TRUE
	uo_1.of_VGradient(TRUE)
	
ELSE
	uo_1.of_DeactivateTheme()
END IF
end event

type uo_1 from u_cst_groupbox within u_cst_groupboxtest
event destroy ( )
integer x = 571
integer y = 40
integer width = 1623
integer height = 524
integer taborder = 20
long fontcolor = 16777215
long groupboxstyle = 1
end type

on uo_1.destroy
call u_cst_groupbox::destroy
end on

type sle_4 from singlelineedit within u_cst_groupboxtest
integer x = 1454
integer y = 1108
integer width = 855
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within u_cst_groupboxtest
integer x = 50
integer y = 684
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Italic"
end type

event clicked;uo_1.of_Italic(Checked)
end event

type cbx_2 from checkbox within u_cst_groupboxtest
integer x = 50
integer y = 764
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bold"
boolean checked = true
end type

event clicked;uo_1.of_Bold(Checked)
end event

type cbx_3 from checkbox within u_cst_groupboxtest
integer x = 50
integer y = 844
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Underline"
end type

event clicked;uo_1.of_Underline(Checked)
end event

type rb_1 from radiobutton within u_cst_groupboxtest
integer x = 558
integer y = 684
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vertical"
end type

event clicked;uo_1.of_VGradient(Checked)
end event

type rb_2 from radiobutton within u_cst_groupboxtest
integer x = 558
integer y = 764
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horizontal"
end type

event clicked;uo_1.of_HGradient(Checked)
end event

type rb_3 from radiobutton within u_cst_groupboxtest
integer x = 558
integer y = 844
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
boolean checked = true
end type

event clicked;uo_1.of_HGradient(FALSE)
uo_1.of_VGradient(FALSE)
end event

type st_1 from statictext within u_cst_groupboxtest
integer x = 41
integer y = 980
integer width = 146
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 0
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long al_color

ChooseColor ( al_color )

THIS.Backcolor = al_color
uo_1.of_SetGradientColor1(al_color)
end event

type st_2 from statictext within u_cst_groupboxtest
integer x = 41
integer y = 1124
integer width = 146
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 0
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long al_color

ChooseColor ( al_color )

THIS.Backcolor = al_color
uo_1.of_SetGradientColor2(al_color)
end event

type st_3 from statictext within u_cst_groupboxtest
integer x = 206
integer y = 1008
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gradient1"
boolean focusrectangle = false
end type

type st_4 from statictext within u_cst_groupboxtest
integer x = 206
integer y = 1156
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gradient2"
boolean focusrectangle = false
end type

type st_5 from statictext within u_cst_groupboxtest
integer x = 814
integer y = 1008
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "FontColor"
boolean focusrectangle = false
end type

type st_6 from statictext within u_cst_groupboxtest
integer x = 649
integer y = 980
integer width = 146
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Long al_color

ChooseColor ( al_color )

THIS.Backcolor = al_color
uo_1.of_FontColor(al_color)
end event

type st_7 from statictext within u_cst_groupboxtest
integer x = 1422
integer y = 1008
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Text"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within u_cst_groupboxtest
integer x = 2089
integer y = 1212
integer width = 210
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set"
end type

event clicked;uo_1.of_Text(sle_4.Text)
end event

type sle_1 from singlelineedit within u_cst_groupboxtest
integer x = 654
integer y = 1172
integer width = 402
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within u_cst_groupboxtest
integer x = 1083
integer y = 1172
integer width = 210
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set"
end type

event clicked;uo_1.of_FontName(sle_1.Text)
end event

type cb_3 from commandbutton within u_cst_groupboxtest
integer x = 1083
integer y = 1344
integer width = 210
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set"
end type

event clicked;uo_1.of_FontSize(Long(sle_2.Text))
end event

type sle_2 from singlelineedit within u_cst_groupboxtest
integer x = 654
integer y = 1344
integer width = 402
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "9"
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within u_cst_groupboxtest
integer x = 658
integer y = 1108
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "FontName"
boolean focusrectangle = false
end type

type st_9 from statictext within u_cst_groupboxtest
integer x = 658
integer y = 1280
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "FontSize"
boolean focusrectangle = false
end type

type cbx_4 from checkbox within u_cst_groupboxtest
integer x = 50
integer y = 604
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Strike Out"
end type

event clicked;uo_1.of_StrikeOut(Checked)
end event

type gb_1 from groupbox within u_cst_groupboxtest
integer x = 517
integer y = 616
integer width = 480
integer height = 332
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gradient Fill"
end type

