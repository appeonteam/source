$PBExportHeader$cst_oleobject_xls.sru
forward
global type cst_oleobject_xls from oleobject
end type
end forward

global type cst_oleobject_xls from oleobject
end type
global cst_oleobject_xls cst_oleobject_xls

on cst_oleobject_xls.create
call oleobject::create
TriggerEvent( this, "constructor" )
end on

on cst_oleobject_xls.destroy
call oleobject::destroy
TriggerEvent( this, "destructor" )
end on

event error;
//ConnectToNewObject("InternetExplorer.Application")
action = ExceptionRetry! 
end event

event externalexception;
action = ExceptionIgnore!
end event

