$PBExportHeader$w_nosyntax_sample.srw
forward
global type w_nosyntax_sample from window
end type
type dw_13 from datawindow within w_nosyntax_sample
end type
type dw_12 from datawindow within w_nosyntax_sample
end type
type dw_11 from datawindow within w_nosyntax_sample
end type
type dw_10 from datawindow within w_nosyntax_sample
end type
type dw_9 from datawindow within w_nosyntax_sample
end type
type dw_8 from datawindow within w_nosyntax_sample
end type
type dw_7 from datawindow within w_nosyntax_sample
end type
type dw_6 from datawindow within w_nosyntax_sample
end type
type dw_5 from datawindow within w_nosyntax_sample
end type
type dw_4 from datawindow within w_nosyntax_sample
end type
type dw_3 from datawindow within w_nosyntax_sample
end type
type dw_2 from datawindow within w_nosyntax_sample
end type
type dw_1 from datawindow within w_nosyntax_sample
end type
end forward

global type w_nosyntax_sample from window
integer width = 2258
integer height = 2088
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_13 dw_13
dw_12 dw_12
dw_11 dw_11
dw_10 dw_10
dw_9 dw_9
dw_8 dw_8
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
global w_nosyntax_sample w_nosyntax_sample

on w_nosyntax_sample.create
this.dw_13=create dw_13
this.dw_12=create dw_12
this.dw_11=create dw_11
this.dw_10=create dw_10
this.dw_9=create dw_9
this.dw_8=create dw_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_13,&
this.dw_12,&
this.dw_11,&
this.dw_10,&
this.dw_9,&
this.dw_8,&
this.dw_7,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.dw_1}
end on

on w_nosyntax_sample.destroy
destroy(this.dw_13)
destroy(this.dw_12)
destroy(this.dw_11)
destroy(this.dw_10)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;dw_1.insertrow(0)
dw_2.insertrow(0)
dw_3.insertrow(0)
dw_4.insertrow(0)
dw_5.insertrow(0)
dw_6.insertrow(0)
dw_7.insertrow(0)
dw_8.insertrow(0)
dw_9.insertrow(0)
dw_10.insertrow(0)
dw_11.insertrow(0)
dw_12.insertrow(0)
dw_13.insertrow(0)

end event

type dw_13 from datawindow within w_nosyntax_sample
integer x = 1477
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 120
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_12 from datawindow within w_nosyntax_sample
integer x = 768
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_11 from datawindow within w_nosyntax_sample
integer x = 23
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_10 from datawindow within w_nosyntax_sample
integer x = 1477
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 100
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_9 from datawindow within w_nosyntax_sample
integer x = 768
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 90
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_8 from datawindow within w_nosyntax_sample
integer x = 23
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within w_nosyntax_sample
integer x = 1477
integer y = 612
integer width = 686
integer height = 400
integer taborder = 70
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_nosyntax_sample
integer x = 768
integer y = 612
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_nosyntax_sample
integer x = 23
integer y = 612
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_nosyntax_sample
integer x = 1477
integer y = 192
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_nosyntax_sample
integer x = 768
integer y = 192
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_nosyntax_sample
integer x = 23
integer y = 192
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_nosyntax_sample
integer x = 32
integer y = 40
integer width = 2130
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

