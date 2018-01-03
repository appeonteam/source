$PBExportHeader$n_dwr_string.sru
forward
global type n_dwr_string from nonvisualobject
end type
end forward

global type n_dwr_string from nonvisualobject autoinstantiate
end type

type variables
end variables

forward prototypes
public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function string of_gettoken (ref string as_source, string as_separator)
public function string of_padleft (string as_source, long al_length)
public function string of_padright (string as_source, long al_length)
public function boolean of_islower (string as_source)
public function boolean of_isupper (string as_source)
public function boolean of_iswhitespace (string as_source)
public function boolean of_isalpha (string as_source)
public function boolean of_isalphanum (string as_source)
public function string of_quote (string as_source)
public function boolean of_isspace (string as_source)
public function boolean of_ispunctuation (string as_source)
public function long of_lastpos (string as_source, string as_target, long al_start)
public function long of_lastpos (string as_source, string as_target)
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string of_globalreplace (string as_source, string as_old, string as_new)
public function long of_countoccurrences (string as_source, string as_target)
public function long of_countoccurrences (string as_source, string as_target, boolean ab_ignorecase)
public function string of_righttrim (string as_source)
public function string of_lefttrim (string as_source)
public function string of_lefttrim (string as_source, boolean ab_remove_spaces)
public function string of_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_righttrim (string as_source, boolean ab_remove_spaces)
public function string of_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string of_trim (string as_source, boolean ab_remove_spaces)
public function string of_trim (string as_source)
public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator)
public function integer of_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator)
public function string of_wordcap (string as_source)
public function string of_removenonprint (string as_source)
public function boolean of_isempty (string as_source)
public function boolean of_isprintable (string as_source)
public function boolean of_isformat (string as_source)
public function string of_removewhitespace (string as_source)
public function boolean of_iscomparisonoperator (string as_source)
public function boolean of_isarithmeticoperator (string as_source)
public function long of_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string)
public function integer of_stringtoarray (string as_source, string as_separator, ref string as_result[])
public function boolean of_isnum (string as_source)
public function string of_remove_last_spaces_and_empty_rows (string as_source)
public function string of_remove_last_spaces_empty_rows (string as_source)
public function string of_text_for_expression (string a_str)
public function string of_text_for_text (string a_str)
public function string of_win2dos (string str)
public function string of_dos2win (string str)
end prototypes

public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);LONG ll_dellen
LONG ll_pos
LONG ll_count
LONG ll_start
LONG ll_length
STRING ls_holder
LONG ll_null
IF ISNULL(as_source) OR ISNULL(as_delimiter) THEN
	SETNULL(ll_null)
	RETURN ll_null
END IF
IF TRIM(as_source) = "" THEN
	RETURN 0
END IF
ll_dellen = LEN(as_delimiter)
ll_pos = POS(UPPER(as_source), UPPER(as_delimiter))
IF ll_pos = 0 THEN
	as_array[1] = as_source
	RETURN 1
END IF
ll_count = 0
ll_start = 1
DO WHILE ll_pos > 0
	ll_length = ll_pos - ll_start
	ls_holder = MID(as_source, ll_start, ll_length)
	ll_count ++
	as_array[ll_count] = ls_holder
	ll_start = ll_pos + ll_dellen
	ll_pos = POS(UPPER(as_source), UPPER(as_delimiter), ll_start)
LOOP
ls_holder = MID(as_source, ll_start, LEN(as_source))
IF LEN(ls_holder) > 0 THEN
	ll_count ++
	as_array[ll_count] = ls_holder
END IF
RETURN ll_count
end function

public function string of_gettoken (ref string as_source, string as_separator);integer li_pos
string ls_ret
string ls_null
if isnull(as_source) or isnull(as_separator) then
    setnull(ls_null)
    return ls_null
end if
li_pos = pos(as_source, as_separator)
if li_pos = 0 then
    ls_ret = as_source
    as_source = ""
else
    ls_ret = mid(as_source, 1, li_pos - 1)
    as_source = right(as_source, len(as_source) - li_pos + len(as_separator) - 1)
end if
return ls_ret
end function

public function string of_padleft (string as_source, long al_length);long ll_cnt
string ls_return
string ls_null
if isnull(as_source) or isnull(al_length) then
    setnull(ls_null)
    return ls_null
end if
if al_length <= len(as_source) then
    return as_source
end if
ls_return = space(al_length - len(as_source)) + as_source
return ls_return
end function

public function string of_padright (string as_source, long al_length);long ll_cnt
string ls_return
string ls_null
if isnull(as_source) or isnull(al_length) then
    setnull(ls_null)
    return ls_null
end if
if al_length <= len(as_source) then
    return as_source
end if
ls_return = as_source + space(al_length - len(as_source))
return ls_return
end function

public function boolean of_islower (string as_source);boolean lb_null
if isnull(as_source) then
    setnull(lb_null)
    return lb_null
end if
if as_source = lower(as_source) then
    return true
else
    return false
end if
end function

public function boolean of_isupper (string as_source);boolean lb_null
if isnull(as_source) then
    setnull(lb_null)
    return lb_null
end if
if as_source = upper(as_source) then
    return true
else
    return false
end if
end function

public function boolean of_iswhitespace (string as_source);LONG ll_count
LONG ll_length
CHAR lc_char[]
INTEGER li_ascii
BOOLEAN lb_null
IF ISNULL(as_source) THEN
	SETNULL(lb_null)
	RETURN lb_null
END IF
ll_length = LEN(as_source)
IF ll_length = 0 THEN
	RETURN FALSE
END IF
lc_char = as_source
DO WHILE ll_count < ll_length 
	ll_count ++
	li_ascii = ASC(lc_char[ll_count])
	IF li_ascii = 8 OR li_ascii = 9 OR li_ascii = 10 OR li_ascii = 11 OR li_ascii = 12 OR li_ascii = 13 OR li_ascii = 32 THEN
	ELSE
		RETURN FALSE
	END IF
LOOP
RETURN TRUE

end function

public function boolean of_isalpha (string as_source);LONG ll_count
LONG ll_length
CHAR lc_char[]
INTEGER li_ascii
BOOLEAN lb_null
IF ISNULL(as_source) THEN
	SETNULL(lb_null)
	RETURN lb_null
END IF
ll_length = LEN(as_source)
IF ll_length = 0 THEN
	RETURN FALSE
END IF
lc_char = as_source
DO WHILE ll_count < ll_length 
	ll_count ++
	li_ascii = ASC(lc_char[ll_count])
	IF li_ascii < 65 OR li_ascii > 90 AND li_ascii < 97 OR li_ascii > 122 THEN
		RETURN FALSE
	END IF
LOOP
RETURN TRUE

end function

public function boolean of_isalphanum (string as_source);LONG ll_count
LONG ll_length
CHAR lc_char[]
INTEGER li_ascii
BOOLEAN lb_null
IF ISNULL(as_source) THEN
	SETNULL(lb_null)
	RETURN lb_null
END IF
ll_length = LEN(as_source)
IF ll_length = 0 THEN
	RETURN FALSE
END IF
lc_char = as_source
DO WHILE ll_count < ll_length 
	ll_count ++
	li_ascii = ASC(lc_char[ll_count])
	IF li_ascii < 48 OR li_ascii > 57 AND li_ascii < 65 OR li_ascii > 90 AND li_ascii < 97 OR li_ascii > 122 THEN
		RETURN FALSE
	END IF
LOOP
RETURN TRUE

end function

public function string of_quote (string as_source);if isnull(as_source) then
    return as_source
end if
return "~"" + as_source + "~""
end function

public function boolean of_isspace (string as_source);boolean lb_null
if isnull(as_source) then
    setnull(lb_null)
    return lb_null
end if
if len(as_source) = 0 then
    return false
end if
if trim(as_source) = "" then
    return true
end if
return false
end function

public function boolean of_ispunctuation (string as_source);LONG ll_count
LONG ll_length
CHAR lc_char[]
INTEGER li_ascii
BOOLEAN lb_null
IF ISNULL(as_source) THEN
	SETNULL(lb_null)
	RETURN lb_null
END IF
ll_length = LEN(as_source)
IF ll_length = 0 THEN
	RETURN FALSE
END IF
lc_char = as_source
DO WHILE ll_count < ll_length 
	ll_count ++
	li_ascii = ASC(lc_char[ll_count])
	IF li_ascii = 33 OR li_ascii = 34 OR li_ascii = 39 OR li_ascii = 44 OR li_ascii = 46 OR li_ascii = 58 OR li_ascii = 59 OR li_ascii = 63 THEN
	ELSE
		RETURN FALSE
	END IF
LOOP
RETURN TRUE

end function

public function long of_lastpos (string as_source, string as_target, long al_start);long ll_cnt
long ll_pos
if isnull(as_source) or isnull(as_target) or isnull(al_start) then
    setnull(ll_cnt)
    return ll_cnt
end if
if len(as_source) = 0 then
    return 0
end if
if al_start = 0 then
    al_start = len(as_source)
end if
for ll_cnt = al_start to 1 step -1
    ll_pos = pos(as_source, as_target, ll_cnt)
    if ll_pos = ll_cnt then
        return ll_cnt
    end if
next
return 0
end function

public function long of_lastpos (string as_source, string as_target);long ll_null
if isnull(as_source) or isnull(as_target) then
    setnull(ll_null)
    return ll_null
end if
return of_lastpos(as_source, as_target, len(as_source))
end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);LONG ll_start
LONG ll_oldlen
LONG ll_newlen
STRING ls_source
STRING ls_null
IF ISNULL(as_source) OR ISNULL(as_old) OR ISNULL(as_new) OR ISNULL(ab_ignorecase) THEN
	SETNULL(ls_null)
	RETURN ls_null
END IF
ll_oldlen = LEN(as_old)
ll_newlen = LEN(as_new)
IF ab_ignorecase THEN
	as_old = LOWER(as_old)
	ls_source = LOWER(as_source)
ELSE
	ls_source = as_source
END IF
ll_start = POS(ls_source, as_old)
DO WHILE ll_start > 0 
	as_source = REPLACE(as_source, ll_start, ll_oldlen, as_new)
	IF ab_ignorecase THEN
		ls_source = LOWER(as_source)
	ELSE
		ls_source = as_source
	END IF
	ll_start = POS(ls_source, as_old, ll_start + ll_newlen)
LOOP
RETURN as_source

end function

public function string of_globalreplace (string as_source, string as_old, string as_new);integer li_start
integer li_oldlen
integer li_newlen
string ls_null
if isnull(as_source) or isnull(as_old) or isnull(as_new) then
    setnull(ls_null)
    return ls_null
end if
as_source = of_globalreplace(as_source, as_old, as_new, true)
return as_source
end function

public function long of_countoccurrences (string as_source, string as_target);long ll_count
long ll_null
if isnull(as_source) or isnull(as_target) then
    setnull(ll_null)
    return ll_null
end if
ll_count = of_countoccurrences(as_source, as_target, true)
return ll_count
end function

public function long of_countoccurrences (string as_source, string as_target, boolean ab_ignorecase);LONG ll_count
LONG ll_pos
LONG ll_len
LONG ll_null
IF ISNULL(as_source) OR ISNULL(as_target) OR ISNULL(ab_ignorecase) THEN
	SETNULL(ll_null)
	RETURN ll_null
END IF
IF ab_ignorecase THEN
	as_source = LOWER(as_source)
	as_target = LOWER(as_target)
END IF
ll_len = LEN(as_target)
ll_count = 0
ll_pos = POS(as_source, as_target)
DO WHILE ll_pos > 0 
	ll_count ++
	ll_pos = POS(as_source, as_target, ll_pos + ll_len)
LOOP
RETURN ll_count

end function

public function string of_righttrim (string as_source);string ls_null
if isnull(as_source) then
    setnull(ls_null)
    return ls_null
end if
return of_righttrim(as_source, true, false)
end function

public function string of_lefttrim (string as_source);string ls_null
if isnull(as_source) then
    setnull(ls_null)
    return ls_null
end if
return of_lefttrim(as_source, true, false)
end function

public function string of_lefttrim (string as_source, boolean ab_remove_spaces);string ls_null
if isnull(as_source) or isnull(ab_remove_spaces) then
    setnull(ls_null)
    return ls_null
end if
return of_lefttrim(as_source, ab_remove_spaces, false)
return ''
end function

public function string of_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);CHAR lc_char
BOOLEAN lb_char
BOOLEAN lb_printable_char
STRING ls_null
IF ISNULL(as_source) OR ISNULL(ab_remove_spaces) OR ISNULL(ab_remove_nonprint) THEN
	SETNULL(ls_null)
	RETURN ls_null
END IF
IF ab_remove_spaces AND ab_remove_nonprint THEN
	DO WHILE LEN(as_source) > 0 AND NOT lb_char
		lc_char = as_source
		IF of_isprintable(lc_char) AND NOT of_isspace(lc_char) THEN
			lb_char = TRUE
		ELSE
			as_source = MID(as_source, 2)
		END IF
	LOOP
	RETURN as_source
ELSEIF ab_remove_nonprint THEN
	DO WHILE LEN(as_source) > 0 AND NOT lb_printable_char 
		lc_char = as_source
		IF of_isprintable(lc_char) THEN
			lb_printable_char = TRUE
		ELSE
			as_source = MID(as_source, 2)
		END IF
	LOOP
	RETURN as_source
ELSEIF ab_remove_spaces THEN
	RETURN LEFTTRIM(as_source)
END IF
RETURN as_source

end function

public function string of_righttrim (string as_source, boolean ab_remove_spaces);string ls_null
if isnull(as_source) or isnull(ab_remove_spaces) then
    setnull(ls_null)
    return ls_null
end if
return of_righttrim(as_source, ab_remove_spaces, false)
end function

public function string of_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);BOOLEAN lb_char
CHAR lc_char
BOOLEAN lb_printable_char
STRING ls_null
IF ISNULL(as_source) OR ISNULL(ab_remove_spaces) OR ISNULL(ab_remove_nonprint) THEN
	SETNULL(ls_null)
	RETURN ls_null
END IF
IF ab_remove_spaces AND ab_remove_nonprint THEN
	DO WHILE LEN(as_source) > 0 AND NOT lb_char 
		lc_char = RIGHT(as_source, 1)
		IF of_isprintable(lc_char) AND NOT of_isspace(lc_char) THEN
			lb_char = TRUE
		ELSE
			as_source = LEFT(as_source, LEN(as_source) - 1)
		END IF
	LOOP
	RETURN as_source
ELSEIF ab_remove_nonprint THEN
	DO WHILE LEN(as_source) > 0 AND NOT lb_printable_char 
		lc_char = RIGHT(as_source, 1)
		IF of_isprintable(lc_char) THEN
			lb_printable_char = TRUE
		ELSE
			as_source = LEFT(as_source, LEN(as_source) - 1)
		END IF
	LOOP
	RETURN as_source
ELSEIF ab_remove_spaces THEN
	RETURN RIGHTTRIM(as_source)
END IF
RETURN as_source

end function

public function string of_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If
If ab_remove_spaces and ab_remove_nonprint Then
	as_source = of_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = of_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)
ElseIf ab_remove_nonprint Then
	as_source = of_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = of_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)
ElseIf ab_remove_spaces Then
	as_source = Trim(as_source)
End If
return as_source
end function

public function string of_trim (string as_source, boolean ab_remove_spaces);
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If
return of_Trim (as_source, ab_remove_spaces, False)
end function

public function string of_trim (string as_source);
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If
return of_Trim (as_source, True, False)
end function

public function string of_getkeyvalue (string as_source, string as_keyword, string as_separator);boolean	lb_done=false
integer	li_keyword, li_separator, li_equal
string	ls_keyvalue, ls_source, ls_exact
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_separator) Then
	string ls_null
	SetNull (ls_null)
	Return ls_null
End If
ls_keyvalue = ''
do while not lb_done 
	li_keyword = Pos (Lower(as_source), Lower(as_keyword))
	if li_keyword > 0 then
		ls_source = as_source
		as_source = LeftTrim(Right(as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		li_equal = li_keyword - len(as_separator)
		If li_equal > 0 Then
			ls_exact = mid(ls_source, li_equal, len(as_separator))  
			If ls_exact <> as_separator Then
				Continue
			End IF
		End If
		if Left(as_source, 1) = "=" then
			li_separator = Pos (as_source, as_separator, 2)
			if li_separator > 0 then
				ls_keyvalue = Mid(as_source, 2, li_separator - 2)
			else
				ls_keyvalue = Mid(as_source, 2)
			end if
			ls_keyvalue = Trim(ls_keyvalue)
			lb_done = true
		end if
	else
		lb_done = true
	end if
loop
return ls_keyvalue
end function

public function integer of_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator);
integer	li_found=-1
integer	li_keyword, &
			li_separator, &
			li_equal
string	ls_temp
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_keyvalue) or IsNull(as_separator) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If
do 
	li_keyword = Pos (Lower(as_source), Lower(as_keyword), li_keyword + 1)
	if li_keyword > 0 then
		ls_temp = LeftTrim (Right (as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		if Left (ls_temp, 1) = "=" then
			li_equal = Pos (as_source, "=", li_keyword + 1)
			li_separator = Pos (as_source, as_separator, li_equal + 1)
			if li_separator > 0 then
				as_source = Left(as_source, li_equal) + as_keyvalue + as_separator + Right(as_source, Len(as_source) - li_separator)
			else
				as_source = Left(as_source, li_equal) + as_keyvalue
			end if
			li_found = 1
		end if
	end if
loop while li_keyword > 0 
return li_found
end function

public function string of_wordcap (string as_source);integer	li_pos
boolean	lb_capnext
string 	ls_ret
long		ll_stringlength
char		lc_char, lc_string[]
If IsNull(as_source) Then Return as_source
ll_stringlength = Len(as_source)
If ll_stringlength = 0 Then Return as_source
lc_string = Lower(as_source)
lb_capnext = TRUE
For li_pos = 1 to ll_stringlength
	lc_char = lc_string[li_pos]
	
	If lc_char = "'" Then
		lb_capnext = False
	ElseIf Not of_IsAlpha(lc_char) Then
		lb_capnext = True
	ElseIf lb_capnext Then
		lc_string[li_pos] = Upper(lc_char)
		lb_capnext = False
	End If
Next
ls_ret = lc_string
return ls_ret
end function

public function string of_removenonprint (string as_source);char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If
ls_source = as_source
ll_source_len = Len(ls_source)
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if of_IsPrintable(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT
Return ls_source
end function

public function boolean of_isempty (string as_source);
if IsNull(as_source) or Len(as_source)=0 then
	Return True
end if
	
return False
end function

public function boolean of_isprintable (string as_source);long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If
ll_length = Len (as_source)
If ll_length=0 Then
	Return False
End If
lc_char = as_source
do while ll_count<ll_length 
	ll_count ++
	
	li_ascii = Asc (lc_char[ll_count])
	
	if li_ascii<32 or li_ascii>126 then
		Return False
	end if
loop
	

return True
end function

public function boolean of_isformat (string as_source);
long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If
ll_length = Len (as_source)
If ll_length=0 Then
	Return False
End If
lc_char = as_source
do while ll_count<ll_length 
	ll_count ++
	
	li_ascii = Asc (lc_char[ll_count])
	
	If (li_ascii>=33 and li_ascii<=47) or &
		(li_ascii>=58 and li_ascii<=64) or &
		(li_ascii>=91 and li_ascii<=96) or &
		(li_ascii>=123 and li_ascii<=126) Then
	Else
		Return False
	End If
loop
	
return True
end function

public function string of_removewhitespace (string as_source);
char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If
ls_source = as_source
ll_source_len = Len(ls_source)
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not of_IsWhiteSpace(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT
Return ls_source
end function

public function boolean of_iscomparisonoperator (string as_source);
long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If
ll_length = Len (as_source)
If ll_length=0 Then
	Return False
End If
lc_char = as_source
do while ll_count<ll_length 
	ll_count ++
	
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=60 or				 & 
		li_ascii=61 or					 & 
		li_ascii=62 Then		
	Else
		Return False
	End If
loop
return True
end function

public function boolean of_isarithmeticoperator (string as_source);long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If
ll_length = Len (as_source)
If ll_length=0 Then
	Return False
End If
lc_char = as_source
do while ll_count<ll_length 
	ll_count ++
	
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=40 or				 & 
		li_ascii=41 or				 & 
		li_ascii=43 or					 & 
		li_ascii=45 or					 & 
		li_ascii=42 or					 & 
		li_ascii=47 or						 & 
		li_ascii=94 Then			
	Else
		Return False
	End If
loop
return True
end function

public function long of_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string);long ll_dellen
long ll_pos
long ll_count
long ll_arrayupbound
string ls_holder
boolean lb_entryfound
ll_arrayupbound = upperbound(as_source)
if isnull(as_delimiter) or not ll_arrayupbound > 0 then
    return -1
end if
as_ref_string = ""
for ll_count = 1 to ll_arrayupbound
    if as_source[ll_count] <> "" then
        if len(as_ref_string) = 0 then
            as_ref_string = as_source[ll_count]
        else
            as_ref_string = as_ref_string + as_delimiter + as_source[ll_count]
        end if
    end if
next
return 1
end function

public function integer of_stringtoarray (string as_source, string as_separator, ref string as_result[]);string ret[]
integer num
as_result = ret
do while len(as_source) > 0
    as_result[num + 1] = of_gettoken(as_source, as_separator)
    num = num + 1
loop
return num
end function

public function boolean of_isnum (string as_source);long ll_count
long ll_length
char lc_char[]
integer li_ascii
boolean lb_null
if isnull(as_source) then
    setnull(lb_null)
    return lb_null
end if
ll_length = len(as_source)
if ll_length = 0 then
    return false
end if
lc_char = as_source
do while ll_count < ll_length 
    ll_count ++

    li_ascii = asc(lc_char[ll_count])
    if li_ascii < 48 or li_ascii > 57 then
        return false
    end if
loop
return true
end function

public function string of_remove_last_spaces_and_empty_rows (string as_source);string str = ""
string s[]
long cnt
long i
boolean flag = true
cnt = of_parsetoarray(as_source, "~r~n", s)
for i = cnt to 1 step -1
    s[i] = of_righttrim(s[i])
    if flag and s[i] = "" then
        cnt --
    else
        flag = false
    end if
next
if cnt > 0 then
    str = s[1]
end if
for i = 2 to cnt
    str = str + "~r~n" + s[i]
next
return str
end function

public function string of_remove_last_spaces_empty_rows (string as_source);string str = ""
string s[]
long cnt
long i
boolean flag = true
cnt = of_parsetoarray(as_source, "~r~n", s)
for i = cnt to 1 step -1
    s[i] = of_righttrim(s[i])
    if flag and s[i] = "" then
        cnt --
    else
        flag = false
    end if
next
if cnt > 0 then
    str = s[1]
end if
for i = 2 to cnt
    str = str + "~r~n" + s[i]
next
return str
end function

public function string of_text_for_expression (string a_str);string ret
ret = of_globalreplace(a_str, "~~", "~~~~")
ret = of_globalreplace(ret, "~"", '~~"')
ret = of_globalreplace(ret, "'", "~~'")
if isnull(ret) then
    ret = ""
end if
return ret
end function

public function string of_text_for_text (string a_str);string ret
ret = of_globalreplace(a_str, "&", "&&")
ret = of_globalreplace(ret, "~~", "~~~~")
ret = of_globalreplace(ret, "'", "~'")
ret = of_globalreplace(ret, "~"", '~~"')
return ret
end function

public function string of_win2dos (string str);char ch[]
long num
long i
integer code
string ret
ch = str
num = len(str)
for i = 1 to num
    code = asc(ch[i])
    choose case code
        case 192 to 239
            code = code - 64
            ch[i] = char(code)
        case 220 to 256
            code = code - 16
            ch[i] = char(code)
    end choose
next
ret = ch
return ret
end function

public function string of_dos2win (string str);char ch[]
long num
long i
integer code
string ret
ch = str
num = len(str)
for i = 1 to num
    code = asc(ch[i])
    choose case code
        case 128 to 175
            code = code + 64
            ch[i] = char(code)
        case 204 to 240
            code = code + 16
            ch[i] = char(code)
    end choose
next
ret = ch
return ret
end function

on n_dwr_string.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwr_string.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

