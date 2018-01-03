$PBExportHeader$n_xls_workbook.sru
forward
global type n_xls_workbook from nonvisualobject
end type
end forward

global type n_xls_workbook from nonvisualobject
event type unsignedlong ue_add_string ( string as_value )
event type unsignedlong ue_add_unicode ( blob ab_string )
end type
global n_xls_workbook n_xls_workbook

type variables
Public String is_filename
Public Long il_formatindex
Public Long il_worksheetindex
Public Integer ii_activesheet
Public Integer ii_firstsheet
Public UInt ii_biff_version = 1280
Public UInt ii_xf_index = 14
Public n_xls_worksheet invo_worksheets[]
Public n_xls_format invo_formats[]
Public n_cst_hash_long invo_xfs
Public n_xls_subroutines_v97 invo_sub
end variables

forward prototypes
public function n_xls_worksheet of_add_worksheet ()
public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname)
public function n_xls_worksheet of_add_worksheet (string as_worksheetname)
public function n_xls_format of_addformat ()
public function n_xls_worksheet of_addworksheet ()
public function n_xls_worksheet of_addworksheet (blob ab_worksheetname)
public function n_xls_worksheet of_addworksheet (string as_worksheetname)
public function integer of_close ()
public function integer of_create (string as_filename)
public function long of_get_xf (ref n_xls_format anvo_format)
public function long of_reg_format (ref n_xls_format anvo_format)
public function integer of_set_codepage (unsignedinteger aui_codepage)
public function integer of_set_custom_color (integer ai_index, integer ai_red, integer ai_green, integer ai_blue)
public function integer of_set_palette_xl97 ()
public function integer of_set_temp_dir (string as_tempdir)
public function n_xls_format of_add_format ()
end prototypes

event type unsignedlong ue_add_string(string as_value);return 1
end event

event type unsignedlong ue_add_unicode(blob ab_string);return 1
end event

public function n_xls_worksheet of_add_worksheet ();n_xls_worksheet retvar
Return retvar
end function

public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname);Return of_add_worksheet(invo_sub.to_ansi(ab_worksheetname))
end function

public function n_xls_worksheet of_add_worksheet (string as_worksheetname);n_xls_worksheet retvar
Return retvar
end function

public function n_xls_format of_addformat ();Return of_add_format()
end function

public function n_xls_worksheet of_addworksheet ();Return of_add_worksheet()
end function

public function n_xls_worksheet of_addworksheet (blob ab_worksheetname);Return of_add_worksheet(ab_worksheetname)
end function

public function n_xls_worksheet of_addworksheet (string as_worksheetname);Return of_add_worksheet(as_worksheetname)
end function

public function integer of_close ();Integer retvar
Return retvar
end function

public function integer of_create (string as_filename);Integer retvar
Return retvar
end function

public function long of_get_xf (ref n_xls_format anvo_format);string ls_key
long li_ret
if anvo_format.ii_xf_index > 0 then
    return anvo_format.ii_xf_index
end if
ls_key = anvo_format.of_get_format_key()
if invo_xfs.of_key_exists(ls_key) then
    li_ret = invo_xfs.of_get_value(ls_key)
else
    li_ret = 15
end if
return li_ret


end function

public function long of_reg_format (ref n_xls_format anvo_format);string ls_key
long li_ret
if anvo_format.ii_xf_index > 0 then
    li_ret = anvo_format.ii_xf_index
else
    ls_key = anvo_format.of_get_format_key()
    if invo_xfs.of_key_exists(ls_key) then
        li_ret = invo_xfs.of_get_value(ls_key)
    else
        ii_xf_index ++
        il_formatindex ++
        invo_formats[il_formatindex] = anvo_format
        invo_xfs.of_set_value(ls_key, ii_xf_index)
        anvo_format.ii_xf_index = ii_xf_index
        li_ret = ii_xf_index
    end if
end if
return li_ret
end function

public function integer of_set_codepage (unsignedinteger aui_codepage);Integer retvar
Return retvar
end function

public function integer of_set_custom_color (integer ai_index, integer ai_red, integer ai_green, integer ai_blue);Integer retvar
Return retvar
end function

public function integer of_set_palette_xl97 ();Integer retvar
Return retvar
end function

public function integer of_set_temp_dir (string as_tempdir);Integer retvar
Return retvar
end function

public function n_xls_format of_add_format ();n_xls_format retvar
Return retvar

end function

on n_xls_workbook.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_workbook.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;invo_sub = Create n_xls_subroutines_v97
invo_xfs = Create n_cst_hash_long
end event

event destructor;Destroy(invo_sub)
Destroy(invo_xfs)
end event

