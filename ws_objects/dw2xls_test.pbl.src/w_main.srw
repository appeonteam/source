$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3378
integer height = 2012
boolean titlebar = true
string title = "dw2xls"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_main w_main

on w_main.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_main.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;//123 456
end event

type cb_4 from commandbutton within w_main
integer x = 2437
integer y = 1752
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Xls"
end type

event clicked;oleobject lo_obj
long ll_return

lo_obj = create oleobject

ll_return = lo_obj.connecttoobject('',"excel.application")
if ll_return <> 0 then
	ll_return = lo_obj.connecttonewobject( "Excel.Application")
end if

if ll_return <> 0 then
	messagebox("Error",ll_return)
	return 
end if

lo_obj.application.workbooks.add
lo_obj.application.worksheets.add

lo_obj.ActiveSheet.name = "Test New XLS"

lo_obj.ActiveSheet.Range("A1:D1").MergeCells = True

lo_obj.ActiveSheet.Cells(1,1).font.size = 18
lo_obj.ActiveSheet.Cells(1,1).font.bold = true
lo_obj.ActiveSheet.Cells(1,1).font.Italic = true
//lo_obj.ActiveSheet.Cells(1,1).font.colorindex = 3
lo_obj.ActiveSheet.Cells(1,1).font.color = rgb(123,125,125)
lo_obj.activesheet.Range("A1:D1").Interior.color = 255
lo_obj.activesheet.rows(2).Interior.color = rgb(127,0,127)
lo_obj.activesheet.Cells(2,1).value = "First Data"
lo_obj.ActiveSheet.Cells(1,1).value = "新建一列"
lo_obj.ActiveSheet.Columns(1).columnwidth = 20
lo_obj.Activeworkbook.saveas("d:\new.xlsx")
lo_obj.quit
lo_obj.disconnectobject( )

end event

type cb_3 from commandbutton within w_main
integer x = 1792
integer y = 1756
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "xls"
end type

event clicked;oleobject  lo_obj

long ll_return
lo_obj = create oleobject


ll_return = lo_obj.connecttoobject('',"excel.application")

if ll_return <> 0 then
	ll_return = lo_obj.connecttonewobject( "Excel.Application")
end if

if ll_return <> 0 then
	messagebox("Error",ll_return)
	return 
end if

lo_obj.workbooks.open("d:\test2.xls")

lo_obj.ActiveWorkBook.sheets('sheet2').select

lo_obj.activesheet.name = 'Testin'

lo_obj.activesheet.range("A2:C2").mergecells = true

lo_obj.cells(2,1).value = 'Value1t'

lo_obj.activeworkbook.saved = true//假保存

//lo_obj.caption = "Test in PowerBuilder"



lo_obj.activeworkbook.saveas("d:\test1.xls")

lo_obj.quit//exit
end event

type cb_2 from commandbutton within w_main
integer x = 987
integer y = 1756
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dw2xls"
end type

event clicked;f_dw_save_as_xls_ole(dw_1, "d:\test2.xls")
end event

type cb_1 from commandbutton within w_main
integer x = 251
integer y = 1764
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dw2xls"
end type

event clicked;uf_dw_as_excel(dw_1, "d:\test.xls")
//111
end event

type dw_1 from datawindow within w_main
integer width = 3323
integer height = 1732
integer taborder = 10
string title = "none"
string dataobject = "d_dwexample_group"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve( )
end event

