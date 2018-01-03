$PBExportHeader$w_powerdockfloat.srw
forward
global type w_powerdockfloat from window
end type
type uo_header from u_cst_powerdockpanelheader within w_powerdockfloat
end type
type rect from structure within w_powerdockfloat
end type
type inv_win32 from n_cst_win32 within w_powerdockfloat
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type w_powerdockfloat from window
boolean visible = false
integer width = 2994
integer height = 1040
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
uo_header uo_header
inv_win32 inv_win32
end type
global w_powerdockfloat w_powerdockfloat

type prototypes

end prototypes

type variables
Constant Long GWL_STYLE = -16
CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CYBORDER = 6

u_cst_powerdock iuo_powerdock
Window iw_parentwindow

Window iw_object
UserObject iuo_object

String is_fname
Long il_handle
Boolean ib_moving
Boolean ib_bypassclose
Long il_lastx
Long il_lasty
Long il_style
end variables

forward prototypes
public function integer of_addobject (string as_text, userobject auo_object)
public function integer of_addobject (string as_text, window aw_object)
public function integer of_setpowerdock (u_cst_powerdock auo_powerdock)
public function integer of_floatmode ()
public function integer of_setparentwindow (window aw_parent)
public function integer of_move (long al_x, long al_y)
public function integer of_settheme (long al_theme)
public function integer of_settext (string as_text)
public function userobject of_getchildobject ()
public function window of_getchildwindow ()
end prototypes

public function integer of_addobject (string as_text, userobject auo_object);inv_win32.SetParent(Handle(auo_object), Handle(THIS))

iuo_object = auo_object

uo_header.of_SetText("  " + as_text, uo_header.LEFT)

TriggerEvent("Resize")

iuo_object.Show()

RETURN 1
end function

public function integer of_addobject (string as_text, window aw_object);inv_win32.SetParent(Handle(aw_object), Handle(THIS))

iw_object = aw_object

uo_header.of_SetText("  " + as_text, uo_header.LEFT)

TriggerEvent("Resize")

aw_object.Show()

RETURN 1
end function

public function integer of_setpowerdock (u_cst_powerdock auo_powerdock);iuo_powerdock = auo_powerdock
RETURN 1
end function

public function integer of_floatmode ();Long ll_x, ll_y, ll_width, ll_height

il_lastx = -1
il_lasty = -1
ib_moving = TRUE
inv_win32.SetCapture(Handle(uo_header))
SetRedraw(TRUE)


RETURN 1
end function

public function integer of_setparentwindow (window aw_parent);iw_parentwindow = aw_parent

RETURN 1
end function

public function integer of_move (long al_x, long al_y);Long ll_x, ll_y

ll_x = iw_parentwindow.X + al_x
ll_y = iw_parentwindow.Y + iw_parentwindow.PointerY() + (uo_header.Height / 2)

Move(ll_x, ll_y) 

RETURN 1
end function

public function integer of_settheme (long al_theme);RETURN uo_header.of_SetTheme(al_theme)
end function

public function integer of_settext (string as_text);uo_header.of_SetText("  " + as_text, uo_header.LEFT)

RETURN 1
end function

public function userobject of_getchildobject ();RETURN iuo_object
end function

public function window of_getchildwindow ();RETURN iw_object
end function

on w_powerdockfloat.create
this.uo_header=create uo_header
this.inv_win32=create inv_win32
this.Control[]={this.uo_header}
end on

on w_powerdockfloat.destroy
destroy(this.uo_header)
destroy(this.inv_win32)
end on

event open;uo_header.of_SetTextColor(RGB(255,255,255), uo_header.LEFT)

ib_moving = TRUE
of_FloatMode()
end event

event resize;uo_header.Width = WorkSpaceWidth()

IF IsValid(iuo_object) THEN
	iuo_object.Move(0,uo_header.Height)
	iuo_object.Resize(WorkSpaceWidth(), WorkSpaceHeight() - uo_header.Height)
END IF

IF IsValid(iw_object) THEN
	iw_object.Move(0,uo_header.Height)
	iw_object.Resize(WorkSpaceWidth(), WorkSpaceHeight() - uo_header.Height)
END IF
end event

event closequery;IF NOT ib_bypassclose THEN
	IF IsValid(iuo_object) THEN
		iuo_object.Hide()
		inv_win32.SetParent(Handle(iuo_object), Handle(iw_parentwindow))
		iw_parentwindow.CloseUserObject(iuo_object)
	END IF
	
	IF IsValid(iw_object) THEN
		IF Close(iw_object) <> 1 THEN
			RETURN 1
		END IF
	END IF
END IF

iuo_powerdock.of_ActivateCurrentDocument()

RETURN 0
end event

event activate;IF IsValid(iw_object) THEN
	iw_object.TriggerEvent('Activate')
END IF

IF IsValid(iuo_powerdock) THEN
	iuo_powerdock.iw_activefloatwindow = THIS
END IF
end event

event deactivate;IF IsValid(iw_object) THEN
	iw_object.TriggerEvent('Deactivate')
END IF
end event

type uo_header from u_cst_powerdockpanelheader within w_powerdockfloat
integer height = 76
integer taborder = 20
end type

event mousewithin;IF NOT ib_moving THEN
	
	il_x = xpos
	il_y = ypos
	
	if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
	else
		
		if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
			ib_moving = false
			of_releasemouse()
			this.event post mouseleave()
	
		ELSE
			IF of_IsOverPin(il_x, il_y) THEN
				IF NOT ib_overpin THEN
					ib_overpin = TRUE
					SetRedraw(TRUE)
				END IF
			ELSE
				IF ib_overpin THEN
					ib_overpin = FALSE
					SetRedraw(TRUE)
				END IF
			END IF
			
			IF of_IsOverX(il_x, il_y) THEN
				IF NOT ib_overX THEN
					ib_overX = TRUE
					SetRedraw(TRUE)
				END IF
			ELSE
				IF ib_overX THEN
					ib_overX = FALSE
					SetRedraw(TRUE)
				END IF
			END IF
		end if
		
	end if
	
ELSE
	IF il_lastx = -1 OR il_lasty = -1 THEN
		il_lastx = xpos
		il_lasty = ypos
	END IF
	
	PARENT.Move(PARENT.X + (xpos - il_lastx), PARENT.Y + (ypos - il_lasty))
end if

end event

event lbuttondown;call super::lbuttondown;of_FloatMode()
end event

event lbuttonup;call super::lbuttonup;ib_moving = FALSE
inv_win32.ReleaseCapture()



IF uo_header.of_IsOverX(xpos, ypos) THEN
	ib_bypassclose = FALSE

	IF IsValid(iw_object) THEN
		iuo_powerdock.of_CloseDocument(iw_object)
	ELSE
		IF IsValid(iuo_object) THEN
			iuo_powerdock.of_CloseDocument(iuo_object)
		END IF
	END IF
ELSE

	IF uo_header.of_IsOverPin(xpos, ypos) THEN
		
		ib_bypassclose = TRUE
		
		IF IsValid(iw_object) THEN
			iw_object.Hide()
			inv_win32.SetParent(Handle(iw_object), Handle(iw_parentwindow))
			iuo_powerdock.of_GetDocumentTabControl().of_AttachTab(iw_object)
		END IF
		
		IF IsValid(iuo_object) THEN
			iuo_object.Hide()
			inv_win32.SetParent(Handle(iuo_object), Handle(iw_parentwindow))
			iuo_powerdock.of_GetDocumentTabControl().of_AttachTab(iuo_object)
		END IF
		
		Close(PARENT)
	END IF
	
END IF

end event

on uo_header.destroy
call u_cst_powerdockpanelheader::destroy
end on

type inv_win32 from n_cst_win32 within w_powerdockfloat descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

