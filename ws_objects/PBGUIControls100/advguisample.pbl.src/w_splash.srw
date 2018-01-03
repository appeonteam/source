$PBExportHeader$w_splash.srw
forward
global type w_splash from w_about
end type
end forward

global type w_splash from w_about
integer height = 1120
boolean titlebar = false
string title = ""
boolean controlmenu = false
end type
global w_splash w_splash

on w_splash.create
call super::create
end on

on w_splash.destroy
call super::destroy
end on

event open;call super::open;Timer(3, THIS)
end event

event timer;call super::timer;Close(THIS)
end event

type cb_1 from w_about`cb_1 within w_splash
boolean visible = false
end type

type st_4 from w_about`st_4 within w_splash
end type

type st_3 from w_about`st_3 within w_splash
end type

type st_2 from w_about`st_2 within w_splash
end type

type st_1 from w_about`st_1 within w_splash
end type

type phl_2 from w_about`phl_2 within w_splash
end type

type phl_1 from w_about`phl_1 within w_splash
end type

