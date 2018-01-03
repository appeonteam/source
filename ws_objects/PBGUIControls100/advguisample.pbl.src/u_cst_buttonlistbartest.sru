$PBExportHeader$u_cst_buttonlistbartest.sru
forward
global type u_cst_buttonlistbartest from u_cst_tabpage
end type
type st_3 from statictext within u_cst_buttonlistbartest
end type
type ddlb_style from dropdownlistbox within u_cst_buttonlistbartest
end type
type uo_2 from u_cst_buttonlistbar within u_cst_buttonlistbartest
end type
type cb_2 from commandbutton within u_cst_buttonlistbartest
end type
type cb_1 from commandbutton within u_cst_buttonlistbartest
end type
type sle_2 from singlelineedit within u_cst_buttonlistbartest
end type
type sle_1 from singlelineedit within u_cst_buttonlistbartest
end type
type uo_1 from u_cst_buttonlistbar within u_cst_buttonlistbartest
end type
type rb_1 from radiobutton within u_cst_buttonlistbartest
end type
type rb_2 from radiobutton within u_cst_buttonlistbartest
end type
type rb_3 from radiobutton within u_cst_buttonlistbartest
end type
type rb_4 from radiobutton within u_cst_buttonlistbartest
end type
type cbx_1 from checkbox within u_cst_buttonlistbartest
end type
type rb_blue from radiobutton within u_cst_buttonlistbartest
end type
type rb_olive from radiobutton within u_cst_buttonlistbartest
end type
type rb_silver from radiobutton within u_cst_buttonlistbartest
end type
type rb_classic from radiobutton within u_cst_buttonlistbartest
end type
type st_1 from statictext within u_cst_buttonlistbartest
end type
type htb_1 from htrackbar within u_cst_buttonlistbartest
end type
type st_2 from statictext within u_cst_buttonlistbartest
end type
type gb_1 from groupbox within u_cst_buttonlistbartest
end type
type gb_2 from groupbox within u_cst_buttonlistbartest
end type
end forward

global type u_cst_buttonlistbartest from u_cst_tabpage
integer width = 2304
integer height = 1868
st_3 st_3
ddlb_style ddlb_style
uo_2 uo_2
cb_2 cb_2
cb_1 cb_1
sle_2 sle_2
sle_1 sle_1
uo_1 uo_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
cbx_1 cbx_1
rb_blue rb_blue
rb_olive rb_olive
rb_silver rb_silver
rb_classic rb_classic
st_1 st_1
htb_1 htb_1
st_2 st_2
gb_1 gb_1
gb_2 gb_2
end type
global u_cst_buttonlistbartest u_cst_buttonlistbartest

type variables
long al_firstitem
long al_seconditem
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);// set the toolbar theme
uo_1.of_SetTheme(as_color)

choose case Lower(as_color)
	case "blue"
		rb_blue.checked = True
	case "olive"
		rb_olive.checked = True
	case "silver"
		rb_silver.checked = True
	case "classic"
		rb_classic.checked = True
end choose

end subroutine

on u_cst_buttonlistbartest.create
int iCurrent
call super::create
this.st_3=create st_3
this.ddlb_style=create ddlb_style
this.uo_2=create uo_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.uo_1=create uo_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.cbx_1=create cbx_1
this.rb_blue=create rb_blue
this.rb_olive=create rb_olive
this.rb_silver=create rb_silver
this.rb_classic=create rb_classic
this.st_1=create st_1
this.htb_1=create htb_1
this.st_2=create st_2
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.ddlb_style
this.Control[iCurrent+3]=this.uo_2
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.sle_2
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.rb_1
this.Control[iCurrent+10]=this.rb_2
this.Control[iCurrent+11]=this.rb_3
this.Control[iCurrent+12]=this.rb_4
this.Control[iCurrent+13]=this.cbx_1
this.Control[iCurrent+14]=this.rb_blue
this.Control[iCurrent+15]=this.rb_olive
this.Control[iCurrent+16]=this.rb_silver
this.Control[iCurrent+17]=this.rb_classic
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.htb_1
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.gb_2
end on

on u_cst_buttonlistbartest.destroy
call super::destroy
destroy(this.st_3)
destroy(this.ddlb_style)
destroy(this.uo_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.uo_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.cbx_1)
destroy(this.rb_blue)
destroy(this.rb_olive)
destroy(this.rb_silver)
destroy(this.rb_classic)
destroy(this.st_1)
destroy(this.htb_1)
destroy(this.st_2)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event resize;call super::resize;uo_1.Height = this.Height
uo_2.Width = this.Width - uo_2.X
uo_2.Y = this.Height - uo_2.HEIGHT - 20


end event

event ue_postconstructor;call super::ue_postconstructor;al_firstitem = uo_1.of_AddItem("Mail", 'Custom001!')
al_seconditem = uo_1.of_AddItem("Calendar", 'Custom002!')
uo_1.of_AddItem("Contacts", 'Custom003!')
uo_1.of_AddItem("Tasks", 'Custom004!')
uo_1.of_AddItem("Notes", 'Custom005!')
uo_1.of_AddItem("Folder List", 'Custom006!')
uo_1.of_AddItem("Shortcuts With really long label to test wrapping", 'Custom007!')

uo_1.of_AddItem("Mail", 'Custom008!')
uo_1.of_AddItem("Calendar", 'Custom009!')
uo_1.of_AddItem("Contacts", 'Custom010!')
uo_1.of_AddItem("Tasks", 'Custom011!')
uo_1.of_AddItem("Notes", 'Custom012!')
uo_1.of_AddItem("Folder List", 'Custom013!')
uo_1.of_AddItem("Shortcuts With really long label to test wrapping", 'Custom014!')

uo_1.of_SelectButton("Mail")

uo_2.of_AddItem("Mail", 'Custom015!')
uo_2.of_AddItem("Calendar", 'Custom016!')
uo_2.of_AddItem("Contacts", 'Custom017!')
uo_2.of_AddItem("Tasks", 'Custom018!')
uo_2.of_AddItem("Notes", 'Custom019!')
uo_2.of_AddItem("Folder List", 'Custom020!')
uo_2.of_AddItem("Shortcuts With really long label to test wrapping", 'Custom021!')

uo_2.of_SelectButton("Mail")

CHOOSE CASE uo_1.il_CurrentTheme
	CASE uo_1.BLUE
		rb_blue.checked = True
	CASE uo_1.SILVER
		rb_silver.checked = True
	CASE uo_1.OLIVE
		rb_olive.checked = True
	CASE ELSE
		rb_classic.checked = True
END CHOOSE

end event

type st_3 from statictext within u_cst_buttonlistbartest
integer x = 709
integer y = 1556
integer width = 251
integer height = 60
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

type ddlb_style from dropdownlistbox within u_cst_buttonlistbartest
integer x = 974
integer y = 1536
integer width = 539
integer height = 576
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"BUTTON","LIST"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		uo_1.of_SetStyle(uo_1.BUTTON)
	CASE 2
		uo_1.of_SetStyle(uo_1.LIST)
END CHOOSE
end event

type uo_2 from u_cst_buttonlistbar within u_cst_buttonlistbartest
boolean visible = false
integer x = 663
integer y = 1488
integer width = 1609
integer height = 340
integer taborder = 40
end type

event selectionchanged;call super::selectionchanged;PARENT.st_1.Text = of_GetText(newindex)
end event

on uo_2.destroy
call u_cst_buttonlistbar::destroy
end on

type cb_2 from commandbutton within u_cst_buttonlistbartest
integer x = 1349
integer y = 1380
integer width = 658
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Text for Second Item"
end type

event clicked;uo_1.of_SetText(al_seconditem, sle_2.Text)
end event

type cb_1 from commandbutton within u_cst_buttonlistbartest
integer x = 1349
integer y = 1268
integer width = 594
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Text for First Item"
end type

event clicked;uo_1.of_SetText(al_firstitem, sle_1.Text)
end event

type sle_2 from singlelineedit within u_cst_buttonlistbartest
integer x = 704
integer y = 1384
integer width = 603
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within u_cst_buttonlistbartest
integer x = 704
integer y = 1272
integer width = 603
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type uo_1 from u_cst_buttonlistbar within u_cst_buttonlistbartest
integer x = 9
integer y = 8
integer width = 617
integer height = 1840
integer taborder = 30
end type

event selectionchanged;call super::selectionchanged;PARENT.st_1.Text = of_GetText(newindex)
end event

on uo_1.destroy
call u_cst_buttonlistbar::destroy
end on

type rb_1 from radiobutton within u_cst_buttonlistbartest
integer x = 713
integer y = 88
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
string text = "Small"
end type

event clicked;uo_1.of_SetSize(uo_1.SMALL)
end event

type rb_2 from radiobutton within u_cst_buttonlistbartest
integer x = 713
integer y = 168
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
string text = "Medium"
boolean checked = true
end type

event clicked;uo_1.of_SetSize(uo_1.MEDIUM)
end event

type rb_3 from radiobutton within u_cst_buttonlistbartest
integer x = 713
integer y = 248
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
string text = "Large"
end type

event clicked;uo_1.of_SetSize(uo_1.LARGE)
end event

type rb_4 from radiobutton within u_cst_buttonlistbartest
integer x = 713
integer y = 328
integer width = 352
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "XLarge"
end type

event clicked;uo_1.of_SetSize(uo_1.XLARGE)
end event

type cbx_1 from checkbox within u_cst_buttonlistbartest
integer x = 672
integer y = 480
integer width = 507
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enable Calendar"
boolean checked = true
end type

event clicked;uo_1.of_SetEnabled("Calendar",checked)
end event

type rb_blue from radiobutton within u_cst_buttonlistbartest
integer x = 722
integer y = 660
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
string text = "Blue"
boolean checked = true
end type

event clicked;uo_1.of_SetTheme(uo_1.BLUE)
end event

type rb_olive from radiobutton within u_cst_buttonlistbartest
integer x = 722
integer y = 740
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
string text = "Olive"
end type

event clicked;uo_1.of_SetTheme(uo_1.OLIVE)
end event

type rb_silver from radiobutton within u_cst_buttonlistbartest
integer x = 722
integer y = 820
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
string text = "Silver"
end type

event clicked;uo_1.of_SetTheme(uo_1.SILVER)
end event

type rb_classic from radiobutton within u_cst_buttonlistbartest
integer x = 722
integer y = 900
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
string text = "Classic"
end type

event clicked;uo_1.of_SetTheme(uo_1.CLASSIC)
end event

type st_1 from statictext within u_cst_buttonlistbartest
integer x = 1458
integer y = 80
integer width = 869
integer height = 728
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type htb_1 from htrackbar within u_cst_buttonlistbartest
integer x = 667
integer y = 1092
integer width = 1056
integer height = 136
integer maxposition = 100
integer position = 20
integer tickfrequency = 5
end type

event moved;st_2.Text = 'Scroll Speed - ' + String(scrollpos)
uo_1.of_SetScrollSpeed(scrollpos)
end event

type st_2 from statictext within u_cst_buttonlistbartest
integer x = 704
integer y = 1032
integer width = 466
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Scroll Speed - 10"
boolean focusrectangle = false
end type

type gb_1 from groupbox within u_cst_buttonlistbartest
integer x = 672
integer y = 8
integer width = 480
integer height = 432
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Size"
end type

type gb_2 from groupbox within u_cst_buttonlistbartest
integer x = 672
integer y = 576
integer width = 480
integer height = 432
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Theme"
end type

