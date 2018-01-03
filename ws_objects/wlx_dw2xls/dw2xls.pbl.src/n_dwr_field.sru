$PBExportHeader$n_dwr_field.sru
forward
global type n_dwr_field from nonvisualobject
end type
end forward

global type n_dwr_field from nonvisualobject
end type
global n_dwr_field n_dwr_field

type variables
Public Integer ii_dwo_type
Public String is_dwo_name
Public String is_coltype
Public Integer ii_colsize
Public Long il_xsplit_ind_from
Public Long il_xsplit_ind_to
Public Long il_ysplit_ind_from
Public Long il_ysplit_ind_to
Public String is_text
Public datawindow idw_dw
Private Integer ii_column_display_type
Public n_xls_format invo_format
Public n_xls_workbook invo_writer
Public n_dwr_colors invo_colors
Public Boolean ib_color_expr = False
Public Boolean ib_bg_color_expr = False
Public Boolean ib_format_expr = False
Public Boolean ib_font_face_expr = False
Public Boolean ib_font_height_expr = False
Public Boolean ib_font_italic_expr = False
Public Boolean ib_font_underline_expr = False
Public Boolean ib_font_weight_expr = False
Public Boolean ib_alignment_expr = False
Public String is_color_expr = ""
Public String is_bg_color_expr = ""
Public String is_format_expr = ""
Public String is_font_face_expr = ""
Public String is_font_height_expr = ""
Public String is_font_italic_expr = ""
Public String is_font_underline_expr = ""
Public String is_font_weight_expr = ""
Public String is_alignment_expr = ""
Public Boolean ib_custom_format = False
Public Integer ii_row_in_detail = 1
Public Long il_dw_row_count

end variables

forward prototypes
public function any of_getvalue (long al_row)
public function integer of_register (datawindow adw_dw, n_xls_workbook anvo_writer, n_dwr_colors anvo_colors)
public function integer of_setformat ()
public function long of_get_x1 ()
public function long of_get_x2 ()
public function long of_get_y1 (long al_row)
public function long of_get_y2 (long al_row)
public function long of_get_y1 ()
public function integer of_get_visible (long al_row)
public function long of_get_y2 ()
public function integer of_init (string as_dwo_name, integer ai_dwo_type)
public function string of_get_item_coltype ()
public function long of_describe_expr (string as_expr, long al_row)
public function n_xls_format of_get_format (long al_row)
public function integer of_set_bg_color (n_xls_format a_format, long al_row)
public function integer of_check_property (string as_property_name, ref boolean ab_is_expression, ref string as_expression, ref string as_value)
public function string of_descr_numformat ()
public function long of_descr_font_height ()
public function boolean of_descr_font_italic ()
public function integer of_descr_font_underline ()
public function boolean of_descr_font_weight ()
public function string of_descr_alignment ()
public function integer of_descr_bg_color ()
public function integer of_eval_bg_color (n_xls_format anvo_format, long al_row)
public function integer of_eval_font_face (n_xls_format anvo_format, long al_row)
public function integer of_eval_numformat (n_xls_format anvo_format, long al_row)
public function integer of_eval_font_height (n_xls_format anvo_format, long al_row)
public function integer of_eval_font_italic (n_xls_format anvo_format, long al_row)
public function integer of_eval_font_underline (n_xls_format anvo_format, long al_row)
public function integer of_eval_font_weight (n_xls_format anvo_format, long al_row)
private function integer of_get_column_display_type ()
private function string of_unquote (string as_str)
public function string of_descr_font_face ()
public function integer of_descr_color ()
public function integer of_eval_alignment (n_xls_format anvo_format, long al_row)
public function string of_change_format (ref string as_format, string as_type)
public function integer of_eval_color (n_xls_format anvo_format, long al_row)
public function integer of_set_color (n_xls_format a_format, long al_row)
end prototypes

public function any of_getvalue (long al_row);any la_val
string ls_val




double ldb_val
datetime ldt_val
date ld_val
time lt_val
integer li_id
setnull(la_val)
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    choose case ii_dwo_type
        case 1, 2
            if ii_column_display_type = 1 then
                choose case is_coltype
                    case "s"
                        li_id = integer(idw_dw.describe(is_dwo_name + ".id"))
                        if li_id > 0 then
                            la_val = string(idw_dw.object.data[al_row, li_id])
                        else
                            la_val = string(idw_dw.describe("Evaluate('" + is_dwo_name + "', " + string(al_row) + ")"))
                        end if
                    case "n"
                        la_val = idw_dw.getitemdecimal(al_row, is_dwo_name)
                    case "d"
                        la_val = idw_dw.getitemdate(al_row, is_dwo_name)
                    case "dt"
                        la_val = idw_dw.getitemdatetime(al_row, is_dwo_name)
                    case "t"
                        la_val = idw_dw.getitemtime(al_row, is_dwo_name)
                end choose
            else
                la_val = string(idw_dw.describe("Evaluate('LookUpDisplay(" + is_dwo_name + ")', " + string(al_row) + ")"))
            end if
        case 3
            la_val = is_text
    end choose
end if
return la_val
end function

public function integer of_register (datawindow adw_dw, n_xls_workbook anvo_writer, n_dwr_colors anvo_colors);idw_dw = adw_dw
invo_writer = anvo_writer
invo_colors = anvo_colors
return 1
end function

public function integer of_setformat ();integer li_ret = 1
string ls_format
integer li_color_index
string ls_border_style
invo_format = invo_writer.of_addformat()
if isnull(invo_format) then
    li_ret = -1
elseif not isvalid(invo_format) then
    li_ret = -1
end if
if li_ret = 1 then
    ls_format = of_descr_numformat()
    if ls_format = "" then
        ls_format = "[General]"
    end if
    ls_format = of_change_format(ls_format, is_coltype)
    invo_format.of_set_num_format(ls_format)
    invo_format.of_set_font(of_descr_font_face())
    invo_format.of_set_size(of_descr_font_height())
    invo_format.of_set_italic(of_descr_font_italic())
    invo_format.of_set_underline(of_descr_font_underline())
    invo_format.of_set_bold(of_descr_font_weight())
    invo_format.of_set_align(of_descr_alignment())
    invo_format.of_set_align("top")
    if is_coltype = "s" then
        invo_format.of_set_text_wrap(true)
    end if
//	 设置格式
    li_color_index = of_descr_color()
    if li_color_index > 0 then
        invo_format.of_set_color(li_color_index)
    end if
    li_color_index = of_descr_bg_color()
    if li_color_index > 0 then
        invo_format.of_set_bg_color(li_color_index)
    end if
end if
if li_ret = 1 then
    ls_border_style = idw_dw.describe(is_dwo_name + ".Border")
    if isnumber(ls_border_style) and integer(ls_border_style) > 0 then
        invo_format.of_set_border(1)
    elseif integer(idw_dw.describe("Datawindow.Processing")) = 1 then
        invo_format.of_set_border(7)
    end if
    ib_custom_format = ib_color_expr or ib_bg_color_expr or ib_alignment_expr or ib_font_face_expr or ib_font_height_expr or ib_font_italic_expr or ib_font_underline_expr or ib_font_weight_expr or ib_format_expr
end if
return li_ret
end function

public function long of_get_x1 ();long ll_ret
string ls_expr
ll_ret = of_describe_expr(is_dwo_name + ".x", 1)
return ll_ret
end function

public function long of_get_x2 ();long ll_ret
ll_ret = of_describe_expr(is_dwo_name + ".x", 1) + of_describe_expr(is_dwo_name + ".width", 1)
return ll_ret
end function

public function long of_get_y1 (long al_row);long ll_ret
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ll_ret = of_describe_expr(is_dwo_name + ".y", al_row)
end if
return ll_ret
end function

public function long of_get_y2 (long al_row);long ll_ret
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ll_ret = of_describe_expr(is_dwo_name + ".y", al_row) + of_describe_expr(is_dwo_name + ".height", al_row)
end if
return ll_ret
end function

public function long of_get_y1 ();long ll_ret
ll_ret = of_describe_expr(is_dwo_name + ".y", 1)
return ll_ret
end function

public function integer of_get_visible (long al_row);integer li_ret
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    li_ret = of_describe_expr(is_dwo_name + ".visible", al_row)
end if
return li_ret
end function

public function long of_get_y2 ();long ll_ret
ll_ret = of_describe_expr(is_dwo_name + ".y", 1) + of_describe_expr(is_dwo_name + ".height", 1)
return ll_ret
end function

public function integer of_init (string as_dwo_name, integer ai_dwo_type);integer li_ret = 1
is_dwo_name = as_dwo_name
ii_dwo_type = ai_dwo_type
choose case ii_dwo_type
    case 1
        is_coltype = of_get_item_coltype()
    case 2
        is_coltype = of_get_item_coltype()
    case 3
        is_coltype = "s"
        is_text = idw_dw.describe(as_dwo_name + ".text")
        is_text = of_unquote(is_text)
end choose
if li_ret = 1 then
    il_dw_row_count = idw_dw.rowcount()
    ii_column_display_type = of_get_column_display_type()
    li_ret = of_setformat()
end if
return li_ret
end function

public function string of_get_item_coltype ();string ls_coltype
long ll_pos
long ll_pos_dec
ls_coltype = trim(lower(idw_dw.describe(is_dwo_name + ".coltype")))
ll_pos = pos(ls_coltype, "(")
if ll_pos > 0 then
    ll_pos_dec = pos(ls_coltype, ",", ll_pos)
    if ll_pos_dec <= 0 then
        ll_pos_dec = pos(ls_coltype, ")", ll_pos)
    end if
    ii_colsize = integer(mid(ls_coltype, ll_pos + 1, ll_pos_dec - ll_pos - 1))
    ls_coltype = trim(left(ls_coltype, ll_pos - 1))
end if
choose case ls_coltype
    case "char"
        ls_coltype = "s"
    case "decimal", "int", "long", "number"
        ls_coltype = "n"
    case "date"
        ls_coltype = "d"
    case "datetime", "timestamp"
        ls_coltype = "dt"
    case "time"
        ls_coltype = "t"
    case else
        ls_coltype = "-"
end choose
return ls_coltype
end function

public function long of_describe_expr (string as_expr, long al_row);string ls_val
long ll_pos
n_dwr_string lnvo_str
ls_val = idw_dw.describe(as_expr)
ll_pos = pos(ls_val, "~t")
if ll_pos > 0 then
    ls_val = mid(ls_val, ll_pos + 1, len(ls_val) - ll_pos - 1)
    ls_val = lnvo_str.of_globalreplace(ls_val, "'", "~'")
    ls_val = idw_dw.describe("evaluate(~"" + ls_val + "~", " + string(al_row) + ")")
    if isnumber(ls_val) then
        return long(ls_val)
    end if
elseif isnumber(ls_val) then
    return long(ls_val)
end if
return -1
end function

public function n_xls_format of_get_format (long al_row);integer li_ret = 1
n_xls_format lnvo_temp_format
if ib_custom_format then
    al_row = al_row + ii_row_in_detail - 1
    if al_row <= il_dw_row_count then
        lnvo_temp_format = invo_writer.of_addformat()
        if isnull(lnvo_temp_format) then
            li_ret = -1
        elseif not isvalid(lnvo_temp_format) then
            li_ret = -1
        end if
        if li_ret = 1 then
            lnvo_temp_format.of_copy(invo_format)
            if ib_bg_color_expr then
                of_eval_bg_color(lnvo_temp_format, al_row)
            end if
            if ib_color_expr then
                of_eval_color(lnvo_temp_format, al_row)
            end if
            if ib_format_expr then
                of_eval_numformat(lnvo_temp_format, al_row)
            end if
            if ib_font_face_expr then
                of_eval_font_face(lnvo_temp_format, al_row)
            end if
            if ib_font_underline_expr then
                of_eval_font_underline(lnvo_temp_format, al_row)
            end if
            if ib_font_italic_expr then
                of_eval_font_italic(lnvo_temp_format, al_row)
            end if
            if ib_font_weight_expr then
                of_eval_font_weight(lnvo_temp_format, al_row)
            end if
            if ib_alignment_expr then
                of_eval_alignment(lnvo_temp_format, al_row)
            end if
            if ib_font_weight_expr then
                of_eval_font_weight(lnvo_temp_format, al_row)
            end if
            if ib_font_height_expr then
                of_eval_font_height(lnvo_temp_format, al_row)
            end if
            if ib_font_height_expr then
                of_eval_font_height(lnvo_temp_format, al_row)
            end if
            return lnvo_temp_format
        end if
    else
        return invo_format
    end if
else
    return invo_format
end if
end function

public function integer of_set_bg_color (n_xls_format a_format, long al_row);long ll_color
integer li_color_index
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ll_color = long(idw_dw.describe("evaluate(~"" + is_bg_color_expr + "~", " + string(al_row) + ")"))
    if ll_color >= 0 then
        li_color_index = invo_colors.of_get_custom_color_index(ll_color)
        if li_color_index > 0 then
            a_format.of_set_bg_color(li_color_index)
        end if
    end if
end if
return 1
end function

public function integer of_check_property (string as_property_name, ref boolean ab_is_expression, ref string as_expression, ref string as_value);integer li_ret
string ls_str
long ll_pos
ls_str = idw_dw.describe(is_dwo_name + "." + as_property_name)
if ls_str <> "!" and ls_str <> "?" and ls_str <> "" then
    ll_pos = pos(lower(ls_str), "~t")
    if ll_pos > 0 then
        as_expression = right(ls_str, len(ls_str) - ll_pos)
        if right(as_expression, 1) = "~"" then
            as_expression = left(as_expression, len(as_expression) - 1)
        end if
        ab_is_expression = trim(as_expression) <> ""
        ls_str = left(ls_str, ll_pos - 1)
        if left(ls_str, 1) = "~"" then
            ls_str = right(ls_str, len(ls_str) - 1)
        end if
    end if
    as_value = ls_str
    li_ret = 1
else
    li_ret = -1
end if
return li_ret
end function

public function string of_descr_numformat ();integer li_ret
string ls_value
li_ret = of_check_property("Format", ib_format_expr, is_format_expr, ls_value)
if li_ret = 1 then
    return ls_value
else
    return ""
end if
end function

public function long of_descr_font_height ();integer li_ret
string ls_value
li_ret = of_check_property("Font.Height", ib_font_height_expr, is_font_height_expr, ls_value)
if li_ret = 1 then
    if isnumber(ls_value) then
        return abs(integer(ls_value))
    else
        return 10
    end if
else
    return 10
end if
end function

public function boolean of_descr_font_italic ();integer li_ret
string ls_value
li_ret = of_check_property("Font.Italic", ib_font_italic_expr, is_font_italic_expr, ls_value)
if li_ret = 1 then
    return lower(ls_value) = "yes" or ls_value = "1"
else
    return false
end if
end function

public function integer of_descr_font_underline ();integer li_ret
string ls_value
li_ret = of_check_property("font.underline", ib_font_underline_expr, is_font_underline_expr, ls_value)
if li_ret = 1 then
    if lower(ls_value) = "yes" or ls_value = "1" then
        return 1
    else
        return 0
    end if
else
    return 0
end if
end function

public function boolean of_descr_font_weight ();integer li_ret
string ls_value
li_ret = of_check_property("font.weight", ib_font_weight_expr, is_font_weight_expr, ls_value)
if li_ret = 1 then
    if isnumber(ls_value) then
        return abs(integer(ls_value)) = 700
    else
        return false


    end if
else
    return false
end if
end function

public function string of_descr_alignment ();integer li_ret
string ls_value = "-1"
li_ret = of_check_property("alignment", ib_alignment_expr, is_alignment_expr, ls_value)
if li_ret <> 1 then
    ls_value = "-1"
end if
choose case ls_value
    case "0"
        return "left"
    case "1"
        return "right"
    case "2"
        return "center"
    case "3"
        return "justified"
    case is_coltype
        return "right"
    case else
        return "left"
end choose
end function

public function integer of_descr_bg_color ();integer li_ret
string ls_str
string ls_value
long ll_color
ls_str = idw_dw.describe(is_dwo_name + ".Background.Mode")
if ls_str <> "1" then
    li_ret = of_check_property("Background.Color", ib_bg_color_expr, is_bg_color_expr, ls_value)
    if li_ret = 1 then
        if isnumber(ls_value) then
            ll_color = invo_colors.of_get_color(long(ls_value))
            return invo_colors.of_get_custom_color_index(ll_color)
        else
            return -1
        end if
    else
        return -1
    end if
else
    return -1
end if
end function

public function integer of_eval_bg_color (n_xls_format anvo_format, long al_row);integer li_color_index
string ls_value
long ll_color
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_bg_color_expr + "~", " + string(al_row) + ")")
    if isnumber(ls_value) then
        ll_color = invo_colors.of_get_color(long(ls_value))
        li_color_index = invo_colors.of_get_custom_color_index(ll_color)
        if li_color_index > 0 then
            anvo_format.of_set_bg_color(li_color_index)
            return 1
        end if
    end if
end if
return -1
end function

public function integer of_eval_font_face (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = trim(idw_dw.describe("evaluate(~"" + is_font_face_expr + "~", " + string(al_row) + ")"))
    if ls_value <> "" then
        anvo_format.of_set_font(ls_value)
        return 1
    end if
end if
return -1
end function

public function integer of_eval_numformat (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = trim(idw_dw.describe("evaluate(~"" + is_format_expr + "~", " + string(al_row) + ")"))
    if ls_value = "" then
        ls_value = "[General]"
    end if
    ls_value = of_change_format(ls_value, is_coltype)
    anvo_format.of_set_num_format(ls_value)
    return 1
end if
return -1
end function

public function integer of_eval_font_height (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_font_height_expr + "~", " + string(al_row) + ")")
    if isnumber(ls_value) then
        anvo_format.of_set_size(abs(integer(ls_value)))
        return 1
    end if
end if
return -1
end function

public function integer of_eval_font_italic (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_font_italic_expr + "~", " + string(al_row) + ")")
    anvo_format.of_set_italic(lower(ls_value) = "yes" or ls_value = "1")
    return 1
end if
return -1
end function

public function integer of_eval_font_underline (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_font_underline_expr + "~", " + string(al_row) + ")")
    if lower(ls_value) = "yes" or ls_value = "1" then
        anvo_format.of_set_underline(1)
    else

        anvo_format.of_set_underline(0)
    end if
    return 1
end if
return -1
end function

public function integer of_eval_font_weight (n_xls_format anvo_format, long al_row);string ls_value
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_font_weight_expr + "~", " + string(al_row) + ")")
    if isnumber(ls_value) then
        anvo_format.of_set_bold(abs(integer(ls_value)) = 700)
    else
        anvo_format.of_set_bold(false)
    end if
    return 1
end if
return -1
end function

private function integer of_get_column_display_type ();string ls_str
choose case ii_dwo_type
    case 1
        ls_str = idw_dw.describe(is_dwo_name + ".CheckBox.On")
        if ls_str <> "!" and ls_str <> "?" and ls_str <> "" then
            return 2
        end if
        ls_str = idw_dw.describe(is_dwo_name + ".DDDW.Name")
        if ls_str <> "!" and ls_str <> "?" and ls_str <> "" then
            return 3
        end if
        ls_str = idw_dw.describe(is_dwo_name + ".DDLB.Required")
        if ls_str <> "!" and ls_str <> "?" and ls_str <> "" then
            return 4
        end if
        ls_str = idw_dw.describe(is_dwo_name + ".RadioButtons.Columns")
        if ls_str <> "0" and ls_str <> "!" and ls_str <> "?" and ls_str <> "" then
            return 1
        end if
        ls_str = idw_dw.describe(is_dwo_name + ".Edit.CodeTable")
        if lower(ls_str) = "yes" then
            return 5
        end if

        return 1
    case 2, 3
        return 1
end choose
end function

private function string of_unquote (string as_str);LONG ll_pos
IF LEFT(as_str, 1) = "~"" AND RIGHT(as_str, 1) = "~"" THEN
	IF POS(as_str, "~r") > 0 OR POS(as_str, "~n") > 0 THEN
		as_str = MID(as_str, 2, LEN(as_str) - 2)
	END IF
END IF
ll_pos = POS(as_str, '~~"')
DO WHILE ll_pos > 0
	as_str = REPLACE(as_str, ll_pos, 2, "~"")
	ll_pos = POS(as_str, '~~"')
LOOP
RETURN as_str
end function

public function string of_descr_font_face ();integer li_ret
string ls_value
li_ret = of_check_property("Font.Face", ib_font_face_expr, is_font_face_expr, ls_value)
if li_ret = 1 then
    return ls_value
else
    return "Arial"
end if
end function

public function integer of_descr_color ();Integer li_ret
String ls_value
Long ll_color
li_ret = of_check_property("Color", ib_color_expr, is_color_expr, ls_value)
If li_ret = 1 Then
	If IsNumber(ls_value) Then
		ll_color = invo_colors.of_get_color(Long(ls_value))
		Return invo_colors.of_get_custom_color_index(ll_color)
	Else
		Return -1
	End If
Else
	Return -1
End If

end function

public function integer of_eval_alignment (n_xls_format anvo_format, long al_row);String ls_value
String ls_align
al_row = al_row + ii_row_in_detail - 1
If al_row <= il_dw_row_count Then
	ls_value = Trim(idw_dw.Describe("evaluate(~"" + is_alignment_expr + "~", " + String(al_row) + ")"))
	Choose Case ls_value
		Case "0"
			ls_align = "left"
		Case "1"
			ls_align = "right"
		Case "2"
			ls_align = "center"
		Case "3"
			ls_align = "justified"
		Case is_coltype
			ls_align = "right"
		Case Else
			ls_align = "left"
	End Choose
	anvo_format.of_set_align(ls_align)
	Return 1
End If
Return -1

end function

public function string of_change_format (ref string as_format, string as_type);Long ll_pos
n_dwr_string lnvo_str
String ls_arr[]
String ls_emp[]
Long ll_cnt
Long ll_i
ll_pos = Pos(as_format, "@")
If ll_pos > 0 Then
	as_format = "[general]"
End If
ll_pos = Pos(Lower(as_format), "[general]")
Do While ll_pos > 0 
	If is_coltype = "d" Then
		as_format = Replace(as_format, ll_pos, 9, "yyyy-mm-dd")
	ElseIf is_coltype = "dt" Then
		as_format = Replace(as_format, ll_pos, 9, "yyyy-mm-dd hh:mm")
	ElseIf is_coltype = "t" Then
		as_format = Replace(as_format, ll_pos, 9, "hh:mm")
	Else
		as_format = Replace(as_format, ll_pos, 9, "@")
	End If
	ll_pos = Pos(Lower(as_format), "[general]")
Loop
ll_pos = Pos(Lower(as_format), "[currency]")
Do While ll_pos > 0 
	as_format = Replace(as_format, ll_pos, 10, "$#,##0.00")
	ll_pos = Pos(Lower(as_format), "[currency]")
Loop
ll_pos = Pos(Lower(as_format), "[shortdate]")
Do While ll_pos > 0 
	as_format = Replace(as_format, ll_pos, 11, "yyyy-mm-dd")
	ll_pos = Pos(Lower(as_format), "[shortdate]")
Loop
ll_pos = Pos(Lower(as_format), "[date]")
Do While ll_pos > 0
	as_format = Replace(as_format, ll_pos, 6, "yyyy-mm-dd")
	ll_pos = Pos(Lower(as_format), "[date]")
Loop
ll_pos = Pos(Lower(as_format), "[time]")
Do While ll_pos > 0
	as_format = Replace(as_format, ll_pos, 6, "hh:mm")
	ll_pos = Pos(Lower(as_format), "[time]")
Loop
If Pos(as_format, ";") > 0 Then
	ll_cnt = lnvo_str.of_parsetoarray(as_format, ";", ls_arr)
	Choose Case as_type
		Case "n"
			If ll_cnt > 3 Then
				ll_cnt = 3
			End If
		//case string(ll_cnt)
			//ll_cnt = 1
	End Choose
	For ll_i = 1 To ll_cnt
		ls_emp[ll_i] = lnvo_str.of_globalreplace(ls_arr[ll_i], "'", "~"")
		ls_emp[ll_i] = lnvo_str.of_globalreplace(ls_emp[ll_i], "@", "General")
	Next
	lnvo_str.of_arraytostring(ls_emp, ";", as_format)
End If
If ii_colsize > 255 Then
	as_format = ""
End If
Return as_format





end function

public function integer of_eval_color (n_xls_format anvo_format, long al_row);integer li_color_index
string ls_value
long ll_color
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ls_value = idw_dw.describe("evaluate(~"" + is_color_expr + "~", " + string(al_row) + ")")
    if isnumber(ls_value) then
        ll_color = invo_colors.of_get_color(long(ls_value))
        li_color_index = invo_colors.of_get_custom_color_index(ll_color)
        if li_color_index > 0 then
            anvo_format.of_set_color(li_color_index)
            return 1
        end if
    end if
end if
return -1
end function

public function integer of_set_color (n_xls_format a_format, long al_row);long ll_color
integer li_color_index
al_row = al_row + ii_row_in_detail - 1
if al_row <= il_dw_row_count then
    ll_color = long(idw_dw.describe("evaluate(~"" + is_color_expr + "~", " + string(al_row) + ")"))
    if ll_color >= 0 then
        li_color_index = invo_colors.of_get_custom_color_index(ll_color)
        if li_color_index > 0 then
            a_format.of_set_color(li_color_index)
        end if
    end if
end if
return 1
end function

on n_dwr_field.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_field.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

