$PBExportHeader$w_dwr_service_progress.srw
forward
global type w_dwr_service_progress from window
end type
type uo_bar from uo_dwr_progressbar within w_dwr_service_progress
end type
type st_remain from statictext within w_dwr_service_progress
end type
type cb_cancel from commandbutton within w_dwr_service_progress
end type
end forward

global type w_dwr_service_progress from window
integer x = 1056
integer y = 484
integer width = 1883
integer height = 440
boolean titlebar = true
string title = "保存到Excel中......"
windowtype windowtype = response!
long backcolor = 79741120
event type integer ue_show_progress ( integer ai_progress )
uo_bar uo_bar
st_remain st_remain
cb_cancel cb_cancel
end type
global w_dwr_service_progress w_dwr_service_progress

type variables
public nonvisualobject parm
public datetime idt_start
public datetime idt_last
public n_dwr_datetime invo_dt_srv

end variables

event ue_show_progress;//LONG ll_cur_s
//LONG ll_total_rem_s
//LONG ll_rem_s
//LONG ll_rem_m
//LONG ll_rem_h
//STRING ls_str
//DATETIME ldt_now
uo_bar.setvalue(ai_progress)
return 0
end event

on w_dwr_service_progress.create
this.uo_bar=create uo_bar
this.st_remain=create st_remain
this.cb_cancel=create cb_cancel
this.Control[]={this.uo_bar,&
this.st_remain,&
this.cb_cancel}
end on

on w_dwr_service_progress.destroy
destroy(this.uo_bar)
destroy(this.st_remain)
destroy(this.cb_cancel)
end on

event open;this.title = "保存EXECL"
uo_bar.value=0
uo_bar.minvalue=0
uo_bar.maxvalue=100
uo_bar.stepvalue=10
parm = message.powerobjectparm
idt_start = datetime(today(), now())
idt_last = idt_start
parm.postevent("ue_process_work")


end event

type uo_bar from uo_dwr_progressbar within w_dwr_service_progress
integer x = 41
integer y = 28
integer width = 1774
integer taborder = 10
long backcolor = 80269524
end type

on uo_bar.destroy
call uo_dwr_progressbar::destroy
end on

type st_remain from statictext within w_dwr_service_progress
integer x = 82
integer y = 160
integer width = 1303
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_dwr_service_progress
integer x = 1399
integer y = 184
integer width = 393
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "取消"
boolean default = true
end type

event clicked;parm.triggerevent("ue_cancel")
close(parent)

end event

event constructor;text = "取消(&C)"

end event

