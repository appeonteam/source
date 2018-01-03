$PBExportHeader$n_cst_dw_unload_in_html_app.sru
$PBExportComments$обьект выгрузки в html для использования в приложениии
forward
global type n_cst_dw_unload_in_html_app from n_cst_dw_unload_in_html
end type
end forward

global type n_cst_dw_unload_in_html_app from n_cst_dw_unload_in_html
end type
global n_cst_dw_unload_in_html_app n_cst_dw_unload_in_html_app

type variables

end variables

on n_cst_dw_unload_in_html_app.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dw_unload_in_html_app.destroy
TriggerEvent( this, "destructor" )
end on

event ue_unload_end;call super::ue_unload_end;// разкоментировать нужный вариант

// 1. Прогрес бар 
//close(w_progres_bar)

// 2. Рассчет времени 
close(w_calc_time)

end event

event ue_unload_row;call super::ue_unload_row;// разкоментировать нужный вариант

// 1. Прогрес бар 
//w_progres_bar.set_position(Row)

// 2. Рассчет времени 
w_calc_time.set_position(Row)
end event

event ue_unload_start;call super::ue_unload_start;//------------------------------------------------------------------------------------
// разкоментировать нужный вариант

// 1. Прогрес бар 
//open(w_progres_bar)
//w_progres_bar.set_etap('Процес вивантаження ...')
//w_progres_bar.set_count(CountRow)

// 2. Рассчет времени  
open(w_calc_time)
w_calc_time.set_count(CountRow)
end event

