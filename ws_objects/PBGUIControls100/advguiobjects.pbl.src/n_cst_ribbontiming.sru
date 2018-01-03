$PBExportHeader$n_cst_ribbontiming.sru
forward
global type n_cst_ribbontiming from timing
end type
end forward

global type n_cst_ribbontiming from timing
end type
global n_cst_ribbontiming n_cst_ribbontiming

type variables
u_cst_ribboncontainer i_parent
u_cst_ribbonmenu i_menu
end variables

on n_cst_ribbontiming.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbontiming.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;IF IsValid(i_parent) THEN i_parent.of_Hide()
IF IsValid(i_menu) THEN i_menu.of_Hide()
end event

