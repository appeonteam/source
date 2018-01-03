$PBExportHeader$w_testfailedblob.srw
forward
global type w_testfailedblob from window
end type
type dw_3 from datawindow within w_testfailedblob
end type
type dw_2 from datawindow within w_testfailedblob
end type
type mle_1 from multilineedit within w_testfailedblob
end type
type dw_1 from datawindow within w_testfailedblob
end type
end forward

global type w_testfailedblob from window
integer width = 5230
integer height = 1648
boolean titlebar = true
string title = "Table BLOB : Retrieve Flaw "
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_3 dw_3
dw_2 dw_2
mle_1 mle_1
dw_1 dw_1
end type
global w_testfailedblob w_testfailedblob

on w_testfailedblob.create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.mle_1=create mle_1
this.dw_1=create dw_1
this.Control[]={this.dw_3,&
this.dw_2,&
this.mle_1,&
this.dw_1}
end on

on w_testfailedblob.destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.mle_1)
destroy(this.dw_1)
end on

event open;environment le
getenvironment(le)
this.title =+ 'PB Ver: ' + string(le.pbmajorrevision) +'.' + string(le.pbminorrevision) +'.' + string(le.pbfixesrevision) +'.' +  string(le.pbbuildnumber)
//dw_3.settransobject(sqlca)
//dw_3.retrieve( )

dw_1.settransobject(sqlca)
dw_1.retrieve( )

//dw_2.settransobject(sqlca)
//dw_2.retrieve( )
end event

type dw_3 from datawindow within w_testfailedblob
integer x = 2199
integer y = 76
integer width = 686
integer height = 1388
integer taborder = 30
string title = "none"
string dataobject = "d_signatures"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_testfailedblob
integer x = 59
integer y = 624
integer width = 2021
integer height = 852
integer taborder = 30
string title = "none"
string dataobject = "d_test_noblob"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;mle_1.text+='SQLERROR: ' + string (sqldbcode) + ' ' + sqlerrtext 
return 1
end event

event retrieveend;MLE_1.text+='No BLOB Rows Retrieved: ' + string(rowcount)+ '~r~n'
end event

type mle_1 from multilineedit within w_testfailedblob
integer x = 3054
integer y = 44
integer width = 1751
integer height = 1456
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_testfailedblob
integer x = 73
integer y = 44
integer width = 1952
integer height = 532
integer taborder = 10
string title = "none"
string dataobject = "d_test_with_blob"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;mle_1.text+='SQLERROR: ' + string (sqldbcode) + ' ' + sqlerrtext 
return 1
end event

event sqlpreview;mle_1.text += sqlsyntax + '~r~n'
end event

event retrieveend;MLE_1.text+='With BLOB Rows Retrieved: ' + string(rowcount) + '~r~n'
end event

