$PBExportHeader$w_calc_time.srw
$PBExportComments$окно рассчета времени выполнение процеса
forward
global type w_calc_time from Window
end type
type uo_1 from u_cst_progres_bar1 within w_calc_time
end type
type st_ost_time from statictext within w_calc_time
end type
type st_4 from statictext within w_calc_time
end type
type st_real_time from statictext within w_calc_time
end type
type st_3 from statictext within w_calc_time
end type
type st_2 from statictext within w_calc_time
end type
type st_calc_time from statictext within w_calc_time
end type
end forward

global type w_calc_time from Window
int X=833
int Y=361
int Width=1038
int Height=513
boolean TitleBar=true
string Title="Розрахунок часу"
long BackColor=82042848
boolean ControlMenu=true
boolean MinBox=true
WindowType WindowType=popup!
uo_1 uo_1
st_ost_time st_ost_time
st_4 st_4
st_real_time st_real_time
st_3 st_3
st_2 st_2
st_calc_time st_calc_time
end type
global w_calc_time w_calc_time

type variables
double StartTime 		// начало 
double RealTime 		// реальное время 
double CalcTime 		// рассчетное время 
double OstTime 		// осталось времени 

double Count 		// общее количество
double Position 		// текущая позиция


end variables

forward prototypes
public subroutine set_count (double aval)
public subroutine set_position (double aval)
public function double get_curr_time_as_doudle ()
public function string get_time_as_str (double aval)
end prototypes

public subroutine set_count (double aval);count = aVal 

uo_1.set_count ( aVal )
end subroutine

public subroutine set_position (double aval);
if position = -1 then starttime = this.get_curr_time_as_doudle ( )

position = aVal

realtime = this.get_curr_time_as_doudle ( ) - starttime //реальное время выполнения операции

calctime = (realtime * count) / position //расчетное время выполнения операции

osttime = calctime - realtime // осталось времени до конца выполнения операции

st_calc_time.text = this.get_time_as_str ( calctime )

st_real_time.text = this.get_time_as_str ( realtime )

st_ost_time.text = this.get_time_as_str ( osttime )

uo_1.set_position ( position )

end subroutine

public function double get_curr_time_as_doudle ();
double count_sec
double tch, tcm, tcs

tch = hour(now())
tcm = minute(now())
tcs = second(now())

count_sec = tcs + (tcm * 60) + (tch * 60)

return count_sec
end function

public function string get_time_as_str (double aval);string rs
long s, m, h
string sh, sm, ss

h = truncate(aVal/3600,0)

m = truncate((aVal - (h * 3600))/60,0) 

s = aVal - (h * 3600) - (m * 60)

sh = right('0' + string(h),2)
sm = right('0' + string(m),2)
ss = right('0' + string(s),2)

rs = sh + ':' + sm + ':' + ss

//if h < 0 or m < 0 or s < 0 then 
//	devmsg('====================')
//	devmsg('aVal= ' + string(aVal))
//	devmsg('sh= ' + string(sh) )
//	devmsg('sm= ' + string(sm) )
//	devmsg('ss= ' + string(ss) )
//	
//end if

return rs
end function

on w_calc_time.create
this.uo_1=create uo_1
this.st_ost_time=create st_ost_time
this.st_4=create st_4
this.st_real_time=create st_real_time
this.st_3=create st_3
this.st_2=create st_2
this.st_calc_time=create st_calc_time
this.Control[]={ this.uo_1,&
this.st_ost_time,&
this.st_4,&
this.st_real_time,&
this.st_3,&
this.st_2,&
this.st_calc_time}
end on

on w_calc_time.destroy
destroy(this.uo_1)
destroy(this.st_ost_time)
destroy(this.st_4)
destroy(this.st_real_time)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_calc_time)
end on

event open;count = -1
position = -1

Environment env

GetEnvironment(env)

This.X = Max(PixelsToUnits(env.ScreenWidth, XPixelsToUnits!) - This.Width, 1) / 2
This.Y = Max(PixelsToUnits(env.ScreenHeight, YPixelsToUnits!) - This.Height, 1) / 2
end event

type uo_1 from u_cst_progres_bar1 within w_calc_time
int X=10
int Y=285
int Width=997
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
end type

on uo_1.destroy
call u_cst_progres_bar1::destroy
end on

type st_ost_time from statictext within w_calc_time
int X=618
int Y=185
int Width=385
int Height=85
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="00:00:00"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65280
long BackColor=0
int TextSize=-11
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_4 from statictext within w_calc_time
int X=19
int Y=169
int Width=590
int Height=81
boolean Enabled=false
string Text="Залишилось"
boolean FocusRectangle=false
long BackColor=82042848
long BorderColor=10789024
int TextSize=-12
int Weight=400
string FaceName="Times New Roman CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Roman!
FontPitch FontPitch=Variable!
end type

type st_real_time from statictext within w_calc_time
int X=618
int Y=97
int Width=385
int Height=85
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="00:00:00"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65280
long BackColor=0
int TextSize=-11
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_calc_time
int X=19
int Y=97
int Width=590
int Height=81
boolean Enabled=false
string Text="Реальний час"
boolean FocusRectangle=false
long BackColor=82042848
long BorderColor=8421376
int TextSize=-12
int Weight=400
string FaceName="Times New Roman CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Roman!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_calc_time
int X=19
int Y=9
int Width=595
int Height=89
boolean Enabled=false
string Text="Розрахунковий час"
boolean FocusRectangle=false
long BackColor=82042848
long BorderColor=10789024
int TextSize=-12
int Weight=400
string FaceName="Times New Roman CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Roman!
FontPitch FontPitch=Variable!
end type

type st_calc_time from statictext within w_calc_time
int X=618
int Y=9
int Width=385
int Height=85
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="00:00:00"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65280
long BackColor=0
int TextSize=-11
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

