$PBExportHeader$n_cst_dw_unload_in_xls_ole.sru
$PBExportComments$выгрузка в xls через ole
forward
global type n_cst_dw_unload_in_xls_ole from n_cst_dw_unload
end type
end forward

global type n_cst_dw_unload_in_xls_ole from n_cst_dw_unload
end type
global n_cst_dw_unload_in_xls_ole n_cst_dw_unload_in_xls_ole

type variables
OLEObject oleobj_xls_app // обьект подключения к серверу Excel
string is_path
uLong iul_xls_real_row = 0 
constant real  ir_koof_corect_heigth = 0.8
constant real  ir_koof_corect_width =   0.14007731 //0.132720952 //
	
	// настройки полей страницы по умолчанию 0.5 sm
public double id_page_setup_top_margin = 14.17322834645666
public double id_page_setup_bootom_margin = 14.17322834645666
public double id_page_setup_left_margin = 14.17322834645666
public double id_page_setup_right_margin = 14.17322834645666
	// ориентация листа по умолчанию альбомная
public int ii_page_setup_orientation = 2
	// масштаб по умолчанию 100 %
public int ii_page_setup_zoom = 100
	// размер листа по умолчанию А4
public int ii_page_setup_paper_size = 9

boolean ib_border = false







end variables

forward prototypes
public function boolean of_exec (datawindow adw, string ais_path)
end prototypes

public function boolean of_exec (datawindow adw, string ais_path);
//-------------------------------------------------------------------------------------
// старт выгрузки
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
ais_path = of_create_corect_file_name ( ais_path)

is_path = ais_path
//-------------------------------------------------------------------------------------
// выгрузка
this.of_unload(aDw,ais_path)

//-------------------------------------------------------------------------------------
return true

//-------------------------------------------------------------------------------------

end function

on n_cst_dw_unload_in_xls_ole.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_unload_in_xls_ole.destroy
TriggerEvent( this, "destructor" )
end on

event ue_create_header_document;call super::ue_create_header_document;
integer li_error, li_i

oleobj_xls_app = create OLEObject
li_error = oleobj_xls_app.ConnectToNewObject("Excel.Application")

if li_error<> 0 then
	MessageBox("Увага!",string (li_error) + "Не можливо виконати операцію(Connect To Excel.Application)",Question!, ok!)
end if

//oleobj_xls_app.Application.Visible = 1

oleobj_xls_app.Application.Workbooks.Add

oleobj_xls_app.Application.Cells.Select
oleobj_xls_app.Application.Cells.WrapText = True

// шрифт по умолчанию
//oleobj_xls_app.Application.StandardFont = istr_default_font.s_name
//oleobj_xls_app.Application.StandardFontSize = abs(integer(istr_default_font.s_size))
oleobj_xls_app.Application.Selection.Font.Name = istr_default_font.s_name
oleobj_xls_app.Application.Selection.Font.Size = abs(integer(istr_default_font.s_size))

//--------------------------------------------------------------------------------------
// установка ширины колонок
for li_i = 1 to ii_count_columns
	oleobj_xls_app.Application.ActiveSheet.Columns(li_i).ColumnWidth =  (istr_columns[li_i].ul_location_end - istr_columns[li_i].ul_location_start) * ir_koof_corect_width
next


end event

event ue_create_footer_document;call super::ue_create_footer_document;
integer li_i
double ld_a1
//--------------------------------------------------------------------------------------
//oleobj_xls_app.Application.Cells.Select
//oleobj_xls_app.Application.Cells.WrapText = True
//
//--------------------------------------------------------------------------------------
// установка ширины колонок
for li_i = 1 to ii_count_columns
	oleobj_xls_app.Application.ActiveSheet.Columns(li_i).ColumnWidth = (istr_columns[li_i].ul_location_end - istr_columns[li_i].ul_location_start) * ir_koof_corect_width
next

// настройка параметров страници для печати
	// поля 
oleobj_xls_app.ActiveSheet.PageSetup.LeftMargin = id_page_setup_left_margin
oleobj_xls_app.ActiveSheet.PageSetup.RightMargin = id_page_setup_right_margin
oleobj_xls_app.ActiveSheet.PageSetup.BottomMargin = id_page_setup_bootom_margin
oleobj_xls_app.ActiveSheet.PageSetup.TopMargin = id_page_setup_top_margin
	// колонтитулы
oleobj_xls_app.ActiveSheet.PageSetup.FooterMargin = 0
oleobj_xls_app.ActiveSheet.PageSetup.HeaderMargin = 0
	//ориентация листа
oleobj_xls_app.ActiveSheet.PageSetup.Orientation = ii_page_setup_orientation
	// размер бумаги
oleobj_xls_app.ActiveSheet.PageSetup.PaperSize = ii_page_setup_paper_size
	// масштаб
oleobj_xls_app.ActiveSheet.PageSetup.Zoom = ii_page_setup_zoom


//--------------------------------------------------------------------------------------
oleobj_xls_app.Application.Cells(1,1).Select
oleobj_xls_app.Application.ActiveWindow.DisplayGridlines = True
oleobj_xls_app.Application.ActiveWorkbook.SaveAs(is_path,-4143)

oleobj_xls_app.Application.Quit
destroy oleobj_xls_app

end event

event ue_unload_band;call super::ue_unload_band;
//-------------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------------
integer li_i, li_j
long ll_tmp_xls_real_row
long ll_curr_row, ll_curr_column
long ll_row_end, ll_column_end
integer li_xls_allign
long ll_arr_row_auto_fit[] //масив с номерами строчек для которых установить автоматически высоту
long ll_count_arr_row_auto_fit // количество елеметов в масиве
double ld_arr_row_height[] // масив со значениями высоты строк
integer li_count_arr_row_height // количество елементов в масиве со значениями высоты строк
boolean lb_border = false
//-------------------------------------------------------------------------------------------------
li_count_arr_row_height = UpperBound(ld_arr_row_height[])
for li_i = 1 to li_count_arr_row_height
	ld_arr_row_height[li_i] = 0
next
//li_count_arr_row_height = 0 
ll_tmp_xls_real_row = 0


for li_i = 1 to ii_count_band_cells
	
	ll_curr_row = iul_xls_real_row + istr_band_cells[li_i].ul_obj_locate_row
	ll_curr_column = istr_band_cells[li_i].ul_obj_locate_column
	ll_row_end = ll_curr_row + istr_band_cells[li_i].ul_obj_row_count - 1
	ll_column_end = ll_curr_column + istr_band_cells[li_i].ul_obj_column_count - 1
	
	if ll_tmp_xls_real_row < ll_row_end  then ll_tmp_xls_real_row = ll_row_end 

	oleobj_xls_app.Application.ActiveSheet.Range(oleobj_xls_app.Application.ActiveSheet.Cells(ll_curr_row, ll_curr_column), oleobj_xls_app.Application.ActiveSheet.Cells(ll_row_end, ll_column_end)).Select
		// обьединение ячеек
	if ((ll_curr_row <> ll_row_end) or (ll_curr_column <> ll_column_end)) then
		oleobj_xls_app.Application.Selection.Merge
	end if

//	oleobj_xls_app.Application.Selection.RowHeight = istr_band_cells[li_i].ul_obj_height
//	oleobj_xls_app.Application.Selection.ColumnWidth = istr_band_cells[li_i].ul_obj_width
//высота ячеек
	if istr_band_cells[li_i].b_auto_height then
		ll_count_arr_row_auto_fit ++
		ll_arr_row_auto_fit[ll_count_arr_row_auto_fit] = ll_curr_row
	else
		if istr_band_cells[li_i].ul_obj_row_count = 1 then
//			oleobj_xls_app.Application.Selection.RowHeight = istr_band_cells[li_i].ul_obj_height * ir_koof_corect_heigth
//			li_count_arr_row_height++
			ld_arr_row_height[ll_curr_row] = istr_band_cells[li_i].ul_obj_height * ir_koof_corect_heigth
			if li_count_arr_row_height < ll_curr_row then li_count_arr_row_height = ll_curr_row
		end if
	end if
		// устанока формата ячейки
	if istr_band_cells[li_i].s_xls_format <> 'General' then 
		oleobj_xls_app.Application.Selection.NumberFormat = istr_band_cells[li_i].s_xls_ole_format
	end if

//	if  IsNumber(istr_band_cells[li_i].s_real_value) then
//		istr_band_cells[li_i].s_real_value = of_str_replace(istr_band_cells[li_i].s_real_value,',',is_separator_decimal)
//	end if
	
		// вывод значения 
	if istr_band_cells[li_i].s_display_value = '-' then
		oleobj_xls_app.Application.Selection.value = '-'
	else
		istr_band_cells[li_i].s_real_value =of_str_replace ( istr_band_cells[li_i].s_real_value, '~r', '' )
		oleobj_xls_app.Application.Selection.value = istr_band_cells[li_i].s_real_value
	//	istr_band_cells[li_i].s_display_value =of_str_replace ( istr_band_cells[li_i].s_display_value, '~r', '' )
	//	oleobj_xls_app.Application.Selection.value = istr_band_cells[li_i].s_display_value
	end if
	
	choose case istr_band_cells[li_i].s_value_allign
		case 'left' // left
			li_xls_allign = -4131
		case 'center' // center
			li_xls_allign = -4108
		case 'right' // richt
			li_xls_allign = -4152
	end choose
			
	oleobj_xls_app.Application.Selection.HorizontalAlignment = li_xls_allign
	
	// до бордюров (шапки ) выравнивание по центру 
	if not ib_border then
		oleobj_xls_app.Application.Selection.VerticalAlignment =  -4108  //по центру //-4107 //по нижнему краю
	end if
	
		// бордюр ячейки
	if istr_band_cells[li_i].b_border then
		lb_border = true
		oleobj_xls_app.Application.Selection.VerticalAlignment =  -4108  //по центру //-4107 //по нижнему краю
		//XlsObj.Application.Selection.WrapText = True
//		for li_j=7 to 10 
//			oleobj_xls_app.Application.Selection.Borders(li_j).LineStyle =1 
//			oleobj_xls_app.Application.Selection.Borders(li_j).Weight=-4138
//			oleobj_xls_app.Application.Selection.Borders(li_j).ColorIndex=-4105
//		next
			oleobj_xls_app.Application.Selection.Borders.LineStyle =1 
			oleobj_xls_app.Application.Selection.Borders.Weight=-4138
//			oleobj_xls_app.Application.Selection.Borders.ColorIndex=-4105

	end if	// бордюр ячейки
		//характеристики шрифта
	if istr_band_cells[li_i].s_font_name <> istr_default_font.s_name then
		oleobj_xls_app.Application.Selection.Font.Name = istr_band_cells[li_i].s_font_name
	end if
	
	if abs(integer(istr_band_cells[li_i].s_font_size)) <> abs(integer(istr_default_font.s_size)) then
		oleobj_xls_app.Application.Selection.Font.Size = abs(integer(istr_band_cells[li_i].s_font_size))
	end if
	
	if istr_band_cells[li_i].b_font_bold then oleobj_xls_app.Application.Selection.Font.Bold = true
	
next

//----------------------------------------------------------------------------------------

// высота ячеек
//i_start_row = iul_xls_real_row 
for li_i= iul_xls_real_row  + 1 to li_count_arr_row_height
	if ld_arr_row_height[li_i]  > 0 then
		oleobj_xls_app.Application.Rows(li_i).RowHeight = ld_arr_row_height[li_i] 
	end if
next

// автоматический перенос
for li_i = 1  to ll_count_arr_row_auto_fit
	oleobj_xls_app.Application.Rows(ll_arr_row_auto_fit[li_i]).EntireRow.AutoFit
//	oleobj_xls_app.Application.Selection.WrapText = True
//	oleobj_xls_app.Application.Selection.EntireRow.AutoFit
next

ib_border = lb_border
iul_xls_real_row = ll_tmp_xls_real_row

end event

