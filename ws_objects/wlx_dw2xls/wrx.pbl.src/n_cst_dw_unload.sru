$PBExportHeader$n_cst_dw_unload.sru
$PBExportComments$базовый обьект выгрузки (основа выгрузки)
forward
global type n_cst_dw_unload from nonvisualobject
end type
end forward

type str_cells from structure
	string		s_obj_name
	string		s_band_name
	unsignedlong		ul_obj_locate_x
	unsignedlong		ul_obj_locate_y
	unsignedlong		ul_obj_width
	unsignedlong		ul_obj_height
	unsignedlong		ul_obj_locate_row
	unsignedlong		ul_obj_locate_column
	unsignedlong		ul_obj_row_count
	unsignedlong		ul_obj_column_count
	string		s_real_value
	string		s_display_value
	string		s_obj_type
	string		s_value_allign
	string		s_font_name
	string		s_font_size
	boolean		b_font_bold
	boolean		b_font_italic
	string		s_font_color
	string		s_bg_color
	boolean		b_border
	string		s_xls_format
	string		s_xls_ole_format
	string		s_dw_format
	integer		i_visible
	boolean		b_auto_height
	integer		i_font_nom
end type

type str_groups from structure
	unsignedinteger		ui_level
	string		s_column_id
end type

type str_location from structure
	unsignedinteger		ul_num_in_dw_cells
	unsignedlong		ul_location_start
	unsignedlong		ul_location_end
end type

type str_font from structure
	string		s_name
	string		s_size
	integer		i_count
end type

global type n_cst_dw_unload from nonvisualobject
event ue_unload_end ( )
event ue_unload_row ( long row )
event ue_unload_start ( long countrow )
event ue_create_header_document ( )
event ue_create_footer_document ( )
event ue_unload_band ( )
end type
global n_cst_dw_unload n_cst_dw_unload

type variables
    //  выгружаемое DW 
private DataWindow idw_unload

    // строка возвращаемая функциями в случае ошибки
protected constant string is_error = '!!'

str_cells istr_dw_cell [] //масив с данными о елементах DataWindow
str_groups istr_dw_groups[] // масив с группами DW
long il_table_width // ширина таблицы в пикселах
string is_separator_decimal // розделитель дробной и целой части
string is_paper_orientation // ориентация листа

str_cells istr_band_cells[] // ячейки в текущей полосе
integer ii_rlt[100, 100] //[Row, column]
integer ii_count_rows, ii_count_columns
integer ii_count_band_cells

str_location istr_columns[] // розметка колонок
str_location istr_rows[] // розметка строк

str_font istr_fonts_table[] // таблица шрифтов
str_font istr_default_font // шрифт по умолчанию (по полосе данных)

end variables

forward prototypes
public function boolean of_load_str_dw_cell (datawindow dw)
private subroutine of_init ()
private function boolean of_calc_location ()
private function string of_get_display_value (datawindow adw_unload, long al_nom_in_cells, long al_row_dw)
private function unsignedlong of_get_distance_point (unsignedlong aul_loc1, unsignedlong aul_loc2)
private function long of_get_hw_pixels (string as_type_units, long al_value_units, character ach_locate_units)
private function string of_get_real_value (datawindow adw_unload, long al_nom_in_cells, long al_row_dw)
private function string of_get_xls_format (long al_cell_number)
private function boolean of_load_bands (datawindow adw_unload)
public function boolean of_write_line (integer ai_id_file, string as_value)
private function boolean of_unload_band (datawindow adw_unload, string as_band_name, long al_dw_current_row, boolean ab_change_level)
public function boolean of_unload (datawindow adw_unload, string as_path)
protected function string of_str_replace (string as_str, string as_str1, string as_str2)
private function integer of_get_visible (datawindow adw_unload, long al_nom_in_cells, long al_row_dw)
private function string of_get_xls_ole_format (long al_cell_number)
private function string of_get_dw_format (datawindow adw_unload, long al_nom_in_cells, long al_row_dw)
protected function any of_dw_describe_ (string as_describe_string)
protected function any of_dw_evaluate_ (string as_evaluate_string, long al_row_number)
protected function any of_dw_object_proterty_value_ (string as_property_val, long al_row_number)
public function boolean of_load_str_dw_cell_ (datawindow dw)
private function boolean of_create_fonts_table ()
public function string of_create_corect_file_name (string as_val)
private function boolean of_get_dw_bold (datawindow adw_unload, long al_nom_in_cells, long al_row_dw)
end prototypes

public function boolean of_load_str_dw_cell (datawindow dw);//---------------------------------------------------------------------------------------
// заполнение масива istr_dw_cell данными о обьектах DataWindow (text, column, compute)
//---------------------------------------------------------------------------------------

string ls_all_obj_dw // все обьекты DW
string ls_one_obj_dw // один обьект DW
integer li_position // позиция окончания названия одного обькта DW
long ll_count_element = 0// количество выбраных елементов
string ls_cur_units //единици измерения DW
string s
//---------------------------------------------------------------------------------------
ls_cur_units = dw.Describe('DataWindow.Units')

//---------------------------------------------------------------------------------------
if integer(dw.object.DataWindow.Print.Orientation) = 1 then
	is_paper_orientation= 'album' //альбомная ориентация листа
else
	is_paper_orientation= 'book' // книжная ......
end if

//---------------------------------------------------------------------------------------
ls_all_obj_dw = dw.Describe('DataWindow.Objects')
DO 											  
	li_position = Pos(ls_all_obj_dw, '~t')		 
		IF li_position > 0 THEN
			ls_one_obj_dw = Mid(ls_all_obj_dw, 1, li_position - 1)
			ls_all_obj_dw = Mid(ls_all_obj_dw, li_position + 1)
		ELSE
			ls_one_obj_dw = ls_all_obj_dw

			ls_all_obj_dw = ''
		END IF 										
	IF ((dw.Describe(ls_one_obj_dw+'.Type') = 'text') or  &
		 (dw.Describe(ls_one_obj_dw+'.Type') = 'column') or &
	    (dw.Describe(ls_one_obj_dw+'.Type') = 'compute')) and &
		 (dw.Describe(ls_one_obj_dw+'.Band') <> '?')  THEN							 
		
		ll_count_element ++
		
		istr_dw_cell[ll_count_element].s_obj_name = ls_one_obj_dw
		
		istr_dw_cell[ll_count_element].s_band_name = dw.Describe(ls_one_obj_dw+'.Band')
		
		istr_dw_cell[ll_count_element].ul_obj_locate_x = long(dw.Describe(ls_one_obj_dw+'.X'))
		istr_dw_cell[ll_count_element].ul_obj_locate_x = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_locate_x,'x')
		
		istr_dw_cell[ll_count_element].ul_obj_locate_y = long(dw.Describe(ls_one_obj_dw+'.Y'))
		istr_dw_cell[ll_count_element].ul_obj_locate_y = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_locate_y,'y')
		
		istr_dw_cell[ll_count_element].ul_obj_width = long(dw.Describe(ls_one_obj_dw+'.Width'))
		istr_dw_cell[ll_count_element].ul_obj_width = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_width,'x')
		
		istr_dw_cell[ll_count_element].ul_obj_height = long(dw.Describe(ls_one_obj_dw+'.Height'))
		istr_dw_cell[ll_count_element].ul_obj_height = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_height,'y')
		
		istr_dw_cell[ll_count_element].s_font_name =dw.Describe(ls_one_obj_dw+'.Font.Face')
		istr_dw_cell[ll_count_element].s_font_size =dw.Describe(ls_one_obj_dw+'.Font.Height')
		istr_dw_cell[ll_count_element].s_font_color =dw.Describe(ls_one_obj_dw+'.Color')
	
		istr_dw_cell[ll_count_element].s_bg_color =dw.Describe(ls_one_obj_dw+'.Background.Color')
		
		istr_dw_cell[ll_count_element].s_dw_format =dw.Describe(ls_one_obj_dw+'.Format')	
		
		if dw.Describe(ls_one_obj_dw+'.Height.AutoSize') = 'no' then
			istr_dw_cell[ll_count_element].b_auto_height = false
		else
			istr_dw_cell[ll_count_element].b_auto_height = true
		end if	
		//devmsg(dw.Describe(ls_one_obj_dw+'.Height.AutoSize'))
		
		if dw.Describe(ls_one_obj_dw+'.Font.Weight') = '400' then
			istr_dw_cell[ll_count_element].b_font_bold = false
		else
			istr_dw_cell[ll_count_element].b_font_bold = true
		end if
			
		s = string( dw.Describe(ls_one_obj_dw +".visible"   ) )
		if len(s) > 1 then 
			s = mid(s,4)
			s = mid(s,1, len(s) - 1)
			s = dw.Describe( "Evaluate('"+ s +"'," + string(1) + ") " )
		end if	
		istr_dw_cell[ll_count_element].i_visible = integer(s)

		//istr_dw_cell[ll_count_element].b_font_italic =dw.Describe(ls_one_obj_dw+'.Font.Face')
		
		if dw.Describe(ls_one_obj_dw + ".Border") <> "0" then 
				istr_dw_cell[ll_count_element].b_border=true 
			else
				istr_dw_cell[ll_count_element].b_border=false
			end if
		
		choose case integer(dw.Describe(ls_one_obj_dw+'.Alignment'))
			case 0 
				istr_dw_cell[ll_count_element].s_value_allign = 'left'
			case 1
				istr_dw_cell[ll_count_element].s_value_allign = 'right'
			case 3
				istr_dw_cell[ll_count_element].s_value_allign = 'center'
			case else 
				istr_dw_cell[ll_count_element].s_value_allign = 'center'
		end choose
	
	istr_dw_cell[ll_count_element].s_obj_type = (dw.Describe(ls_one_obj_dw+'.Type'))
	
	end if 							
LOOP UNTIL ls_all_obj_dw = ''				  
if ll_count_element = 0 then 
	return false
else 
	return true
end if
//---------------------------------------------------------------------------------------

end function

private subroutine of_init ();
//--------------------------------------------------------------------------------------
// начальная инициализация обьекта
//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------

Integer li_error

is_separator_decimal = '.' // разделитель целой и десятичной части по умолчанию

li_error = RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sDecimal", is_separator_decimal)
if li_error <> 1 then is_separator_decimal = ','

//--------------------------------------------------------------------------------------

end subroutine

private function boolean of_calc_location ();
//-------------------------------------------------------------------------------------
// функция рассчитывает положения (Row, Column) и размеры (RowCount, ColumnCount)
// елементов DataWindow 
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------


long ll_Column, ll_Row // номер колонки и строчки
long ll_d_Column[],ll_d_Row[] // вспомогательные масивы для формирования розметки листа
long ll_dr_Column[],ll_dr_Row[] // вспомогательные масивы для формирования розметки листа
long nomStart,nomEnd // начало и конец обьекта по ячейкам (колонкам, строкам)
							
long min, minX,minXW 
integer i, k, j, CountBand, ColumnCount, ib, RowCount

string dBands[] // масив с данными о полосах (bands) DW

boolean f

//-------------------------------------------------------------------------------------
// выбор данных о колонках (координат точек начала и конца обьектов
// в полосе detaile "данные") !!! ПО ВСЕХ ПОЛОСАХ
k = UpperBound(istr_dw_cell[])
min = istr_dw_cell[1].ul_obj_width
ColumnCount = 0
for i = 1 to k
	if istr_dw_cell[i].s_band_name = 'detail' then
	if istr_dw_cell[i].i_visible = 1 then
		ColumnCount ++
		ll_d_Column[ColumnCount] = istr_dw_cell[i].ul_obj_locate_x
		ColumnCount ++
		ll_d_Column[ColumnCount] = istr_dw_cell[i].ul_obj_locate_x + istr_dw_cell[i].ul_obj_width
		if min > istr_dw_cell[i].ul_obj_width then min = istr_dw_cell[i].ul_obj_width
	end if
	end if
next
min *= 0.5

//-------------------------------------------------------------------------------------
// сортировка координат 
k = UpperBound(ll_d_Column[])
for i = 1 to k - 1
	for j = i+1 to k
		if ll_d_Column[i] > ll_d_Column[j] then 
			ll_Column = ll_d_Column[i]
			ll_d_Column[i] = ll_d_Column[j]
			ll_d_Column[j] = ll_Column
		end if
	next
next

//-------------------------------------------------------------------------------------
//сжатие координат (отсеивание близконаходящихся)
ll_dr_Column[1] = ll_d_Column[1]
j = 1
for i = 2 to k
	if (of_get_distance_point(ll_d_Column[i],ll_dr_Column[j]) > min) then
		j ++
		ll_dr_Column[j] = ll_d_Column[i]
	end if
next

//-------------------------------------------------------------------------------------
//создание разметки колонок
k = UpperBound(ll_dr_Column[])
il_table_width = ll_dr_Column[k]
for i = 1 to k - 1
	istr_columns[i].ul_num_in_dw_cells = i
	istr_columns[i].ul_location_start = ll_dr_Column[i]
	istr_columns[i].ul_location_end = ll_dr_Column[i + 1]
next

ii_count_columns =  UpperBound(istr_columns[])
//-------------------------------------------------------------------------------------
// росчет положения обьектов по колонкам
ColumnCount = UpperBound(istr_columns[])
k = UpperBound(istr_dw_cell[])
for i = 1 to k
	minX = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x,istr_columns[1].ul_location_start)
	minXW = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x + istr_dw_cell[i].ul_obj_width, istr_columns[1].ul_location_end)
	nomStart = 1
	nomEnd = 1
	for j = 2 to ColumnCount
		if of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x,istr_columns[j].ul_location_start) < minX then
			minX = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x,istr_columns[j].ul_location_start)
			nomStart = j
		end if
		if of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x + istr_dw_cell[i].ul_obj_width, istr_columns[j].ul_location_end) < minXW then
			minXW = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_x + istr_dw_cell[i].ul_obj_width, istr_columns[j].ul_location_end)
			nomEnd = j
		end if
	next
	if NomEnd < NomStart then nomEnd = nomStart
	istr_dw_cell[i].ul_obj_locate_column = nomStart
	istr_dw_cell[i].ul_obj_column_count = of_get_distance_point(NomEnd, nomStart) + 1
	istr_dw_cell[i].ul_obj_locate_x = istr_columns[nomStart].ul_location_start
	istr_dw_cell[i].ul_obj_width = istr_columns[nomEnd].ul_location_end - istr_columns[nomStart].ul_location_start
next

//-------------------------------------------------------------------------------------
// выбор названий полос DW
k = UpperBound(istr_dw_cell[])
CountBand = 1
dBands[1] = istr_dw_cell[1].s_band_name
for i = 1 to k
	f = true
	for j = 1 to CountBand
		if dBands[j] = istr_dw_cell[i].s_band_name then f = false
	next
	if f then 
		CountBand ++
		dBands[CountBand] = istr_dw_cell[i].s_band_name
	end if
next

//-------------------------------------------------------------------------------------
// перебор всех полос
for ib = 1 to CountBand
	// загрузка данних о строках в конкретной полосе данных
	k = UpperBound(istr_dw_cell[])
	min = istr_dw_cell[1].ul_obj_height
	RowCount = 0
	for i = 1 to k
		if istr_dw_cell[i].s_band_name = dBands[ib] then
			if istr_dw_cell[i].i_visible = 1 then
				RowCount ++
				ll_d_Row[RowCount] = istr_dw_cell[i].ul_obj_locate_y
				RowCount ++
				ll_d_Row[RowCount] = istr_dw_cell[i].ul_obj_locate_y + istr_dw_cell[i].ul_obj_height
				if min > istr_dw_cell[i].ul_obj_height then min = istr_dw_cell[i].ul_obj_height
			end if
		end if
	next
	min *= 0.9
	//-------------------------------------------------------------------------------------
	// сортировка координат 
	k = UpperBound(ll_d_Row[])
	for i = 1 to k - 1
		for j = i+1 to k
			if ll_d_Row[i] > ll_d_Row[j] then 
				ll_Row = ll_d_Row[i]
				ll_d_Row[i] = ll_d_Row[j]
				ll_d_Row[j] = ll_Row
			end if
		next
	next
	//-------------------------------------------------------------------------------------
	//сжатие координат (отсеивание близконаходящихся)
	ll_dr_Row[1] = ll_d_Row[1]
	j = 1
	for i = 2 to k
		if (of_get_distance_point(ll_d_Row[i], ll_dr_Row[j]) > min) then
			j ++
			ll_dr_Row[j] = ll_d_Row[i]
		end if
	next
	//-------------------------------------------------------------------------------------
	// создание разметки строк для конкретной полосы
	k = UpperBound(ll_dr_Row[])
	for i = 1 to k - 1
		istr_rows[i].ul_num_in_dw_cells = i
		istr_rows[i].ul_location_start = ll_dr_Row[i]
		istr_rows[i].ul_location_end = ll_dr_Row[i + 1]
	next
	//-------------------------------------------------------------------------------------
	// рассчет положения обьектов по строкам
	RowCount = UpperBound(istr_rows[])
	k = UpperBound(istr_dw_cell[])
	for i = 1 to k
		if istr_dw_cell[i].s_band_name = dBands[ib] then
			minX = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y, istr_rows[1].ul_location_start)
			minXW = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y + istr_dw_cell[i].ul_obj_height, istr_rows[1].ul_location_end)
			nomStart = 1
			nomEnd = 1
			for j = 2 to RowCount
				if of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y,istr_rows[j].ul_location_start) < minX then
					minX = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y,istr_rows[j].ul_location_start)
					nomStart = j
				end if
				if of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y + istr_dw_cell[i].ul_obj_height, istr_rows[j].ul_location_end) < minXW then
					minXW = of_get_distance_point(istr_dw_cell[i].ul_obj_locate_y + istr_dw_cell[i].ul_obj_height, istr_rows[j].ul_location_end)
					nomEnd = j
				end if
			next
			if NomEnd < NomStart then nomEnd = nomStart
			istr_dw_cell[i].ul_obj_locate_row = nomStart
			istr_dw_cell[i].ul_obj_row_count = of_get_distance_point(NomEnd, nomStart) + 1
		end if
	next
next

//-------------------------------------------------------------------------------------
return true

//-------------------------------------------------------------------------------------
end function

private function string of_get_display_value (datawindow adw_unload, long al_nom_in_cells, long al_row_dw);	
//-----------------------------------------------------------------------------------
// возвращает отображаемое на екране значение для обьекта aCells DataWindow aDw, в строке aDwRow
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
string ls_Val	

//-----------------------------------------------------------------------------------
choose case istr_band_cells[al_nom_in_cells].s_obj_type
	case 'column'
		ls_Val = string(adw_unload.Describe("Evaluate('LookUpDisplay("+ istr_band_cells[al_nom_in_cells].s_obj_name +")'," + string(al_row_dw) + ") "))
	case 'compute'
		ls_Val = string(adw_unload.Describe("Evaluate('" + istr_band_cells[al_nom_in_cells].s_obj_name +"'," + string(al_row_dw) + ") "))
//	case 'compute'
//		ls_Val = string(adw_unload.Describe("Evaluate('"+ istr_band_cells[al_nom_in_cells].s_obj_name +".value'," + string(al_row_dw) + ") "))
	case 'text' 
		ls_Val = adw_unload.Describe(istr_band_cells[al_nom_in_cells].s_obj_name + '.Text')
end choose

//-----------------------------------------------------------------------------------
return ls_Val

//-----------------------------------------------------------------------------------

	

end function

private function unsignedlong of_get_distance_point (unsignedlong aul_loc1, unsignedlong aul_loc2);
//---------------------------------------------------------------------------------------
// возвращает ростояние между двумя координатами
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
long ll_distance

//---------------------------------------------------------------------------------------

ll_distance = (aul_Loc1 - aul_Loc2)
ll_distance = abs(ll_distance)
return ll_distance
//---------------------------------------------------------------------------------------

end function

private function long of_get_hw_pixels (string as_type_units, long al_value_units, character ach_locate_units);
//------------------------------------------------------------------------------------
// возвращает размеры в пикселах в зависимости от единиц измерения и 
// положения (x, y)
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
long ll_value_in_pixel

//------------------------------------------------------------------------------------
choose case as_type_units
	case '0' // PowerBylder
		if ach_locate_units = 'x' then 
			ll_value_in_pixel = UnitsToPixels(al_value_units, XUnitsToPixels!)
		else
			ll_value_in_pixel = UnitsToPixels(al_value_units, YUnitsToPixels!)
		end if
		case '1' // Pixels
		ll_value_in_pixel = al_value_units
	case '2' //1/1000 inch
		if ach_locate_units = 'x' then 
			ll_value_in_pixel = round(al_value_units * 0.096003134796,0)
		else
			ll_value_in_pixel = round(al_value_units * 0.09605122732,0)
		end if		
	case '3' // 1/1000 cm
		if ach_locate_units = 'x' then 
			ll_value_in_pixel = round(al_value_units * 0.037797684,0)
		else
			ll_value_in_pixel = round(al_value_units * 0.03746153846,0)
		end if
	case else
		ll_value_in_pixel = al_value_units
end choose

//------------------------------------------------------------------------------------
if ll_value_in_pixel = 0 then ll_value_in_pixel = 1

return ll_value_in_pixel		

//------------------------------------------------------------------------------------

end function

private function string of_get_real_value (datawindow adw_unload, long al_nom_in_cells, long al_row_dw);	
//-----------------------------------------------------------------------------------
// возвращает отображаемое на екране значение для обьекта aCells DataWindow aDw, в строке aDwRow
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------

string ls_Val	

//-----------------------------------------------------------------------------------
choose case istr_band_cells[al_nom_in_cells].s_obj_type
	case 'column'
		ls_Val = string(adw_unload.Describe("Evaluate('"+ istr_band_cells[al_nom_in_cells].s_obj_name +"'," + string(al_row_dw) + ") "))
	case 'compute'
		ls_Val = string(adw_unload.Describe("Evaluate('"+ istr_band_cells[al_nom_in_cells].s_obj_name +"'," + string(al_row_dw) + ") "))
	case 'text' 
		ls_Val = adw_unload.Describe(istr_band_cells[al_nom_in_cells].s_obj_name + '.Text')
end choose

//-----------------------------------------------------------------------------------
return ls_Val

//-----------------------------------------------------------------------------------

	

end function

private function string of_get_xls_format (long al_cell_number);string ls_return_val
string ls_real_val
string ls_display_val
integer li_count_0, i
Choose case Upper(istr_band_cells[al_cell_number].s_dw_format)
	case '!'
		ls_return_val = '@'
	case '[TIME]'
		ls_return_val = '@'
	case '[GENERAL]' 
		ls_return_val = 'General'
	
	case else
		//ls_return_val = istr_band_cells[al_cell_number].s_dw_format
		ls_return_val = '@'
end choose

if Pos(istr_band_cells[al_cell_number].s_dw_format, '0.0',1) >0 then ls_return_val = '0.0'

if Pos(istr_band_cells[al_cell_number].s_dw_format, '#,##',1) >0 then ls_return_val = '#,##'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '#,##0.0',1) >0 then ls_return_val = '#,##0.0'

//if Pos(istr_band_cells[al_cell_number].s_dw_format, '##0.0;-####0.0',1) >0 then ls_return_val = '#,##0.0'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '##0.0',1) >0 then ls_return_val = '#,##0.0'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '##0.000',1) >0 then ls_return_val = '#,##0.000'

if Pos(istr_band_cells[al_cell_number].s_dw_format, '0.0000',1) >0 then ls_return_val = '#,##0.0000'



if ls_return_val = '@' or ls_return_val = 'General'  then
	ls_real_val = istr_band_cells[al_cell_number].s_real_value
	if IsNumber( ls_real_val ) then 
		ls_display_val = trim( istr_band_cells[al_cell_number].s_display_value)
		ls_return_val = '0'//'#,##0'
		if pos(ls_display_val, is_separator_decimal) > 0 then
			li_count_0 = len(ls_display_val) - pos(ls_display_val, is_separator_decimal)
		else
			li_count_0 = 0
		end if
		if li_count_0 > 0 then
			ls_return_val += '.'
			for i= 1 to li_count_0 
				ls_return_val += '0'
			next
		end if	
	end if
end if

return ls_return_val
end function

private function boolean of_load_bands (datawindow adw_unload);
//-------------------------------------------------------------------------------------
// загрузка данных о уровнях DW (номер уровня, id колонки ) 
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
constant integer li_kol_sim = 75

string ls_objects_dw // данные о всех уровнях DW
string ls_single_obj_dw // данные о одном уровне DW
string ls_s1, ls_s2, ls_s3 // вспомогательные строки

integer li_gr_lev = 0, li_lev
long ll_position, ll_position1

//-------------------------------------------------------------------------------------
ls_objects_dw = adw_unload.Describe("DataWindow.Syntax")

	DO 
		ll_position = Pos(ls_objects_dw, 'group(level',1)
		IF ll_position > 0 THEN
			ls_single_obj_dw = Mid(ls_objects_dw,ll_position, ll_position + li_kol_sim )
			ls_objects_dw = Mid(ls_objects_dw,ll_position + li_Kol_Sim )
		ELSE
			ls_objects_dw = ""
		END IF
		if ll_position > 0 then
			ls_s1 = ls_single_obj_dw
			li_lev = integer(mid(ls_s1,13,2))
			ls_s1 = mid(ls_s1,Pos(ls_s1,'by=(',1) + 5)
			ls_s2 = mid(ls_s1,1, Pos(ls_s1,')',1) - 2)
			do 
				ll_position1 = Pos(ls_s2, '"',1)
				IF ll_position1 > 0 THEN
					ls_s3 = Mid(ls_s2, 1, ll_position1 - 1 )
					ls_s2 = Mid(ls_s2, ll_position1 + 3 )
					li_gr_lev ++
					istr_dw_groups[li_gr_lev].ui_level = li_lev
					istr_dw_groups[li_gr_lev].s_column_id = string(adw_unload.Describe(ls_s3+".id"))
				ELSE
					ls_s2 = ""
				END IF
				
			loop while ll_position1 > 0
		end if		
	loop while ll_position > 0
	
//-------------------------------------------------------------------------------------
return true
	
//-------------------------------------------------------------------------------------
end function

public function boolean of_write_line (integer ai_id_file, string as_value);
//--------------------------------------------------------------------------------------
// записывает строку s в файл(IdFile) 
//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------
integer li_error_code 

//--------------------------------------------------------------------------------------
li_error_code = FileWrite(ai_id_file,as_value) // +  Char(13))

//--------------------------------------------------------------------------------------
if li_error_code > - 1 then
	return true
else
	return false
end if

//--------------------------------------------------------------------------------------

end function

private function boolean of_unload_band (datawindow adw_unload, string as_band_name, long al_dw_current_row, boolean ab_change_level);
//-------------------------------------------------------------------------------------
// выгрузка полосы s_band_name DW с положением "курсора" в строке istr_dw_cellurrentRow
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

integer li_k, li_i, li_j, i
long ll_row_start, ll_row_end
long ll_column_start, ll_column_end
boolean b_unvis = false
str_cells lstr_vis[]
str_cells lstr_unvis[]
integer li_count_vis
integer li_count_unvis
integer li_Pos_Temp

if as_band_name = 'detail' then
	as_band_name = 'detail'
end if

//-------------------------------------------------------------------------------------
//если уровень изменился
//if ab_change_level then
	//----------------------------------------------------------------------------------
	// выбор обьектов которые принадлежат полосе s_band_name 
	li_k = UpperBound(istr_dw_cell[])
	ii_count_band_cells = 0
	for li_i = 1 to li_k
		if istr_dw_cell[li_i].s_band_name = as_band_name then
			ii_count_band_cells ++
			istr_band_cells[ii_count_band_cells] = istr_dw_cell[li_i]
		end if
	next
if ab_change_level then

	//--------------------------------------------------------------------------------
	ii_count_rows = 1
//	ii_count_columns = 1
end if

//-------------------------------------------------------------------------------------
// если в полосе нет оьектов то на выход
if ii_count_band_cells = 0 then return true

// росчет значений value обьектов которые принадлежат полосе s_band_name
for li_i = 1 to ii_count_band_cells
	
	istr_band_cells[li_i].s_dw_format =  this.of_get_dw_format (adw_unload, li_i, al_dw_current_row)
	
	istr_band_cells[li_i].b_font_bold =  this.of_get_dw_bold (adw_unload, li_i, al_dw_current_row)
	
	istr_band_cells[li_i].i_visible = of_get_visible(adw_unload, li_i, al_dw_current_row)

	istr_band_cells[li_i].s_display_value = of_get_display_value(adw_unload, li_i, al_dw_current_row)
			
	istr_band_cells[li_i].s_real_value = of_get_real_value(adw_unload, li_i, al_dw_current_row)
	

	// форматы только для чисел остальные в текст
		if IsNumber(istr_band_cells[li_i].s_real_value) then
//			istr_band_cells[li_i].s_display_value = of_str_replace(istr_band_cells[li_i].s_display_value,',','.')
			istr_band_cells[li_i].s_xls_format = of_get_xls_format(li_i)
			istr_band_cells[li_i].s_xls_ole_format = of_get_xls_ole_format(li_i)
		else
			istr_band_cells[li_i].s_xls_format = '@'
			istr_band_cells[li_i].s_xls_ole_format = '@'
		end if

		li_Pos_Temp =  Pos (istr_band_cells[li_i].s_xls_format,'-')

		if ( istr_band_cells[li_i].s_real_value = '0') and  ( Pos (istr_band_cells[li_i].s_dw_format,'-') > 0) then
			istr_band_cells[li_i].s_display_value = '-'
			istr_band_cells[li_i].s_real_value = '-'
		end if
		
		if ( istr_band_cells[li_i].s_real_value = '0') and  ( Pos (Lower(istr_band_cells[li_i].s_dw_format),'x') > 0) then
			istr_band_cells[li_i].s_display_value = 'X'
			istr_band_cells[li_i].s_real_value = 'X'
		end if

// удаление двойных кавычек
if Pos(istr_band_cells[li_i].s_display_value,'"')=1 then
	istr_band_cells[li_i].s_display_value = Mid(istr_band_cells[li_i].s_display_value,2,Len(istr_band_cells[li_i].s_display_value) - 2)
end if
if Pos(istr_band_cells[li_i].s_real_value,'"')=1 then
	istr_band_cells[li_i].s_real_value = Mid(istr_band_cells[li_i].s_real_value,2,Len(istr_band_cells[li_i].s_real_value) - 2)
end if

// удаление тильды
istr_band_cells[li_i].s_display_value = this.of_str_replace ( istr_band_cells[li_i].s_display_value, '~~"', '"' )
istr_band_cells[li_i].s_real_value = this.of_str_replace ( istr_band_cells[li_i].s_real_value, '~~"', '"' )
istr_band_cells[li_i].s_display_value = this.of_str_replace ( istr_band_cells[li_i].s_display_value, "~~'", '"' )
istr_band_cells[li_i].s_real_value = this.of_str_replace ( istr_band_cells[li_i].s_real_value, "~~'", "'" )

	//если уровень изменился
	if ab_change_level then
		if istr_band_cells[li_i].ul_obj_locate_row > ii_count_rows then ii_count_rows = istr_band_cells[li_i].ul_obj_locate_row
//		if istr_band_cells[li_i].ul_obj_locate_column > ii_count_columns then ii_count_columns = istr_band_cells[li_i].ul_obj_locate_column 
	end if	
	

next

//-------------------------------------------------------------------------------------
// удаление обьектов у которых visible = 0
for i = 1 to ii_count_band_cells
	if istr_band_cells[i].i_visible <> 0 then
		li_count_vis = UpperBound(lstr_vis[])
		lstr_vis[li_count_vis + 1] = istr_band_cells[i]
	else
		b_unvis = true // есть невидимые елементы
	end if
next
istr_band_cells = lstr_vis
ii_count_band_cells = UpperBound(istr_band_cells[])
//-------------------------------------------------------------------------------------
//если уровень изменился или есть невидимые елементы
if ab_change_level or b_unvis then

//	devmsg(' * count row = ' + string(ii_count_rows))
//	devmsg(' * count column = ' + string(ii_count_columns))
	// создание розметки листа тегами ii_rlt[]
	for li_i = 1 to ii_count_rows
		for li_j = 1 to ii_count_columns
			ii_rlt[li_i,li_j] = 0 //по умолчанию пустые теги
		next
	next

	ii_count_rows = 1
//	ii_count_columns = 1
	for li_k = 1 to ii_count_band_cells
		ll_row_start = istr_band_cells[li_k].ul_obj_locate_row
		ll_row_end = (istr_band_cells[li_k].ul_obj_locate_row + istr_band_cells[li_k].ul_obj_row_count) - 1
		ll_column_start = istr_band_cells[li_k].ul_obj_locate_column
		ll_column_end = (istr_band_cells[li_k].ul_obj_locate_column + istr_band_cells[li_k].ul_obj_column_count) - 1
//		if ii_count_columns < ll_column_end then ii_count_columns = ll_column_end
		if ii_count_rows < ll_row_end then ii_count_rows = ll_row_end
		for li_i = ll_row_start to ll_row_end
			for li_j = ll_column_start to ll_column_end
				ii_rlt[li_i,li_j] = - li_k // не формирровать тег
			next
		next
		ii_rlt[ll_row_start, ll_column_start] = li_k // номер елемента в масиве елементов
	next
	
	// err
//	devmsg('count row = ' + string(ii_count_rows))
//	devmsg('count column = ' + string(ii_count_columns))
//	string s = ''
//	for li_i = 1 to ii_count_rows
//		for li_j = 1 to ii_count_columns
//			s += string(ii_rlt[li_i,li_j]) + ' - '
//		next
//		devmsg(' row ' + string(li_i) + ' ' + s)
//		s = ''
//	next

	
end if


//-------------------------------------------------------------------------------------
this.event ue_unload_band()

//-------------------------------------------------------------------------------------
return true

//-------------------------------------------------------------------------------------
end function

public function boolean of_unload (datawindow adw_unload, string as_path);
//---------------------------------------------------------------------------------------
// Выгрузка DataWindow в HTML
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------

boolean lb_error
long ll_dw_current_row 
long ll_count_row_dw
long ll_count_groups
long ll_level, ll_max_level, j, i
string ls_value_curr_level[], ls_value_prev_level[] //группировки
boolean lb_change_level
boolean lb_update_rlt

//---------------------------------------------------------------------------------------
ll_count_row_dw = adw_unload.RowCount()
idw_unload = adw_unload
lb_error = of_load_str_dw_cell_(adw_unload)//загрузка данных о обьектах DW
if not lb_error then return false

lb_error = of_load_bands(adw_unload)//загрузка данных о полосах (уровнях)
if not lb_error then return false

lb_error = of_calc_location()//росчет положений обьектов
if not lb_error then return false

lb_error = this.of_create_fonts_table ( ) // создание таблици шрифтов и выбор шрифта по умалчанию
if not lb_error then return false


//---------------------------------------------------------------------------------------
// начальная инициализация перед выгрузкой
//TableBorder = false
ll_dw_current_row  = 1
ll_count_groups = UpperBound(istr_dw_groups[])
if ll_count_groups > 0 then 
	ll_max_level = long(istr_dw_groups[ll_count_groups].ui_level) 
else 
	ll_max_level = 0
end if

//---------------------------------------------------------------------------------------
this.event ue_unload_start(ll_count_row_dw)

this.event ue_create_header_document()

//---------------------------------------------------------------------------------------
lb_update_rlt = true

// выгрузка хедеров
of_unload_band(adw_unload,'header',ll_dw_current_row,lb_update_rlt)
for j = 1 to ll_count_groups
		of_unload_band(adw_unload,'header.' + string(j),ll_dw_current_row,lb_update_rlt)
		ls_value_prev_level[j] = string(adw_unload.object.Data[ll_dw_current_row,long(istr_dw_groups[j].s_column_id)])
next

//---------------------------------------------------------------------------------------
//выгрузка данных
lb_change_level = false

for ll_dw_current_row  = 1 to ll_count_row_dw // перебор всех строк DW
	if ll_count_groups <> 0 then // если в dw есть групировки
		for j = 1 to ll_count_groups // данные о значениях колонок идентифицирующих уровни для текущего положения "курсора"
			ls_value_curr_level[j] = string(adw_unload.object.Data[ll_dw_current_row,long(istr_dw_groups[j].s_column_id)])
		next
		ll_level = long(istr_dw_groups[UpperBound(istr_dw_groups[])].ui_level) // по умолчанию макс. уровень
		for j = ll_count_groups to 1 step -1 // поиск минимального уровня
			if ls_value_prev_level[j] <> ls_value_curr_level[j] then
				ll_level =long(istr_dw_groups[j].ui_level)
				lb_change_level = true
			end if
		next
		if lb_change_level then // если уровень изменился
			// выгрузка trailer-ов строки
			for j = ll_max_level to ll_level step - 1
				lb_update_rlt = true
				of_unload_band(adw_unload,'trailer.' + string(j),ll_dw_current_row,lb_update_rlt)
			next
			// выгрузка header-ов строки
			for j = ll_level to ll_max_level
				lb_update_rlt = true
				of_unload_band(adw_unload,'header.' + string(j),ll_dw_current_row,lb_update_rlt)
			next
			lb_change_level = false
		end if
	end if // если в dw есть групировки

	// выгрузка данных
	of_unload_band(adw_unload,'detail',ll_dw_current_row,lb_update_rlt)
	lb_update_rlt = false
	
	this.event ue_unload_row(ll_dw_current_row)	
	
	ls_value_prev_level = ls_value_curr_level // предыдущие значения группировок = текущим 
next

//---------------------------------------------------------------------------------------
lb_update_rlt = true
	
// выгрузка сумм и подвала
for j = ll_count_groups to 1 step - 1
	of_unload_band(adw_unload,'trailer.' + string(j),ll_dw_current_row,lb_update_rlt)
next
of_unload_band(adw_unload,'summary',ll_dw_current_row,lb_update_rlt)
of_unload_band(adw_unload,'footer',ll_dw_current_row,lb_update_rlt)

//---------------------------------------------------------------------------------------
this.event ue_create_footer_document()

this.event ue_unload_end()
//---------------------------------------------------------------------------------------
return true
//---------------------------------------------------------------------------------------

end function

protected function string of_str_replace (string as_str, string as_str1, string as_str2);
//---------------------------------------------------------------------------------------
// заменяет в строке str строку str1 на строку str2
//---------------------------------------------------------------------------------------

string ls_result
integer li_prev_pos, li_prev_pos2
//---------------------------------------------------------------------------------------

ls_result= as_str
li_prev_pos = 1

do while Pos(ls_result, as_str1, li_prev_pos) > 0
	//devmsg(Pos(ls_result, as_str1, li_prev_pos) + len(as_str2))
	li_prev_pos2 = Pos(ls_result, as_str1, li_prev_pos)
	ls_result = replace(ls_result, li_prev_pos2, len(as_str1), as_str2 )
	li_prev_pos= li_prev_pos2 + len(as_str2)
loop

return ls_result

//---------------------------------------------------------------------------------------

end function

private function integer of_get_visible (datawindow adw_unload, long al_nom_in_cells, long al_row_dw);	
//-----------------------------------------------------------------------------------
// возвращает отображаемое на екране значение для обьекта aCells DataWindow aDw, в строке aDwRow
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------

integer ls_Val	
string s
//-----------------------------------------------------------------------------------
s = string( adw_unload.Describe(istr_band_cells[al_nom_in_cells].s_obj_name +".visible"   ) )
if len(s) > 1 then 
	s = mid(s,4)
	s = mid(s,1, len(s) - 1)
	s = adw_unload.Describe( "Evaluate('"+ s +"'," + string(al_row_dw) + ") " )
end if
ls_val = integer(s)
//-----------------------------------------------------------------------------------
return ls_Val

//-----------------------------------------------------------------------------------

	

end function

private function string of_get_xls_ole_format (long al_cell_number);string ls_return_val
string ls_real_val
string ls_display_val
integer li_count_0, i

Choose case Upper(istr_band_cells[al_cell_number].s_dw_format)
	case '!'
		ls_return_val = '@'
	case '[TIME]'
		ls_return_val = '@'
	case '[GENERAL]' 
		ls_return_val = 'General'
	
	case else
		//ls_return_val = istr_band_cells[al_cell_number].s_dw_format
		ls_return_val = '@'
end choose

if Pos(istr_band_cells[al_cell_number].s_dw_format, '0.0',1) >0 then ls_return_val = '0' + is_separator_decimal + '0'

if Pos(istr_band_cells[al_cell_number].s_dw_format, '#,##',1) >0 then ls_return_val = '# ##0'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '#,##0.0',1) >0 then ls_return_val = '# ##0' + is_separator_decimal + '0'
	// новые
//if Pos(istr_band_cells[al_cell_number].s_dw_format, '####0.0;-####0.0',1) >0 then ls_return_val = '# ##0,0'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '##0.0',1) >0 then ls_return_val = '# ##0' + is_separator_decimal + '0'
if Pos(istr_band_cells[al_cell_number].s_dw_format, '##0.000',1) >0 then ls_return_val = '# ##0' + is_separator_decimal + '000'

if Pos(istr_band_cells[al_cell_number].s_dw_format, '0.0000',1) >0 then ls_return_val = '# ##0' + is_separator_decimal + '0000'



if ls_return_val = '@' or ls_return_val = 'General' then
	ls_real_val = istr_band_cells[al_cell_number].s_real_value
	if IsNumber( ls_real_val ) then 
		ls_display_val = trim( istr_band_cells[al_cell_number].s_display_value)
		ls_return_val = '0'//'# ##0'
		if pos(ls_display_val, is_separator_decimal) > 0 then
			li_count_0 = len(ls_display_val) - pos(ls_display_val, is_separator_decimal)
		else
			li_count_0 = 0
		end if
		if li_count_0 > 0 then
			ls_return_val += is_separator_decimal
			for i= 1 to li_count_0 
				ls_return_val += '0'
			next
		end if	
	end if
end if
	
	
//if  is_separator_decimal <> ',' then
//	ls_return_val = this.of_str_replace ( ls_return_val, ',' , is_separator_decimal )
//end if

return ls_return_val
end function

private function string of_get_dw_format (datawindow adw_unload, long al_nom_in_cells, long al_row_dw);	
//-----------------------------------------------------------------------------------
// 
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------

string ls_format	
string ls_return_val
integer li_pos
string ls_name
//-----------------------------------------------------------------------------------
ls_format = istr_band_cells[al_nom_in_cells].s_dw_format
li_pos = pos(ls_format,'~t')
ls_name = istr_band_cells[al_nom_in_cells].s_obj_name
if li_pos > 0 then
	ls_format = mid(ls_format, li_pos + 1)
	ls_format = left(ls_format, len(ls_format) - 1)
	ls_format = this.of_str_replace ( ls_format, "'", '"' )
	
//	ls_return_val = string(adw_unload.Describe("Evaluate('"+ istr_band_cells[al_nom_in_cells].s_obj_name +"'," + string(al_row_dw) + ") "))
	ls_return_val = string(adw_unload.Describe("Evaluate('"+ ls_format +"'," + string(al_row_dw) + ") "))
else
	ls_return_val = ls_format
end if

//-----------------------------------------------------------------------------------
return ls_return_val

//-----------------------------------------------------------------------------------

	

end function

protected function any of_dw_describe_ (string as_describe_string);
//--------------------------------------------------------------------------------------------------
// возвращает значение атрибута(свойства) переданого в качестве аргумента для выгружаемого DW
// в случае ошибки возвращает is_error
//--------------------------------------------------------------------------------------------------
any la_return_val

return idw_unload.Describe(as_describe_string)

choose case la_return_val
	case '!','?'
		MessageBox('of_dw_describe_', as_describe_string  )
		return is_error
	case else
		return la_return_val
end choose


//--------------------------------------------------------------------------------------------------

end function

protected function any of_dw_evaluate_ (string as_evaluate_string, long al_row_number);
//------------------------------------------------------------------------------------------------------
// возвращает значение строки (выражение) as_evaluate_string  для строки DW al_row_number
// и строку is_error в случае ошибки 
//------------------------------------------------------------------------------------------------------
any la_return_val

if pos(as_evaluate_string,'~t') > 0 then
	as_evaluate_string = mid(as_evaluate_string,pos(as_evaluate_string,'~t') + 1 )
	as_evaluate_string = left(as_evaluate_string, len(as_evaluate_string) - 1 )
end if

la_return_val = idw_unload.Describe("Evaluate('" + as_evaluate_string + "'," + string(al_row_number) + ") ")

choose case la_return_val
	case '!','?'
		MessageBox('of_dw_evaleate_', as_evaluate_string + '~r~nfor row = ' + string(al_row_number ) )
		return is_error
	case else
		return la_return_val
end choose

//------------------------------------------------------------------------------------------------------

end function

protected function any of_dw_object_proterty_value_ (string as_property_val, long al_row_number);
//---------------------------------------------------------------------------------------------------------
// возвращает значение свойства обьекта dw для конкретной строки , если значения свойства не зависит от
// номера строки то возвращается само ето значение, в случае ошибки возвращается строка is_error 
// (возвращенная функцией of_dw_evaluate_ )
//---------------------------------------------------------------------------------------------------------
any la_return_val

if pos(as_property_val,'~t') = 0 then
	return as_property_val
end if

la_return_val = this.of_dw_evaluate_ ( as_property_val, al_row_number )


return la_return_val
//---------------------------------------------------------------------------------------------------------

end function

public function boolean of_load_str_dw_cell_ (datawindow dw);//---------------------------------------------------------------------------------------
// заполнение масива istr_dw_cell данными о обьектах DataWindow (text, column, compute)
// возвращает true если удалось выбрать информацию хоть об одном обьекте и false в 
// противном случае 
//---------------------------------------------------------------------------------------

string ls_all_obj_dw // все обьекты DW
string ls_one_obj_dw // один обьект DW
integer li_position // позиция окончания названия одного обькта DW
long ll_count_element = 0// количество выбраных елементов
string ls_cur_units //единици измерения DW
string ls_term
string ls_location
//---------------------------------------------------------------------------------------
ls_cur_units = this.of_dw_describe_ ( 'DataWindow.Units')

//---------------------------------------------------------------------------------------
if this.of_dw_describe_('DataWindow.Print.Orientation') = '1' then
	is_paper_orientation= 'album' //альбомная ориентация листа
else
	is_paper_orientation= 'book' // книжная ......
end if

//---------------------------------------------------------------------------------------
ls_all_obj_dw = this.of_dw_describe_ ( 'DataWindow.Objects')
DO 											  
	li_position = Pos(ls_all_obj_dw, '~t')		 
		IF li_position > 0 THEN
			ls_one_obj_dw = Mid(ls_all_obj_dw, 1, li_position - 1)
			ls_all_obj_dw = Mid(ls_all_obj_dw, li_position + 1)
		ELSE
			ls_one_obj_dw = ls_all_obj_dw

			ls_all_obj_dw = ''
		END IF 									
	ls_term = this.of_dw_describe_ ( ls_one_obj_dw+'.Type')
	IF ((ls_term = 'text') or  &
		 (ls_term = 'column') or &
	    (ls_term = 'compute')) and &
		 (this.of_dw_describe_ (ls_one_obj_dw+'.Band') <> '?')  THEN							 
		
		ll_count_element ++
		
		istr_dw_cell[ll_count_element].s_obj_name = ls_one_obj_dw
		
		istr_dw_cell[ll_count_element].s_band_name = this.of_dw_describe_ (ls_one_obj_dw+'.Band')
		
		ls_location = this.of_dw_describe_ (ls_one_obj_dw+'.X')
		if pos(ls_location,'~t') > 0 then ls_location = this.of_dw_evaluate_(ls_location,1)
		istr_dw_cell[ll_count_element].ul_obj_locate_x = long(ls_location )
		istr_dw_cell[ll_count_element].ul_obj_locate_x = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_locate_x,'x')
		
		ls_location = this.of_dw_describe_ (ls_one_obj_dw+'.Y')
		if pos(ls_location,'~t') > 0 then ls_location = this.of_dw_evaluate_(ls_location,1)
		istr_dw_cell[ll_count_element].ul_obj_locate_y = long(ls_location)
		istr_dw_cell[ll_count_element].ul_obj_locate_y = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_locate_y,'y')
		
		ls_location = this.of_dw_describe_ (ls_one_obj_dw+'.Width')
		if pos(ls_location,'~t') > 0 then ls_location = this.of_dw_evaluate_(ls_location,1)
		istr_dw_cell[ll_count_element].ul_obj_width = long(ls_location)
		istr_dw_cell[ll_count_element].ul_obj_width = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_width,'x')
		
		ls_location = this.of_dw_describe_ (ls_one_obj_dw+'.Height')
		if pos(ls_location,'~t') > 0 then ls_location = this.of_dw_evaluate_(ls_location,1)
		istr_dw_cell[ll_count_element].ul_obj_height = long(ls_location)
		istr_dw_cell[ll_count_element].ul_obj_height = of_get_hw_pixels(ls_cur_units,istr_dw_cell[ll_count_element].ul_obj_height,'y')
		
		istr_dw_cell[ll_count_element].s_font_name = this.of_dw_describe_ (ls_one_obj_dw+'.Font.Face')
		istr_dw_cell[ll_count_element].s_font_size = this.of_dw_describe_ (ls_one_obj_dw+'.Font.Height')
		istr_dw_cell[ll_count_element].s_font_color =this.of_dw_describe_ (ls_one_obj_dw+'.Color')
	
		istr_dw_cell[ll_count_element].s_bg_color =this.of_dw_describe_ (ls_one_obj_dw+'.Background.Color')
		
		istr_dw_cell[ll_count_element].s_dw_format =this.of_dw_describe_ (ls_one_obj_dw+'.Format')	
		
		if this.of_dw_describe_ (ls_one_obj_dw+'.Height.AutoSize') = 'no' then
			istr_dw_cell[ll_count_element].b_auto_height = false
		else
			istr_dw_cell[ll_count_element].b_auto_height = true
		end if	
		
		if this.of_dw_describe_ (ls_one_obj_dw+'.Font.Weight') = '400' then
			istr_dw_cell[ll_count_element].b_font_bold = false
		else
			istr_dw_cell[ll_count_element].b_font_bold = true
		end if
			
		ls_term = this.of_dw_describe_ ( ls_one_obj_dw +".visible" )
		istr_dw_cell[ll_count_element].i_visible = integer( this.of_dw_object_proterty_value_ ( ls_term, 1 ) )

		if this.of_dw_describe_ (ls_one_obj_dw + ".Border") <> "0" then 
				istr_dw_cell[ll_count_element].b_border=true 
			else
				istr_dw_cell[ll_count_element].b_border=false
			end if
		
		choose case integer( this.of_dw_describe_ (ls_one_obj_dw+'.Alignment') )
			case 0 
				istr_dw_cell[ll_count_element].s_value_allign = 'left'
			case 1
				istr_dw_cell[ll_count_element].s_value_allign = 'right'
			case 3
				istr_dw_cell[ll_count_element].s_value_allign = 'center'
			case else 
				istr_dw_cell[ll_count_element].s_value_allign = 'center'
		end choose
	
		istr_dw_cell[ll_count_element].s_obj_type = this.of_dw_describe_ (ls_one_obj_dw+'.Type')
	end if 							
LOOP UNTIL ls_all_obj_dw = ''		

if ll_count_element = 0 then 
	return false
else 
	return true
end if
//---------------------------------------------------------------------------------------

end function

private function boolean of_create_fonts_table ();
//-------------------------------------------------------------------------------------
// создает таблицу шрифтов и выбирает шрифт и размер шрифта по умолчанию
//-------------------------------------------------------------------------------------
integer i,j
integer li_count_obj, li_count_fonts
str_font lstr_font
str_font lstr_font_tmp[]
boolean f
integer li_nom, li_max
//-------------------------------------------------------------------------------------
// создание таблици шрифтов
li_count_obj = UpperBound(istr_dw_cell[])
li_count_fonts = 0
for i =1 to li_count_obj // перебор всех обьектов 
	lstr_font.s_name = istr_dw_cell[i].s_font_name
	lstr_font.s_size = istr_dw_cell[i].s_font_size
	f = true
	for j =1 to li_count_fonts // перебор шрифтов для поиска есть ли уже такой
		if (lstr_font.s_name = istr_fonts_table[j].s_name) and (lstr_font.s_size = istr_fonts_table[j].s_size) then
			f = false
			istr_fonts_table[j].i_count ++
		end if
	next // перебор шрифтов для поиска есть ли уже такой
	if f then  // если нету , то добавляем
		li_count_fonts ++
		istr_fonts_table[li_count_fonts] = lstr_font
	end if
		// номер шрифта в таблице шрифтов
	istr_dw_cell[i].i_font_nom = li_count_fonts
next

// выбор шрифта по умолчанию 
li_count_obj = UpperBound(istr_dw_cell[])
li_count_fonts = 0
for i =1 to li_count_obj // перебор всех обьектов 
	if istr_dw_cell[i].s_band_name = 'detail' then // только по полосе с данными
		lstr_font.s_name = istr_dw_cell[i].s_font_name
		lstr_font.s_size = istr_dw_cell[i].s_font_size
		f = true
		for j =1 to li_count_fonts // перебор шрифтов для поиска есть ли уже такой
			if (lstr_font.s_name = lstr_font_tmp[j].s_name) and (lstr_font.s_size = lstr_font_tmp[j].s_size) then
				f = false
				lstr_font_tmp[j].i_count ++
			end if
		next // перебор шрифтов для поиска есть ли уже такой
		if f then  // если нету , то добавляем
			li_count_fonts ++
			lstr_font_tmp[li_count_fonts] = lstr_font
			lstr_font_tmp[li_count_fonts].i_count = 1 
		end if
	end if
next

// поиск максимально встречающегося 
for i =1 to li_count_fonts
	if li_max < lstr_font_tmp[i].i_count then
		li_max = lstr_font_tmp[i].i_count 
		li_nom = i
	end if
next

istr_default_font = lstr_font_tmp[li_nom]


//-------------------------------------------------------------------------------------
return true
//-------------------------------------------------------------------------------------
end function

public function string of_create_corect_file_name (string as_val);
//-------------------------------------------------------------------------
// убирает из названия файла лишние символы
//-------------------------------------------------------------------------
string ls_return

//-------------------------------------------------------------------------
ls_return = of_str_replace(as_val,'~r',' ')
ls_return = of_str_replace(ls_return,'~t',' ')
ls_return = of_str_replace(ls_return,'~n',' ')
ls_return = of_str_replace(ls_return,'"',' ')

//-------------------------------------------------------------------------
return ls_return
//-------------------------------------------------------------------------

end function

private function boolean of_get_dw_bold (datawindow adw_unload, long al_nom_in_cells, long al_row_dw);	
//-----------------------------------------------------------------------------------
// 
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------

string ls_bold	
string ls_return_val
integer li_pos
string ls_name
//-----------------------------------------------------------------------------------
ls_bold = of_dw_describe_(istr_band_cells[al_nom_in_cells].s_obj_name + '.Font.Weight')
//li_pos = pos(ls_bold,'~t')
//ls_name = istr_band_cells[al_nom_in_cells].s_obj_name
//if li_pos > 0 then
//	ls_bold = mid(ls_bold, li_pos + 1)
//	ls_bold = left(ls_bold, len(ls_bold) - 1)
//	ls_bold = this.of_str_replace ( ls_bold, "'", '"' )
//	ls_return_val = string(adw_unload.Describe("Evaluate('"+ ls_bold +"'," + string(al_row_dw) + ") "))
//else
//	ls_return_val = ls_bold
//end if
ls_return_val = of_dw_evaluate_(ls_bold, al_row_dw)
//-----------------------------------------------------------------------------------

if ls_return_val = '400' then
		return false
	else
		return true
end if
//-----------------------------------------------------------------------------------

	

end function

on n_cst_dw_unload.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_unload.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;of_init()
end event

