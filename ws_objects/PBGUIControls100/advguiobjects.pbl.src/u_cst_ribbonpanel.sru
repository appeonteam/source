$PBExportHeader$u_cst_ribbonpanel.sru
forward
global type u_cst_ribbonpanel from u_cst_canvas
end type
end forward

global type u_cst_ribbonpanel from u_cst_canvas
integer width = 626
integer height = 308
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event lbuttonup pbm_lbuttonup
event type integer mouseleave ( )
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event resize pbm_size
end type
global u_cst_ribbonpanel u_cst_ribbonpanel

type prototypes

end prototypes

type variables
n_cst_ui_imagelist inv_imagelist

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

Long il_selected
Long il_index
Long il_pressedIndex
Boolean ib_dirty
Boolean ib_mousecaptured
Boolean ib_MouseDown
Boolean ib_mouseleave
Boolean ib_leftscrollvisible
Boolean ib_rightscrollvisible
long il_ID
Long ll_oldWidth
n_cst_tooltip inv_tooltip
ribbonitem items[]

CONSTANT Long SMALL = 0
CONSTANT Long LARGE = 1
CONSTANT Long SMALLCOLLECTION = 2
CONSTANT Long LARGECOLLECTION = 3

Long il_currenttheme
Long il_imagecount
ULong il_imagelistsmall
ULong il_imagelistlarge

n_cst_ribbongroup groups[]

window iw_parent
u_cst_ribboncontainer iuo_container

n_hashtable groupcollection
n_cst_ribbongroup_painter in_gradient

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
end variables

forward prototypes
public function integer of_loadfrommenu (menu a_menu)
public function long of_settheme (long al_theme)
private function integer of_getgroups (menu a_menu, ref string a_groups[])
private function long of_getcolor (string as_color)
public function integer of_setparentwindow (window aw_parent)
public function integer of_groupsizechanged ()
public function integer of_addimage (string as_image)
private function string of_getgroupname (menu a_menu)
public function long of_indexfrompoint (long xpos, long ypos)
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_mouseover (long al_index)
private function string of_gettiptext (menu a_menu)
private function string of_removeampersand (string as_text)
public function boolean of_isoverleftscroll (long xpos)
public function boolean of_isoverrightscroll (long xpos)
public function integer of_scrollright ()
public function integer of_scroll (long a_change)
public function integer of_addscrollbars ()
public function integer of_setcontainer (u_cst_ribboncontainer auo_container)
end prototypes

event lbuttonup;Long ll_index

THIS.SetFocus()

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 AND ll_index = il_pressedIndex THEN
	IF items[ll_index].a_menu.Enabled THEN
		CHOOSE CASE items[ll_index].ai_type
			CASE SMALL, LARGE
				items[ll_index].a_menu.PostEvent("Clicked")
			CASE LARGECOLLECTION, SMALLCOLLECTION
				items[ll_index].a_menu.PopMenu ( PixelsToUnits(items[ll_index].ast_point[1].px, XPixelsToUnits!) + iuo_container.X, &
															PixelsToUnits(items[ll_index].ast_point[3].py, YPixelsToUnits!) + THIS.Y + iuo_container.of_GetY() )
				
		END CHOOSE
	END IF
	
	items[ll_index].ab_mouseover = FALSE
	items[ll_index].ab_selected = FALSE
END IF

SetRedraw(TRUE)

IF iuo_container.ib_expanded AND NOT iuo_container.ib_docked  THEN
	iuo_container.of_UnDock()
END IF
end event

event type integer mouseleave();IF il_index > 0 THEN
	IF il_selected = il_index THEN
		
		items[il_index].ab_mouseover = FALSE
	ELSE
		items[il_index].ab_selected = FALSE
		items[il_index].ab_mouseover = FALSE
	END IF
END IF

il_index = 0

SetRedraw(TRUE)

RETURN 1
end event

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;String ls_tiptext
Long ll_index

if NOT of_ismousecaptured() then 
	
	IF iuo_container.of_GetParent().of_RibbonMenu().Visible THEN
		inv_tooltip.of_UpdatetipRect( This, il_ID, &
													0, 0, &
													0, &
													0 )
		RETURN 0
	END IF
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
	
		of_releasemouse()
		
		this.event post mouseleave()
	
	ELSE
		
		IF of_IsOverLeftScroll(xpos) THEN
			of_Scroll(-8)
			RETURN
		END IF
		
		IF of_IsOverRightScroll(xpos) THEN
			of_Scroll(8)
			RETURN
		END IF
		
		ll_index = of_IndexFromPoint(xpos, ypos)
		IF il_index <> ll_index THEN
			of_MouseOver(ll_index)
			
			IF ll_index > 0 THEN
				Long li_X, li_Y, ll_return
	
				IF il_Id > 0 THEN
					li_X = 0
					li_Y = 0
					inv_tooltip.of_UpdatetipRect( This, il_ID, &
													li_x, li_y, &
													li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
													li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
						
					inv_tooltip.Of_SetTipText( This, il_Id, of_GetTipText(items[ll_index].a_menu)) 
				
				END IF
			ELSE
				inv_tooltip.of_UpdatetipRect( This, il_ID, &
													0, 0, &
													0, &
													0 )
			END IF
			
		END IF
	
	end if

end if
end event

event lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

il_pressedIndex = ll_index

IF ll_index > 0 THEN
	il_index = ll_index
	items[il_index].ab_selected = TRUE
	
	SetRedraw(TRUE)
END IF
end event

event resize;call super::resize;of_AddScrollbars()

IF NOT ib_leftscrollvisible AND ib_rightscrollvisible THEN
	IF NewWidth > ll_oldWidth THEN
		of_Scroll(NewWidth - ll_oldWidth)
	END IF
END IF

ll_oldWidth = Width

SetRedraw(TRUE)
end event

public function integer of_loadfrommenu (menu a_menu);string ls_groups[]
Long ll_index, ll_count, ll_x, ll_type
n_cst_ribbongroup l_group
ribbonitem empty[]

ll_count = of_GetGroups(a_menu, ls_groups)
ll_x = 10

FOR ll_index = 1 TO ll_count
	groups[UpperBound(groups) + 1] = CREATE n_cst_ribbongroup
	
	IF ll_index > 1 THEN
		ll_x = groups[UpperBound(groups) - 1].X + groups[UpperBound(groups) - 1].Width + 10
	END IF
	
	groups[UpperBound(groups)].of_FontColor(0)
	groups[UpperBound(groups)].of_SetTheme(il_currenttheme)
	groups[UpperBound(groups)].X = ll_x
	groups[UpperBound(groups)].Y = 0
	groups[UpperBound(groups)].Height = THIS.Height - 5
	groups[UpperBound(groups)].Width = 400
	groups[UpperBound(groups)].iuo_parent = THIS
	
	groups[UpperBound(groups)].of_Text(ls_groups[ll_index])
	
	groupcollection.Put(ls_groups[ll_index], groups[UpperBound(groups)])
NEXT

FOR ll_index = 1 TO UpperBound(a_menu.item)
	IF a_menu.item[ll_index].Text = "-" THEN CONTINUE
	IF a_menu.item[ll_index].Visible = FALSE THEN CONTINUE
	
	l_group = groupcollection.Get(of_GetGroupName(a_menu.item[ll_index]))
	
	IF UpperBound(a_menu.item[ll_index].Item) > 0 THEN
		IF Pos(Lower(a_menu.item[ll_index].Tag), "size:large", 1) > 0 THEN
			ll_type = l_group.LARGECOLLECTION
		ELSE
			ll_type = l_group.SMALLCOLLECTION
		END IF
	ELSEIF Pos(Lower(a_menu.item[ll_index].Tag), "size:large", 1) > 0 THEN
		ll_type = l_group.LARGE
	ELSE
		ll_type = l_group.SMALL
	END IF
	
	l_group.of_AddItem(ll_type, a_menu.item[ll_index])

NEXT

items = empty

FOR ll_index = 1 TO UpperBound(ls_groups)
	l_group = groupcollection.Get(ls_groups[ll_index])
	l_group.of_UpdatePoints()
	l_group.of_CopyItems(items)
	of_GroupSizeChanged()
NEXT

RETURN 1
end function

public function long of_settheme (long al_theme);il_currenttheme = al_theme

THIS.BackColor = of_GetColor("BackGround1")

RETURN 1
end function

private function integer of_getgroups (menu a_menu, ref string a_groups[]);Long ll_index, ll_pos, ll_pos2
Long ll_index2
Boolean lb_addblank, lb_found
String ls_name

IF NOT IsValid(a_menu) THEN RETURN 0

FOR ll_index = 1 TO UpperBound(a_menu.item)
	IF a_menu.item[ll_index].Text = "-" THEN CONTINUE
	IF a_menu.item[ll_index].Visible = FALSE THEN CONTINUE
	
	ls_name = of_GetGroupName(a_menu.item[ll_index])
	
	IF Len(Trim(ls_name)) > 0 THEN
		
		lb_found = FALSE
		
		FOR ll_index2 = 1 TO UpperBound(a_groups)
			IF Lower(a_groups[ll_index2]) = Lower(ls_name) THEN 
				lb_found = TRUE
				EXIT
			END IF
		NEXT
		
		IF NOT lb_found THEN a_groups[UpperBound(a_groups) + 1] = ls_name
		
	ELSE
		lb_addblank = TRUE
	END IF
NEXT

IF lb_addblank THEN a_groups[UpperBound(a_groups) + 1] = " "

RETURN UpperBound(a_groups)
end function

private function long of_getcolor (string as_color);Long ll_color

CHOOSE CASE Upper(as_color)
	CASE "BORDER"
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
				ll_color = RGB(182,207,242)
			CASE SILVER
				ll_color = RGB(201,201,218)
			CASE OLIVE
				ll_color = RGB(213,222,183)
			CASE CLASSIC
				ll_color = RGB(230,228,223)
		END CHOOSE
	CASE "SCROLLBAR"
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
END CHOOSE

RETURN ll_color
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent

RETURN 1
end function

public function integer of_groupsizechanged ();Long ll_index, ll_count
Long ll_x

ll_count = UpperBound(groups)

IF ll_count > 0 THEN
	ll_x = groups[1].X
	
	FOR ll_index = 1 TO ll_count
		groups[ll_index].X = ll_x
		ll_x = groups[ll_index].X + 10 + groups[ll_index].Width
	NEXT
	
	of_AddScrollbars()
	
END IF

RETURN 1
end function

public function integer of_addimage (string as_image);IF Len(Trim(as_image)) > 0 THEN
	il_imagecount = il_imagecount + 1
	
	Long ll_index
	
	ll_index = inv_imagelist.of_AddImage(as_image)

	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	il_imagelistlarge = inv_imagelist.of_GetLargeHandle()

	RETURN ll_index
	
END IF

RETURN 0
end function

private function string of_getgroupname (menu a_menu);Long ll_pos, ll_pos2
String ls_tag, ls_group

ls_tag = a_menu.tag

ll_pos = Pos(Lower(ls_tag), "group:", 1)
	
IF ll_pos > 0 THEN
	ll_pos = ll_pos + Len("group:")
	ll_pos2 = Pos(ls_tag, ";", ll_pos)
	
	IF ll_pos2 = 0 THEN 
		ll_pos2 = Len(ls_tag)
	ELSE
		ll_pos2 = ll_pos2 - 1
	END IF
		
	RETURN Trim(Mid(ls_tag, ll_pos, ll_pos2 - ll_pos + 1))

END IF

ls_group = a_menu.Text
ll_pos = Pos(a_menu.Text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(ls_group, ll_pos, 1, "")
ELSE
	RETURN ls_group
END IF
end function

public function long of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

IF of_IsOverLeftScroll(xpos) OR of_IsOverRightScroll(xpos) THEN
	RETURN -1
END IF

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(items)
FOR ll_index = 1 to ll_count
	//skip if disabled
	IF NOT items[ll_index].a_menu.Enabled THEN CONTINUE
	lul_rgn = inv_win32.CreatePolygonRgn(items[ll_index].ast_point, UPPERBOUND(items[ll_index].ast_point), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_capturemouse ();

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();RETURN ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	items[il_index].ab_mouseover = FALSE
	items[il_index].ab_selected = FALSE
END IF

IF al_index > 0 THEN
	IF KeyDown(KeyLeftButton!) THEN
		IF al_index = il_pressedIndex THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = FALSE
			items[al_index].ab_selected = FALSE
		END IF
	ELSE
		IF il_selected = al_index THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = FALSE
		END IF
	END IF
END IF

il_index = al_index

ib_dirty = FALSE
SetRedraw(TRUE)

RETURN 1
end function

private function string of_gettiptext (menu a_menu);String ls_tiptext
Long ll_pos

ls_tiptext = of_RemoveAmpersand(a_menu.Text)
					
ll_pos = Pos(ls_tiptext, "~t", 1)

IF ll_pos > 0 THEN
	ls_tiptext = Replace(ls_tiptext, ll_pos, 1, "  (") + ")"
END IF
					
IF Len(Trim(a_menu.MicroHelp)) > 0 THEN
	ls_tiptext = ls_tiptext + "~r~n~r~n" + a_menu.MicroHelp
END IF

RETURN ls_tiptext
end function

private function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

public function boolean of_isoverleftscroll (long xpos);IF ib_leftscrollvisible THEN
	IF xpos <= 40 THEN
		RETURN TRUE
	END IF
END IF

RETURN FALSE
end function

public function boolean of_isoverrightscroll (long xpos);IF ib_rightscrollvisible THEN
	IF Width - xpos <= 40 THEN
		RETURN TRUE
	END IF
END IF

RETURN FALSE
end function

public function integer of_scrollright ();RETURN 1
end function

public function integer of_scroll (long a_change);Long ll_index, ll_count
ribbonitem empty[]

ll_count = UpperBound(groups)

IF ll_count > 0 THEN
	SetRedraw(FALSE)
	
	groups[1].X = groups[1].X + a_change
	
	IF groups[1].X > 10 THEN
		groups[1].X = 10
	END IF
	
	items = empty

	FOR ll_index = 1 TO ll_count
		groups[ll_index].of_UpdatePoints()
		groups[ll_index].of_CopyItems(items)
		of_GroupSizeChanged()
	NEXT

	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_addscrollbars ();Long ll_count

ll_count = UpperBound(groups)

IF ll_count > 0 THEN
	IF groups[ll_count].X + groups[ll_count].Width < Width THEN
		ib_leftscrollvisible = FALSE
	ELSE
		ib_leftscrollvisible = TRUE
	END IF
	
	IF groups[1].X < 0 THEN
		ib_rightscrollvisible = TRUE
	ELSE
		ib_rightscrollvisible = FALSE
	END IF
END IF

RETURN 1
end function

public function integer of_setcontainer (u_cst_ribboncontainer auo_container);iuo_container = auo_container

RETURN 1
end function

on u_cst_ribbonpanel.create
call super::create
end on

on u_cst_ribbonpanel.destroy
call super::destroy
end on

event onpaint;call super::onpaint;Long ll_index, ll_count
n_cst_ribbongroup l_group

in_Gradient.of_SetHDC(hdc)

in_Gradient.of_DrawBackground(of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"),UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!))

ll_count = UpperBound(groups)

FOR ll_index = 1 TO ll_count
	l_group = groups[ll_index]
	
	strGroupBox lstr_GroupBox
	
	lstr_GroupBox.text = l_group.#Text
	lstr_GroupBox.fontfamily = l_group.#FontFamily
	lstr_GroupBox.fontsize = l_group.#FontSize
	lstr_GroupBox.bold = l_group.#Bold
	lstr_GroupBox.italics = l_group.#Italic
	lstr_GroupBox.strikeout = l_group.#StrikeOut
	lstr_GroupBox.underline = l_group.#Underline
	lstr_GroupBox.fontcolor = l_group.#FontColor
	lstr_GroupBox.backcolor = l_group.of_GetColor()
	lstr_GroupBox.bordercolor = of_GetColor("BORDER")
	lstr_GroupBox.gradientdirection = 'V'
	lstr_GroupBox.X = UnitsToPixels(l_group.X, XUnitsToPixels!)
	lstr_GroupBox.Y = UnitsToPixels(l_group.Y, YUnitsToPixels!)
	lstr_GroupBox.Width = UnitsToPixels(l_group.Width, XUnitsToPixels!)
	lstr_GroupBox.Height = UnitsToPixels(l_group.Height, YUnitsToPixels!)

	in_Gradient.of_DrawRibbonGroup (THIS, lstr_GroupBox)
NEXT

in_Gradient.of_DrawRibbonItems (il_imagelistsmall, il_imagelistlarge, items)

IF ib_leftscrollvisible THEN
	in_Gradient.of_DrawLeftScroll (hdc, THIS, of_GetColor("SCROLLBAR"))
END IF

IF ib_rightscrollvisible THEN
	in_Gradient.of_DrawRightScroll (hdc, THIS, of_GetColor("SCROLLBAR"))
END IF

of_DrawEval(hdc)

RETURN 1
end event

event constructor;call super::constructor;il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 

end event

type p_canvas from u_cst_canvas`p_canvas within u_cst_ribbonpanel
end type

