$PBExportHeader$n_cst_dw_unload_in_rtf.sru
$PBExportComments$выгрузка в rtf
forward
global type n_cst_dw_unload_in_rtf from n_cst_dw_unload
end type
end forward

global type n_cst_dw_unload_in_rtf from n_cst_dw_unload
end type
global n_cst_dw_unload_in_rtf n_cst_dw_unload_in_rtf

type variables
integer ii_id_file
boolean ib_table_border // наличие границы
end variables

forward prototypes
public function boolean of_exec (datawindow adw, string apath)
end prototypes

public function boolean of_exec (datawindow adw, string apath);
//-------------------------------------------------------------------------------------
// старт выгрузки
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------
// открытие файла
apath = of_create_corect_file_name ( apath )

ii_id_file = FileOpen(aPath , LineMode!, Write!,LockWrite!, Replace!)
if ii_id_file = -1 then return false

//-------------------------------------------------------------------------------------
// выгрузка
this.of_unload(aDw,aPath)

//-------------------------------------------------------------------------------------
// закрытие файла
FileClose(ii_id_file)

//-------------------------------------------------------------------------------------
return true

//-------------------------------------------------------------------------------------

end function

on n_cst_dw_unload_in_rtf.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_unload_in_rtf.destroy
TriggerEvent( this, "destructor" )
end on

event ue_create_header_document;call super::ue_create_header_document;
//-----------------------------------------------------------------------------------
// формирование заголовка rtf документа
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
string ls_year, ls_mon, ls_day, ls_hour, ls_min
string ls_header
integer li_count_fonts, li_curr_font
//-----------------------------------------------------------------------------------
ls_year = string(Today(),'YYYY')
ls_mon = string(Today(),'MM')
ls_day = string(Today(),'DD')
ls_hour = string(Now(),'hh')
ls_min = mid(string(Now(),'hh:mm'),4,2)

ls_header = '{\rtf\ansi\deff0' // заголовок
ls_header += '{\info{\author ruha}{\creatim\yr' + ls_year + '\mo' + ls_mon + '\dy' + ls_day + '\hr' + ls_hour + '\min' + ls_min + '}}'



//ls_header +='\paperw16838' // ширина листа а4
//ls_header +='\paperh11906' // высота листа а4
//
////-
//if integer(dw.object.DataWindow.Print.Orientation) = 1 then
//	is_paper_orientation= 'album' //альбомная ориентация листа
//else
//	is_paper_orientation= 'book' // книжная ......
//end if
////-

if is_paper_orientation = 'album' then
	ls_header +='\paperw16838' // ширина листа а4
	ls_header +='\paperh11906' // высота листа а4
	ls_header += '\landscape' //альбомная ориентация листа
end if
if is_paper_orientation = 'book' then
	ls_header +='\paperh16838' // ширина листа а4
	ls_header +='\paperw11906' // высота листа а4
	ls_header += '\landscape0' // книжная ......
end if

// надо бы еще описать размеры полей по человечески (здесь все поля по 1 см)
ls_header += '\margl567\margr567\margt567\margb567'

//-----------------------------------------------------------------------------------
// формирование таблици шрифтов
ls_header += '{\fonttbl{\f0\fnil default;}' // шрифт по умолчанию

li_count_fonts = UpperBound( istr_fonts_table[] )
// перебор всех шрифтов в таблице шрифтов
for li_curr_font = 1 to li_count_fonts 
	ls_header += '{'
	ls_header += '\f' + string (li_curr_font) + '\froman\ ' + istr_fonts_table[li_curr_font].s_name
	ls_header += ';}'
next // {end  перебор всех шрифтов в таблице шрифтов}

ls_header += '}'
//ls_header += '{\fonttbl\f0\fnil default\fl\froman roman h;}'

//istr_dw_cell[].i_font_nom

//-----------------------------------------------------------------------------------
of_write_line(ii_id_file, ls_header)

//-----------------------------------------------------------------------------------
end event

event ue_create_footer_document;call super::ue_create_footer_document;
//---------------------------------------------------------------------------------------
// формирование закрывающих тегов rtf документа
//---------------------------------------------------------------------------------------

this.of_write_line(ii_id_file, '}')
//-------------------------------------------------------------------------------------

end event

event ue_unload_band;call super::ue_unload_band;
constant real lr_koof_corect = 14.0 //константа коректировки размера таблици

integer li_k, li_i, li_j
integer li_nom_element
integer li_abs_nom_element


string s_row // описание строки
string s_cell // описание ячейки
string s_intbl // описание данных в строке

//-------------------------------------------------------------------------------------
// формирование тегов

for li_i = 1 to ii_count_rows
	s_intbl = '\intbl{\f1\cf1 '
	
	//описание строчки
	s_row = '\trrh280'
	s_row += '\trleft0'
	of_write_line(ii_id_file, s_row)
		
		for li_j = 1 to ii_count_columns
			li_abs_nom_element = abs(ii_rlt[li_i,li_j])
			li_nom_element = ii_rlt[li_i,li_j]
			s_cell = ''
			if li_abs_nom_element > 0  then 
				
				if (istr_band_cells[li_abs_nom_element].ul_obj_row_count >1) then
					if li_nom_element > 0 then s_cell += '\clvmgf' 
					if li_nom_element < 0 then s_cell += '\clvmrg' 
				end if
				
				if ((li_nom_element > 0) or (istr_band_cells[li_abs_nom_element].ul_obj_column_count = 1)) then 
					s_cell += '\clbrdrt'
					if istr_band_cells[li_abs_nom_element].b_border then
						s_cell +='\brdrs\brdrw30'
					end if
					s_cell += '\clbrdrl'
					if istr_band_cells[li_abs_nom_element].b_border then
						s_cell +='\brdrs\brdrw30'
					end if
					s_cell +=  '\clbrdrb'
					if istr_band_cells[li_abs_nom_element].b_border then
						s_cell +='\brdrs\brdrw30'
					end if
					s_cell += '\clbrdrr'
					if istr_band_cells[li_abs_nom_element].b_border then
						s_cell +='\brdrs\brdrw30'
					end if
					s_cell +='\cltxlrtb\cellx' + string((istr_band_cells[li_abs_nom_element].ul_obj_width * lr_koof_corect + istr_band_cells[li_abs_nom_element].ul_obj_locate_x * lr_koof_corect) )
				end if
					
				if li_nom_element > 0 then	
					if istr_band_cells[li_nom_element].b_font_bold then s_intbl += '\b'
					if istr_band_cells[li_nom_element].s_value_allign = 'center' then s_intbl += '\qc'
					if istr_band_cells[li_nom_element].s_value_allign = 'left' then s_intbl += '\ql'
					if istr_band_cells[li_nom_element].s_value_allign = 'right' then s_intbl += '\qr'
					s_intbl +='\fs' + string(abs(long(istr_band_cells[li_nom_element].s_font_size) * 2))
					s_intbl +=' '
					s_intbl +=istr_band_cells[li_nom_element].s_display_value 
					if istr_band_cells[li_nom_element].b_font_bold then s_intbl += '\b0'
					s_intbl +='\cell'
					
				end if
				if (li_nom_element < 0) and (istr_band_cells[li_abs_nom_element].ul_obj_column_count = 1) then
					s_intbl +='\ \cell'
				end if
			end if	

			if ii_rlt[li_i,li_j] = 0  then 
				s_cell  = '\clbrdrt\clbrdrl\clbrdrb\clbrdrr'
				s_cell += '\cltxlrtb\cellx' + string(istr_columns[li_j].ul_location_end * lr_koof_corect)
				s_intbl +='\ \cell'
			end if
			
			if ii_rlt[li_i,li_j] < 0  then 
				
			end if
		
			if s_cell <> '' then of_write_line(ii_id_file, s_cell)
		next
		
		s_intbl += '\row}\trowd'
		of_write_line(ii_id_file, s_intbl)
next
//-------------------------------------------------------------------------------------

end event

