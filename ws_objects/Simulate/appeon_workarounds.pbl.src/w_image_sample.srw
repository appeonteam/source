$PBExportHeader$w_image_sample.srw
forward
global type w_image_sample from window
end type
type p_12 from picture within w_image_sample
end type
type p_11 from picture within w_image_sample
end type
type p_10 from picture within w_image_sample
end type
type p_9 from picture within w_image_sample
end type
type p_8 from picture within w_image_sample
end type
type p_7 from picture within w_image_sample
end type
type p_6 from picture within w_image_sample
end type
type p_5 from picture within w_image_sample
end type
type p_4 from picture within w_image_sample
end type
type p_3 from picture within w_image_sample
end type
type p_2 from picture within w_image_sample
end type
type p_1 from picture within w_image_sample
end type
type cb_1 from commandbutton within w_image_sample
end type
end forward

global type w_image_sample from window
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
p_12 p_12
p_11 p_11
p_10 p_10
p_9 p_9
p_8 p_8
p_7 p_7
p_6 p_6
p_5 p_5
p_4 p_4
p_3 p_3
p_2 p_2
p_1 p_1
cb_1 cb_1
end type
global w_image_sample w_image_sample

forward prototypes
public subroutine wf_syntax (datawindow as_dw)
end prototypes

public subroutine wf_syntax (datawindow as_dw);
end subroutine

on w_image_sample.create
this.p_12=create p_12
this.p_11=create p_11
this.p_10=create p_10
this.p_9=create p_9
this.p_8=create p_8
this.p_7=create p_7
this.p_6=create p_6
this.p_5=create p_5
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.p_1=create p_1
this.cb_1=create cb_1
this.Control[]={this.p_12,&
this.p_11,&
this.p_10,&
this.p_9,&
this.p_8,&
this.p_7,&
this.p_6,&
this.p_5,&
this.p_4,&
this.p_3,&
this.p_2,&
this.p_1,&
this.cb_1}
end on

on w_image_sample.destroy
destroy(this.p_12)
destroy(this.p_11)
destroy(this.p_10)
destroy(this.p_9)
destroy(this.p_8)
destroy(this.p_7)
destroy(this.p_6)
destroy(this.p_5)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.cb_1)
end on

type p_12 from picture within w_image_sample
integer x = 1486
integer y = 1452
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_11 from picture within w_image_sample
integer x = 1486
integer y = 1028
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_10 from picture within w_image_sample
integer x = 1486
integer y = 612
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_9 from picture within w_image_sample
integer x = 754
integer y = 612
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_8 from picture within w_image_sample
integer x = 754
integer y = 1028
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_7 from picture within w_image_sample
integer x = 754
integer y = 1452
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_6 from picture within w_image_sample
integer x = 23
integer y = 1452
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_5 from picture within w_image_sample
integer x = 23
integer y = 1028
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_4 from picture within w_image_sample
integer x = 23
integer y = 612
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_3 from picture within w_image_sample
integer x = 1477
integer y = 192
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_2 from picture within w_image_sample
integer x = 754
integer y = 192
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type p_1 from picture within w_image_sample
integer x = 23
integer y = 192
integer width = 686
integer height = 400
string picturename = "..\sytanx_sample\img\20080000_8268.jpg"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_image_sample
integer x = 1701
integer y = 40
integer width = 462
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "image change"
end type

event clicked;p_1.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_2.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_3.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_4.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_5.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_6.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_7.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_8.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_9.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_10.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_11.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"
p_12.PictureName = "..\sytanx_sample\img\20080000_8268-00.jpg"

end event

