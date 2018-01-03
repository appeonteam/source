$PBExportHeader$w_testappeon_main.srw
forward
global type w_testappeon_main from window
end type
type dw_1 from datawindow within w_testappeon_main
end type
type mle_1 from multilineedit within w_testappeon_main
end type
type st_1 from statictext within w_testappeon_main
end type
end forward

global type w_testappeon_main from window
integer width = 7314
integer height = 2544
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event postopen ( )
dw_1 dw_1
mle_1 mle_1
st_1 st_1
end type
global w_testappeon_main w_testappeon_main

type variables

end variables

forward prototypes
public function integer wf_test_pb ()
public function integer wf_test_appeon ()
end prototypes

event postopen();wf_test_pb()

wf_test_appeon()



end event

public function integer wf_test_pb ();long ll_rc
string ls_prop[], ls_err

mle_1.text += "[1. PB connection]" + "~r~n"

Connection con
con = create connection
con.driver = "jaguar"
//con.location = "iiop://localhost:9989"
con.location = "iiop://192.0.3.95:2000"
con.application = ""
con.userID = "admin@system"
con.password = "app123"

mle_1.text += "driver=" + con.driver + "~r~n"
mle_1.text += "location=" + con.location + "~r~n"
mle_1.text += "application=" + con.application + "~r~n"
mle_1.text += "userID=" + con.userID + "~r~n"
mle_1.text += "password=" + con.password + "~r~n"

ll_rc = con.ConnectToServer()

IF ll_rc <> 0 THEN
	choose case ll_rc
		case 50  
			ls_err = "Distributed service error"
		case 52  
			ls_err = "Distributed communications error"
		case 53 
			ls_err = "Requested server not active"
		case 54
			ls_err = "Server not accepting requests"
		case 55
			ls_err = "Request terminated abnormally"
		case 56
			ls_err = "Response to request incomplete"
		case 57
			ls_err = "Connection object not connected to server"
		case 62
			ls_err = "Server busy"
		case 92
			ls_err = "Required property is missing or invalid"
	end choose
	mle_1.text += "~r~n" + "Connection failed: (" + string(ll_rc) + ") " + ls_err + "~r~n"
	mle_1.text += "~r~n" + con.errtext + "~r~n"
else
	mle_1.text += "~r~n" + "Connection successful" + "~r~n"
END IF

md5genhomeremote luo_HWHome
ll_rc = con.LookUp(ref luo_HWHome, "md5generator/MD5Bean", "com.desta.ebeans.MD5GenHomeRemote")
if ll_rc <> 0 then
	mle_1.text += "~r~n" +con.errtext + "~r~n"
	return -1
else
	mle_1.text += "~r~n" + "LookUp successful" + "~r~n"
end if

if isNull(luo_HWHome) or not isValid(luo_HWHome) then
	mle_1.text += "~r~n" + "LookUp successful but instance is still NULL" + "~r~n"
end if

md5genremote luo_HW
try
	luo_HW = luo_HWHome.Create()
	mle_1.text += "~r~n" + "Create successful" + "~r~n"
catch (exception e)
	mle_1.text += "~r~n" + "Exception: " + e.getmessage() + "~r~n"
	mle_1.text += "~r~n"
	return -1	
end try

string ls_val
try
	ls_val = luo_HW.GetHashedData("test123")
catch (exception e2)
	mle_1.text += "~r~n" + "Exception: " + e2.getmessage() + "~r~n"
	mle_1.text += "~r~n"
	return -1	
end try
mle_1.text += "~r~n" + "GetHashedData() = " + ls_val + "~r~n"

con.disconnectserver()
mle_1.text += "~r~n"

return 0
end function

public function integer wf_test_appeon ();ejbobject lo_ejb
long ll_homeHandle
string ls_prop[5]
string ls_url
string ls_msg

mle_1.text += "[2. Appeon workarounds]" + "~r~n"

ls_url = "http://192.0.3.95:8000/appeonbridge/Dispatch"
ls_prop[1]= "appeonbridge"
ls_prop[2]= "javax.naming.Context.INITIAL_CONTEXT_FACTORY='com.sybase.ejb.InitialContextFactory'"
ls_prop[3]= "javax.naming.Context.PROVIDER_URL='iiop://192.0.3.95:2000'" 
ls_prop[4]= "username=admin@system"
ls_prop[5]= "password=app123"

// display parameters
mle_1.text = mle_1.text + "URL=" + ls_url + "~r~n"
mle_1.text = mle_1.text + "PROP1=" + ls_prop[1] + "~r~n"
mle_1.text = mle_1.text + "PROP2=" + ls_prop[2] + "~r~n"
mle_1.text = mle_1.text + "PROP3=" + ls_prop[3] + "~r~n"
mle_1.text = mle_1.text + "PROP4=" + ls_prop[4] + "~r~n"
mle_1.text = mle_1.text + "PROP5=" + ls_prop[5] + "~r~n"

ls_msg = lo_ejb.connectServer(ls_url, ls_prop)
if ls_msg <> "" then
	mle_1.text = mle_1.text + "~r~n" + ls_msg + "~r~n"
	return 0
else
	mle_1.text = mle_1.text + "~r~n [Connected]~r~n"
end if

ll_homeHandle = 0

long il_bean1
string ls_jndi, ls_home, ls_method
il_bean1 = 0

ls_msg = lo_ejb.lookupjndi ("ejb.components.md5generator.MD5BeanRemoteHome", ref ll_homeHandle)

if ls_msg <> "" then
	mle_1.text += ls_msg + "~r~n"
	return -1
else
	mle_1.text += "lookupjndi: success" + "~r~n"
end if

ls_msg = lo_ejb.createRemoteInstance("ejb.components.md5generator.MD5BeanRemoteHome", &
													"com.desta.ebeans.MD5GenHomeRemote",&
													"create",&
													ref il_bean1)
if ls_msg <> "" then
	mle_1.text += ls_msg + "~r~n"
	return -1
else
	mle_1.text += ls_msg + "RemoteInstance created~r~n"
end if 

string retval01

ls_msg = lo_ejb.regstring("test123")
if ls_msg <> "" then
	mle_1.text += ls_msg + "~r~n"
end if

ls_msg = lo_ejb.invokeretstring (il_bean1, "GetHashedData", true, ref retval01)
if ls_msg <> "" then
	mle_1.text += ls_msg + "~r~n"
	return -1
else
	mle_1.text += "GetHashedData() = " + retval01 + "~r~n"
end if

return 0

end function

on w_testappeon_main.create
this.dw_1=create dw_1
this.mle_1=create mle_1
this.st_1=create st_1
this.Control[]={this.dw_1,&
this.mle_1,&
this.st_1}
end on

on w_testappeon_main.destroy
destroy(this.dw_1)
destroy(this.mle_1)
destroy(this.st_1)
end on

event open;this.post event postopen()
end event

type dw_1 from datawindow within w_testappeon_main
integer x = 110
integer y = 1376
integer width = 5001
integer height = 1028
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_testappeon_main
integer x = 37
integer y = 192
integer width = 7131
integer height = 1120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_testappeon_main
integer x = 37
integer y = 32
integer width = 722
integer height = 144
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217856
long backcolor = 67108864
string text = "Test Appeon"
boolean focusrectangle = false
end type

