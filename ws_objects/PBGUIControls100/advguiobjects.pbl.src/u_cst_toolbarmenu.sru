$PBExportHeader$u_cst_toolbarmenu.sru
forward
global type u_cst_toolbarmenu from u_cst_buttonlistbar
end type
end forward

global type u_cst_toolbarmenu from u_cst_buttonlistbar
boolean visible = false
boolean ib_boldselected = true
long il_currentsize = 16
long il_currentstyle = 2
event losefocus pbm_killfocus
event lbuttondown pbm_lbuttondown
event keydown pbm_keydown
end type
global u_cst_toolbarmenu u_cst_toolbarmenu

type variables
u_cst_toolbarstrip iToolbar
long il_GroupItem

Boolean ib_mousein
end variables

forward prototypes
public function integer of_settoolbar (u_cst_toolbarstrip atoolbar)
public function integer of_setgroupitem (long al_groupitem)
public function integer of_capture ()
public function long of_getcolor (string as_color)
end prototypes

event lbuttondown;IF NOT ib_mousein THEN
	inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
END IF
end event

event keydown;inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
end event

public function integer of_settoolbar (u_cst_toolbarstrip atoolbar);iToolbar = aToolbar

RETURN 1
end function

public function integer of_setgroupitem (long al_groupitem);il_GroupItem = al_groupitem

RETURN 1
end function

public function integer of_capture ();inv_win32.SetCapture(Handle(THIS))

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
			CASE DEFAULT
//				ll_color = GetSysColor(16)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(4,56,148)
			CASE SILVER
				ll_color = RGB(112,111,145)
			CASE OLIVE
				ll_color = RGB(99,122,68)
			CASE CLASSIC
				ll_color = RGB(128,128,128)
			CASE DEFAULT
//				ll_color = GetSysColor(16)
		END CHOOSE
	CASE "HOVER1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(255,255,220)
			CASE SILVER
				ll_color = RGB(255,255,220)
			CASE OLIVE
				ll_color = RGB(255,255,220)
			CASE CLASSIC
				ll_color = RGB(182,189,210)
			CASE DEFAULT
				ll_color = 16777215
		END CHOOSE
	CASE "HOVER2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(247,192,91)
			CASE SILVER
				ll_color = RGB(247,192,91)
			CASE OLIVE
				ll_color = RGB(247,192,91)
			CASE CLASSIC
				ll_color = RGB(182,189,210)
			CASE DEFAULT
				ll_color = 16777215
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
	CASE "HOVERSELECTED1"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(232,127,8)
			CASE SILVER
				ll_color = RGB(232,127,8)
			CASE OLIVE
				ll_color = RGB(232,127,8)
			CASE CLASSIC
				ll_color = RGB(133,146,181)
			CASE DEFAULT
//				ll_color = GetSysColor (11)		
		END CHOOSE
	CASE "HOVERSELECTED2"
		CHOOSE CASE il_CurrentTheme
			CASE BLUE
				ll_color = RGB(247,219,124)
			CASE SILVER
				ll_color = RGB(247,219,124)
			CASE OLIVE
				ll_color = RGB(247,219,124)
			CASE CLASSIC
				ll_color = RGB(133,146,181)
			CASE DEFAULT
//				ll_color = GetSysColor (11)				
		END CHOOSE
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
			CASE DEFAULT
//				ll_color = GetSysColor (0)		
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
			CASE DEFAULT
//				ll_color = GetSysColor (0)			
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

on u_cst_toolbarmenu.create
call super::create
end on

on u_cst_toolbarmenu.destroy
call super::destroy
end on

event selectionchanged;call super::selectionchanged;Long ll_item

ll_item = Long(of_GetData(newIndex))

iToolbar.of_SetGroupItem(il_GroupItem, ll_item)
iToolbar.Event ue_ButtonClicked(of_GetText(newIndex))

inv_win32.ReleaseCapture()

iToolbar.Post of_CloseDropMenu()
end event

event mousemove;Long ll_index

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
		
		ib_mousein = FALSE
		
		IF ll_index <> 0 THEN
			ll_index = 0
			of_MouseOver(ll_index)
		END IF
	ELSE
		ib_mousein = TRUE
		
		ll_index = of_IndexFromPoint(xpos, ypos)
		IF il_index <> ll_index THEN
			of_MouseOver(ll_index)
		END IF
	
	end if

end if
end event

event mouseenter;call super::mouseenter;ib_mousein = TRUE
end event

type uo_scrolldown from u_cst_buttonlistbar`uo_scrolldown within u_cst_toolbarmenu
end type

type uo_scrollup from u_cst_buttonlistbar`uo_scrollup within u_cst_toolbarmenu
end type

type st_buttonlistbarlabel from u_cst_buttonlistbar`st_buttonlistbarlabel within u_cst_toolbarmenu
end type

