$PBExportHeader$n_cst_unicode.sru
forward
global type n_cst_unicode from nonvisualobject
end type
end forward

global type n_cst_unicode from nonvisualobject autoinstantiate
end type

type prototypes
Function ULong MultiByteToWideChar(UnsignedInteger codepage,UnsignedLong dwflags,Ref String lpmultibytestr,Integer cbmultibyte,Ref Blob lpwidecharstr,Integer cchwidechar)Library "kernel32.dll" alias for "MultiByteToWideChar;Ansi"
Function ULong WideCharToMultiByte(UnsignedInteger codepage,UnsignedLong dwflags,Ref Blob lpwidecharstr,Integer cchwidechar,Ref String lpmultibytestr,Integer cchmultibyte,Ref Character lpdefaultchar,Ref Boolean lpuseddefaultchar )  Library "kernel32.dll" alias for "WideCharToMultiByte;Ansi"

end prototypes

type variables
Public Integer mb_precomposed = 1
Public Integer mb_composite = 2
Public Integer mb_useglyphchars = 4
Public Integer wc_defaultcheck = 256
Public Integer wc_compositecheck = 512
Public Integer wc_discardns = 16
Public Integer wc_sepchars = 32
Public Integer wc_defaultchar = 64

end variables

forward prototypes
public function blob of_ansi2unicode (string as_value)
public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage)
public function string of_unicode2ansi (blob a_value)
public function blob of_ansi2unicode (string as_value, unsignedlong ai_codepage)
public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage, character ac_default_char)
end prototypes

public function blob of_ansi2unicode (string as_value);RETURN of_ansi2unicode(as_value,0)
end function

public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage);integer li_input_size
integer li_output_size
string ls_buff
char lc_def_char
boolean lb_use_def_char
li_input_size = len(a_value) / 2
//li_output_size = WideCharToMultiByte(ai_codepage, 0, a_value, li_input_size, ls_buff, 0, lc_def_char, lb_use_def_char)
ls_buff = space(li_output_size)
lc_def_char = "?"
lb_use_def_char = true
//WideCharToMultiByte(ai_codepage, 0, a_value, li_input_size, ls_buff, li_output_size, lc_def_char, lb_use_def_char)
return ls_buff
end function

public function string of_unicode2ansi (blob a_value);return of_unicode2ansi(a_value,0)
end function

public function blob of_ansi2unicode (string as_value, unsignedlong ai_codepage);Blob lc_buff
ULong li_output_size
String ls_temp_buff
ULong li_input_size
SetNull(lc_buff)
li_input_size = Len(as_value)
li_output_size = multibytetowidechar(ai_codepage, 0, as_value, li_input_size, lc_buff, 0)
If li_output_size > 0 Then
	ls_temp_buff = Space(li_output_size * 2)
	lc_buff = Blob(ls_temp_buff)
	li_output_size = multibytetowidechar(ai_codepage, 0, as_value, li_input_size, lc_buff, li_output_size)
Else
	lc_buff = Blob("")
End If
Return lc_buff

end function

public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage, character ac_default_char);Integer li_input_size
Integer li_output_size
String ls_buff
Char lc_def_char
Boolean lb_use_def_char
li_input_size = Len(a_value) / 2
//li_output_size = WideCharToMultiByte(ai_codepage,0,a_value,li_input_size,ls_buff,0,lc_def_char,lb_use_def_char)
ls_buff = Space(li_output_size)
lc_def_char = ac_default_char
lb_use_def_char = True
//WideCharToMultiByte(ai_codepage,0,a_value,li_input_size,ls_buff,li_output_size,lc_def_char,lb_use_def_char)
Return ls_buff

end function

on n_cst_unicode.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_unicode.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

