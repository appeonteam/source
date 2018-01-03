$PBExportHeader$u_cst_tabcontrol.sru
forward
global type u_cst_tabcontrol from u_cst_canvas
end type
type uo_navigation from u_cst_tabstripnavigate within u_cst_tabcontrol
end type
type uo_tabs from u_cst_tabstrip within u_cst_tabcontrol
end type
type uo_chevronclose from u_cst_powerdockclose within u_cst_tabcontrol
end type
type st_1 from statictext within u_cst_tabcontrol
end type
type trackmouseevent from structure within u_cst_tabcontrol
end type
end forward

global type u_cst_tabcontrol from u_cst_canvas
integer width = 759
integer height = 332
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event selectionchanging pbm_tcnselchanging
event selectionchanged pbm_tcnselchanged
event type long tabclosing ( long index )
event tabclosed ( long index )
event rightclicked ( long index )
event paint pbm_paint
event ue_movetofloatingwindow ( )
event ue_floatmoving ( long xpos,  long ypos )
event ue_floatingstop ( )
uo_navigation uo_navigation
uo_tabs uo_tabs
uo_chevronclose uo_chevronclose
st_1 st_1
end type
global u_cst_tabcontrol u_cst_tabcontrol

type prototypes

end prototypes

type variables
n_cst_tabstrip_painter in_Gradient
n_cst_ui_imagelist inv_imagelist
tabstrip ist_tabs[]
window iw_parent

Long il_index
Long il_selected
Long il_backcolor = 0
boolean ib_allowtabdrag
Boolean ib_displayclosebuttoninselectedtab
Boolean ib_displayclosebuttoninAlltabs

String FontName = 'Tahoma'
Long FontSize = 8

Boolean ib_boldselected
Boolean ib_hidearrows
Boolean ib_hideclosebutton
Boolean ib_hidetabs


Boolean ib_closing
Boolean ib_dirty
Boolean ib_inclose
Boolean ib_vistastyle = false

Long il_imagelistsmall
String is_images[]

CONSTANT Long TOP = 1
CONSTANT Long BOTTOM = 2

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

CONSTANT ULong GWL_EXSTYLE = 4294967276
CONSTANT ULong WS_EX_LAYERED = 524288
CONSTANT ULong LWA_COLORKEY = 1

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

CONSTANT Long REGULAR = 0
CONSTANT Long EXCEL = 1
CONSTANT Long VS2005 = 2
CONSTANT Long OFFICE2007 = 3
CONSTANT Long RIBBON = 4

Constant Integer WM_GETFONT = 49

Long il_CurrentPosition = TOP
Long il_CurrentStyle = REGULAR
Long il_CurrentTheme = BLUE

Long il_firstvisible = 1
Long il_lastvisible = 1
end variables

forward prototypes
public function integer of_getwindow ()
public function integer of_updatepoints ()
public function integer of_indexfrompoint (long xpos, long ypos)
public function integer of_selecttab (long al_selected)
public function integer of_addimage (string as_image)
public function long of_getcolor (string as_color)
public function integer of_setstyle (long al_style)
public function integer of_excel ()
public function integer of_regular ()
public function integer of_settabposition (long al_position)
public function integer of_setenabled (long al_index, boolean ab_switch)
public function integer of_boldselected (boolean ab_bold)
public function integer of_settheme (long al_color)
public function integer of_settheme (string as_color)
public function integer of_vs2005 ()
public function integer of_scrollleft ()
public function integer of_scrollright ()
public function integer of_closetab (long al_index)
public function integer of_closeselectedtab ()
public function long of_getselectedtab ()
public function integer of_closealltabs ()
public function long of_gettabcount ()
public function userobject of_getobject (long al_index)
public function integer of_settext (long al_index, string as_text)
public function String of_gettext (long al_index)
public function integer of_mouseover (long al_index)
public function integer of_mouseleave ()
public function integer of_setimage (long al_index, long al_image)
public function integer of_settext (userobject auo_object, string as_text)
public function integer of_setimage (userobject auo_object, long al_image)
public function integer of_showclosebutton ()
public function integer of_setenabled (userobject auo_object, boolean ab_switch)
public function integer of_settiptext (long al_index, string as_text)
public function integer of_settiptext (userobject auo_object, string as_text)
public function string of_gettiptext (long al_index)
public function integer of_settextcolor (userobject auo_object, long al_color)
public function integer of_settextcolor (long al_index, long al_color)
public function integer of_setvisible (long al_index, boolean ab_switch)
public function integer of_setvisible (userobject auo_object, boolean ab_switch)
public function boolean of_isvisible (long al_index)
public function boolean of_isenabled (long al_index)
public function integer of_hideclosebutton ()
public function integer of_hidearrows ()
public function integer of_showarrows ()
public function integer of_office2007 ()
public function integer of_hidetabs ()
public function integer of_showtabs ()
public function long of_opentab (ref userobject a_object, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_text, long al_picindex)
public function integer of_removetab (long al_index)
public function window of_getwindow (long al_index)
public function long of_opentab (ref window a_object, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, long al_picindex)
public function integer of_showchevron ()
public function integer of_hidechevron ()
public function integer of_refreshtabmenu (ref menu a_menu)
public function integer of_displayclosebuttonintab (boolean ab_switch)
public function integer of_highlightclosebutton (long xpos, long ypos)
public function integer of_highlightclosebutton (long al_index, long xpos, long ypos)
public function boolean of_ismouseoverx (long xpos, long ypos)
public function boolean of_ismouseoverx (long al_index, long xpos, long ypos)
public function integer of_ribbon ()
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (long al_size)
public function point of_gettextwidth (string as_text, boolean ab_bold)
public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex, long al_parentindex)
public function integer of_showparenttabs (long al_parentindex)
public function integer of_setbackcolor (long al_color)
public function integer of_setvistastyle (boolean ab_displayasvista)
public function long of_opentab (ref userobject a_object, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_text, string as_image)
public function integer of_setredraw ()
public function integer of_allowtabdragging (boolean ab_switch)
public function integer of_displayclosebuttoninalltabs (boolean ab_switch)
public function integer of_tabtriggerevent (string as_event, long al_word, long al_long)
public function integer of_tabtriggerevent (string as_event)
public function integer of_activetabtriggerevent (string as_event, long al_word, long al_long)
public function integer of_activetabtriggerevent (string as_event)
public function long of_gettabheight ()
public function integer of_attachtab (userobject auo_object)
public function long of_getnexttab (long al_index)
public function integer of_detachtab (long al_index, window aw_float)
public function integer of_detachtab (userobject auo_object, window aw_float)
public function long of_attachtab (long al_index)
public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex)
public function long of_opentab (ref userobject a_object, string as_type, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, string as_image)
public function boolean of_canclose (userobject auo_object)
public function boolean of_canclose (long al_index)
public function integer of_canclose (userobject auo_object, boolean ab_canclose)
public function integer of_canclose (long al_index, boolean ab_canclose)
public function boolean of_istabfloating (window aw_window)
public function boolean of_istabfloating (userobject auo_object)
public function long of_opentab (ref userobject a_object, string as_type, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, string as_text, string as_image)
public function long of_opentab (ref window a_object, string as_type, string as_text, long al_picindex)
public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, string as_image)
public function integer of_closetab (userobject auo_object)
public function integer of_closetab (window aw_object)
public function string of_gettext (userobject auo_object)
public function string of_gettext (window aw_object)
public function boolean of_isenabled (userobject auo_object)
public function boolean of_isenabled (window aw_object)
public function boolean of_isvisible (userobject auo_object)
public function boolean of_isvisible (window aw_object)
public function integer of_removetab (userobject auo_object)
public function integer of_removetab (window aw_object)
public function integer of_selecttab (userobject auo_object)
public function integer of_attachtab (window aw_object)
public function integer of_detachtab (window aw_object, window aw_float)
public function integer of_selecttab (window aw_object)
public function integer of_setenabled (window aw_object, boolean ab_switch)
public function integer of_setimage (window aw_object, long al_image)
public function integer of_settext (window aw_object, string as_text)
public function integer of_settextcolor (window aw_object, long al_color)
public function integer of_settiptext (window aw_object, string as_text)
public function integer of_setvisible (window aw_object, boolean ab_switch)
public function integer of_setimage (window aw_object, string as_image)
public function integer of_setimage (userobject auo_object, string as_image)
public function integer of_setimage (long al_index, string as_image)
end prototypes

event resize;call super::resize;Long ll_TabHeight
Long ll_x, ll_y, ll_width, ll_height

IF SizeType = 1 THEN
	RETURN
END IF

IF uo_chevronclose.Visible THEN
	uo_tabs.Width = Width - uo_chevronclose.Width
ELSE
	uo_tabs.Width = Width - uo_navigation.Width
END IF

uo_navigation.X = Width - uo_navigation.Width
uo_chevronclose.X = Width - uo_chevronclose.Width

IF ib_hidearrows THEN
	uo_navigation.uo_close.X = 5
ELSE
	uo_navigation.uo_close.X = 155
END IF

IF il_CurrentPosition = BOTTOM THEN
	uo_tabs.Move(0, Height - uo_tabs.Height)
	uo_navigation.Y = Height - uo_tabs.Height
	uo_chevronclose.Y = Height - uo_tabs.Height
END IF

IF ib_hidetabs THEN
	ll_TabHeight = PixelsToUnits(1, YPixelsToUnits!)
ELSE
	ll_TabHeight = uo_tabs.Height 
END IF

IF il_selected > 0 AND il_selected <= UpperBound(ist_tabs) THEN
	
	IF IsValid(ist_tabs[il_selected].ado_object) THEN
		IF il_CurrentPosition = TOP THEN
			ist_tabs[il_selected].ado_object.Y = ll_TabHeight
		ELSE
			IF IsValid(ist_tabs[il_selected].ado_object) THEN
				ist_tabs[il_selected].ado_object.Y = PixelsToUnits(1, YPixelsToUnits!)
			END IF
		END IF
		
		ist_tabs[il_selected].ado_object.X = 4
		
		IF ib_hidetabs THEN
			ll_y = PixelsToUnits(2, YPixelsToUnits!)
		ELSE
			ll_y = PixelsToUnits(1, YPixelsToUnits!)
		END IF
		
		ist_tabs[il_selected].ado_object.Resize(Width - 10, Height - ll_TabHeight - ll_y)
	ELSE
		IF il_CurrentPosition = TOP THEN
			ll_y = ll_TabHeight
		ELSE
			IF IsValid(ist_tabs[il_selected].aw_window) THEN
				ll_y = 5
			END IF
		END IF
		
		ll_x = 4
		ll_width = Width - 10
		ll_height = Height - ll_TabHeight - 4
		
		inv_win32.SetWindowPos(Handle(ist_tabs[il_selected].aw_window), 1, UnitsToPixels(ll_x, XUnitsToPixels!), &
                                  UnitsToPixels(ll_y, YUnitsToPixels!), &
											 UnitsToPixels(ll_width, XUnitsToPixels!), &
											 UnitsToPixels(ll_height, YUnitsToPixels!), 0)
		
	END IF
END IF

ib_dirty = TRUE
uo_tabs.SetRedraw(TRUE)
end event

event selectionchanging;// Trigger the event on the tabpage being selected
//Return ist_tabs[newindex].ado_object.Event SelectionChanging(oldindex, newindex)

If IsValid(ist_tabs[newindex].ado_object) Then
   ist_tabs[newindex].ado_object.TriggerEvent("uimSelectionChanging", oldindex, newindex)
End If
end event

event selectionchanged;// Trigger the event on the tabpage being selected
//Return ist_tabs[newindex].ado_object.Event SelectionChanged(oldindex, newindex)

If IsValid(ist_tabs[newindex].ado_object) Then
   ist_tabs[newindex].ado_object.TriggerEvent("uimSelectionChanged", oldindex, newindex)
End If

end event

event type long tabclosing(long index);//RETURN 0 to Prevent tab from closing
RETURN 1
end event

public function integer of_getwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

iw_parent = lw_window

RETURN 1
end function

public function integer of_updatepoints ();CHOOSE CASE il_CurrentStyle
	CASE EXCEL
		of_Excel()
	CASE REGULAR
		of_Regular()
	CASE VS2005
		of_VS2005()
	CASE OFFICE2007
		of_OFFICE2007()
	CASE RIBBON
		of_Ribbon()
END CHOOSE

Return 1
end function

public function integer of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(ist_tabs)
FOR ll_index = il_firstvisible to ll_count
	//skip if disabled
	IF NOT ist_tabs[ll_index].ab_enabled THEN CONTINUE
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	lul_rgn = inv_win32.CreatePolygonRgn(ist_tabs[ll_index].ast_point, UPPERBOUND(ist_tabs[ll_index].ast_point), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_selecttab (long al_selected);Long ll_old, ll_index, ll_count

IF al_selected <= 0 THEN RETURN 0
IF al_selected > UpperBound(ist_tabs) THEN RETURN 0
IF NOT ist_tabs[al_selected].ab_Enabled THEN RETURN 0

IF Event SelectionChanging(il_selected, al_selected) = 0 THEN
	ll_old = il_selected
	
	IF IsValid(ist_tabs[al_selected].aw_floatwindow) THEN
		SetFocus(ist_tabs[al_selected].aw_floatwindow)
		RETURN 1
	END IF
	
	il_selected = al_selected
	
	TriggerEvent('Resize')
	
	IF ll_old > 0 AND ll_old <= of_GetTabCount() AND &
	   il_selected <> ll_old THEN
		IF ist_tabs[ll_old].ab_Visible THEN
			IF IsValid(ist_tabs[ll_old].ado_object) THEN
				IF NOT IsValid(ist_tabs[ll_old].aw_floatwindow) THEN
					ist_tabs[ll_old].ado_object.Hide()
				END IF
			END IF
			IF IsValid(ist_tabs[ll_old].aw_window) THEN
				IF NOT IsValid(ist_tabs[ll_old].aw_floatwindow) THEN
					ist_tabs[ll_old].aw_window.Hide()
				END IF
				ist_tabs[ll_old].aw_window.TriggerEvent('deactivate')
			END IF
		END IF
	END IF
	
	IF IsValid(ist_tabs[il_selected].ado_object) THEN
		ist_tabs[il_selected].ado_object.Show()
		ist_tabs[il_selected].ado_object.BringToTop = TRUE
	ELSE
		IF IsValid(ist_tabs[il_selected].aw_window) THEN
			ist_tabs[il_selected].aw_window.TriggerEvent('activate')
			ist_tabs[il_selected].aw_window.Show()
			ist_tabs[il_selected].aw_window.BringToTop = TRUE
		END IF
	END IF	
	
	long ll_upper, ll_width, ll_totalwidth
	boolean lb_done
	ll_upper = UpperBound(ist_tabs[il_selected].ast_point)
	ll_width = UnitsToPixels(uo_tabs.Width, XUnitsToPixels!)
	
	IF ll_upper > 0 AND il_firstvisible < il_selected THEN
		IF ist_tabs[il_selected].ast_point[ll_upper].px > ll_width THEN
			ll_count = 0
			
			DO UNTIL lb_done	
				IF ist_tabs[il_selected - ll_count].ab_visible AND NOT IsValid(ist_tabs[il_selected - ll_count].aw_floatwindow) THEN
					ll_totalwidth += ist_tabs[il_selected - ll_count].ast_point[ll_upper].px - &
										 ist_tabs[il_selected - ll_count].ast_point[1].px
				//ELSE
				//	ll_count = ll_count - 1
				END IF
				
				IF ll_totalwidth < ll_width THEN
					ll_count++
					
					IF il_selected - ll_count <= 0 OR il_firstvisible > il_selected - ll_count THEN
						EXIT
					END IF
				ELSE
					lb_done = TRUE
				END IF
			LOOP
			
			il_firstvisible = il_selected - ll_count + 1
		END IF
	ELSE
		il_firstvisible = il_selected
	END IF
	
	
	ib_dirty = TRUE
	SetRedraw(TRUE)
	
	EVENT SelectionChanged(ll_old, il_selected)
	
END IF

RETURN 1
end function

public function integer of_addimage (string as_image);IF Len(Trim(as_image)) > 0 THEN
	Long ll_index
		
	ll_index = inv_imagelist.of_AddImage(as_image)
	
	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	
	RETURN ll_index
ELSE
	RETURN 0
END IF
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
	CASE "HOVER1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(255,244,204)
			CASE SILVER
				ll_color = RGB(255,244,204)
			CASE OLIVE
				ll_color = RGB(255,244,204)
			CASE ELSE
				ll_color = RGB(182,189,210)
		END CHOOSE
	CASE "HOVER2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(255,208,145)
			CASE SILVER
				ll_color = RGB(255,208,145)
			CASE OLIVE
				ll_color = RGB(255,208,145)
			CASE ELSE
				ll_color = RGB(182,189,210)
		END CHOOSE
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
				ll_color = il_backcolor //GetSysColor (15)
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
	CASE "SELECTED1"
//		IF il_CurrentStyle = RIBBON THEN
//			ll_color = RGB(221,236,254)
//		ELSE
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
//		END IF
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

public function integer of_setstyle (long al_style);il_CurrentStyle = al_style

IF al_style = RIBBON THEN
	uo_tabs.Height = 94
END IF

ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_excel ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item, ll_pad, ll_last
Boolean ib_done, ib_scrollrightmode, ib_stop
Point lp_empty[]

DO UNTIL ib_done
	ll_count = UpperBound(ist_tabs)
	ll_y = 0
	ll_x = 3
	
	IF il_firstvisible = 0 THEN il_firstvisible = 1
	
	FOR ll_index = il_firstvisible TO ll_count
		IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
		
		ll_item++
		ist_tabs[ll_index].ast_point = lp_empty
		ist_tabs[ll_index].ast_closebutton = lp_empty
		st_1.Weight = 400
		
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
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
		
		Point p
		
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		Long ll_height
		ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!)
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += 18
		ELSE
			ll_textwidth += 4
		END IF
		
		IF il_CurrentPosition = TOP THEN
				IF ll_item <> 1 THEN
					ll_x -= 12
				END IF
				
				ist_tabs[ll_index].al_textx = ll_x + 12
				ll_textwidth += 8
				
				IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				   ib_displayclosebuttoninalltabs THEN
					
					ll_pad = 20
					ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 10)
					ist_tabs[ll_index].ast_closebutton[1].py = 6
					ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 10 + 13)
					ist_tabs[ll_index].ast_closebutton[2].py = 6
					ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 10 + 13)
					ist_tabs[ll_index].ast_closebutton[3].py = 18
					ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 10)
					ist_tabs[ll_index].ast_closebutton[4].py = 18
				ELSE
					ll_pad = 0
				END IF
				
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x + 11//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_y + 2//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + ll_textwidth + ll_pad + 3//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_y + 2//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad + 14//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_y + ll_height //bottom right corner
			
				ll_x += ll_textwidth + 14 + ll_pad
		ELSE
				IF ll_item <> 1 THEN
					ll_x -= 13
				END IF
				
				ist_tabs[ll_index].al_textx = ll_x + 12
				ll_textwidth += 8
				
				IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				   ib_displayclosebuttoninalltabs THEN
					
					ll_pad = 20
					ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 10)
					ist_tabs[ll_index].ast_closebutton[1].py = 4
					ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 10 + 13)
					ist_tabs[ll_index].ast_closebutton[2].py = 4
					ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 10 + 13)
					ist_tabs[ll_index].ast_closebutton[3].py = 16
					ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 10)
					ist_tabs[ll_index].ast_closebutton[4].py = 16
				ELSE
					ll_pad = 0
				END IF
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x + 12//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_height - 3//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + ll_textwidth + ll_pad + 5//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_height - 3//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad + 15//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = 1 //bottom right corner
			
				ll_x += ll_textwidth + 15 + ll_pad
			
		END IF
		
		IF ll_x < UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) THEN
			il_lastvisible = ll_index
			ll_last = ll_item
		END IF
		
	NEXT

	IF ib_stop THEN
		EXIT
	END IF
	
	IF il_firstvisible = 1 AND NOT ib_scrollrightmode THEN
		EXIT
	END IF
	
	//ll_last is the last visible item. ll_item is the total number of tabs
	IF ll_last < ll_item THEN
		IF NOT ib_scrollrightmode THEN
			//No Need to Shift anything over
			EXIT
		ELSE
			ib_stop = TRUE
			il_firstvisible = il_firstvisible + 1
		END IF
	ELSE
		IF il_firstvisible = 1 THEN
			EXIT
		ELSE
			//Try scrolling to the right
			ib_scrollrightmode = TRUE
			il_firstvisible = il_firstvisible - 1
		END IF
	END IF
	
LOOP

RETURN 1
end function

public function integer of_regular ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_last, ll_item
Boolean ib_done, ib_scrollrightmode, ib_stop
Point lp_empty[]

DO UNTIL ib_done

	ll_count = UpperBound(ist_tabs)
	ll_y = 0
	ll_x = 4
	
	IF il_firstvisible = 0 THEN il_firstvisible = 1
	
	FOR ll_index = il_firstvisible TO ll_count
		IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
		
		ll_item++
		
		ist_tabs[ll_index].ast_point = lp_empty
		ist_tabs[ll_index].ast_closebutton = lp_empty
		st_1.Weight = 400
		
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
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
		
		//ll_textwidth = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		Point p
		
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		
		Long ll_height
		ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!)
		
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += 19
		ELSE
			ll_textwidth += 5
		END IF
		
		IF il_CurrentPosition = TOP THEN
			ist_tabs[ll_index].al_textx = ll_x
							
			IF ist_tabs[ll_index].ab_selected THEN
				ll_x -= 1
			END IF
			
			IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				 ib_displayclosebuttoninalltabs THEN
				 
				ll_pad =  20
				
				ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 6)
				ist_tabs[ll_index].ast_closebutton[1].py = 6
				ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 6 + 13)
				ist_tabs[ll_index].ast_closebutton[2].py = 6
				ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 6  + 13)
				ist_tabs[ll_index].ast_closebutton[3].py = 18
				ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 6 )
				ist_tabs[ll_index].ast_closebutton[4].py = 18
				
			ELSE
				ll_pad = 0
			END IF

			
			IF ist_tabs[ll_index].ab_selected THEN
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_y + 4//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + 2//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_y + 2//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad //bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_y + 2//bottom right corner
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_y + 4 //bottom right corner
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = ll_y + ll_height //bottom right corner
			
				ll_x += ll_textwidth + ll_pad + 3
				
			ELSE
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_y + 4//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + 2//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_y + 2//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_y + 2 //bottom right corner
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + 2 + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_y + 4 //bottom right corner
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + 2 + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = ll_y + ll_height //bottom right corner
				
				ll_x += ll_textwidth + ll_pad + 4
			END IF
				
			
		ELSE
			ist_tabs[ll_index].al_textx = ll_x
			
			IF ist_tabs[ll_index].ab_selected THEN	
				ll_x -= 1
			END IF
			
			IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				 ib_displayclosebuttoninalltabs THEN
				ll_pad =  20
				ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 6)
				ist_tabs[ll_index].ast_closebutton[1].py = 4
				ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 6 + 13)
				ist_tabs[ll_index].ast_closebutton[2].py = 4
				ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 6  + 13)
				ist_tabs[ll_index].ast_closebutton[3].py = 16
				ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 6 )
				ist_tabs[ll_index].ast_closebutton[4].py = 16
			ELSE
				ll_pad = 0
			END IF
			
			IF ist_tabs[ll_index].ab_selected THEN	
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_height - 4//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + 2//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_height - 2//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_height - 2 //bottom right corner
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_height - 4  //bottom right corner
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = 1 //bottom right corner
				
				ll_x += ll_textwidth + ll_pad + 3
			ELSE
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_height - 5//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + 1//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_height - 3//Top right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_height - 3 //bottom right corner
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + 2 + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_height - 5  //bottom right corner
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + 2 + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = 0 //bottom right corner
				
				ll_x += ll_textwidth +ll_pad + 4
			END IF	
			
		END IF
		
		IF ll_x < UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) THEN
			il_lastvisible = ll_index
			ll_last = ll_item
		END IF
		
	NEXT

	IF ib_stop THEN
		EXIT
	END IF
	
	IF il_firstvisible = 1 AND NOT ib_scrollrightmode THEN
		EXIT
	END IF
	
	//ll_last is the last visible item. ll_item is the total number of tabs
	IF ll_last < ll_item THEN
		IF NOT ib_scrollrightmode THEN
			//No Need to Shift anything over
			EXIT
		ELSE
			ib_stop = TRUE
			il_firstvisible = il_firstvisible + 1
		END IF
	ELSE
		IF il_firstvisible = 1 THEN
			EXIT
		ELSE
			//Try scrolling to the right
			ib_scrollrightmode = TRUE
			il_firstvisible = il_firstvisible - 1
		END IF
	END IF
	
LOOP

RETURN 1
end function

public function integer of_settabposition (long al_position);Long ll_index, ll_count

SetRedraw(FALSE)

ll_count = UpperBound(ist_tabs)

il_CurrentPosition = al_position

CHOOSE CASE al_position
	CASE TOP
		uo_tabs.Move(0,0)
		uo_navigation.Move(Width - uo_navigation.Width,0)
		uo_chevronclose.Move(Width - uo_chevronclose.Width,0)
	CASE BOTTOM
		uo_tabs.Move(0, Height - uo_tabs.Height)
		uo_navigation.Move(Width - uo_navigation.Width, Height - uo_tabs.Height - 2)
		uo_chevronclose.Move(Width - uo_chevronclose.Width, Height - uo_tabs.Height - 2)
END CHOOSE

FOR ll_index = 1 TO ll_count
	IF al_position = BOTTOM THEN
		ist_tabs[ll_index].ado_object.Move(4,5)	
	ELSE
		ist_tabs[ll_index].ado_object.Move(4,uo_tabs.Height)	
	END IF
NEXT
ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setenabled (long al_index, boolean ab_switch);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].ab_enabled = ab_switch
ist_tabs[al_index].ado_object.Enabled = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_boldselected (boolean ab_bold);ib_boldselected = ab_bold
ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settheme (long al_color);Long ll_index, ll_loop

il_currenttheme = al_color
ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settheme (string as_color);CHOOSE CASE Upper(as_color)
	CASE 'BLUE'
		of_SetTheme(BLUE)
	CASE 'SILVER'
		of_SetTheme(SILVER)
	CASE 'OLIVE'
		of_SetTheme(OLIVE)
	CASE 'CLASSIC'
		of_SetTheme(CLASSIC)
	CASE 'DEFAULT'
		of_SetTheme(DEFAULT)
	CASE ELSE
		of_SetTheme(CLASSIC)
END CHOOSE
		
RETURN 1
end function

public function integer of_vs2005 ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item, ll_pad, ll_last
Boolean ib_done, ib_scrollrightmode, ib_stop
Point lp_empty[]

DO UNTIL ib_done
	
	IF il_firstvisible = 0 THEN il_firstvisible = 1
	
	ll_count = UpperBound(ist_tabs)
	ll_y = 0
	ll_x = 9

	FOR ll_index = il_firstvisible TO ll_count
		IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
		
		ll_item++
		
		ist_tabs[ll_index].ast_closebutton = lp_empty
		ist_tabs[ll_index].ast_point = lp_empty
		st_1.Weight = 400
		
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
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
		
		//ll_textwidth = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		Point p
		
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		Long ll_height
		ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!)
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += 18
		ELSE
			ll_textwidth += 4
		END IF
		
		IF il_CurrentPosition = TOP THEN
				ll_height = ll_height - 1
				
				ll_x -= 9
				
				ist_tabs[ll_index].al_textx = ll_x + 20
				
				IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				   ib_displayclosebuttoninalltabs THEN
					ll_pad = 22 + 20
					ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 26)
					ist_tabs[ll_index].ast_closebutton[1].py = 6
					ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 26 + 13)
					ist_tabs[ll_index].ast_closebutton[2].py = 6
					ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 26 + 13)
					ist_tabs[ll_index].ast_closebutton[3].py = 18
					ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 26)
					ist_tabs[ll_index].ast_closebutton[4].py = 18
				ELSE
					ll_pad = 22
				END IF
				
				ist_tabs[ll_index].ast_point[1].px = ll_x  + 2//Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
				
				ist_tabs[ll_index].ast_point[2].px = ll_x + 17//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_y + 5//Top left corner
				
				ist_tabs[ll_index].ast_point[3].px = ll_x + 21//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_y + 2//Top right corner
				
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_y + 2//bottom right corner
				
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_y + 4 //bottom right corner
				
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = ll_y + ll_height //bottom right corner
			
				ll_x += ll_textwidth + ll_pad + 2
			
		ELSE
				ll_height = ll_height - 2
				
				ll_x -= 9
				
				ist_tabs[ll_index].al_textx = ll_x + 22
				
				IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				   ib_displayclosebuttoninalltabs THEN
					
					ll_pad = 22 + 20
					
					ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 26)
					ist_tabs[ll_index].ast_closebutton[1].py = 4
					ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 26 + 13)
					ist_tabs[ll_index].ast_closebutton[2].py = 4
					ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 26 + 13)
					ist_tabs[ll_index].ast_closebutton[3].py = 16
					ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 26)
					ist_tabs[ll_index].ast_closebutton[4].py = 16
				ELSE
					ll_pad = 22
				END IF
				
				ist_tabs[ll_index].ast_point[1].px = ll_x + 2 //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
				
				ist_tabs[ll_index].ast_point[2].px = ll_x + 17//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_height - 3//Top left corner
				
				ist_tabs[ll_index].ast_point[3].px = ll_x + 20//Top right corner
				ist_tabs[ll_index].ast_point[3].py = ll_height - 1//Top right corner
				
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_height -1//bottom right corner
				
				ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[5].py = ll_height - 4 //bottom right corner
				
				ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + ll_pad + 2//bottom right corner
				ist_tabs[ll_index].ast_point[6].py = 1 //bottom right corner
			
				ll_x += ll_textwidth + ll_pad + 2
			
		END IF
		
		IF ll_x < UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) THEN
			il_lastvisible = ll_index
			ll_last = ll_item
		END IF
		
	NEXT
	
	IF ib_stop THEN
		EXIT
	END IF
	
	IF il_firstvisible = 1 AND NOT ib_scrollrightmode THEN
		EXIT
	END IF
	
	//ll_last is the last visible item. ll_item is the total number of tabs
	IF ll_last < ll_item THEN
		IF NOT ib_scrollrightmode THEN
			//No Need to Shift anything over
			EXIT
		ELSE
			ib_stop = TRUE
			il_firstvisible = il_firstvisible + 1
		END IF
	ELSE
		IF il_firstvisible = 1 THEN
			EXIT
		ELSE
			//Try scrolling to the right
			ib_scrollrightmode = TRUE
			il_firstvisible = il_firstvisible - 1
		END IF
	END IF

	
LOOP

RETURN 1
end function

public function integer of_scrollleft ();il_firstvisible --

DO UNTIL ist_tabs[il_firstvisible].ab_visible
	il_firstvisible --
	
	IF il_firstvisible > UpperBound(ist_tabs) THEN
		EXIT
	END IF
LOOP

ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_scrollright ();il_firstvisible ++

DO UNTIL ist_tabs[il_firstvisible].ab_visible
	il_firstvisible ++
	
	IF il_firstvisible > UpperBound(ist_tabs) THEN
		EXIT
	END IF
LOOP

ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_closetab (long al_index);Long ll_newselected, ll_oldselected, ll_index, ll_count, ll_item
TabStrip lst_tabs[]
UserObject luo_selected

IF al_index <= 0 THEN RETURN 0
IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ll_oldselected = il_selected

IF NOT ib_closing THEN
	IF Event TabClosing(al_index) = 0 THEN
		RETURN 0
	END IF
	
	luo_selected = of_GetObject(il_selected)
	
END IF

IF IsValid(ist_tabs[al_index].aw_floatwindow) THEN
	IF Close(ist_tabs[al_index].aw_floatwindow) <> 1 THEN
		RETURN 0
	END IF
ELSE
	IF IsValid(ist_tabs[al_index].ado_object) THEN
		ist_tabs[al_index].ado_object.TriggerEvent("uimClose")
	
		ist_tabs[al_index].ado_object.Hide()
		inv_win32.SetParent(Handle(ist_tabs[al_index].ado_object), Handle(iw_parent))
		iw_parent.CloseUserObject(ist_tabs[al_index].ado_object)
	ELSE
		IF IsValid(ist_tabs[al_index].aw_window) THEN
			IF Close(ist_tabs[al_index].aw_window) <> 1 THEN
				RETURN 0
			END IF
		END IF
	END IF
END IF

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ll_index <> al_index THEN
		ll_item++
		lst_tabs[ll_item] = ist_tabs[ll_index]
	END IF
NEXT

ist_tabs = lst_tabs
il_index = 0
ib_dirty = TRUE

SetRedraw(TRUE)
Event TabClosed(al_index)

IF NOT ib_closing THEN
	of_SelectTab(of_GetNextTab(al_index - 1))
END IF

RETURN 1
end function

public function integer of_closeselectedtab ();RETURN of_CloseTab(il_selected)

end function

public function long of_getselectedtab ();RETURN il_selected
end function

public function integer of_closealltabs ();Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	of_CloseTab(1)
NEXT

RETURN 1
end function

public function long of_gettabcount ();RETURN UpperBound(ist_tabs)
end function

public function userobject of_getobject (long al_index);UserObject uo

IF al_index <= 0 OR &
   al_index > UpperBound(ist_tabs) THEN
	RETURN uo
END IF

RETURN ist_tabs[al_index].ado_object
end function

public function integer of_settext (long al_index, string as_text);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].as_tab_text = as_text

IF IsValid(ist_tabs[al_index].aw_floatwindow) THEN
	ist_tabs[al_index].aw_floatwindow.of_SetText(as_text)
END IF

ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function String of_gettext (long al_index);RETURN ist_tabs[al_index].as_tab_text
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
		
		IF uo_tabs.ib_dragging THEN
			ist_tabs[al_index].al_backcolor1 = RGB(225,225,225)// of_GetColor('HOVER1')
			ist_tabs[al_index].al_backcolor2 = RGB(192,192,192)//of_GetColor('HOVER2')
		ELSE
			ist_tabs[al_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[al_index].al_backcolor2 = of_GetColor('HOVER2')
		END IF
		
		
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

uo_tabs.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_mouseleave ();Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
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
NEXT

ib_inclose = FALSE
ib_inclose = FALSE

il_index = 0

uo_tabs.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (long al_index, long al_image);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].al_pic_index = al_image
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settext (userobject auo_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SetText(ll_index, as_text)
	END IF
NEXT

RETURN 0
end function

public function integer of_setimage (userobject auo_object, long al_image);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SetImage(ll_index, al_image)
	END IF
NEXT

RETURN 0
end function

public function integer of_showclosebutton ();IF NOT ib_displayclosebuttoninselectedtab THEN
	
	uo_chevronclose.of_DisplayCloseButton(TRUE)
	
	IF ib_hideclosebutton THEN
		uo_navigation.Width = uo_navigation.Width + 89
		ib_hideclosebutton = FALSE
	END IF
	TriggerEvent('resize')
END IF

RETURN 1
end function

public function integer of_setenabled (userobject auo_object, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SetEnabled(ll_index, ab_switch)
	END IF
NEXT

RETURN 0
end function

public function integer of_settiptext (long al_index, string as_text);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].as_tooltip = as_text
RETURN 1
end function

public function integer of_settiptext (userobject auo_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SetTipText(ll_index, as_text)
	END IF
NEXT

RETURN 0
end function

public function string of_gettiptext (long al_index);RETURN ist_tabs[al_index].as_tooltip
end function

public function integer of_settextcolor (userobject auo_object, long al_color);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SetTextColor(ll_index, al_color)
	END IF
NEXT

RETURN 0
end function

public function integer of_settextcolor (long al_index, long al_color);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].al_textcolor = al_color
ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setvisible (long al_index, boolean ab_switch);IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ib_dirty = TRUE
ist_tabs[al_index].ab_visible = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setvisible (userobject auo_object, boolean ab_switch);Long ll_index, ll_count, ll_return

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		ll_return = of_SetVisible(ll_index, ab_switch)
		
		IF NOT ab_switch THEN auo_object.Visible = FALSE
		
		EXIT
	END IF
NEXT

RETURN ll_return
end function

public function boolean of_isvisible (long al_index);IF al_index > UpperBound(ist_tabs) THEN RETURN FALSE

RETURN ist_tabs[al_index].ab_visible
end function

public function boolean of_isenabled (long al_index);IF al_index > UpperBound(ist_tabs) THEN RETURN FALSE

RETURN ist_tabs[al_index].ab_enabled
end function

public function integer of_hideclosebutton ();IF NOT ib_displayclosebuttoninselectedtab THEN
	
	uo_chevronclose.of_DisplayCloseButton(FALSE)
	
	IF NOT ib_hideclosebutton THEN
		uo_navigation.Width = uo_navigation.Width - 89
		ib_hideclosebutton = TRUE
	END IF
	TriggerEvent('resize')
END IF

RETURN 1
end function

public function integer of_hidearrows ();IF NOT ib_hidearrows THEN
	uo_navigation.Width = uo_navigation.Width - 151
	ib_hidearrows = TRUE
END IF
TriggerEvent('resize')
RETURN 1
end function

public function integer of_showarrows ();IF ib_hidearrows THEN
	uo_navigation.Width = uo_navigation.Width + 151
	ib_hidearrows = FALSE
	of_HideChevron()
END IF

TriggerEvent('resize')
RETURN 1
end function

public function integer of_office2007 ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad, ll_last, ll_item
Boolean ib_done, ib_scrollrightmode, ib_stop
Point lp_empty[]

DO UNTIL ib_done
	
	ll_count = UpperBound(ist_tabs)
	ll_y = 2
	ll_x = 0
	
	IF il_firstvisible = 0 THEN il_firstvisible = 1
	
	FOR ll_index = il_firstvisible TO ll_count
		IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
		
		ll_item++
		
		ist_tabs[ll_index].ast_point = lp_empty
		ist_tabs[ll_index].ast_closebutton = lp_empty
		st_1.Weight = 400
		
		IF il_index = ll_index THEN
			ist_tabs[ll_index].ab_mouseover = TRUE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('HOVER1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('HOVER2')
		ELSE
			ist_tabs[ll_index].ab_mouseover = FALSE
			ist_tabs[ll_index].al_backcolor1 = of_GetColor('BACKCOLOR1')
			ist_tabs[ll_index].al_backcolor2 = of_GetColor('BACKCOLOR2')
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
		
		//ll_textwidth = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		Point p
		
		p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
		ll_textwidth = p.PX
		ist_tabs[ll_index].al_textwidth = ll_textwidth
		
		Long ll_height
		ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!)
		
		IF ist_tabs[ll_index].al_pic_index > 0 THEN
			ll_textwidth += 18
		ELSE
			ll_textwidth += 4
		END IF
		
		IF (ib_displayclosebuttoninselectedtab AND ist_tabs[ll_index].ab_selected) OR &
				   ib_displayclosebuttoninalltabs THEN
					
			ll_pad = 2 + 20
			
			IF il_CurrentPosition = TOP THEN
				ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 6)
				ist_tabs[ll_index].ast_closebutton[1].py = 6
				ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 6 + 13)
				ist_tabs[ll_index].ast_closebutton[2].py = 6
				ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 6  + 13)
				ist_tabs[ll_index].ast_closebutton[3].py = 18
				ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 6 )
				ist_tabs[ll_index].ast_closebutton[4].py = 18
			ELSE
				ist_tabs[ll_index].ast_closebutton[1].px = (ll_x + ll_textwidth + 6)
				ist_tabs[ll_index].ast_closebutton[1].py = 4
				ist_tabs[ll_index].ast_closebutton[2].px = (ll_x + ll_textwidth + 6 + 13)
				ist_tabs[ll_index].ast_closebutton[2].py = 4
				ist_tabs[ll_index].ast_closebutton[3].px = (ll_x + ll_textwidth + 6  + 13)
				ist_tabs[ll_index].ast_closebutton[3].py = 16
				ist_tabs[ll_index].ast_closebutton[4].px = (ll_x + ll_textwidth + 6 )
				ist_tabs[ll_index].ast_closebutton[4].py = 16
			END IF
		ELSE
			ll_pad = 2
		END IF
		
		IF il_CurrentPosition = TOP THEN
	
				ist_tabs[ll_index].al_textx = ll_x
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = ll_y + ll_height //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x //Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_y //Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[3].py = ll_y //bottom right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = ll_y + ll_height //bottom right corner
			
				ll_x += ll_textwidth + ll_pad
				
			
		ELSE
	
				ist_tabs[ll_index].al_textx = ll_x
				
				ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
				ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
				ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
				ist_tabs[ll_index].ast_point[2].py = ll_height - 3//Top left corner
				ist_tabs[ll_index].ast_point[3].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[3].py = ll_height - 3 //bottom right corner
				ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + ll_pad//bottom right corner
				ist_tabs[ll_index].ast_point[4].py = 1 //bottom right corner
				
				ll_x += ll_textwidth + ll_pad
			
		END IF
		
		IF ll_x + 10 < UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) THEN
			il_lastvisible = ll_index
			ll_last = ll_item
		END IF
		
	NEXT

	IF ib_stop THEN
		EXIT
	END IF
	
	IF il_firstvisible = 1 AND NOT ib_scrollrightmode THEN
		EXIT
	END IF
	
	//ll_last is the last visible item. ll_item is the total number of tabs
	IF ll_last < ll_item THEN
		IF NOT ib_scrollrightmode THEN
			//No Need to Shift anything over
			EXIT
		ELSE
			ib_stop = TRUE
			il_firstvisible = il_firstvisible + 1
		END IF
	ELSE
		IF il_firstvisible = 1 THEN
			EXIT
		ELSE
			//Try scrolling to the right
			ib_scrollrightmode = TRUE
			il_firstvisible = il_firstvisible - 1
		END IF
	END IF

LOOP

RETURN 1
end function

public function integer of_hidetabs ();ib_hidetabs = TRUE

uo_tabs.Hide()
uo_navigation.Hide()

TriggerEvent('resize')



RETURN 1
end function

public function integer of_showtabs ();ib_hidetabs = FALSE

uo_tabs.Show()
uo_navigation.Show()

TriggerEvent('resize')

RETURN 1
end function

public function long of_opentab (ref userobject a_object, string as_text, long al_picindex);PowerObject po

RETURN of_OpenTab(a_object, po, as_text, al_picindex)
end function

public function long of_opentab (ref window a_object, string as_text, long al_picindex);PowerObject po

RETURN of_OpenTab(a_object, po, as_text, al_picindex)
end function

public function integer of_removetab (long al_index);Long ll_newselected, ll_oldselected, ll_index, ll_count, ll_item
TabStrip lst_tabs[]
UserObject luo_selected
Window lw_selected

IF al_index <= 0 THEN RETURN 0
IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ll_oldselected = il_selected

luo_selected = of_GetObject(il_selected)

IF IsValid(ist_tabs[al_index].ado_object) THEN
	ist_tabs[al_index].ado_object.Hide()
	inv_win32.SetParent(Handle(ist_tabs[al_index].ado_object), Handle(iw_parent))
END IF


ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ll_index <> al_index THEN
		ll_item++
		lst_tabs[ll_item] = ist_tabs[ll_index]
	END IF
NEXT

ist_tabs = lst_tabs
il_index = 0
ib_dirty = TRUE

SetRedraw(TRUE)

IF NOT ib_closing THEN
	of_SelectTab(of_GetNextTab(al_index - 1))
END IF

RETURN 1
end function

public function window of_getwindow (long al_index);Window lw_null

IF al_index > UpperBound(ist_tabs) OR &
	al_index <= 0 THEN
	
	RETURN lw_null
END IF

RETURN ist_tabs[al_index].aw_window
end function

public function long of_opentab (ref window a_object, powerobject apo_parm, string as_text, long al_picindex);RETURN of_OpenTab(a_object, "", apo_parm, as_text, al_picindex)
end function

public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex);Long ll_item
Long ll_x, ll_y, ll_width, ll_height

IF Len(Trim(as_type)) > 0 THEN
	OpenWithParm(a_object, apo_parm, as_type, iw_parent)
ELSE
	OpenWithParm(a_object, apo_parm, iw_parent)
END IF

inv_win32.SetParent(Handle(a_object), Handle(THIS))
inv_win32.SetWindowLong(Handle(a_object), -16, 1174405120)


ll_item = UpperBound(ist_tabs) + 1

ist_tabs[ll_item].as_tab_text = as_text
ist_tabs[ll_item].al_pic_index = al_picindex
ist_tabs[ll_item].ab_enabled = TRUE
ist_tabs[ll_item].ab_visible = TRUE
ist_tabs[ll_item].ab_canclose = TRUE

IF il_CurrentPosition = TOP THEN
	ll_y= uo_tabs.Height
ELSE
	ll_y = 5
END IF

ll_x = 4
ll_width = Width - 8
ll_height = Height - uo_tabs.Height - 4

a_object.Move(ll_x, ll_y)
a_object.Resize(ll_width, ll_height)

ist_tabs[ll_item].aw_window = a_object

of_UpdatePoints()

Return ll_item

end function

public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, long al_picindex);RETURN of_OpenTab(a_object, "", apo_parm, as_text, al_picindex)
end function

public function integer of_showchevron ();uo_chevronclose.Show()
uo_navigation.Hide()
of_HideArrows()
RETURN 1
end function

public function integer of_hidechevron ();uo_chevronclose.Hide()
uo_navigation.Show()

RETURN 1
end function

public function integer of_refreshtabmenu (ref menu a_menu);Long ll_index, ll_count, ll_start, lm_MenuCount
Boolean lb_morewindows
m_powerdockmenu lm_newmenus[]
Menu lm_ExistingMenu[]

IF NOT IsValid(a_menu) THEN RETURN 0

lm_MenuCount = UpperBound(a_menu.Item)
ll_count = of_GetTabCount()

IF ll_count > 9 THEN
	lb_morewindows = TRUE
	ll_count = 8
END IF

FOR ll_index = 1 TO ll_count
	
	IF of_IsVisible(ll_index) THEN
		ll_start++
		
		lm_newmenus[ll_start] = CREATE m_powerdockmenu
		lm_newmenus[ll_start].Text = String(ll_index) + "  " + of_GetText(ll_index)
		lm_newmenus[ll_start].iuo_parent = THIS
		lm_newmenus[ll_start].il_index = ll_index
		
		IF of_GetSelectedTab() = ll_index THEN
			lm_newmenus[ll_start].Checked = TRUE
		END IF
	END IF
NEXT

//Clean-Up Dynamic menu items
ll_count = UpperBound(a_menu.Item)
FOR ll_index = ll_count TO lm_MenuCount + 1 STEP -1
	DESTROY a_menu.Item[ll_index]
NEXT

ll_start = lm_MenuCount

//Add Separator
IF UpperBound(lm_newmenus) > 0 THEN
	Menu lMenuSep	
	lMenuSep = CREATE Menu
	lMenuSep.Text = "-"
	ll_start++
	a_menu.Item[ll_start] = lMenuSep
END IF

//Add Dynamic Menu Items
ll_count = UpperBound(lm_newmenus)
FOR ll_index = 1 TO ll_count
	ll_start++
	a_menu.Item[ll_start] = lm_newmenus[ll_index]
NEXT

IF lb_morewindows THEN
	
	m_powerdockmenu lMenuMore	
	lMenuMore = CREATE m_powerdockmenu
	lMenuMore.Text = "More Windows..."
	lMenuMore.iuo_parent = THIS
	lMenuMore.ib_morewindows = TRUE
	ll_start++
	a_menu.Item[ll_start] = lMenuMore
	
END IF

a_menu.Hide()
a_menu.Show()

RETURN 1
end function

public function integer of_displayclosebuttonintab (boolean ab_switch);//ab_switch = true - display close button in tab
//ab_switch = false - display close button at end of tab strip

uo_chevronclose.of_DisplayCloseButton(NOT ab_switch)

IF ab_switch THEN
	of_HideCloseButton()
ELSE
	of_ShowCloseButton()
END IF

//Set this after so the above display functions are not affected
ib_displayclosebuttoninselectedtab = ab_switch

TriggerEvent("Resize")

RETURN 1

end function

public function integer of_highlightclosebutton (long xpos, long ypos);
RETURN of_HighlightCloseButton(il_selected, xpos, ypos)

end function

public function integer of_highlightclosebutton (long al_index, long xpos, long ypos);
IF al_index <= 0 OR al_index > UpperBound(ist_tabs) THEN RETURN 0

IF of_IsMouseOverX(al_index, xpos, ypos) THEN
	IF NOT ib_inclose THEN
		ib_inclose = TRUE
		ist_tabs[al_index].ab_mouseoverclose = TRUE
		ib_dirty = TRUE
		uo_tabs.SetRedraw(TRUE)
	END IF
ELSE
	IF ib_inclose THEN
		ib_inclose = FALSE
		ist_tabs[al_index].ab_mouseoverclose = FALSE
		ib_dirty = TRUE
		uo_tabs.SetRedraw(TRUE)
	END IF
END IF

RETURN 1

end function

public function boolean of_ismouseoverx (long xpos, long ypos);
RETURN of_IsMouseOverX(il_selected, xpos, ypos)
end function

public function boolean of_ismouseoverx (long al_index, long xpos, long ypos);//find out if a tab was clicked
//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

IF NOT (ib_displayclosebuttoninselectedtab OR ib_displayclosebuttoninalltabs) THEN RETURN FALSE
IF al_index <= 0 OR al_index > UpperBound(ist_tabs) THEN RETURN FALSE

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

lul_rgn = inv_win32.CreatePolygonRgn(ist_tabs[al_index].ast_closebutton, UPPERBOUND(ist_tabs[al_index].ast_closebutton), 1)

IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
	inv_win32.DeleteObject(lul_rgn)
	RETURN TRUE
ELSE
	inv_win32.DeleteObject(lul_rgn)
	RETURN FALSE
END IF

end function

public function integer of_ribbon ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_pad
Point lp_empty[]

ll_count = UpperBound(ist_tabs)
ll_y = 0
ll_x = 4

IF il_firstvisible = 0 THEN il_firstvisible = 1

FOR ll_index = il_firstvisible TO ll_count
	IF NOT ist_tabs[ll_index].ab_visible THEN CONTINUE
	
	ist_tabs[ll_index].al_style = il_CurrentStyle
	ist_tabs[ll_index].ast_point = lp_empty
	ist_tabs[ll_index].ast_closebutton = lp_empty
	st_1.Weight = 400
	
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
	
	//ll_textwidth = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
	Point p
	
	p = of_GetTextWidth(ist_tabs[ll_index].as_tab_text, ib_boldselected AND ist_tabs[ll_index].ab_selected)
	ll_textwidth = p.PX
	
	Long ll_height
	ll_height = UnitsToPixels(uo_tabs.Height, YUnitsToPixels!) - 1
	
	ist_tabs[ll_index].al_textwidth = ll_textwidth
	
	IF ist_tabs[ll_index].al_pic_index > 0 THEN
		ll_textwidth += 19
	ELSE
		ll_textwidth += 5
	END IF
	
	ll_textwidth += 10
	
	IF il_CurrentPosition = TOP THEN
			ist_tabs[ll_index].al_textx = ll_x + 7
			
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
			
			ll_x += ll_textwidth + 2
		
	ELSE
			ist_tabs[ll_index].al_textx = ll_x
			
			ist_tabs[ll_index].ast_point[1].px = ll_x //Bottom left corner
			ist_tabs[ll_index].ast_point[1].py = 1 //Bottom left corner
			ist_tabs[ll_index].ast_point[2].px = ll_x//Top left corner
			ist_tabs[ll_index].ast_point[2].py = ll_height - 5//Top left corner
			ist_tabs[ll_index].ast_point[3].px = ll_x + 2//Top right corner
			ist_tabs[ll_index].ast_point[3].py = ll_height - 3//Top right corner
			ist_tabs[ll_index].ast_point[4].px = ll_x + ll_textwidth + 0//bottom right corner
			ist_tabs[ll_index].ast_point[4].py = ll_height - 3 //bottom right corner
			ist_tabs[ll_index].ast_point[5].px = ll_x + ll_textwidth + 2//bottom right corner
			ist_tabs[ll_index].ast_point[5].py = ll_height - 5  //bottom right corner
			ist_tabs[ll_index].ast_point[6].px = ll_x + ll_textwidth + 2//bottom right corner
			ist_tabs[ll_index].ast_point[6].py = 0 //bottom right corner
			
			ll_x += ll_textwidth + 8
		
	END IF
	
	IF ll_x < UnitsToPixels(uo_tabs.Width, XUnitsToPixels!) THEN
		il_lastvisible = ll_index
	END IF
	
NEXT

RETURN 1
end function

public function integer of_setfontname (string as_font);FontName = as_font
ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (long al_size);Point p

FontSize = al_size

p = of_GetTextWidth('ABCDEFGHIJKLMNOPQRSTUVWQYXabcdefghijklmnopqrstuvwxyz', ib_boldselected)

p.PY = p.PY + 3

IF p.PY < 18 THEN
	p.PY = 18
END IF

uo_tabs.Height = PixelsToUnits(p.PY, YPixelsToUnits!)
uo_navigation.Height = uo_tabs.Height
uo_chevronclose.Height = uo_tabs.Height
	
TriggerEvent('Resize')

ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function point of_gettextwidth (string as_text, boolean ab_bold);//ULong lul_Handle, lul_hDC, lul_hFont

ULong lul_Handle, lul_hDC, lul_hFont
SIZE lstr_size
long ll_x
n_cst_xplistbar_painter lnv_gradient

ll_x = 0

lul_Handle = Handle(st_1)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_gradient.of_SetHdc(lul_hDC)
lnv_gradient.of_DrawText(THIS, as_text, 0, FontName, FontSize, ab_bold, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 50,FALSE, FALSE, false, false) 

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

Point p

p.PX = UnitsToPixels(lnv_gradient.il_newWidth, XUnitsToPixels!) + 4
p.PY = UnitsToPixels(lnv_gradient.il_newHeight, YUnitsToPixels!) + 4

RETURN p
 
end function

public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex, long al_parentindex);Long ll_item

ll_item =  of_OpenTab(a_object, as_type, apo_parm, as_text, al_picindex)
ist_tabs[ll_item].al_parentindex = al_parentindex

RETURN ll_item

end function

public function integer of_showparenttabs (long al_parentindex);Long ll_index, ll_count, ll_selected=0
Boolean	lb_Visible

SetRedraw(FALSE)

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].al_parentindex = al_parentindex THEN
		lb_Visible = TRUE
		// Get the First and Last Tabs
		IF ll_index < il_FirstVisible THEN
			il_FirstVisible = ll_index
		END IF
		IF ll_index > il_LastVisible THEN
			il_LastVisible = ll_index
		END IF
		// Need to find the Tab that was Selected for the Parent!
		IF ist_tabs[ll_index].ab_selected THEN
			ll_selected = ll_index
		END IF
	ELSE
		lb_Visible = FALSE
	END IF
	ist_tabs[ll_index].ab_visible = lb_Visible
	CHOOSE CASE TRUE
		CASE IsValid(ist_tabs[ll_index].aw_window)
			ist_tabs[ll_index].aw_window.visible = lb_Visible
		CASE IsValid(ist_tabs[ll_index].ado_object)
			ist_tabs[ll_index].ado_object.visible = lb_Visible
	END CHOOSE
NEXT

// Select the Tab Last!
IF ll_selected > 0 THEN
	of_SelectTab(ll_selected)
END IF

This.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setbackcolor (long al_color);il_backcolor = al_color
THIS.Backcolor = al_color
RETURN 1
end function

public function integer of_setvistastyle (boolean ab_displayasvista);ib_vistastyle = ab_displayasvista
SetRedraw(TRUE)

RETURN 1
end function

public function long of_opentab (ref userobject a_object, string as_text, string as_image);RETURN of_OpenTab(a_object, '', as_text, as_image)
end function

public function long of_opentab (ref window a_object, string as_text, string as_image);PowerObject po

Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, po, as_text, ll_picindex)
end function

public function integer of_setredraw ();ib_dirty = TRUE
uo_tabs.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_allowtabdragging (boolean ab_switch);ib_allowtabdrag = ab_switch

RETURN 1
end function

public function integer of_displayclosebuttoninalltabs (boolean ab_switch);//ab_switch = true - display close button in tab
//ab_switch = false - display close button at end of tab strip

uo_chevronclose.of_DisplayCloseButton(NOT ab_switch)

IF ab_switch THEN
	of_HideCloseButton()
ELSE
	of_ShowCloseButton()
END IF

//Set this after so the above display functions are not affected
ib_displayclosebuttoninalltabs = ab_switch

TriggerEvent("Resize")

RETURN 1

end function

public function integer of_tabtriggerevent (string as_event, long al_word, long al_long);Window l_window
UserObject l_object
Long ll_index, ll_count

ll_count = of_GetTabCount()

FOR ll_index = 1 TO ll_count

	l_window = of_GetWindow(ll_index)
	
	IF IsValid(l_window) THEN
		l_window.TriggerEvent(as_event, al_word, al_long)
		RETURN 1
	END IF
	
	l_object = of_GetObject(ll_index)
	
	IF IsValid(l_object) THEN
		l_object.TriggerEvent(as_event, al_word, al_long)
		RETURN 2
	END IF

NEXT



RETURN 1
end function

public function integer of_tabtriggerevent (string as_event);RETURN of_TabTriggerEvent(as_event, 0, 0)
end function

public function integer of_activetabtriggerevent (string as_event, long al_word, long al_long);Window l_window
UserObject l_object

l_window = of_GetWindow(il_selected)

IF IsValid(l_window) THEN
	l_window.TriggerEvent(as_event, al_word, al_long)
	RETURN 1
END IF

l_object = of_GetObject(il_selected)

IF IsValid(l_object) THEN
	l_object.TriggerEvent(as_event, al_word, al_long)
	RETURN 2
END IF

RETURN 0
end function

public function integer of_activetabtriggerevent (string as_event);RETURN of_ActiveTabTriggerEvent(as_event, 0, 0)
end function

public function long of_gettabheight ();RETURN uo_tabs.Height
end function

public function integer of_attachtab (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_AttachTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function long of_getnexttab (long al_index);Long ll_prev, ll_next
Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ab_enabled AND ist_tabs[ll_index].ab_visible THEN
		IF ll_index <= al_index THEN
			ll_prev = ll_index
		END IF
		
		IF ll_index > al_index THEN
			ll_next = ll_index
			EXIT
		END IF
	END IF
NEXT

RETURN Max(ll_prev, ll_next)
end function

public function integer of_detachtab (long al_index, window aw_float);Long ll_newselected, ll_oldselected, ll_index, ll_count, ll_item
TabStrip lst_tabs[]
UserObject luo_selected
Window lw_selected

IF al_index <= 0 THEN RETURN 0
IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ll_oldselected = il_selected

luo_selected = of_GetObject(il_selected)

IF IsValid(ist_tabs[al_index].ado_object) THEN
	ist_tabs[al_index].ado_object.Hide()
	inv_win32.SetParent(Handle(ist_tabs[al_index].ado_object), Handle(iw_parent))
END IF

ist_tabs[al_index].ab_visible = FALSE
ist_tabs[al_index].aw_floatwindow = aw_float

ll_count = UpperBound(ist_tabs)

il_index = 0
ib_dirty = TRUE

of_SelectTab(of_GetNextTab(al_index))

SetRedraw(TRUE)


RETURN 1
end function

public function integer of_detachtab (userobject auo_object, window aw_float);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		of_DetachTab(ll_index, aw_float)
		EXIT
	END IF
NEXT

RETURN 1
end function

public function long of_attachtab (long al_index);Window lw_null

ist_tabs[al_index].ab_visible = TRUE
ist_tabs[al_index].aw_floatwindow = lw_null

IF IsValid(ist_tabs[al_index].ado_object) THEN
	
	inv_win32.SetParent(Handle(ist_tabs[al_index].ado_object), Handle(THIS))
	
	IF il_CurrentPosition = TOP THEN
		ist_tabs[al_index].ado_object.Y = uo_tabs.Height
	ELSE
		ist_tabs[al_index].ado_object.Y = 5
	END IF
	
	ist_tabs[al_index].ado_object.X = 4
	ist_tabs[al_index].ado_object.Width = Width - 8
	ist_tabs[al_index].ado_object.Height = Height - uo_tabs.Height - 4
	ist_tabs[al_index].ado_object.Hide()
END IF

IF IsValid(ist_tabs[al_index].aw_window) THEN
	inv_win32.SetParent(Handle(ist_tabs[al_index].aw_window), Handle(THIS))
	
	IF il_CurrentPosition = TOP THEN
		ist_tabs[al_index].aw_window.Y = uo_tabs.Height
	ELSE
		ist_tabs[al_index].aw_window.Y = 5
	END IF
	
	ist_tabs[al_index].aw_window.X = 4
	ist_tabs[al_index].aw_window.Width = Width - 8
	ist_tabs[al_index].aw_window.Height = Height - uo_tabs.Height - 4
	ist_tabs[al_index].aw_window.Hide()
END IF


of_UpdatePoints()

of_SelectTab(al_index)

Return 1

end function

public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, long al_picindex);Long ll_item

ll_item = UpperBound(ist_tabs) + 1

ist_tabs[ll_item].as_tab_text = as_text
ist_tabs[ll_item].al_pic_index = al_picindex
ist_tabs[ll_item].ab_enabled = TRUE
ist_tabs[ll_item].ab_visible = TRUE
ist_tabs[ll_item].ab_canclose = TRUE

IF NOT IsValid(a_object) THEN
	IF IsValid(apo_parm) THEN
		IF Len(Trim(as_type)) > 0 THEN
			iw_parent.OpenUserObjectWithParm(a_object, apo_parm, as_type)
		ELSE
			iw_parent.OpenUserObjectWithParm(a_object, apo_parm)
		END IF
	ELSE
		IF Len(Trim(as_type)) > 0 THEN
			iw_parent.OpenUserObject(a_object, as_type)
		ELSE
			iw_parent.OpenUserObject(a_object)
		END IF
	END IF
END IF


inv_win32.SetParent(Handle(a_object), Handle(THIS))

IF il_CurrentPosition = TOP THEN
	a_object.Y = uo_tabs.Height
ELSE
	a_object.Y = 5
END IF

a_object.X = 4
a_object.Width = Width - 8
a_object.Height = Height - uo_tabs.Height - 4
a_object.Hide()

ist_tabs[ll_item].ado_object = a_object

of_UpdatePoints()

a_object.TriggerEvent("uimOpen")

Return ll_item

end function

public function long of_opentab (ref userobject a_object, string as_type, string as_text, string as_image);PowerObject po

Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, as_type, po, as_text, ll_picindex)
end function

public function long of_opentab (ref userobject a_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, as_type, apo_parm, as_text, ll_picindex)
end function

public function long of_opentab (ref userobject a_object, powerobject apo_parm, string as_text, string as_image);Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, "", apo_parm, as_text, ll_picindex)
end function

public function boolean of_canclose (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_CanClose(ll_index)
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_canclose (long al_index);IF al_index <= 0 THEN RETURN FALSE
IF al_index > UpperBound(ist_tabs) THEN RETURN FALSE

RETURN ist_tabs[al_index].ab_CanClose
end function

public function integer of_canclose (userobject auo_object, boolean ab_canclose);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_CanClose(ll_index, ab_canclose)
	END IF
NEXT

RETURN 0
end function

public function integer of_canclose (long al_index, boolean ab_canclose);IF al_index <= 0 THEN RETURN 0
IF al_index > UpperBound(ist_tabs) THEN RETURN 0

ist_tabs[al_index].ab_CanClose = ab_canclose

RETURN 1

end function

public function boolean of_istabfloating (window aw_window);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_window THEN
		RETURN IsValid(ist_tabs[ll_index].aw_floatwindow)
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_istabfloating (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN IsValid(ist_tabs[ll_index].aw_floatwindow)
	END IF
NEXT

RETURN FALSE
end function

public function long of_opentab (ref userobject a_object, string as_type, string as_text, long al_picindex);PowerObject po

RETURN of_OpenTab(a_object, as_type, po, as_text, al_picindex)
end function

public function long of_opentab (ref window a_object, string as_type, string as_text, string as_image);PowerObject po

Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, as_type, po, as_text, ll_picindex)
end function

public function long of_opentab (ref window a_object, string as_type, string as_text, long al_picindex);PowerObject po

RETURN of_OpenTab(a_object, as_type, po, as_text, al_picindex)
end function

public function long of_opentab (ref window a_object, string as_type, powerobject apo_parm, string as_text, string as_image);Long ll_picindex

IF Len(Trim(as_image)) > 0 THEN
	ll_picindex = of_AddImage(as_image)
END IF

RETURN of_OpenTab(a_object, as_type, apo_parm, as_text, ll_picindex)
end function

public function integer of_closetab (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_CloseTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_closetab (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_CloseTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function string of_gettext (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_GetText(ll_index)
	END IF
NEXT

RETURN ''
end function

public function string of_gettext (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_GetText(ll_index)
	END IF
NEXT

RETURN ''
end function

public function boolean of_isenabled (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_IsEnabled(ll_index)
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_isenabled (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_IsEnabled(ll_index)
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_isvisible (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_IsVisible(ll_index)
		EXIT
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_isvisible (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_IsVisible(ll_index)
		EXIT
	END IF
NEXT

RETURN FALSE
end function

public function integer of_removetab (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_RemoveTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_removetab (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_RemoveTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_selecttab (userobject auo_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].ado_object = auo_object THEN
		RETURN of_SelectTab(ll_index)
	END IF
NEXT

RETURN 0

end function

public function integer of_attachtab (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_AttachTab(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_detachtab (window aw_object, window aw_float);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		of_DetachTab(ll_index, aw_float)
		EXIT
	END IF
NEXT

RETURN 1
end function

public function integer of_selecttab (window aw_object);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SelectTab(ll_index)
	END IF
NEXT

RETURN 0

end function

public function integer of_setenabled (window aw_object, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SetEnabled(ll_index, ab_switch)
	END IF
NEXT

RETURN 0
end function

public function integer of_setimage (window aw_object, long al_image);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SetImage(ll_index, al_image)
	END IF
NEXT

RETURN 0
end function

public function integer of_settext (window aw_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SetText(ll_index, as_text)
	END IF
NEXT

RETURN 0
end function

public function integer of_settextcolor (window aw_object, long al_color);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SetTextColor(ll_index, al_color)
	END IF
NEXT

RETURN 0
end function

public function integer of_settiptext (window aw_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		RETURN of_SetTipText(ll_index, as_text)
	END IF
NEXT

RETURN 0
end function

public function integer of_setvisible (window aw_object, boolean ab_switch);Long ll_index, ll_count, ll_return

ll_count = UpperBound(ist_tabs)

FOR ll_index = 1 TO ll_count
	IF ist_tabs[ll_index].aw_window = aw_object THEN
		ll_return = of_SetVisible(ll_index, ab_switch)
		
		IF NOT ab_switch THEN aw_object.Visible = FALSE
		
		EXIT
	END IF
NEXT

RETURN ll_return
end function

public function integer of_setimage (window aw_object, string as_image);RETURN of_SetImage(aw_object, of_AddImage(as_image))
end function

public function integer of_setimage (userobject auo_object, string as_image);RETURN of_SetImage(auo_object, of_AddImage(as_image))
end function

public function integer of_setimage (long al_index, string as_image);RETURN of_SetImage(al_index, of_AddImage(as_image))
end function

on u_cst_tabcontrol.create
int iCurrent
call super::create
this.uo_navigation=create uo_navigation
this.uo_tabs=create uo_tabs
this.uo_chevronclose=create uo_chevronclose
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_navigation
this.Control[iCurrent+2]=this.uo_tabs
this.Control[iCurrent+3]=this.uo_chevronclose
this.Control[iCurrent+4]=this.st_1
end on

on u_cst_tabcontrol.destroy
call super::destroy
destroy(this.uo_navigation)
destroy(this.uo_tabs)
destroy(this.uo_chevronclose)
destroy(this.st_1)
end on

event constructor;call super::constructor;n_cst_theme lnv_Theme
Long ll_color1
Long ll_color2
message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

of_GetWindow()
uo_chevronclose.iuo_parent = THIS

If lnv_Theme.of_IsAppThemed() And lnv_Theme.of_IsWindowsXp() Then
	ll_Color1 = lnv_Theme.of_GetColor( 1, 1, 3821 )
	ll_Color2 = lnv_Theme.of_GetColor( 1, 1, 3805 )
	Choose Case ll_Color1
		Case 15029248	// Blue
			of_SetTheme(BLUE)
		Case 12493732	//	Silver
			of_SetTheme(SILVER)
		Case 8829098	// olive green
			of_SetTheme(OLIVE)
		Case Else
			of_SetTheme(CLASSIC)
	End Choose
Else
	IF lnv_Theme.of_IsWindowsVista() THEN
		of_SetTheme(BLUE)
	ELSE
		of_SetTheme(CLASSIC)
	END IF
End If

TriggerEvent('resize')

Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

DESTROY l_message
end event

event destructor;ib_closing = TRUE
of_CloseAllTabs()
end event

event onpaint;call super::onpaint;Long hRPen, ll_dc, ll_rect

ll_dc = inv_win32.GetDC(Handle(THIS))

hRPen = inv_win32.CreatePen(0,0,of_GetColor('BORDER'))
inv_win32.SelectObject(ll_dc, hRPen)
inv_win32.Rectangle(ll_dc, 0, 0, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!))
inv_win32.DeleteObject(hRPen)

inv_win32.ReleaseDC(Handle(THIS), ll_dc)

RETURN 1
end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_tabcontrol
end type

type uo_navigation from u_cst_tabstripnavigate within u_cst_tabcontrol
integer x = 562
integer width = 242
integer height = 84
integer taborder = 30
end type

on uo_navigation.destroy
call u_cst_tabstripnavigate::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
end event

type uo_tabs from u_cst_tabstrip within u_cst_tabcontrol
event paint pbm_paint
integer width = 1184
integer height = 84
integer taborder = 10
end type

event lbuttondown;call super::lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 THEN
	//IF il_index = il_selected THEN
		IF  of_IsMouseOverX(ll_index, xpos, ypos) THEN
			IF ist_tabs[ll_index].ab_canclose THEN
				of_CloseTab(ll_index)
				ib_inclose = FALSE
			END IF
		//END IF
	ELSE
		of_SelectTab(ll_index)
	END IF
END IF
end event

on uo_tabs.destroy
call u_cst_tabstrip::destroy
end on

event onpaint;call super::onpaint;
in_Gradient.of_SetHDC(hdc)
in_Gradient.il_position = il_CurrentPosition

in_Gradient.of_VerticalGradient( of_GetColor('TABBACK2'),  of_GetColor('TABBACK1'), THIS)


IF ib_dirty THEN
	of_UpdatePoints()
	uo_navigation.SetRedraw(TRUE)
	ib_dirty = FALSE
END IF

in_Gradient.of_DrawTabs(ib_vistastyle, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!), of_GetColor('BORDER'), il_imagelistsmall, il_CurrentPosition = BOTTOM, ib_boldselected, il_firstvisible, FontName, FontSize)

of_DrawEval(hdc)

RETURN 1
end event

event constructor;call super::constructor;THIS.of_SetParent(PARENT)
end event

event rbuttondown;call super::rbuttondown;PARENT.Event RightClicked(il_index)
end event

type uo_chevronclose from u_cst_powerdockclose within u_cst_tabcontrol
boolean visible = false
integer x = 398
integer height = 84
integer taborder = 20
boolean bringtotop = true
end type

on uo_chevronclose.destroy
call u_cst_powerdockclose::destroy
end on

event clicked;call super::clicked;IF ib_inarrow THEN

	m_powerdocktabmenu m_tabmenu
	
	m_tabmenu = CREATE m_powerdocktabmenu
	
	m_tabmenu.il_index = PARENT.of_GetSelectedTab()
	m_tabmenu.iuo_parent = PARENT
	
	PARENT.of_RefreshTabMenu(m_tabmenu)
	
	SetFocus(PARENT)
	
	m_tabmenu.PopMenu(iw_parent.PointerX() - xpos, iw_parent.PointerY() + (height - ypos - 10))
	
	RETURN 1
	
END IF

IF ib_inx THEN
	
	PARENT.of_CloseSelectedTab()
	
	RETURN 1
	
END IF
end event

type st_1 from statictext within u_cst_tabcontrol
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Tab Control"
boolean focusrectangle = false
end type

event constructor;Hide()
TextSize = 13
end event

