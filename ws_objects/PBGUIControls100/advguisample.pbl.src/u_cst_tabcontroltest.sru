$PBExportHeader$u_cst_tabcontroltest.sru
forward
global type u_cst_tabcontroltest from u_cst_tabpage
end type
type cbx_5 from checkbox within u_cst_tabcontroltest
end type
type cbx_4 from checkbox within u_cst_tabcontroltest
end type
type cbx_3 from checkbox within u_cst_tabcontroltest
end type
type uo_1 from u_cst_tabcontrol within u_cst_tabcontroltest
end type
type rb_6 from radiobutton within u_cst_tabcontroltest
end type
type cbx_2 from checkbox within u_cst_tabcontroltest
end type
type cbx_1 from checkbox within u_cst_tabcontroltest
end type
type rb_5 from radiobutton within u_cst_tabcontroltest
end type
type rb_4 from radiobutton within u_cst_tabcontroltest
end type
type rb_3 from radiobutton within u_cst_tabcontroltest
end type
type rb_2 from radiobutton within u_cst_tabcontroltest
end type
type rb_1 from radiobutton within u_cst_tabcontroltest
end type
type gb_1 from groupbox within u_cst_tabcontroltest
end type
type gb_2 from groupbox within u_cst_tabcontroltest
end type
end forward

global type u_cst_tabcontroltest from u_cst_tabpage
integer width = 2866
integer height = 1048
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
uo_1 uo_1
rb_6 rb_6
cbx_2 cbx_2
cbx_1 cbx_1
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
gb_2 gb_2
end type
global u_cst_tabcontroltest u_cst_tabcontroltest

type variables
u_cst_mle uo_mle_1
u_cst_mle uo_mle_2
u_cst_mle uo_mle_3
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);uo_1.of_SetTheme(as_color)
end subroutine

on u_cst_tabcontroltest.create
int iCurrent
call super::create
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.uo_1=create uo_1
this.rb_6=create rb_6
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_5
this.Control[iCurrent+2]=this.cbx_4
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.rb_6
this.Control[iCurrent+6]=this.cbx_2
this.Control[iCurrent+7]=this.cbx_1
this.Control[iCurrent+8]=this.rb_5
this.Control[iCurrent+9]=this.rb_4
this.Control[iCurrent+10]=this.rb_3
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_1
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.gb_2
end on

on u_cst_tabcontroltest.destroy
call super::destroy
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.uo_1)
destroy(this.rb_6)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event ue_postconstructor;call super::ue_postconstructor;uo_1.of_OpenTab(uo_mle_1, 'Tab One','SQL!')
//uo_1.of_OpenTab(uo_mle_1, 'THIS IS A REALLY LONG TEXT HEADER IN ALL CAPS',1)
//uo_1.of_OpenTab(uo_mle_1, 'This is a really long text Header in all caps',1)
uo_1.of_OpenTab(uo_mle_2, 'Tab Two','StaticText!')
uo_1.of_OpenTab(uo_mle_3, 'Tab Three','Tab!')

uo_1.of_SelectTab(1)
uo_1.of_SetStyle(uo_1.VS2005)
end event

type cbx_5 from checkbox within u_cst_tabcontroltest
integer x = 1312
integer y = 944
integer width = 901
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Close Button in All Tabs"
end type

event clicked;uo_1.of_DisplayCloseButtonInAllTabs(THIS.Checked)
end event

type cbx_4 from checkbox within u_cst_tabcontroltest
integer x = 1312
integer y = 836
integer width = 791
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Close Button in Tab"
end type

event clicked;uo_1.of_DisplayCloseButtonInTab(THIS.Checked)
end event

type cbx_3 from checkbox within u_cst_tabcontroltest
integer x = 1312
integer y = 736
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show Chevron"
end type

event clicked;IF THIS.Checked THEN
	uo_1.of_ShowChevron()
ELSE
	uo_1.of_HideChevron()
END IF
end event

type uo_1 from u_cst_tabcontrol within u_cst_tabcontroltest
integer x = 325
integer y = 68
integer width = 2501
integer taborder = 20
end type

on uo_1.destroy
call u_cst_tabcontrol::destroy
end on

type rb_6 from radiobutton within u_cst_tabcontroltest
integer x = 823
integer y = 800
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
string text = "Office 2007"
end type

event clicked;uo_1.of_SetStyle(uo_1.OFFICE2007)
end event

type cbx_2 from checkbox within u_cst_tabcontroltest
integer x = 1312
integer y = 580
integer width = 434
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show Arrows"
boolean checked = true
end type

event clicked;IF THIS.Checked THEN
	uo_1.of_ShowArrows()
ELSE
	uo_1.of_HideArrows()
END IF
end event

type cbx_1 from checkbox within u_cst_tabcontroltest
integer x = 1312
integer y = 496
integer width = 571
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show Close Button"
boolean checked = true
end type

event clicked;IF THIS.Checked THEN
	uo_1.of_ShowCloseButton()
ELSE
	uo_1.of_HideCloseButton()
END IF
end event

type rb_5 from radiobutton within u_cst_tabcontroltest
integer x = 823
integer y = 724
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
string text = "VS2005"
boolean checked = true
end type

event clicked;uo_1.of_SetStyle(uo_1.VS2005)
end event

type rb_4 from radiobutton within u_cst_tabcontroltest
integer x = 823
integer y = 648
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
string text = "Excel"
end type

event clicked;uo_1.of_SetStyle(uo_1.EXCEL)
end event

type rb_3 from radiobutton within u_cst_tabcontroltest
integer x = 827
integer y = 572
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
string text = "Regular"
end type

event clicked;uo_1.of_SetStyle(uo_1.REGULAR)
end event

type rb_2 from radiobutton within u_cst_tabcontroltest
integer x = 224
integer y = 648
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
string text = "Bottom"
end type

event clicked;uo_1.of_SetTabPosition(uo_1.BOTTOM)
end event

type rb_1 from radiobutton within u_cst_tabcontroltest
integer x = 224
integer y = 572
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
string text = "Top"
boolean checked = true
end type

event clicked;uo_1.of_SetTabPosition(uo_1.TOP)
end event

type gb_1 from groupbox within u_cst_tabcontroltest
integer x = 165
integer y = 496
integer width = 485
integer height = 284
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Position"
end type

type gb_2 from groupbox within u_cst_tabcontroltest
integer x = 759
integer y = 496
integer width = 507
integer height = 416
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Style"
end type

