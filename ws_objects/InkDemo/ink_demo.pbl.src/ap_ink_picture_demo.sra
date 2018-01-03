$PBExportHeader$ap_ink_picture_demo.sra
$PBExportComments$Generated Application Object
forward
global type ap_ink_picture_demo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type ap_ink_picture_demo from application
string appname = "ap_ink_picture_demo"
end type
global ap_ink_picture_demo ap_ink_picture_demo

on ap_ink_picture_demo.create
appname="ap_ink_picture_demo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ap_ink_picture_demo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
Open (wn_ink_mdi)
end event

