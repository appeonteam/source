$PBExportHeader$u_cst_ribbonmenu.sru
forward
global type u_cst_ribbonmenu from userobject
end type
type uo_menu from u_cst_ribbonmenulist within u_cst_ribbonmenu
end type
type uo_footer from u_canvas within u_cst_ribbonmenu
end type
type uo_header from u_canvas within u_cst_ribbonmenu
end type
type inv_win32 from n_cst_win32 within u_cst_ribbonmenu
end type
end forward

global type u_cst_ribbonmenu from userobject
integer width = 1486
integer height = 860
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event lbuttondown pbm_lbuttondown
uo_menu uo_menu
uo_footer uo_footer
uo_header uo_header
inv_win32 inv_win32
end type
global u_cst_ribbonmenu u_cst_ribbonmenu

type variables
n_cst_tabstrip_painter in_Gradient
n_cst_ui_imagelist inv_imagelist

w_ribbonwindow iw_parent
u_cst_ribboncontainer iuo_container
n_cst_ribbontiming inv_timer

tabstrip ist_tabs[]
Buttons ist_buttons[]
Boolean ib_splitbuttons = FALSE
Boolean ib_captured
Long il_imagelistsmall

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
Long il_CurrentTheme = BLUE


end variables

forward prototypes
public function integer of_setimage (string as_image)
public function integer of_settheme (string as_theme)
private function long of_getcolor (string as_color)
private function integer of_resizecontrols ()
public function integer of_addsplitbutton (string as_text, string as_image)
public function integer of_addsplitbuttonoption (long al_index, string as_text, string as_image, string as_description)
public function integer of_addseperator ()
public function integer of_addseperator (long al_index)
public function integer of_addcommandbutton (string as_text, string as_image, string as_command)
public function integer of_setparent (window aw_parent)
public function integer of_setcontainer (u_cst_ribboncontainer auo_container)
public function integer of_hide ()
public function integer of_show ()
end prototypes

event lbuttondown;
inv_timer.Stop()
inv_win32.ReleaseCapture()
ib_captured = FALSE
THIS.Hide()

end event

public function integer of_setimage (string as_image);ist_tabs[1].al_pic_index = inv_imagelist.of_AddImage(as_image)
il_imagelistsmall = inv_imagelist.of_GetSmallHandle()

RETURN 1
end function

public function integer of_settheme (string as_theme);CHOOSE CASE Upper(as_theme)
	CASE 'BLUE'
		il_CurrentTheme = BLUE
	CASE 'SILVER'
		il_CurrentTheme = SILVER
	CASE 'OLIVE'
		il_CurrentTheme = OLIVE
	CASE ELSE
		il_CurrentTheme = CLASSIC
END CHOOSE

RETURN 1
end function

private function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "BORDER"
		ll_color = RGB(171,184,201)
	CASE "HEADER1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(247,251,255)
			CASE SILVER
				ll_color = RGB(243,244,250)
			CASE OLIVE
				ll_color = RGB(244,247,222)
			CASE CLASSIC
				ll_color = RGB(245,244,242)
		END CHOOSE
		
	CASE "HEADER2"
		
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(228,239,251)
			CASE SILVER
				ll_color = RGB(243,244,250)
			CASE OLIVE
				ll_color = RGB(244,247,222)
			CASE CLASSIC
				ll_color = RGB(245,244,242)
//			CASE SILVER
//				ll_color = RGB(201,201,218)
//			CASE OLIVE
//				ll_color = RGB(213,222,183)
//			CASE CLASSIC
//				ll_color = RGB(230,228,223)
		END CHOOSE
	CASE "FOOTER1"
		
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(249,252,255)
			CASE SILVER
				ll_color = RGB(243,244,250)
			CASE OLIVE
				ll_color = RGB(244,247,222)
			CASE CLASSIC
				ll_color = RGB(245,244,242)
		END CHOOSE
	CASE "FOOTER2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(226,235,249)
			CASE SILVER
				ll_color = RGB(243,244,250)
			CASE OLIVE
				ll_color = RGB(244,247,222)
			CASE CLASSIC
				ll_color = RGB(245,244,242)
		END CHOOSE
	CASE "PROGRAMTABBORDER"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(65,106,189)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
		END CHOOSE
	CASE "PROGRAMTABHOVERBORDER"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(65,106,189)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
		END CHOOSE
	CASE "PROGRAMTABHOVER"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(129,169,226)
			CASE SILVER
				ll_color = RGB(177,179,200)
			CASE OLIVE
				ll_color = RGB(165,189,132)
			CASE CLASSIC
				ll_color = RGB(177,179,200)
		END CHOOSE
	CASE "PROGRAMTABBACKCOLOR1"
	
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(221,236,254)
			CASE SILVER
				ll_color = RGB(243,244,250)
			CASE OLIVE
				ll_color = RGB(244,247,222)
			CASE CLASSIC
				ll_color = RGB(245,244,242)
		END CHOOSE
		
	CASE "PROGRAMTABBACKCOLOR2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(129,169,226)
			CASE SILVER
				ll_color = RGB(177,179,200)
			CASE OLIVE
				ll_color = RGB(165,189,132)
			CASE CLASSIC
				ll_color = RGB(177,179,200)
		END CHOOSE
END CHOOSE

RETURN ll_color
end function

private function integer of_resizecontrols ();Long ll_width

IF ib_splitbuttons THEN
	ll_width = 520
ELSE
	ll_width = 220
END IF

uo_menu.Height = uo_menu.of_GetTotalHeight()

THIS.Width = PixelsToUnits(ll_width, XPixelsToUnits!)
uo_header.Resize(THIS.Width, PixelsToUnits(22, YPixelsToUnits!))
uo_footer.Resize(THIS.Width, PixelsToUnits(16, YPixelsToUnits!))
uo_menu.Width = PixelsToUnits(220, XPixelsToUnits!)

uo_menu.Y = uo_header.Height - PixelsToUnits(1, YPixelsToUnits!)
uo_footer.Y = uo_menu.Y + uo_menu.Height - PixelsToUnits(2, YPixelsToUnits!)

THIS.Height = uo_footer.Y + uo_footer.Height


in_Gradient.il_adjustment = 2

RETURN 1
end function

public function integer of_addsplitbutton (string as_text, string as_image);

RETURN 1
end function

public function integer of_addsplitbuttonoption (long al_index, string as_text, string as_image, string as_description);

RETURN 1
end function

public function integer of_addseperator ();uo_menu.of_AddLine()
of_ResizeControls()
RETURN 1
end function

public function integer of_addseperator (long al_index);RETURN 1
end function

public function integer of_addcommandbutton (string as_text, string as_image, string as_command);uo_menu.of_AddItem(as_text, as_image, as_command)
of_ResizeControls()
RETURN 1
end function

public function integer of_setparent (window aw_parent);iw_parent = aw_parent
RETURN 1
end function

public function integer of_setcontainer (u_cst_ribboncontainer auo_container);iuo_container = auo_container
RETURN 1
end function

public function integer of_hide ();
POINT lp
ulong ll
ulong lul

lul = Handle(this)

inv_win32.GetCursorPos(lp)
inv_win32.Screentoclient(lul, lp)

IF lp.px < UnitsToPixels(this.X, XUnitsToPixels!) OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
	lp.py < UnitsToPixels(this.Y, YUnitsToPixels!) OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN

	inv_win32.SetCapture(lul)
	ib_captured = TRUE
ELSE
	IF ib_captured THEN
		ib_captured = FALSE
		inv_win32.ReleaseCapture()
	END IF
END IF

RETURN 1
end function

public function integer of_show ();inv_timer.Start(.1)
THIS.Show()
RETURN 1
end function

on u_cst_ribbonmenu.create
this.uo_menu=create uo_menu
this.uo_footer=create uo_footer
this.uo_header=create uo_header
this.inv_win32=create inv_win32
this.Control[]={this.uo_menu,&
this.uo_footer,&
this.uo_header}
end on

on u_cst_ribbonmenu.destroy
destroy(this.uo_menu)
destroy(this.uo_footer)
destroy(this.uo_header)
destroy(this.inv_win32)
end on

event constructor;Long ll_index
ll_index = 1
ist_tabs[ll_index].ab_mouseover = FALSE
ist_tabs[ll_index].ab_selected = FALSE
ist_tabs[ll_index].ab_programtab = TRUE
ist_tabs[ll_index].ab_visible = TRUE
ist_tabs[ll_index].ab_enabled = TRUE
ist_tabs[ll_index].al_textx = 10
ist_tabs[ll_index].ast_point[1].px = 0
ist_tabs[ll_index].ast_point[1].py = 22
ist_tabs[ll_index].ast_point[2].px = 0
ist_tabs[ll_index].ast_point[2].py = 0
ist_tabs[ll_index].ast_point[3].px = 52
ist_tabs[ll_index].ast_point[3].py = 0
ist_tabs[ll_index].ast_point[4].px = 52
ist_tabs[ll_index].ast_point[4].py = 22

inv_timer = CREATE n_cst_ribbontiming
inv_timer.i_menu = THIS
end event

type uo_menu from u_cst_ribbonmenulist within u_cst_ribbonmenu
integer y = 108
integer width = 754
integer taborder = 20
end type

on uo_menu.destroy
call u_cst_ribbonmenulist::destroy
end on

event selectionchanged;call super::selectionchanged;PARENT.iw_parent.Post Event RibbonMenuClicked(String(of_GetData(newindex)))
IF IsValid(PARENT) THEN PARENT.TriggerEvent("lbuttondown")
end event

type uo_footer from u_canvas within u_cst_ribbonmenu
integer y = 760
integer width = 1477
integer height = 100
integer taborder = 10
end type

on uo_footer.destroy
call u_canvas::destroy
end on

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)
//in_Gradient.of_VerticalGradient( of_GetColor('FOOTER1'),  of_GetColor('FOOTER2'), THIS)
in_Gradient.of_Vista2Gradient(of_GetColor('FOOTER1'),  of_GetColor('FOOTER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)

RETURN 1
end event

type uo_header from u_canvas within u_cst_ribbonmenu
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 1477
integer height = 100
integer taborder = 10
end type

event lbuttondown;IF xpos < PixelsToUnits(50, XPixelsToUnits!) THEN
	PARENT.Hide()
END IF
end event

on uo_header.destroy
call u_canvas::destroy
end on

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)
in_Gradient.of_Vista2Gradient( of_GetColor('HEADER1'),  of_GetColor('HEADER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)

ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABBORDER')

in_Gradient.of_DrawTabs(FALSE, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!) , of_GetColor('BORDER'), il_imagelistsmall, FALSE, FALSE, 1, '', 0)

RETURN 1
end event

type inv_win32 from n_cst_win32 within u_cst_ribbonmenu descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

