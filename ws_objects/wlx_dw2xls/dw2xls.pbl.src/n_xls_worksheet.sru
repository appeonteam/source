$PBExportHeader$n_xls_worksheet.sru
forward
global type n_xls_worksheet from nonvisualobject
end type
end forward

global type n_xls_worksheet from nonvisualobject
end type
global n_xls_worksheet n_xls_worksheet

type variables
PUBLIC STRING is_worksheetname
PUBLIC n_xls_subroutines_v97 invo_sub
end variables

forward prototypes
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date, n_xls_format anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format anvo_format)
public function integer of_set_row_height (long al_row, long al_height)
public function integer of_set_row_format (long al_row, n_xls_format anvo_format)
public function integer of_set_row_hidden (long al_row, boolean ab_hidden)
public function integer of_set_column_width (long al_col, long al_width)
public function integer of_set_column_format (long al_col, n_xls_format anvo_format)
public function integer of_set_column_hidden (long al_col, boolean ab_hidden)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, double adb_num, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, string as_str, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, time at_time, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, datetime adt_datetime, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, date ad_date, n_xls_format anvo_format)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, n_xls_format anvo_format)
public function string of_get_name ()
public function blob of_get_name_unicode ()
public function integer of_select ()
public function integer of_activate ()
public function integer of_set_first_sheet ()
public function integer of_protect (string as_password)
public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_format anvo_format, boolean ab_hidden)
public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function integer of_set_portrait ()
public function integer of_set_landscape ()
public function integer of_set_paper (unsignedinteger ai_paper_size)
public function integer of_set_paper ()
public function integer of_set_header (string as_header, double ad_margin_head)
public function integer of_set_footer (string as_footer, double ad_margin_foot)
public function integer of_set_header (blob ab_header, double ad_margin_head)
public function integer of_set_footer (blob ab_footer, double ad_margin_foot)
public function integer of_center_horizontally ()
public function integer of_center_horizontally (boolean ab_option)
public function integer of_center_vertically ()
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
public function integer of_add_h_pagebreak (unsignedinteger ai_hbreak)
public function integer of_add_v_pagebreak (unsignedinteger ai_vbreak)
public function integer of_set_zoom (unsignedinteger ai_scale)
public function integer of_set_print_scale (unsignedinteger ai_scale)
public function integer of_set_row_height (long al_row, double ad_height)
public function integer of_set_column_width (long al_col, double ad_width)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y, readonly double ad_scale_width, readonly double ad_scale_height)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename)
public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y)
end prototypes

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str);return of_write(ai_row,ai_col,invo_sub.to_ansi(ab_unicode_str))
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, blob ab_unicode_str, n_xls_format anvo_format);return of_write(ai_row,ai_col,invo_sub.to_ansi(ab_unicode_str),anvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_set_row_height (long al_row, long al_height);integer retvar
return retvar
end function

public function integer of_set_row_format (long al_row, n_xls_format anvo_format);return 1
end function

public function integer of_set_row_hidden (long al_row, boolean ab_hidden);integer retvar
return retvar
end function

public function integer of_set_column_width (long al_col, long al_width);integer retvar
return retvar
end function

public function integer of_set_column_format (long al_col, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_set_column_hidden (long al_col, boolean ab_hidden);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, double adb_num, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, string as_str, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, time at_time, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, datetime adt_datetime, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, date ad_date, n_xls_format anvo_format);integer retvar
return retvar
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, n_xls_format anvo_format);integer retvar
return retvar
end function

public function string of_get_name ();string retvar
return retvar
end function

public function blob of_get_name_unicode ();return invo_sub.to_unicode(of_get_name())
end function

public function integer of_select ();integer retvar
return retvar
end function

public function integer of_activate ();integer retvar
return retvar
end function

public function integer of_set_first_sheet ();integer retvar
return retvar
end function

public function integer of_protect (string as_password);integer retvar
return retvar
end function

public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_format anvo_format, boolean ab_hidden);integer retvar
return retvar
end function

public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer retvar
return retvar
end function

public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col);integer retvar
return retvar
end function

public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer retvar
return retvar
end function

public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer retvar
return retvar
end function

public function integer of_set_portrait ();integer retvar
return retvar
end function

public function integer of_set_landscape ();integer retvar
return retvar
end function

public function integer of_set_paper (unsignedinteger ai_paper_size);integer retvar
return retvar
end function

public function integer of_set_paper ();integer retvar
return retvar
end function

public function integer of_set_header (string as_header, double ad_margin_head);integer retvar
return retvar
end function

public function integer of_set_footer (string as_footer, double ad_margin_foot);return 1
end function

public function integer of_set_header (blob ab_header, double ad_margin_head);return of_set_header(invo_sub.to_ansi(ab_header),ad_margin_head)
end function

public function integer of_set_footer (blob ab_footer, double ad_margin_foot);return of_set_footer(invo_sub.to_ansi(ab_footer),ad_margin_foot)
end function

public function integer of_center_horizontally ();integer retvar
return retvar
end function

public function integer of_center_horizontally (boolean ab_option);integer retvar
return retvar
end function

public function integer of_center_vertically ();integer retvar
return retvar
end function

public function integer of_center_vertically (boolean ab_option);integer retvar
return retvar
end function

public function integer of_set_margins (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margins_lr (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margins_tb (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margin_left (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margin_right (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margin_top (double ad_margin);integer retvar
return retvar
end function

public function integer of_set_margin_bottom (double ad_margin);integer retvar
return retvar
end function

public function integer of_repeat_rows (unsignedinteger ai_first_row, unsignedinteger ai_last_row);integer retvar
return retvar
end function

public function integer of_repeat_columns (unsignedinteger ai_first_col, unsignedinteger ai_last_col);integer retvar
return retvar
end function

public function integer of_print_area (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer retvar
return retvar
end function

public function integer of_hide_gridlines (unsignedinteger ai_option);integer retvar
return retvar
end function

public function integer of_print_row_col_headers (boolean ab_print_headers);integer retvar
return retvar
end function

public function integer of_fit_to_pages (unsignedinteger ai_width, unsignedinteger ai_height);integer retvar
return retvar
end function

public function integer of_add_h_pagebreak (unsignedinteger ai_hbreak);integer retvar
return retvar
end function

public function integer of_add_v_pagebreak (unsignedinteger ai_vbreak);integer retvar
return retvar
end function

public function integer of_set_zoom (unsignedinteger ai_scale);integer retvar
return retvar
end function

public function integer of_set_print_scale (unsignedinteger ai_scale);integer retvar
return retvar
end function

public function integer of_set_row_height (long al_row, double ad_height);integer retvar
return retvar
end function

public function integer of_set_column_width (long al_col, double ad_width);integer retvar
return retvar
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y, readonly double ad_scale_width, readonly double ad_scale_height);integer li_ret=1
return li_ret
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename);integer li_ret=1
return li_ret
end function

public function integer of_insert_bitmap (readonly unsignedinteger ai_row, readonly unsignedinteger ai_col, readonly string as_bitmap_filename, readonly unsignedinteger ai_x, readonly unsignedinteger ai_y);integer li_ret=1
return li_ret
end function

on n_xls_worksheet.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_worksheet.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;invo_sub = create n_xls_subroutines_v97
end event

event destructor;destroy(invo_sub)
end event

