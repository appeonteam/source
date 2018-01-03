$PBExportHeader$u_cst_xplistbartest.sru
forward
global type u_cst_xplistbartest from u_cst_tabpage
end type
type cb_6 from commandbutton within u_cst_xplistbartest
end type
type cb_5 from commandbutton within u_cst_xplistbartest
end type
type ddlb_3 from dropdownlistbox within u_cst_xplistbartest
end type
type st_9 from statictext within u_cst_xplistbartest
end type
type st_8 from statictext within u_cst_xplistbartest
end type
type sle_4 from singlelineedit within u_cst_xplistbartest
end type
type st_7 from statictext within u_cst_xplistbartest
end type
type st_6 from statictext within u_cst_xplistbartest
end type
type st_5 from statictext within u_cst_xplistbartest
end type
type ddlb_2 from dropdownlistbox within u_cst_xplistbartest
end type
type st_4 from statictext within u_cst_xplistbartest
end type
type st_3 from statictext within u_cst_xplistbartest
end type
type sle_3 from singlelineedit within u_cst_xplistbartest
end type
type ddlb_1 from dropdownlistbox within u_cst_xplistbartest
end type
type sle_2 from singlelineedit within u_cst_xplistbartest
end type
type st_2 from statictext within u_cst_xplistbartest
end type
type cb_4 from commandbutton within u_cst_xplistbartest
end type
type cb_3 from commandbutton within u_cst_xplistbartest
end type
type cb_2 from commandbutton within u_cst_xplistbartest
end type
type cb_1 from commandbutton within u_cst_xplistbartest
end type
type st_1 from statictext within u_cst_xplistbartest
end type
type sle_1 from singlelineedit within u_cst_xplistbartest
end type
type uo_1 from u_cst_xplistbar within u_cst_xplistbartest
end type
end forward

global type u_cst_xplistbartest from u_cst_tabpage
integer width = 2290
integer height = 1536
cb_6 cb_6
cb_5 cb_5
ddlb_3 ddlb_3
st_9 st_9
st_8 st_8
sle_4 sle_4
st_7 st_7
st_6 st_6
st_5 st_5
ddlb_2 ddlb_2
st_4 st_4
st_3 st_3
sle_3 sle_3
ddlb_1 ddlb_1
sle_2 sle_2
st_2 st_2
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
sle_1 sle_1
uo_1 uo_1
end type
global u_cst_xplistbartest u_cst_xplistbartest

type variables
datawindow idw
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);// set the toolbar theme
uo_1.of_SetTheme(as_color)

end subroutine

on u_cst_xplistbartest.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.ddlb_3=create ddlb_3
this.st_9=create st_9
this.st_8=create st_8
this.sle_4=create sle_4
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.ddlb_2=create ddlb_2
this.st_4=create st_4
this.st_3=create st_3
this.sle_3=create sle_3
this.ddlb_1=create ddlb_1
this.sle_2=create sle_2
this.st_2=create st_2
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_1=create sle_1
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.ddlb_3
this.Control[iCurrent+4]=this.st_9
this.Control[iCurrent+5]=this.st_8
this.Control[iCurrent+6]=this.sle_4
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.ddlb_2
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.sle_3
this.Control[iCurrent+14]=this.ddlb_1
this.Control[iCurrent+15]=this.sle_2
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.cb_4
this.Control[iCurrent+18]=this.cb_3
this.Control[iCurrent+19]=this.cb_2
this.Control[iCurrent+20]=this.cb_1
this.Control[iCurrent+21]=this.st_1
this.Control[iCurrent+22]=this.sle_1
this.Control[iCurrent+23]=this.uo_1
end on

on u_cst_xplistbartest.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.ddlb_3)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.sle_4)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.ddlb_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_3)
destroy(this.ddlb_1)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.uo_1)
end on

event resize;call super::resize;uo_1.Height = this.Height

end event

type cb_6 from commandbutton within u_cst_xplistbartest
integer x = 1147
integer y = 1348
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear All"
end type

event clicked;uo_1.of_ClearAll()
end event

type cb_5 from commandbutton within u_cst_xplistbartest
integer x = 1970
integer y = 428
integer width = 306
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear Items"
end type

event clicked;uo_1.of_ClearGroup(sle_1.Text)
end event

type ddlb_3 from dropdownlistbox within u_cst_xplistbartest
integer x = 1335
integer y = 1052
integer width = 933
integer height = 400
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Link","Label","Line"}
borderstyle borderstyle = stylelowered!
end type

type st_9 from statictext within u_cst_xplistbartest
integer x = 1070
integer y = 1072
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Style:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within u_cst_xplistbartest
integer x = 1088
integer y = 944
integer width = 215
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Picture:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_4 from singlelineedit within u_cst_xplistbartest
integer x = 1335
integer y = 932
integer width = 933
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within u_cst_xplistbartest
integer x = 1088
integer y = 824
integer width = 201
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Label:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within u_cst_xplistbartest
integer x = 1070
integer y = 716
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Group:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within u_cst_xplistbartest
integer x = 1070
integer y = 332
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Style:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within u_cst_xplistbartest
integer x = 1335
integer y = 312
integer width = 933
integer height = 400
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Special","No Arrow","Original"}
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within u_cst_xplistbartest
integer x = 1070
integer y = 216
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Picture:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within u_cst_xplistbartest
integer x = 1070
integer y = 116
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within u_cst_xplistbartest
integer x = 1335
integer y = 204
integer width = 933
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within u_cst_xplistbartest
integer x = 1335
integer y = 696
integer width = 933
integer height = 400
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within u_cst_xplistbartest
integer x = 1335
integer y = 812
integer width = 933
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within u_cst_xplistbartest
integer x = 1065
integer y = 596
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Item"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within u_cst_xplistbartest
integer x = 1710
integer y = 1180
integer width = 270
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;IF Len(Trim(ddlb_1.Text)) > 0 THEN
	IF Len(Trim(sle_2.Text)) > 0 THEN
		
		CHOOSE CASE ddlb_3.Text
			CASE 'Label'
				uo_1.of_addlabel (sle_2.Text, sle_4.Text, uo_1.of_GetGroupNumber(ddlb_1.Text))
			CASE 'Line'
				uo_1.of_addline (uo_1.of_GetGroupNumber(ddlb_1.Text))
			CASE ELSE
				uo_1.of_addlink (sle_2.Text, sle_4.Text, uo_1.of_GetGroupNumber(ddlb_1.Text))
		END CHOOSE
		
	END IF
END IF

end event

type cb_3 from commandbutton within u_cst_xplistbartest
integer x = 1993
integer y = 1180
integer width = 270
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Remove"
end type

event clicked;uo_1.of_RemoveItem(ddlb_1.Text, sle_2.Text)
end event

type cb_2 from commandbutton within u_cst_xplistbartest
integer x = 1687
integer y = 428
integer width = 270
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Remove"
end type

event clicked;uo_1.of_RemoveGroup(sle_1.Text)
end event

type cb_1 from commandbutton within u_cst_xplistbartest
integer x = 1403
integer y = 428
integer width = 270
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

event clicked;IF Len(Trim(sle_1.Text)) > 0 THEN
	CHOOSE CASE ddlb_2.Text
		CASE 'Special'
			uo_1.of_AddGroup (sle_1.Text,sle_3.Text, uo_1.SPECIAL)
		CASE 'No Arrow'
			uo_1.of_AddGroup (sle_1.Text,sle_3.Text, uo_1.NOARROW)
		CASE ELSE
			uo_1.of_AddGroup (sle_1.Text,sle_3.Text, uo_1.ORIGINAL)
	END CHOOSE
	
	ddlb_1.AddItem(sle_1.Text)
END IF
end event

type st_1 from statictext within u_cst_xplistbartest
integer x = 1065
integer y = 24
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 67108864
string text = "Group"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within u_cst_xplistbartest
integer x = 1335
integer y = 100
integer width = 933
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type uo_1 from u_cst_xplistbar within u_cst_xplistbartest
integer x = 9
integer y = 12
integer height = 1500
integer taborder = 20
end type

on uo_1.destroy
call u_cst_xplistbar::destroy
end on

