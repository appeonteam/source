$PBExportHeader$nv_app_manager.sru
forward
global type nv_app_manager from nonvisualobject
end type
end forward

global type nv_app_manager from nonvisualobject
end type
global nv_app_manager nv_app_manager

type variables
Public:

Constant String APP_CLIENT_TYPE_PB = "PB"
Constant String APP_CLIENT_TYPE_WEB = "WEB"

Constant Int PLATFORM_32 = 1
Constant Int PLATFORM_64 = 2

Protected:

String is_app_client_type
Int ii_system_platform
Int ii_app_runtime_platform
end variables

forward prototypes
public function string of_get_app_client_type ()
public function integer of_get_runtime_platform ()
public function integer of_get_system_platform ()
protected subroutine of_determine_platform ()
public function string of_get_app_path ()
end prototypes

public function string of_get_app_client_type ();
RETURN is_app_client_type
end function

public function integer of_get_runtime_platform ();
RETURN ii_app_runtime_platform
end function

public function integer of_get_system_platform ();
RETURN ii_system_platform
end function

protected subroutine of_determine_platform ();boolean lb_wow64
nv_ext_funcs lnv_ext_funcs
nv_ext_funcs_64 lnv_ext_funcs_64

lnv_ext_funcs = CREATE nv_ext_funcs
lnv_ext_funcs_64 = CREATE nv_ext_funcs_64

IF is_app_client_type = APP_CLIENT_TYPE_WEB THEN
	IF AppeonIsIn64Browser() THEN
		ii_app_runtime_platform = PLATFORM_64
	ELSE
		ii_app_runtime_platform = PLATFORM_32
	END IF
	
	ii_system_platform = ii_app_runtime_platform	
ELSE
	ii_system_platform = lnv_ext_funcs.uf_get_processor_architecture()
	ii_app_runtime_platform = PLATFORM_32
END IF

DESTROY lnv_ext_funcs_64
DESTROY lnv_ext_funcs
end subroutine

public function string of_get_app_path ();RETURN "C:\Simulate"
end function

on nv_app_manager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_app_manager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
is_app_client_type = AppeonGetClientType()

of_determine_platform()
end event

