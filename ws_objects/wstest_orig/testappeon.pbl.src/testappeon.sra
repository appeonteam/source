$PBExportHeader$testappeon.sra
$PBExportComments$Generated Application Object
forward
global type testappeon from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type testappeon from application
string appname = "testappeon"
end type
global testappeon testappeon

on testappeon.create
appname="testappeon"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on testappeon.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_testappeon_main)


end event

