$PBExportHeader$u_cst_mle.sru
forward
global type u_cst_mle from userobject
end type
type mle_1 from multilineedit within u_cst_mle
end type
end forward

global type u_cst_mle from userobject
integer width = 1815
integer height = 408
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
mle_1 mle_1
end type
global u_cst_mle u_cst_mle

event resize;mle_1.Resize(Width, Height)
end event

on u_cst_mle.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on u_cst_mle.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within u_cst_mle
integer width = 1810
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
end type

