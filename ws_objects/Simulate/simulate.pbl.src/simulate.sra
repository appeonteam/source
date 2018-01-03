$PBExportHeader$simulate.sra
$PBExportComments$Generated Application Object
forward
global type simulate from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
w_frame gw_frame
nv_app_manager am
end variables

global type simulate from application
string appname = "simulate"
end type
global simulate simulate

type variables

end variables

on simulate.create
appname="simulate"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on simulate.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(gw_frame)
end event

