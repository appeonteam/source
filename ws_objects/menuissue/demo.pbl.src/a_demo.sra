$PBExportHeader$a_demo.sra
$PBExportComments$Generated Application Object
forward
global type a_demo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
systemfunctions    SF
end variables

global type a_demo from application
string appname = "a_demo"
end type
global a_demo a_demo

on a_demo.create
appname="a_demo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on a_demo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

