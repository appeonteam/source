$PBExportHeader$n_xls_format_v5.sru
forward
global type n_xls_format_v5 from n_xls_format
end type
end forward

global type n_xls_format_v5 from n_xls_format
end type
global n_xls_format_v5 n_xls_format_v5

type variables
Public UInt ii_font_index
Public Integer ii_num_format
Public String is_num_format = ""
Public String is_font = "Arial"
Public Integer ii_size = 10
Public UInt ii_bold = 400
Public Integer ii_italic
Public UInt ii_color = 32767
Public Integer ii_underline
Public Integer ii_font_strikeout
Public Integer ii_font_outline
Public Integer ii_font_shadow
Public Integer ii_font_script
Public Integer ii_font_family
Public Integer ii_font_charset
Public Integer ii_hidden
Public Integer ii_locked = 1
Public Integer ii_text_h_align
Public Integer ii_text_wrap
Public Integer ii_text_v_align = 2
Public Integer ii_text_justlast
Public Integer ii_rotation
Public Integer ii_fg_color = 64
Public Integer ii_bg_color = 65
Public Integer ii_pattern
Public Integer ii_bottom
Public Integer ii_top
Public Integer ii_left
Public Integer ii_right
Public Integer ii_bottom_color = 64
Public Integer ii_top_color = 64
Public Integer ii_left_color = 64
Public Integer ii_right_color = 64
Public Integer ii_merge_range

end variables

forward prototypes
public function integer of_set_font (string as_fontname)
public function integer of_set_size (integer ai_size)
public function integer of_set_color (string as_color)
public function integer of_set_bold (boolean ab_bold)
public function integer of_set_italic (boolean ab_italic)
public function integer of_set_num_format (string as_num_format)
public function integer of_set_align (string as_align)
public function integer of_set_text_wrap (boolean ab_text_wrap)
public function integer of_set_bg_color (string as_color)
public function integer of_set_border (integer ai_border_style)
public function integer of_set_border_color (long al_color_index)
public function integer of_set_border_color (string as_color)
public function integer of_set_bottom (integer ai_border_style)
public function integer of_set_right (integer ai_border_style)
public function integer of_set_left (integer ai_border_style)
public function integer of_set_top (integer ai_border_style)
public function integer of_set_bottom_color (string as_color)
public function integer of_set_left_color (string as_color)
public function integer of_set_right_color (string as_color)
public function integer of_set_top_color (string as_color)
public function blob of_get_font ()
public function string of_get_font_key ()
public function integer of_set_merge_range ()
public function uint of_get_xf_index ()
public function integer of_set_text_v_align (unsignedinteger ai_align)
public function integer of_set_text_h_align (unsignedinteger ai_align)
public function integer of_set_underline (integer ai_style)
public function integer of_set_rotation (integer ai_rotation)
public function integer of_set_script (integer ai_script)
public function integer of_set_outline (boolean ab_option)
public function integer of_set_hidden (boolean ab_option)
public function integer of_set_locked (boolean ab_option)
public function integer of_set_strikeout (boolean ab_option)
public function integer of_set_text_justlast ()
public function integer of_set_pattern (integer ai_pattern)
public function integer of_set_fg_color (string as_color)
public function integer of_set_merge ()
public function integer of_copy (n_xls_format anvo_format)
public function integer of_set_num_format (integer ai_builtin_format)
public function string of_get_format_key ()
protected function integer of_get_color (string as_color)
public function integer of_set_color (long al_colorindex)
public function integer of_set_bg_color (long al_colorindex)
public function integer of_set_bottom_color (long al_color_index)
public function integer of_set_left_color (long al_color_index)
public function integer of_set_right_color (long al_color_index)
public function integer of_set_top_color (long al_color_index)
public function integer of_set_fg_color (long al_colorindex)
public function blob of_get_xf (string as_style)
end prototypes

public function integer of_set_font (string as_fontname);integer li_ret = 1
is_font= as_fontname
return li_ret
end function

public function integer of_set_size (integer ai_size);integer li_ret = 1
ii_size = ai_size
return li_ret 
end function

public function integer of_set_color (string as_color);integer li_ret = 1
of_set_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_bold (boolean ab_bold);integer li_ret =1 
if ab_bold then
	ii_bold = 700
else
	ii_bold = 400
end if
return li_ret
end function

public function integer of_set_italic (boolean ab_italic);integer li_ret =1 
if ab_italic then
	ii_italic = 1
else
	ii_italic = 0
end if
return li_ret
end function

public function integer of_set_num_format (string as_num_format);integer li_ret =1
is_num_format = as_num_format
ii_num_format = 0 
return li_ret
end function

public function integer of_set_align (string as_align);integer li_ret = 1
choose case trim(lower(as_align))
    case "left"
        of_set_text_h_align(1)
    case "centre", "center"
        of_set_text_h_align(2)
    case "right"
        of_set_text_h_align(3)
    case "fill"
        of_set_text_h_align(4)
    case "justify"
        of_set_text_h_align(5)
    case "merge"
        of_set_text_h_align(6)
    case "equal_space"
        of_set_text_h_align(7)
    case "top"
        of_set_text_v_align(0)
    case "vcentre", "vcenter"
        of_set_text_v_align(1)
    case "bottom"
        of_set_text_v_align(2)
    case "vjustify"
        of_set_text_v_align(3)
    case "vequal_space"
        of_set_text_v_align(4)
    case else
        return -1
end choose
return li_ret
end function

public function integer of_set_text_wrap (boolean ab_text_wrap);integer li_ret = 1
if ab_text_wrap then
    ii_text_wrap = 1
else
    ii_text_wrap = 0
end if
return li_ret
end function

public function integer of_set_bg_color (string as_color);integer li_ret = 1
of_set_bg_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_border (integer ai_border_style);of_set_left(ai_border_style)
of_set_right(ai_border_style)
of_set_top(ai_border_style)
of_set_bottom(ai_border_style)
return 1
end function

public function integer of_set_border_color (long al_color_index);of_set_left_color(al_color_index)
of_set_right_color(al_color_index)
of_set_top_color(al_color_index)
of_set_bottom_color(al_color_index)
return 1
end function

public function integer of_set_border_color (string as_color);of_set_left_color(as_color)
of_set_right_color(as_color)
of_set_top_color(as_color)
of_set_bottom_color(as_color)
return 1
end function

public function integer of_set_bottom (integer ai_border_style);ii_bottom = ai_border_style
return 1
end function

public function integer of_set_right (integer ai_border_style);ii_right = ai_border_style
return 1 
end function

public function integer of_set_left (integer ai_border_style);ii_left = ai_border_style
return 1
end function

public function integer of_set_top (integer ai_border_style);ii_top = ai_border_style
return 1
end function

public function integer of_set_bottom_color (string as_color);integer li_ret = 1
of_set_bottom_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_left_color (string as_color);integer li_ret = 1
of_set_left_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_right_color (string as_color);integer li_ret = 1
of_set_right_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_top_color (string as_color);integer li_ret = 1
of_set_top_color(of_get_color(as_color))
return li_ret
end function

public function blob of_get_font ();uint li_record
uint li_length
uint li_dyheight
uint li_grbit
uint li_icv
uint li_bls
uint li_sss
uint li_uls
uint li_bfamily
uint li_bcharset
uint li_reserved
uint li_cch
string ls_rgch
blob lb_data
li_dyheight = ii_size * 20
li_icv = ii_color
li_bls = ii_bold
li_sss = ii_font_script
li_uls = ii_underline
li_bfamily = ii_font_family
li_bcharset = ii_font_charset
ls_rgch = is_font
li_cch = len(ls_rgch)
li_record = 49
li_length = 15 + li_cch
li_reserved = 0
li_grbit = 0
li_grbit = li_grbit + ii_italic * 2
li_grbit = li_grbit + ii_font_strikeout * 8
li_grbit = li_grbit + ii_font_outline * 16
li_grbit = li_grbit + ii_font_shadow * 32
lb_data = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length) + invo_sub.of_pack("v", li_dyheight) + invo_sub.of_pack("v", li_grbit) + invo_sub.of_pack("v", li_icv) + invo_sub.of_pack("v", li_bls) + invo_sub.of_pack("v", li_sss) + invo_sub.of_pack("C", li_uls) + invo_sub.of_pack("C", li_bfamily) + invo_sub.of_pack("C", li_bcharset) + invo_sub.of_pack("C", li_reserved) + invo_sub.of_pack("C", li_cch) + blob(is_font)
return lb_data
end function

public function string of_get_font_key ();STRING ls_ret
UINT li_pos
ls_ret = STRING(LEN(is_font), "000") + is_font + TRIM(STRING(ii_size, "0000")) + TRIM(STRING(ii_font_script, "00")) + TRIM(STRING(ii_underline, "00")) + TRIM(STRING(ii_font_strikeout, "00")) + TRIM(STRING(ii_bold, "000")) + TRIM(STRING(ii_font_outline, "00")) + TRIM(STRING(ii_font_family, "0000")) + TRIM(STRING(ii_font_charset, "000000")) + TRIM(STRING(ii_font_shadow, "00")) + TRIM(STRING(ii_color, "000")) + TRIM(STRING(ii_italic, "0"))
li_pos = POS(ls_ret, " ")
DO WHILE li_pos > 0 
	ls_ret = REPLACE(ls_ret, li_pos, 1, "_")
	li_pos = POS(ls_ret, " ")
LOOP
RETURN ls_ret

end function

public function integer of_set_merge_range ();ii_merge_range=1
return 1 
end function

public function uint of_get_xf_index ();return ii_xf_index
end function

public function integer of_set_text_v_align (unsignedinteger ai_align);ii_text_v_align=ai_align
return 1
end function

public function integer of_set_text_h_align (unsignedinteger ai_align);ii_text_h_align =ai_align
return 1
end function

public function integer of_set_underline (integer ai_style);ii_underline = ai_style
return 1
end function

public function integer of_set_rotation (integer ai_rotation);integer li_ret = 1
if ai_rotation < 0 or ai_rotation > 3 then
    li_ret = -1
else
    ii_rotation = ai_rotation
end if
return li_ret
end function

public function integer of_set_script (integer ai_script);integer li_ret = 1
if ai_script < 0 or ai_script > 2 then
    li_ret = -1
else
    ii_font_script = ai_script
end if
return li_ret
end function

public function integer of_set_outline (boolean ab_option);if ab_option then
    ii_font_outline = 1
else
    ii_font_outline = 0
end if
return 1
end function

public function integer of_set_hidden (boolean ab_option);if ab_option then
    ii_hidden = 1
else
    ii_hidden = 0
end if
return 1
end function

public function integer of_set_locked (boolean ab_option);if ab_option then
    ii_locked = 1
else
    ii_locked = 0
end if
return 1
end function

public function integer of_set_strikeout (boolean ab_option);if ab_option then
    ii_font_strikeout = 1
else
    ii_font_strikeout = 0
end if
return 1
end function

public function integer of_set_text_justlast ();ii_text_justlast = 1
return 1
end function

public function integer of_set_pattern (integer ai_pattern);integer li_ret = 1
if ai_pattern < 0 or ai_pattern > 18 then
    li_ret = -1
else
    ii_pattern = ai_pattern
end if
return li_ret
end function

public function integer of_set_fg_color (string as_color);return of_set_fg_color(of_get_color(as_color))
end function

public function integer of_set_merge ();return of_set_text_h_align(6)
end function

public function integer of_copy (n_xls_format anvo_format);n_xls_format_v5 lnvo_format
lnvo_format = anvo_format
ii_font_index = lnvo_format.ii_font_index
is_num_format = lnvo_format.is_num_format
ii_num_format = lnvo_format.ii_num_format
is_font = lnvo_format.is_font
ii_size = lnvo_format.ii_size
ii_bold = lnvo_format.ii_bold
ii_italic = lnvo_format.ii_italic
ii_color = lnvo_format.ii_color
ii_underline = lnvo_format.ii_underline
ii_font_strikeout = lnvo_format.ii_font_strikeout
ii_font_outline = lnvo_format.ii_font_outline
ii_font_shadow = lnvo_format.ii_font_shadow
ii_font_script = lnvo_format.ii_font_script
ii_font_family = lnvo_format.ii_font_family
ii_font_charset = lnvo_format.ii_font_charset
ii_hidden = lnvo_format.ii_hidden
ii_locked = lnvo_format.ii_locked
ii_text_h_align = lnvo_format.ii_text_h_align
ii_text_wrap = lnvo_format.ii_text_wrap
ii_text_v_align = lnvo_format.ii_text_v_align
ii_text_justlast = lnvo_format.ii_text_justlast
ii_rotation = lnvo_format.ii_rotation
ii_fg_color = lnvo_format.ii_fg_color
ii_bg_color = lnvo_format.ii_bg_color
ii_pattern = lnvo_format.ii_pattern
ii_bottom = lnvo_format.ii_bottom
ii_top = lnvo_format.ii_top
ii_left = lnvo_format.ii_left
ii_right = lnvo_format.ii_right
ii_bottom_color = lnvo_format.ii_bottom_color
ii_top_color = lnvo_format.ii_top_color
ii_left_color = lnvo_format.ii_left_color
ii_right_color = lnvo_format.ii_right_color
ii_merge_range = lnvo_format.ii_merge_range
return 1
end function

public function integer of_set_num_format (integer ai_builtin_format);ii_num_format = ai_builtin_format
is_num_format =""
return 1
end function

public function string of_get_format_key ();string ls_ret
uint li_pos
ls_ret = string(ii_num_format, "00000") + string(len(is_num_format), "000") + is_num_format + string(ii_hidden, "0") + string(ii_locked, "0") + string(ii_text_h_align, "00") + string(ii_text_wrap, "0") + string(ii_text_v_align, "00") + string(ii_text_justlast, "00") + string(ii_rotation, "000") + string(ii_fg_color, "000") + string(ii_bg_color, "000") + string(ii_pattern, "000") + string(ii_bottom, "000") + string(ii_top, "000") + string(ii_left, "000") + string(ii_right, "000") + string(ii_bottom_color, "000") + string(ii_top_color, "000") + string(ii_left_color, "000") + string(ii_right_color, "000") + string(ii_merge_range, "0") + of_get_font_key()
li_pos = pos(ls_ret, " ")
do while li_pos > 0 
    ls_ret = replace(ls_ret, li_pos, 1, "_")
    li_pos = pos(ls_ret, " ")
loop
return ls_ret
end function

protected function integer of_get_color (string as_color);CHOOSE CASE TRIM(LOWER(as_color))
	CASE "aqua"
		RETURN 15
	CASE "cyan"
		RETURN 15
	CASE "black"
		RETURN 8
	CASE "blue"
		RETURN 12
	CASE "brown"
		RETURN 16
	CASE "magenta"
		RETURN 14
	CASE "fuchsia"
		RETURN 14
	CASE "gray"
		RETURN 23
	CASE "grey"
		RETURN 23
	CASE "green"
		RETURN 17
	CASE "lime"
		RETURN 11
	CASE "navy"
		RETURN 18
	CASE "orange"
		RETURN 53
	CASE "purple"
		RETURN 20
	CASE "red"
		RETURN 10
	CASE "silver"
		RETURN 22
	CASE "white"
		RETURN 9
	CASE "yellow"
		RETURN 13
END CHOOSE
RETURN -1
end function

public function integer of_set_color (long al_colorindex);integer li_ret = 1
if al_colorindex < 8 then
    al_colorindex += 8
end if
if al_colorindex > 63 then
    al_colorindex = -1
end if
ii_color = al_colorindex
return li_ret
end function

public function integer of_set_bg_color (long al_colorindex);integer li_ret = 1
if al_colorindex < 8 then
    al_colorindex += 8
end if
if al_colorindex > 63 then
    al_colorindex = -1
end if
ii_bg_color = al_colorindex
return li_ret
end function

public function integer of_set_bottom_color (long al_color_index);integer li_ret = 1
if al_color_index < 8 then
    al_color_index += 8
end if
if al_color_index > 63 then
    al_color_index = -1
end if
ii_bottom_color = al_color_index
return li_ret
end function

public function integer of_set_left_color (long al_color_index);integer li_ret = 1
if al_color_index < 8 then
    al_color_index += 8
end if
if al_color_index > 63 then
    al_color_index = -1
end if
ii_left_color = al_color_index
return li_ret
end function

public function integer of_set_right_color (long al_color_index);integer li_ret = 1
if al_color_index < 8 then
    al_color_index += 8
end if
if al_color_index > 63 then
    al_color_index = -1
end if
ii_right_color = al_color_index
return li_ret
end function

public function integer of_set_top_color (long al_color_index);integer li_ret = 1
if al_color_index < 8 then
    al_color_index += 8
end if
if al_color_index > 63 then
    al_color_index = -1
end if
ii_top_color = al_color_index
return li_ret
end function

public function integer of_set_fg_color (long al_colorindex);integer li_ret = 1
if al_colorindex < 8 then
    al_colorindex += 8
end if
if al_colorindex > 63 then
    al_colorindex = -1
end if
ii_fg_color = al_colorindex
return li_ret
end function

public function blob of_get_xf (string as_style);uint li_record
uint li_length
uint li_ifnt
uint li_ifmt
uint li_style
uint li_align
uint li_icv
uint li_fill
uint li_border1
uint li_border2
uint li_atr_num
uint li_atr_fnt
uint li_atr_alc
uint li_atr_bdr
uint li_atr_pat
uint li_atr_prot
blob lb_data
if as_style = "style" then
    li_style = 65525
else
    li_style = ii_locked + ii_hidden * 2
end if
if ii_num_format <> 0 then
    li_atr_num = 1
end if
if ii_font_index <> 0 then
    li_atr_fnt = 1
end if
if ii_text_h_align <> 0 or ii_text_v_align <> 2 or ii_text_wrap <> 0 then
    li_atr_alc = 1
end if
if ii_bottom <> 0 or ii_top <> 0 or ii_left <> 0 or ii_right <> 0 then
    li_atr_bdr = 1
end if
if ii_fg_color <> 64 or ii_bg_color <> 65 or ii_pattern <> 0 then
    li_atr_pat = 1
end if
if ii_hidden <> 0 or ii_locked <> 1 then
    li_atr_prot = 1
end if
if ii_fg_color = -1 then
    ii_fg_color = 64
end if
if ii_bg_color = -1 then
    ii_bg_color = 65
end if
if ii_bottom_color = -1 then
    ii_bottom_color = 64
end if
if ii_top_color = -1 then
    ii_top_color = 64
end if
if ii_left_color = -1 then
    ii_left_color = 64
end if
if ii_right_color = -1 then
    ii_right_color = 64
end if
if ii_bottom = 0 then
    ii_bottom_color = 0
end if
if ii_top = 0 then
    ii_top_color = 0
end if
if ii_left = 0 then
    ii_left_color = 0
end if
if ii_right = 0 then
    ii_right_color = 0
end if
if ii_pattern <= 1 and ii_bg_color <> 65 and ii_fg_color = 64 then
    ii_fg_color = ii_bg_color
    ii_bg_color = 64
    ii_pattern = 1
end if
if ii_pattern <= 1 and ii_bg_color = 65 and ii_fg_color <> 64 then
    ii_bg_color = 64
    ii_pattern = 1
end if
li_record = 224
li_length = 16
li_ifnt = ii_font_index
li_ifmt = ii_num_format
li_align = ii_text_h_align + ii_text_wrap * 8 + ii_text_v_align * 16 + ii_text_justlast * 128 + ii_rotation * 256 + li_atr_num * 1024 + li_atr_fnt * 2048 + li_atr_alc * 4096 + li_atr_bdr * 8192 + li_atr_pat * 16384 + li_atr_prot * 32768
li_icv = ii_fg_color + ii_bg_color * 128
li_fill = ii_pattern + ii_bottom * 64 + ii_bottom_color * 512
li_border1 = ii_top + ii_left * 8 + ii_right * 64 + ii_top_color * 512
li_border2 = ii_left_color + ii_right_color * 128
lb_data = invo_sub.of_pack("v", li_record) + invo_sub.of_pack("v", li_length) + invo_sub.of_pack("v", li_ifnt) + invo_sub.of_pack("v", li_ifmt) + invo_sub.of_pack("v", li_style) + invo_sub.of_pack("v", li_align) + invo_sub.of_pack("v", li_icv) + invo_sub.of_pack("v", li_fill) + invo_sub.of_pack("v", li_border1) + invo_sub.of_pack("v", li_border2)
return lb_data
end function

on n_xls_format_v5.create
call super::create
end on

on n_xls_format_v5.destroy
call super::destroy
end on

