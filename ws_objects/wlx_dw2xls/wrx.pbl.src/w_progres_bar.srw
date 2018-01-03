$PBExportHeader$w_progres_bar.srw
$PBExportComments$окно отображения полоски выполнения процеса
forward
global type w_progres_bar from Window
end type
type progres_bar_1 from u_cst_progres_bar within w_progres_bar
end type
end forward

global type w_progres_bar from Window
int X=1
int Y=1
int Width=1665
int Height=233
boolean TitleBar=true
long BackColor=82042848
WindowType WindowType=popup!
progres_bar_1 progres_bar_1
end type
global w_progres_bar w_progres_bar

type variables

end variables

forward prototypes
public subroutine set_count (long a_count)
public subroutine set_etap (string s_etap)
public subroutine set_position (long a_pos)
end prototypes

public subroutine set_count (long a_count);progres_bar_1.set_count(a_count)
end subroutine

public subroutine set_etap (string s_etap);this.Title = s_etap
end subroutine

public subroutine set_position (long a_pos);progres_bar_1.set_position(a_pos)

end subroutine

on w_progres_bar.create
this.progres_bar_1=create progres_bar_1
this.Control[]={ this.progres_bar_1}
end on

on w_progres_bar.destroy
destroy(this.progres_bar_1)
end on

event open;Environment env

GetEnvironment(env)
This.X = Max(PixelsToUnits(env.ScreenWidth, XPixelsToUnits!) - This.Width, 1) / 2
This.Y = Max(PixelsToUnits(env.ScreenHeight, YPixelsToUnits!) - This.Height, 1) / 2

end event

type progres_bar_1 from u_cst_progres_bar within w_progres_bar
int X=23
int Y=17
int Width=1601
int TabOrder=2
end type

on progres_bar_1.destroy
call u_cst_progres_bar::destroy
end on

