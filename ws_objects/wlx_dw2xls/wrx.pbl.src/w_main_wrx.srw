$PBExportHeader$w_main_wrx.srw
$PBExportComments$главное окно модуля
forward
global type w_main_wrx from Window
end type
type st_3 from statictext within w_main_wrx
end type
type st_format from statictext within w_main_wrx
end type
type sle_file from singlelineedit within w_main_wrx
end type
type st_2 from statictext within w_main_wrx
end type
type st_1 from statictext within w_main_wrx
end type
type dw_description from datawindow within w_main_wrx
end type
type cb_cancel from commandbutton within w_main_wrx
end type
type lb_disk from listbox within w_main_wrx
end type
type cb_ok from commandbutton within w_main_wrx
end type
type st_dir from statictext within w_main_wrx
end type
type lb_dir from listbox within w_main_wrx
end type
type gb_4 from groupbox within w_main_wrx
end type
type gb_3 from groupbox within w_main_wrx
end type
type gb_2 from groupbox within w_main_wrx
end type
type gb_1 from groupbox within w_main_wrx
end type
type dw_format from datawindow within w_main_wrx
end type
end forward

global type w_main_wrx from Window
int X=727
int Y=357
int Width=2309
int Height=1729
boolean TitleBar=true
string Title="Виберить потрібний каталог"
long BackColor=82042848
boolean ControlMenu=true
WindowType WindowType=response!
st_3 st_3
st_format st_format
sle_file sle_file
st_2 st_2
st_1 st_1
dw_description dw_description
cb_cancel cb_cancel
lb_disk lb_disk
cb_ok cb_ok
st_dir st_dir
lb_dir lb_dir
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_format dw_format
end type
global w_main_wrx w_main_wrx

type prototypes
FUNCTION ulong GetCurrentDirectoryA(ulong BufferLen, ref string currentdir) LIBRARY  "Kernel32.dll" alias for "GetCurrentDirectoryA;Ansi" 
end prototypes

type variables
string function_name // название функции выгрузки
string Path // путь для выгрузки
dataWindow SDW // сохраняемое DW
string slAppDirectory 
end variables

on w_main_wrx.create
this.st_3=create st_3
this.st_format=create st_format
this.sle_file=create sle_file
this.st_2=create st_2
this.st_1=create st_1
this.dw_description=create dw_description
this.cb_cancel=create cb_cancel
this.lb_disk=create lb_disk
this.cb_ok=create cb_ok
this.st_dir=create st_dir
this.lb_dir=create lb_dir
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_format=create dw_format
this.Control[]={ this.st_3,&
this.st_format,&
this.sle_file,&
this.st_2,&
this.st_1,&
this.dw_description,&
this.cb_cancel,&
this.lb_disk,&
this.cb_ok,&
this.st_dir,&
this.lb_dir,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.dw_format}
end on

on w_main_wrx.destroy
destroy(this.st_3)
destroy(this.st_format)
destroy(this.sle_file)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_description)
destroy(this.cb_cancel)
destroy(this.lb_disk)
destroy(this.cb_ok)
destroy(this.st_dir)
destroy(this.lb_dir)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_format)
end on

event open;string sDir = ''

//-------------------------------------------------------------------------------------

lb_Disk.DirList('',16384+32768,st_Dir)
lb_Dir.DirList(sDir, 16+32768, st_Dir)
if sDir <> '' then st_dir.text = sDir

//----------------------------------------------------------------------------------
SDW = Message.PowerObjectParm

//----------------------------------------------------------------------------------
// выбор 1 метода
dw_format.event clicked ( 1, 1, 1, dw_format.object )


Environment env

GetEnvironment(env)

This.X = Max(PixelsToUnits(env.ScreenWidth, XPixelsToUnits!) - This.Width, 1) / 2
This.Y = Max(PixelsToUnits(env.ScreenHeight, YPixelsToUnits!) - This.Height, 1) / 2
end event

type st_3 from statictext within w_main_wrx
int X=1724
int Y=113
int Width=234
int Height=77
boolean Enabled=false
string Text="Формат:"
boolean FocusRectangle=false
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_format from statictext within w_main_wrx
int X=1966
int Y=105
int Width=311
int Height=89
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
Alignment Alignment=Center!
boolean FocusRectangle=false
long BackColor=82042848
int TextSize=-11
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_file from singlelineedit within w_main_wrx
int X=407
int Y=105
int Width=1276
int Height=85
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=16711680
long BackColor=15793151
int TextSize=-10
int Weight=400
string FaceName="Arial Cyr"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_main_wrx
int X=19
int Y=109
int Width=394
int Height=77
boolean Enabled=false
string Text="Назва файлу:"
boolean FocusRectangle=false
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_main_wrx
int X=19
int Y=17
int Width=636
int Height=77
boolean Enabled=false
string Text="Каталог вивантаження:"
boolean FocusRectangle=false
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_description from datawindow within w_main_wrx
int X=55
int Y=1157
int Width=2204
int Height=293
int TabOrder=30
string DataObject="dw_format_description"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_cancel from commandbutton within w_main_wrx
int X=1761
int Y=1469
int Width=508
int Height=129
int TabOrder=70
string Text="Відмінити"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="Arial Cyr"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn(parent,'')

end event

type lb_disk from listbox within w_main_wrx
int X=55
int Y=261
int Width=764
int Height=317
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean Sorted=false
long TextColor=16711680
long BackColor=15793151
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event doubleclicked;//cb_ChDir.TriggerEvent(Clicked!)
//MessageBox("lbDisk","DoubleClicked")
String sSelect

If lb_Disk.DirSelect(sSelect) Then
	lb_Dir.DirList(sSelect, 16+32768, st_Dir)
End if


end event

type cb_ok from commandbutton within w_main_wrx
int X=1121
int Y=1469
int Width=595
int Height=129
int TabOrder=60
string Text="Ок"
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;String sDir

sDir=st_Dir.Text;
If Mid(sDir,Len(sDir),1)<>'\' Then sDir+='\'

if len(sle_file.text) = 0 then 
	MessageBox('!!!', 'Вкажіть назву файлу!')
	return
end if

Path = sDir + sle_file.text + '.' + st_format.text

choose case function_name
	case 'f_dw_save_as_xls_html' // выгрузка в xls через html (id = 1)
		f_dw_save_as_xls_html(SDW, Path)
	case 'f_dw_save_as_xls_ole' // выгрузка в xls через ole (id = 2)
		f_dw_save_as_xls_ole(SDW, Path)
	case 'f_dw_save_as_xls_standart' // выгрузка в xls стандартной функцией SaveAs (id = 3)
		f_dw_save_as_xls_standart(SDW, Path)
	case 'f_dw_save_as_html' // выгрузка в  html (id = 5)
		f_dw_save_as_html(SDW, Path) 
	case 'f_dw_save_as_rtf' // выгрузка в rtf (id = 4)
		f_dw_save_as_rtf(SDW, Path)
	case 'f_dw_save_as_dbf_standart' // выгрузка в dbf стандартной функцией SaveAs (id = 6)
		f_dw_save_as_dbf_standart(SDW, Path)
	case 'f_dw_save_as_txt_standart' // выгрузка в txt стандартной функцией SaveAs (id = 7)
		f_dw_save_as_txt_standart(SDW, Path)
	case 'f_dw_save_as_csv_standart' // выгрузка в txt стандартной функцией SaveAs (id = 7)
		f_dw_save_as_csv_standart(SDW, Path)
	case else
		MessageBox ('!!!','Помилка. Не вірна назва функції!!!')
end choose



CloseWithReturn(parent,Path)

end event

type st_dir from statictext within w_main_wrx
int X=654
int Y=9
int Width=1623
int Height=85
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="Помилка"
boolean FocusRectangle=false
long BackColor=82042848
int TextSize=-11
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type lb_dir from listbox within w_main_wrx
int X=878
int Y=257
int Width=1377
int Height=813
int TabOrder=100
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
long TextColor=16711680
long BackColor=15793151
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event doubleclicked;//cb_ChDir.TriggerEvent(Clicked!)//MessageBox ("lbDir","DoubleClicked")
String sSelect

If lb_Dir.DirSelect(sSelect) Then
	lb_Dir.DirList(sSelect, 16+32768, st_Dir)
End if


end event

type gb_4 from groupbox within w_main_wrx
int X=33
int Y=1089
int Width=2245
int Height=373
int TabOrder=21
string Text="Особливості методу"
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="Arial CYR"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_3 from groupbox within w_main_wrx
int X=851
int Y=189
int Width=1431
int Height=897
int TabOrder=80
string Text="Каталог"
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_2 from groupbox within w_main_wrx
int X=28
int Y=601
int Width=814
int Height=485
int TabOrder=50
string Text="Формати та методи"
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_main_wrx
int X=23
int Y=193
int Width=819
int Height=409
int TabOrder=90
string Text="Диск"
long BackColor=82042848
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=DefaultCharSet!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_format from datawindow within w_main_wrx
int X=55
int Y=657
int Width=769
int Height=413
int TabOrder=40
boolean BringToTop=true
string DataObject="dw_format_name"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;
if row <= 0 then return

//-------------------------------------------------------------------------------------
// выделение выбраной строки
this.selectrow ( 0, false)
this.selectrow ( row, true)
this.ScrollToRow(row)

//-------------------------------------------------------------------------------------
// установка выбраного формата
st_format.text = dw_format.Object.Format[row]

//-------------------------------------------------------------------------------------
// установка названия выбраной фукции
function_name = dw_format.Object.fun_name[row]

//-------------------------------------------------------------------------------------
// установка фильтра для описания метода
dw_description.SetFilter('did = ' + string(dw_format.Object.id[row]))
dw_description.Filter()


end event

