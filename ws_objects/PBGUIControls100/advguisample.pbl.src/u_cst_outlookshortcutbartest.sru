$PBExportHeader$u_cst_outlookshortcutbartest.sru
forward
global type u_cst_outlookshortcutbartest from u_cst_tabpage
end type
type cbx_1 from checkbox within u_cst_outlookshortcutbartest
end type
type sle_6 from singlelineedit within u_cst_outlookshortcutbartest
end type
type cb_6 from commandbutton within u_cst_outlookshortcutbartest
end type
type sle_5 from singlelineedit within u_cst_outlookshortcutbartest
end type
type cb_5 from commandbutton within u_cst_outlookshortcutbartest
end type
type sle_4 from singlelineedit within u_cst_outlookshortcutbartest
end type
type cb_4 from commandbutton within u_cst_outlookshortcutbartest
end type
type sle_3 from singlelineedit within u_cst_outlookshortcutbartest
end type
type cb_3 from commandbutton within u_cst_outlookshortcutbartest
end type
type sle_2 from singlelineedit within u_cst_outlookshortcutbartest
end type
type cb_2 from commandbutton within u_cst_outlookshortcutbartest
end type
type cb_1 from commandbutton within u_cst_outlookshortcutbartest
end type
type sle_1 from singlelineedit within u_cst_outlookshortcutbartest
end type
type rb_2 from radiobutton within u_cst_outlookshortcutbartest
end type
type rb_1 from radiobutton within u_cst_outlookshortcutbartest
end type
type dw_1 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_2 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_3 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_4 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_5 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_6 from datawindow within u_cst_outlookshortcutbartest
end type
type dw_7 from datawindow within u_cst_outlookshortcutbartest
end type
type uo_2 from u_cst_xpheader within u_cst_outlookshortcutbartest
end type
type gb_2 from groupbox within u_cst_outlookshortcutbartest
end type
type gb_1 from groupbox within u_cst_outlookshortcutbartest
end type
type uo_1 from u_cst_shortcutbar within u_cst_outlookshortcutbartest
end type
end forward

global type u_cst_outlookshortcutbartest from u_cst_tabpage
integer width = 2487
integer height = 1728
cbx_1 cbx_1
sle_6 sle_6
cb_6 cb_6
sle_5 sle_5
cb_5 cb_5
sle_4 sle_4
cb_4 cb_4
sle_3 sle_3
cb_3 cb_3
sle_2 sle_2
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
rb_2 rb_2
rb_1 rb_1
dw_1 dw_1
dw_2 dw_2
dw_3 dw_3
dw_4 dw_4
dw_5 dw_5
dw_6 dw_6
dw_7 dw_7
uo_2 uo_2
gb_2 gb_2
gb_1 gb_1
uo_1 uo_1
end type
global u_cst_outlookshortcutbartest u_cst_outlookshortcutbartest

type variables
Long il_mail
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);// set the toolbar theme
uo_1.of_SetTheme(as_color)
uo_2.of_SetTheme(as_color)

end subroutine

on u_cst_outlookshortcutbartest.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.sle_6=create sle_6
this.cb_6=create cb_6
this.sle_5=create sle_5
this.cb_5=create cb_5
this.sle_4=create sle_4
this.cb_4=create cb_4
this.sle_3=create sle_3
this.cb_3=create cb_3
this.sle_2=create sle_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.rb_2=create rb_2
this.rb_1=create rb_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.dw_3=create dw_3
this.dw_4=create dw_4
this.dw_5=create dw_5
this.dw_6=create dw_6
this.dw_7=create dw_7
this.uo_2=create uo_2
this.gb_2=create gb_2
this.gb_1=create gb_1
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.sle_6
this.Control[iCurrent+3]=this.cb_6
this.Control[iCurrent+4]=this.sle_5
this.Control[iCurrent+5]=this.cb_5
this.Control[iCurrent+6]=this.sle_4
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.sle_3
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.sle_2
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.sle_1
this.Control[iCurrent+14]=this.rb_2
this.Control[iCurrent+15]=this.rb_1
this.Control[iCurrent+16]=this.dw_1
this.Control[iCurrent+17]=this.dw_2
this.Control[iCurrent+18]=this.dw_3
this.Control[iCurrent+19]=this.dw_4
this.Control[iCurrent+20]=this.dw_5
this.Control[iCurrent+21]=this.dw_6
this.Control[iCurrent+22]=this.dw_7
this.Control[iCurrent+23]=this.uo_2
this.Control[iCurrent+24]=this.gb_2
this.Control[iCurrent+25]=this.gb_1
this.Control[iCurrent+26]=this.uo_1
end on

on u_cst_outlookshortcutbartest.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.sle_6)
destroy(this.cb_6)
destroy(this.sle_5)
destroy(this.cb_5)
destroy(this.sle_4)
destroy(this.cb_4)
destroy(this.sle_3)
destroy(this.cb_3)
destroy(this.sle_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.dw_4)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.dw_7)
destroy(this.uo_2)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.uo_1)
end on

event resize;call super::resize;uo_1.Height = height - uo_1.Y - 10
uo_2.Width = Width - uo_2.X - 10
end event

event destructor;call super::destructor;//uo_1.of_SaveSettings()
end event

event constructor;call super::constructor;
//Custom Header Color
uo_2.of_SetTextColor(RGB(255,255,255),uo_2.LEFT)
uo_2.of_SetTextColor(RGB(255,255,255),uo_2.RIGHT)
end event

type cbx_1 from checkbox within u_cst_outlookshortcutbartest
integer x = 965
integer y = 1404
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Large Icon"
end type

event clicked;IF THIS.Checked THEN
	uo_1.of_SetSize(uo_1.LARGE)
ELSE
	uo_1.of_SetSize(uo_1.SMALL)
END IF
end event

type sle_6 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 1224
integer width = 585
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 1220
integer width = 846
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Show or Hide Items Menu Text"
end type

event clicked;uo_1.of_SetMenuText(uo_1.SHOWORHIDEITEMS, sle_6.Text)
end event

type sle_5 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 1124
integer width = 585
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 1120
integer width = 846
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Hide All Items Menu Text"
end type

event clicked;uo_1.of_SetMenuText(uo_1.HIDEALLITEMS , sle_5.Text)
end event

type sle_4 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 1028
integer width = 585
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 1024
integer width = 846
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Fewer Items Menu Text"
end type

event clicked;uo_1.of_SetMenuText(uo_1.SHOWFEWERITEMS  , sle_4.Text)
end event

type sle_3 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 928
integer width = 585
integer height = 88
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

type cb_3 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 928
integer width = 846
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Morel Items Menu Text"
end type

event clicked;uo_1.of_SetMenuText(uo_1.SHOWMOREITEMS , sle_3.Text)
end event

type sle_2 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 832
integer width = 585
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 828
integer width = 846
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Show All Items Menu Text"
end type

event clicked;uo_1.of_SetMenuText(uo_1.SHOWALLITEMS, sle_2.Text)
end event

type cb_1 from commandbutton within u_cst_outlookshortcutbartest
integer x = 1531
integer y = 632
integer width = 649
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Text for First Item"
end type

event clicked;uo_1.of_SetText(il_mail, sle_1.Text)
end event

type sle_1 from singlelineedit within u_cst_outlookshortcutbartest
integer x = 919
integer y = 636
integer width = 585
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_2 from radiobutton within u_cst_outlookshortcutbartest
integer x = 1051
integer y = 404
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
string text = "Right"
boolean checked = true
end type

event clicked;uo_2.of_SetImage(uo_2.of_GetImage(), uo_2.RIGHT)
end event

type rb_1 from radiobutton within u_cst_outlookshortcutbartest
integer x = 1051
integer y = 312
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
string text = "Left"
end type

event clicked;uo_2.of_SetImage(uo_2.of_GetImage(), uo_2.LEFT)
end event

type dw_1 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within u_cst_outlookshortcutbartest
integer x = 137
integer y = 544
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_2 from u_cst_xpheader within u_cst_outlookshortcutbartest
integer x = 869
integer y = 8
integer width = 1586
integer taborder = 40
end type

on uo_2.destroy
call u_cst_xpheader::destroy
end on

type gb_2 from groupbox within u_cst_outlookshortcutbartest
integer x = 987
integer y = 220
integer width = 1166
integer height = 300
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Image Position"
end type

type gb_1 from groupbox within u_cst_outlookshortcutbartest
integer x = 923
integer y = 136
integer width = 1321
integer height = 444
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gradient Header"
end type

type uo_1 from u_cst_shortcutbar within u_cst_outlookshortcutbartest
integer x = 9
integer y = 8
integer width = 841
integer height = 1716
integer taborder = 40
boolean bringtotop = true
end type

event ue_selectionchanged;call super::ue_selectionchanged;Parent.uo_2.of_SetText(as_text, Parent.uo_2.LEFT)
Parent.uo_2.of_SetImage(as_image, Parent.uo_2.RIGHT)

CHOOSE CASE as_text
	CASE 'Calendar'
		Parent.uo_2.of_SetText(String(Today(), 'mmm dd, yyyy'), Parent.uo_2.RIGHT)
	CASE 'Mail'
		Parent.uo_2.of_SetText('(Filter Applied)', Parent.uo_2.RIGHT)
		Parent.uo_2.of_SetText('Inbox', Parent.uo_2.LEFT)
		Parent.uo_2.of_SetImage('Custom002!', Parent.uo_2.RIGHT)
	CASE ELSE
		Parent.uo_2.of_SetText('', Parent.uo_2.RIGHT)
END CHOOSE
end event

on uo_1.destroy
call u_cst_shortcutbar::destroy
end on

event ue_constructordone;call super::ue_constructordone;//Outlook Shortcut Bar
il_mail = THIS.of_AddItem(dw_1, "Mail", 'Mail.ico')
THIS.of_AddItem(dw_2, "Calendar", 'calendar.ico')
THIS.of_AddItem(dw_3, "Contacts", 'contact.ico')
THIS.of_AddItem(dw_4, "Tasks", 'task.ico')
THIS.of_AddItem(dw_5, "Notes", 'note.ico')
THIS.of_AddItem(dw_6, "Folder List", 'folder.ico')
THIS.of_AddItem(dw_7, "Shortcuts", 'shortcut.ico')


THIS.of_SelectItem("Mail")
THIS.of_HideItem("Notes")
THIS.of_HideItem("Folder List")
THIS.of_HideItem("Shortcuts")
end event

