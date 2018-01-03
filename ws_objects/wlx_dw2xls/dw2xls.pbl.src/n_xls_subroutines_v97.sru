$PBExportHeader$n_xls_subroutines_v97.sru
forward
global type n_xls_subroutines_v97 from n_xls_subroutines_v5
end type
end forward

global type n_xls_subroutines_v97 from n_xls_subroutines_v5
end type
global n_xls_subroutines_v97 n_xls_subroutines_v97

type variables
public n_cst_unicode invo_uc
end variables

forward prototypes
public function blob to_unicode (string as_value)
public function blob to_unicode (string as_value, unsignedinteger ai_codepage)
public function string to_ansi (blob ab_value, unsignedinteger ai_codepage)
public function string to_ansi (blob ab_value)
public function string to_ansi (blob ab_value, unsignedinteger ai_codepage, character ac_defaultchar)
end prototypes

public function blob to_unicode (string as_value);RETURN invo_uc.of_ansi2unicode(as_value)
end function

public function blob to_unicode (string as_value, unsignedinteger ai_codepage);return invo_uc.of_ansi2unicode(as_value,ai_codepage)
end function

public function string to_ansi (blob ab_value, unsignedinteger ai_codepage);return invo_uc.of_unicode2ansi(ab_value,ai_codepage)
end function

public function string to_ansi (blob ab_value);return invo_uc.of_unicode2ansi(ab_value)
end function

public function string to_ansi (blob ab_value, unsignedinteger ai_codepage, character ac_defaultchar);return invo_uc.of_unicode2ansi(ab_value,ai_codepage,ac_defaultchar)
end function

on n_xls_subroutines_v97.create
call super::create
end on

on n_xls_subroutines_v97.destroy
call super::destroy
end on

