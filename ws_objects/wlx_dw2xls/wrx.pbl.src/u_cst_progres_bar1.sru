$PBExportHeader$u_cst_progres_bar1.sru
forward
global type u_cst_progres_bar1 from UserObject
end type
type st_proc from statictext within u_cst_progres_bar1
end type
end forward

global type u_cst_progres_bar1 from UserObject
int Width=1628
int Height=93
boolean Border=true
long BackColor=15793151
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=16777215
st_proc st_proc
end type
global u_cst_progres_bar1 u_cst_progres_bar1

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
st_proc.width = 183
st_proc.text = '0.00'

end subroutine

public subroutine set_position (long a_pozition);long BarWidth
if count = 0 then return
if count = a_pozition then st_proc.text = '100.00'
BarWidth = ( this.width -  2 * pr ) - 183
if long(BarWidth* (position/count)) <> long(BarWidth*(a_pozition/count)) then
	st_proc.width =183 +  long(BarWidth * (a_pozition/count))
	st_proc.text = string(round(((a_pozition/count)*100),2))
end if
position = a_pozition


end subroutine

event constructor;

//r_bar.x = pr + st_proc.width
//r_bar.y = pr 
//
//r_bar.height = this.height - 2  - (pr * 2) 
//r_bar.width = 0


end event

on u_cst_progres_bar1.create
this.st_proc=create st_proc
this.Control[]={ this.st_proc}
end on

on u_cst_progres_bar1.destroy
destroy(this.st_proc)
end on

type st_proc from statictext within u_cst_progres_bar1
int Width=183
int Height=97
boolean Enabled=false
string Text="0.00"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=65535
long BackColor=0
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

