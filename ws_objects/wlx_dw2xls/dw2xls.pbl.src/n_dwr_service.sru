$PBExportHeader$n_dwr_service.sru
forward
global type n_dwr_service from nonvisualobject
end type
end forward

global type n_dwr_service from nonvisualobject
event ue_cancle ( )
event ue_process_work ( )
end type
global n_dwr_service n_dwr_service

type variables
PRIVATE datawindow idw_dw
PUBLIC INTEGER ii_band_count
PUBLIC LONG il_cur_writer_row
PUBLIC BOOLEAN ib_show_progress
PUBLIC w_dwr_service_progress iw_progress
PRIVATE INTEGER ii_analyse_as_rowcount = 10
PRIVATE BOOLEAN ib_cancel
PRIVATE INTEGER ii_rows_per_detail = 1
PUBLIC n_dwr_grid invo_global_vgrid
PRIVATE BOOLEAN ib_group_newpage[]
PUBLIC n_dwr_band invo_bands[]
PUBLIC n_xls_workbook invo_writer
PUBLIC n_xls_worksheet invo_cur_sheet
PUBLIC n_dwr_service_parm invo_parm
PUBLIC n_dwr_sub invo_sub
PUBLIC n_dwr_colors invo_colors
end variables

forward prototypes
public function integer of_create (datawindow adw_dw, n_xls_workbook anvo_writer, string as_filename, n_dwr_service_parm anvo_parm)
public function integer of_create (datawindow adw_dw, n_xls_workbook anvo_writer, string as_filename)
public function integer of_process ()
public function integer of_close ()
public function integer of_cancel ()
private function integer of_set_col_width ()
private function integer of_set_yield (boolean ab_yield_status)
private function integer of_show_progress (integer ai_progress)
private function integer of_getband (string as_bandname, ref n_dwr_band anvo_band)
public function boolean of_is_newpage (long al_row)
private function integer of_analyse_dw (integer ai_percent_of_analyse)
public function integer of_process_work ()
private function integer of_addband (string as_band_name, integer ai_band_type, integer ai_group_level)
private function integer of_addbands ()
private function integer of_groupcount ()
end prototypes

event ue_cancle();of_cancel()
end event

event ue_process_work();of_process_work()
end event

public function integer of_create (datawindow adw_dw, n_xls_workbook anvo_writer, string as_filename, n_dwr_service_parm anvo_parm);Integer li_ret = 1
String ls_tmp_dir
Integer li_processing
If NOT IsNull(adw_dw) Then
	If IsValid(adw_dw) Then
		If adw_dw.Describe("Datawindow.Syntax") = "" Then
			MessageBox("错误", "报表为空", stopsign!)
			li_ret = -1
		End If
	Else
		MessageBox("错误", "报表为空", stopsign!)
		li_ret = -1
	End If
Else
	MessageBox("错误", "报表为空", stopsign!)
	li_ret = -1
End If
If li_ret = 1 Then
	li_processing = Integer(adw_dw.Describe("Datawindow.Processing"))
	Choose Case li_processing
		Case 0, 1
		Case 2
			MessageBox("错误", "标签风格没有提供!", stopsign!)
			li_ret = -1
		Case 3
			MessageBox("错误", "图像风格没有提供!", stopsign!)
			li_ret = -1
		Case 4
			adw_dw.Modify("DataWindow.Crosstab.StaticMode=Yes")
		Case 5
			MessageBox("错误", "交叉报表没有提供!", stopsign!)
			li_ret = -1
		Case Else
			MessageBox("错误", "当前报表没有提供", stopsign!)
			li_ret = -1
	End Choose
End If
If li_ret = 1 Then
	If adw_dw.RowCount() < 1 Then
		MessageBox("错误", "列没有发现", stopsign!)
		li_ret = -1
	End If
End If
If li_ret = 1 Then
	idw_dw = adw_dw
	invo_writer = anvo_writer
	invo_sub = CREATE n_dwr_sub
	invo_sub.of_set_cur_units(Integer(adw_dw.Describe("Datawindow.Units")))
	ls_tmp_dir = invo_sub.of_gettemppath()
	If ls_tmp_dir <> "" Then
		invo_writer.of_set_temp_dir(ls_tmp_dir)
	End If
	invo_global_vgrid = CREATE n_dwr_grid
	invo_global_vgrid.ii_round_ratio = invo_global_vgrid.ii_round_init_ratio * invo_sub.of_get_conv_x()
	li_ret = invo_writer.of_create(as_filename)
	If li_ret <> 1 Then
		Return li_ret
	End If
	invo_parm = anvo_parm
	invo_cur_sheet = invo_writer.of_addworksheet(invo_parm.is_sheet_name)
	invo_colors = CREATE n_dwr_colors
	invo_colors.invo_writer = invo_writer
End If
Return li_ret

end function

public function integer of_create (datawindow adw_dw, n_xls_workbook anvo_writer, string as_filename);n_dwr_service_parm lnvo_parm
lnvo_parm = create n_dwr_service_parm
return of_create(adw_dw, anvo_writer, as_filename, lnvo_parm)
end function

public function integer of_process ();integer li_ret = 1
if invo_parm.ib_show_progress then
    ib_show_progress = true
    openwithparm(iw_progress, this)
    if ib_cancel then
        li_ret = -1
    end if
else
    li_ret = of_process_work()
end if
return li_ret
end function

public function integer of_close ();invo_writer.of_close()
return 1
end function

public function integer of_cancel ();integer li_i
ib_cancel = true
ib_show_progress = false
setnull(iw_progress)
of_set_yield(false)
if ii_band_count > 0 then
    for li_i = 1 to ii_band_count
        invo_bands[li_i].ib_cancel = true
    next
end if
return 1
end function

private function integer of_set_col_width ();long ll_col_count
long ll_i
integer li_ret = 1
ll_col_count = invo_global_vgrid.of_get_split_count() - 1
for ll_i = 1 to ll_col_count
    invo_cur_sheet.of_set_column_width(ll_i - 1, invo_global_vgrid.of_get_col_width(ll_i) / invo_sub.of_get_cur_coef_x())
next
return li_ret
end function

private function integer of_set_yield (boolean ab_yield_status);integer li_i
if ii_band_count > 0 then
    for li_i = 1 to ii_band_count
        invo_bands[li_i].ib_yield_enable = ab_yield_status
    next
end if
return 1
end function

private function integer of_show_progress (integer ai_progress);if ib_show_progress then
    iw_progress.event ue_show_progress(ai_progress)
end if
return 1
end function

private function integer of_getband (string as_bandname, ref n_dwr_band anvo_band);long ll_i
if as_bandname = "foreground" then
    if not invo_parm.ib_foreground then
        return -1
    end if
    as_bandname = "header"
end if
if as_bandname = "background" then
    if not invo_parm.ib_background then
        return -1
    end if
    as_bandname = "header"
end if
for ll_i = 1 to ii_band_count
    if invo_bands[ll_i].is_band_name = as_bandname then
        anvo_band = invo_bands[ll_i]
        return 1
    end if
next
return -1
end function

public function boolean of_is_newpage (long al_row);boolean lb_newpage
integer li_i
for li_i = 1 to ii_band_count
    if invo_bands[li_i].ii_band_type = 2 then
        if al_row = invo_bands[li_i].il_groupchangerow and al_row > 1 and invo_bands[li_i].ib_newpage then
            lb_newpage = true
        end if
    end if
next
return lb_newpage
end function

private function integer of_analyse_dw (integer ai_percent_of_analyse);INTEGER li_ret = 1
n_dwr_string lnvo_str_srv
STRING ls_objects
STRING ls_object[]
LONG ll_objectcount
LONG ll_i
STRING ls_bandname
n_dwr_band lnvo_band
LONG ll_change_progress_each
LONG ll_cur_change_progress
INTEGER li_progress
DO
	IF ib_show_progress THEN
		of_show_progress(0)
	END IF
	ii_rows_per_detail = INTEGER(idw_dw.DESCRIBE("DataWindow.rows_per_detail"))
	IF ii_rows_per_detail < 1 OR ISNULL(ii_rows_per_detail) THEN
		ii_rows_per_detail = 1
	END IF
	li_ret = of_addbands()
	IF li_ret <> 1 THEN
		EXIT
	END IF
	ls_objects = idw_dw.DESCRIBE("DataWindow.Objects")
	ll_objectcount = lnvo_str_srv.of_parsetoarray(ls_objects, "~t", ls_object)
	IF ll_objectcount > 0 THEN
		IF ib_show_progress THEN
			IF ai_percent_of_analyse > 0 THEN
				ll_change_progress_each = LONG(ROUND(ll_objectcount / ai_percent_of_analyse, 0))
			ELSE
				ll_change_progress_each = ll_objectcount
			END IF
		END IF
		FOR ll_i = 1 TO ll_objectcount
			ls_bandname = idw_dw.DESCRIBE(ls_object[ll_i] + ".band")
			IF of_getband(ls_bandname, lnvo_band) <> 1 THEN
			ELSEIF lnvo_band.of_add_field(ls_object[ll_i]) <> 1 THEN
			ELSE
				IF ib_show_progress THEN
					ll_cur_change_progress ++
					IF ll_cur_change_progress >= ll_change_progress_each THEN
						li_progress = INTEGER(ROUND(ll_i / ll_objectcount * ai_percent_of_analyse, 0))
						of_show_progress(li_progress)
						ll_cur_change_progress = 0
					END IF
				END IF
				IF ib_cancel THEN
					li_ret = -1
					EXIT
				END IF
			END IF
		NEXT
		IF ib_show_progress THEN
			of_show_progress(ai_percent_of_analyse)
		END IF
		IF li_ret <> 1 THEN
			EXIT
		END IF
	ELSE
		li_ret = -1
		EXIT
	END IF
LOOP until TRUE 
RETURN li_ret

end function

public function integer of_process_work ();Long ll_writer_row
Long ll_dw_row
Long ll_dw_row_cnt
Integer li_cur_band
Integer li_ret = 1
Integer li_percent_of_analyse
Integer li_percent_of_process
Long ll_change_progress_each
Long ll_cur_change_progress
Integer li_progress
Boolean lb_newpage
ll_dw_row_cnt = idw_dw.RowCount() + 1
If ib_show_progress Then
	li_percent_of_analyse = Round(100 * ii_analyse_as_rowcount / (ll_dw_row_cnt + ii_analyse_as_rowcount), 0)
	li_percent_of_process = 100 - li_percent_of_analyse
	If li_percent_of_process > 0 Then
		ll_change_progress_each = Long(Round(ll_dw_row_cnt / li_percent_of_process, 0))
	Else
		ll_change_progress_each = ll_dw_row_cnt
	End If
End If
li_ret = of_analyse_dw(li_percent_of_analyse)
If li_ret <> 1 Then
	Return li_ret
End If
li_ret = of_set_col_width()
If li_ret <> 1 Then
	Return li_ret
End If
ll_dw_row = 1
Do while ll_dw_row <= ll_dw_row_cnt 
	lb_newpage = of_is_newpage(ll_dw_row)
	For li_cur_band = 1 To ii_band_count
		ll_writer_row += invo_bands[li_cur_band].of_check_process_row(ll_dw_row, ll_writer_row, lb_newpage)
		If ib_cancel Then
			li_ret = -1
			Exit
		End If
	Next
	If ib_show_progress Then
		ll_cur_change_progress ++
		If ll_cur_change_progress >= ll_change_progress_each Then
			li_progress = Integer(Round(ll_dw_row / ll_dw_row_cnt * li_percent_of_process, 0))
			of_show_progress(li_percent_of_analyse + li_progress)
			ll_cur_change_progress = 0
		End If
	End If
	If li_ret <> 1 Then
		Exit
	End If
	ll_dw_row += ii_rows_per_detail
	If ii_rows_per_detail > 1 Then
		If ll_dw_row > ll_dw_row_cnt And ll_dw_row - ii_rows_per_detail < ll_dw_row_cnt Then
			ll_dw_row = ll_dw_row_cnt
		End If
	End If
Loop
If invo_parm.ib_hide_grid Then
	invo_cur_sheet.of_hide_gridlines(3)
End If
If ib_show_progress Then
	of_show_progress(100)
	Close(iw_progress)
	ib_show_progress = False
	SetNull(iw_progress)
End If
Return li_ret

end function

private function integer of_addband (string as_band_name, integer ai_band_type, integer ai_group_level);n_dwr_band lnvo_band
Integer li_ret = 1
Boolean lb_newpage
lnvo_band = Create n_dwr_band
Do
	lnvo_band.id_x_coef = invo_sub.of_get_cur_coef_x()
	lnvo_band.id_y_coef = invo_sub.of_get_cur_coef_y()
	lnvo_band.id_conv = invo_sub.of_get_conv_x()
	li_ret = lnvo_band.of_register(idw_dw, invo_writer, invo_cur_sheet, invo_parm, invo_colors, ii_rows_per_detail)
	If li_ret <> 1 Then
		Exit
	End If
	If ai_group_level > 0 Then
		lb_newpage = ib_group_newpage[ai_group_level]
	End If
	li_ret = lnvo_band.of_init(as_band_name, ai_band_type, ai_group_level, lb_newpage, invo_global_vgrid)
	If li_ret <> 1 Then
		Exit
	End If
	ii_band_count ++
	invo_bands[ii_band_count] = lnvo_band
Loop Until True 
If li_ret <> 1 Then
	If Not IsNull(lnvo_band) Then
		If IsValid(lnvo_band) Then
			Destroy(lnvo_band)
		End If
	End If
End If
Return li_ret


end function

private function integer of_addbands ();integer li_groupcount
integer li_i
integer li_ret = 1
string ls_bands
string ls_band_arr[]
integer li_band_cnt
n_dwr_string lnvo_strsrv
li_groupcount = of_groupcount()
ls_bands = idw_dw.describe("datawindow.bands")
li_band_cnt = lnvo_strsrv.of_stringtoarray(ls_bands, "~t", ls_band_arr)
if invo_parm.ib_group_trailer then
    for li_i = li_groupcount to 1 step -1
        of_addband("trailer." + string(li_i), 4, li_i)
    next
end if
if invo_parm.ib_footer then
    of_addband("footer", 6, 0)
end if
for li_i = 1 to li_band_cnt
    if left(ls_band_arr[li_i], 6) = "header" and left(ls_band_arr[li_i], 7) <> "header." then
        if invo_parm.ib_header then
            of_addband(ls_band_arr[li_i], 1, 0)
        end if
    end if
next
if invo_parm.ib_group_header then
    for li_i = 1 to li_groupcount
        of_addband("header." + string(li_i), 2, li_i)
    next
end if
if invo_parm.ib_detail then
    of_addband("detail", 3, 0)
end if
if invo_parm.ib_summary then
    of_addband("summary", 5, 0)
end if
if ib_show_progress then
    of_set_yield(true)
end if
return li_ret
end function

private function integer of_groupcount ();Integer li_i
Integer li_cnt
String ls_bandname
String ls_syntax
Long ll_pos_1
Long ll_pos_2
String ls_group_syn
Boolean lb_newpage
Do
	If IsNumber(idw_dw.Describe("datawindow.header." + String(li_cnt + 1) + ".Height")) Then
		li_cnt ++
	Else
		Exit
	End If
Loop Until True 

If li_cnt > 0 Then
	ls_syntax = idw_dw.Describe("DataWindow.Syntax")
	For li_i = 1 To li_cnt
		lb_newpage = False
		ll_pos_1 = Pos(ls_syntax, "group(level=" + String(li_i))
		If ll_pos_1 > 0 Then
			ll_pos_2 = Pos(ls_syntax, "by=(", ll_pos_1)
			If ll_pos_2 > 0 Then
				ll_pos_2 = Pos(ls_syntax, ")", ll_pos_2 + 3)
				If ll_pos_2 > 0 Then
					ll_pos_2 = Pos(ls_syntax, ")", ll_pos_2 + 1)
				End If
			End If
			If ll_pos_2 > 0 Then
				ls_group_syn = Lower(Mid(ls_syntax, ll_pos_1, ll_pos_2 - ll_pos_1 + 1))
				If Pos(ls_group_syn, "newpage=y") > 0 Then
					lb_newpage = True
				End If
			End If
		End If
		ib_group_newpage[li_i] = lb_newpage
	Next
End If
Return li_cnt


end function

on n_dwr_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

