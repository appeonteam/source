$PBExportHeader$wn_ink_demo.srw
forward
global type wn_ink_demo from window
end type
type cb_reset from commandbutton within wn_ink_demo
end type
type cb_print from commandbutton within wn_ink_demo
end type
type cb_save from commandbutton within wn_ink_demo
end type
type cb_clear from commandbutton within wn_ink_demo
end type
type htb_pen from htrackbar within wn_ink_demo
end type
type st_1 from statictext within wn_ink_demo
end type
type cb_colour from commandbutton within wn_ink_demo
end type
type cb_load from commandbutton within wn_ink_demo
end type
type ip_ink from inkpicture within wn_ink_demo
end type
end forward

global type wn_ink_demo from window
integer width = 3657
integer height = 1980
boolean titlebar = true
string title = "Ink Picture"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "C:\Dev\PB12.6\InkDemo\PB.ico"
boolean center = true
event ue_postopen ( )
cb_reset cb_reset
cb_print cb_print
cb_save cb_save
cb_clear cb_clear
htb_pen htb_pen
st_1 st_1
cb_colour cb_colour
cb_load cb_load
ip_ink ip_ink
end type
global wn_ink_demo wn_ink_demo

type variables
appeonextfuncs		io_appeon

String					is_FileNameWithPath
String					is_FileName
end variables

event ue_postopen();io_appeon	=	 CREATE  appeonextfuncs
end event

on wn_ink_demo.create
this.cb_reset=create cb_reset
this.cb_print=create cb_print
this.cb_save=create cb_save
this.cb_clear=create cb_clear
this.htb_pen=create htb_pen
this.st_1=create st_1
this.cb_colour=create cb_colour
this.cb_load=create cb_load
this.ip_ink=create ip_ink
this.Control[]={this.cb_reset,&
this.cb_print,&
this.cb_save,&
this.cb_clear,&
this.htb_pen,&
this.st_1,&
this.cb_colour,&
this.cb_load,&
this.ip_ink}
end on

on wn_ink_demo.destroy
destroy(this.cb_reset)
destroy(this.cb_print)
destroy(this.cb_save)
destroy(this.cb_clear)
destroy(this.htb_pen)
destroy(this.st_1)
destroy(this.cb_colour)
destroy(this.cb_load)
destroy(this.ip_ink)
end on

event resize;
ip_ink.resize ( newwidth - 20 , newheight - (this.y + 10))
end event

event open;THIS.POST event ue_postopen ( )
end event

type cb_reset from commandbutton within wn_ink_demo
integer x = 992
integer y = 12
integer width = 283
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reset"
end type

event clicked;ip_ink.resetink ( )
ip_ink.resetpicture( )

is_filename				=	""
is_filenamewithpath	=	""


end event

type cb_print from commandbutton within wn_ink_demo
integer x = 2930
integer y = 12
integer width = 283
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print ..."
end type

event clicked;SystemFunctions		lo_sf
Integer					li_rc

li_rc	=	PrintOpen ( "Ink Picture" )												// Open print job?
IF li_rc > 0 THEN																			// Job OK?
	ip_ink.print ( li_rc, ip_ink.X, ip_ink.Y, ip_ink.width, ip_ink.height )				// YES=>Print INK Control!
	PrintClose ( li_rc)																			// Close print job!
else
	MessageBox ("Error!", "Unable to print - RC: " + String ( li_rc ))			// NO=>Error to User!
END IF



end event

type cb_save from commandbutton within wn_ink_demo
integer x = 2606
integer y = 8
integer width = 283
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save..."
end type

event clicked;
// Declarations

Integer 		li_rc																							// Work Var's.
Integer		li_fileNo
Integer		li_format
Integer		li_pos
String			ls_client
//Blob			lblb_image 
string 		ls_path

ls_client		=	io_appeon.of_getclienttype( )														// Get Type
IF  ls_client = "MOBILE"  THEN																			// Mobile?
	IF  POS (is_filenamewithpath, "_ink")  = 0 THEN
		li_pos			=	LASTPOS (is_filenamewithpath, "/")
		is_filename	=	RIGHT (is_filenamewithpath, li_pos + 1)
		is_filenamewithpath =	io_appeon.of_getcachedir ( )
		is_filename	  =  LEFT (is_filename, LEN (is_filename ) - 4 ) &
											+ "_ink" + RIGHT (is_filename, 4)							// YES=>Set new name!
		is_filenamewithpath += "/" + is_filename
	END IF
	MessageBox ("Saving To", is_filenamewithpath)
	li_rc	=	+1
ELSE	

	li_rc = GetFileSaveName ( "Select a SAVE Image", &
				is_FileNameWithPath, is_FileName, &
				"Image Files", "Files (*.*), *.*" )															// NO=>Get Name
END IF

If li_rc = 1 Then
	CHOOSE CASE Right (is_FileName, 3)
		CASE  "bmp"
			li_format		=	0
		CASE  "jpg"				//, "jpeg"
			li_format		=	1
		CASE  "gif"
			li_format		=	2
		CASE  "tiff"
			li_format		=	3
		CASE  "png"
			li_format		=	4
	END CHOOSE
	ls_path = appeongetcachedir()+"/plugin/"
	li_pos			=	LASTPOS (is_filenamewithpath, "/")
	is_filename	=	RIGHT (is_filenamewithpath, len(is_filenamewithpath) - li_pos )
	
     is_FileNameWithPath = ls_path+is_filename
     li_rc =       ip_ink.Save ( is_FileNameWithPath , li_format, TRUE )   // Last parm is Appeon defauilt!
	MessageBox ("Save", "RC = " + String (li_rc ) )
	ip_ink.resetpicture( )
	ip_ink.resetink( )
END IF

end event

type cb_clear from commandbutton within wn_ink_demo
integer x = 663
integer y = 12
integer width = 283
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;
ip_ink.resetink ( )



end event

type htb_pen from htrackbar within wn_ink_demo
integer x = 1600
integer width = 951
integer height = 136
integer minposition = 10
integer maxposition = 250
integer position = 53
integer tickfrequency = 10
end type

event moved;
ip_ink.inkwidth	=	scrollpos
end event

type st_1 from statictext within wn_ink_demo
integer x = 1349
integer y = 32
integer width = 270
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pen Size:"
boolean focusrectangle = false
end type

type cb_colour from commandbutton within wn_ink_demo
integer x = 334
integer y = 12
integer width = 283
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Colour..."
end type

event clicked;
Long				ll_colour  = 0
Long				ll_colours []
Integer			li_rc

li_rc	=	ChooseColor (ll_colour, ll_colours [] )
IF  li_rc	=	1 THEN
	ip_ink.inkcolor	=	ll_colour
END IF 

end event

type cb_load from commandbutton within wn_ink_demo
integer x = 5
integer y = 12
integer width = 283
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load ..."
boolean cancel = true
end type

event clicked;// Declarations
Integer 		li_rc
Integer		li_fileNo
String			ls_client
Blob			lblb_data

ls_client		=	 io_appeon.of_getclienttype ( )

IF ls_client = "MOBILE" THEN
	IF  is_filenamewithpath = "" THEN
		eon_mobile_cameraex		lo_camera
		lo_camera		=	 CREATE  eon_mobile_cameraex
		Yield ()
		li_rc	=	lo_camera.of_openalbums ( is_FileNameWithPath )
		Destroy lo_camera
	else
		li_rc	=	+1
	END IF		

else

	li_rc = GetFileOpenName ( "Select an Image to Open", &
				is_FileNameWithPath, is_FileName, &
				"Image Files", "Files (*.*), *.*" )
END IF
	
If li_rc = 1 Then
	ip_ink.resetpicture( )
	ip_ink.resetink( )
	MessageBox ("Opening From", is_filenamewithpath)	
	li_rc	=	ip_ink.Loadpicture (is_FileNameWithPath)
	MessageBox ("Open", "RC = " + String (li_rc) )	
	Parent.resize( Parent.width + 2 , Parent.Height +2 )
	Yield ( )
	wn_ink_mdi.ArrangeSheets (Layer!)
else
	MessageBox ("Open", "Cancelled!" )
END IF


end event

type ip_ink from inkpicture within wn_ink_demo
integer y = 156
integer width = 2683
integer height = 1484
inkcollectionmode collectionmode = inkandgesture!
displaysizemode picturesizemode = inkpicautosize!
end type

