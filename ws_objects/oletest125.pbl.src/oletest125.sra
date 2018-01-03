$PBExportHeader$oletest125.sra
$PBExportComments$Generated Application Object
forward
global type oletest125 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type oletest125 from application
string appname = "oletest125"
end type
global oletest125 oletest125

on oletest125.create
appname="oletest125"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on oletest125.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile eas
//SQLCA.DBMS = "ODBC"
SQLCA.DBMS = "TRACE ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V126;UID=dba;PWD=sql'"


connect using sqlca;

open(w_testfailedblob)
end event

event close;disconnect;
end event

