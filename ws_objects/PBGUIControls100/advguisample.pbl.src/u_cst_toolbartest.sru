$PBExportHeader$u_cst_toolbartest.sru
forward
global type u_cst_toolbartest from u_cst_tabpage
end type
type cbx_7 from checkbox within u_cst_toolbartest
end type
type uo_4 from u_cst_toolbarstrip within u_cst_toolbartest
end type
type rb_5 from radiobutton within u_cst_toolbartest
end type
type rb_4 from radiobutton within u_cst_toolbartest
end type
type rb_3 from radiobutton within u_cst_toolbartest
end type
type rb_2 from radiobutton within u_cst_toolbartest
end type
type rb_1 from radiobutton within u_cst_toolbartest
end type
type ddlb_size from dropdownlistbox within u_cst_toolbartest
end type
type uo_3 from u_cst_toolbarstrip within u_cst_toolbartest
end type
type cbx_6 from checkbox within u_cst_toolbartest
end type
type uo_2 from u_cst_toolbarstrip within u_cst_toolbartest
end type
type cb_1 from commandbutton within u_cst_toolbartest
end type
type sle_1 from singlelineedit within u_cst_toolbartest
end type
type cbx_5 from checkbox within u_cst_toolbartest
end type
type cbx_4 from checkbox within u_cst_toolbartest
end type
type em_1 from editmask within u_cst_toolbartest
end type
type dw_2 from datawindow within u_cst_toolbartest
end type
type cbx_3 from checkbox within u_cst_toolbartest
end type
type cbx_2 from checkbox within u_cst_toolbartest
end type
type cbx_1 from checkbox within u_cst_toolbartest
end type
type uo_1 from u_cst_toolbarstrip within u_cst_toolbartest
end type
type gb_1 from groupbox within u_cst_toolbartest
end type
end forward

global type u_cst_toolbartest from u_cst_tabpage
integer width = 2409
integer height = 2328
cbx_7 cbx_7
uo_4 uo_4
rb_5 rb_5
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
ddlb_size ddlb_size
uo_3 uo_3
cbx_6 cbx_6
uo_2 uo_2
cb_1 cb_1
sle_1 sle_1
cbx_5 cbx_5
cbx_4 cbx_4
em_1 em_1
dw_2 dw_2
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
uo_1 uo_1
gb_1 gb_1
end type
global u_cst_toolbartest u_cst_toolbartest

type variables
Boolean ib_preview
long il_open
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);// set the toolbar theme
uo_1.of_SetTheme(as_color)
uo_2.of_SetTheme(as_color)
uo_3.of_SetTheme(as_color)


end subroutine

on u_cst_toolbartest.create
int iCurrent
call super::create
this.cbx_7=create cbx_7
this.uo_4=create uo_4
this.rb_5=create rb_5
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.ddlb_size=create ddlb_size
this.uo_3=create uo_3
this.cbx_6=create cbx_6
this.uo_2=create uo_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.em_1=create em_1
this.dw_2=create dw_2
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.uo_1=create uo_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_7
this.Control[iCurrent+2]=this.uo_4
this.Control[iCurrent+3]=this.rb_5
this.Control[iCurrent+4]=this.rb_4
this.Control[iCurrent+5]=this.rb_3
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.ddlb_size
this.Control[iCurrent+9]=this.uo_3
this.Control[iCurrent+10]=this.cbx_6
this.Control[iCurrent+11]=this.uo_2
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.sle_1
this.Control[iCurrent+14]=this.cbx_5
this.Control[iCurrent+15]=this.cbx_4
this.Control[iCurrent+16]=this.em_1
this.Control[iCurrent+17]=this.dw_2
this.Control[iCurrent+18]=this.cbx_3
this.Control[iCurrent+19]=this.cbx_2
this.Control[iCurrent+20]=this.cbx_1
this.Control[iCurrent+21]=this.uo_1
this.Control[iCurrent+22]=this.gb_1
end on

on u_cst_toolbartest.destroy
call super::destroy
destroy(this.cbx_7)
destroy(this.uo_4)
destroy(this.rb_5)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.ddlb_size)
destroy(this.uo_3)
destroy(this.cbx_6)
destroy(this.uo_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.em_1)
destroy(this.dw_2)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.uo_1)
destroy(this.gb_1)
end on

event resize;call super::resize;dw_2.Width = this.Width
uo_1.Width = this.Width - 20
uo_2.Height = THIS.Height - uo_2.Y - 8
end event

type cbx_7 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 668
integer width = 841
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Text Under Image"
end type

event clicked;uo_1.of_DisplayTextUnderImage()
uo_2.of_DisplayTextUnderImage()
uo_3.of_DisplayTextUnderImage()
uo_4.of_DisplayTextUnderImage()
end event

type uo_4 from u_cst_toolbarstrip within u_cst_toolbartest
event destroy ( )
integer x = 2217
integer y = 956
integer width = 352
integer height = 1236
integer taborder = 30
boolean ib_displayborder = false
long il_currentsize = 32
end type

on uo_4.destroy
call u_cst_toolbarstrip::destroy
end on

event constructor;call super::constructor;


Long ll_group, ll_a, ll_b, ll_c
ll_group = of_AddGroup()
ll_a = of_AddItem('Open', 'Open!', 'Open a New Item')
ll_b = of_AddItem('Save', 'Save!', 'Save information to file')

of_DisplayText(ll_group, TRUE)

of_AssignItemToGroup(ll_group,ll_a)
of_AssignItemToGroup(ll_group,ll_b)

of_setgroupitem (ll_group, ll_a)


of_AddSeparator()
of_AddItem('Print', 'Print!')
of_AddItem('Preview', 'Preview!')
of_AddSeparator()
of_AddItem('Cut','Cut!')
of_AddItem('Copy','Copy!')
of_AddItem('Paste','Paste!')
of_AddSeparator()
of_AddItem('First Row', 'VCRFirst!')
of_AddItem('Prior Row', 'VCRPrior!')
of_AddSeparator()
of_AddItem('Next Row', 'VCRNext!')
of_AddItem('Last Row', 'VCRLast!')


//uo_1.of_AddItem('Exit', 'Exit!', 'Exit Window', uo_1.RIGHT)
//uo_1.of_AddSeparator(uo_1.RIGHT)
//uo_1.of_AddItem('Help', 'Help!', 'Display Help',uo_1.RIGHT)


end event

event ue_buttonclicked;call super::ue_buttonclicked;String ls_file

SetNull(ls_file)

CHOOSE CASE Upper(as_button)
	CASE 'SAVE'
		dw_2.SaveAs()
	CASE 'OPEN'
		dw_2.ImportFile(ls_file)
	CASE 'PRINT'
		dw_2.Print()
	CASE 'PREVIEW'
		ib_preview = NOT ib_preview
		IF ib_preview THEN
			dw_2.Modify('Datawindow.Print.Preview=yes')
		ELSE
			dw_2.Modify('Datawindow.Print.Preview=no')
		END IF
	CASE 'CUT'
		dw_2.Cut()
	CASE 'COPY'
		dw_2.Copy()
	CASE 'PASTE'
		dw_2.Paste()

	CASE 'PRIOR ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() - 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'FIRST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(1)
		dw_2.SelectRow(1, TRUE)
		dw_2.ScrollToRow(1)
	CASE 'NEXT ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() + 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'LAST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.RowCount())
		dw_2.SelectRow(dw_2.RowCount(), TRUE)
		dw_2.ScrollToRow(dw_2.RowCount())
END CHOOSE
end event

type rb_5 from radiobutton within u_cst_toolbartest
integer x = 1056
integer y = 1704
integer width = 439
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom"
end type

event clicked;uo_1.of_SetStyle(uo_1.CUSTOM)
uo_3.of_SetStyle(uo_3.CUSTOM)
end event

type rb_4 from radiobutton within u_cst_toolbartest
integer x = 1056
integer y = 1608
integer width = 439
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Glass"
end type

event clicked;uo_1.of_SetStyle(uo_1.VISTAGlASS)
uo_3.of_SetStyle(uo_3.VISTAGlASS)
end event

type rb_3 from radiobutton within u_cst_toolbartest
integer x = 457
integer y = 1704
integer width = 521
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Embossed"
end type

event clicked;uo_1.of_SetStyle(uo_1.VISTAEMBOSSED)
uo_3.of_SetStyle(uo_3.VISTAEMBOSSED)
end event

type rb_2 from radiobutton within u_cst_toolbartest
integer x = 457
integer y = 1800
integer width = 439
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vista Original"
end type

event clicked;uo_1.of_SetStyle(uo_1.VISTAORIGINAL)
uo_3.of_SetStyle(uo_3.VISTAORIGINAL)
end event

type rb_1 from radiobutton within u_cst_toolbartest
integer x = 457
integer y = 1608
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "XP"
boolean checked = true
end type

event clicked;uo_1.of_SetStyle(uo_1.XP)
uo_3.of_SetStyle(uo_3.XP)
end event

type ddlb_size from dropdownlistbox within u_cst_toolbartest
integer x = 1522
integer y = 956
integer width = 654
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Small","Medium","Large","XLarge"}
borderstyle borderstyle = stylelowered!
end type

event constructor;Text = "Large"
end event

event selectionchanged;CHOOSE CASE index
	CASE 1
		uo_3.of_SetSize(uo_3.SMALL)
		uo_4.of_SetSize(uo_4.SMALL)
	CASE 2
		uo_3.of_SetSize(uo_3.MEDIUM)
		uo_4.of_SetSize(uo_4.MEDIUM)
	CASE 3
		uo_3.of_SetSize(uo_3.LARGE)
		uo_4.of_SetSize(uo_4.LARGE)
	CASE 4
		uo_3.of_SetSize(uo_3.XLARGE)
		uo_4.of_SetSize(uo_4.XLARGE)
END CHOOSE

end event

type uo_3 from u_cst_toolbarstrip within u_cst_toolbartest
event destroy ( )
integer x = 1403
integer y = 692
integer width = 2757
integer height = 208
integer taborder = 20
boolean autosize = true
boolean ib_displayborder = false
long il_currentsize = 32
end type

on uo_3.destroy
call u_cst_toolbarstrip::destroy
end on

event constructor;call super::constructor;of_AddItem('Open', 'Open!', 'Open a New Item')
of_AddItem('Save', 'Save!', 'Save information to file')
of_AddSeparator()
of_AddItem('Print', 'Print!')
of_AddItem('Preview', 'Preview!')
of_AddSeparator()


Long ll_group, ll_a, ll_b, ll_c
ll_group = of_AddGroup()
ll_a = of_AddItem('Cut','Cut!')
ll_b = of_AddItem('Copy','Copy!')
ll_c = of_AddItem('Paste','Paste!')

of_DisplayText(ll_group, TRUE)

of_AssignItemToGroup(ll_group,ll_a)
of_AssignItemToGroup(ll_group,ll_b)
of_AssignItemToGroup(ll_group,ll_c)

of_setgroupitem (ll_group, ll_a)

of_AddSeparator()
of_AddItem('First Row', 'VCRFirst!')
of_AddItem('Prior Row', 'VCRPrior!')
of_AddSeparator()
of_AddItem('Next Row', 'VCRNext!')
of_AddItem('Last Row', 'VCRLast!')


//uo_1.of_AddItem('Exit', 'Exit!', 'Exit Window', uo_1.RIGHT)
//uo_1.of_AddSeparator(uo_1.RIGHT)
//uo_1.of_AddItem('Help', 'Help!', 'Display Help',uo_1.RIGHT)


end event

event ue_buttonclicked;call super::ue_buttonclicked;String ls_file

SetNull(ls_file)

CHOOSE CASE Upper(as_button)
	CASE 'SAVE'
		dw_2.SaveAs()
	CASE 'OPEN'
		dw_2.ImportFile(ls_file)
	CASE 'PRINT'
		dw_2.Print()
	CASE 'PREVIEW'
		ib_preview = NOT ib_preview
		IF ib_preview THEN
			dw_2.Modify('Datawindow.Print.Preview=yes')
		ELSE
			dw_2.Modify('Datawindow.Print.Preview=no')
		END IF
	CASE 'CUT'
		dw_2.Cut()
	CASE 'COPY'
		dw_2.Copy()
	CASE 'PASTE'
		dw_2.Paste()

	CASE 'PRIOR ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() - 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'FIRST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(1)
		dw_2.SelectRow(1, TRUE)
		dw_2.ScrollToRow(1)
	CASE 'NEXT ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() + 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'LAST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.RowCount())
		dw_2.SelectRow(dw_2.RowCount(), TRUE)
		dw_2.ScrollToRow(dw_2.RowCount())
END CHOOSE
end event

type cbx_6 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 1272
integer width = 1088
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Make Open Button Invisible and Visible"
boolean checked = true
end type

event clicked;uo_1.of_SetVisible(il_open, checked)
uo_2.of_SetVisible(il_open, checked)
uo_3.of_SetVisible(il_open, checked)
uo_4.of_SetVisible(il_open, checked)
end event

type uo_2 from u_cst_toolbarstrip within u_cst_toolbartest
event destroy ( )
integer y = 344
integer width = 123
integer height = 1760
integer taborder = 10
boolean ib_displayborder = false
end type

on uo_2.destroy
call u_cst_toolbarstrip::destroy
end on

event constructor;call super::constructor;THIS.of_AddItem('Open', 'Open!', 'Open a New Item')
THIS.of_AddItem('Save', 'Save!', 'Save information to file')
THIS.of_AddSeparator()
THIS.of_AddItem('Print', 'Print!')
THIS.of_AddItem('Preview', 'Preview!')
THIS.of_AddSeparator()
THIS.of_AddItem('Cut','Cut!')
THIS.of_AddItem('Copy','Copy!')
THIS.of_AddItem('Paste','Paste!')

THIS.of_AddItem('Exit', 'Exit!', 'Exit Window', THIS.RIGHT)
THIS.of_AddSeparator(THIS.RIGHT)
THIS.of_AddItem('Help', 'Help!', 'Display Help',THIS.RIGHT)
end event

event ue_buttonclicked;call super::ue_buttonclicked;String ls_file

SetNull(ls_file)

CHOOSE CASE Upper(as_button)
	CASE 'SAVE'
		dw_2.SaveAs()
	CASE 'OPEN'
		dw_2.ImportFile(ls_file)
	CASE 'PRINT'
		dw_2.Print()
	CASE 'PREVIEW'
		ib_preview = NOT ib_preview
		IF ib_preview THEN
			dw_2.Modify('Datawindow.Print.Preview=yes')
		ELSE
			dw_2.Modify('Datawindow.Print.Preview=no')
		END IF
	CASE 'CUT'
		dw_2.Cut()
	CASE 'COPY'
		dw_2.Copy()
	CASE 'PASTE'
		dw_2.Paste()

	CASE 'PRIOR ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() - 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'FIRST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(1)
		dw_2.SelectRow(1, TRUE)
		dw_2.ScrollToRow(1)
	CASE 'NEXT ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() + 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'LAST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.RowCount())
		dw_2.SelectRow(dw_2.RowCount(), TRUE)
		dw_2.ScrollToRow(dw_2.RowCount())
END CHOOSE
end event

type cb_1 from commandbutton within u_cst_toolbartest
integer x = 855
integer y = 1408
integer width = 745
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Set Text for First Button"
end type

event clicked;uo_1.of_SetText(il_open, sle_1.Text)
uo_2.of_SetText(il_open, sle_1.Text)
uo_3.of_SetText(il_open, sle_1.Text)
uo_4.of_SetText(il_open, sle_1.Text)
end event

type sle_1 from singlelineedit within u_cst_toolbartest
integer x = 402
integer y = 1416
integer width = 402
integer height = 80
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

type cbx_5 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 1164
integer width = 818
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Text on Open Button"
end type

event clicked;uo_1.of_DisplayText(il_open, Checked)
uo_2.of_DisplayText(il_open, Checked)
uo_3.of_DisplayText(il_open, Checked)	
uo_4.of_DisplayText(il_open, Checked)	
end event

type cbx_4 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 1064
integer width = 416
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Toggle Open"
end type

event clicked;uo_1.of_Toggle(il_open)
uo_2.of_Toggle(il_open)
uo_3.of_Toggle(il_open)
uo_4.of_Toggle(il_open)

end event

type em_1 from editmask within u_cst_toolbartest
integer x = 1083
integer y = 12
integer width = 338
integer height = 80
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "######"
end type

type dw_2 from datawindow within u_cst_toolbartest
integer x = 270
integer y = 284
integer width = 3369
integer height = 352
integer taborder = 20
string title = "none"
string dataobject = "d_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_2.SelectRow(0,FALSE)
end event

event constructor;SelectRow(1,TRUE)
em_1.Text = '1'
end event

event rowfocuschanged;em_1.Text = String(CurrentRow)
end event

type cbx_3 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 964
integer width = 878
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enable Save Button"
boolean checked = true
end type

event clicked;uo_1.of_SetEnabled('save',Checked)
uo_2.of_SetEnabled('save',Checked)
uo_3.of_SetEnabled('save',Checked)
end event

type cbx_2 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 864
integer width = 878
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Toolbar Strip Border"
end type

event clicked;uo_1.of_DisplayBorder(Checked)
uo_2.of_DisplayBorder(Checked)
uo_3.of_DisplayBorder(Checked)
uo_4.of_DisplayBorder(Checked)
end event

type cbx_1 from checkbox within u_cst_toolbartest
integer x = 398
integer y = 764
integer width = 841
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display Text in Toolbar Strip"
end type

event clicked;uo_1.of_DisplayText(Checked)
uo_2.of_DisplayText(Checked)
uo_3.of_DisplayText(Checked)
uo_4.of_DisplayText(Checked)
end event

type uo_1 from u_cst_toolbarstrip within u_cst_toolbartest
event destroy ( )
integer x = 5
integer y = 4
integer width = 3634
integer taborder = 10
boolean ib_displayborder = false
end type

on uo_1.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;String ls_file

SetNull(ls_file)

CHOOSE CASE Upper(as_button)
	CASE 'SAVE'
		dw_2.SaveAs()
	CASE 'OPEN'
		dw_2.ImportFile(ls_file)
	CASE 'PRINT'
		dw_2.Print()
	CASE 'PREVIEW'
		ib_preview = NOT ib_preview
		IF ib_preview THEN
			dw_2.Modify('Datawindow.Print.Preview=yes')
		ELSE
			dw_2.Modify('Datawindow.Print.Preview=no')
		END IF
	CASE 'CUT'
		dw_2.Cut()
	CASE 'COPY'
		dw_2.Copy()
	CASE 'PASTE'
		dw_2.Paste()

	CASE 'PRIOR ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() - 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'FIRST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(1)
		dw_2.SelectRow(1, TRUE)
		dw_2.ScrollToRow(1)
	CASE 'NEXT ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.GetRow() + 1)
		dw_2.SelectRow(dw_2.GetRow(), TRUE)
		dw_2.ScrollToRow(dw_2.GetRow())
	CASE 'LAST ROW'
		dw_2.SelectRow(0,FALSE)
		dw_2.SetRow(dw_2.RowCount())
		dw_2.SelectRow(dw_2.RowCount(), TRUE)
		dw_2.ScrollToRow(dw_2.RowCount())
END CHOOSE
end event

event constructor;call super::constructor;

il_open = uo_1.of_AddItem('Open', 'Open!', 'Open a New Item')
uo_1.of_AddItem('Save', 'Save!', 'Save information to file')
uo_1.of_AddSeparator()
uo_1.of_AddItem('Print', 'Print!')
uo_1.of_AddItem('Preview', 'Preview!')
uo_1.of_AddSeparator()
uo_1.of_AddItem('Cut','Cut!')
uo_1.of_AddItem('Copy','Copy!')
uo_1.of_AddItem('Paste','Paste!')
uo_1.of_AddSeparator()
uo_1.of_AddItem('First Row', 'VCRFirst!')
uo_1.of_AddItem('Prior Row', 'VCRPrior!')
uo_1.of_AddObject('', em_1)
uo_1.of_AddItem('Next Row', 'VCRNext!')
uo_1.of_AddItem('Last Row', 'VCRLast!')

uo_1.of_AddItem('Exit', 'Exit!', uo_1.RIGHT)
uo_1.of_AddSeparator(uo_1.RIGHT)
uo_1.of_AddItem('Help', 'Help!', uo_1.RIGHT)


//uo_1.of_AddItem('Exit', 'Exit!', 'Exit Window', uo_1.RIGHT)
//uo_1.of_AddSeparator(uo_1.RIGHT)
//uo_1.of_AddItem('Help', 'Help!', 'Display Help',uo_1.RIGHT)


end event

type gb_1 from groupbox within u_cst_toolbartest
integer x = 393
integer y = 1544
integer width = 1161
integer height = 360
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Style"
end type

