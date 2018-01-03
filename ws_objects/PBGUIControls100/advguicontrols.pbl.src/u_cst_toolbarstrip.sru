$PBExportHeader$u_cst_toolbarstrip.sru
forward
global type u_cst_toolbarstrip from u_cst_canvas
end type
type uo_toolbarchevron from u_cst_toolbarchevron within u_cst_toolbarstrip
end type
type st_1 from statictext within u_cst_toolbarstrip
end type
end forward

global type u_cst_toolbarstrip from u_cst_canvas
integer width = 498
integer height = 104
event ue_buttonclicked ( string as_button )
event ue_mousemove ( string as_button,  integer ai_xpos,  integer ai_ypos )
event ue_mouseenter ( string as_button )
event ue_mouseleave ( string as_button )
event resize pbm_size
event mousemove pbm_mousemove
event mouseenter ( long xpos,  long ypos )
event mouseleave ( )
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event type integer ue_buttonclicking ( string as_button )
event move pbm_move
uo_toolbarchevron uo_toolbarchevron
st_1 st_1
end type
global u_cst_toolbarstrip u_cst_toolbarstrip

type prototypes

FUNCTION unsignedlong GetSysColor(int nIndex) LIBRARY "user32.dll"
end prototypes

type variables
n_cst_ui_imagelist inv_imagelist

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

CONSTANT Long LINK = 1
CONSTANT Long LABEL = 2
CONSTANT Long LINE = 3

CONSTANT Long XP = 0
CONSTANT Long VISTAEMBOSSED = 1
CONSTANT Long VISTAORIGINAL = 2
CONSTANT Long VISTAGLASS = 3
CONSTANT Long CUSTOM = 4

CONSTANT Long LEFT = 1
CONSTANT Long RIGHT = 2

//Text Position
CONSTANT Long TEXTTOP = 1
CONSTANT Long TEXTBOTTOM = 2
CONSTANT Long TEXTRIGHT = 3
CONSTANT Long TEXTLEFT = 4

Long il_CurrentTextPosition = TEXTRIGHT

Long MinWidth
Boolean TextUnderImage
String FontName = 'Tahoma'
Long FontSize = 8
Long FontColor = 0
Boolean Bold = FALSE
Boolean AutoSize = FALSE

//BCW - 2.0.0
CONSTANT Long HORIZONTAL = 1
CONSTANT Long VERTICAL = 2
Long il_CurrentOrientation = 1
//BCW - 2.0.0

Long il_CurrentStyle = XP
Long il_CurrentTheme = BLUE

Long il_TextHeight

Boolean ib_quickaccessmode
Long il_custombackground

Boolean ib_displaytext = FALSE
Boolean ib_displayborder = TRUE
Boolean ib_raisedborder = FALSE
Boolean ib_solidbackground = FALSE
Boolean ib_displaytooltips = TRUE

boolean ib_mousecaptured = FALSE
long il_index
long il_ID
long il_MOIndex
Long il_ChevronIndex = -1
boolean ib_mouseover = FALSE
boolean ib_mouseleave = FALSE
boolean ib_selected = FALSE
boolean ib_mousedown = FALSE
n_cst_tooltip inv_tooltip
u_cst_toolbarmenu iToolBarDropMenu

ToolbarItem ToolbarItemsLeft[]

window iw_parent
n_cst_toolbarstrip_painter in_Gradient

CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48

Long il_CurrentSize = SMALL
Long il_imagelistsmall
Long il_imagelistmedium
Long il_imagelistlarge
Long il_imagelistxlarge

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Long ImageCount
Long il_LeftEndPoint
boolean ib_LeftHidden

trackmouseevent istr_TRACKMOUSEEVENT

constant ulong WM_MOUSELEAVE = 675 
constant uLong TME_LEAVE = 2 
end variables

forward prototypes
public function integer of_settheme (long al_color)
public function integer of_settheme (string as_color)
public function integer of_getwindow ()
public function integer of_reorganize ()
public function integer of_additem (string as_text, string as_image)
public function integer of_addseparator ()
public function integer of_displaytext (boolean ab_display)
public function long of_getcolor (string as_color)
public function integer of_displayborder (boolean ab_border)
public function integer of_addobject (string as_text, dragobject ado_object)
public function integer of_setenabled (string as_item, boolean ab_switch)
public function integer of_setstyle (long al_style)
public function integer of_setimage (string as_item, string as_image)
public function string of_getimage (string as_item)
public function integer of_displayraisedborder (boolean ab_show)
public function integer of_toggle (string as_item)
public function boolean of_istoggleon (string as_item)
public function integer of_additem (string as_text, string as_image, string as_tiptext)
public function integer of_displaytext (string as_item, boolean ab_display)
public function integer of_settext (string as_item, string as_text)
public function integer of_settiptext (string as_item, string as_text)
public function integer of_settext (long al_item, string as_text)
public function integer of_settiptext (long al_item, string as_text)
public function integer of_displaytext (long al_item, boolean ab_display)
public function integer of_toggle (long al_item)
public function integer of_setenabled (long al_item, boolean ab_switch)
public function integer of_displaysolidbackground (boolean ab_switch)
public function integer of_removeitem (string as_text)
public function integer of_additem (string as_text, string as_image, integer al_position)
public function integer of_additem (string as_text, string as_image, string as_tiptext, integer al_position)
public function integer of_addseparator (integer al_position)
public function integer of_displaytext (long al_item, boolean ab_display, long al_position)
public function integer of_setenabled (long al_item, boolean ab_switch, integer al_position)
public function integer of_settext (long al_item, string as_text, integer al_position)
public function integer of_settiptext (long al_item, string as_text, integer al_position)
public function integer of_toggle (long al_item, integer al_position)
public function integer of_reorganizeright ()
public function integer of_setvisible (long al_item, boolean ab_switch, integer al_position)
public function integer of_setvisible (long al_item, boolean ab_switch)
public function integer of_setvisible (string as_item, boolean ab_switch)
public function integer of_settextposition (integer al_position)
public function integer of_reset ()
public function integer of_setfontname (string as_font)
public function integer of_setfontcolor (long al_color)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_getfontsize ()
public function point of_gettextwidth (string as_text, boolean ab_bold)
public function integer of_addimage (string as_image)
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_indexfrompoint (long xpos, long ypos)
private function integer of_getwidth ()
private function boolean of_isinobject (long xpos, long ypos)
public function boolean of_isvisible (string as_item)
public function boolean of_isenabled (string as_item)
public function integer of_setsize (integer al_size)
public function integer of_addobject (string as_text, dragobject ado_object, integer al_position)
public function integer of_updatepointsleft ()
public function integer of_updatepointsright ()
public function integer of_updatepoints ()
private function integer of_getheight ()
public function integer of_addgroup ()
public function integer of_assignitemtogroup (integer groupid, integer itemid)
public function integer of_setgroupitem (integer groupid, integer itemid)
public function integer of_isoverchevron (long xpos, long ypos)
public function integer of_closedropmenu ()
private function integer of_displaydropmenu (integer al_groupid, integer xpos, integer ypos)
public function integer of_addgroup (string as_text, string as_image)
public function integer of_cleargroup (integer al_group)
public function integer of_disabletooltips ()
public function integer of_enabletooltips ()
public function integer of_getactualwidth ()
public function integer of_removeitem (long al_item)
public function integer of_addgroup (string as_text, string as_image, integer al_dropdownwidth)
public function integer of_addgroup (long al_dropdownwidth)
public function integer of_displaytextunderimage ()
public function integer of_setminbuttonwidth (long al_width)
public function integer of_quickaccessmode (long al_color)
public function long of_getindex (string as_item)
public function integer of_updatepointsquickaccess ()
end prototypes

event ue_buttonclicked(string as_button);// button item clicked on

end event

event ue_mousemove(string as_button, integer ai_xpos, integer ai_ypos);// mouse moved over button item

end event

event ue_mouseenter(string as_button);// mouse entered button item

end event

event ue_mouseleave(string as_button);// mouse leaving button item

end event

event resize;call super::resize;of_UpdatePoints()
end event

event mousemove;Long ll_index, ll_chevronindex

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	ib_mouseleave = FALSE
	this.event mouseenter(xpos, ypos)
		
end if
	
	if xpos < 0 or ypos < 0 or xpos > of_GetWidth() or ypos > height or of_IsInObject(xpos, ypos) then
			IF NOT ib_selected THEN
				of_releasemouse()
				
				this.event post mouseleave()
			ELSE
				ib_mouseleave = TRUE
				of_UpdatePoints()
				SetRedraw(TRUE)
			END IF
	
	ELSE
		ib_mouseleave = FALSE
		
		Long ll_MOIndex
		ll_MOIndex = of_IndexFromPoint(xpos, ypos)
		
		IF ib_MouseDown THEN
			IF ll_MOIndex <> il_MOIndex THEN
				il_MOIndex = ll_MOIndex
				of_UpdatePoints()
				SetRedraw(TRUE)
			END IF
		END IF

		ll_chevronindex = of_IsOverChevron(xpos, ypos)
			
			IF ll_chevronindex <> il_ChevronIndex THEN
				il_ChevronIndex = ll_chevronindex
			
				of_UpdatePoints()
				SetRedraw(TRUE)
			END IF
			
		IF NOT ib_MouseDown THEN
			ll_index = of_IndexFromPoint(xpos, ypos)
			
			
			
			IF il_index <> ll_index THEN
				il_index = ll_index
				
				IF ll_index > 0 THEN
					IF NOT ToolbarItemsLeft[ll_index].Enabled THEN
						il_index = -1
					END IF
				END IF
			
				of_UpdatePoints()
				SetRedraw(TRUE)
				
				IF il_index > 0 THEN
					EVENT ue_mouseenter(ToolbarItemsLeft[il_index].Text)
				END IF
				
				
				IF ll_index > 0 THEN
					IF Len(Trim(ToolbarItemsLeft[ll_index].TipText)) > 0 AND &
						NOT ToolbarItemsLeft[ll_index].Hidden AND ib_displaytooltips THEN
						
				
						Long li_X, li_Y, ll_return
			
						IF il_Id > 0 THEN
							li_X = 0//UnitsToPixels( Integer( X ),XUnitsToPixels! )
							li_Y = 0//UnitsToPixels( Integer( Y ), YUnitsToPixels! )
							inv_tooltip.of_UpdatetipRect( This, il_ID, &
															li_x, li_y, &
															li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
															li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
								
							
							inv_tooltip.Of_SetTipText( This, il_Id, ToolbarItemsLeft[ll_index].TipText) 
						END IF
					END IF
				ELSE
					inv_tooltip.of_UpdatetipRect( This, il_ID, &
														0, 0, &
														0, &
														0 )
				END IF
			
			END IF
		END IF
	end if

//end if
end event

event mouseenter(long xpos, long ypos);Long li_X, li_Y, ll_return

inv_win32.TrackMouseEvent(istr_TRACKMOUSEEVENT) 

end event

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE

IF NOT ib_mousedown THEN
	il_index = 0
END IF

of_UpdatePoints()
SetRedraw(TRUE)

end event

event lbuttondown;ib_mousedown = TRUE
ib_selected = TRUE

il_index = of_IndexFromPoint(xpos, ypos)

IF il_index > 0 THEN
	IF  NOT ToolbarItemsLeft[il_index].Enabled THEN
		il_index = -1
	END IF
END IF

il_MOIndex = il_index
of_UpdatePoints()
SetRedraw(TRUE)
end event

event lbuttonup;Boolean ib_click
Long ll_index

IF ib_selected AND NOT ib_mouseleave AND il_index = il_MOIndex THEN
	ib_click = TRUE
END IF

ll_index = il_index

ib_selected = FALSE
ib_mouseleave = FALSE
ib_mousedown = FALSE
of_ReleaseMouse()
il_index = of_IndexFromPoint(xpos, ypos)

IF il_index > 0 THEN
	IF  NOT ToolbarItemsLeft[il_index].Enabled THEN
		il_index = -1
	END IF
END IF

il_MOIndex = il_index
of_UpdatePoints()
SetRedraw(TRUE)

IF ib_click AND ll_index > 0 THEN
	IF il_ChevronIndex > 0 OR ToolbarItemsLeft[il_index].IsLocked THEN
		//Show options
		of_DisplayDropMenu(ll_index, xpos, ypos)
	ELSE
		Long ll_return
		ll_return = Event ue_ButtonClicking(ToolbarItemsLeft[ll_index].Text)
		
		IF IsNull(ll_return) THEN ll_return = 0
		
		IF ll_return = 0 THEN
			Event ue_ButtonClicked(ToolbarItemsLeft[ll_index].Text)
		END IF
	END IF
END IF

end event

event move;Integer	 li_RC
li_RC	 = Super::Move(X, Y)

of_UpdatePoints()

Return(li_RC)
end event

public function integer of_settheme (long al_color);Long ll_index, ll_loop

il_currenttheme = al_color

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

public function integer of_getwindow ();PowerObject	lpo_parent
Window lw_window

IF IsValid(iw_parent) THEN RETURN 0

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

public function integer of_reorganize ();//Long ll_index, ll_count, ll_loop, ll_item, ll_width, ll_height
//
//SetRedraw(FALSE)
//
//uo_toolbarchevron.Visible = FALSE
//uo_toolbarchevron.of_ClearItems()
//
////BCW - 2.0.0
//IF il_CurrentOrientation = HORIZONTAL THEN
//	ll_count = UpperBound(iuo_leftitems)
//	ll_width = 8
//	
//	FOR ll_index = 1 TO ll_count
//		IF iuo_leftitems[ll_index].ib_visible THEN
//		
//			iuo_leftitems[ll_index].X = ll_width
//			
//			ll_width = ll_width + iuo_leftitems[ll_index].Width + 4
//			
//			IF iuo_leftitems[ll_index].X + iuo_leftitems[ll_index].Width > &
//				(THIS.Width - uo_toolbarchevron.Width) THEN
//				
//				uo_toolbarchevron.of_RegisterItem(iuo_leftitems[ll_index])
//				iuo_leftitems[ll_index].Visible = FALSE
//				uo_toolbarchevron.Visible = TRUE
//			ELSE
//				iuo_leftitems[ll_index].Visible = TRUE
//			END IF
//		END IF
//	NEXT
//ELSE
//	ll_count = UpperBound(iuo_leftitems)
//	ll_height = 8
//	
//	FOR ll_index = 1 TO ll_count
//		IF iuo_leftitems[ll_index].ib_visible THEN
//			iuo_leftitems[ll_index].Y = ll_height
//			
//			ll_height = ll_height + iuo_leftitems[ll_index].Height + 4
//			
//			IF iuo_leftitems[ll_index].Y + iuo_leftitems[ll_index].Height > &
//				(THIS.Height - uo_toolbarchevron.Height) THEN
//				
//				uo_toolbarchevron.of_RegisterItem(iuo_leftitems[ll_index])
//				iuo_leftitems[ll_index].Visible = FALSE
//				uo_toolbarchevron.Visible = TRUE
//			ELSE
//				iuo_leftitems[ll_index].Visible = TRUE
//			END IF
//		END IF
//	NEXT
//END IF
//
//of_ReorganizeRight()
//
////SetRedraw(TRUE)

RETURN 1
end function

public function integer of_additem (string as_text, string as_image);RETURN of_AddItem(as_text, as_image, as_text, LEFT)
end function

public function integer of_addseparator ();RETURN of_AddSeparator(LEFT)
end function

public function integer of_displaytext (boolean ab_display);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	ToolbarItemsLeft[ll_index].DisplayText = ab_display
NEXT

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "BORDER"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(108,138,181)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
		END CHOOSE	
	CASE "BACKGROUND1"
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
	CASE "BACKGROUND2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(129,169,226)
			CASE SILVER
				ll_color = RGB(153,151,181)
			CASE OLIVE
				ll_color = RGB(183,198,145)
			CASE CLASSIC
				ll_color = RGB(213,210,202)
		END CHOOSE
	CASE "BACKGROUND3"
		IF ib_quickaccessmode THEN
			ll_color = GetSysColor(15)
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(203,220,249)
				CASE SILVER
					ll_color = RGB(232,232,240)
				CASE OLIVE
					ll_color = RGB(234,234,207)
				CASE CLASSIC
					ll_color = RGB(242,243,246)
			END CHOOSE
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(182,207,242)
				CASE SILVER
					ll_color = RGB(201,201,218)
				CASE OLIVE
					ll_color = RGB(213,222,183)
				CASE CLASSIC
					ll_color = RGB(230,228,223)
			END CHOOSE
		END IF
	CASE "HIGHLIGHT1"
		IF ib_quickaccessmode THEN
			ll_color = RGB(255,245,204)
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(255,245,204)
				CASE SILVER
					ll_color = RGB(255,244,204)
				CASE OLIVE
					ll_color = RGB(255,244,204)
				CASE CLASSIC
					ll_color = RGB(182,189,210)
			END CHOOSE
		END IF
	CASE "HIGHLIGHT2"
		IF ib_quickaccessmode THEN
			ll_color = RGB(255,208,145)
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(255,208,145)
				CASE SILVER
					ll_color = RGB(255,208,145)
				CASE OLIVE
					ll_color = RGB(255,208,145)
				CASE CLASSIC
					ll_color = RGB(182,189,210)
			END CHOOSE
		END IF
	CASE "HIGHLIGHTBORDER"
		IF ib_quickaccessmode THEN
			ll_color =  RGB(238, 200, 88)
		ELSE
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
		END IF
	CASE "SELECTED1"
		IF ib_quickaccessmode THEN
			ll_color = RGB(255,208,145)
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(254,145,78)
				CASE SILVER
					ll_color = RGB(254,145,78)
				CASE OLIVE
					ll_color = RGB(254,145,78)
				CASE CLASSIC
					ll_color = RGB(133,146,181)
			END CHOOSE
		END IF
	CASE "SELECTED2"
		IF ib_quickaccessmode THEN
			ll_color = RGB(255,241,198)
		ELSE
			CHOOSE CASE il_CurrentTheme
				CASE BLUE
					ll_color = RGB(255,211,142)
				CASE SILVER
					ll_color = RGB(255,211,142)
				CASE OLIVE
					ll_color = RGB(255,211,142)
				CASE CLASSIC
					ll_color = RGB(133,146,181)
			END CHOOSE
		END IF
	CASE "SEPARATOR"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(106,140,203)
			CASE SILVER
				ll_color = RGB(110,109,143)
			CASE OLIVE
				ll_color = RGB(96,128,88)
			CASE CLASSIC
				ll_color = RGB(166,166,166)
		END CHOOSE
	CASE "CAP"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(59,97,156)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
		END CHOOSE
END CHOOSE

RETURN ll_color
end function

public function integer of_displayborder (boolean ab_border);ib_displayborder = ab_border

of_UpdatePoints()

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_addobject (string as_text, dragobject ado_object);RETURN of_AddObject(as_text, ado_object, LEFT)
end function

public function integer of_setenabled (string as_item, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN of_SetEnabled(ll_index, ab_switch, LEFT)
	END IF
	
NEXT

RETURN 1
end function

public function integer of_setstyle (long al_style);il_CurrentStyle = al_style
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (string as_item, string as_image);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		ToolbarItemsLeft[ll_index].Image = as_image
		ToolbarItemsLeft[ll_index].ImageIndex = of_AddImage(as_image)
		
		of_UpdatePoints()
		SetRedraw(TRUE)
		RETURN 1
	END IF
	
NEXT

RETURN 0
end function

public function string of_getimage (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ToolbarItemsLeft[ll_index].Image
	END IF
	
NEXT

RETURN ''
end function

public function integer of_displayraisedborder (boolean ab_show);ib_raisedborder = ab_show
of_DisplayBorder(FALSE)
RETURN 1
end function

public function integer of_toggle (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN of_Toggle(ll_index, LEFT)
	END IF
	
NEXT

RETURN 1
end function

public function boolean of_istoggleon (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ToolbarItemsLeft[ll_index].Toggle
	END IF
	
NEXT

RETURN FALSE
end function

public function integer of_additem (string as_text, string as_image, string as_tiptext);RETURN of_AddItem(as_text, as_image, as_tiptext, LEFT)
end function

public function integer of_displaytext (string as_item, boolean ab_display);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF Lower(ToolbarItemsLeft[ll_index].Text) = Lower(as_item) THEN
		of_DisplayText(ll_index, ab_display, LEFT)
		RETURN 1
	END IF
NEXT


RETURN 0
end function

public function integer of_settext (string as_item, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF Lower(ToolbarItemsLeft[ll_index].Text) = Lower(as_item) THEN
		ToolbarItemsLeft[ll_index].Text = as_text
		RETURN 1
	END IF
NEXT


RETURN 0
end function

public function integer of_settiptext (string as_item, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF Lower(ToolbarItemsLeft[ll_index].Text) = Lower(as_item) THEN
		ToolbarItemsLeft[ll_index].TipText = as_text
		RETURN 1
	END IF
NEXT

RETURN 1
end function

public function integer of_settext (long al_item, string as_text);RETURN of_SetText(al_item, as_text, LEFT)
end function

public function integer of_settiptext (long al_item, string as_text);RETURN of_SetTipText(al_item, as_text, LEFT)
end function

public function integer of_displaytext (long al_item, boolean ab_display);RETURN of_DisplayText(al_item, ab_display, LEFT)
end function

public function integer of_toggle (long al_item);RETURN of_Toggle(al_item, LEFT)
end function

public function integer of_setenabled (long al_item, boolean ab_switch);RETURN of_SetEnabled(al_item, ab_switch, LEFT)
end function

public function integer of_displaysolidbackground (boolean ab_switch);ib_solidbackground = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_removeitem (string as_text);Long ll_index, ll_count, ll_loop, ll_item, ll_width

ll_item = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_item
	IF ToolbarItemsLeft[ll_index].Text = as_text THEN
		RETURN of_RemoveItem(ll_index)
	END IF
NEXT

RETURN 1
end function

public function integer of_additem (string as_text, string as_image, integer al_position);RETURN of_AddItem(as_text, as_image, as_text, al_position)
end function

public function integer of_additem (string as_text, string as_image, string as_tiptext, integer al_position);Long ll_index, ll_count, ll_loop, ll_item, ll_width

ToolbarItem tbiButton

SetRedraw(FALSE)

tbiButton.Text = as_text
tbiButton.TipText = as_tiptext
tbiButton.Image = as_image
tbiButton.Enabled = TRUE
tbiButton.Visible = TRUE
tbiButton.DisplayText = ib_displaytext
tbiButton.separator = FALSE
tbiButton.ImageIndex = of_AddImage(as_image)
tbiButton.Position = al_position

ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

of_UpdatePoints()

IF AutoSize THEN
	THIS.Width = of_GetActualWidth()
END IF

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_addseparator (integer al_position);Long ll_index, ll_count, ll_loop, ll_item, ll_width
ToolbarItem tbiButton

SetRedraw(FALSE)

tbiButton.Separator = TRUE
tbiButton.Visible = TRUE
tbiButton.Position = al_position

ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

of_UpdatePoints()

IF AutoSize THEN
	THIS.Width = of_GetActualWidth()
END IF

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_displaytext (long al_item, boolean ab_display, long al_position);
ToolbarItemsLeft[al_item].DisplayText = ab_display
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setenabled (long al_item, boolean ab_switch, integer al_position);IF al_item <= 0 THEN RETURN 0
IF al_item > UpperBound(ToolbarItemsLeft) THEN RETURN 0

IF ToolbarItemsLeft[al_item].Enabled = (NOT ab_switch) THEN
	ToolbarItemsLeft[al_item].Enabled = ab_switch
	
	of_UpdatePoints()
	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_settext (long al_item, string as_text, integer al_position);IF al_item <= 0 THEN RETURN 0
IF al_item > UpperBound(ToolbarItemsLeft) THEN RETURN 0

ToolbarItemsLeft[al_item].Text = as_text

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settiptext (long al_item, string as_text, integer al_position);ToolbarItemsLeft[al_item].TipText = as_text

RETURN 1
end function

public function integer of_toggle (long al_item, integer al_position);ToolbarItemsLeft[al_item].Toggle = NOT ToolbarItemsLeft[al_item].Toggle

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_reorganizeright ();//Long ll_count, ll_index, ll_width, ll_height
//
////BCW - 2.0.0
//IF il_CurrentOrientation = HORIZONTAL THEN
//	ll_count = UpperBound(iuo_rightitems)
//	ll_width = 8
//	
//	FOR ll_index = 1 TO ll_count
//		IF iuo_rightitems[ll_index].Visible THEN
//			iuo_rightitems[ll_index].X = THIS.Width - iuo_rightitems[ll_index].Width - ll_width
//			
//			ll_width = ll_width + iuo_rightitems[ll_index].Width + 4
//		END IF
//	NEXT
//ELSE
//	ll_count = UpperBound(iuo_rightitems)
//	ll_height = 8
//	
//	FOR ll_index = 1 TO ll_count
//		IF iuo_rightitems[ll_index].Visible THEN
//			iuo_rightitems[ll_index].Y = THIS.Height - iuo_rightitems[ll_index].Height - ll_height
//			
//			ll_height = ll_height + iuo_rightitems[ll_index].Height + 4
//		END IF
//	NEXT
//END IF
//
//SetRedraw(TRUE)
//
RETURN 1
end function

public function integer of_setvisible (long al_item, boolean ab_switch, integer al_position);IF al_item < 1 OR al_item > UpperBound(ToolbarItemsLeft) THEN RETURN 0

IF ToolbarItemsLeft[al_item].Visible = (NOT ab_switch) THEN
	ToolbarItemsLeft[al_item].Visible = ab_switch
	
	IF IsValid(ToolbarItemsLeft[al_item].ObjectReference) THEN
		ToolbarItemsLeft[al_item].ObjectReference.Visible = ab_switch
	END IF
		
	of_UpdatePoints()
	SetRedraw(TRUE)
END IF
	
RETURN 1
end function

public function integer of_setvisible (long al_item, boolean ab_switch);RETURN of_SetVisible(al_item, ab_switch, LEFT)
end function

public function integer of_setvisible (string as_item, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN of_SetVisible(ll_index, ab_switch, LEFT)
	END IF
	
NEXT

RETURN 0
end function

public function integer of_settextposition (integer al_position);

RETURN 1
end function

public function integer of_reset ();ToolBarItem luo_leftitems[]

ImageCount = 0

ToolbarItemsLeft = luo_leftitems
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setfontname (string as_font);FontName = as_font
of_GetFontSize()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontcolor (long al_color);FontColor = al_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (integer ai_fontsize);FontSize = ai_fontsize
of_GetFontSize()
of_UpdatePoints()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_getfontsize ();ULong lul_Handle, lul_hDC, lul_hFont
String ls_text
long ll_x
n_cst_xplistbar_painter lnv_gradient

ll_x = 0

lul_Handle = Handle(st_1)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_gradient.of_SetHdc(lul_hDC)
ls_text = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
lnv_gradient.of_DrawText(THIS, ls_text, 0, FontName, FontSize, Bold, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 50,FALSE, FALSE, false, false) 

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

Point p

p.PX = lnv_gradient.il_newWidth
p.PY = lnv_gradient.il_newHeight

il_TextHeight = p.PY

RETURN 1
end function

public function point of_gettextwidth (string as_text, boolean ab_bold);ULong lul_Handle, lul_hDC, lul_hFont
POINT lstr_size
long ll_x
n_cst_toolbarstrip_painter lnv_gradient
Point p

ll_x = 0

lul_Handle = Handle(st_1)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_gradient.of_SetHdc(lul_hDC)

IF il_CurrentOrientation = HORIZONTAL OR TextUnderImage THEN
	lnv_gradient.of_DrawText(THIS, as_text, 0, FontName, FontSize, ab_bold, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 50,FALSE, FALSE, false, false) 
	p.PX = UnitsToPixels(lnv_gradient.il_newWidth, XUnitsToPixels!) + 4
	p.PY = UnitsToPixels(lnv_gradient.il_newHeight, YUnitsToPixels!) + 4
ELSE
	lnv_gradient.of_DrawVerticalText(THIS, as_text, 0, FontName, FontSize, ab_bold, lnv_gradient.ALIGN_LEFT, 0, 0, 0, 0,FALSE, FALSE, false, false) 	
	p.PX = lnv_gradient.il_newWidth
	p.PY = lnv_gradient.il_newHeight + 2
END IF	

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

IF MinWidth > 0 THEN p.PX = MinWidth
	
RETURN p
 
end function

public function integer of_addimage (string as_image);
IF Len(Trim(as_image)) > 0 THEN
	ImageCount = ImageCount + 1

	Long ll_index
	
	ll_index = inv_imagelist.of_AddImage(as_image)

	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	il_imagelistmedium = inv_imagelist.of_GetMediumHandle()
	il_imagelistlarge = inv_imagelist.of_GetLargeHandle()
	il_imagelistxlarge = inv_imagelist.of_GetXLargeHandle()

	RETURN ll_index
ELSE
	RETURN 0
END IF
end function

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(ToolbarItemsLeft)
FOR ll_index = 1 to ll_count

	IF NOT ToolbarItemsLeft[ll_index].Visible THEN CONTINUE
	IF ToolbarItemsLeft[ll_index].Hidden THEN CONTINUE
	
	lul_rgn = inv_win32.CreatePolygonRgn(ToolbarItemsLeft[ll_index].PaintRegion, UPPERBOUND(ToolbarItemsLeft[ll_index].PaintRegion), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

private function integer of_getwidth ();IF il_CurrentOrientation = HORIZONTAL THEN
	RETURN Width - uo_toolbarchevron.Width
ELSE
	RETURN Width
END IF
end function

private function boolean of_isinobject (long xpos, long ypos);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].ObjectType THEN
	
		IF ToolbarItemsLeft[ll_index].ObjectReference.Visible AND &
			(xpos + X) > ToolbarItemsLeft[ll_index].ObjectReference.X AND &
			(xpos + X) < ToolbarItemsLeft[ll_index].ObjectReference.X + &
			ToolbarItemsLeft[ll_index].ObjectReference.Width AND &
			(ypos + Y) > ToolbarItemsLeft[ll_index].ObjectReference.Y AND &
			(ypos + Y) < ToolbarItemsLeft[ll_index].ObjectReference.Y + &
			ToolbarItemsLeft[ll_index].ObjectReference.Height &
		THEN
			RETURN TRUE
		END IF
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_isvisible (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ToolbarItemsLeft[ll_index].Visible
	END IF
	
NEXT

RETURN FALSE
end function

public function boolean of_isenabled (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ToolbarItemsLeft[ll_index].Enabled
	END IF
	
NEXT

RETURN FALSE
end function

public function integer of_setsize (integer al_size);il_CurrentSize = al_size
Point p
Long ll_height

IF TextUnderImage THEN
	p = of_GetTextWidth("ABCDEFGHIJKLMNOPQRSTUVWXYZ", TRUE)
	ll_height = PixelsToUnits(p.py, YPixelsToUnits!)
END IF
	
IF il_CurrentOrientation = HORIZONTAL THEN
	CHOOSE CASE il_CurrentSize
		CASE SMALL
			IF ib_quickaccessmode THEN
				THIS.Height = 78
			ELSE
				THIS.Height = 104 + ll_height
			END IF
		CASE MEDIUM
			THIS.Height = 135 + ll_height
		CASE LARGE
			THIS.Height = 175 + ll_height
		CASE XLARGE
			THIS.Height = 235 + ll_height
	END CHOOSE
ELSE
	CHOOSE CASE il_CurrentSize
		CASE SMALL
			THIS.Width = 121 + ll_height
		CASE MEDIUM
			THIS.Width = 155 + ll_height
		CASE LARGE
			THIS.Width = 193 + ll_height
		CASE XLARGE
			THIS.Width = 263 + ll_height
	END CHOOSE
END IF

RETURN 1
end function

public function integer of_addobject (string as_text, dragobject ado_object, integer al_position);Long ll_index, ll_count, ll_loop, ll_item, ll_width
ToolbarItem tbiButton

IF il_CurrentOrientation = VERTICAL THEN
	RETURN -1
END IF

SetRedraw(FALSE)

of_GetWindow()

//SetParent(Handle(ado_object), Handle(THIS))
tbiButton.ObjectReference = ado_object
tbiButton.ObjectType = TRUE
tbiButton.Visible = TRUE
tbiButton.Text = as_text
tbiButton.Position = al_position

ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

of_UpdatePoints()

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_updatepointsleft ();Long ll_index, ll_count, ll_x, ll_y, ll_textheight, ll_textwidth, ll_item, ll_childIndex
Long ll_width, ll_height, ll_dc, ll_controlWidth, ll_chevronwidth
Long ll_paintwidth
boolean lb_SomeHidden = FALSE
point lp_empty[]
n_cst_toolbarstrip_painter ln_gradient
Point p

ll_count = UpperBound(ToolbarItemsLeft)

ll_y = 3
ll_x = 3

ll_height = UnitsToPixels(Height, YUnitsToPixels!)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_paintwidth = UnitsToPixels(of_GetWidth(), XUnitsToPixels!)

ll_dc = inv_win32.GetDC(Handle(st_1))
ln_gradient.of_SetHDC(ll_dc)

uo_toolbarchevron.of_ClearItems()

FOR ll_index = 1 TO ll_count
	IF NOT ToolbarItemsLeft[ll_index].Visible OR ToolbarItemsLeft[ll_index].Position = RIGHT OR &
	   ToolbarItemsLeft[ll_index].IsChild THEN
		
		ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
		
		CONTINUE
	END IF
	
	ll_item++
		
	IF ToolbarItemsLeft[ll_index].IsParent AND ToolbarItemsLeft[ll_index].SelectedChild > 0 THEN
		
		IF ToolbarItemsLeft[ll_index].IsLocked THEN
			ll_childIndex = ll_index
		ELSE
			ll_childIndex = ToolbarItemsLeft[ll_index].SelectedChild
		END IF
		
		IF il_CurrentOrientation = VERTICAL THEN
			ll_chevronwidth = 10
		ELSE
			ll_chevronwidth = 12
		END IF
	ELSE
		ll_childIndex = ll_index
		ll_chevronwidth = 0
	END IF
		
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	IF ll_index = il_index THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")				
	ELSE
		
	END IF
	
	IF il_CurrentOrientation = VERTICAL THEN
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x + 3
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - ll_x - 1
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
			
			IF ToolbarItemsLeft[ll_index].PaintRegion[2].py > UnitsToPixels(of_GetHeight(), XUnitsToPixels!) THEN
				ToolbarItemsLeft[ll_index].Hidden = TRUE
				uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
				lb_SomeHidden = TRUE
			ELSE
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			END IF
			
			ll_y = ll_y + 4
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				ToolbarItemsLeft[ll_index].ObjectReference.Visible = FALSE
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					
					ToolbarItemsLeft[ll_index].TextWidth = p.PX					
					
					ll_textwidth = p.PY
				ELSE
					ll_textheight = 0
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					IF TextUnderImage THEN
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth
					ELSE
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
					END IF
					
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
			
				IF ToolbarItemsLeft[ll_index].DisplayText AND NOT TextUnderImage THEN
					ll_width += 5
				END IF
			
				ToolbarItemsLeft[ll_index].TextHeight = ll_textwidth
				
				ll_width += ll_chevronwidth
				
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - ll_x + 1
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_width + ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_controlWidth - ll_x + 1
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_width + ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
			
				IF ToolbarItemsLeft[ll_index].IsParent THEN
					ToolbarItemsLeft[ll_index].ChevronRegion[1].px = ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[1].py = ll_width + ll_y - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[2].px = ll_controlWidth - ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[2].py = ll_width + ll_y - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[3].px = ll_controlWidth - ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[3].py = ll_width + ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[4].px = ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[4].py = ll_width + ll_y
				END IF
				
				IF ToolbarItemsLeft[ll_index].PaintRegion[3].py + 12 > UnitsToPixels(of_GetHeight(), YUnitsToPixels!) THEN
					ToolbarItemsLeft[ll_index].Hidden = TRUE
					uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
					lb_SomeHidden = TRUE
				ELSE
					ToolbarItemsLeft[ll_index].Hidden = FALSE
				END IF
				
				
				ll_y = ll_y + ll_width + 2
			END IF
		END IF
	ELSE
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + 3
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - 1 - 3
			
			IF ToolbarItemsLeft[ll_index].PaintRegion[2].px > ll_paintwidth THEN
				ToolbarItemsLeft[ll_index].Hidden = TRUE
				uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
				lb_SomeHidden = TRUE
			ELSE
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			END IF
			
			ll_x = ll_x + 5
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				
				IF Len(Trim(ToolbarItemsLeft[ll_index].Text)) > 0 THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_index].Text, FALSE)
					ToolbarItemsLeft[ll_index].TextWidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					ToolbarItemsLeft[ll_index].PaintRegion[3].py = UnitsToPixels(Height, YUnitsToPixels!)
					ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
					ll_textwidth = p.PX + 2
				ELSE
					ll_textwidth = 0
				END IF
				
				ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_textwidth + ll_x + 4, XPixelsToUnits!) + THIS.X, &
																				PixelsToUnits(ll_y - 1, XPixelsToUnits!) + THIS.Y)
				
				
				ll_x = ll_x + ll_textwidth + 4 + UnitsToPixels(ToolbarItemsLeft[ll_index].ObjectReference.Width, XUnitsToPixels!) + 4
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					ll_textwidth = p.PX
					ll_textheight = p.PY
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					
				ELSE
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					
					IF TextUnderImage THEN
						ll_width = 2 + il_CurrentSize + 2
						IF ll_width < ll_textwidth THEN ll_width = ll_textwidth + 4
						ll_width = ll_width + 1
					ELSE
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
					END IF
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
				
				ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
			
				ll_width += ll_chevronwidth
			
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + 1
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + 1
				
				IF ToolbarItemsLeft[ll_index].IsParent THEN
					ToolbarItemsLeft[ll_index].ChevronRegion[1].px = ll_width + ll_x - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[1].py = ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[2].px = ll_width + ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[2].py = ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[3].px = ll_width + ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[3].py = ll_height - ll_y + 1
					ToolbarItemsLeft[ll_index].ChevronRegion[4].px = ll_width + ll_x - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[4].py = ll_height - ll_y + 1
				END IF
				
				IF ToolbarItemsLeft[ll_index].PaintRegion[3].px > ll_paintwidth THEN
					ToolbarItemsLeft[ll_index].Hidden = TRUE
					uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
					lb_SomeHidden = TRUE
				ELSE
					ToolbarItemsLeft[ll_index].Hidden = FALSE
				END IF
				
				IF NOT lb_SomeHidden THEN
					il_LeftEndPoint = ll_x + ll_width + 2
				END IF
				
				ll_x = ll_x + ll_width + 2
			END IF
		END IF
	END IF

NEXT

inv_win32.ReleaseDC (Handle(st_1), ll_dc)

uo_toolbarchevron.Visible = lb_SomeHidden
ib_LeftHidden = lb_somehidden

IF lb_SomeHidden THEN
	CHOOSE CASE il_CurrentOrientation
		CASE HORIZONTAL
			IF ib_displayborder THEN
				uo_toolbarchevron.Height = THIS.Height - 10
				uo_toolbarchevron.Y = 2
				uo_toolbarchevron.X = THIS.Width - uo_toolbarchevron.Width - 4
			ELSE
				uo_toolbarchevron.Height = THIS.Height - 8
				uo_toolbarchevron.Y = 2
				uo_toolbarchevron.X = THIS.Width - uo_toolbarchevron.Width - 2
			END IF
		CASE VERTICAL
			IF ib_displayborder THEN
				uo_toolbarchevron.Height = 50
				uo_toolbarchevron.Width = THIS.Width - 8
				uo_toolbarchevron.X = 4
				uo_toolbarchevron.Y = THIS.Height - uo_toolbarchevron.Height - 8
			ELSE
				uo_toolbarchevron.Height = 50
				uo_toolbarchevron.Width = THIS.Width - 6
				uo_toolbarchevron.X = 4
				uo_toolbarchevron.Y = THIS.Height - uo_toolbarchevron.Height
			END IF
	END CHOOSE
	
	uo_toolbarchevron.Post SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_updatepointsright ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height, ll_dc, ll_controlWidth, ll_childIndex
boolean lb_SomeHidden = FALSE

point lp_empty[]
n_cst_toolbarstrip_painter ln_gradient
Point p

ll_count = UpperBound(ToolbarItemsLeft)

IF il_CurrentOrientation = VERTICAL THEN
	ll_y = UnitsToPixels(Height, YUnitsToPixels!) - 2
ELSE
	ll_y = 3
	
END IF
	
ll_x = UnitsToPixels(Width, XUnitsToPixels!) - 2
ll_height = UnitsToPixels(Height, YUnitsToPixels!)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)

ll_dc = inv_win32.GetDC(Handle(st_1))
ln_gradient.of_SetHDC(ll_dc)


FOR ll_index = 1 TO ll_count
	
	IF NOT ToolbarItemsLeft[ll_index].Visible OR ToolbarItemsLeft[ll_index].Position = LEFT OR &
	   ToolbarItemsLeft[ll_index].IsChild THEN
		CONTINUE
	END IF
	
	IF ToolbarItemsLeft[ll_index].IsParent AND ToolbarItemsLeft[ll_index].SelectedChild > 0 THEN
		ll_childIndex = ToolbarItemsLeft[ll_index].SelectedChild
	ELSE
		ll_childIndex = ll_index
	END IF
		

	IF uo_toolbarchevron.Visible THEN
		ToolbarItemsLeft[ll_index].Hidden = TRUE
		uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
		CONTINUE
	END IF
	
	ll_item++
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].Hidden = FALSE
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	IF ll_index = il_index THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")				
	ELSE
		
	END IF

	
	IF il_CurrentOrientation = VERTICAL THEN
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = 5
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y - 2
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - 5
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y - 2
			
			ll_y = ll_y - 4
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				ToolbarItemsLeft[ll_index].ObjectReference.Visible = FALSE
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					
					ToolbarItemsLeft[ll_index].TextWidth = p.PX					
					
					ll_textwidth = p.PY
				ELSE
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					IF TextUnderImage THEN
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth
					ELSE
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
					END IF
					
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
			
				IF ToolbarItemsLeft[ll_index].DisplayText AND NOT TextUnderImage THEN
					ll_width += 5
				END IF
			
				ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
			
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y - ll_width
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = 3
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y - ll_width
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - 2
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_controlWidth - 2
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = 3
			
				ll_y = ll_y - ll_width - 2
			END IF
		END IF
	ELSE
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - 2
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + 3
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x - 2
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - 1 - 3
			
			IF ToolbarItemsLeft[ll_index].PaintRegion[1].px < il_LeftEndPoint THEN
				ToolbarItemsLeft[ll_index].Hidden = TRUE
				uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
				lb_SomeHidden = TRUE
			ELSE
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			END IF
			
			ll_x = ll_x - 4
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				
				Long objectWidth
				
				objectWidth = UnitsToPixels(ToolbarItemsLeft[ll_index].ObjectReference.Width, XUnitsToPixels!)
				
				
				IF Len(Trim(ToolbarItemsLeft[ll_index].Text)) > 0 THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_index].Text, FALSE)
					ll_textwidth = p.PX + 2
					ToolbarItemsLeft[ll_index].TextWidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					ToolbarItemsLeft[ll_index].PaintRegion[3].py = UnitsToPixels(Height, YUnitsToPixels!)
					ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - objectWidth - ll_textwidth - 4
					
				ELSE
					ll_textwidth = 0
				END IF
				
				
				ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_x - objectWidth - 4, XPixelsToUnits!) + THIS.X, &
																				PixelsToUnits(ll_y - 1, XPixelsToUnits!) + THIS.Y)
				
				
				ll_x = ll_x - ll_textwidth - 4 - objectWidth - 4
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					ll_textwidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					
				ELSE
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					
					IF TextUnderImage THEN
						ll_width = 2 + il_CurrentSize + 2
						IF ll_width < ll_textwidth THEN ll_width = ll_textwidth + 4
						ll_width = ll_width + 1
					ELSE
						ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
					END IF
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
			
				ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
			
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - ll_width
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + 1
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x - ll_width
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + 1
				
				IF ToolbarItemsLeft[ll_index].PaintRegion[1].px < il_LeftEndPoint THEN
					ToolbarItemsLeft[ll_index].Hidden = TRUE
					uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
					lb_SomeHidden = TRUE
				ELSE
					ToolbarItemsLeft[ll_index].Hidden = FALSE
				END IF
				
				ll_x = ll_x - ll_width - 2
			END IF
		END IF
	END IF

NEXT

inv_win32.ReleaseDC (Handle(st_1), ll_dc)

uo_toolbarchevron.Visible = lb_SomeHidden OR ib_LeftHidden


IF lb_SomeHidden THEN
	CHOOSE CASE il_CurrentOrientation
		CASE HORIZONTAL
			IF ib_displayborder THEN
				uo_toolbarchevron.Height = THIS.Height - 10
				uo_toolbarchevron.Y = 2
				uo_toolbarchevron.X = THIS.Width - uo_toolbarchevron.Width - 4
			ELSE
				uo_toolbarchevron.Height = THIS.Height - 8
				uo_toolbarchevron.Y = 2
				uo_toolbarchevron.X = THIS.Width - uo_toolbarchevron.Width - 2
			END IF
		CASE VERTICAL
			IF ib_displayborder THEN
				uo_toolbarchevron.Height = 50
				uo_toolbarchevron.Width = THIS.Width - 8
				uo_toolbarchevron.X = 4
				uo_toolbarchevron.Y = THIS.Height - uo_toolbarchevron.Height - 8
			ELSE
				uo_toolbarchevron.Height = 50
				uo_toolbarchevron.Width = THIS.Width - 6
				uo_toolbarchevron.X = 4
				uo_toolbarchevron.Y = THIS.Height - uo_toolbarchevron.Height
			END IF
	END CHOOSE
END IF

RETURN 1
end function

public function integer of_updatepoints ();IF ib_quickaccessmode THEN
	of_UpdatePointsQuickAccess()
ELSE
	of_UpdatePointsLeft()
	of_UpdatePointsRight()
END IF

return 1
end function

private function integer of_getheight ();//IF uo_toolbarchevron.Visible THEN
IF il_CurrentOrientation = HORIZONTAL THEN
	RETURN Height - uo_toolbarchevron.Height
ELSE
	RETURN Height
END IF
end function

public function integer of_addgroup ();RETURN of_AddGroup("","")
end function

public function integer of_assignitemtogroup (integer groupid, integer itemid);Long ll_return

IF itemid <= 0 THEN RETURN 0
IF itemid > UpperBound(ToolbarItemsLeft) THEN RETURN 0

SetRedraw(FALSE)
ToolbarItemsLeft[itemid].IsChild = TRUE
ToolbarItemsLeft[itemid].ParentItem = groupId

ll_return = of_SetGroupItem(groupId, itemId)

of_UpdatePoints()
SetRedraw(TRUE)
RETURN ll_return
end function

public function integer of_setgroupitem (integer groupid, integer itemid);IF groupid <= 0 THEN RETURN 0
IF groupid > UpperBound(ToolbarItemsLeft) THEN RETURN 0

SetRedraw(FALSE)
ToolbarItemsLeft[groupid].SelectedChild = itemid

IF NOT ToolbarItemsLeft[groupid].IsLocked THEN
	ToolbarItemsLeft[groupid].tiptext = ToolbarItemsLeft[itemid].tiptext
	ToolbarItemsLeft[groupid].Text = ToolbarItemsLeft[itemid].Text
END IF

of_UpdatePoints()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_isoverchevron (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(ToolbarItemsLeft)
FOR ll_index = 1 to ll_count
	//skip if disabled
	IF NOT ToolbarItemsLeft[ll_index].Enabled THEN CONTINUE
	IF NOT ToolbarItemsLeft[ll_index].Visible THEN CONTINUE
	IF ToolbarItemsLeft[ll_index].Hidden THEN CONTINUE
	IF NOT ToolbarItemsLeft[ll_index].IsParent THEN CONTINUE
	
	lul_rgn = inv_win32.CreatePolygonRgn(ToolbarItemsLeft[ll_index].ChevronRegion, UPPERBOUND(ToolbarItemsLeft[ll_index].ChevronRegion), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_closedropmenu ();IF IsValid(iToolBarDropMenu) THEN
	iw_parent.CloseUserObject(iToolBarDropMenu)
END IF

RETURN 1
end function

private function integer of_displaydropmenu (integer al_groupid, integer xpos, integer ypos);Long ll_index, ll_count, ll_x, ll_y

IF il_CurrentOrientation = HORIZONTAL THEN
	ll_x = iw_parent.PointerX() - xpos + PixelsToUnits(ToolbarItemsLeft[al_groupid].PaintRegion[1].PX, XPixelsToUnits!)
	ll_y = iw_parent.PointerY() + (height - ypos - 4)
ELSE
	ll_x = iw_parent.PointerX() - xpos + width
	ll_y = iw_parent.PointerY()
END IF

ll_count = UpperBound(ToolbarItemsLeft)

IF IsValid(iToolBarDropMenu) THEN
	iw_parent.CloseUserObject(iToolBarDropMenu)
END IF

iw_parent.OpenUserObject(iToolBarDropMenu)

IF ToolbarItemsLeft[al_groupid].DropDownWidth > 0 THEN
	iToolBarDropMenu.Width = ToolbarItemsLeft[al_groupid].DropDownWidth
END IF

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].ParentItem = al_groupid THEN
		iToolBarDropMenu.of_AddItem(ToolbarItemsLeft[ll_index].Text, ToolbarItemsLeft[ll_index].Image, ll_index)
	END IF
NEXT

iToolBarDropMenu.of_SetTheme(il_CurrentTheme)
iToolBarDropMenu.of_SetToolbar(THIS)
iToolBarDropMenu.of_SetGroupItem(al_groupid)
iToolBarDropMenu.of_UpdatePoints()
iToolBarDropMenu.Height = iToolBarDropMenu.of_GetDrawHeight()
iToolBarDropMenu.Move(ll_x, ll_y)
iToolBarDropMenu.Visible = TRUE
iToolBarDropMenu.SetFocus()

Post of_ReleaseMouse()
iToolBarDropMenu.POST of_Capture()

RETURN 1
end function

public function integer of_addgroup (string as_text, string as_image);RETURN of_AddGroup(as_text, as_image, 0)
end function

public function integer of_cleargroup (integer al_group);Long ll_index, ll_count, ll_newindex
ToolbarItem ll_newitems[]

IF ToolbarItemsLeft[al_group].IsLocked THEN
	ll_count = UpperBound(ToolbarItemsLeft)
	
	FOR ll_index = 1 TO ll_count
		IF ToolbarItemsLeft[ll_index].parentitem <> al_group THEN
			ll_newindex = ll_newindex + 1
			ll_newitems[ll_newindex] = ToolbarItemsLeft[ll_index]
		END IF
	NEXT
	
	ToolbarItemsLeft = ll_newitems
ELSE
	RETURN 0
END IF

RETURN 1
end function

public function integer of_disabletooltips ();ib_displaytooltips = FALSE

RETURN 1
end function

public function integer of_enabletooltips ();ib_displaytooltips = TRUE

RETURN 1
end function

public function integer of_getactualwidth ();Long ll_item

ll_item = UpperBound(ToolbarItemsLeft)

RETURN PixelsToUnits(ToolbarItemsLeft[ll_item].PaintRegion[2].px, XPixelsToUnits!) + 20
end function

public function integer of_removeitem (long al_item);Long ll_index, ll_count, ll_loop, ll_item, ll_width
ToolBarItem luo_item
ToolBarItem luo_newitems[]

SetRedraw(FALSE)

ll_item = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_item
	IF ll_index <> al_item THEN
		ll_count++
		luo_newitems[ll_count] = ToolbarItemsLeft[ll_index]
	END IF
NEXT

ToolbarItemsLeft = luo_newitems

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_addgroup (string as_text, string as_image, integer al_dropdownwidth);Long ll_index, ll_count, ll_loop, ll_item, ll_width

ToolbarItem tbiButton

IF Len(Trim(as_text)) > 0 THEN
	tbiButton.IsLocked = TRUE
	tbiButton.Text = as_text
	tbiButton.SelectedChild = 1
END IF

tbiButton.Position = LEFT
tbiButton.IsParent = TRUE
tbiButton.Visible = TRUE
tbiButton.Enabled = TRUE
tbiButton.DisplayText = TRUE
tbiButton.separator = FALSE
tbiButton.DropDownWidth = al_dropdownwidth

IF Len(Trim(as_image)) > 0 THEN
	tbiButton.Image = as_image
	tbiButton.ImageIndex = of_AddImage(as_image)
END IF


ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

IF Len(Trim(as_text)) > 0 THEN
	of_UpdatePoints()
	
	IF AutoSize THEN
		THIS.Width = of_GetActualWidth()
	END IF	
	
	SetRedraw(TRUE)
END IF

RETURN ll_item
end function

public function integer of_addgroup (long al_dropdownwidth);RETURN of_AddGroup("","", al_dropdownwidth)
end function

public function integer of_displaytextunderimage ();TextUnderImage = TRUE
of_SetSize(il_CurrentSize)
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setminbuttonwidth (long al_width);MinWidth = al_width

RETURN 1
end function

public function integer of_quickaccessmode (long al_color);of_DisplayBorder(FALSE)
of_DisplaySolidBackground(TRUE)
ib_quickaccessmode = TRUE
il_custombackground = al_color
of_SetSize(SMALL)

RETURN 1
end function

public function long of_getindex (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ll_index
	END IF
	
NEXT

RETURN 0
end function

public function integer of_updatepointsquickaccess ();Long ll_index, ll_count, ll_x, ll_y, ll_textheight, ll_textwidth, ll_item, ll_childIndex
Long ll_width, ll_height, ll_dc, ll_controlWidth, ll_chevronwidth
boolean lb_SomeHidden = FALSE
point lp_empty[]
n_cst_toolbarstrip_painter ln_gradient
Point p

ll_count = UpperBound(ToolbarItemsLeft)

ll_y = 2
ll_x = 8

ll_height = il_CurrentSize + 4
ll_width = il_CurrentSize + 4
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)

ll_dc = inv_win32.GetDC(Handle(st_1))
ln_gradient.of_SetHDC(ll_dc)

uo_toolbarchevron.of_ClearItems()

FOR ll_index = 1 TO ll_count
	
	ll_item++
		
	ll_childIndex = ll_index
	ll_chevronwidth = 0
		
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	IF ll_index = il_index THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")				
	ELSE
		
	END IF
		
	IF ToolbarItemsLeft[ll_index].Separator THEN
		ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
		
		ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + 3
		ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - 1
		
		IF ToolbarItemsLeft[ll_index].PaintRegion[2].px > UnitsToPixels(of_GetWidth(), XUnitsToPixels!) THEN
			ToolbarItemsLeft[ll_index].Hidden = TRUE
			uo_toolbarchevron.of_RegisterItem(ToolbarItemsLeft[ll_index])
			lb_SomeHidden = TRUE
		ELSE
			ToolbarItemsLeft[ll_index].Hidden = FALSE
		END IF
		
		ll_x = ll_x + 5
	ELSE 
		ll_textwidth = 0
		ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
		
		ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
	
		ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
		ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_width + ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
		ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_width + ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + 2
		ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + 2
		
		ll_x = ll_x + ll_width + 2
	END IF

NEXT

inv_win32.ReleaseDC (Handle(st_1), ll_dc)

RETURN 1
end function

on u_cst_toolbarstrip.create
int iCurrent
call super::create
this.uo_toolbarchevron=create uo_toolbarchevron
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbarchevron
this.Control[iCurrent+2]=this.st_1
end on

on u_cst_toolbarstrip.destroy
call super::destroy
destroy(this.uo_toolbarchevron)
destroy(this.st_1)
end on

event onpaint;call super::onpaint;Long ll_color1, ll_color2

//BCW - 2.0.0
IF ib_solidbackground THEN
	ll_color1 = of_GetColor("BACKGROUND3")
	ll_color2 = of_GetColor("BACKGROUND3")
ELSE
	ll_color1 = of_GetColor("BACKGROUND1")
	ll_color2 = of_GetColor("BACKGROUND2")
END IF

in_Gradient.of_SetHDC(hdc)

boolean lb_Horizontal

IF il_CurrentOrientation = HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF
	
CHOOSE CASE il_CurrentStyle
	CASE XP
		in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAEMBOSSED
		in_Gradient.of_Vista1Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAORIGINAL
		in_Gradient.of_Vista2Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAGLASS
		in_Gradient.of_Vista3Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
	CASE CUSTOM
		in_Gradient.of_CustomGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
END CHOOSE
//BCW - 2.0.0

//of_VerticalGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,ib_displayborder,of_GetColor("BORDER"), il_CurrentStyle)

IF ib_raisedborder THEN
	in_Gradient.of_DrawLine(Width - 3,0,Width - 3, Height, of_GetColor("CAP"))
	in_Gradient.of_DrawLine(0,Height - 3,Width, Height - 3, of_GetColor("CAP"))
END IF

Long il_imagelist
CHOOSE CASE il_CurrentSize
	CASE SMALL
		il_imagelist = il_imagelistsmall
	CASE MEDIUM
		il_imagelist = il_imagelistmedium
	CASE LARGE
		il_imagelist = il_imagelistlarge
	CASE XLARGE
		il_imagelist = il_imagelistxlarge
END CHOOSE


in_Gradient.of_DrawButtons(THIS, ToolbarItemsLeft, FontName, FontSize, FontColor, il_ImageList, il_CurrentOrientation, il_ChevronIndex, TextUnderImage, ib_quickaccessmode)

of_DrawEval(hdc)

RETURN 1
end event

event destructor;call super::destructor;of_Reset()
end event

event constructor;call super::constructor;Long ll_color1, ll_color2, ll_index
n_cst_theme lnv_Theme
message l_message

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 

istr_TrackMouseEvent.cbSize = 16
istr_TrackMouseEvent.dwFlags = TME_LEAVE
istr_TrackMouseEvent.hwndTrack = Handle (THIS) 
istr_TrackMouseEvent.dwHoverTime = 0

of_getwindow()
uo_toolbarchevron.of_setparent(THIS)

//BCW - 2.0.0
IF Width > Height THEN
	il_CurrentOrientation = HORIZONTAL
ELSE
	il_CurrentOrientation = VERTICAL
END IF

of_SetSize(il_CurrentSize)
//BCW - 2.0.0

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

of_GetFontSize()

DESTROY l_message
end event

event other;call super::other;//appeon comment
//CHOOSE CASE Message.Number 
//	CASE WM_MOUSELEAVE
//		this.Event MouseLeave() 
//END CHOOSE
//appeon comment end
end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_toolbarstrip
end type

type uo_toolbarchevron from u_cst_toolbarchevron within u_cst_toolbarstrip
boolean visible = false
integer x = 439
integer taborder = 10
end type

on uo_toolbarchevron.destroy
call u_cst_toolbarchevron::destroy
end on

event constructor;call super::constructor;THIS.of_SetParent(PARENT)
end event

type st_1 from statictext within u_cst_toolbarstrip
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
string text = "   Toolbar Strip"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

