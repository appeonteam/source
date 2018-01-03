$PBExportHeader$nv_ext_funcs.sru
forward
global type nv_ext_funcs from nonvisualobject
end type
type st_system_info from structure within nv_ext_funcs
end type
end forward

type st_system_info from structure
	integer		wProcessorArchitecture
	integer		wReserved
	integer		dwPageSize
	long		lpMinimumApplicationAddress
	long		lpMaximumApplicationAddress
	long		dwActiveProcessorMask
	long		dwNumberOfProcessors
	long		dwProcessorType
	long		dwAllocationGranularity
	long		wProcessorLevel
	long		wProcessorRevision
end type

global type nv_ext_funcs from nonvisualobject
end type
global nv_ext_funcs nv_ext_funcs

type prototypes
Protected SubRoutine GetNativeSystemInfo(ref st_system_info lpSystemInfo) LIBRARY "Kernel32.dll"
Protected Function long GetCurrentProcessId()  LIBRARY "kernel32.dll"
Protected Function ulong GetLastError() LIBRARY "Kernel32.dll"
end prototypes

forward prototypes
public function integer uf_get_processor_architecture ()
public function long uf_get_process_id ()
public function unsignedlong uf_get_last_error ()
end prototypes

public function integer uf_get_processor_architecture ();
st_system_info lst_system_info
int li_arch

GetNativeSystemInfo(lst_system_info)

li_arch = lst_system_info.wProcessorArchitecture
IF li_arch = 9 OR li_arch = 6 THEN
	RETURN 2 //x64
ELSE
	RETURN 1 //x32
END IF
end function

public function long uf_get_process_id ();
RETURN GetCurrentProcessId()
end function

public function unsignedlong uf_get_last_error ();
RETURN GetLastError()
end function

on nv_ext_funcs.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_ext_funcs.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

