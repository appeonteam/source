$PBExportHeader$n_dwr_band.sru
forward
global type n_dwr_band from nonvisualobject
end type
end forward

global type n_dwr_band from nonvisualobject
end type
global n_dwr_band n_dwr_band

type variables
PUBLIC BOOLEAN ib_variable_band_height
PUBLIC LONG il_row_cnt
PUBLIC STRING is_band_name
PUBLIC INTEGER ii_band_type
PUBLIC INTEGER ii_group_level
PUBLIC BOOLEAN ib_newpage
PUBLIC LONG il_ysplit_ind_from
PUBLIC LONG il_ysplit_ind_to
PUBLIC BOOLEAN ib_enabled = TRUE
PUBLIC datawindow idw_dw
PUBLIC INTEGER ii_fields_count
PUBLIC LONG il_groupchangerow = 1
PUBLIC LONG il_dw_row_count
PRIVATE INTEGER ii_band_height
PUBLIC BOOLEAN ib_yield_enable
PUBLIC BOOLEAN ib_cancel
PUBLIC DOUBLE id_x_coef
PUBLIC DOUBLE id_y_coef
PUBLIC DOUBLE id_conv
PUBLIC n_dwr_grid invo_hgrid
PUBLIC n_dwr_grid invo_vgrid
PUBLIC n_dwr_field invo_fields[]
PUBLIC n_xls_workbook invo_writer
PUBLIC n_xls_worksheet invo_cur_sheet
PUBLIC n_dwr_service_parm invo_parm
PUBLIC n_dwr_colors invo_colors
PRIVATE n_cst_hash_long invo_row_in_detail
PUBLIC INTEGER ii_rows_per_detail = 1
PUBLIC INTEGER ii_dw_processing
end variables

forward prototypes
public function integer of_add_field (string as_name)
public function integer of_dynamic_horisontal_layout (long al_row)
public function integer of_process_row (long al_row, long al_writer_row)
public function integer of_set_row_height (long al_writer_row)
public subroutine of_find_row_in_detail ()
public function integer of_register (datawindow adw_dw, n_xls_workbook anvo_writer, n_xls_worksheet anvo_sheet, n_dwr_service_parm anvo_parm, n_dwr_colors anvo_colors, integer ai_rows_per_detail)
public function integer of_init (string as_band_name, integer ai_band_type, integer ai_group_level, boolean ab_newpage, n_dwr_grid anvo_vgrid)
public function integer of_check_process_row (long al_row, long al_writer_row, boolean ab_newpage)
end prototypes

public function integer of_add_field (string as_name);string ls_field_class
string ls_coltype
integer li_ret = 1
integer li_row_in_detail
n_dwr_field lnvo_field
if not ib_enabled then
    return 1
end if
if idw_dw.describe(as_name + ".visible") = "0" then
    return 1
end if
ls_field_class = idw_dw.describe(as_name + ".type")
choose case ls_field_class
    case "datawindow"
        li_ret = -1
    case "bitmap"
        li_ret = -1
    case "button"
        li_ret = -1
    case "column"
        lnvo_field = create n_dwr_field
        lnvo_field.of_register(idw_dw, invo_writer, invo_colors)
        lnvo_field.of_init(as_name, 1)
    case "compute"
        lnvo_field = create n_dwr_field
        lnvo_field.of_register(idw_dw, invo_writer, invo_colors)
        lnvo_field.of_init(as_name, 2)
    case "graph"
        li_ret = -1
    case "groupbox"
        li_ret = -1
    case "line"
        li_ret = -1
    case "ole"
        li_ret = -1
    case "ellipse"
        li_ret = -1
    case "rectangle"
        li_ret = -1
    case "report"
        li_ret = -1
    case "roundrectangle"
        li_ret = -1
    case "tableblob"
        li_ret = -1
    case "text"
        lnvo_field = create n_dwr_field
        lnvo_field.of_register(idw_dw, invo_writer, invo_colors)
        lnvo_field.of_init(as_name, 3)
end choose
if li_ret = 1 then
    if not ib_variable_band_height then
        if lnvo_field.of_get_y1() > ii_band_height + invo_hgrid.ii_round_ratio then
            li_ret = -1
        end if
        if li_ret = 1 then
            ii_fields_count ++
            invo_fields[ii_fields_count] = lnvo_field
            lnvo_field.il_xsplit_ind_from = invo_vgrid.of_add_split(lnvo_field.of_get_x1())
            lnvo_field.il_xsplit_ind_to = invo_vgrid.of_add_split(lnvo_field.of_get_x2())
            lnvo_field.il_ysplit_ind_from = invo_hgrid.of_add_split(lnvo_field.of_get_y1())
            lnvo_field.il_ysplit_ind_to = invo_hgrid.of_add_split(lnvo_field.of_get_y2())
            il_row_cnt = invo_hgrid.of_get_split_count() - 1
            if il_row_cnt < 0 then
                il_row_cnt = 0
            end if
        end if
    else
        ii_fields_count ++
        invo_fields[ii_fields_count] = lnvo_field
        lnvo_field.il_xsplit_ind_from = invo_vgrid.of_add_split(lnvo_field.of_get_x1())
        lnvo_field.il_xsplit_ind_to = invo_vgrid.of_add_split(lnvo_field.of_get_x2())
    end if
end if
if li_ret = 1 then
    if ii_band_type = 3 and ii_rows_per_detail > 1 then
        li_row_in_detail = invo_row_in_detail.of_get_value(as_name)
        if li_row_in_detail > 0 then
            lnvo_field.ii_row_in_detail = li_row_in_detail
        end if
    end if
end if
return li_ret
end function

public function integer of_dynamic_horisontal_layout (long al_row);integer li_ret = 1
integer li_i
invo_hgrid = create n_dwr_grid
invo_hgrid.ii_round_ratio = invo_hgrid.ii_round_init_ratio * id_conv
if ib_variable_band_height then
    ii_band_height = integer(idw_dw.describe("evaluate('rowheight()'," + string(al_row) + ")"))
else
    ii_band_height = integer(idw_dw.describe("datawindow." + is_band_name + ".height"))
end if
if ii_band_height > 0 then
    if invo_parm.ib_keep_band_height then
        il_ysplit_ind_from = invo_hgrid.of_add_split(0)
        il_ysplit_ind_to = invo_hgrid.of_add_split(ii_band_height)
    elseif ii_dw_processing = 1 and ib_variable_band_height then
        il_ysplit_ind_to = invo_hgrid.of_add_split(ii_band_height)
    end if
    if ii_fields_count > 0 then
        for li_i = 1 to ii_fields_count
            if invo_fields[li_i].of_get_y1() <= ii_band_height + invo_hgrid.ii_round_ratio then
                invo_fields[li_i].il_ysplit_ind_from = invo_hgrid.of_add_split(invo_fields[li_i].of_get_y1(al_row))
                if ii_dw_processing = 1 and ib_variable_band_height then
                    invo_fields[li_i].il_ysplit_ind_to = il_ysplit_ind_to
                else
                    invo_fields[li_i].il_ysplit_ind_to = invo_hgrid.of_add_split(invo_fields[li_i].of_get_y2(al_row))
                end if
            end if
        next
    end if
    il_row_cnt = invo_hgrid.of_get_split_count() - 1
    if il_row_cnt < 0 then
        il_row_cnt = 0
    end if
end if
return li_ret
end function

public function integer of_process_row (long al_row, long al_writer_row);integer li_i
integer li_ret = 1
integer li_res = 1
long ll_band_row
integer li_merge_row
long ll_band_col
integer li_merge_col
any la_val
time lt_time
datetime ldt_dtime
date ld_date
if ib_variable_band_height then
    li_ret = of_dynamic_horisontal_layout(al_row)
end if
for li_i = 1 to ii_fields_count
    if invo_fields[li_i].of_get_visible(al_row) <> 1 then
    else
        li_res = invo_vgrid.of_get_pos(invo_fields[li_i].il_xsplit_ind_from, invo_fields[li_i].il_xsplit_ind_to, ll_band_col, li_merge_col)
        if li_res <> 1 then
        else
            li_res = invo_hgrid.of_get_pos(invo_fields[li_i].il_ysplit_ind_from, invo_fields[li_i].il_ysplit_ind_to, ll_band_row, li_merge_row)
            if li_res <> 1 then
            else
                la_val = invo_fields[li_i].of_getvalue(al_row)
                if (li_merge_col > 0 or li_merge_row > 0) and invo_parm.ib_enable_merge_cells then
                    choose case classname(la_val)
                        case "integer", "decimal", "double", "number", "real"
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, double(la_val), invo_fields[li_i].of_get_format(al_row))
                        case "string", "char"
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, string(la_val), invo_fields[li_i].of_get_format(al_row))
                        case "date"
                            ld_date = la_val
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, ld_date, invo_fields[li_i].of_get_format(al_row))
                        case "datetime"
                            ldt_dtime = la_val
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, ldt_dtime, invo_fields[li_i].of_get_format(al_row))
                        case "time"
                            lt_time = la_val
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, lt_time, invo_fields[li_i].of_get_format(al_row))
                        case else
                            invo_cur_sheet.of_merge_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, al_writer_row + ll_band_row - 1 + li_merge_row, ll_band_col - 1 + li_merge_col, invo_fields[li_i].of_get_format(al_row))
                    end choose
                else
                    choose case classname(la_val)
                        case "integer", "decimal", "double", "number", "real"
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, double(la_val), invo_fields[li_i].of_get_format(al_row))
                        case "string", "char"
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, string(la_val), invo_fields[li_i].of_get_format(al_row))
                        case "date"
                            ld_date = la_val
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, ld_date, invo_fields[li_i].of_get_format(al_row))
                        case "datetime"
                            ldt_dtime = la_val
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, ldt_dtime, invo_fields[li_i].of_get_format(al_row))
                        case "time"
                            lt_time = la_val
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, lt_time, invo_fields[li_i].of_get_format(al_row))
                        case else
                            invo_cur_sheet.of_write(al_writer_row + ll_band_row - 1, ll_band_col - 1, invo_fields[li_i].of_get_format(al_row))
                    end choose
                end if
                if ib_yield_enable then
                    yield()
                end if
                if ib_cancel then
                    li_ret = -1
                    exit
                end if
            end if
        end if
    end if
next
if li_ret = 1 then
    of_set_row_height(al_writer_row)
end if
return il_row_cnt
end function

public function integer of_set_row_height (long al_writer_row);long ll_i
integer li_ret = 1
for ll_i = 1 to il_row_cnt
    invo_cur_sheet.of_set_row_height(al_writer_row + ll_i - 1, invo_hgrid.of_get_col_width(ll_i) / id_y_coef)
next
return li_ret
end function

public subroutine of_find_row_in_detail ();STRING ls_syntax
LONG ll_pos
LONG ll_pos_end
LONG ll_start_pos = 1
STRING ls_column
STRING ls_name
STRING ls_row_in_detail
INTEGER li_row_in_detail
ls_syntax = idw_dw.Describe("datawindow.syntax")
invo_row_in_detail = CREATE n_cst_hash_long
DO WHILE ll_start_pos >= 0
	ll_pos = POS(ls_syntax, "~r~ncolumn(", ll_start_pos)
	IF ll_pos > 0 THEN
		ll_pos_end = POS(ls_syntax, "~r~n", ll_pos + 7)
		IF ll_pos_end > 0 THEN
			ll_start_pos = ll_pos_end - 2
		ELSE
			ll_start_pos = -1
			ll_pos_end = LEN(ls_syntax) + 1
		END IF
		ls_column = MID(ls_syntax, ll_pos, ll_pos_end - ll_pos)
		ll_pos = POS(ls_column, "name=")
		IF ll_pos > 0 THEN
			ll_pos_end = POS(ls_column, " ", ll_pos + 5)
			IF ll_pos_end > 0 THEN
				ls_name = MID(ls_column, ll_pos + 5, ll_pos_end - ll_pos - 5)
				ll_pos = POS(ls_column, "row_in_detail=")
				IF ll_pos > 0 THEN
					ll_pos_end = POS(ls_column, " ", ll_pos + 14)
					
					IF ll_pos_end > 0 THEN
						ls_row_in_detail = MID(ls_column, ll_pos + 14, ll_pos_end - ll_pos - 14)
						li_row_in_detail = INTEGER(ls_row_in_detail)
						invo_row_in_detail.of_set_value(ls_name, li_row_in_detail)
					END IF
				END IF
			END IF
		END IF
	ELSE
		ll_start_pos = -1
	END IF
LOOP

end subroutine

public function integer of_register (datawindow adw_dw, n_xls_workbook anvo_writer, n_xls_worksheet anvo_sheet, n_dwr_service_parm anvo_parm, n_dwr_colors anvo_colors, integer ai_rows_per_detail);idw_dw = adw_dw
invo_writer = anvo_writer
invo_cur_sheet = anvo_sheet
il_dw_row_count = idw_dw.rowcount()
invo_parm = anvo_parm
invo_colors = anvo_colors
ii_rows_per_detail = ai_rows_per_detail
return 1
end function

public function integer of_init (string as_band_name, integer ai_band_type, integer ai_group_level, boolean ab_newpage, n_dwr_grid anvo_vgrid);integer li_ret = 1
boolean lb_vgrid_def
is_band_name = as_band_name
ii_band_type = ai_band_type
ii_group_level = ai_group_level
ib_newpage = ab_newpage
if ii_band_type = 3 then
    ib_variable_band_height = true
end if
ii_dw_processing = integer(idw_dw.describe("Datawindow.Processing"))
if not isnull(anvo_vgrid) then
    if isvalid(anvo_vgrid) then
        lb_vgrid_def = true
    end if
end if
if lb_vgrid_def then
    invo_vgrid = anvo_vgrid
else
    invo_vgrid = create n_dwr_grid
    invo_vgrid.ii_round_ratio = invo_vgrid.ii_round_init_ratio * id_conv
end if
if ai_band_type = 3 and ii_rows_per_detail > 1 then
    of_find_row_in_detail()
end if
if not ib_variable_band_height then
    invo_hgrid = create n_dwr_grid
    invo_hgrid.ii_round_ratio = invo_hgrid.ii_round_init_ratio * id_conv
    ii_band_height = integer(idw_dw.describe("datawindow." + is_band_name + ".height"))
    if ii_band_height > 0 then
        ib_enabled = true
        if invo_parm.ib_keep_band_height then
            il_ysplit_ind_from = invo_hgrid.of_add_split(0)
            il_ysplit_ind_to = invo_hgrid.of_add_split(ii_band_height)
        end if
        il_row_cnt = invo_hgrid.of_get_split_count() - 1
        if il_row_cnt < 0 then
            il_row_cnt = 0
        end if
        ib_enabled = true
    else
        ib_enabled = false
    end if
else
    ib_enabled = true
end if
return li_ret
end function

public function integer of_check_process_row (long al_row, long al_writer_row, boolean ab_newpage);integer li_processed_row
if not ib_enabled and not (ii_band_type = 2 or ii_band_type = 3) then
    return 0
end if
choose case ii_band_type
    case 1
        if al_row = 1 or ab_newpage then
            li_processed_row = of_process_row(al_row, al_writer_row)
        end if
    case 2
        if al_row = il_groupchangerow and il_dw_row_count > 0 or ab_newpage then
            if ib_enabled then
                li_processed_row = of_process_row(al_row, al_writer_row)
            end if
            if al_row = il_groupchangerow and il_dw_row_count > 0 then
                il_groupchangerow = idw_dw.findgroupchange(il_groupchangerow + 1, ii_group_level)
            end if
        end if
    case 3
        if al_row <= il_dw_row_count then
            li_processed_row = of_process_row(al_row, al_writer_row)
        end if
    case 4
        if al_row = il_groupchangerow or ab_newpage then
            if al_row > 1 and ib_enabled then
                li_processed_row = of_process_row(al_row - 1, al_writer_row)
            end if
            if al_row = il_groupchangerow then
                il_groupchangerow = idw_dw.findgroupchange(il_groupchangerow + 1, ii_group_level)
                if il_groupchangerow <= 0 then
                    il_groupchangerow = il_dw_row_count + 1
                end if
            end if
        end if
    case 5
        if al_row = il_dw_row_count + 1 then
            li_processed_row = of_process_row(al_row - 1, al_writer_row)
        end if
    case 6
        if al_row = il_dw_row_count + 1 or ab_newpage then
            li_processed_row = of_process_row(al_row - 1, al_writer_row)
        end if
end choose
return li_processed_row
end function

on n_dwr_band.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_band.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

