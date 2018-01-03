$PBExportHeader$u_cst_ribbon.sru
forward
global type u_cst_ribbon from u_cst_tabcontrol
end type
type rect from structure within u_cst_ribbon
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type u_cst_ribbon from u_cst_tabcontrol
event doubleclicked pbm_lbuttondblclk
end type
global u_cst_ribbon u_cst_ribbon

type prototypes

end prototypes

type variables
u_cst_ribboncontainer iuo_parentcontainer
Boolean ib_displayprogramtab
Boolean ib_displayprogramorb
end variables

forward prototypes
public function integer of_drawpin (long hdc)
public function boolean of_isoverpin (long al_x, long al_y)
public function integer of_settheme (long al_color)
public function integer of_ribbon ()
public function integer of_insertprogramtab (string as_image)
public function integer of_closealltabs ()
public function long of_getcolor (string as_color)
public function integer of_mouseleave ()
public function integer of_mouseover (long al_index)
end prototypes

public function integer of_drawpin (long hdc);IF NOT IsValid(iuo_parentcontainer) THEN
	RETURN 0
END IF

ulong ll_brush, ll_oldbrush, ll_font, ll_oldfont
string ls_x
Rect rc
point lp
long llx, lly
Long hRgn, hRPen

rc.Left = UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) - 17
rc.Top = 8
rc.Bottom = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 2

ll_brush = inv_win32.CreatePen(0, 0, 0)

inv_win32.SelectObject(hdc, ll_brush)

IF NOT iuo_parentcontainer.ib_docked THEN	
	//draw unpinned
	llx = rc.left ; lly = (rc.bottom / 2) + 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 4
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly += 7
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + 2
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
	lly += 4
	inv_win32.LineTo(hdc, llx, lly)
	llx -= 7
	inv_win32.LineTo(hdc, llx, lly)
	lly -= 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
ELSE
	//draw pinned
	llx = rc.left + 5
	lly = rc.bottom - 3
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 4
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + 2
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += 7
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + 3
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 6
	inv_win32.LineTo(hdc, llx, lly)
	llx += 4
	inv_win32.LineTo(hdc, llx, lly)
	lly += 6
	inv_win32.LineTo(hdc, llx, lly)
	llx -= 1
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= 6
	inv_win32.LineTo(hdc, llx, lly)
END IF

inv_win32.DeleteObject(ll_brush)

RETURN 1

end function

public function boolean of_isoverpin (long al_x, long al_y);IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - 17 AND & 
   UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - 4  AND &
	UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - 2 AND & 
   UnitsToPixels(al_y, XUnitsToPixels!) > 2 THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public function integer of_settheme (long al_color);Long ll_index, ll_loop
u_cst_ribbonpanel panel

il_currenttheme = al_color

ll_loop = of_GetTabCount()

FOR ll_index = 1 TO ll_loop
	panel = of_GetObject(ll_index)
	IF IsValid(panel) THEN panel.of_SetTheme(al_color)
NEXT

ll_loop = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_loop
	ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
	ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
	ist_tabs[ll_index].al_textcolor = of_GetColor('TEXT')
NEXT

ib_dirty = TRUE
THIS.SetRedraw(TRUE)


RETURN 1
end function

public function integer of_ribbon ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_height, ll_regionindex
Point p, lp_empty[]

ll_count = UpperBound(ist_tabs)
ll_y = 0
ll_x = 4

IF ib_displayprogramorb THEN ll_x = 50
IF ib_displayprogramtab THEN ll_x = 0

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	
	ist_tabs[ll_index].al_style = il_CurrentStyle
	ist_tabs[ll_index].ast_point = lp_empty
	ist_tabs[ll_index].ast_closebutton = lp_empty
	st_1.Weight = 400
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABHOVER')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABHOVERBORDER')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
			ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
		END IF
		
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_programtab = TRUE
	ELSE
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR1')
		END IF
		
		IF il_selected = ll_index THEN
			ist_tabs[ll_index].ab_selected = TRUE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
			
			IF ib_boldselected THEN
				st_1.Weight = 700
			END IF
			
		ELSE
			ist_tabs[ll_index].ab_selected = FALSE
		END IF
	END IF
	
	ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 1
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		ll_textwidth = 50
		ist_tabs[ll_index].al_textx = 10
	ELSE
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += 19
		ELSE
			ll_textwidth += 5
		END IF
		
		ll_textwidth += 10
		ist_tabs[ll_index].al_textx = ll_x + 6
	END IF
	
	
	IF il_selected = ll_index THEN
		ist_tabs[ll_index].ast_point[1].px = ll_x 
		ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height 
		
		ist_tabs[ll_index].ast_point[2].px = ll_x + 1
		ist_tabs[ll_index].ast_point[2].py = ll_y + ll_height - 1
		
		ist_tabs[ll_index].ast_point[3].px = ll_x + 1
		ist_tabs[ll_index].ast_point[3].py = ll_y + 4 
		
		ist_tabs[ll_index].ast_point[4].px = ll_x + 3 
		ist_tabs[ll_index].ast_point[4].py = ll_y + 2 
		
		ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth - 2
		ist_tabs[ll_index].ast_point[5].py = ll_y + 2 
		
		ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth 
		ist_tabs[ll_index].ast_point[6].py = ll_y + 4 
		
		ist_tabs[ll_index].ast_point[7].px = ll_x + ll_textwidth 
		ist_tabs[ll_index].ast_point[7].py = ll_y + ll_height - 1 
		
		ist_tabs[ll_index].ast_point[8].px = ll_x + ll_textwidth + 1 
		ist_tabs[ll_index].ast_point[8].py = ll_y + ll_height 
	ELSE
		ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
		ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
		ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
		ist_tabs[ll_index].ast_point[2].py = ll_y + 4//Top left corner
		ist_tabs[ll_index].ast_point[3].px = ll_x + 2//Top right corner
		ist_tabs[ll_index].ast_point[3].py = ll_y + 2//Top right corner
		ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + 0//bottom right corner
		ist_tabs[ll_index].ast_point[4].py = ll_y + 2 //bottom right corner
		ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + 2//bottom right corner
		ist_tabs[ll_index].ast_point[5].py = ll_y + 4 //bottom right corner
		ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + 2//bottom right corner
		ist_tabs[ll_index].ast_point[6].py = ll_y + ll_height //bottom right corner
	END IF
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		ll_x += ll_textwidth + 7
	ELSE
		ll_x += ll_textwidth + 2
	END IF
	
NEXT

RETURN 1
end function

public function integer of_insertprogramtab (string as_image);Long ll_index, ll_count, ll_item
TabStrip lst_tabs[]

ll_count = UpperBound(ist_tabs)

ll_item = 1

lst_tabs[ll_item].as_tab_text = ''
lst_tabs[ll_item].al_pic_index = of_AddImage(as_image)
lst_tabs[ll_item].ab_enabled = TRUE
lst_tabs[ll_item].ab_visible = TRUE
lst_tabs[ll_item].ab_canclose = FALSE

FOR ll_index = 1 TO ll_count
	ll_item++
	lst_tabs[ll_item] = ist_tabs[ll_index]
NEXT

ist_tabs = lst_tabs
ib_displayprogramtab = TRUE

RETURN 1
end function

public function integer of_closealltabs ();Long ll_index, ll_count, ll_start

ll_count = UpperBound(ist_tabs)

IF ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

FOR ll_index = ll_start TO ll_count
	of_CloseTab(ll_start)
NEXT

RETURN 1
end function

public function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "BORDER"
		IF il_CurrentStyle = RIBBON THEN
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(139,160,188)
				CASE SILVER
					ll_color = RGB(112,111,145)
				CASE OLIVE
					ll_color = RGB(99,122,68)
				CASE CLASSIC
					ll_color = RGB(128,128,128)
			END CHOOSE
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(108,138,181)
				CASE SILVER
					ll_color = RGB(112,111,145)
				CASE OLIVE
					ll_color = RGB(99,122,68)
				CASE CLASSIC
					ll_color = RGB(128,128,128)
				CASE DEFAULT
					ll_color = inv_win32.GetSysColor(16)
			END CHOOSE
		END IF
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
			CASE DEFAULT
				ll_color = inv_win32.GetSysColor(16)
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
			CASE DEFAULT
				ll_color = inv_win32.GetSysColor(16)
		END CHOOSE
	CASE "HOVER1"
		ll_color = RGB(255,244,204)
	CASE "HOVER2"
		ll_color = RGB(255,208,145)
	CASE "BACKCOLOR1"
		IF il_CurrentStyle = RIBBON THEN
			IF il_backcolor = 0 THEN
				ll_color = inv_win32.GetSysColor (15)
			ELSE
				ll_color = il_backcolor //GetSysColor (15)
			END IF
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(221,236,254)
				CASE SILVER
					ll_color = RGB(243,244,250)
				CASE OLIVE
					ll_color = RGB(244,247,222)
				CASE CLASSIC
					ll_color = RGB(245,244,242)
				CASE DEFAULT
					ll_color = inv_win32.GetSysColor (15)
			END CHOOSE
		END IF
	CASE "BACKCOLOR2"
		IF il_CurrentStyle = RIBBON THEN
			IF il_backcolor = 0 THEN
				ll_color = inv_win32.GetSysColor (15)
			ELSE
				ll_color = il_backcolor
			END IF
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(129,169,226)
				CASE SILVER
					ll_color = RGB(153,151,181)
				CASE OLIVE
					ll_color = RGB(183,198,145)
				CASE CLASSIC
					ll_color = RGB(213,210,202)
				CASE DEFAULT
					ll_color = inv_win32.GetSysColor (15)				
			END CHOOSE
		END IF
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
			CASE DEFAULT
				ll_color = inv_win32.GetSysColor (15)
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
	CASE "SELECTED1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(255,255,255)
			CASE SILVER
				ll_color = RGB(255,255,255)
			CASE OLIVE
				ll_color = RGB(255,255,255)
			CASE CLASSIC
				ll_color = RGB(255,255,255)
			CASE DEFAULT
				ll_color = RGB(255,255,255)			
		END CHOOSE
	CASE "SELECTED2"
		IF il_CurrentStyle = RIBBON THEN
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
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(255,255,255)
				CASE SILVER
					ll_color = RGB(255,255,255)
				CASE OLIVE
					ll_color = RGB(255,255,255)
				CASE CLASSIC
					ll_color = RGB(255,255,255)
				CASE DEFAULT
					ll_color = RGB(255,255,255)			
			END CHOOSE
		END IF
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
	CASE "TABBACK1"
		IF il_backcolor > 0 THEN
			ll_color = il_backcolor
		ELSE
			ll_color = inv_win32.GetSysColor (15)
		END IF
	CASE "TABBACK2"
		IF il_backcolor > 0 THEN
			ll_color = il_backcolor
		ELSE
			ll_color = inv_win32.GetSysColor (15)
		END IF
END CHOOSE

RETURN ll_color
end function

public function integer of_mouseleave ();Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	IF ib_displayprogramtab AND ll_index = 1 THEN
		ist_tabs[ll_index].ab_selected = FALSE
		ist_tabs[ll_index].ab_mouseover = FALSE
		ist_tabs[ll_index].ab_mouseoverclose = FALSE
		ist_tabs[ll_index].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
		ist_tabs[ll_index].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
		ist_tabs[ll_index].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
		ist_tabs[ll_index].ab_programtab = TRUE
	ELSE
		IF il_selected = ll_index THEN
			ist_tabs[ll_index].ab_selected = TRUE
			ist_tabs[il_selected].ab_mouseover = FALSE
			ist_tabs[il_selected].ab_mouseoverclose = FALSE
			ist_tabs[il_selected].al_backcolor1 = of_GetColor('SELECTED1')
			ist_tabs[il_selected].al_backcolor2 = of_GetColor('SELECTED2')
			ist_tabs[il_selected].al_textcolor = of_GetColor('TEXTSELECTED')
		ELSE
			ist_tabs[ll_index].ab_selected = FALSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].ab_mouseoverclose = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
			ist_tabs[ll_index].al_textcolor = of_GetColor('TEXT')
		END IF
	END IF
NEXT

ib_inclose = FALSE
ib_inclose = FALSE

il_index = 0

uo_tabs.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_mouseover (long al_index);IF al_index > 0 THEN
	IF il_selected = al_index THEN
		ist_tabs[al_index].ab_selected = TRUE
		ist_tabs[al_index].ab_mouseover = FALSE
		ist_tabs[al_index].al_backcolor1 = of_GetColor('SELECTED1')
		ist_tabs[al_index].al_backcolor2 = of_GetColor('SELECTED2')
		ist_tabs[al_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_tabs[al_index].ab_mouseover = TRUE
		ist_tabs[al_index].al_backcolor1 = of_GetColor('HOVER1')
		ist_tabs[al_index].al_backcolor2 = of_GetColor('HOVER2')
		ist_tabs[al_index].al_textcolor = of_GetColor('TEXTHOVER')
	END IF
END IF

IF il_index > 0 THEN
	IF il_selected = il_index THEN
		ist_tabs[il_index].ab_selected = TRUE
		ist_tabs[il_index].ab_mouseover = FALSE
		ist_tabs[il_index].al_backcolor1 = of_GetColor('SELECTED1')
		ist_tabs[il_index].al_backcolor2 = of_GetColor('SELECTED2')
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_tabs[il_index].ab_mouseover = FALSE
		ist_tabs[il_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
		ist_tabs[il_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
		ist_tabs[il_index].al_textcolor = of_GetColor('TEXT')
	END IF
END IF

il_index = al_index

IF ib_displayprogramtab AND UpperBound(ist_tabs) > 0 THEN
	IF il_index = 1 THEN
		ist_tabs[1].ab_mouseover = TRUE
		ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABHOVER')
		ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABHOVER')
		ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABHOVERBORDER')
	ELSE
		ist_tabs[1].ab_mouseover = FALSE
		ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
		ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
		ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
	END IF
	
	ist_tabs[1].ab_mouseoverclose = FALSE
	ist_tabs[1].ab_programtab = TRUE
END IF

uo_tabs.SetRedraw(TRUE)
RETURN 1
end function

on u_cst_ribbon.create
int iCurrent
call super::create
end on

on u_cst_ribbon.destroy
call super::destroy
end on

event constructor;call super::constructor;of_SetStyle(RIBBON)
of_HideArrows()
of_HideCloseButton()
end event

type uo_navigation from u_cst_tabcontrol`uo_navigation within u_cst_ribbon
end type

type uo_tabs from u_cst_tabcontrol`uo_tabs within u_cst_ribbon
event doubleclick pbm_lbuttondblclk
end type

event uo_tabs::doubleclick;iuo_parentcontainer.of_TabsDoubleClicked(il_index)
end event

event uo_tabs::onpaint;call super::onpaint;RETURN of_DrawPin(hdc)
end event

event uo_tabs::lbuttonup;call super::lbuttonup;IF of_IsOverPin(xpos, ypos) THEN
	iuo_parentcontainer.of_TabsDoubleClicked(0)
END IF
end event

event uo_tabs::lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ib_displayprogramtab AND ll_index = 1 THEN
	iuo_parentcontainer.of_Collapse()
	iuo_parentcontainer.TriggerEvent("ue_programtabclicked")
ELSE
	SUPER::EVENT LButtonDown(flags,xpos,ypos)
END IF
end event

type uo_chevronclose from u_cst_tabcontrol`uo_chevronclose within u_cst_ribbon
end type

type st_1 from u_cst_tabcontrol`st_1 within u_cst_ribbon
end type

