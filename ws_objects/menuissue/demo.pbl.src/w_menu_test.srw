$PBExportHeader$w_menu_test.srw
$PBExportComments$Demo window
forward
global type w_menu_test from window
end type
end forward

global type w_menu_test from window
integer width = 4754
integer height = 2056
boolean titlebar = true
string title = "Menu Test"
string menuname = "mu_demo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_menu_test w_menu_test

on w_menu_test.create
if this.MenuName = "mu_demo" then this.MenuID = create mu_demo
end on

on w_menu_test.destroy
if IsValid(MenuID) then destroy(MenuID)
end on

