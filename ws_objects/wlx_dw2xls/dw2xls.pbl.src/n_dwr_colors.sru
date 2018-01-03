$PBExportHeader$n_dwr_colors.sru
forward
global type n_dwr_colors from n_associated_ulong_srv
end type
end forward

global type n_dwr_colors from n_associated_ulong_srv
end type
global n_dwr_colors n_dwr_colors

type prototypes
FUNCTION ulong GetDC(ulong hwnd) LIBRARY "user32.dll"
FUNCTION ulong GetSysColor(ulong nIndex) LIBRARY "user32.dll"
FUNCTION ulong GetDeviceCaps(ulong hdc,ulong nIndex) LIBRARY "gdi32.dll"
end prototypes

type variables
Public n_xls_workbook invo_writer
Public Long color_scrollbar
Public Long color_background = 1
Public Long color_activecaption = 2
Public Long color_inactivecaption = 3
Public Long color_menu = 4
Public Long color_window = 5
Public Long color_windowframe = 6
Public Long color_menutext = 7
Public Long color_windowtext = 8
Public Long color_captiontext = 9
Public Long color_activeborder = 10
Public Long color_inactiveborder = 11
Public Long color_appworkspace = 12
Public Long color_highlight = 13
Public Long color_highlighttext = 14
Public Long color_btnface = 15
Public Long color_btnshadow = 16
Public Long color_graytext = 17
Public Long color_btntext = 18
Public Long color_inactivecaptiontext = 19
Public Long color_btnhighlight = 20
Public Long color_3ddkshadow = 21
Public Long color_3dlight = 22
Public Long color_infotext = 23
Public Long color_infobk = 24
Public Long color_hotlight = 26
Public Long color_gradientactivecaption = 27
Public Long color_gradientinactivecaption = 28
Public ULong cldelta = 2147483648
Public ULong clscrollbar = 2147483648
Public ULong clbackground = 2147483649
Public ULong clactivecaption = 2147483650
Public ULong clinactivecaption = 2147483651
Public ULong clmenu = 2147483652
Public ULong clwindow = 2147483653
Public ULong clwindowframe = 2147483654
Public ULong clmenutext = 2147483655
Public ULong clwindowtext = 2147483656
Public ULong clcaptiontext = 2147483657
Public ULong clactiveborder = 2147483658
Public ULong clinactiveborder = 2147483659
Public ULong clappworkspace = 2147483660
Public ULong clhighlight = 2147483661
Public ULong clhighlighttext = 2147483662
Public ULong clbtnface = 2147483663
Public ULong clbtnshadow = 2147483664
Public ULong clgraytext = 2147483665
Public ULong clbtntext = 2147483666
Public ULong clinactivecaptiontext = 2147483667
Public ULong clbtnhighlight = 2147483668
Public ULong cl3ddkshadow = 2147483669
Public ULong cl3dlight = 2147483670
Public ULong clinfotext = 2147483671
Public ULong clinfobk = 2147483672
Public Integer ii_bitsperpixel = 4

end variables

forward prototypes
public function long of_get_color (long al_color)
public function integer of_get_custom_color_index (long al_color)
end prototypes

public function long of_get_color (long al_color);Long ll_mask = 16777216
Long ll_col
If al_color > ll_mask Then
	ll_col = Truncate(al_color / 16777216, 0)
	Choose Case ll_col
		Case 2
			al_color = clwindowtext
		Case 4
			al_color = clbtnface
		Case 16
			al_color = clappworkspace
		Case 64
			al_color = clwindow
	End Choose
End If
If al_color >= cldelta Then
	Return getsyscolor(al_color - cldelta)
Else
	Return al_color
End If

end function

public function integer of_get_custom_color_index (long al_color);ULong ll_index
Integer li_red
Integer li_green
Integer li_blue
If Truncate(al_color / 16777216, 0) = 64 Then
	Return 65
End If
ll_index = of_find_key(al_color)
If ll_index > 0 Then
	Return 64 - Integer(ll_index)
ElseIf of_get_keys_count() > 63 - 8 Then
	Return -1
Else
	ll_index = of_add_key(al_color)
	li_red   = Mod(al_color, 256)
	li_green = Mod(Truncate(al_color / 256, 0), 256)
	li_blue  = Mod(Truncate(al_color / (256 * 256), 0), 256)
	invo_writer.of_set_custom_color(64 - Integer(ll_index), li_red, li_green, li_blue)
	Return 64 - Integer(ll_index)
End If

end function

on n_dwr_colors.create
call super::create
end on

on n_dwr_colors.destroy
call super::destroy
end on

