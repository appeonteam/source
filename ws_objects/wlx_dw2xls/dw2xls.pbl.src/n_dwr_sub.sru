$PBExportHeader$n_dwr_sub.sru
forward
global type n_dwr_sub from nonvisualobject
end type
end forward

global type n_dwr_sub from nonvisualobject
end type
global n_dwr_sub n_dwr_sub

type prototypes
FUNCTION ulong GetDC(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong GetDeviceCaps(ulong hdc,ulong nIndex) LIBRARY "gdi32.dll"
FUNCTION ulong GetTempPath(ulong nBufferLength,ref string lpBuffer) LIBRARY "kernel32.dll" ALIAS FOR "GetTempPathA;Ansi"
FUNCTION ulong ReleaseDC(ulong hwnd,ulong hdc) LIBRARY "user32.dll"
end prototypes

type variables
PUBLIC DOUBLE id_x_coef_0 = 32
PUBLIC DOUBLE id_x_coef_1
PUBLIC DOUBLE id_x_coef_2
PUBLIC DOUBLE id_x_coef_3
PUBLIC DOUBLE id_cur_x_coef
PUBLIC DOUBLE id_y_coef_0 = 5.1
PUBLIC DOUBLE id_y_coef_1
PUBLIC DOUBLE id_y_coef_2
PUBLIC DOUBLE id_y_coef_3
PUBLIC DOUBLE id_cur_y_coef
end variables

forward prototypes
public function string of_gettemppath ()
public function double of_get_coef_x (integer a_units)
public subroutine of_set_cur_units (integer ai_units)
public function double of_get_cur_coef_x ()
public function double of_get_coef_y (integer a_units)
public function double of_get_cur_coef_y ()
public function double of_get_conv_x ()
public function double of_get_conv_y ()
end prototypes

public function string of_gettemppath ();string ls_path
ulong ls_len
ulong ls_buff_size = 200
ls_path = space(ls_buff_size)
ls_len = gettemppath(ls_buff_size, ls_path)
if ls_len > 0 then
    return ""
else
    return ""
end if
end function

public function double of_get_coef_x (integer a_units);choose case a_units
    case 0
        return id_x_coef_0
    case 1
        return id_x_coef_1
    case 2
        return id_x_coef_2
    case 3
        return id_x_coef_3
    case else
        return id_x_coef_0
end choose
end function

public subroutine of_set_cur_units (integer ai_units);id_cur_x_coef = of_get_coef_x(ai_units)
id_cur_y_coef = of_get_coef_y(ai_units)
end subroutine

public function double of_get_cur_coef_x ();return id_cur_x_coef
end function

public function double of_get_coef_y (integer a_units);choose case a_units
    case 0
        return id_y_coef_0
    case 1
        return id_y_coef_1
    case 2
        return id_y_coef_2
    case 3
        return id_y_coef_3
    case else
        return id_y_coef_0
end choose
end function

public function double of_get_cur_coef_y ();return id_cur_y_coef
end function

public function double of_get_conv_x ();return of_get_cur_coef_x() / of_get_coef_x(0)
end function

public function double of_get_conv_y ();return of_get_coef_y(0) / of_get_cur_coef_y()
end function

on n_dwr_sub.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_sub.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

