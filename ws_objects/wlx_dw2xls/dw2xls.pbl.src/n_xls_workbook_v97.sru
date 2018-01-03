﻿$PBExportHeader$n_xls_workbook_v97.sru
forward
global type n_xls_workbook_v97 from n_xls_workbook
end type
end forward

global type n_xls_workbook_v97 from n_xls_workbook
event type unsignedlong ue_add_string ( string as_value )
event type unsignedlong ue_add_unicode ( blob ab_string )
end type
global n_xls_workbook_v97 n_xls_workbook_v97

type variables
PRIVATE olestorage istg_doc
PRIVATE olestorage invo_olestorage

PRIVATE BOOLEAN ib_fileclosed = TRUE
PUBLIC BLOB ib_sheetnames[]

PRIVATE STRING is_sheetname = "Sheet"
PUBLIC INTEGER ii_selected
PRIVATE INTEGER ii_palette[4, 56]

PRIVATE UINT iui_codepage = 1252
PROTECTED BLOB iblb_data

PROTECTED ULONG il_datasize
PROTECTED ULONG il_biffsize

PROTECTED UINT iui_limit = 8224
PROTECTED BOOLEAN ib_1904

PUBLIC n_xls_format_v97 invo_tmp_format
PUBLIC n_xls_format_v97 invo_url_format

PUBLIC n_xls_data invo_data
PUBLIC n_cst_sst invo_sst

end variables

forward prototypes
public function integer of_create (string as_filename)
public function integer of_close ()
public function n_xls_worksheet of_add_worksheet ()
public function n_xls_worksheet of_add_worksheet (string as_worksheetname)
public function n_xls_format of_add_format ()
public function integer of_set_custom_color (integer ai_index, integer ai_red, integer ai_green, integer ai_blue)
protected function integer of_store_workbook ()
protected function integer of_append (blob ablb_data)
protected function integer of_append (blob ablb_header, blob ablb_data)
protected function integer of_append (blob ablb_header, blob ablb_data, blob ablb_add_data)
protected function blob of_add_continue (blob ablb_data)
protected function integer of_store_bof (integer ai_type)
protected function integer of_store_codepage ()
protected function integer of_store_externs ()
protected function integer of_store_names ()
protected function integer of_store_window1 ()
protected function integer of_store_1904 ()
protected function integer of_store_all_fonts ()
protected function boolean of_is_zero_started_number (string as_str)
protected function boolean of_is_number (string as_str)
protected function integer of_store_all_num_formats ()
protected function integer of_store_all_xfs ()
protected function integer of_store_all_styles ()
protected function integer of_store_style ()
protected function integer of_store_palette ()
protected function integer of_calc_sheet_offsets ()
protected function integer of_store_externcount (unsignedinteger ai_cxals)
protected function integer of_store_name_short (unsignedinteger ai_index, integer ai_type, unsignedinteger ai_rowmin, unsignedinteger ai_rowmax, integer ai_colmin, integer ai_colmax)
protected function integer of_store_eof ()
protected function integer of_store_ole_file ()
protected function integer of_store_name_long (unsignedinteger ai_index, unsignedinteger ai_type, unsignedinteger ai_rowmin, unsignedinteger ai_rowmax, unsignedinteger ai_colmin, unsignedinteger ai_colmax)
public function integer of_set_codepage (unsignedinteger aui_codepage)
public function integer of_set_palette_xl97 ()
public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname)
protected function integer of_store_supbook ()
protected function integer of_get_externs_size ()
protected function integer of_get_names_size ()
protected function integer of_store_num_format (blob ab_format, unsignedinteger ai_index)
protected function integer of_store_boundsheet (blob ab_sheetname, unsignedlong al_offset)
protected function integer of_store_externsheet ()
protected function integer of_store_sst (unsignedlong al_offset)
protected function integer of_store_extsst ()
end prototypes

event type ulong ue_add_string(string as_value);return invo_sst.of_add_string(as_value)
end event

event type ulong ue_add_unicode(blob ab_string);return invo_sst.of_add_string(ab_string)
end event

public function integer of_create (string as_filename);Integer li_ret = 1

invo_tmp_format = CREATE n_xls_format_v97
of_reg_format(invo_tmp_format)

If Handle(GetApplication()) <> 0 Then
End If

invo_url_format = of_add_format()
invo_url_format.of_set_color("blue")
invo_url_format.of_set_underline(1)
of_reg_format(invo_url_format)

If as_filename = "" OR IsNull(as_filename) Then
	MessageBox("错误", "没有指定文件名称", stopsign!)
	li_ret = -1
End If


If li_ret = 1 Then
	
	If NOT ib_fileclosed Then
		MessageBox("错误", "当前WorkBook不能关闭", stopsign!)
		li_ret = -1
	End If
	
End If


If li_ret = 1 Then
	istg_doc = CREATE olestorage
	li_ret = istg_doc.Open(as_filename, stgreadwrite!, stgexclusive!)
	
	If li_ret < 0 Then
		MessageBox("错误", "文件不能共享~r~n" + "不能打开文件", stopsign!)
		Destroy(istg_doc)
		li_ret = -1
	Else
		ib_fileclosed = FALSE
		li_ret = 1
	End If
	
End If


If li_ret = 1 Then
	li_ret = of_set_palette_xl97()
End If

Return li_ret



end function

public function integer of_close ();integer li_ret = 1


if not ib_fileclosed then
    li_ret = of_store_workbook()
end if

return li_ret


end function

public function n_xls_worksheet of_add_worksheet ();return of_add_worksheet("")
end function

public function n_xls_worksheet of_add_worksheet (string as_worksheetname);return of_add_worksheet(invo_sub.to_unicode(as_worksheetname))
end function

public function n_xls_format of_add_format ();n_xls_format_v97 lnvo_format

lnvo_format = create n_xls_format_v97
return lnvo_format
end function

public function integer of_set_custom_color (integer ai_index, integer ai_red, integer ai_green, integer ai_blue);If ai_index < 8 OR ai_index > 64 Then
	MessageBox("错误", "颜色 index" + String(ai_index) + " 超出范围 : 8 <= index <= 64")
	Return -1
ElseIf ai_red < 0 OR ai_red > 255 OR ai_green < 0 OR ai_green > 255 OR ai_blue < 0 OR ai_blue > 255 Then
	MessageBox("错误", "颜色组成超出范围: 0 <= color <= 255")
	Return -1
Else
	ai_index = ai_index - 7
	ii_palette[1, ai_index] = ai_red
	ii_palette[2, ai_index] = ai_green
	ii_palette[3, ai_index] = ai_blue
	ii_palette[4, ai_index] = 0
	Return ai_index + 7
End If




end function

protected function integer of_store_workbook ();long ll_i
n_xls_worksheet_v97 lnvo_sheet


if il_worksheetindex = 0 then
    of_add_worksheet()
end if


if ii_activesheet = 0 then
    lnvo_sheet = invo_worksheets[1]
    lnvo_sheet.ib_selected = true
end if


for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]

    if lnvo_sheet.ib_selected then
        ii_selected ++
    end if

    lnvo_sheet.of_close()
next

of_store_bof(5)
of_store_codepage()
of_store_window1()
of_store_1904()
of_store_all_fonts()
of_store_all_num_formats()
of_store_all_xfs()
of_store_all_styles()
of_store_palette()
of_store_sst(il_datasize)
of_store_extsst()
of_calc_sheet_offsets()

for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]
    of_store_boundsheet(lnvo_sheet.ib_worksheetname, lnvo_sheet.il_offset)
next

of_store_externs()
of_store_names()
of_store_eof()
return of_store_ole_file()



end function

protected function integer of_append (blob ablb_data);integer li_ret = 1


if len(ablb_data) > iui_limit then
    ablb_data = of_add_continue(ablb_data)
end if

il_datasize += len(ablb_data)
invo_data.of_append(ablb_data)
return li_ret


end function

protected function integer of_append (blob ablb_header, blob ablb_data);return of_append(ablb_header + ablb_data)
end function

protected function integer of_append (blob ablb_header, blob ablb_data, blob ablb_add_data);return of_append(ablb_header + ablb_data + ablb_add_data)
end function

protected function blob of_add_continue (blob ablb_data);UINT lui_record = 60
BLOB lblb_header
BLOB lblb_temp
LONG ll_len
lblb_temp = BLOBMID(ablb_data, 1, iui_limit)
ablb_data = BLOBMID(ablb_data, iui_limit + 1, LEN(ablb_data) - iui_limit)
BLOBEDIT(lblb_temp, 3, invo_sub.of_pack("v", iui_limit - 4))
DO while LEN(ablb_data) > iui_limit
	lblb_header = invo_sub.of_pack("v", lui_record) + invo_sub.of_pack("v", iui_limit)
	lblb_temp = lblb_temp + lblb_header
	lblb_temp = lblb_temp + BLOBMID(ablb_data, 1, iui_limit)
	ablb_data = BLOBMID(ablb_data, iui_limit + 1, LEN(ablb_data) - iui_limit)
LOOP
lblb_header = invo_sub.of_pack("v", lui_record) + invo_sub.of_pack("v", LEN(ablb_data))
lblb_temp = lblb_temp + lblb_header
lblb_temp = lblb_temp + ablb_data
RETURN lblb_temp

end function

protected function integer of_store_bof (integer ai_type);uint li_record = 2057
uint li_len = 16
uint li_build = 6319
uint li_year = 1997
ulong ll_history_flag = 16449
ulong ll_lowest_version = 262
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_len)
lblb_data = invo_sub.of_pack("v", ii_biff_version) + invo_sub.of_pack("v", ai_type) + invo_sub.of_pack("v", li_build) + invo_sub.of_pack("v", li_year) + invo_sub.of_pack("V", ll_history_flag) + invo_sub.of_pack("V", ll_lowest_version)
of_append(lblb_header + lblb_data)
return 1


end function

protected function integer of_store_codepage ();uint li_record = 66
uint li_length = 2
blob lblb_header
blob lblb_data
integer li_ret

lblb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lblb_data = invo_sub.of_pack("v", 1200)
li_ret = of_append(lblb_header, lblb_data)
return li_ret


end function

protected function integer of_store_externs ();of_store_supbook()
of_store_externsheet()
return 1


end function

protected function integer of_store_names ();integer li_ret = 1
long ll_i
n_xls_worksheet_v97 lnvo_sheet


for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]

    if not isnull(lnvo_sheet.ii_print_rowmin) then
        of_store_name_short(ll_i - 1, 6, lnvo_sheet.ii_print_rowmin, lnvo_sheet.ii_print_rowmax, lnvo_sheet.ii_print_colmin, lnvo_sheet.ii_print_colmax)
    end if

next


for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]

    if not isnull(lnvo_sheet.ii_title_rowmin) and not isnull(lnvo_sheet.ii_title_colmin) then
        of_store_name_long(ll_i - 1, 7, lnvo_sheet.ii_title_rowmin, lnvo_sheet.ii_title_rowmax, lnvo_sheet.ii_title_colmin, lnvo_sheet.ii_title_colmax)
    elseif not isnull(lnvo_sheet.ii_title_rowmin) then
        of_store_name_short(ll_i - 1, 7, lnvo_sheet.ii_title_rowmin, lnvo_sheet.ii_title_rowmax, 0, 255)
    elseif not isnull(lnvo_sheet.ii_title_colmin) then
        of_store_name_short(ll_i - 1, 7, 0, 65535, lnvo_sheet.ii_title_colmin, lnvo_sheet.ii_title_colmax)
    end if

next

return li_ret


end function

protected function integer of_store_window1 ();integer li_ret = 1
uint li_record = 61
uint li_length = 18
uint li_xwn
uint li_ywn
uint li_dxwn = 9660
uint li_dywn = 5490
uint li_grbit = 56
uint li_wtabratio = 600
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lblb_data = invo_sub.of_pack("v", li_xwn) + invo_sub.of_pack("v", li_ywn) + invo_sub.of_pack("v", li_dxwn) + invo_sub.of_pack("v", li_dywn) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("v", ii_activesheet) + invo_sub.of_pack("v", ii_firstsheet) + invo_sub.of_pack("v", ii_selected) + invo_sub.of_pack("v", li_wtabratio)
of_append(lblb_header, lblb_data)
return li_ret


end function

protected function integer of_store_1904 ();uint li_record = 34
uint li_length = 2
integer li_ret
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)

if ib_1904 then
    lblb_data = invo_sub.of_pack("v", 1)
else
    lblb_data = invo_sub.of_pack("v", 0)
end if

li_ret = of_append(lblb_header, lblb_data)
return li_ret


end function

protected function integer of_store_all_fonts ();blob lb_font
string ls_key
string ls_font_keys[]
long ll_keys_cnt
long ll_format_cnt
long ll_i
long ll_j
long ll_key
integer li_ret = 1
n_xls_format_v97 lnvo_format

lb_font = invo_tmp_format.of_get_font()

for ll_i = 1 to 5
    of_append(lb_font)
next

ls_key = invo_tmp_format.of_get_font_key()
ll_keys_cnt ++
ls_font_keys[ll_keys_cnt] = ls_key
ll_format_cnt = upperbound(invo_formats)

for ll_i = 1 to ll_format_cnt
    lnvo_format = invo_formats[ll_i]
    ls_key = lnvo_format.of_get_font_key()
    ll_key = 0

    for ll_j = 1 to ll_keys_cnt

        if ls_font_keys[ll_j] = ls_key then
            ll_key = ll_j
            exit
        end if

    next


    if ll_key = 0 then
        ll_keys_cnt ++
        ls_font_keys[ll_keys_cnt] = ls_key
        ll_key = ll_keys_cnt
        lb_font = lnvo_format.of_get_font()
        of_append(lb_font)
    end if


    if ll_key > 1 then
        ll_key += 4
    else
        ll_key = 0
    end if

    lnvo_format.ii_font_index = ll_key
next

return li_ret


end function

protected function boolean of_is_zero_started_number (string as_str);integer li_i
integer li_cnt
string ls_ch

as_str = trim(as_str)

if right(as_str, 1) = "0" then
    li_cnt = len(as_str)

    if li_cnt < 2 then
        return false
    end if


    for li_i = 2 to li_cnt
        ls_ch = mid(as_str, li_i, 1)

        choose case ls_ch
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
                continue
            case else
                return false
        end choose

    next

    return true
else
    return false
end if



end function

protected function boolean of_is_number (string as_str);integer li_i
integer li_cnt
string ls_ch

as_str = trim(as_str)
li_cnt = len(as_str)

if li_cnt < 1 then
    return false
end if


for li_i = 1 to li_cnt
    ls_ch = mid(as_str, li_i, 1)

    choose case ls_ch
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
            continue
        case else
            return false
    end choose

next

return true


end function

protected function integer of_store_all_num_formats ();integer li_ret = 1
blob lb_formats[]
long ll_formats_cnt
long ll_i
long ll_j
long ll_used_format
blob lb_format
integer li_format
n_xls_format_v97 invo_format


for ll_i = 1 to il_formatindex
    invo_format = invo_formats[ll_i]
    lb_format = invo_format.ib_num_format
    li_format = invo_format.ii_num_format

    if isnull(lb_format) or len(lb_format) = 0 then
    else
        ll_used_format = 0

        for ll_j = 1 to ll_formats_cnt

            if lb_formats[ll_j] = lb_format then
                ll_used_format = ll_j
                exit
            end if

        next


        if ll_used_format > 0 then
            invo_format.ii_num_format = ll_used_format + 164 - 1
        else
            ll_formats_cnt ++
            lb_formats[ll_formats_cnt] = lb_format
            invo_format.ii_num_format = ll_formats_cnt + 164 - 1
        end if

    end if

next


for ll_i = 1 to ll_formats_cnt
    of_store_num_format(lb_formats[ll_i], ll_i + 164 - 1)
next

return li_ret


end function

protected function integer of_store_all_xfs ();integer li_ret = 1
blob lb_xf
long ll_i
n_xls_format_v97 lnvo_format

lb_xf = invo_tmp_format.of_get_xf("style")

for ll_i = 1 to 15
    of_append(lb_xf)
next


for ll_i = 1 to il_formatindex
    lnvo_format = invo_formats[ll_i]
    lb_xf = lnvo_format.of_get_xf("cell")
    of_append(lb_xf)
next

return li_ret


end function

protected function integer of_store_all_styles ();integer li_ret

li_ret = of_store_style()
return li_ret
end function

protected function integer of_store_style ();integer li_ret
uint li_record = 659
uint li_length = 4
uint li_ixfe = 32768
integer li_builtin
integer li_ilevel = 255
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_ixfe) + invo_sub.of_pack("C", li_builtin) + invo_sub.of_pack("C", li_ilevel)
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_store_palette ();integer li_ret = 1
uint li_record = 146
uint li_length
uint li_ccv
uint li_i
blob lb_header
blob lb_data
blob lb_data_item

li_ccv = 56
li_length = 2 + 4 * li_ccv

for li_i = 1 to li_ccv
    lb_data_item = invo_sub.of_pack("C", ii_palette[1, li_i]) + invo_sub.of_pack("C", ii_palette[2, li_i]) + invo_sub.of_pack("C", ii_palette[3, li_i]) + invo_sub.of_pack("C", ii_palette[4, li_i])

    if li_i = 1 then
        lb_data = lb_data_item
    else
        lb_data = lb_data + lb_data_item
    end if

next

lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length) + invo_sub.of_pack("v", li_ccv)
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_calc_sheet_offsets ();integer li_ret = 1
integer li_boundsheetheader = 12
integer li_eof = 4
ulong ll_offset
long ll_i
n_xls_worksheet_v97 lnvo_sheet

ll_offset = il_datasize

for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]
    ll_offset += li_boundsheetheader + len(lnvo_sheet.ib_worksheetname)
next

ll_offset += of_get_externs_size()
ll_offset += of_get_names_size()
ll_offset += li_eof

for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]
    lnvo_sheet.il_offset = ll_offset
    ll_offset += lnvo_sheet.il_datasize
next

il_biffsize = ll_offset
return li_ret


end function

protected function integer of_store_externcount (unsignedinteger ai_cxals);integer li_ret = 1
uint li_record = 22
uint li_length = 2
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ai_cxals)
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_store_name_short (unsignedinteger ai_index, integer ai_type, unsignedinteger ai_rowmin, unsignedinteger ai_rowmax, integer ai_colmin, integer ai_colmax);integer li_ret = 1
uint li_record = 24
uint li_length = 27
uint li_grbit = 32
integer li_chkey
integer li_cch = 1
uint li_cce = 11
uint li_ixals
uint li_itab
integer li_cchcustmenu
integer li_cchdescription
integer li_cchhelptopic
integer li_cchstatustext
integer li_rgch
integer li_unknown03 = 59
uint li_unknown04
blob lb_header
blob lb_data

li_ixals = ai_index + 1
li_itab = li_ixals
li_rgch = ai_type
li_unknown04 = upperbound(ib_sheetnames) - ai_index - 1
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("C", li_chkey) + invo_sub.of_pack("C", li_cch) + invo_sub.of_pack("v", li_cce) + invo_sub.of_pack("v", ai_index) + invo_sub.of_pack("v", li_itab) + invo_sub.of_pack("C", li_cchcustmenu) + invo_sub.of_pack("C", li_cchdescription) + invo_sub.of_pack("C", li_cchhelptopic) + invo_sub.of_pack("C", li_cchstatustext) + invo_sub.of_pack("C", 0) + invo_sub.of_pack("C", li_rgch) + invo_sub.of_pack("C", li_unknown03) + invo_sub.of_pack("v", li_unknown04) + invo_sub.of_pack("v", ai_rowmin) + invo_sub.of_pack("v", ai_rowmax) + invo_sub.of_pack("v", ai_colmin) + invo_sub.of_pack("v", ai_colmax)
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_store_eof ();integer li_ret = 1
uint li_record = 10
uint li_length
blob lb_header

lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
of_append(lb_header)
return li_ret


end function

protected function integer of_store_ole_file ();integer li_ret = 1
integer li_i
olestream lstr_book
n_xls_worksheet_v97 lnvo_sheet

lstr_book = create olestream
li_ret = lstr_book.open(istg_doc, "Workbook", stgwrite!)

if li_ret < 0 then
    li_ret = -1
else
    li_ret = 1
end if


if li_ret = 1 then
    invo_data.of_write(lstr_book)
end if


if li_ret = 1 then

    for li_i = 1 to il_worksheetindex
        lnvo_sheet = invo_worksheets[li_i]
        lnvo_sheet.of_write_data(lstr_book)
    next

end if


if li_ret = 1 then
    lstr_book.close()
    istg_doc.close()
end if

return li_ret


end function

protected function integer of_store_name_long (unsignedinteger ai_index, unsignedinteger ai_type, unsignedinteger ai_rowmin, unsignedinteger ai_rowmax, unsignedinteger ai_colmin, unsignedinteger ai_colmax);integer li_ret = 1
uint li_record = 24
uint li_length = 42
uint li_grbit = 32
integer li_chkey
integer li_cch = 1
uint li_cce = 26
uint li_ixals
uint li_itab
integer li_cchcustmenu
integer li_cchdescription
integer li_cchhelptopic
integer li_cchstatustext
integer li_rgch
integer li_unknown03 = 41
uint li_unknown04 = 23
integer li_unknown05 = 59
blob lb_header
blob lb_data
uint li_ext_ref

li_ixals = ai_index + 1
li_itab = li_ixals
li_rgch = ai_type
li_ext_ref = upperbound(ib_sheetnames) - ai_index - 1
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("C", li_chkey) + invo_sub.of_pack("C", li_cch) + invo_sub.of_pack("v", li_cce) + invo_sub.of_pack("v", ai_index) + invo_sub.of_pack("v", li_itab) + invo_sub.of_pack("C", li_cchcustmenu) + invo_sub.of_pack("C", li_cchdescription) + invo_sub.of_pack("C", li_cchhelptopic) + invo_sub.of_pack("C", li_cchstatustext) + invo_sub.of_pack("C", 0) + invo_sub.of_pack("C", li_rgch) + invo_sub.of_pack("C", li_unknown03) + invo_sub.of_pack("v", li_unknown04) + invo_sub.of_pack("C", li_unknown05) + invo_sub.of_pack("v", li_ext_ref) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 65535) + invo_sub.of_pack("v", ai_colmin) + invo_sub.of_pack("v", ai_colmax) + invo_sub.of_pack("C", li_unknown05) + invo_sub.of_pack("v", li_ext_ref) + invo_sub.of_pack("v", ai_rowmin) + invo_sub.of_pack("v", ai_rowmax) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 255) + invo_sub.of_pack("C", 16)
of_append(lb_header, lb_data)
return li_ret


end function

public function integer of_set_codepage (unsignedinteger aui_codepage);iui_codepage = aui_codepage

return 1
end function

public function integer of_set_palette_xl97 ();ii_palette[] = { 0, 0, 0, 0, 255, 255, 255, 0, 255, 0, 0, 0, 0, 255, 0, 0, 0, 0, 255, 0, 255, 255, 0, 0, 255, 0, 255, 0, 0, 255, 255, 0, 128, 0, 0, 0, 0, 128, 0, 0, 0, 0, 128, 0, 128, 128, 0, 0, 128, 0, 128, 0, 0, 128, 128, 0, 192, 192, 192, 0, 128, 128, 128, 0, 153, 153, 255, 0, 153, 51, 102, 0, 255, 255, 204, 0, 204, 255, 255, 0, 102, 0, 102, 0, 255, 128, 128, 0, 0, 102, 204, 0, 204, 204, 255, 0, 0, 0, 128, 0, 255, 0, 255, 0, 255, 255, 0, 0, 0, 255, 255, 0, 128, 0, 128, 0, 128, 0, 0, 0, 0, 128, 128, 0, 0, 0, 255, 0, 0, 204, 255, 0, 204, 255, 255, 0, 204, 255, 204, 0, 255, 255, 153, 0, 153, 204, 255, 0, 255, 153, 204, 0, 204, 153, 255, 0, 255, 204, 153, 0, 51, 102, 255, 0, 51, 204, 204, 0, 153, 204, 0, 0, 255, 204, 0, 0, 255, 153, 0, 0, 255, 102, 0, 0, 102, 102, 153, 0, 150, 150, 150, 0, 0, 51, 102, 0, 51, 153, 102, 0, 0, 51, 0, 0, 51, 51, 0, 0, 153, 51, 0, 0, 153, 51, 102, 0, 51, 51, 153, 0, 51, 51, 51, 0 }
return 1


end function

public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname);Integer li_ret = 1
Integer li_i
Integer li_len
String ls_name
n_xls_worksheet_v97 lnvo_cursheet
n_xls_worksheet_v97 lnvo_worksheet

ls_name = invo_sub.to_ansi(ab_worksheetname, 0, "_")

Do
	li_len = Len(ab_worksheetname) / 2
	
	If li_len > 31 Then
		MessageBox("错误", "Worksheet名称长度必须少于31个字符!", stopsign!)
		li_ret = -1
		Exit
	End If
	
	
	If Match(ls_name, "[:*?/\]") Then
		MessageBox("错误", "非法的WorkSheet名称!", stopsign!)
		li_ret = -1
		Exit
	End If
	
	
	If Trim(ls_name) = "" Then
		ab_worksheetname = invo_sub.to_unicode(is_sheetname + String(il_worksheetindex + 1))
		ls_name = invo_sub.to_ansi(ab_worksheetname, 0, "_")
	End If
	
	
	For li_i = 1 TO il_worksheetindex
		lnvo_cursheet = invo_worksheets[li_i]
		
		If lnvo_cursheet.ib_worksheetname = ab_worksheetname Then
			MessageBox("错误", "WorkSheet名称重复", stopsign!)
			li_ret = -1
			Exit
		End If
		
	Next
	
	
	If li_ret <> 1 Then
		Exit
	End If
	
	lnvo_worksheet = CREATE n_xls_worksheet_v97
	lnvo_worksheet.invo_url_format = invo_url_format
	lnvo_worksheet.invo_workbook = THIS
	lnvo_worksheet.ib_worksheetname = ab_worksheetname
	lnvo_worksheet.is_worksheetname = ls_name
	il_worksheetindex ++
	lnvo_worksheet.ii_index = il_worksheetindex
	ib_sheetnames[il_worksheetindex] = lnvo_worksheet.ib_worksheetname
	invo_worksheets[il_worksheetindex] = lnvo_worksheet
Loop Until TRUE


If li_ret <> 1 Then
	
	If NOT IsNull(lnvo_worksheet) Then
		
		If IsValid(lnvo_worksheet) Then
			Destroy(lnvo_worksheet)
			SetNull(lnvo_worksheet)
		End If
		
	End If
	
End If

Return lnvo_worksheet





end function

protected function integer of_store_supbook ();uint li_record = 430
uint li_length = 4
blob lblb_header
blob lblb_data
integer li_ret

lblb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lblb_data = invo_sub.of_pack("v", upperbound(ib_sheetnames)) + invo_sub.of_pack("v", 1025)
li_ret = of_append(lblb_header, lblb_data)
return li_ret


end function

protected function integer of_get_externs_size ();integer li_cnt

li_cnt=upperbound(ib_sheetnames)
return 8 + 6 + 6 * li_cnt
end function

protected function integer of_get_names_size ();integer li_ret
long ll_i
n_xls_worksheet_v97 lnvo_sheet


for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]

    if not isnull(lnvo_sheet.ii_print_rowmin) then
        li_ret = li_ret + 31
    end if

next


for ll_i = 1 to il_worksheetindex
    lnvo_sheet = invo_worksheets[ll_i]

    if not isnull(lnvo_sheet.ii_title_rowmin) and not isnull(lnvo_sheet.ii_title_colmin) then
        li_ret = li_ret + 46
    elseif not isnull(lnvo_sheet.ii_title_rowmin) then
        li_ret = li_ret + 31
    elseif not isnull(lnvo_sheet.ii_title_colmin) then
        li_ret = li_ret + 31
    end if

next

return li_ret


end function

protected function integer of_store_num_format (blob ab_format, unsignedinteger ai_index);integer li_ret = 1
uint li_record = 1054
uint li_length
uint li_len_format
blob lb_header
blob lb_data
integer li_grbit = 1
integer li_cch

li_cch = len(ab_format) / 2
li_length = 5 + li_cch * 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ai_index) + invo_sub.of_pack("v", li_cch) + invo_sub.of_pack("C", li_grbit) + ab_format
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_store_boundsheet (blob ab_sheetname, unsignedlong al_offset);integer li_ret = 1
uint li_record = 133
uint li_length
uint li_grbit
uint li_cch
blob lb_header
blob lb_data

li_cch = len(ab_sheetname) / 2
li_length = 8 + li_cch * 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("V", al_offset) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("C", li_cch) + invo_sub.of_pack("C", 1) + ab_sheetname
of_append(lb_header, lb_data)
return li_ret


end function

protected function integer of_store_externsheet ();integer li_ret = 1
uint li_record = 23
uint li_length
blob lb_header
blob lb_data
integer li_i
integer li_cnt

li_cnt = upperbound(ib_sheetnames)
li_length = 2 + 6 * li_cnt
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_cnt)

for li_i = li_cnt - 1 to 0 step -1
    lb_data = lb_data + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", li_i) + invo_sub.of_pack("v", li_i)
next

of_append(lb_header + lb_data)
return li_ret


end function

protected function integer of_store_sst (unsignedlong al_offset);integer li_ret = 1
blob lblb_data

lblb_data = invo_sst.of_get_sst(al_offset)
il_datasize += len(lblb_data)
invo_data.of_append(lblb_data)
return li_ret


end function

protected function integer of_store_extsst ();integer li_ret = 1
blob lblb_data

lblb_data = invo_sst.of_get_extsst()
il_datasize += len(lblb_data)
invo_data.of_append(lblb_data)
return li_ret


end function

on n_xls_workbook_v97.create
call super::create
end on

on n_xls_workbook_v97.destroy
call super::destroy
end on

event constructor;call super::constructor;//long ancestorreturnvalue

call n_xls_workbook::constructor
ii_biff_version = 1536
invo_data = create n_xls_data
invo_sst = create n_cst_sst
end event

event destructor;call super::destructor;//long ancestorreturnvalue

call n_xls_workbook::destructor
destroy(invo_sst)

end event

