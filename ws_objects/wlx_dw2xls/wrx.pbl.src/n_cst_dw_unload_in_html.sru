$PBExportHeader$n_cst_dw_unload_in_html.sru
$PBExportComments$выгрузка в html
forward
global type n_cst_dw_unload_in_html from n_cst_dw_unload
end type
end forward

global type n_cst_dw_unload_in_html from n_cst_dw_unload
end type
global n_cst_dw_unload_in_html n_cst_dw_unload_in_html

type variables
integer ii_id_file
boolean ib_table_border // наличие границы
end variables

forward prototypes
public function boolean of_exec (datawindow adw, string apath)
private function string of_get_font_size (string as_size)
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
// закрытие файла
this.of_unload(aDw,aPath)

//-------------------------------------------------------------------------------------
// закрытие файла
FileClose(ii_id_file)

//-------------------------------------------------------------------------------------
return true

//-------------------------------------------------------------------------------------

end function

private function string of_get_font_size (string as_size);
//--------------------------------------------------------------------------------------
// возвращает номер шрифта для html по его размеру в DataWindow
//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------
constant integer li_koof_corect = 1 // константа корректировки рaзмера шрифта
integer li_size, li_result

//-------------------------------------------------------------------------------------
li_size = integer(as_size)
li_size = abs(li_size)

choose case li_size
	case 1 to 9
		li_result = 1 + li_koof_corect
	case 10
		li_result = 2 + li_koof_corect
	case 11,12
		li_result = 3 + li_koof_corect
	case 13,14
		li_result =4 + li_koof_corect
	case 15 to 18
		li_result = 5 + li_koof_corect
	case 19 to 24
		li_result = 6 + li_koof_corect
	case else 
		li_result = 7 + li_koof_corect
end choose
//--------------------------------------------------------------------------------------

return String(li_result)
//-------------------------------------------------------------------------------------
end function

on n_cst_dw_unload_in_html.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_unload_in_html.destroy
TriggerEvent( this, "destructor" )
end on

event ue_create_footer_document;call super::ue_create_footer_document;
//---------------------------------------------------------------------------------------
// формирование закрывающих тегов html документа
//---------------------------------------------------------------------------------------

if ib_table_border then 
	of_write_line(ii_id_file, '</table Border>')
else
	of_write_line(ii_id_file, '</table>')
end if

of_write_line(ii_id_file, '</body>')
of_write_line(ii_id_file, '</html>')

//-------------------------------------------------------------------------------------



end event

event ue_create_header_document;call super::ue_create_header_document;
//---------------------------------------------------------------------------------------
// формирование открывающих тегов html документа
of_write_line(ii_id_file, '<html>')
of_write_line(ii_id_file, '<head><META HTTP-EQUIV="Content-type"CONTENT="text/html; charset=windows-1251"></head>')
of_write_line(ii_id_file, '<body>')
of_write_line(ii_id_file, '<table width=' + string(il_table_width) + '>')

//---------------------------------------------------------------------------------------

end event

event ue_unload_band;call super::ue_unload_band;
integer li_k, li_i, li_j

integer li_nom_element

//-------------------------------------------------------------------------------------
// формирование тегов
for li_i = 1 to ii_count_rows

	// выбор номера колонки где есть елемент
	li_k = 1 
	do while (ii_rlt[li_i,li_k] <= 0) and (li_k <= ii_count_columns)
		li_k ++
	loop
	// проверка на наличие границы
	if li_k < ii_count_columns then
		li_nom_element = ii_rlt[li_i,li_k]
			if istr_band_cells[li_nom_element].b_border <> ib_table_border  then 
				ib_table_border = not ib_table_border
				if ib_table_border then
					of_write_line(ii_id_file, '</table>')
					of_write_line(ii_id_file, '<table Border width=' + string(il_table_width) + '>')
				else
					of_write_line(ii_id_file, '</table Border>')
					of_write_line(ii_id_file, '<table width=' + string(il_table_width) + '>')
				end if
			end if
		end if
		
		of_write_line(ii_id_file, '<tr valign=center>')
		// формирование тегов с данными
		for li_j = 1 to ii_count_columns
			if ii_rlt[li_i,li_j] > 0  then // формировать тег
				li_nom_element = ii_rlt[li_i,li_j]
				
//				CreateTag(BandCells[li_nom_element]) //формировать тег для ячейки с данными
				//------------------------------------------------------------------------------------
				string sTag // формируемый тег
				
				//------------------------------------------------------------------------------------
				sTag = '' 
				
				sTag += '	<td' // начало открывающего тега для ячейки
						
						// количество строк и колонок занимаемое ячейкой
				if istr_band_cells[li_nom_element].ul_obj_column_count > 1 then sTag += (' colspan=' + string(istr_band_cells[li_nom_element].ul_obj_column_count))
				if istr_band_cells[li_nom_element].ul_obj_row_count > 1 then sTag += (' Rowspan=' + string(istr_band_cells[li_nom_element].ul_obj_row_count))
						
						// ширина и высота ячейки
				sTag += ' width=' + string(istr_band_cells[li_nom_element].ul_obj_width)
				sTag += ' height=' + string(istr_band_cells[li_nom_element].ul_obj_height)
						
						// выравнивание данных в ячейке
				if istr_band_cells[li_nom_element].s_value_allign <> 'left' then
					sTag += ' align=' + istr_band_cells[li_nom_element].s_value_allign
				end if
						
				//sTag +=' style="vnd.ms-excel.numberformat:' + BandCells[li_nom_element].XlsFormat + '"' // тип данных в ячейке
				
				sTag += ('>') // конец открывающего тега описания ячейки
				
						// открывающие теги для характеристик шрифта
				sTag += '<font '
				sTag += ' face="' + istr_band_cells[li_nom_element].s_font_name + '","Arial"'
				sTag += ' Size=' + of_get_font_size(istr_band_cells[li_nom_element].s_font_size)
				sTag +='>' 
						
				if istr_band_cells[li_nom_element].b_font_bold then sTag +='<B>' // открывающий тег для жирного шрифта
				if istr_band_cells[li_nom_element].b_font_italic then sTag +='<I>' // открывающий тег для наклонного шрифта
				
				// вывод данных
				if istr_band_cells[li_nom_element].s_display_value = '' then
					sTag += '&nbsp'
				else
				//	if ( IsNumber(BandCells[li_nom_element].RealValue) and (BandCells[li_nom_element].DisplayValue) <> '-') then
				//		sTag += StrReplace(BandCells[li_nom_element].RealValue,',','.')
				//	else
						sTag += istr_band_cells[li_nom_element].s_display_value
				//	end if
				end if
				
				if istr_band_cells[li_nom_element].b_font_italic then sTag +='</I>' // закрывающий тег для наклонного шрифта
				if istr_band_cells[li_nom_element].b_font_bold then sTag +='</B>' // закрывающий тег для жирного шрифта
				
				sTag += '</font>' // закрывающий тег для характеристик шрифта
				sTag += '</td>' // закрывающий тег для ячейки
				
				//------------------------------------------------------------------------------------
				of_write_line(ii_id_file, sTag) // запись тега в файл
			end if
			if ii_rlt[li_i,li_j] = 0  then // формировать пустой тег
				of_write_line(ii_id_file, '	<td>&nbsp</td> ')
			end if
			if ii_rlt[li_i,li_j] < 0  then // не формировать тег
			end if
		next
	of_write_line(ii_id_file, '</tr>')
next


end event

