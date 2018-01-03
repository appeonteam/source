$PBExportHeader$nv_ext_funcs_64.sru
forward
global type nv_ext_funcs_64 from nv_ext_funcs
end type
end forward

global type nv_ext_funcs_64 from nv_ext_funcs
end type
global nv_ext_funcs_64 nv_ext_funcs_64

type prototypes
Protected Function Boolean IsWow64Process(long process_handle, ref boolean IsWow64) LIBRARY "Kernel32.dll"
end prototypes

forward prototypes
public function boolean uf_is_wow64_process ()
end prototypes

public function boolean uf_is_wow64_process ();
boolean lb_wow64
long ll_process_id
ulong lul_last_error

ll_process_id = uf_get_process_id()
IF NOT IsWow64Process(ll_process_id, lb_wow64) THEN
	lul_last_error = uf_get_last_error()
	MessageBox("x64 API - IsWow64Process", "x64 API Call IsWow64Process failed. Last Error #" + String(lul_last_error), StopSign!)
	lb_wow64 = FALSE
END IF

RETURN lb_wow64
end function

on nv_ext_funcs_64.create
call super::create
end on

on nv_ext_funcs_64.destroy
call super::destroy
end on

