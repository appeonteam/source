$PBExportHeader$u_cst_ribbonmenulist.sru
forward
global type u_cst_ribbonmenulist from u_cst_buttonlistbar
end type
end forward

global type u_cst_ribbonmenulist from u_cst_buttonlistbar
end type
global u_cst_ribbonmenulist u_cst_ribbonmenulist

forward prototypes
public function long of_getcolor (string as_color)
public function integer of_updatepointslist ()
public function integer of_selectbutton (long al_index)
public function long of_gettotalheight ()
public function long of_additem (string as_text, string as_image)
public function integer of_mouseover (long al_index)
public function integer of_addline ()
end prototypes

public function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "BORDER"
		ll_color = RGB(171,184,201)
	CASE "ITEMBORDER"
		ll_color = RGB(238, 200, 88)
	CASE "HOVER1"
		ll_color = RGB(255,245,204)
	CASE "HOVER2"
		ll_color = RGB(255,208,145)
	CASE "BACKGROUND1"
		ll_color = RGB(255,255,255)
	CASE "BACKGROUND2"
		ll_color = RGB(255,255,255)
	CASE "HOVERSELECTED1"
		ll_color = RGB(254,145,78)
	CASE "HOVERSELECTED2"
		ll_color = RGB(255,211,142)
	CASE "SELECTED1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(247,219,124)
			CASE SILVER
				ll_color = RGB(251,230,148)
			CASE OLIVE
				ll_color = RGB(251,230,148)
			CASE CLASSIC
				ll_color = RGB(212,213,216)	
		END CHOOSE
	CASE "SELECTED2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(238,150,21)
			CASE SILVER
				ll_color = RGB(238,150,21)
			CASE OLIVE
				ll_color = RGB(238,150,21)
			CASE CLASSIC
				ll_color = RGB(212,213,216)	
		END CHOOSE
	CASE "ITEMTEXT"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = 0
			CASE SILVER
				ll_color = 0
			CASE OLIVE
				ll_color = 0
			CASE CLASSIC
				ll_color = 0
			CASE DEFAULT
				ll_color = 0			
		END CHOOSE
	CASE 'SCROLLBAR'
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(169,199,240)
			CASE SILVER
				ll_color = RGB(192,192,211)
			CASE OLIVE
				ll_color = RGB(197,212,159)
			CASE CLASSIC
				ll_color = RGB(212,208,200)
		END CHOOSE
	CASE 'SCROLLBARSELECTED'
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(255,238,194)
			CASE SILVER
				ll_color = RGB(255,238,194)
			CASE OLIVE
				ll_color = RGB(255,238,194)
			CASE CLASSIC
				ll_color = RGB(182,189,210)
		END CHOOSE
	CASE 'SCROLLBARBORDER'
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(127,157,185)
			CASE SILVER
				ll_color = RGB(165,172,178)
			CASE OLIVE
				ll_color = RGB(164,185,127)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
		END CHOOSE
	CASE 'SCROLLBARSELECTEDBORDER'
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(0,0,128)
			CASE SILVER
				ll_color = RGB(75,75,111)
			CASE OLIVE
				ll_color = RGB(63,93,56)
			CASE CLASSIC
				ll_color = RGB(10,36,106)
		END CHOOSE
END CHOOSE

RETURN ll_color

end function

public function integer of_updatepointslist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height, ll_dc
point lp_empty[]
n_cst_buttonlistbar_painter ln_gradient

ll_count = UpperBound(ist_buttons)

ll_y = UnitsToPixels(il_y, YUnitsToPixels!)
ll_x = 5
ll_width = UnitsToPixels(Width, XUnitsToPixels!)
ll_height = il_CurrentSize

ll_dc = inv_win32.GetDC(Handle(st_buttonlistbarlabel))
ln_gradient.of_SetHDC(ll_dc)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].ab_Invalid THEN
		CONTINUE
	END IF
	
 	IF ist_buttons[ll_index].ab_line THEN
		
		ist_buttons[ll_index].ast_point[1].px = 45
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width
		ist_buttons[ll_index].ast_point[2].py = ll_y
		
		ll_y = ll_y + 4
		CONTINUE
	END IF
	
	ll_item++
	ist_buttons[ll_index].ast_point = lp_empty
	
	IF il_index = ll_index THEN
		ist_buttons[ll_index].ab_selected = FALSE
		ist_buttons[ll_index].ab_mouseover = TRUE
		ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER1')
		ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
	ELSE
		ist_buttons[ll_index].ab_mouseover = FALSE
		ist_buttons[ll_index].ab_selected = FALSE
		ist_buttons[ll_index].al_backcolor1 = 0
		ist_buttons[ll_index].al_backcolor2 = 0
	END IF
	
	ln_gradient.of_DrawText(st_buttonlistbarlabel, &
			ist_buttons[ll_index].as_text, &
			0, &
			'tahoma', &
			11, FALSE, ln_gradient.ALIGN_LEFT, &
			0, &
			0, &
			ll_width - ll_x - ll_x - il_CurrentSize - 18, &
			0, &
			FALSE, FALSE, FALSE, TRUE)
	
	IF ln_gradient.il_NewHeight > il_CurrentSize THEN
		ll_height = ln_gradient.il_NewHeight + 10
	ELSE
		ll_height = il_CurrentSize + 10
	END IF
	
	ist_buttons[ll_index].al_textheight = ln_gradient.il_NewHeight
	
	ist_buttons[ll_index].ast_point[1].px = ll_x
	ist_buttons[ll_index].ast_point[1].py = ll_y
	ist_buttons[ll_index].ast_point[2].px = ll_width - ll_x + 1
	ist_buttons[ll_index].ast_point[2].py = ll_y
	ist_buttons[ll_index].ast_point[3].px = ll_width - ll_x + 1
	ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
	ist_buttons[ll_index].ast_point[4].px = ll_x
	ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
	
	ll_y = ll_y + ll_height + 2

NEXT

inv_win32.ReleaseDC (Handle(st_buttonlistbarlabel), ll_dc)

RETURN 1
end function

public function integer of_selectbutton (long al_index);Long ll_old, ll_index, ll_count
Long ll_array_selected

ll_array_selected = of_GetArrayPosition(al_index)

IF al_index <= 0 THEN RETURN 0
IF NOT ist_buttons[ll_array_selected].ab_Enabled THEN RETURN 0

IF Event SelectionChanging(ist_buttons[al_index].al_index, al_index) = 1 THEN
	ll_old = il_selected
	il_selected = ll_array_selected

	ist_buttons[il_selected].ab_mouseover = FALSE
	ist_buttons[il_selected].ab_selected = FALSE
	ist_buttons[il_selected].al_backcolor1 = 0
	ist_buttons[il_selected].al_backcolor2 = 0
	
	IF ll_old > 0 THEN
		ll_old = ist_buttons[ll_old].al_index
	END IF

	
	EVENT SelectionChanged(ll_old, ist_buttons[il_selected].al_index)
	
END IF

RETURN 1
end function

public function long of_gettotalheight ();Long ll_index, ll_inner

ll_index = UpperBound(ist_buttons)

IF ll_index > 0 THEN
	ll_inner = UpperBound(ist_buttons[ll_index].ast_point)
	
	IF ll_inner > 0 THEN
		RETURN PixelsToUnits(ist_buttons[ll_index].ast_point[ll_inner].py + 4, YPixelsToUnits!)
	END IF
END IF

RETURN 50
end function

public function long of_additem (string as_text, string as_image);Long ll_item

ll_item = UpperBound(ist_buttons) + 1
il_nextindex++

ist_buttons[ll_item].as_text = as_text
IF Len(Trim(as_image)) > 0 THEN
	ist_buttons[ll_item].al_image = of_AddImage(as_image)
END IF
ist_buttons[ll_item].ab_enabled = TRUE
ist_buttons[ll_item].al_index = il_nextindex
ist_buttons[ll_item].ab_invalid = FALSE

ist_buttons[ll_item].ast_point[1].px = 0
ist_buttons[ll_item].ast_point[1].py = 0
ist_buttons[ll_item].ast_point[2].px = 0
ist_buttons[ll_item].ast_point[2].py = 0

of_UpdatePointsList()

RETURN il_nextindex
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	ist_buttons[il_index].ab_mouseover = FALSE
	ist_buttons[il_index].ab_selected = FALSE
	ist_buttons[il_index].al_backcolor1 = 0
	ist_buttons[il_index].al_backcolor2 = 0
END IF

IF al_index > 0 THEN
	ist_buttons[al_index].ab_mouseover = TRUE
	ist_buttons[al_index].ab_selected = FALSE
	ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVER1')
	ist_buttons[al_index].al_backcolor2 = of_GetColor('HOVER2')
END IF

il_index = al_index

ib_dirty = FALSE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_addline ();Long ll_item

ll_item = UpperBound(ist_buttons) + 1
il_nextindex++

ist_buttons[ll_item].ab_enabled = TRUE
ist_buttons[ll_item].al_index = il_nextindex
ist_buttons[ll_item].ab_invalid = FALSE
ist_buttons[ll_item].ab_line = TRUE

ist_buttons[ll_item].ast_point[1].px = 0
ist_buttons[ll_item].ast_point[1].py = 0
ist_buttons[ll_item].ast_point[2].px = 0
ist_buttons[ll_item].ast_point[2].py = 0

of_UpdatePointsList()

RETURN il_nextindex
end function

on u_cst_ribbonmenulist.create
call super::create
end on

on u_cst_ribbonmenulist.destroy
call super::destroy
end on

event constructor;call super::constructor;of_SetStyle(LIST)
of_SetSize(MEDIUM)
end event

event onpaint;in_Gradient.of_SetHDC(hdc)

in_Gradient.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,TRUE,of_GetColor("BORDER"), TRUE)

IF ib_dirty THEN
	of_UpdatePoints()
	ib_dirty = FALSE
END IF

in_Gradient.of_DrawMenuButtons (THIS, ist_buttons, of_GetColor("ITEMBORDER"), il_imagelist, ib_boldselected, il_CurrentSize, UnitsToPixels(Height, YUnitsToPixels!), il_currentstyle)

of_DrawEval(hdc)

RETURN 1
end event

type uo_scrolldown from u_cst_buttonlistbar`uo_scrolldown within u_cst_ribbonmenulist
end type

type uo_scrollup from u_cst_buttonlistbar`uo_scrollup within u_cst_ribbonmenulist
end type

type st_buttonlistbarlabel from u_cst_buttonlistbar`st_buttonlistbarlabel within u_cst_ribbonmenulist
end type

