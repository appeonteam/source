$PBExportHeader$nv_appeon.sru
forward
global type nv_appeon from nv_ext_funcs_32
end type
end forward

global type nv_appeon from nv_ext_funcs_32
end type
global nv_appeon nv_appeon

type prototypes
Protected SubRoutine GetNativeSystemInfo(ref string lpSystemInfo, string as_w) LIBRARY "Kernel32.dll"
Protected Function long GetCurrentProcessId(string aaa)  LIBRARY "kernel32.dll"
Protected Function ulong GetLastError(int li) LIBRARY "Kernel32.dll"
end prototypes
on nv_appeon.create
call super::create
end on

on nv_appeon.destroy
call super::destroy
end on

