$PBExportHeader$dw2xls_test.sra
$PBExportComments$Generated Application Object
forward
global type dw2xls_test from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type dw2xls_test from application
string appname = "dw2xls_test"
end type
global dw2xls_test dw2xls_test

on dw2xls_test.create
appname="dw2xls_test"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dw2xls_test.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql',DisableBind=1"

connect using sqlca;

if sqlca.sqlcode <> 0 then
	messagebox("Error",sqlca.sqlerrtext)
	return
end if

open(w_main)

end event

