$PBExportHeader$u_cst_progres_bar.sru
forward
global type u_cst_progres_bar from UserObject
end type
type st_proc from statictext within u_cst_progres_bar
end type
type r_bar from rectangle within u_cst_progres_bar
end type
end forward

global type u_cst_progres_bar from UserObject
int Width=1628
int Height=93
boolean Border=true
long BackColor=15793151
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=16777215
st_proc st_proc
r_bar r_bar
end type
global u_cst_progres_bar u_cst_progres_bar

type variables
long count
long position
long pr = 3
end variables

forward prototypes
public subroutine set_count (long a_count)
public subroutine set_position (long a_pozition)
end prototypes

public subroutine set_count (long a_count);count = a_count
r_bar.width = 1
st_proc.text = '0.00'

end subroutine

public subroutine set_position (long a_pozition);long BarWidth
if count = 0 then return
if count = a_pozition then st_proc.text = '100.00'
BarWidth = this.width - st_proc.width - 2 * pr 
if long(BarWidth* (position/count)) <> long(BarWidth*(a_pozition/count)) then
	r_bar.width = long(BarWidth * (a_pozition/count))
	st_proc.text = string(round(((a_pozition/count)*100),2))
end if
position = a_pozition


end subroutine

event constructor;

r_bar.x = pr + st_proc.width
r_bar.y = pr 

r_bar.height = this.height - 2  - (pr * 2) 
r_bar.width = 0


end event

on u_cst_progres_bar.create
this.st_proc=create st_proc
this.r_bar=create r_bar
this.Control[]={ this.st_proc,&
this.r_bar}
end on

on u_cst_progres_bar.destroy
destroy(this.st_proc)
destroy(this.r_bar)
end on

type st_proc from statictext within u_cst_progres_bar
int Width=183
int Height=97
boolean Enabled=false
string Text="0,00"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65535
long BackColor=0
int TextSize=-11
int Weight=400
string FaceName="Times New Roman CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Roman!
FontPitch FontPitch=Variable!
end type

type r_bar from rectangle within u_cst_progres_bar
int X=183
int Width=202
int Height=85
boolean Enabled=false
LineStyle LineStyle=transparent!
int LineThickness=5
long LineColor=65535
long FillColor=16711680
end type

