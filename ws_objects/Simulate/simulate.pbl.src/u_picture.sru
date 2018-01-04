$PBExportHeader$u_picture.sru
$PBExportComments$[이수미]픽쳐 클래스
forward
global type u_picture from picture
end type
end forward

global type u_picture from picture
string tag = "picturebutton"
integer width = 230
integer height = 202
string pointer = "HyperLink!"
boolean originalsize = true
boolean focusrectangle = false
event ue_mouseoverout pbm_mousemove
event ue_mouseup pbm_lbuttonup
event ue_mousedown pbm_lbuttondown
event ue_checkpoint ( )
event ue_enable pbm_enable
end type
global u_picture u_picture

type prototypes

end prototypes

type variables
Public:
	Boolean			CallEvent = False
	String			is_event
	
	CONSTANT	String		MOUSE_OVER	= "ov_"
	CONSTANT 	String		MOUSE_DOWN	= "cl_"
	CONSTANT 	String		ENABLE_FALS	= "df_"

Protected:
	String			btnname
	
Private:
	
	String			img_path, img_name
	Boolean			mouseover 
	n_timing			in_timer
	Decimal			INTERVAL		= 0.1
	Boolean			roleenabled = true
end variables

forward prototypes
public subroutine of_enable (boolean ab_enable)
public subroutine of_setevent (string as_event)
public function string of_getevent ()
public function string of_getpath ()
public function string of_getimgname ()
public subroutine of_setmouseover (boolean ab_mouseover)
public function boolean of_getmouseover ()
public subroutine of_ondisplay ()
public subroutine setroleenabled (boolean enable)
public function boolean getroleenabled ()
public function string getbtnname ()
public subroutine setbtnname (string as_btnname)
public subroutine setpicturename (string as_picturename)
end prototypes

event ue_mouseoverout;//Integer		li_x, li_y
//
IF xpos > 0 AND xpos < This.width AND ypos > 0 AND ypos < This.height THEN
	IF Not mouseover THEN
		mouseover = True
		This.PictureName = img_path + MOUSE_OVER + img_name
		This.SetRedRaw(True)
		of_ondisplay()
	END IF
ELSE
	IF mouseover THEN
		//ReleaseCapture()
		mouseover = False
		
		This.PictureName = img_path + img_name
		This.SetRedRaw(True)
		of_ondisplay()
	END IF
END IF


end event

event ue_mouseup;//This.PictureName = img_path + MOUSE_OVER + img_name
//This.SetRedRaw(True)
//


end event

event ue_mousedown;//This.PictureName = img_path + MOUSE_DOWN + img_name
//This.SetRedRaw(True)
//
end event

event ue_checkpoint();////POINT lp, lcp
//ulong ll
//ulong lul
//
//lul = Handle(This)
//
////IF psvc.GetCursorPos(lp) THEN
//	//IF psvc.Screentoclient(lul, lp) THEN
//		IF pointerx() > 0 AND pointerx() < UnitsToPixels(This.width, XUnitsToPixels!) AND pointery()  > 0 AND pointery() < UnitsToPixels(This.height, YUnitsToPixels!) THEN
//			IF Not mouseover THEN
//				//SetCapture(Handle(This))
//				mouseover = True
//				This.PictureName = img_path + MOUSE_OVER + img_name
//				This.SetRedRaw(True)
//				of_ondisplay()
//			END IF
//		ELSE
//			IF mouseover THEN
//				//ReleaseCapture()
//				mouseover = False
//				This.PictureName = img_path + img_name
//				This.SetRedRaw(True)
//				of_ondisplay()
//			END IF
//		END IF
//
//	//END IF
////END IF
//
end event

event ue_enable;//IF enable THEN
//	This.PictureName = img_path + img_name
//ELSE
//	This.PictureName = img_path + ENABLE_FALS + img_name
//END IF
end event

public subroutine of_enable (boolean ab_enable);IF Not getroleenabled() THEN ab_enable = getroleenabled()

IF ab_enable THEN
	This.PictureName = img_path + img_name
ELSE
	This.PictureName = img_path + ENABLE_FALS + img_name
END IF

This.Enabled = ab_enable
end subroutine

public subroutine of_setevent (string as_event);is_event = as_event
end subroutine

public function string of_getevent ();return is_event
end function

public function string of_getpath ();return img_path
end function

public function string of_getimgname ();return img_name
end function

public subroutine of_setmouseover (boolean ab_mouseover);mouseover = ab_mouseover
end subroutine

public function boolean of_getmouseover ();return mouseover 
end function

public subroutine of_ondisplay ();IF mouseover THEN
	IF Not IsValid(in_timer) THEN
		in_timer = CREATE n_timing
		in_timer.event ke_setparent(this, "ue_checkpoint")
		in_timer.Start(INTERVAL)
	END IF
ELSE
	IF ISVALID(in_timer) THEN
		in_timer.Stop()
		DESTROY in_timer
	END IF
END IF
end subroutine

public subroutine setroleenabled (boolean enable);roleenabled = enable

of_enable(enable)
end subroutine

public function boolean getroleenabled ();return roleenabled
end function

public function string getbtnname ();return btnname
end function

public subroutine setbtnname (string as_btnname);btnname = as_btnname
end subroutine

public subroutine setpicturename (string as_picturename);//V1.9.9.054 이미지 변경 함수를 추가하였다.
Integer		li_pos

this.setRedraw( false)
this.picturename = as_picturename

li_pos = LastPos(this.picturename, "\")
img_path 	= Left(This.Picturename, li_pos)
img_name	= Right(This.Picturename, Len(This.Picturename) - li_pos)

This.of_enable( this.Enabled )
//This.Enabled = False
this.setRedraw( True )
end subroutine

on u_picture.create
end on

on u_picture.destroy
end on

event clicked;//psvc.ReleaseCapture()
//IF CallEvent THEN
//	//V1.9.9.104 기능추가.
//	Parent.Dynamic PostEvent(is_event)
//END IF

end event

event destructor;SetPointer(Arrow!)
	//in_timer.Stop()
		//DESTROY in_timer
//destroy psvc;
end event

event constructor;//V1.9.9.054 이미지 변경 함수를 추가하였다.
this.Enabled = False
this.setpicturename(this.picturename)
//===========================
//Integer		li_pos
//
//li_pos = LastPos(this.picturename, "\")
//img_path 	= Left(This.Picturename, li_pos)
//img_name	= Right(This.Picturename, Len(This.Picturename) - li_pos)
//
//This.of_enable(False)
//============================
end event

