﻿$PBExportHeader$n_xls_worksheet_v97.sru
forward
global type n_xls_worksheet_v97 from n_xls_worksheet
end type
end forward

global type n_xls_worksheet_v97 from n_xls_worksheet
end type
global n_xls_worksheet_v97 n_xls_worksheet_v97

type variables
Public UInt ii_index
Protected Blob ib_data
Protected ULong il_xls_rowmax = 65536
Protected ULong il_xls_colmax = 256
Protected ULong il_xls_strmax = 255
Protected ULong il_dim_rowmin
Protected ULong il_dim_colmin
Protected ULong il_dim_rowmax
Protected ULong il_dim_colmax
Protected Boolean ib_dim_changed
Protected Integer ii_active_pane = 3
Protected Boolean ib_frozen
Protected UInt ii_paper_size
Protected Integer ii_orientation = 1
Protected Blob ib_header
Protected Blob ib_footer
Protected UInt ii_vcenter
Protected UInt ii_hcenter
Protected Double id_margin_head = 0.5
Protected Double id_margin_foot = 0.5
Protected Double id_margin_left = 0.75
Protected Double id_margin_right = 0.75
Protected Double id_margin_top = 1
Protected Double id_margin_bottom = 1
Protected Boolean ib_print_gridlines = True
Protected Boolean ib_screen_gridlines = True
Protected Boolean ib_print_headers
Protected Boolean ib_fit_page
Protected UInt ii_fit_width
Protected UInt ii_fit_height
Protected UInt ii_hbreaks[]
Protected UInt ii_vbreaks[]
Protected Boolean ib_protect
Protected String is_password
Protected Double id_col_sizes[]
Protected Double id_row_sizes[]
Protected Integer ii_zoom = 100
Protected Integer ii_print_scale = 100
Protected Boolean ib_leading_zeros
Protected UInt ii_limit = 8224
Protected Boolean ib_col_hiddens[]
Protected Boolean ib_row_hiddens[]
Protected n_xls_format_v97 invo_col_formats[]
Protected n_xls_format_v97 invo_row_formats[]
Protected n_associated_ulong_srv invo_key_col_hiddens
Protected n_associated_ulong_srv invo_key_row_hiddens
Protected n_xls_data invo_data
Protected n_xls_data invo_header
Public Boolean ib_selected
Public ULong il_offset
Public ULong il_datasize
Public UInt ii_print_rowmin
Public UInt ii_print_rowmax
Public UInt ii_title_rowmin
Public UInt ii_title_rowmax
Public Integer ii_print_colmin
Public Integer ii_title_colmin
Public Integer ii_title_colmax
Public Integer ii_print_colmax
Public Blob ib_worksheetname
Public n_xls_format_v97 invo_url_format
Public n_xls_workbook invo_workbook
Public n_xls_colinfo invo_colinfo[]
Public n_xls_selection invo_selection
Public n_xls_panes invo_panes
Public n_associated_ulong_srv invo_key_col_sizes
Public n_associated_ulong_srv invo_key_row_sizes
Public n_associated_ulong_srv invo_key_col_formats
Public n_associated_ulong_srv invo_key_row_formats

end variables

forward prototypes
protected function integer of_sort_pagebreaks (ref unsignedinteger ai_page_breaks[])
protected function integer of_check_dimensions (unsignedlong al_row, unsignedlong al_col)
protected function integer of_store_dimensions ()
protected function integer of_store_window2 ()
protected function integer of_store_defcol ()
protected function integer of_store_selection (n_xls_selection anvo_selection)
protected function integer of_store_externcount (unsignedinteger ai_count)
protected function integer of_store_externsheet (string as_sheetname)
protected function integer of_store_panes (n_xls_panes anvo_panes)
protected function integer of_store_setup ()
protected function integer of_store_header ()
protected function integer of_store_footer ()
protected function integer of_store_hcenter ()
protected function integer of_store_vcenter ()
protected function integer of_store_margin_bottom ()
protected function integer of_store_print_headers ()
protected function integer of_store_print_gridlines ()
protected function integer of_store_gridset ()
protected function integer of_store_wsbool ()
protected function integer of_store_hbreak ()
protected function integer of_store_protect ()
protected function integer of_store_password ()
public function integer of_size_col (unsignedinteger ai_col)
public function integer of_size_row (unsignedinteger ai_row)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format anvo_format)
protected function integer of_store_bof (unsignedinteger ai_type)
protected function integer of_store_eof ()
public function integer of_set_row_format (long al_row, n_xls_format anvo_format)
public function integer of_set_row_hidden (long al_row, boolean ab_hidden)
public function integer of_set_column_hidden (long al_col, boolean ab_hidden)
public function integer of_write_data (olestream astr_book)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_set_first_sheet ()
public function integer of_protect (string as_password)
public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function integer of_set_portrait ()
public function integer of_set_landscape ()
public function integer of_set_paper (unsignedinteger ai_paper_size)
public function integer of_set_paper ()
public function integer of_set_header (string as_header, double ad_margin_head)
public function integer of_set_footer (string as_footer, double ad_margin_foot)
public function integer of_center_horizontally (boolean ab_option)
public function integer of_center_vertically (boolean ab_option)
public function integer of_set_margins (double ad_margin)
public function integer of_set_margins_lr (double ad_margin)
public function integer of_set_margins_tb (double ad_margin)
public function integer of_set_margin_left (double ad_margin)
public function integer of_set_margin_right (double ad_margin)
public function integer of_set_margin_top (double ad_margin)
public function integer of_set_margin_bottom (double ad_margin)
public function integer of_repeat_rows (unsignedinteger ai_first_row, unsignedinteger ai_last_row)
public function integer of_repeat_columns (unsignedinteger ai_first_col, unsignedinteger ai_last_col)
public function integer of_print_area (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_hide_gridlines (unsignedinteger ai_option)
public function integer of_print_row_col_headers (boolean ab_print_headers)
public function integer of_fit_to_pages (unsignedinteger ai_width, unsignedinteger ai_height)
public function blob of_get_data ()
protected function ulong of_encode_password (string as_password)
public function integer of_set_row_height (long al_row, double ad_height)
public function integer of_set_column_width (long al_col, double ad_width)
public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_format anvo_format, boolean ab_hidden)
public function integer of_set_column_width (long al_col, long al_width)
public function integer of_set_row_height (long al_row, long al_height)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y, readonly double ad_scale_width, readonly double ad_scale_height)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename)
public function integer of_select ()
protected function integer of_store_obj_picture (readonly unsignedinteger ai_col_start, readonly unsignedinteger ai_x1, readonly unsignedinteger ai_row_start, readonly unsignedinteger ai_y1, readonly unsignedinteger ai_col_end, readonly unsignedinteger ai_x2, readonly unsignedinteger ai_row_end, readonly unsignedinteger ai_y2)
protected function integer of_store_zoom ()
protected function integer of_store_margin_right ()
protected function integer of_store_margin_top ()
protected function integer of_store_colinfo (n_xls_colinfo anvo_colinfo)
protected function integer of_xf (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format_v97 anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str)
public function blob of_get_name_unicode ()
public function integer of_set_row (unsignedinteger ai_row, double ad_height, n_xls_format_v97 anvo_format, boolean ab_hidden)
public function integer of_position_image (unsignedinteger ai_col_start, unsignedinteger ai_row_start, unsignedinteger ai_x1, unsignedinteger ai_y1, unsignedinteger ai_width, unsignedinteger ai_height)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, date ad_date, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, double adb_num, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, n_xls_format anvo_format)
public function integer of_set_zoom (unsignedinteger ai_scale)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_format anvo_format)
public function integer of_set_print_scale (unsignedinteger ai_scale)
public function integer of_set_header (blob ab_header, double ad_margin_head)
public function integer of_set_footer (blob ab_footer, double ad_margin_foot)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, string as_str, n_xls_format anvo_format)
public function integer of_activate ()
protected function blob of_add_continue (blob ab_data)
public function integer of_add_h_pagebreak (unsignedinteger ai_hbreak)
public function integer of_add_v_pagebreak (unsignedinteger ai_vbreak)
protected function integer of_append_data (blob ab_data)
protected function integer of_append_header (blob ab_data)
public function integer of_center_horizontally ()
public function integer of_center_vertically ()
protected function unsignedinteger of_get_excel_height (double ad_value)
protected function unsignedinteger of_get_excel_width (double ad_value)
public function string of_get_name ()
protected function integer of_merge_cells (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_set_column_format (long al_col, n_xls_format anvo_format)
protected function integer of_store_margin_left ()
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, time at_time, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, datetime adt_datetime, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_format anvo_format)
public function integer of_close ()
protected function integer of_store_vbreak ()
protected function integer of_process_bitmap (readonly string as_bitmap_filename, ref long al_width, ref long al_height, ref long al_size, ref blob ab_data)
end prototypes

protected function integer of_sort_pagebreaks (ref unsignedinteger ai_page_breaks[]);integer li_ret = 1
n_associated_ulong_srv invo_key_breaks
uint li_cnt
uint li_i
ulong ll_ind
uint li_new[]
invo_key_breaks = create n_associated_ulong_srv
li_cnt = upperbound(ai_page_breaks)
for li_i = 1 to li_cnt
    if ai_page_breaks[li_i] > 0 then
        ll_ind = invo_key_breaks.of_get_key_index(ai_page_breaks[li_i])
        if ll_ind = 0 then
            invo_key_breaks.of_add_key(ai_page_breaks[li_i])
        end if
    end if
next
invo_key_breaks.of_sort_keys()
li_cnt = invo_key_breaks.of_get_keys_count()
for li_i = 1 to li_cnt
    li_new[li_i] = invo_key_breaks.of_get_key(li_i)
next
ai_page_breaks = li_new
return li_ret
end function

protected function integer of_check_dimensions (unsignedlong al_row, unsignedlong al_col);integer li_ret = 1
if al_row > il_xls_rowmax then
    return -2
end if
if al_col > il_xls_colmax then
    return -2
end if
ib_dim_changed = true
if al_row < il_dim_rowmin then
    il_dim_rowmin = al_row
end if
if al_row > il_dim_rowmax then
    il_dim_rowmax = al_row
end if
if al_col < il_dim_colmin then
    il_dim_colmin = al_col
end if
if al_col > il_dim_colmax then
    il_dim_colmax = al_col
end if
return li_ret
end function

protected function integer of_store_dimensions ();integer li_ret = 1
uint li_record = 512
uint li_length = 14
uint li_row_min
uint li_row_max
uint li_col_min
uint li_col_max
uint li_reserved
blob lb_header
blob lb_data
if ib_dim_changed then
    li_row_min = il_dim_rowmin
    li_row_max = il_dim_rowmax + 1
    li_col_min = il_dim_colmin
    li_col_max = il_dim_colmax + 1
else
    li_row_min = 0
    li_row_max = 0
    li_col_min = 0
    li_col_max = 256
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("V", li_row_min) + invo_sub.of_pack("V", li_row_max) + invo_sub.of_pack("v", li_col_min) + invo_sub.of_pack("v", li_col_max) + invo_sub.of_pack("v", li_reserved)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_window2 ();integer li_ret = 1
uint li_record = 574
uint li_length = 18
blob lb_header
blob lb_data
uint li_grbit = 182
uint li_rwtop
uint li_colleft
integer li_fdspfmla
integer li_fdspgrid
integer li_fdsprwcol = 1
integer li_ffrozen
integer li_fdspzeros = 1
integer li_fdefaulthdr = 1
integer li_farabic
integer li_fdspguts = 1
integer li_ffrozennosplit
integer li_fselected
integer li_fpaged = 1
if ib_screen_gridlines then
    li_fdspgrid = 1
end if
if ib_frozen then
    li_ffrozen = 1
end if
if ib_selected then
    li_fselected = 1
end if
li_grbit = li_fdspfmla
li_grbit = li_grbit + li_fdspgrid * 2
li_grbit = li_grbit + li_fdsprwcol * 4
li_grbit = li_grbit + li_ffrozen * 8
li_grbit = li_grbit + li_fdspzeros * 16
li_grbit = li_grbit + li_fdefaulthdr * 32
li_grbit = li_grbit + li_farabic * 64
li_grbit = li_grbit + li_fdspguts * 128
li_grbit = li_grbit + li_ffrozennosplit * 256
li_grbit = li_grbit + li_fselected * 512
li_grbit = li_grbit + li_fpaged * 1024
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("v", li_rwtop) + invo_sub.of_pack("v", li_colleft) + invo_sub.of_pack("v", 64) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("V", 0)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_defcol ();integer li_ret = 1
uint li_record = 85
uint li_length = 2
blob lb_header
blob lb_data
uint li_colwidth = 8
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_colwidth)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_selection (n_xls_selection anvo_selection);integer li_ret = 1
uint li_record = 29
uint li_length = 15
blob lb_header
blob lb_data
uint li_pnn
uint li_irefact
uint li_cref = 1
uint li_rwact
uint li_colact
uint li_rwfirst
uint li_rwlast
uint li_colfirst
uint li_collast
li_pnn = ii_active_pane
li_rwact = anvo_selection.ii_first_row
li_colact = anvo_selection.ii_first_col
if anvo_selection.ii_first_row > anvo_selection.ii_last_row then
    li_rwfirst = anvo_selection.ii_last_row
    li_rwlast = anvo_selection.ii_first_row
else
    li_rwfirst = anvo_selection.ii_first_row
    li_rwlast = anvo_selection.ii_last_row
end if
if anvo_selection.ii_first_col > anvo_selection.ii_last_col then
    li_colfirst = anvo_selection.ii_last_col
    li_collast = anvo_selection.ii_first_col
else
    li_colfirst = anvo_selection.ii_first_col
    li_collast = anvo_selection.ii_last_col
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("C", li_pnn) + invo_sub.of_pack("v", li_rwact) + invo_sub.of_pack("v", li_colact) + invo_sub.of_pack("v", li_irefact) + invo_sub.of_pack("v", li_cref) + invo_sub.of_pack("v", li_rwfirst) + invo_sub.of_pack("v", li_rwlast) + invo_sub.of_pack("C", li_colfirst) + invo_sub.of_pack("C", li_collast)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_externcount (unsignedinteger ai_count);integer li_ret = 1
uint li_record = 22
uint li_length = 2
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ai_count)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_externsheet (string as_sheetname);integer li_ret = 1
uint li_record = 23
uint li_length
blob lb_header
blob lb_data
uint li_cch
uint li_rgch
if is_worksheetname = as_sheetname then
    as_sheetname = ""
    li_length = 2
    li_cch = 1
    li_rgch = 2
else
    li_length = 2 + len(as_sheetname)
    li_cch = len(as_sheetname)
    li_rgch = 3
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("C", li_cch) + invo_sub.of_pack("C", li_rgch)
if len(as_sheetname) > 0 then
    lb_data = lb_data + blob(as_sheetname)
end if
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_panes (n_xls_panes anvo_panes);integer li_ret = 1
uint li_record = 65
uint li_length = 10
blob lb_header
blob lb_data
uint li_y
uint li_x
uint li_rwtop
uint li_colleft
uint li_pnnact
if ib_frozen then
    li_y = anvo_panes.id_y
    li_x = anvo_panes.id_x
    if isnull(anvo_panes.ii_rowtop) then
        li_rwtop = li_y
    else
        li_rwtop = anvo_panes.ii_rowtop
    end if
    if isnull(anvo_panes.ii_colleft) then
        li_colleft = li_x
    else
        li_colleft = anvo_panes.ii_colleft
    end if
else
    if isnull(anvo_panes.ii_rowtop) then
        li_rwtop = 0
    else
        li_rwtop = anvo_panes.ii_rowtop
    end if
    if isnull(anvo_panes.ii_colleft) then
        li_colleft = 0
    else
        li_colleft = anvo_panes.ii_colleft
    end if
    li_y = 20 * anvo_panes.id_y + 255
    li_x = 113.879 * anvo_panes.id_x + 390
end if
if li_x <> 0 and li_y <> 0 then
    li_pnnact = 0
end if
if li_x <> 0 and li_y = 0 then
    li_pnnact = 1
end if
if li_x = 0 and li_y <> 0 then
    li_pnnact = 2
end if
if li_x = 0 and li_y = 0 then
    li_pnnact = 3
end if
ii_active_pane = li_pnnact
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_x) + invo_sub.of_pack("v", li_y) + invo_sub.of_pack("v", li_rwtop) + invo_sub.of_pack("v", li_colleft) + invo_sub.of_pack("v", li_pnnact)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_setup ();integer li_ret = 1
uint li_record = 161
uint li_length = 34
blob lb_header
blob lb_data
uint li_ipagestart = 1
uint li_grbit
uint li_ires = 600
uint li_ivres = 600
uint li_icopies = 1
uint li_flefttoright
uint li_flandscape
uint li_fnopls
uint li_fnocolor
uint li_fdraft
uint li_fnotes
uint li_fnoorient
uint li_fusepage
li_flandscape = ii_orientation
li_grbit = li_flefttoright
li_grbit = li_grbit + li_flandscape * 2
li_grbit = li_grbit + li_fnopls     * 4
li_grbit = li_grbit + li_fnocolor   * 8
li_grbit = li_grbit + li_fdraft     * 16
li_grbit = li_grbit + li_fnotes     * 32
li_grbit = li_grbit + li_fnoorient  * 64
li_grbit = li_grbit + li_fusepage   * 128
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ii_paper_size) + invo_sub.of_pack("v", ii_print_scale) + invo_sub.of_pack("v", li_ipagestart) + invo_sub.of_pack("v", ii_fit_width) + invo_sub.of_pack("v", ii_fit_height) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("v", li_ires) + invo_sub.of_pack("v", li_ivres) + invo_sub.of_pack("d", id_margin_head) + invo_sub.of_pack("d", id_margin_foot) + invo_sub.of_pack("v", li_icopies)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_header ();integer li_ret = 1
uint li_record = 20
uint li_length
blob lb_header
blob lb_data
uint li_cch
li_cch = len(ib_header) / 2
li_length = 3 + li_cch * 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_cch) + invo_sub.of_pack("C", 1) + ib_header
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_footer ();integer li_ret = 1
uint li_record = 21
uint li_length
blob lb_header
blob lb_data
uint li_cch
li_cch = len(ib_footer) / 2
li_length = 3 + li_cch * 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_cch) + invo_sub.of_pack("C", 1) + ib_footer
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_hcenter ();integer li_ret = 1
uint li_record = 131
uint li_length = 2
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ii_hcenter)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_vcenter ();integer li_ret = 1
uint li_record = 132
uint li_length = 2
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ii_vcenter)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_bottom ();integer li_ret = 1
uint li_record = 41
uint li_length = 8
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("d", id_margin_bottom)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_print_headers ();integer li_ret = 1
uint li_record = 42
uint li_length = 2
blob lb_header
blob lb_data
uint li_fprintrwcol
if ib_print_headers then
    li_fprintrwcol = 1
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_fprintrwcol)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_print_gridlines ();integer li_ret = 1
uint li_record = 43
uint li_length = 2
blob lb_header
blob lb_data
uint li_fprintgrid
if ib_print_gridlines then
    li_fprintgrid = 1
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_fprintgrid)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_gridset ();integer li_ret = 1
uint li_record = 130
uint li_length = 2
blob lb_header
blob lb_data
uint li_fgridset
if not ib_print_gridlines then
    li_fgridset = 1
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_fgridset)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_wsbool ();integer li_ret = 1
uint li_record = 129
uint li_length = 2
blob lb_header
blob lb_data
uint li_grbit
if ib_fit_page then
    li_grbit = 1473
else
    li_grbit = 1217
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_grbit)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_hbreak ();integer li_ret = 1
uint li_tmp[]
uint li_record = 27
uint li_length
blob lb_header
blob lb_data
uint li_cbrk
uint li_i
li_tmp = ii_hbreaks
of_sort_pagebreaks(li_tmp)
li_cbrk = upperbound(li_tmp)
if li_cbrk = 0 then
    return li_ret
end if
li_length = li_cbrk * 6 + 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_cbrk)
for li_i = 1 to li_cbrk
    lb_data = lb_data + invo_sub.of_pack("v", li_tmp[li_i]) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 255)
next
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_protect ();integer li_ret = 1
uint li_record = 18
uint li_length = 2
blob lb_header
blob lb_data
uint li_flock
if not ib_protect then
    return li_ret
end if
li_flock = 1
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_flock)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_password ();integer li_ret = 1
uint li_record = 19
uint li_length = 2
blob lb_header
blob lb_data
uint li_wpassword
if not ib_protect then
    return li_ret
end if
li_wpassword = of_encode_password(is_password)
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_wpassword)
of_append_header(lb_header + lb_data)
return li_ret
end function

public function integer of_size_col (unsignedinteger ai_col);uint li_ind
li_ind = invo_key_col_sizes.of_get_key_index(ai_col)
if li_ind > 0 then
    if id_col_sizes[li_ind] = 0 then
        return 0
    else
        return id_col_sizes[li_ind] * 7 + 5
    end if
else
    return 64
end if
end function

public function integer of_size_row (unsignedinteger ai_row);uint li_ind
li_ind = invo_key_row_sizes.of_get_key_index(ai_row)
if li_ind > 0 then
    if id_row_sizes[li_ind] = 0 then
        return 0
    else
        return id_row_sizes[li_ind] * 4 / 3
    end if
else
    return 17
end if
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_format anvo_format);integer li_ret = 1
uint li_record = 515
uint li_length = 14
uint li_xf
blob lb_header
blob lb_data
n_xls_format_v97 lnvo_format
lnvo_format = anvo_format
li_xf = of_xf(ai_row, ai_col, lnvo_format)
if of_check_dimensions(ai_row, ai_col) <> 1 then
    li_ret = -2
end if
if li_ret = 1 then
    lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
    lb_data = invo_sub.of_pack("v", ai_row) + invo_sub.of_pack("v", ai_col) + invo_sub.of_pack("v", li_xf) + invo_sub.of_pack("d", adb_num)
    of_append_data(lb_header + lb_data)
end if
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format anvo_format);integer li_ret = 1
uint li_record = 513
uint li_length = 6
uint li_xf
blob lb_header
blob lb_data
n_xls_format_v97 lnvo_format
lnvo_format = anvo_format
li_xf = of_xf(ai_row, ai_col, lnvo_format)
if of_check_dimensions(ai_row, ai_col) <> 1 then
    li_ret = -2
end if
if li_ret = 1 then
    lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
    lb_data = invo_sub.of_pack("v", ai_row) + invo_sub.of_pack("v", ai_col) + invo_sub.of_pack("v", li_xf)
    of_append_data(lb_header + lb_data)
end if
return li_ret
end function

protected function integer of_store_bof (unsignedinteger ai_type);integer li_ret = 1
uint li_record = 2057
uint li_length = 16
blob lb_header
blob lb_data
uint li_version
ulong ll_history_flag = 16449
ulong ll_lowest_version = 262
uint li_build = 6319
uint li_year = 1997
li_version = invo_workbook.ii_biff_version
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_version) + invo_sub.of_pack("v", ai_type) + invo_sub.of_pack("v", li_build) + invo_sub.of_pack("v", li_year) + invo_sub.of_pack("V", ll_history_flag) + invo_sub.of_pack("V", ll_lowest_version)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_eof ();integer li_ret = 1
uint li_record = 10
uint li_length
blob lb_header
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
of_append_data(lb_header)
return li_ret
end function

public function integer of_set_row_format (long al_row, n_xls_format anvo_format);
integer li_ret = 1
uint li_height
boolean lb_hidden
setnull(li_height)
setnull(lb_hidden)
li_ret = of_set_row(al_row, li_height, anvo_format, lb_hidden)
return li_ret
end function

public function integer of_set_row_hidden (long al_row, boolean ab_hidden);integer li_ret = 1
n_xls_format_v97 lnvo_format
uint li_height
setnull(li_height)
setnull(lnvo_format)
li_ret = of_set_row(al_row, li_height, lnvo_format, ab_hidden)
return li_ret
end function

public function integer of_set_column_hidden (long al_col, boolean ab_hidden);integer li_ret = 1
n_xls_format_v97 lnvo_format
uint li_width
ulong ll_i
ll_i = invo_key_col_formats.of_get_key_index(al_col)
if ll_i > 0 then
    lnvo_format = invo_col_formats[ll_i]
else
    setnull(lnvo_format)
end if
ll_i = invo_key_col_sizes.of_get_key_index(al_col)
if ll_i > 0 then
    li_width = id_col_sizes[ll_i]
else
    setnull(li_width)
end if
li_ret = of_set_column(al_col, al_col, li_width, lnvo_format, ab_hidden)
return li_ret
end function

public function integer of_write_data (olestream astr_book);integer li_ret = 1
invo_header.of_write(astr_book)
invo_data.of_write(astr_book)
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, adb_num, lnvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, as_str, lnvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, at_time, lnvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, adt_datetime, lnvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, ad_date, lnvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, lnvo_format)
end function

public function integer of_set_first_sheet ();integer li_ret = 1
invo_workbook.ii_firstsheet = ii_index
return li_ret
end function

public function integer of_protect (string as_password);integer li_ret = 1
ib_protect = true
is_password = as_password
return li_ret
end function

public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col);integer li_ret = 1
invo_selection.ii_first_row = ai_row
invo_selection.ii_last_row = ai_row
invo_selection.ii_first_col = ai_col
invo_selection.ii_last_col = ai_col
return li_ret
end function

public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer li_ret = 1
invo_selection.ii_first_row = ai_first_row
invo_selection.ii_last_row = ai_last_row
invo_selection.ii_first_col = ai_first_col
invo_selection.ii_last_col = ai_last_col
return li_ret
end function

public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer li_ret = 1
if isnull(invo_panes) then
    invo_panes = create n_xls_panes
end if
invo_panes.id_y = ad_y
invo_panes.id_x = ad_x
invo_panes.ii_rowtop = ai_rowtop
invo_panes.ii_colleft = ai_colleft
ib_frozen = false
return li_ret
end function

public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer li_ret = 1
if isnull(invo_panes) then
    invo_panes = create n_xls_panes
end if
invo_panes.id_y = ai_row
invo_panes.id_x = ai_col
invo_panes.ii_rowtop = ai_rowtop
invo_panes.ii_colleft = ai_colleft
ib_frozen = true
return li_ret
end function

public function integer of_set_portrait ();integer li_ret = 1
ii_orientation =1 
return li_ret
end function

public function integer of_set_landscape ();integer li_ret =1
ii_orientation=0
return li_ret
end function

public function integer of_set_paper (unsignedinteger ai_paper_size);integer li_ret=1
ii_paper_size = ai_paper_size
return li_ret
end function

public function integer of_set_paper ();return of_set_paper(0)
end function

public function integer of_set_header (string as_header, double ad_margin_head);return of_set_header(invo_sub.to_unicode(as_header), ad_margin_head)
end function

public function integer of_set_footer (string as_footer, double ad_margin_foot);return of_set_footer(invo_sub.to_unicode(as_footer), ad_margin_foot)
end function

public function integer of_center_horizontally (boolean ab_option);integer li_ret = 1
if ab_option then
    ii_hcenter = 1
else
    ii_hcenter = 0
end if
return li_ret
end function

public function integer of_center_vertically (boolean ab_option);integer li_ret = 1
if ab_option then
    ii_vcenter = 1
else
    ii_vcenter = 0
end if
return li_ret
end function

public function integer of_set_margins (double ad_margin);of_set_margin_left(ad_margin)
of_set_margin_right(ad_margin)
of_set_margin_top(ad_margin)
of_set_margin_bottom(ad_margin)
return 1
end function

public function integer of_set_margins_lr (double ad_margin);of_set_margin_left(ad_margin)
of_set_margin_right(ad_margin)
return 1
end function

public function integer of_set_margins_tb (double ad_margin);of_set_margin_top(ad_margin)
of_set_margin_bottom(ad_margin)
return 1
end function

public function integer of_set_margin_left (double ad_margin);id_margin_left=ad_margin
return 1
end function

public function integer of_set_margin_right (double ad_margin);id_margin_right=ad_margin
return 1
end function

public function integer of_set_margin_top (double ad_margin);id_margin_top=ad_margin
return 1
end function

public function integer of_set_margin_bottom (double ad_margin);id_margin_bottom=ad_margin
return 1
end function

public function integer of_repeat_rows (unsignedinteger ai_first_row, unsignedinteger ai_last_row);ii_title_rowmin=ai_first_row
ii_title_rowmax=ai_last_row
return 1
end function

public function integer of_repeat_columns (unsignedinteger ai_first_col, unsignedinteger ai_last_col);ii_title_colmin=ai_first_col
ii_title_colmax=ai_last_col
return 1
end function

public function integer of_print_area (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer li_ret = 1
ii_print_rowmin = ai_first_row
ii_print_colmin = ai_first_col
ii_print_rowmax = ai_last_row
ii_print_colmax = ai_last_col
return li_ret
end function

public function integer of_hide_gridlines (unsignedinteger ai_option);integer li_ret = 1
choose case ai_option
    case 0
        ib_print_gridlines = true
        ib_screen_gridlines = true
    case 1
        ib_print_gridlines = false
        ib_screen_gridlines = true
    case else
        ib_print_gridlines = false
        ib_screen_gridlines = false
end choose
return li_ret
end function

public function integer of_print_row_col_headers (boolean ab_print_headers);ib_print_headers=ab_print_headers
return 1
end function

public function integer of_fit_to_pages (unsignedinteger ai_width, unsignedinteger ai_height);integer li_ret =1
ib_fit_page=true
ii_fit_width=ai_width
ii_fit_height=ai_height
return li_ret
end function

public function blob of_get_data ();blob lb_tmp
if isnull(ib_data) then
    return ib_data
else
    lb_tmp = ib_data
    setnull(ib_data)
    return lb_tmp
end if
end function

protected function ulong of_encode_password (string as_password);ulong ll_ret
ulong ll_chars[]
uint li_count
uint li_i
ulong ll_low
ulong ll_high
li_count = len(as_password)
if li_count > 0 then
    for li_i = 1 to li_count
        ll_chars[li_i] = uf_bitshl(asc(mid(as_password, li_i, 1)), li_i)
        ll_low = uf_bitand(ll_chars[li_i], 32767)
        ll_high = uf_bitshr(uf_bitand(ll_chars[li_i], uf_bitshl(32767, 15)), 15)
        ll_chars[li_i] = uf_bitor(ll_low, ll_high)
    next
    ll_ret = 0
    for li_i = 1 to li_count
        ll_ret = uf_bitxor(ll_ret, ll_chars[li_i])
    next
    ll_ret = uf_bitxor(ll_ret, li_count)
    ll_ret = uf_bitxor(ll_ret, 52811)
else
    ll_ret = 0
end if
return ll_ret
end function

public function integer of_set_row_height (long al_row, double ad_height);integer li_ret = 1
n_xls_format_v97 lnvo_format
boolean lb_hidden
setnull(lnvo_format)
setnull(lb_hidden)
li_ret = of_set_row(al_row, ad_height, lnvo_format, lb_hidden)
return li_ret
end function

public function integer of_set_column_width (long al_col, double ad_width);integer li_ret = 1
n_xls_format_v97 lnvo_format
boolean lb_hidden
ulong ll_i
ll_i = invo_key_col_formats.of_get_key_index(al_col)
if ll_i > 0 then
    lnvo_format = invo_col_formats[ll_i]
else
    setnull(lnvo_format)
end if
ll_i = invo_key_col_hiddens.of_get_key_index(al_col)
if ll_i > 0 then
    lb_hidden = ib_col_hiddens[ll_i]
else
    setnull(lb_hidden)
end if
li_ret = of_set_column(al_col, al_col, ad_width, lnvo_format, lb_hidden)
return li_ret
end function

public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_format anvo_format, boolean ab_hidden);integer li_ret = 1
double ld_width
uint li_i
ulong ll_key
n_xls_format_v97 lnvo_format
n_xls_colinfo lnvo_colinfo
lnvo_colinfo = create n_xls_colinfo
lnvo_colinfo.ii_firstcol = ai_firstcol
lnvo_colinfo.ii_lastcol = ai_lastcol
lnvo_colinfo.id_width = ad_width
if not isnull(anvo_format) then
    if isvalid(anvo_format) then
        lnvo_format = create n_xls_format_v97
        lnvo_format.of_copy(anvo_format)
        invo_workbook.dynamic of_reg_format(lnvo_format)
    else
        setnull(lnvo_format)
    end if
else
    setnull(lnvo_format)
end if
lnvo_colinfo.invo_format = lnvo_format
lnvo_colinfo.ib_hidden = ab_hidden
invo_colinfo[upperbound(invo_colinfo) + 1] = lnvo_colinfo
if ab_hidden then
    ld_width = 0
else
    ld_width = ad_width
end if
for li_i = ai_firstcol to ai_lastcol
    ll_key = invo_key_col_sizes.of_find_key(li_i)
    if ll_key < 1 then
        ll_key = invo_key_col_sizes.of_add_key(li_i)
    end if
    id_col_sizes[ll_key] = ad_width
next
if not isnull(ab_hidden) then
    for li_i = ai_firstcol to ai_lastcol
        ll_key = invo_key_col_hiddens.of_find_key(li_i)
        if ll_key < 1 then
            ll_key = invo_key_col_hiddens.of_add_key(li_i)
        end if
        ib_col_hiddens[ll_key] = ab_hidden
    next
end if
if not isnull(anvo_format) then
    if isvalid(anvo_format) then
        for li_i = ai_firstcol to ai_lastcol
            ll_key = invo_key_col_formats.of_find_key(li_i)
            if ll_key < 1 then
                ll_key = invo_key_col_formats.of_add_key(li_i)
            end if
            invo_col_formats[ll_key] = anvo_format
        next
    end if
end if
return li_ret
end function

public function integer of_set_column_width (long al_col, long al_width);integer li_ret = 1
n_xls_format_v97 lnvo_format
boolean lb_hidden
ulong ll_i
ll_i = invo_key_col_formats.of_get_key_index(al_col)
if ll_i > 0 then
    lnvo_format = invo_col_formats[ll_i]
else
    setnull(lnvo_format)
end if
ll_i = invo_key_col_hiddens.of_get_key_index(al_col)
if ll_i > 0 then
    lb_hidden = ib_col_hiddens[ll_i]
else
    setnull(lb_hidden)
end if
li_ret = of_set_column(al_col, al_col, al_width, lnvo_format, lb_hidden)
return li_ret
end function

public function integer of_set_row_height (long al_row, long al_height);integer li_ret = 1
n_xls_format_v97 lnvo_format
boolean lb_hidden
setnull(lnvo_format)
setnull(lb_hidden)
li_ret = of_set_row(al_row, al_height, lnvo_format, lb_hidden)
return li_ret
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y, readonly double ad_scale_width, readonly double ad_scale_height);integer li_ret = 1
long li_width
long li_height
long li_size
blob lb_data
blob lb_header
li_ret = of_process_bitmap(as_bitmap_filename, li_width, li_height, li_size, lb_data)
if li_ret = 1 then
    li_width = li_width * ad_scale_width
    li_height = li_height * ad_scale_height
    li_ret = of_position_image(ai_col, ai_row, ai_x, ai_y, li_width, li_height)
end if
if li_ret = 1 then
    lb_header = invo_sub.of_pack("v", 127) + invo_sub.of_pack("v", 8 + li_size) + invo_sub.of_pack("v", 9) + invo_sub.of_pack("v", 1) + invo_sub.of_pack("V", li_size)
    of_append_data(lb_header + lb_data)
end if
return li_ret
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y);return of_insert_bitmap(ai_row,ai_col,as_bitmap_filename,ai_x,ai_y,1,1)
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename);return of_insert_bitmap(ai_row,ai_col,as_bitmap_filename,0,0,1,1)
end function

public function integer of_select ();integer li_ret=1
ib_selected=true
return li_ret
end function

protected function integer of_store_obj_picture (readonly unsignedinteger ai_col_start, readonly unsignedinteger ai_x1, readonly unsignedinteger ai_row_start, readonly unsignedinteger ai_y1, readonly unsignedinteger ai_col_end, readonly unsignedinteger ai_x2, readonly unsignedinteger ai_row_end, readonly unsignedinteger ai_y2);integer li_ret = 1
blob lb_header
lb_header = invo_sub.of_pack("v", 93) + invo_sub.of_pack("v", 60) + invo_sub.of_pack("V", 1) + invo_sub.of_pack("v", 8) + invo_sub.of_pack("v", 1) + invo_sub.of_pack("v", 1556) + invo_sub.of_pack("v", ai_col_start) + invo_sub.of_pack("v", ai_x1) + invo_sub.of_pack("v", ai_row_start) + invo_sub.of_pack("v", ai_y1) + invo_sub.of_pack("v", ai_col_end) + invo_sub.of_pack("v", ai_x2) + invo_sub.of_pack("v", ai_row_end) + invo_sub.of_pack("v", ai_y2) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("V", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("C", 9) + invo_sub.of_pack("C", 9) + invo_sub.of_pack("C", 0) + invo_sub.of_pack("C", 0) + invo_sub.of_pack("C", 8) + invo_sub.of_pack("C", 255) + invo_sub.of_pack("C", 1) + invo_sub.of_pack("C", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("V", 9) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 0) + invo_sub.of_pack("v", 1) + invo_sub.of_pack("V", 0)
of_append_data(lb_header)
return li_ret
end function

protected function integer of_store_zoom ();integer li_ret = 1
uint li_record = 160
uint li_length = 4
blob lb_header
blob lb_data
if ii_zoom = 100 then
    return li_ret
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ii_zoom) + invo_sub.of_pack("v", 100)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_right ();integer li_ret = 1
uint li_record = 39
uint li_length = 8
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("d", id_margin_right)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_top ();integer li_ret = 1
uint li_record = 40
uint li_length = 8
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("d", id_margin_top)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_colinfo (n_xls_colinfo anvo_colinfo);integer li_ret = 1
uint li_record = 125
uint li_length = 11
blob lb_header
blob lb_data
uint li_coldx
uint li_ixfe = 15
uint li_grbit
uint li_reserved
n_xls_format_v97 lnvo_format
li_coldx = of_get_excel_width(anvo_colinfo.id_width)
if anvo_colinfo.ib_hidden then
    li_grbit = 1
end if
if not isnull(anvo_colinfo.invo_format) then
    if isvalid(anvo_colinfo.invo_format) then
        lnvo_format = anvo_colinfo.invo_format
        li_ixfe = invo_workbook.of_get_xf(lnvo_format)
    end if
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", anvo_colinfo.ii_firstcol) + invo_sub.of_pack("v", anvo_colinfo.ii_lastcol) + invo_sub.of_pack("v", li_coldx) + invo_sub.of_pack("v", li_ixfe) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("C", li_reserved)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_xf (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format_v97 anvo_format);uint li_xf = 15
ulong ll_key
if not isnull(anvo_format) then
    if isvalid(anvo_format) then
        return invo_workbook.dynamic of_reg_format(anvo_format)
    end if
end if
ll_key = invo_key_row_formats.of_get_key_index(ai_row)
if ll_key > 0 then
    return invo_workbook.dynamic of_reg_format(invo_row_formats[ll_key])
end if
ll_key = invo_key_col_formats.of_get_key_index(ai_col)
if ll_key > 0 then
    return invo_workbook.dynamic of_reg_format(invo_col_formats[ll_key])
end if
return li_xf
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str);n_xls_format_v97 lnvo_format
setnull(lnvo_format)
return of_write(ai_row, ai_col, ab_unicode_str, lnvo_format)
end function

public function blob of_get_name_unicode ();return ib_worksheetname
end function

public function integer of_set_row (unsignedinteger ai_row, double ad_height, n_xls_format_v97 anvo_format, boolean ab_hidden);integer li_ret = 1
uint li_record = 520
uint li_length = 16
uint li_colmic
uint li_colmac
uint li_irwmac
uint li_reserved
uint li_grbit = 320
uint li_ixfe = 15
uint li_miyrw = 255
blob lb_header
blob lb_data
ulong ll_i
boolean lb_format_undef
if not isnull(anvo_format) then
    if isvalid(anvo_format) then
        li_ixfe = invo_workbook.dynamic of_reg_format(anvo_format)
        li_grbit = li_grbit + 128
    else
        lb_format_undef = true
    end if
else
    lb_format_undef = true
end if
if lb_format_undef then
    ll_i = invo_key_row_formats.of_get_key_index(ai_row)
    if ll_i > 0 then
        li_ixfe = invo_workbook.dynamic of_reg_format(invo_row_formats[ll_i])
        li_grbit = li_grbit + 128
    end if
end if
if not isnull(ad_height) then
    li_miyrw = of_get_excel_height(ad_height)
else
    ll_i = invo_key_row_sizes.of_get_key_index(ai_row)
    if ll_i > 0 then
        li_miyrw = id_row_sizes[ll_i] * 20
    end if
end if
if isnull(ab_hidden) then
    ll_i = invo_key_row_hiddens.of_get_key_index(ai_row)
    if ll_i > 0 then
        if ib_row_hiddens[ll_i] then
            li_grbit = li_grbit + 32
        end if
    end if
elseif ab_hidden then
    li_grbit = li_grbit + 32
end if
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", ai_row) + invo_sub.of_pack("v", li_colmic) + invo_sub.of_pack("v", li_colmac) + invo_sub.of_pack("v", li_miyrw) + invo_sub.of_pack("v", li_irwmac) + invo_sub.of_pack("v", li_reserved) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("v", li_ixfe)
of_append_data(lb_header + lb_data)
if not isnull(ab_hidden) then
    ll_i = invo_key_row_hiddens.of_get_key_index(ai_row)
    if ll_i = 0 then
        ll_i = invo_key_row_hiddens.of_add_key(ai_row)
    end if
    ib_row_hiddens[ll_i] = ab_hidden
end if
if not isnull(ad_height) then
    ll_i = invo_key_row_sizes.of_get_key_index(ai_row)
    if ll_i = 0 then
        ll_i = invo_key_row_sizes.of_add_key(ai_row)
    end if
    id_row_sizes[ll_i] = ad_height
end if
if not isnull(anvo_format) then
    if isvalid(anvo_format) then
        ll_i = invo_key_row_formats.of_get_key_index(ai_row)
        if ll_i = 0 then
            ll_i = invo_key_row_formats.of_add_key(ai_row)
        end if
        invo_row_formats[ll_i] = anvo_format
    end if
end if
return li_ret
end function

public function integer of_position_image (unsignedinteger ai_col_start, unsignedinteger ai_row_start, unsignedinteger ai_x1, unsignedinteger ai_y1, unsignedinteger ai_width, unsignedinteger ai_height);Integer li_ret = 1
UInt li_col_end
UInt li_row_end
UInt li_x2
UInt li_y2
li_col_end = ai_col_start
li_row_end = ai_row_start
If ai_x1 >= of_size_col(ai_col_start) Then
	ai_x1 = 0
End If
If ai_y1 >= of_size_row(ai_row_start) Then
	ai_y1 = 0
End If
ai_width = ai_width + ai_x1 - 1
ai_height = ai_height + ai_y1 - 1
Do While ai_width >= of_size_col(li_col_end)
	ai_width -= of_size_col(li_col_end)
	li_col_end ++
Loop
Do While ai_height >= of_size_row(li_row_end)
	ai_height -= of_size_row(li_row_end)
	li_row_end ++
Loop
If of_size_col(ai_col_start) = 0 Then
	Return -1
End If
If of_size_col(li_col_end) = 0 Then
	Return -1
End If
If of_size_row(ai_row_start) = 0 Then
	Return -1
End If
If of_size_row(li_row_end) = 0 Then
	Return -1
End If
ai_x1 = ai_x1 / of_size_col(ai_col_start) * 1024
ai_y1 = ai_y1 / of_size_row(ai_row_start) * 256
li_x2 = ai_width / of_size_col(li_col_end) * 1024
li_y2 = ai_height / of_size_row(li_row_end) * 256
li_ret = of_store_obj_picture(ai_col_start, ai_x1, ai_row_start, ai_y1, li_col_end, li_x2, li_row_end, li_y2)
Return li_ret


end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, date ad_date, n_xls_format anvo_format);double ld_val
ld_val = daysafter(date("1904-12-30"), ad_date)
return of_merge_write(ai_first_row, ai_first_col, ai_last_row, ai_last_col, ld_val, anvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date, n_xls_format anvo_format);double ld_val = 0
ld_val = daysafter(date("1904-12-30"), ad_date)
return of_write(ai_row, ai_col, ld_val, anvo_format)
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, double adb_num, n_xls_format anvo_format);Integer li_ret = 1
UInt li_rwfirst
UInt li_colfirst
UInt li_rwlast
UInt li_collast
UInt li_i
UInt li_j
n_xls_format_v97 lnvo_format
li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col
If li_rwfirst = li_rwlast AND li_colfirst = li_collast Then
	MessageBox("错误", "不能合并单元格!", stopsign!)
	Return -1
End If
If li_rwfirst > li_rwlast Then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
End If
If li_colfirst > li_collast Then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
End If
If NOT IsNull(anvo_format) Then
	If IsValid(anvo_format) Then
		lnvo_format = anvo_format
		lnvo_format.of_set_merge_range()
	End If
End If
of_write(li_rwfirst, li_colfirst, adb_num, anvo_format)
For li_i = li_rwfirst TO li_rwlast
	For li_j = li_colfirst TO li_collast
		If li_i = li_rwfirst AND li_j = li_colfirst Then
		Else
			of_write(li_i, li_j, anvo_format)
		End If
	Next
Next
of_merge_cells(li_rwfirst, li_colfirst, li_rwlast, li_collast)
Return li_ret

end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, n_xls_format anvo_format);Integer li_ret = 1
UInt li_rwfirst
UInt li_colfirst
UInt li_rwlast
UInt li_collast
UInt li_i
UInt li_j
n_xls_format_v97 lnvo_format
li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col
If li_rwfirst = li_rwlast AND li_colfirst = li_collast Then
	MessageBox("错误", "不能合并单元格!", stopsign!)
	Return -1
End If
If li_rwfirst > li_rwlast Then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
End If
If li_colfirst > li_collast Then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
End If
If NOT IsNull(anvo_format) Then
	If IsValid(anvo_format) Then
		lnvo_format = anvo_format
		lnvo_format.of_set_merge_range()
	End If
End If
of_write(li_rwfirst, li_colfirst, anvo_format)
For li_i = li_rwfirst TO li_rwlast
	For li_j = li_colfirst TO li_collast
		If li_i = li_rwfirst AND li_j = li_colfirst Then
		Else
			of_write(li_i, li_j, anvo_format)
		End If
	Next
Next
of_merge_cells(li_rwfirst, li_colfirst, li_rwlast, li_collast)
Return li_ret

end function

public function integer of_set_zoom (unsignedinteger ai_scale);Integer li_ret = 1
If ai_scale < 10 OR ai_scale > 400 Then
	MessageBox("错误", "缩放比例范围是: 10-400", stopsign!)
	li_ret = -1
End If
If li_ret = 1 Then
	ii_zoom = ai_scale
End If
Return li_ret

end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_format anvo_format);Integer li_ret = 1
UInt li_rwfirst
UInt li_colfirst
UInt li_rwlast
UInt li_collast
UInt li_i
UInt li_j
n_xls_format_v97 lnvo_format
li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col
If li_rwfirst = li_rwlast AND li_colfirst = li_collast Then
	MessageBox("错误", "不能合并单元格!", stopsign!)
	Return -1
End If
If li_rwfirst > li_rwlast Then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
End If
If li_colfirst > li_collast Then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
End If
If NOT IsNull(anvo_format) Then
	If IsValid(anvo_format) Then
		lnvo_format = anvo_format
		lnvo_format.of_set_merge_range()
	End If
End If
of_write(li_rwfirst, li_colfirst, ab_unicode_str, anvo_format)
For li_i = li_rwfirst TO li_rwlast
	For li_j = li_colfirst TO li_collast
		If li_i = li_rwfirst AND li_j = li_colfirst Then
		Else
			of_write(li_i, li_j, anvo_format)
		End If
	Next
Next
of_merge_cells(li_rwfirst, li_colfirst, li_rwlast, li_collast)
Return li_ret

end function

public function integer of_set_print_scale (unsignedinteger ai_scale);Integer li_ret = 1
If ai_scale < 10 OR ai_scale > 400 Then
	MessageBox("错误", "打印缩放比例范围:10-400", stopsign!)
	li_ret = -1
End If
If li_ret = 1 Then
	ib_fit_page = FALSE
	ii_print_scale = ai_scale
End If
Return li_ret

end function

public function integer of_set_header (blob ab_header, double ad_margin_head);Integer li_ret = 1
If Len(ab_header) / 2 >= 255 Then
	MessageBox("错误", "头注区必须少于255个字符!", stopsign!)
	li_ret = -1
End If
If li_ret = 1 Then
	ib_header = ab_header
	If IsNull(ad_margin_head) Then
		id_margin_head = 0.50
	Else
		id_margin_head = ad_margin_head
	End If
End If
Return li_ret

end function

public function integer of_set_footer (blob ab_footer, double ad_margin_foot);Integer li_ret = 1
If Len(ab_footer) / 2 >= 255 Then
	MessageBox("错误", "脚注区必须少于255个字符!", stopsign!)
	li_ret = -1
End If
If li_ret = 1 Then
	ib_footer = ab_footer
	If IsNull(ad_margin_foot) Then
		id_margin_foot = 0.50
	Else
		id_margin_foot = ad_margin_foot
	End If
End If
Return li_ret

end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str, n_xls_format anvo_format);integer li_ret = 1
uint li_record = 253
uint li_length = 10
uint li_xf
ulong ll_sst_index
blob lb_header
blob lb_data
n_xls_format_v97 lnvo_format
if isnull(ab_unicode_str) then
    ab_unicode_str = blob("")
end if
lnvo_format = anvo_format
li_xf = of_xf(ai_row, ai_col, lnvo_format)
if of_check_dimensions(ai_row, ai_col) <> 1 then
    li_ret = -2
end if
if li_ret = 1 then
    ll_sst_index = invo_workbook.event ue_add_unicode(ab_unicode_str)
end if
if li_ret = 1 then
    lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
    lb_data = invo_sub.of_pack("v", ai_row) + invo_sub.of_pack("v", ai_col) + invo_sub.of_pack("v", li_xf) + invo_sub.of_pack("V", ll_sst_index)
    of_append_data(lb_header + lb_data)
end if
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_format anvo_format);as_str=invo_sub.of_str2xls(as_str)
return of_write(ai_row, ai_col, invo_sub.to_unicode(as_str), anvo_format)
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, string as_str, n_xls_format anvo_format);as_str=invo_sub.of_str2xls(as_str)
return of_merge_write(ai_first_row, ai_first_col, ai_last_row, ai_last_col, invo_sub.to_unicode(as_str), anvo_format)
end function

public function integer of_activate ();Integer li_ret
li_ret = of_select()
If li_ret = 1 Then
	invo_workbook.ii_activesheet = ii_index
End If
Return li_ret

end function

protected function blob of_add_continue (blob ab_data);UInt li_record = 60
Blob lb_header
Blob lb_tmp
ULong ll_start_pos = 1
lb_tmp = BlobMid(ab_data, 1, ii_limit)
ab_data = BlobMid(ab_data, ii_limit + 1, Len(ab_data) - ii_limit)
BlobEdit(lb_tmp, 3, invo_sub.of_pack("v", ii_limit - 4))
Do While Len(ab_data) > ii_limit
	lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", ii_limit)
	lb_tmp = lb_tmp + lb_header
	lb_tmp = lb_tmp + BlobMid(ab_data, 1, ii_limit)
	ab_data = BlobMid(ab_data, ii_limit + 1, Len(ab_data) - ii_limit)
Loop
If Len(ab_data) > 0 Then
	lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", Len(ab_data))
	lb_tmp = lb_tmp + lb_header
	lb_tmp = lb_tmp + ab_data
End If
Return lb_tmp
end function

public function integer of_add_h_pagebreak (unsignedinteger ai_hbreak);ii_hbreaks[UpperBound(ii_hbreaks)+1] = ai_hbreak
Return 1
end function

public function integer of_add_v_pagebreak (unsignedinteger ai_vbreak);ii_vbreaks[UpperBound(ii_vbreaks)+1] = ai_vbreak
Return 1
end function

protected function integer of_append_data (blob ab_data);Integer li_ret = 1
If Len(ab_data) > ii_limit Then
	ab_data = of_add_continue(ab_data)
End If
il_datasize += Len(ab_data)
invo_data.of_append(ab_data)
Return li_ret

end function

protected function integer of_append_header (blob ab_data);Integer li_ret = 1
If Len(ab_data) > ii_limit Then
	ab_data = of_add_continue(ab_data)
End If
il_datasize += Len(ab_data)
invo_header.of_append(ab_data)
Return li_ret
end function

public function integer of_center_horizontally ();Return  of_center_horizontally(True)

end function

public function integer of_center_vertically ();Return of_center_vertically(True)

end function

protected function unsignedinteger of_get_excel_height (double ad_value);UInt li_w1
Double ld_w1
Double ld_w2
li_w1 = Truncate(ad_value, 0)
ld_w2 = ad_value - li_w1
ld_w2 = Round(ld_w2 * 4, 0) / 4
Return (li_w1 + ld_w2) * 20

end function

protected function unsignedinteger of_get_excel_width (double ad_value);UInt li_w1
Double ld_w1
Double ld_w2
Double ld_w
li_w1 = Truncate(ad_value, 0)
ld_w2 = ad_value - li_w1
If li_w1 > 0 Then
	ld_w1 = li_w1 + 0.72
Else
	ld_w1 = 0
End If
If li_w1 > 0 Then
	ld_w = ld_w1 * 256 + ld_w2 * 256
Else
	ld_w = ld_w1 * 256 + ld_w2 * 256 * 1.8
End If
Return ld_w
end function

public function string of_get_name ();Return is_worksheetname

end function

protected function integer of_merge_cells (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);Integer li_ret = 1
UInt li_record = 229
UInt li_length = 10
Blob lb_header
Blob lb_data
UInt li_clref = 1
UInt li_rwfirst
UInt li_colfirst
UInt li_rwlast
UInt li_collast
li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col
If li_rwfirst = li_rwlast And li_colfirst = li_collast Then
	Return -1
End If
If li_rwfirst > li_rwlast Then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
End If
If li_colfirst > li_collast Then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
End If
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_clref) + invo_sub.of_pack("v", li_rwfirst) + invo_sub.of_pack("v", li_rwlast) + invo_sub.of_pack("v", li_colfirst) + invo_sub.of_pack("v", li_collast)
of_append_data(lb_header + lb_data)
Return li_ret

end function

public function integer of_set_column_format (long al_col, n_xls_format anvo_format);Integer li_ret = 1
UInt li_width
Boolean lb_hidden
ULong ll_i
ll_i = invo_key_col_sizes.of_get_key_index(al_col)
If ll_i > 0 Then
	li_width = id_col_sizes[ll_i]
Else
	SetNull(li_width)
End If
ll_i = invo_key_col_hiddens.of_get_key_index(al_col)
If ll_i > 0 Then
	lb_hidden = ib_col_hiddens[ll_i]
Else
	SetNull(lb_hidden)
End If
li_ret = of_set_column(al_col, al_col, li_width, anvo_format, lb_hidden)
Return li_ret
end function

protected function integer of_store_margin_left ();integer li_ret = 1
uint li_record = 38
uint li_length = 8
blob lb_header
blob lb_data
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("d", id_margin_left)
of_append_data(lb_header + lb_data)
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time, n_xls_format anvo_format);double ld_val
integer li_hour
integer li_minute
integer li_second
li_hour = hour(at_time)
li_minute = minute(at_time)
li_second = second(at_time)
ld_val = (li_second + li_minute * 60 + li_hour * 3600) / 24 / 3600
return of_write(ai_row, ai_col, ld_val, anvo_format)
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, time at_time, n_xls_format anvo_format);double ld_val
integer li_hour
integer li_minute
integer li_second
li_hour = hour(at_time)
li_minute = minute(at_time)
li_second = second(at_time)
ld_val = (li_second + li_minute * 60 + li_hour * 3600) / 24 / 3600
return of_merge_write(ai_first_row, ai_first_col, ai_last_row, ai_last_col, ld_val, anvo_format)
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, datetime adt_datetime, n_xls_format anvo_format);double ld_val
time lt_time
integer li_hour
integer li_minute
integer li_second
lt_time = time(adt_datetime)
li_hour = hour(lt_time)
li_minute = minute(lt_time)
li_second = second(lt_time)
ld_val = daysafter(date("1904-12-30"), date(adt_datetime)) + (li_second + li_minute * 60 + li_hour * 3600) / 24 / 3600
return of_merge_write(ai_first_row, ai_first_col, ai_last_row, ai_last_col, ld_val, anvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_format anvo_format);double ld_val
time lt_time
integer li_hour
integer li_minute
integer li_second
lt_time = time(adt_datetime)
li_hour = hour(lt_time)
li_minute = minute(lt_time)
li_second = second(lt_time)
ld_val = daysafter(date("1899-12-30"), date(adt_datetime)) + (li_second + li_minute * 60 + li_hour * 3600) / 24 / 3600
return of_write(ai_row, ai_col, ld_val, anvo_format)
end function

public function integer of_close ();integer li_ret = 1
uint li_i
uint li_cnt
long ll_i
of_store_bof(16)
li_cnt = upperbound(invo_colinfo)
if li_cnt > 0 then
    of_store_defcol()
    for li_i = li_cnt to 1 step -1
        of_store_colinfo(invo_colinfo[li_i])
    next
end if
of_store_print_headers()
of_store_print_gridlines()
of_store_gridset()
of_store_wsbool()
of_store_hbreak()
of_store_vbreak()
of_store_setup()
of_store_protect()
of_store_password()
of_store_dimensions()
of_store_margin_bottom()
of_store_margin_top()
of_store_margin_right()
of_store_margin_left()
of_store_vcenter()
of_store_hcenter()
of_store_footer()
of_store_header()
of_store_window2()
of_store_zoom()
if not isnull(invo_panes) then
    if isvalid(invo_panes) then
        of_store_panes(invo_panes)
    end if
end if
of_store_selection(invo_selection)
of_store_eof()
return li_ret
end function

protected function integer of_store_vbreak ();integer li_ret = 1
uint li_tmp[]
uint li_record = 26
uint li_length
blob lb_header
blob lb_data
uint li_cbrk
uint li_i
li_tmp = ii_vbreaks
of_sort_pagebreaks(li_tmp)
li_cbrk = upperbound(li_tmp)
if li_cbrk = 0 then
    return li_ret
end if
li_length = li_cbrk * 6 + 2
lb_header = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length)
lb_data = invo_sub.of_pack("v", li_cbrk)
for li_i = 1 to li_cbrk
    lb_data = lb_data + &
	 invo_sub.of_pack("v", li_tmp[li_i]) + &
	 invo_sub.of_pack("v", 0) + &
	 invo_sub.of_pack("v", 65535)
next
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_process_bitmap (readonly string as_bitmap_filename, ref long al_width, ref long al_height, ref long al_size, ref blob ab_data);Integer li_ret = 1
Integer li_file
Blob lb_data_item
Blob lb_data
ULong ll_size
UInt li_planes
UInt li_bitcount
ULong ll_compression
Blob lb_header
li_file = FileOpen(as_bitmap_filename, streammode!, Read!, lockwrite!)
If li_file <> -1 Then
	SetNull(lb_data)
	Do While FileRead(li_file, lb_data_item) > 0
		If IsNull(lb_data) Then
			lb_data = lb_data_item
		Else
			lb_data = lb_data + lb_data_item
		End If
	Loop
	If IsNull(lb_data) Then
		li_ret = -1
	End If
	FileClose(li_file)
Else
	li_ret = -1
	MessageBox("错误", "不能打开文件" + as_bitmap_filename, stopsign!)
End If
If li_ret = 1 Then
	If Len(lb_data) <= 54 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + " 不包含完整的数据!", stopsign!)
	End If
End If
If li_ret = 1 Then
	If String(BlobMid(lb_data, 1, 2)) <> "BM" Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + " 是不合法的位图", stopsign!)
	End If
End If
If li_ret = 1 Then
	ll_size = Long(BlobMid(lb_data, 3, 4))
	ll_size -= 54 - 12
	al_width = Long(BlobMid(lb_data, 19, 4))
	al_height = Long(BlobMid(lb_data, 23, 4))
	If al_width > 65535 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + ": 最大图像宽度是65535", stopsign!)
	End If
End If
If li_ret = 1 Then
	If al_height > 65535 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + ": 最大图像高度是65535", stopsign!)
	End If
End If
If li_ret = 1 Then
	li_planes = Integer(BlobMid(lb_data, 27, 2))
	li_bitcount = Integer(BlobMid(lb_data, 29, 2))
	If li_bitcount <> 24 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + " 不是24bit的真彩位图", stopsign!)
	End If
End If
If li_ret = 1 Then
	If li_planes <> 1 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + ":仅仅提供平面位图", stopsign!)
	End If
End If
If li_ret = 1 Then
	ll_compression = Long(BlobMid(lb_data, 31, 4))
	If ll_compression <> 0 Then
		li_ret = -1
		MessageBox("错误", as_bitmap_filename + ": 是压缩位图，不能被处理", stopsign!)
	End If
End If
If li_ret = 1 Then
	lb_header = invo_sub.of_pack("V", 12) + invo_sub.of_pack("v", al_width) + invo_sub.of_pack("v", al_height) + invo_sub.of_pack("v", 1) + invo_sub.of_pack("v", 24)
	ab_data = lb_header + BlobMid(lb_data, 55, Len(lb_data) - 55 + 1)
	al_size = ll_size
End If
Return li_ret

end function

on n_xls_worksheet_v97.create
call super::create
end on

on n_xls_worksheet_v97.destroy
call super::destroy
end on

event constructor;call super::constructor;il_dim_rowmin = il_xls_rowmax + 1
il_dim_colmin = il_xls_colmax + 1
invo_selection = create n_xls_selection
invo_data = create n_xls_data
invo_header = create n_xls_data
invo_selection.ii_first_row = 0
invo_selection.ii_last_row = 0
invo_selection.ii_first_col = 0
invo_selection.ii_last_col = 0
setnull(invo_panes)
setnull(ii_title_rowmin)
setnull(ii_title_rowmax)
setnull(ii_title_colmin)
setnull(ii_title_colmax)
setnull(ii_print_rowmin)
setnull(ii_print_rowmax)
setnull(ii_print_colmin)
setnull(ii_print_colmax)
invo_key_col_sizes = create n_associated_ulong_srv
invo_key_row_sizes = create n_associated_ulong_srv
invo_key_col_formats = create n_associated_ulong_srv
invo_key_row_formats = create n_associated_ulong_srv
invo_key_col_hiddens = create n_associated_ulong_srv
invo_key_row_hiddens = create n_associated_ulong_srv
end event

